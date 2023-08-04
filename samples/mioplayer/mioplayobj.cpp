
/*****************************************************************************
                       MIO ファイル再生オブジェクト
 *****************************************************************************/

#include "stdafx.h"
#include "mioplayobj.h"


//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
MIOPlayObject::MIOPlayObject( void )
{
	m_hWaveOut = NULL ;
	//
	m_hReleased = NULL ;
	m_dwPlayOffset = 0 ;
	m_pFirstOut = NULL ;
	m_dwOffsetSample = 0 ;
	//
	m_fPlaying = false ;
	m_fPaused = false ;
	//
	m_hwndNotifyDone = NULL ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
MIOPlayObject::~MIOPlayObject( void )
{
	Close( ) ;
}

//
// MIO ファイルを開く
//////////////////////////////////////////////////////////////////////////////
const char * MIOPlayObject::Open( const char * pszMioFile )
{
	Close( ) ;
	//
	// ファイルを開く
	if ( !m_file.Open( pszMioFile ) )
	{
		return	"ファイルを開けませんでした。" ;
	}
	//
	// MIO ファイルを開く
	if ( !MIODynamicPlayer::Open( &m_file ) )
	{
		return	"不正なMIOファイルです。" ;
	}
	//
	// スレッドを起動する
	m_hThread = ::CreateThread
		( NULL, 0, &MIOPlayObject::ThreadProc, this, 0, &m_idThread ) ;
	//
	// WAVE 出力デバイスを開く
	WAVEFORMATEX	wfx ;
	wfx.wFormatTag = WAVE_FORMAT_PCM ;
	wfx.nChannels = (WORD) GetChannelCount( ) ;
	wfx.nSamplesPerSec = GetFrequency( ) ;
	wfx.wBitsPerSample = (WORD) GetBitsPerSample( ) ;
	wfx.nBlockAlign = wfx.nChannels * wfx.wBitsPerSample / 8 ;
	wfx.nAvgBytesPerSec = wfx.nSamplesPerSec * wfx.nBlockAlign ;
	wfx.cbSize = 0 ;
	//
	MMRESULT	mmr = ::waveOutOpen
		( &m_hWaveOut, WAVE_MAPPER, &wfx,
			(DWORD) &MIOPlayObject::waveOutProc,
			(DWORD) this, CALLBACK_FUNCTION ) ;
	if ( mmr != MMSYSERR_NOERROR )
	{
		UINT	nDevCount = ::waveOutGetNumDevs( ) ;
		UINT	nDevID = 0 ;
		while ( nDevID < nDevCount )
		{
			mmr = ::waveOutOpen
				( &m_hWaveOut, nDevID ++, &wfx,
					(DWORD) &MIOPlayObject::waveOutProc,
					(DWORD) this, CALLBACK_FUNCTION ) ;
			if ( mmr == MMSYSERR_NOERROR )
				break ;
		}
	}
	//
	if ( mmr != MMSYSERR_NOERROR )
	{
		return	"音声出力デバイスを開けませんでした。" ;
	}
	//
	m_hReleased = ::CreateEvent( NULL, TRUE, FALSE, NULL ) ;

	return	NULL ;
}

//
// MIO ファイルを閉じる
//////////////////////////////////////////////////////////////////////////////
void MIOPlayObject::Close( void )
{
	if ( m_hWaveOut != NULL )
	{
		//
		// WAVE 出力デバイスを閉じる
		Stop( ) ;
		::waveOutClose( m_hWaveOut ) ;
		m_hWaveOut = NULL ;
	}
	//
	if ( m_hReleased != NULL )
	{
		::CloseHandle( m_hReleased ) ;
		m_hReleased = NULL ;
	}
	//
	// スレッド終了
	if ( m_hThread != NULL )
	{
		::PostThreadMessage( m_idThread, WM_QUIT, 0, 0 ) ;
		::WaitForSingleObject( m_hThread, INFINITE ) ;
		m_hThread = NULL ;
	}
	//
	// 終了操作
	MIODynamicPlayer::Close( ) ;
	//
	m_file.Close( ) ;
}

//
// 再生開始
//////////////////////////////////////////////////////////////////////////////
bool MIOPlayObject::PlayFrom( ULONG nSample )
{
	if ( m_hWaveOut == NULL )
	{
		return	false ;
	}
	Stop( ) ;
	//
	// 指定サンプルからのデータを取得する
	DWORD	dwBytes ;
	m_dwOffsetSample = nSample ;
	m_nOutBufCount = 0 ;
	m_pFirstOut = GetWaveBufferFrom( nSample, dwBytes, m_dwPlayOffset ) ;
	if ( m_pFirstOut == NULL )
	{
		return	false ;
	}
	//
	// 初めのデータを出力する
	WAVEHDR *	pwh = new WAVEHDR ;
	memset( pwh, 0, sizeof(WAVEHDR) ) ;
	pwh->lpData = (LPSTR)((BYTE*)m_pFirstOut) + m_dwPlayOffset ;
	pwh->dwBufferLength = dwBytes - m_dwPlayOffset ;
	::waveOutPrepareHeader( m_hWaveOut, pwh, sizeof(WAVEHDR) ) ;
	::waveOutPause( m_hWaveOut ) ;
	::waveOutWrite( m_hWaveOut, pwh, sizeof(WAVEHDR) ) ;
	::InterlockedIncrement( (LPLONG) &m_nOutBufCount ) ;
	//
	// 次のデータを取得して出力する
	if ( !IsNextDataRewound( ) )
	{
		void *	ptrWaveBuf = GetNextWaveBuffer( dwBytes ) ;
		if ( ptrWaveBuf != NULL )
		{
			pwh = new WAVEHDR ;
			memset( pwh, 0, sizeof(WAVEHDR) ) ;
			pwh->lpData = (LPSTR) ptrWaveBuf ;
			pwh->dwBufferLength = dwBytes ;
			::waveOutPrepareHeader( m_hWaveOut, pwh, sizeof(WAVEHDR) ) ;
			::waveOutWrite( m_hWaveOut, pwh, sizeof(WAVEHDR) ) ;
			::InterlockedIncrement( (LPLONG) &m_nOutBufCount ) ;
		}
	}
	//
	::waveOutRestart( m_hWaveOut ) ;
	//
	m_fPlaying = true ;
	m_fPaused = false ;

	return	true ;
}

//
// 再生停止
//////////////////////////////////////////////////////////////////////////////
bool MIOPlayObject::Stop( void )
{
	if ( m_fPlaying )
	{
		m_fPlaying = false ;
		::waveOutReset( m_hWaveOut ) ;
		//
		::WaitForSingleObject( m_hReleased, INFINITE ) ;
		::ResetEvent( m_hReleased ) ;
	}
	m_fPaused = false ;
	m_dwOffsetSample = 0 ;

	return	true ;
}

//
// 再生一時停止
//////////////////////////////////////////////////////////////////////////////
bool MIOPlayObject::Pause( void )
{
	if ( !m_fPlaying )
	{
		return	false ;
	}
	if ( !m_fPaused )
	{
		::waveOutPause( m_hWaveOut ) ;
		m_fPaused = true ;
	}

	return	true ;
}

//
// 再生再開
//////////////////////////////////////////////////////////////////////////////
bool MIOPlayObject::Restart( void )
{
	if ( !m_fPlaying )
	{
		return	false ;
	}
	if ( m_fPaused )
	{
		::waveOutRestart( m_hWaveOut ) ;
		m_fPaused = false ;
	}

	return	true ;
}

//
// 現在再生中か？
//////////////////////////////////////////////////////////////////////////////
bool MIOPlayObject::IsPlaying( void ) const
{
	return	m_fPlaying ;
}

//
// 一時停止中か？
//////////////////////////////////////////////////////////////////////////////
bool MIOPlayObject::IsPaused( void ) const
{
	return	m_fPaused ;
}

//
// 再生が終了した時、ポストするウィンドウメッセージを設定する
//////////////////////////////////////////////////////////////////////////////
void MIOPlayObject::SetWindowToNotifyDone
	( HWND hwndNotify, UINT uMsg, LPARAM lParam )
{
	m_hwndNotifyDone = hwndNotify ;
	m_msgNotifyDone = uMsg ;
	m_paramNotifyDone = lParam ;
}

//
// 再生が終了した
//////////////////////////////////////////////////////////////////////////////
void MIOPlayObject::OnEndPlaying( void )
{
	Stop( ) ;
	//
	if ( m_hwndNotifyDone != NULL )
	{
		::PostMessage( m_hwndNotifyDone,
			m_msgNotifyDone, (WPARAM) this, m_paramNotifyDone );
	}
}

//
// 現在の再生ポイント（サンプル数）
//////////////////////////////////////////////////////////////////////////////
DWORD MIOPlayObject::GetCurrentSample( void )
{
	if ( m_hWaveOut != NULL )
	{
		MMTIME	mmt ;
		mmt.wType = TIME_SAMPLES ;
		if ( ::waveOutGetPosition
				( m_hWaveOut, &mmt, sizeof(mmt) ) == MMSYSERR_NOERROR )
		{
			return	mmt.u.sample + m_dwOffsetSample ;
		}
	}
	return	0 ;
}

//
// サンプル数からミリ秒を取得
//////////////////////////////////////////////////////////////////////////////
DWORD MIOPlayObject::SampleToMilliSec( DWORD dwSample ) const
{
	DWORD	dwFrequency = GetFrequency( ) ;
	if ( dwFrequency == 0 )
	{
		return	0 ;
	}
	return	::MulDiv( dwSample, 1000, dwFrequency ) ;
}

//
// WAVE 出力デバイスコールバック関数
//////////////////////////////////////////////////////////////////////////////
void CALLBACK MIOPlayObject::waveOutProc
	( HWAVEOUT hwo, UINT uMsg,
		DWORD dwInstance, DWORD dwParam1, DWORD dwParam2 )
{
	((MIOPlayObject*) dwInstance)->
		WaveOutCallbackProc( hwo, uMsg, dwParam1, dwParam2 ) ;
}

void MIOPlayObject::WaveOutCallbackProc
	( HWAVEOUT hwo, UINT uMsg, DWORD dwParam1, DWORD dwParam2 )
{
	if ( uMsg == WOM_DONE )
	{
		WAVEHDR *	pwh = (WAVEHDR*) dwParam1 ;
		::PostThreadMessage
			( m_idThread, WOM_DONE, 0, (LPARAM) pwh ) ;
	}
}

//
// ストリーミング処理用スレッド
//////////////////////////////////////////////////////////////////////////////
DWORD WINAPI MIOPlayObject::ThreadProc( LPVOID parameter )
{
	return	((MIOPlayObject*)parameter)->StreamingThreadProc( ) ;
}

DWORD MIOPlayObject::StreamingThreadProc( void )
{
	MSG		msg ;
	while ( ::GetMessage( &msg, NULL, 0, 0 ) )
	{
		if ( msg.message == WM_QUIT )
		{
			break ;
		}
		else if ( msg.message == WOM_DONE )
		{
			//
			// 過去のデータを破棄する
			bool	fFirstBuf = false ;
			WAVEHDR *	pwh = (WAVEHDR*) msg.lParam ;
			::waveOutUnprepareHeader( m_hWaveOut, pwh, sizeof(WAVEHDR) ) ;
			if ( m_pFirstOut != NULL )
			{
				if ( (BYTE*) pwh->lpData ==
						((BYTE*)m_pFirstOut) + m_dwPlayOffset )
				{
					DeleteWaveBuffer( m_pFirstOut ) ;
					m_pFirstOut = NULL ;
					::SetEvent( m_hReleased ) ;
					fFirstBuf = true ;
					::InterlockedDecrement( (LPLONG) &m_nOutBufCount ) ;
				}
			}
			if ( !fFirstBuf )
			{
				DeleteWaveBuffer( (void*) pwh->lpData ) ;
				::InterlockedDecrement( (LPLONG) &m_nOutBufCount ) ;
			}
			delete	pwh ;
			//
			// 次のデータを取得する
			if ( m_fPlaying )
			{
				if ( !IsNextDataRewound( ) )
				{
					DWORD	dwBytes ;
					void *	ptrWaveBuf = GetNextWaveBuffer( dwBytes ) ;
					if ( ptrWaveBuf != NULL )
					{
						pwh = new WAVEHDR ;
						memset( pwh, 0, sizeof(WAVEHDR) ) ;
						pwh->lpData = (LPSTR) ptrWaveBuf ;
						pwh->dwBufferLength = dwBytes ;
						::waveOutPrepareHeader
							( m_hWaveOut, pwh, sizeof(WAVEHDR) ) ;
						::waveOutWrite
							( m_hWaveOut, pwh, sizeof(WAVEHDR) ) ;
						::InterlockedIncrement( (LPLONG) &m_nOutBufCount ) ;
					}
				}
			}
			//
			if ( m_nOutBufCount <= 0 )
			{
				OnEndPlaying( ) ;
			}
		}
	}

	return	0 ;
}

