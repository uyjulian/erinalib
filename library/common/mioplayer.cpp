
/*****************************************************************************
                         E R I N A - L i b r a r y
                                                      最終更新 2002/05/26
 ----------------------------------------------------------------------------
          Copyright (C) 2000-2002 Leshade Entis. All rights reserved.
 *****************************************************************************/


#define	STRICT	1
#include <windows.h>


//
// ERINA ライブラリ定義ファイル
//////////////////////////////////////////////////////////////////////////////

#include "eritypes.h"
#include "erinalib.h"


/*****************************************************************************
                    MIOファイルストリーム再生オブジェクト
 *****************************************************************************/

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
MIODynamicPlayer::EPreloadBuffer::EPreloadBuffer( DWORD dwLength )
	: EMemFile( NULL, dwLength )
{
	m_ptrBuffer = (BYTE*) ::eriAllocateMemory( dwLength ) ;
	m_ptrMemory = m_ptrBuffer ;
	m_nKeySample = 0 ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
MIODynamicPlayer::EPreloadBuffer::~EPreloadBuffer( void )
{
	::eriFreeMemory( m_ptrBuffer ) ;
}

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
MIODynamicPlayer::EPreloadQueue::EPreloadQueue( void )
{
	m_queue = NULL ;
	m_length = 0 ;
	m_limit = 0 ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
MIODynamicPlayer::EPreloadQueue::~EPreloadQueue( void )
{
	RemoveAll( ) ;
}

//
// 配列の最大の長さを設定
//////////////////////////////////////////////////////////////////////////////
void MIODynamicPlayer::EPreloadQueue::SetLimit( unsigned int nLimit )
{
	m_limit = nLimit ;
	m_queue = (EPreloadBuffer**)
		::eriAllocateMemory( nLimit * sizeof(EPreloadBuffer*) ) ;
}

//
// 配列を消去
//////////////////////////////////////////////////////////////////////////////
void MIODynamicPlayer::EPreloadQueue::RemoveAll( void )
{
	if ( m_queue != NULL )
	{
		for ( unsigned int i = 0; i < m_length; i ++ )
		{
			delete	m_queue[i] ;
		}
		::eriFreeMemory( m_queue ) ;
		m_queue = NULL ;
		m_length = 0 ;
		m_limit = 0 ;
	}
}

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
MIODynamicPlayer::EKeyPointList::EKeyPointList( void )
{
	m_list = NULL ;
	m_count = 0 ;
	m_limit = 0 ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
MIODynamicPlayer::EKeyPointList::~EKeyPointList( void )
{
	RemoveAll( ) ;
}

//
// 配列の最剤の長さを設定
//////////////////////////////////////////////////////////////////////////////
void MIODynamicPlayer::EKeyPointList::SetLimit( unsigned int nLimit )
{
	KEY_POINT *	pLastList = m_list ;
	//
	m_limit = nLimit ;
	m_list = (KEY_POINT*)
		::eriAllocateMemory( nLimit * sizeof(KEY_POINT) ) ;
	//
	for ( unsigned int i = 0; i < m_count; i ++ )
	{
		m_list[i] = pLastList[i] ;
	}
	//
	if ( pLastList != NULL )
	{
		::eriFreeMemory( pLastList ) ;
	}
}

//
// 配列を消去
//////////////////////////////////////////////////////////////////////////////
void MIODynamicPlayer::EKeyPointList::RemoveAll( void )
{
	if ( m_list != NULL )
	{
		::eriFreeMemory( m_list ) ;
		m_list = NULL ;
		m_count = 0 ;
		m_limit = 0 ;
	}
}

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
MIODynamicPlayer::MIODynamicPlayer( void )
{
	m_pmioc = NULL ;
	m_pmiod = NULL ;
	m_hThread = NULL ;
	m_hQueueFull = NULL ;
	m_hQueueNotEmpty = NULL ;
	m_hQueueSpace = NULL ;
	::InitializeCriticalSection( &m_cs ) ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
MIODynamicPlayer::~MIODynamicPlayer( void )
{
	Close( ) ;
	::DeleteCriticalSection( &m_cs ) ;
}

//
// MIO ファイルを開く
//////////////////////////////////////////////////////////////////////////////
bool MIODynamicPlayer::Open
	( EFileObject * pFile, unsigned int nPreloadSize )
{
	Close( ) ;
	//
	// ERIファイルを開く（ストリームレコードまで開く）
	//////////////////////////////////////////////////////////////////////////
	if ( !m_erif.Open( pFile, m_erif.otOpenStream ) )
	{
		return	false ;
	}
	//
	// 展開オブジェクトを初期化する
	//////////////////////////////////////////////////////////////////////////
	if ( !(m_erif.m_fdwReadMask & ERIFile::rmSoundInfo) )
	{
		return	false ;
	}
	m_pmiod = CreateMIODecoder( ) ;
	if ( m_pmiod->Initialize( m_erif.m_MIOInfHdr ) )
	{
		return	false ;
	}
	m_pmioc = new EFileDecodeContext( NULL, 0x10000 ) ;
	//
	// 先読みバッファ配列を確保
	//////////////////////////////////////////////////////////////////////////
	if ( nPreloadSize == 0 )
	{
		nPreloadSize = 8 ;
	}
	m_queueSound.SetLimit( nPreloadSize ) ;
	//
	// スレッドを生成
	//////////////////////////////////////////////////////////////////////////
	m_hQueueFull = ::CreateEvent( NULL, TRUE, FALSE, NULL ) ;
	m_hQueueNotEmpty = ::CreateEvent( NULL, TRUE, FALSE, NULL ) ;
	m_hQueueSpace = ::CreateEvent( NULL, TRUE, TRUE, NULL ) ;
	m_hThread = ::CreateThread
		( NULL, 0, &MIODynamicPlayer::ThreadProc, this, 0, &m_idThread ) ;
	if ( !(m_hQueueNotEmpty && m_hQueueSpace && m_hThread) )
	{
		return	false ;
	}
	HANDLE	hEventList[2] =
	{
		m_hQueueFull, m_hThread
	} ;
	DWORD	dwWaitResult =
		::WaitForMultipleObjects( 2, hEventList, FALSE, INFINITE ) ;
	if ( dwWaitResult != WAIT_OBJECT_0 )
	{
		return	false ;
	}

	return	true ;
}

//
// MIO ファイルを閉じる
//////////////////////////////////////////////////////////////////////////////
void MIODynamicPlayer::Close( void )
{
	//
	// スレッドを終了させる
	if ( m_hThread != NULL )
	{
		::PostThreadMessage( m_idThread, tmQuit, 0, 0 ) ;
		::WaitForSingleObject( m_hThread, INFINITE ) ;
		::CloseHandle( m_hThread ) ;
		m_hThread = NULL ;
	}
	//
	// 先読みキューをクリアする
	if ( m_hQueueFull != NULL )
	{
		::CloseHandle( m_hQueueFull ) ;
		m_hQueueFull = NULL ;
	}
	if ( m_hQueueNotEmpty != NULL )
	{
		::CloseHandle( m_hQueueNotEmpty ) ;
		m_hQueueNotEmpty = NULL ;
	}
	if ( m_hQueueSpace != NULL )
	{
		::CloseHandle( m_hQueueSpace ) ;
		m_hQueueSpace = NULL ;
	}
	m_queueSound.RemoveAll( ) ;
	//
	// キーポイント配列をクリアする
	m_listKeySample.RemoveAll( ) ;
	//
	// 展開オブジェクトを削除する
	if ( m_pmiod != NULL )
	{
		m_pmiod->Delete( ) ;
		delete	m_pmiod ;
		m_pmiod = NULL ;
	}
	if ( m_pmioc != NULL )
	{
		delete	m_pmioc ;
		m_pmioc = NULL ;
	}
	//
	// ファイルを閉じる
	m_erif.Close( ) ;
}

//
// 指定サンプルへ移動し、初めのブロックのデータを取得する
//////////////////////////////////////////////////////////////////////////////
void * MIODynamicPlayer::GetWaveBufferFrom
	( ULONG nSample, DWORD & dwBytes, DWORD & dwOffsetBytes )
{
	//
	// シークメッセージを送信し、シークが完了するまで待つ
	//////////////////////////////////////////////////////////////////////////
	if ( m_hThread == NULL )
	{
		return	NULL ;
	}
	HANDLE	hEventList[2] ;
	hEventList[0] = ::CreateEvent( NULL, TRUE, FALSE, NULL ) ;
	hEventList[1] = m_hThread ;
	::PostThreadMessage
		( m_idThread, tmSeekSound, (WPARAM) nSample, (LPARAM) hEventList[0] ) ;
	DWORD	dwWaitResult =
		::WaitForMultipleObjects( 2, hEventList, FALSE, INFINITE ) ;
	::CloseHandle( hEventList[0] ) ;
	if ( dwWaitResult != WAIT_OBJECT_0 )
	{
		return	NULL ;
	}
	//
	// 先頭のデータを取得して展開する
	//////////////////////////////////////////////////////////////////////////
	EPreloadBuffer *	pBuffer = GetPreloadBuffer( ) ;
	if ( pBuffer == NULL )
	{
		return	NULL ;
	}
	DWORD	dwSampleBytes = GetChannelCount() * GetBitsPerSample() / 8 ;
	dwBytes = pBuffer->m_miodh.dwSampleCount * dwSampleBytes ;
	dwOffsetBytes = (nSample - pBuffer->m_nKeySample) * dwSampleBytes ;
	//
	void *	ptrWaveBuf = AllocateWaveBuffer( dwBytes ) ;
	//
	m_pmioc->AttachFileObject( pBuffer ) ;
	//
	if ( m_pmiod->DecodeSound( *m_pmioc, pBuffer->m_miodh, ptrWaveBuf ) )
	{
		DeleteWaveBuffer( ptrWaveBuf ) ;
		delete	pBuffer ;
		return	NULL ;
	}
	delete	pBuffer ;

	return	ptrWaveBuf ;
}

//
// 次の音声データがストリームの先頭であるか？
//////////////////////////////////////////////////////////////////////////////
bool MIODynamicPlayer::IsNextDataRewound( void )
{
	if ( m_hThread == NULL )
	{
		return	false ;
	}
	HANDLE	hEventList[2] ;
	hEventList[0] = m_hQueueNotEmpty ;
	hEventList[1] = m_hThread ;
	DWORD	dwWaitResult =
		::WaitForMultipleObjects( 2, hEventList, FALSE, INFINITE ) ;
	if ( dwWaitResult != WAIT_OBJECT_0 )
	{
		return	false ;
	}
	//
	bool	fRewound = false ;
	Lock( ) ;
	if ( m_queueSound.m_length != 0 )
	{
		EPreloadBuffer *	pBuffer = m_queueSound.m_queue[0] ;
		if ( (pBuffer != NULL) && (pBuffer->m_nKeySample == 0) )
		{
			fRewound = true ;
		}
	}
	Unlock( ) ;
	//
	return	fRewound ;
}

//
// 次の音声データを取得
//////////////////////////////////////////////////////////////////////////////
void * MIODynamicPlayer::GetNextWaveBuffer( DWORD & dwBytes )
{
	EPreloadBuffer *	pBuffer = GetPreloadBuffer( ) ;
	if ( pBuffer == NULL )
	{
		return	NULL ;
	}
	DWORD	dwSampleBytes = GetChannelCount() * GetBitsPerSample() / 8 ;
	dwBytes = pBuffer->m_miodh.dwSampleCount * dwSampleBytes ;
	//
	void *	ptrWaveBuf = AllocateWaveBuffer( dwBytes ) ;
	//
	m_pmioc->AttachFileObject( pBuffer ) ;
	//
	if ( m_pmiod->DecodeSound( *m_pmioc, pBuffer->m_miodh, ptrWaveBuf ) )
	{
		DeleteWaveBuffer( ptrWaveBuf ) ;
		delete	pBuffer ;
		return	NULL ;
	}
	delete	pBuffer ;

	return	ptrWaveBuf ;
}

//
// 音声バッファ確保
//////////////////////////////////////////////////////////////////////////////
void * MIODynamicPlayer::AllocateWaveBuffer( DWORD dwBytes )
{
	return	::eriAllocateMemory( dwBytes ) ;
}

//
// 音声データ破棄許可
//////////////////////////////////////////////////////////////////////////////
void MIODynamicPlayer::DeleteWaveBuffer( void * ptrWaveBuf )
{
	::eriFreeMemory( ptrWaveBuf ) ;
}

// 音声展開オブジェクトを生成
//////////////////////////////////////////////////////////////////////////////
MIODecoder * MIODynamicPlayer::CreateMIODecoder( void )
{
	return	new MIODecoder ;
}

//
// ERIFile オブジェクトを取得する
//////////////////////////////////////////////////////////////////////////////
const ERIFile & MIODynamicPlayer::GetERIFile( void ) const
{
	return	m_erif ;
}

//
// チャネル数を取得する
//////////////////////////////////////////////////////////////////////////////
DWORD MIODynamicPlayer::GetChannelCount( void ) const
{
	return	m_erif.m_MIOInfHdr.dwChannelCount ;
}

//
// サンプリング周波数を取得する
//////////////////////////////////////////////////////////////////////////////
DWORD MIODynamicPlayer::GetFrequency( void ) const
{
	return	m_erif.m_MIOInfHdr.dwSamplesPerSec ;
}

//
// サンプリングビット分解能を取得する
//////////////////////////////////////////////////////////////////////////////
DWORD MIODynamicPlayer::GetBitsPerSample( void ) const
{
	return	m_erif.m_MIOInfHdr.dwBitsPerSample ;
}

//
// 全体の長さ（サンプル数）を取得する
//////////////////////////////////////////////////////////////////////////////
DWORD MIODynamicPlayer::GetTotalSampleCount( void ) const
{
	return	m_erif.m_MIOInfHdr.dwAllSampleCount ;
}

//
// 先読みバッファを取得する
//////////////////////////////////////////////////////////////////////////////
MIODynamicPlayer::EPreloadBuffer *
		MIODynamicPlayer::GetPreloadBuffer( void )
{
	if ( m_hThread == NULL )
	{
		return	NULL ;
	}
	HANDLE	hEventList[2] ;
	hEventList[0] = m_hQueueNotEmpty ;
	hEventList[1] = m_hThread ;
	DWORD	dwWaitResult =
		::WaitForMultipleObjects( 2, hEventList, FALSE, INFINITE ) ;
	if ( dwWaitResult != WAIT_OBJECT_0 )
	{
		return	NULL ;
	}
	//
	EPreloadBuffer *	pBuffer = NULL ;
	Lock( ) ;
	if ( m_queueSound.m_length != 0 )
	{
		pBuffer = m_queueSound.m_queue[0] ;
		for ( unsigned int i = 1; i < m_queueSound.m_length; i ++ )
		{
			m_queueSound.m_queue[i - 1] = m_queueSound.m_queue[i] ;
		}
		if ( -- m_queueSound.m_length == 0 )
		{
			::ResetEvent( m_hQueueNotEmpty ) ;
		}
		if ( m_queueSound.m_length < m_queueSound.m_limit )
		{
			::SetEvent( m_hQueueSpace ) ;
			::ResetEvent( m_hQueueFull ) ;
		}
	}
	Unlock( ) ;
	return	pBuffer ;
}

//
// 先読みバッファに追加する
//////////////////////////////////////////////////////////////////////////////
void MIODynamicPlayer::AddPreloadBuffer( EPreloadBuffer * pBuffer )
{
	Lock( ) ;
	if ( m_queueSound.m_length < m_queueSound.m_limit )
	{
		m_queueSound.m_queue[m_queueSound.m_length ++] = pBuffer ;
		if ( m_queueSound.m_length != 0 )
		{
			::SetEvent( m_hQueueNotEmpty ) ;
		}
		if ( m_queueSound.m_length >= m_queueSound.m_limit )
		{
			::ResetEvent( m_hQueueSpace ) ;
			::SetEvent( m_hQueueFull ) ;
		}
	}
	Unlock( ) ;
}

//
// スレッド関数
//////////////////////////////////////////////////////////////////////////////
DWORD WINAPI MIODynamicPlayer::ThreadProc( LPVOID parameter )
{
	::eriInitializeTask( ) ;
	DWORD	dwResult =
		((MIODynamicPlayer*)parameter)->LoadingThreadProc( ) ;
	::eriCloseTask( ) ;
	return	dwResult ;
}

DWORD MIODynamicPlayer::LoadingThreadProc( void )
{
	//
	// メッセージキューを作成
	//////////////////////////////////////////////////////////////////////////
	MSG		msg ;
	::PeekMessage( &msg, NULL, 0, 0, PM_NOREMOVE ) ;
	//
	// 変数初期化
	//////////////////////////////////////////////////////////////////////////
	KEY_POINT	keypoint ;
	unsigned int	nCurrentSample = 0 ;
	//
	// 各レコードを読み込む
	//////////////////////////////////////////////////////////////////////////
	for ( ; ; )
	{
		//
		// レコードを開く
		//////////////////////////////////////////////////////////////////////
		DWORD	dwRecPosition = m_erif.GetPointer( ) ;
		if ( !m_erif.DescendRecord( (const UINT64 *)"SoundStm" ) )
		{
			if ( nCurrentSample == 0 )
			{
				// 1つも画像レコードが無い場合はエラー
				break ;
			}
			//
			// レコードの終端に到達したら
			// 自動的に先頭に移動
			KEY_POINT *	pKeyPoint = SearchKeySample( nCurrentSample ) ;
			if ( pKeyPoint == NULL )
			{
				keypoint.nKeySample = nCurrentSample ;
				keypoint.dwRecOffset = dwRecPosition ;
				AddKeySample( keypoint ) ;
			}
			//
			nCurrentSample = 0 ;
			m_erif.Seek( 0 ) ;
			continue ;
		}
		//
		// 音声データレコードを読み込む
		DWORD	dwDataBytes = m_erif.GetLength( ) ;
		EPreloadBuffer *	pBuffer =
			new EPreloadBuffer( dwDataBytes - sizeof(MIO_DATA_HEADER) ) ;
		//
		pBuffer->m_nKeySample = nCurrentSample ;
		m_erif.Read( &(pBuffer->m_miodh), sizeof(MIO_DATA_HEADER) ) ;
		m_erif.Read( pBuffer->m_ptrBuffer,
						dwDataBytes - sizeof(MIO_DATA_HEADER) ) ;
		//
		m_erif.AscendRecord( ) ;
		//
		// キーポイントの設定
		if ( pBuffer->m_miodh.bytFlags & MIO_LEAD_BLOCK )
		{
			KEY_POINT *	pKeyPoint = SearchKeySample( nCurrentSample ) ;
			if ( pKeyPoint == NULL )
			{
				keypoint.nKeySample = nCurrentSample ;
				keypoint.dwRecOffset = dwRecPosition ;
				AddKeySample( keypoint ) ;
			}
		}
		//
		// メッセージを受信＆ウェイト
		//////////////////////////////////////////////////////////////////////
		bool	fQuit = false ;
		do
		{
			//
			// キューが空くかメッセージを受信するまで待つ
			DWORD	dwWaitResult =
				::MsgWaitForMultipleObjects
					( 1, &m_hQueueSpace, FALSE, INFINITE, QS_ALLINPUT ) ;
			if ( (pBuffer != NULL) && (dwWaitResult == WAIT_OBJECT_0) )
			{
				AddPreloadBuffer( pBuffer ) ;
				nCurrentSample += pBuffer->m_miodh.dwSampleCount ;
				pBuffer = NULL ;
			}
			//
			if ( ::PeekMessage( &msg, NULL, 0, 0, PM_REMOVE ) )
			{
				if ( msg.message == tmSeekSound )
				{
					//
					// 音声データをシーク
					//
					if ( pBuffer != NULL )
					{
						m_erif.Seek( dwRecPosition ) ;
						delete	pBuffer ;
						pBuffer = NULL ;
					}
					//
					SeekKeySample( (ULONG) msg.wParam, nCurrentSample ) ;
					//
					::SetEvent( (HANDLE) msg.lParam ) ;
				}
				else if ( msg.message == tmQuit )
				{
					//
					// 終了
					//
					fQuit = true ;
					break ;
				}
			}
		}
		while ( pBuffer != NULL ) ;
		//
		if ( fQuit )
		{
			delete	pBuffer ;
			break ;
		}
	}

	return	0 ;
}

//
// キーフレームポイントを追加する
//////////////////////////////////////////////////////////////////////////////
void MIODynamicPlayer::AddKeySample( MIODynamicPlayer::KEY_POINT key )
{
	Lock( ) ;
	if ( m_listKeySample.m_count >= m_listKeySample.m_limit )
	{
		if ( m_listKeySample.m_limit == 0 )
		{
			m_listKeySample.SetLimit( 0x100 ) ;
		}
		else
		{
			m_listKeySample.SetLimit( m_listKeySample.m_limit * 2 ) ;
		}
	}
	if ( m_listKeySample.m_count < m_listKeySample.m_limit )
	{
		m_listKeySample.m_list[m_listKeySample.m_count ++] = key ;
	}
	Unlock( ) ;
}

//
// 指定のキーフレームを検索する
//////////////////////////////////////////////////////////////////////////////
MIODynamicPlayer::KEY_POINT *
	MIODynamicPlayer::SearchKeySample( unsigned int nKeySample )
{
	int		iFirst, iMiddle, iEnd ;
	KEY_POINT *	pFoundKey = NULL ;
	//
	Lock( ) ;
	//
	if ( m_listKeySample.m_count == 0 )
	{
		Unlock( ) ;
		return	NULL ;
	}
	//
	iFirst = 0 ;
	iMiddle = 0 ;
	iEnd = m_listKeySample.m_count - 1 ;
	//
	for ( ; ; )
	{
		if ( iFirst >= iEnd )
		{
			pFoundKey = NULL ;
			if ( m_listKeySample.m_list[iMiddle].nKeySample == nKeySample )
			{
				pFoundKey = &(m_listKeySample.m_list[iMiddle]) ;
			}
			else if ( m_listKeySample.m_list[iMiddle].nKeySample > nKeySample )
			{
				while ( iMiddle > 0 )
				{
					if ( m_listKeySample.m_list
							[-- iMiddle].nKeySample <= nKeySample )
					{
						pFoundKey = &(m_listKeySample.m_list[iMiddle]) ;
						break ;
					}
				}
			}
			else
			{
				while ( iMiddle < (int) m_listKeySample.m_count - 1 )
				{
					if ( m_listKeySample.m_list
							[iMiddle + 1].nKeySample == nKeySample )
					{
						pFoundKey = &(m_listKeySample.m_list[iMiddle + 1]);
						break ;
					}
					else if ( m_listKeySample.m_list
							[iMiddle + 1].nKeySample > nKeySample )
					{
						pFoundKey = &(m_listKeySample.m_list[iMiddle]);
						break ;
					}
					++ iMiddle ;
				}
			}
			break ;
		}
		//
		iMiddle = (iFirst + iEnd) / 2 ;
		pFoundKey = &(m_listKeySample.m_list[iMiddle]) ;
		//
		if ( pFoundKey->nKeySample == nKeySample )
		{
			break ;
		}
		if ( pFoundKey->nKeySample > nKeySample )
		{
			iEnd = iMiddle - 1 ;
		}
		else
		{
			iFirst = iMiddle + 1 ;
		}
	}
	//
	Unlock( ) ;
	//
	return	pFoundKey ;
}

//
// 指定のサンプルを含むブロックを読み込む
//////////////////////////////////////////////////////////////////////////////
void MIODynamicPlayer::SeekKeySample
	( ULONG nSample, unsigned int & nCurrentSample )
{
	EPreloadBuffer *	pBuffer ;
	//
	// 既に先読みキューに読み込まれていないか判断
	//////////////////////////////////////////////////////////////////////////
	Lock( ) ;
	//
	unsigned int	iLoaded = 0 ;
	unsigned int	iLeadBlock = 0 ;
	while ( iLoaded < m_queueSound.m_length )
	{
		pBuffer = m_queueSound.m_queue[iLoaded] ;
		if ( pBuffer != NULL )
		{
			if ( pBuffer->m_miodh.bytFlags & MIO_LEAD_BLOCK )
			{
				iLeadBlock = iLoaded ;
			}
			if ( (pBuffer->m_nKeySample <= nSample)
				&& ((nSample - pBuffer->m_nKeySample)
						< pBuffer->m_miodh.dwSampleCount) )
			{
				break ;
			}
		}
		++ iLoaded ;
	}
	//
	// 既に読み込まれている場合にはそこまでシークする
	//
	if ( iLoaded < m_queueSound.m_length )
	{
		//
		// 最も近いリードブロックまで破棄する
		unsigned int	i ;
		for ( i = 0; i < iLeadBlock; i ++ )
		{
			delete	GetPreloadBuffer( ) ;
		}
		//
		// 特定のブロックまでシークする
		for ( i = iLeadBlock; i < iLoaded; i ++ )
		{
			pBuffer = GetPreloadBuffer( ) ;
			if ( pBuffer == NULL )
				break ;
			//
			DWORD	dwSampleBytes =
				GetChannelCount() * GetBitsPerSample() / 8 ;
			DWORD	dwBytes =
				pBuffer->m_miodh.dwSampleCount * dwSampleBytes ;
			//
			void *	ptrWaveBuf = AllocateWaveBuffer( dwBytes ) ;
			//
			m_pmioc->AttachFileObject( pBuffer ) ;
			//
			m_pmiod->DecodeSound( *m_pmioc, pBuffer->m_miodh, ptrWaveBuf ) ;
			//
			DeleteWaveBuffer( ptrWaveBuf ) ;
			delete	pBuffer ;
		}
		Unlock( ) ;
		return ;
	}
	//
	// 既に読み込まれているブロックを破棄する
	//
	while ( m_queueSound.m_length != 0 )
	{
		delete	GetPreloadBuffer( ) ;
	}
	//
	Unlock( ) ;
	//
	// リストに指定のサンプルを含むキーが登録されているか検索し、
	// 登録されていない場合には、シークする
	//////////////////////////////////////////////////////////////////////////
	KEY_POINT *	pKeyPoint = SearchKeySample( nSample ) ;
	if ( pKeyPoint == NULL )
	{
		Lock( ) ;
		if ( m_listKeySample.m_count > 0 )
		{
			pKeyPoint = &m_listKeySample.m_list[m_listKeySample.m_count - 1] ;
			m_erif.Seek( pKeyPoint->dwRecOffset ) ;
			nCurrentSample = pKeyPoint->nKeySample ;
		}
		Unlock( ) ;
		//
		// 各レコードを順次読み込む
		for ( ; ; )
		{
			DWORD	dwRecPosition = m_erif.GetPointer( ) ;
			if ( !m_erif.DescendRecord( (const UINT64 *)"SoundStm" ) )
			{
				return ;
			}
			//
			MIO_DATA_HEADER	miodh ;
			m_erif.Read( &miodh, sizeof(miodh) ) ;
			m_erif.AscendRecord( ) ;
			//
			// キーポイントの設定
			if ( miodh.bytFlags & MIO_LEAD_BLOCK )
			{
				pKeyPoint = SearchKeySample( nCurrentSample ) ;
				if ( pKeyPoint == NULL )
				{
					KEY_POINT	keypoint ;
					keypoint.nKeySample = nCurrentSample ;
					keypoint.dwRecOffset = dwRecPosition ;
					AddKeySample( keypoint ) ;
					//
					pKeyPoint = &(m_listKeySample.m_list
									[m_listKeySample.m_count - 1]) ;
				}
			}
			//
			// 位置の更新
			if ( (nCurrentSample <= nSample) &&
					((nSample - nCurrentSample) < miodh.dwSampleCount) )
			{
				break ;
			}
			nCurrentSample += miodh.dwSampleCount ;
		}
	}
	//
	// 指定のキーポイントからシークする
	//////////////////////////////////////////////////////////////////////////
	if ( pKeyPoint == NULL )
	{
		return ;
	}
	nCurrentSample = pKeyPoint->nKeySample ;
	m_erif.Seek( pKeyPoint->dwRecOffset ) ;
	//
	for ( ; ; )
	{
		if ( !m_erif.DescendRecord( (const UINT64 *)"SoundStm" ) )
		{
			return ;
		}
		//
		// 音声データレコードを読み込む
		DWORD	dwDataBytes = m_erif.GetLength( ) ;
		EPreloadBuffer *	pBuffer =
			new EPreloadBuffer( dwDataBytes - sizeof(MIO_DATA_HEADER) ) ;
		//
		pBuffer->m_nKeySample = nCurrentSample ;
		m_erif.Read( &(pBuffer->m_miodh), sizeof(MIO_DATA_HEADER) ) ;
		m_erif.Read( pBuffer->m_ptrBuffer,
						dwDataBytes - sizeof(MIO_DATA_HEADER) ) ;
		//
		m_erif.AscendRecord( ) ;
		//
		// 位置の更新
		if ( (nCurrentSample <= nSample) &&
			((nSample - nCurrentSample) < pBuffer->m_miodh.dwSampleCount) )
		{
			nCurrentSample += pBuffer->m_miodh.dwSampleCount ;
			AddPreloadBuffer( pBuffer ) ;
			break ;
		}
		nCurrentSample += pBuffer->m_miodh.dwSampleCount ;
		//
		// データを展開して破棄する
		DWORD	dwSampleBytes = GetChannelCount() * GetBitsPerSample() / 8 ;
		DWORD	dwBytes = pBuffer->m_miodh.dwSampleCount * dwSampleBytes ;
		//
		void *	ptrWaveBuf = AllocateWaveBuffer( dwBytes ) ;
		//
		m_pmioc->AttachFileObject( pBuffer ) ;
		//
		m_pmiod->DecodeSound( *m_pmioc, pBuffer->m_miodh, ptrWaveBuf ) ;
		//
		DeleteWaveBuffer( ptrWaveBuf ) ;
		delete	pBuffer ;
	}
}

//
// 排他処理（クリティカルセクション）
//////////////////////////////////////////////////////////////////////////////
void MIODynamicPlayer::Lock( void )
{
	::EnterCriticalSection( &m_cs ) ;
}

void MIODynamicPlayer::Unlock( void )
{
	::LeaveCriticalSection( &m_cs ) ;
}

