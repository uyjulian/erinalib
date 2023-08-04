
/*****************************************************************************
                       MIO �t�@�C���Đ��I�u�W�F�N�g
 *****************************************************************************/

#include "stdafx.h"
#include "mioplayobj.h"


//
// �\�z�֐�
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
// ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
MIOPlayObject::~MIOPlayObject( void )
{
	Close( ) ;
}

//
// MIO �t�@�C�����J��
//////////////////////////////////////////////////////////////////////////////
const char * MIOPlayObject::Open( const char * pszMioFile )
{
	Close( ) ;
	//
	// �t�@�C�����J��
	if ( !m_file.Open( pszMioFile ) )
	{
		return	"�t�@�C�����J���܂���ł����B" ;
	}
	//
	// MIO �t�@�C�����J��
	if ( !MIODynamicPlayer::Open( &m_file ) )
	{
		return	"�s����MIO�t�@�C���ł��B" ;
	}
	//
	// �X���b�h���N������
	m_hThread = ::CreateThread
		( NULL, 0, &MIOPlayObject::ThreadProc, this, 0, &m_idThread ) ;
	//
	// WAVE �o�̓f�o�C�X���J��
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
		return	"�����o�̓f�o�C�X���J���܂���ł����B" ;
	}
	//
	m_hReleased = ::CreateEvent( NULL, TRUE, FALSE, NULL ) ;

	return	NULL ;
}

//
// MIO �t�@�C�������
//////////////////////////////////////////////////////////////////////////////
void MIOPlayObject::Close( void )
{
	if ( m_hWaveOut != NULL )
	{
		//
		// WAVE �o�̓f�o�C�X�����
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
	// �X���b�h�I��
	if ( m_hThread != NULL )
	{
		::PostThreadMessage( m_idThread, WM_QUIT, 0, 0 ) ;
		::WaitForSingleObject( m_hThread, INFINITE ) ;
		m_hThread = NULL ;
	}
	//
	// �I������
	MIODynamicPlayer::Close( ) ;
	//
	m_file.Close( ) ;
}

//
// �Đ��J�n
//////////////////////////////////////////////////////////////////////////////
bool MIOPlayObject::PlayFrom( ULONG nSample )
{
	if ( m_hWaveOut == NULL )
	{
		return	false ;
	}
	Stop( ) ;
	//
	// �w��T���v������̃f�[�^���擾����
	DWORD	dwBytes ;
	m_dwOffsetSample = nSample ;
	m_nOutBufCount = 0 ;
	m_pFirstOut = GetWaveBufferFrom( nSample, dwBytes, m_dwPlayOffset ) ;
	if ( m_pFirstOut == NULL )
	{
		return	false ;
	}
	//
	// ���߂̃f�[�^���o�͂���
	WAVEHDR *	pwh = new WAVEHDR ;
	memset( pwh, 0, sizeof(WAVEHDR) ) ;
	pwh->lpData = (LPSTR)((BYTE*)m_pFirstOut) + m_dwPlayOffset ;
	pwh->dwBufferLength = dwBytes - m_dwPlayOffset ;
	::waveOutPrepareHeader( m_hWaveOut, pwh, sizeof(WAVEHDR) ) ;
	::waveOutPause( m_hWaveOut ) ;
	::waveOutWrite( m_hWaveOut, pwh, sizeof(WAVEHDR) ) ;
	::InterlockedIncrement( (LPLONG) &m_nOutBufCount ) ;
	//
	// ���̃f�[�^���擾���ďo�͂���
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
// �Đ���~
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
// �Đ��ꎞ��~
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
// �Đ��ĊJ
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
// ���ݍĐ������H
//////////////////////////////////////////////////////////////////////////////
bool MIOPlayObject::IsPlaying( void ) const
{
	return	m_fPlaying ;
}

//
// �ꎞ��~�����H
//////////////////////////////////////////////////////////////////////////////
bool MIOPlayObject::IsPaused( void ) const
{
	return	m_fPaused ;
}

//
// �Đ����I���������A�|�X�g����E�B���h�E���b�Z�[�W��ݒ肷��
//////////////////////////////////////////////////////////////////////////////
void MIOPlayObject::SetWindowToNotifyDone
	( HWND hwndNotify, UINT uMsg, LPARAM lParam )
{
	m_hwndNotifyDone = hwndNotify ;
	m_msgNotifyDone = uMsg ;
	m_paramNotifyDone = lParam ;
}

//
// �Đ����I������
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
// ���݂̍Đ��|�C���g�i�T���v�����j
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
// �T���v��������~���b���擾
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
// WAVE �o�̓f�o�C�X�R�[���o�b�N�֐�
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
// �X�g���[�~���O�����p�X���b�h
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
			// �ߋ��̃f�[�^��j������
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
			// ���̃f�[�^���擾����
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

