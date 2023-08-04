
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
                    ERIアニメーションファイルオブジェクト
 *****************************************************************************/

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
ERIAnimation::EPreloadBuffer::EPreloadBuffer( DWORD dwLength )
	: EMemFile( NULL, dwLength )
{
	m_ptrBuffer = (BYTE*) ::eriAllocateMemory( dwLength ) ;
	m_ptrMemory = m_ptrBuffer ;
	m_iFrameIndex = 0 ;
	m_ui64RecType = 0 ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
ERIAnimation::EPreloadBuffer::~EPreloadBuffer( void )
{
	::eriFreeMemory( m_ptrBuffer ) ;
}

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
ERIAnimation::EPreloadQueue::EPreloadQueue( void )
{
	m_queue = NULL ;
	m_length = 0 ;
	m_limit = 0 ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
ERIAnimation::EPreloadQueue::~EPreloadQueue( void )
{
	RemoveAll( ) ;
}

//
// 配列の最大の長さを設定
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::EPreloadQueue::SetLimit( unsigned int nLimit )
{
	m_limit = nLimit ;
	m_queue = (EPreloadBuffer**)
		::eriAllocateMemory( nLimit * sizeof(EPreloadBuffer*) ) ;
}

//
// 配列を消去
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::EPreloadQueue::RemoveAll( void )
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
ERIAnimation::EKeyPointList::EKeyPointList( void )
{
	m_list = NULL ;
	m_count = 0 ;
	m_limit = 0 ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
ERIAnimation::EKeyPointList::~EKeyPointList( void )
{
	RemoveAll( ) ;
}

//
// 配列の最剤の長さを設定
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::EKeyPointList::SetLimit( unsigned int nLimit )
{
	m_limit = nLimit ;
	m_list = (KEY_POINT*)
		::eriAllocateMemory( nLimit * sizeof(KEY_POINT) ) ;
}

//
// 配列を消去
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::EKeyPointList::RemoveAll( void )
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
ERIAnimation::ERIAnimation( void )
{
	m_fWaveOutput = false ;
	m_fWaveStreaming = false ;
	m_peric = NULL ;
	m_perid = NULL ;
	m_pmioc = NULL ;
	m_pmiod = NULL ;
	m_pDstImage = NULL ;
	m_pPaletteTable = NULL ;
	m_pWorkImage = NULL ;
	m_hThread = NULL ;
	m_hQueueNotEmpty = NULL ;
	m_hQueueSpace = NULL ;
	::InitializeCriticalSection( &m_cs ) ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
ERIAnimation::~ERIAnimation( void )
{
	Close( ) ;
	::DeleteCriticalSection( &m_cs ) ;
}

//
// 画像展開出力バッファ要求
//////////////////////////////////////////////////////////////////////////////
RASTER_IMAGE_INFO * ERIAnimation::CreateImageBuffer
	( DWORD format, SDWORD width, SDWORD height,
				DWORD bpp, ENTIS_PALETTE ** ppaltbl )
{
	RASTER_IMAGE_INFO *	prii = new RASTER_IMAGE_INFO ;
	if ( height < 0 )
	{
		height = - height ;
	}
	prii->fdwFormatType = format ;
	prii->nImageWidth = width ;
	prii->nImageHeight = height ;
	prii->dwBitsPerPixel = bpp ;
	prii->BytesPerLine = ((width * bpp / 8) + 0x03) & ~0x03 ;
	prii->ptrImageArray =
		(PBYTE) ::eriAllocateMemory( prii->BytesPerLine * height ) ;
	//
	if ( ppaltbl != NULL )
	{
		if ( bpp <= 8 )
		{
			*ppaltbl = new ENTIS_PALETTE[0x100] ;
		}
		else
		{
			*ppaltbl = NULL ;
		}
	}
	//
	return	prii ;
}

//
// 画像展開出力バッファ消去
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::DeleteImageBuffer
	( RASTER_IMAGE_INFO * prii, ENTIS_PALETTE * paltbl )
{
	if ( prii != NULL )
	{
		::eriFreeMemory( prii->ptrImageArray ) ;
		delete	prii ;
	}
	if ( paltbl != NULL )
	{
		delete []	paltbl ;
	}
}

//
// 画像展開オブジェクト生成
//////////////////////////////////////////////////////////////////////////////
ERIDecoder * ERIAnimation::CreateERIDecoder( void )
{
	return	new ERIDecoder ;
}

//
// 音声展開オブジェクト生成
//////////////////////////////////////////////////////////////////////////////
MIODecoder * ERIAnimation::CreateMIODecoder( void )
{
	return	new MIODecoder ;
}

//
// 音声出力要求
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimation::RequestWaveOut
	( DWORD channels, DWORD frequency, DWORD bps )
{
	return	false ;
}

//
// 音声出力終了
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::CloseWaveOut( void )
{
}

//
// 音声データ出力
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::PushWaveBuffer( void * ptrWaveBuf, DWORD dwBytes )
{
	DeleteWaveBuffer( ptrWaveBuf ) ;
}

//
// 音声バッファ確保
//////////////////////////////////////////////////////////////////////////////
void * ERIAnimation::AllocateWaveBuffer( DWORD dwBytes )
{
	return	::eriAllocateMemory( dwBytes ) ;
}

//
// 音声データ破棄許可
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::DeleteWaveBuffer( void * ptrWaveBuf )
{
	::eriFreeMemory( ptrWaveBuf ) ;
}

//
// 音声ストリーミング開始
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::BeginWaveStreaming( void )
{
	if ( m_fWaveOutput )
	{
		m_fWaveStreaming = true ;
		//
		if ( m_hThread != NULL )
		{
			HANDLE	hEventList[2] ;
			hEventList[0] = ::CreateEvent( NULL, TRUE, FALSE, NULL ) ;
			hEventList[1] = m_hThread ;
			::PostThreadMessage
				( m_idThread, tmSeekSound,
					m_iCurrentFrame, (LPARAM) hEventList[0] ) ;
			DWORD	dwWaitResult =
				::WaitForMultipleObjects( 2, hEventList, FALSE, INFINITE ) ;
			::CloseHandle( hEventList[0] ) ;
		}
	}
}

//
// 音声ストリーミング終了
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::EndWaveStreaming( void )
{
	m_fWaveStreaming = false ;
}

//
// アニメーションファイルを開く
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimation::Open
	( EFileObject * pFile, unsigned int nPreloadSize, bool fTopDown )
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
	m_perid = CreateERIDecoder( ) ;
	if ( m_perid->Initialize( m_erif.m_InfoHeader ) )
	{
		return	false ;
	}
	m_peric = new EFileDecodeContext( NULL, 0x10000 ) ;
	//
	m_fWaveOutput = false ;
	if ( m_erif.m_fdwReadMask & ERIFile::rmSoundInfo )
	{
		//
		// サウンドが含まれている
		m_pmiod = CreateMIODecoder( ) ;
		if ( !m_pmiod->Initialize( m_erif.m_MIOInfHdr ) )
		{
			m_pmioc = new EFileDecodeContext( &m_erif, 0x10000 ) ;
			//
			// 音声出力要求
			if ( RequestWaveOut
				( m_erif.m_MIOInfHdr.dwChannelCount,
					m_erif.m_MIOInfHdr.dwSamplesPerSec,
					m_erif.m_MIOInfHdr.dwBitsPerSample ) )
			{
				//
				// 音声出力要求が受け入れられた
				m_fWaveOutput = true ;
			}
		}
	}
	//
	// 画像バッファを生成
	//////////////////////////////////////////////////////////////////////////
	m_fTopDown = fTopDown ;
	signed int			nImageHeight ;
	ENTIS_PALETTE **	ppaltbl = NULL ;
	if ( m_erif.m_InfoHeader.dwBitsPerPixel <= 8 )
	{
		ppaltbl = &m_pPaletteTable ;
	}
	nImageHeight = m_erif.m_InfoHeader.nImageHeight ;
	if ( nImageHeight < 0 )
	{
		nImageHeight = - nImageHeight ;
	}
	m_pDstImage = CreateImageBuffer
		( m_erif.m_InfoHeader.fdwFormatType,
			m_erif.m_InfoHeader.nImageWidth, nImageHeight,
			m_erif.m_InfoHeader.dwBitsPerPixel, ppaltbl ) ;
	//
	if ( m_pDstImage == NULL )
	{
		return	false ;
	}
	//
	m_pWorkImage = new RASTER_IMAGE_INFO ;
	m_pWorkImage->fdwFormatType = m_erif.m_InfoHeader.fdwFormatType ;
	m_pWorkImage->nImageWidth = m_erif.m_InfoHeader.nImageWidth ;
	m_pWorkImage->nImageHeight = nImageHeight ;
	m_pWorkImage->dwBitsPerPixel = m_erif.m_InfoHeader.dwBitsPerPixel ;
	m_pWorkImage->BytesPerLine =
		((m_erif.m_InfoHeader.nImageWidth *
			m_erif.m_InfoHeader.dwBitsPerPixel / 8) + 0x03) & ~0x03 ;
	m_pWorkImage->ptrImageArray =
		(PBYTE) ::eriAllocateMemory
			( m_pWorkImage->BytesPerLine * m_pWorkImage->nImageHeight ) ;
	//
	// 先読みバッファ配列を確保
	//////////////////////////////////////////////////////////////////////////
	if ( nPreloadSize == 0 )
	{
		nPreloadSize = 30 ;
	}
	m_queueImage.SetLimit( nPreloadSize ) ;
	//
	// フレームシーク用キーポイント配列確保
	//////////////////////////////////////////////////////////////////////////
	m_listKeyFrame.SetLimit( m_erif.m_FileHeader.dwFrameCount ) ;
	m_listKeyWave.SetLimit( m_erif.m_FileHeader.dwFrameCount ) ;
	//
	// スレッドを生成
	//////////////////////////////////////////////////////////////////////////
	m_hQueueNotEmpty = ::CreateEvent( NULL, TRUE, FALSE, NULL ) ;
	m_hQueueSpace = ::CreateEvent( NULL, TRUE, TRUE, NULL ) ;
	m_hThread = ::CreateThread
		( NULL, 0, &ERIAnimation::ThreadProc, this, 0, &m_idThread ) ;
	if ( !(m_hQueueNotEmpty && m_hQueueSpace && m_hThread) )
	{
		return	false ;
	}
	//
	// 第1フレームを展開する
	//////////////////////////////////////////////////////////////////////////
	if ( !SeekToNextFrame( ) )
	{
		return	false ;
	}

	return	true ;
}

//
// アニメーションファイルを閉じる
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::Close( void )
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
	m_queueImage.RemoveAll( ) ;
	//
	// キーフレームポイント配列をクリアする
	m_listKeyFrame.RemoveAll( ) ;
	m_listKeyWave.RemoveAll( ) ;
	//
	// 画像バッファを削除する
	if ( m_pDstImage != NULL )
	{
		DeleteImageBuffer( m_pDstImage, m_pPaletteTable ) ;
		m_pDstImage = NULL ;
		m_pPaletteTable = NULL ;
	}
	if ( m_pWorkImage != NULL )
	{
		::eriFreeMemory( m_pWorkImage->ptrImageArray ) ;
		delete	m_pWorkImage ;
		m_pWorkImage = NULL ;
	}
	//
	// 展開オブジェクトを削除する
	if ( m_perid != NULL )
	{
		m_perid->Delete( ) ;
		delete	m_perid ;
		m_perid = NULL ;
	}
	if ( m_pmiod != NULL )
	{
		m_pmiod->Delete( ) ;
		delete	m_pmiod ;
		m_pmiod = NULL ;
	}
	if ( m_peric != NULL )
	{
		delete	m_peric ;
		m_peric = NULL ;
	}
	if ( m_pmioc != NULL )
	{
		delete	m_pmioc ;
		m_pmioc = NULL ;
	}
	//
	// 音声出力の終了
	if ( m_fWaveOutput )
	{
		CloseWaveOut( ) ;
		m_fWaveOutput = false ;
	}
	//
	// ファイルを閉じる
	m_erif.Close( ) ;
}

//
// 先頭フレームへ移動
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimation::SeekToBegin( void )
{
	//
	// スレッドにシークメッセージを送る
	//////////////////////////////////////////////////////////////////////////
	if ( m_hThread == NULL )
	{
		return	false ;
	}
	HANDLE	hEventList[2] ;
	hEventList[0] = ::CreateEvent( NULL, TRUE, FALSE, NULL ) ;
	hEventList[1] = m_hThread ;
	::PostThreadMessage
		( m_idThread, tmSeekFrame, 0, (LPARAM) hEventList[0] ) ;
	DWORD	dwWaitResult =
		::WaitForMultipleObjects( 2, hEventList, FALSE, INFINITE ) ;
	::CloseHandle( hEventList[0] ) ;
	if ( dwWaitResult != WAIT_OBJECT_0 )
	{
		return	false ;
	}
	//
	// 先頭フレームを展開
	//////////////////////////////////////////////////////////////////////////
	if ( !SeekToNextFrame( ) )
	{
		return	false ;
	}

	return	true ;
}

//
// 次のフレームへ移動
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimation::SeekToNextFrame( int nSkipFrame )
{
	if ( m_hThread == NULL )
	{
		return	false ;
	}
	//
	// 指定フレームがキーフレームを挟んでいる場合、
	// キーフレームデータまでの間を読み飛ばす
	//////////////////////////////////////////////////////////////////////////
	int	nBreakCount = 0 ;
	if ( (nSkipFrame > 0) && (GetKeyFrameCount() != 0) )
	{
		if ( GetKeyFrameCount() == 1 )
		{
			nBreakCount = nSkipFrame ;
		}
		else
		{
			int	nCountUntilNext =
				GetKeyFrameCount()
					- (m_iCurrentFrame % GetKeyFrameCount()) - 1 ;
			if ( nCountUntilNext <= nSkipFrame )
			{
				nBreakCount = nCountUntilNext ;
				nSkipFrame -= nCountUntilNext ;
			}
			int	nSkipKeyFrame = nSkipFrame / GetKeyFrameCount() ;
			nSkipFrame -= nSkipKeyFrame * GetKeyFrameCount() ;
			nBreakCount += nSkipKeyFrame * GetKeyFrameCount() ;
		}
	}
	//
	// キーフレームデータまでを破棄する
	//////////////////////////////////////////////////////////////////////////
	if ( nBreakCount > 0 )
	{
		int	nBreakedCount = 0 ;
		for ( ; ; )
		{
			//
			// フレームが読み込まれるまで待つ
			HANDLE	hEventList[2] =
			{
				m_hQueueNotEmpty, m_hThread
			} ;
			DWORD	dwWaitResult =
				::WaitForMultipleObjects( 2, hEventList, FALSE, INFINITE ) ;
			if ( dwWaitResult != WAIT_OBJECT_0 )
			{
				return	false ;
			}
			//
			// フレームデータを一つ破棄する
			Lock( ) ;
			EPreloadBuffer *	pBuffer = GetPreloadBuffer( ) ;
			if ( pBuffer != NULL )
			{
				unsigned __int64	recid = pBuffer->m_ui64RecType ;
				if ( (recid == *((UINT64*)"ImageFrm")) ||
						(recid == *((UINT64*)"DiffeFrm")) )
				{
					//
					// フレームデータは破棄
					++ nBreakedCount ;
				}
				else if ( recid == *((UINT64*)"Palette ") )
				{
					//
					// パレットデータは適用
					unsigned int	nBytes = pBuffer->GetLength( ) ;
					if ( nBytes > sizeof(ENTIS_PALETTE) * 0x100 )
						nBytes = sizeof(ENTIS_PALETTE) * 0x100 ;
					pBuffer->Read( m_pPaletteTable, nBytes ) ;
				}
			}
			delete	pBuffer ;
			Unlock( ) ;
			//
			if ( nBreakedCount >= nBreakCount )
			{
				break ;
			}
		}
	}
	//
	// 指定フレームまで順次展開
	//////////////////////////////////////////////////////////////////////////
	int	nSkippedCount = 0 ;
	nSkipFrame ++ ;
	for ( ; ; )
	{
		if ( !DecodeNextFrame( ) )
		{
			return	false ;
		}
		if ( ++ nSkippedCount >= nSkipFrame )
		{
			break ;
		}
	}

	return	true ;
}

//
// 指定のフレームに移動
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimation::SeekToFrame( unsigned int iFrameIndex )
{
	//
	// 特殊条件
	//////////////////////////////////////////////////////////////////////////
	if ( m_iCurrentFrame == iFrameIndex )
	{
		return	true ;
	}
	if ( m_iCurrentFrame <= iFrameIndex )
	{
		unsigned int	nKeyFrame = GetKeyFrameCount( ) ;
		if ( nKeyFrame == 0 )
		{
			return	SeekToNextFrame( iFrameIndex - m_iCurrentFrame - 1 ) ;
		}
		if ( (iFrameIndex / nKeyFrame) == (m_iCurrentFrame / nKeyFrame) )
		{
			return	SeekToNextFrame( iFrameIndex - m_iCurrentFrame - 1 ) ;
		}
	}
	//
	// ストリーミング停止
	//////////////////////////////////////////////////////////////////////////
	if ( m_fWaveStreaming )
	{
		EndWaveStreaming( ) ;
		m_fWaveStreaming = false ;
	}
	//
	// スレッドにシークメッセージを送る
	//////////////////////////////////////////////////////////////////////////
	if ( m_hThread == NULL )
	{
		return	false ;
	}
	unsigned int	iKeyFrame = 0 ;
	if ( GetKeyFrameCount() > 0 )
	{
		iKeyFrame = iFrameIndex / GetKeyFrameCount() ;
		iKeyFrame *= GetKeyFrameCount() ;
	}
	HANDLE	hEventList[2] ;
	hEventList[0] = ::CreateEvent( NULL, TRUE, FALSE, NULL ) ;
	hEventList[1] = m_hThread ;
	::PostThreadMessage
		( m_idThread, tmSeekFrame,
			(WPARAM) iKeyFrame, (LPARAM) hEventList[0] ) ;
	DWORD	dwWaitResult =
		::WaitForMultipleObjects( 2, hEventList, FALSE, INFINITE ) ;
	::CloseHandle( hEventList[0] ) ;
	if ( dwWaitResult != WAIT_OBJECT_0 )
	{
		return	false ;
	}
	//
	// キーフレームを展開
	//////////////////////////////////////////////////////////////////////////
	if ( !SeekToNextFrame( ) )
	{
		return	false ;
	}
	//
	// 差分フレームを展開
	//////////////////////////////////////////////////////////////////////////
	if ( iFrameIndex > iKeyFrame )
	{
		if ( !SeekToNextFrame( iFrameIndex - iKeyFrame - 1 ) )
		{
			return	false ;
		}
	}

	return	true ;
}

//
// 指定のフレームはキーフレームか？
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimation::IsKeyFrame( unsigned int iFrameIndex )
{
	if ( m_erif.m_FileHeader.dwKeyFrameCount == 1 )
		return	true ;
	if ( iFrameIndex == 0 )
		return	true ;
	if ( m_erif.m_FileHeader.dwKeyFrameCount == 0 )
		return	false ;
	//
	return	(iFrameIndex % m_erif.m_FileHeader.dwKeyFrameCount) == 0 ;
}

//
// 次のフレームを展開する
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimation::DecodeNextFrame( void )
{
	if ( m_hThread == NULL )
	{
		return	false ;
	}
	//
	bool	fResult = false ;
	for ( ; ; )
	{
		//
		// フレームが読み込まれるまで待つ
		//////////////////////////////////////////////////////////////////////
		HANDLE	hEventList[2] =
		{
			m_hQueueNotEmpty, m_hThread
		} ;
		DWORD	dwWaitResult =
			::WaitForMultipleObjects( 2, hEventList, FALSE, INFINITE ) ;
		if ( dwWaitResult != WAIT_OBJECT_0 )
		{
			return	false ;
		}
		//
		// 1フレーム取得
		//////////////////////////////////////////////////////////////////////
		bool	fDecodedFrame = false ;
		Lock( ) ;
		EPreloadBuffer *	pBuffer = GetPreloadBuffer( ) ;
		if ( pBuffer != NULL )
		{
			unsigned __int64	recid = pBuffer->m_ui64RecType ;
			if ( (recid == *((UINT64*)"ImageFrm")) ||
					(recid == *((UINT64*)"DiffeFrm")) )
			{
				//
				// フレームデータを展開
				bool	fKeyFrame = (recid == *((UINT64*)"ImageFrm")) ;
				RASTER_IMAGE_INFO *	prii ;
				if ( fKeyFrame )
				{
					prii = m_pDstImage ;
				}
				else
				{
					prii = m_pWorkImage ;
				}
				//
				pBuffer->Seek( 0 ) ;
				m_peric->AttachFileObject( pBuffer ) ;
				if ( !m_perid->DecodeImage( *prii, *m_peric, m_fTopDown ) )
				{
					fResult = true ;
				}
				//
				// 差分処理
				if ( !fKeyFrame )
				{
					::eriAdditionOfFrame( *m_pDstImage, *m_pWorkImage ) ;
				}
				//
				m_iCurrentFrame = pBuffer->m_iFrameIndex ;
				fDecodedFrame = true ;
			}
			else if ( recid == *((UINT64*)"Palette ") )
			{
				//
				// パレットデータを適用
				unsigned int	nBytes = pBuffer->GetLength( ) ;
				if ( nBytes > sizeof(ENTIS_PALETTE) * 0x100 )
					nBytes = sizeof(ENTIS_PALETTE) * 0x100 ;
				pBuffer->Read( m_pPaletteTable, nBytes ) ;
			}
		}
		delete	pBuffer ;
		Unlock( ) ;
		//
		if ( fDecodedFrame )
		{
			break ;
		}
	}

	return	fResult ;
}

//
// 先読みバッファを取得する
//////////////////////////////////////////////////////////////////////////////
ERIAnimation::EPreloadBuffer * ERIAnimation::GetPreloadBuffer( void )
{
	EPreloadBuffer *	pBuffer = NULL ;
	Lock( ) ;
	if ( m_queueImage.m_length != 0 )
	{
		pBuffer = m_queueImage.m_queue[0] ;
		for ( unsigned int i = 1; i < m_queueImage.m_length; i ++ )
		{
			m_queueImage.m_queue[i - 1] = m_queueImage.m_queue[i] ;
		}
		if ( -- m_queueImage.m_length == 0 )
		{
			::ResetEvent( m_hQueueNotEmpty ) ;
		}
		if ( m_queueImage.m_length < m_queueImage.m_limit )
		{
			::SetEvent( m_hQueueSpace ) ;
		}
	}
	Unlock( ) ;
	return	pBuffer ;
}

//
// 先読みバッファに追加する
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::AddPreloadBuffer( EPreloadBuffer * pBuffer )
{
	Lock( ) ;
	if ( m_queueImage.m_length < m_queueImage.m_limit )
	{
		m_queueImage.m_queue[m_queueImage.m_length ++] = pBuffer ;
		if ( m_queueImage.m_length != 0 )
		{
			::SetEvent( m_hQueueNotEmpty ) ;
		}
		if ( m_queueImage.m_length >= m_queueImage.m_limit )
		{
			::ResetEvent( m_hQueueSpace ) ;
		}
	}
	Unlock( ) ;
}

//
// ERIFile オブジェクトを取得する
//////////////////////////////////////////////////////////////////////////////
const ERIFile & ERIAnimation::GetERIFile( void ) const
{
	return	m_erif ;
}

//
// カレントフレームのインデックスを取得する
//////////////////////////////////////////////////////////////////////////////
unsigned int ERIAnimation::CurrentIndex( void ) const
{
	return	m_iCurrentFrame ;
}

//
// カレントフレームの画像を取得
//////////////////////////////////////////////////////////////////////////////
const RASTER_IMAGE_INFO * ERIAnimation::GetImageInfo( void ) const
{
	return	m_pDstImage ;
}

//
// パレットテーブル取得
//////////////////////////////////////////////////////////////////////////////
const ENTIS_PALETTE * ERIAnimation::GetPaletteEntries( void ) const
{
	return	m_pPaletteTable ;
}

//
// キーフレームを取得
//////////////////////////////////////////////////////////////////////////////
unsigned int ERIAnimation::GetKeyFrameCount( void ) const
{
	return	m_erif.m_FileHeader.dwKeyFrameCount ;
}

//
// 全フレーム数を取得
//////////////////////////////////////////////////////////////////////////////
unsigned int ERIAnimation::GetAllFrameCount( void ) const
{
	return	m_erif.m_FileHeader.dwFrameCount ;
}

//
// 全アニメーション時間を取得
//////////////////////////////////////////////////////////////////////////////
unsigned int ERIAnimation::GetTotalTime( void ) const
{
	return	m_erif.m_FileHeader.dwAllFrameTime ;
}

//
// フレーム番号から時間へ変換
//////////////////////////////////////////////////////////////////////////////
unsigned int ERIAnimation::FrameIndexToTime( unsigned int iFrameIndex ) const
{
	if ( m_erif.m_FileHeader.dwFrameCount == 0 )
		return	0 ;
	return	::MulDiv
		( iFrameIndex,
			m_erif.m_FileHeader.dwAllFrameTime,
			m_erif.m_FileHeader.dwFrameCount ) ;
}

//
// 時間からフレーム番号へ変換
//////////////////////////////////////////////////////////////////////////////
unsigned int ERIAnimation::TimeToFrameIndex( unsigned int nMilliSec ) const
{
	if ( m_erif.m_FileHeader.dwAllFrameTime == 0 )
		return	0 ;
	return	::MulDiv
		( nMilliSec,
			m_erif.m_FileHeader.dwFrameCount,
			m_erif.m_FileHeader.dwAllFrameTime ) ;
}

//
// スレッド関数
//////////////////////////////////////////////////////////////////////////////
DWORD WINAPI ERIAnimation::ThreadProc( LPVOID parameter )
{
	return	((ERIAnimation*)parameter)->LoadingThreadProc( ) ;
}

DWORD ERIAnimation::LoadingThreadProc( void )
{
	//
	// メッセージキューを作成
	//////////////////////////////////////////////////////////////////////////
	MSG		msg ;
	::PeekMessage( &msg, NULL, 0, 0, PM_NOREMOVE ) ;
	//
	// 変数初期化
	//////////////////////////////////////////////////////////////////////////
	unsigned int	iCurrentFrame = 0 ;
	KEY_POINT	keypoint ;
	keypoint.iKeyFrame = 0 ;
	keypoint.dwRecOffset = m_erif.GetPointer( ) ;
	AddKeyPoint( m_listKeyFrame, keypoint ) ;
	//
	// 各レコードを読み込む
	//////////////////////////////////////////////////////////////////////////
	for ( ; ; )
	{
		//
		// レコードを開く
		//////////////////////////////////////////////////////////////////////
		DWORD	dwRecPosition = m_erif.GetPointer( ) ;
		if ( !m_erif.DescendRecord( ) )
		{
			if ( iCurrentFrame == 0 )
			{
				// 1つも画像レコードが無い場合はエラー
				break ;
			}
			//
			// レコードの終端に到達したら
			// 自動的に先頭に移動
			iCurrentFrame = 0 ;
			m_erif.Seek( 0 ) ;
			continue ;
		}
		//
		// レコードの種類を判別
		//////////////////////////////////////////////////////////////////////
		UINT64	recid = m_erif.GetRecordID( ) ;
		EPreloadBuffer *	pBuffer = NULL ;
		if ( (recid == *((UINT64*)"ImageFrm")) ||
				(recid == *((UINT64*)"DiffeFrm")) )
		{
			//
			// 画像データレコード
			//
			DWORD	dwDataBytes = m_erif.GetLength( ) ;
			pBuffer = new EPreloadBuffer( dwDataBytes ) ;
			pBuffer->m_iFrameIndex = iCurrentFrame ;
			pBuffer->m_ui64RecType = recid ;
			m_erif.Read( pBuffer->m_ptrBuffer, dwDataBytes ) ;
			//
			m_erif.AscendRecord( ) ;
			//
			++ iCurrentFrame ;
			if ( IsKeyFrame( iCurrentFrame ) )
			{
				KEY_POINT *	pKeyPoint =
					SearchKeyPoint( m_listKeyFrame, iCurrentFrame ) ;
				if ( pKeyPoint == NULL )
				{
					keypoint.iKeyFrame = iCurrentFrame ;
					keypoint.dwRecOffset = m_erif.GetPointer( ) ;
					AddKeyPoint( m_listKeyFrame, keypoint ) ;
				}
			}
		}
		else if ( recid == *((UINT64*)"Palette ") )
		{
			//
			// パレットテーブルレコード
			//
			DWORD	dwDataBytes = m_erif.GetLength( ) ;
			pBuffer = new EPreloadBuffer( dwDataBytes ) ;
			pBuffer->m_iFrameIndex = iCurrentFrame ;
			pBuffer->m_ui64RecType = recid ;
			m_erif.Read( pBuffer->m_ptrBuffer, dwDataBytes ) ;
			m_erif.AscendRecord( ) ;
		}
		else if ( recid == *((UINT64*)"SoundStm") )
		{
			//
			// 音声ストリームレコード
			//
			MIO_DATA_HEADER	miodh ;
			m_erif.Read( &miodh, sizeof(MIO_DATA_HEADER) ) ;
			if ( miodh.bytFlags & MIO_LEAD_BLOCK )
			{
				KEY_POINT *	pKeyPoint =
					SearchKeyPoint( m_listKeyWave, iCurrentFrame ) ;
				if ( pKeyPoint == NULL )
				{
					keypoint.iKeyFrame = iCurrentFrame ;
					keypoint.dwRecOffset = dwRecPosition ;
					AddKeyPoint( m_listKeyWave, keypoint ) ;
				}
			}
			//
			if ( m_fWaveStreaming && m_fWaveOutput )
			{
				//
				// 音声ストリーミングモード
				//		→ デコードして出力
				//
				DWORD	dwBytes = miodh.dwSampleCount
							* m_erif.m_MIOInfHdr.dwChannelCount
							* (m_erif.m_MIOInfHdr.dwBitsPerSample / 8) ;
				void *	ptrWaveBuf = AllocateWaveBuffer( dwBytes ) ;
				if ( ptrWaveBuf != NULL )
				{
					if ( !m_pmiod->DecodeSound( *m_pmioc, miodh, ptrWaveBuf ) )
					{
						PushWaveBuffer( ptrWaveBuf, dwBytes ) ;
					}
					else
					{
						DeleteWaveBuffer( ptrWaveBuf ) ;
					}
				}
			}
			//
			m_erif.AscendRecord( ) ;
		}
		else
		{
			//
			// レコードを閉じる
			//////////////////////////////////////////////////////////////////////
			m_erif.AscendRecord( ) ;
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
				pBuffer = NULL ;
			}
			//
			if ( ::PeekMessage( &msg, NULL, 0, 0, PM_REMOVE ) )
			{
				if ( msg.message == tmSeekFrame )
				{
					//
					// キーフレームにシーク
					//
					if ( pBuffer != NULL )
					{
						m_erif.Seek( dwRecPosition ) ;
						delete	pBuffer ;
						pBuffer = NULL ;
					}
					SeekKeyPoint
						( m_listKeyFrame, msg.wParam, iCurrentFrame ) ;
					//
					::SetEvent( (HANDLE) msg.lParam ) ;
				}
				else if ( msg.message == tmSeekSound )
				{
					//
					// 音声データをシーク
					//
					SeekKeyWave( m_listKeyWave, msg.wParam ) ;
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
void ERIAnimation::AddKeyPoint
	( ERIAnimation::EKeyPointList & list, ERIAnimation::KEY_POINT key )
{
	Lock( ) ;
	if ( list.m_count < list.m_limit )
	{
		list.m_list[list.m_count ++] = key ;
	}
	Unlock( ) ;
}

//
// 指定のキーフレームを検索する
//////////////////////////////////////////////////////////////////////////////
ERIAnimation::KEY_POINT * ERIAnimation::SearchKeyPoint
	( ERIAnimation::EKeyPointList & list, unsigned int iKeyFrame )
{
	int		iFirst, iMiddle, iEnd ;
	KEY_POINT *	pFoundKey ;
	//
	Lock( ) ;
	//
	iFirst = 0 ;
	iEnd = list.m_count - 1 ;
	//
	for ( ; ; )
	{
		if ( iFirst > iEnd )
		{
			pFoundKey = NULL ;
			break ;
		}
		//
		iMiddle = (iFirst + iEnd) / 2 ;
		pFoundKey = &(list.m_list[iMiddle]) ;
		//
		if ( pFoundKey->iKeyFrame == iKeyFrame )
		{
			break ;
		}
		if ( pFoundKey->iKeyFrame > iKeyFrame )
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
// 指定のフレームにシークする
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::SeekKeyPoint
	( ERIAnimation::EKeyPointList & list,
		unsigned int iFrame, unsigned int & iCurrentFrame )
{
	if ( !IsKeyFrame( iFrame ) )
		return ;
	//
	// 先読みキューに読み込まれているか判断
	//
	bool	fHaveSeeked = false ;
	Lock( ) ;
	for ( ; ; )
	{
		if ( m_queueImage.m_length == 0 )
		{
			::ResetEvent( m_hQueueNotEmpty ) ;
			break ;
		}
		EPreloadBuffer *	pBuffer = m_queueImage.m_queue[0] ;
		if ( (pBuffer != NULL)
				&& (pBuffer->m_iFrameIndex == iFrame) )
		{
			fHaveSeeked = true ;
			break ;
		}
		delete	GetPreloadBuffer( ) ;
	}
	Unlock( ) ;
	//
	if ( !fHaveSeeked )
	{
		//
		// リストに指定フレームのポインタが
		// 登録されているかどうかを調べる
		//
		KEY_POINT *	pKeyPoint = SearchKeyPoint( m_listKeyFrame, iFrame ) ;
		//
		if ( pKeyPoint != NULL )
		{
			//
			// ポインタにシーク
			//
			m_erif.Seek( pKeyPoint->dwRecOffset ) ;
			iCurrentFrame = iFrame ;
		}
		else
		{
			//
			// 指定のフレームを探す
			//
			do
			{
				//
				// 次のレコードを開く
				//
				DWORD	dwRecPosition = m_erif.GetPointer( ) ;
				if ( !m_erif.DescendRecord( ) )
				{
					iCurrentFrame = 0 ;
					m_erif.Seek( 0 ) ;
					break ;
				}
				//
				// レコードの種類を判別
				//
				UINT64	recid = m_erif.GetRecordID( ) ;
				if ( (recid == *((UINT64*)"ImageFrm")) ||
						(recid == *((UINT64*)"DiffeFrm")) )
				{
					//
					// 画像データレコード
					//
					m_erif.AscendRecord( ) ;
					++ iCurrentFrame ;
					if ( IsKeyFrame( iCurrentFrame ) )
					{
						KEY_POINT *	pKeyPoint =
							SearchKeyPoint( m_listKeyFrame, iCurrentFrame ) ;
						if ( pKeyPoint == NULL )
						{
							KEY_POINT	keypoint ;
							keypoint.iKeyFrame = iCurrentFrame ;
							keypoint.dwRecOffset = m_erif.GetPointer( ) ;
							AddKeyPoint( m_listKeyFrame, keypoint ) ;
						}
					}
					if ( iCurrentFrame == iFrame )
					{
						fHaveSeeked = true ;
					}
				}
				else if ( recid == *((UINT64*)"SoundStm") )
				{
					//
					// 音声ストリームレコード
					//
					MIO_DATA_HEADER	miodh ;
					m_erif.Read( &miodh, sizeof(MIO_DATA_HEADER) ) ;
					if ( miodh.bytFlags & MIO_LEAD_BLOCK )
					{
						KEY_POINT *	pKeyPoint =
							SearchKeyPoint( m_listKeyWave, iCurrentFrame ) ;
						if ( pKeyPoint == NULL )
						{
							KEY_POINT	keypoint ;
							keypoint.iKeyFrame = iCurrentFrame ;
							keypoint.dwRecOffset = dwRecPosition ;
							AddKeyPoint( m_listKeyWave, keypoint ) ;
						}
					}
					m_erif.AscendRecord( ) ;
				}
				else
				{
					m_erif.AscendRecord( ) ;
				}
			}
			while ( !fHaveSeeked ) ;
		}
	}
}

//
// 指定の音声データまでシークしてストリーミング出力する
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::SeekKeyWave
	( EKeyPointList & list, unsigned int iFrame )
{
	if ( !m_fWaveOutput || !m_fWaveStreaming )
	{
		return ;
	}
	//
	// シークポイントより手間で、最も近いキーポイントを検索する
	//
	int		iFirst, iMiddle, iEnd ;
	KEY_POINT *	pKeyPoint ;
	Lock( ) ;
	iFirst = 0 ;
	iEnd = list.m_count - 1 ;
	for ( ; ; )
	{
		if ( iFirst > iEnd )
		{
			pKeyPoint = &(list.m_list[iEnd]) ;
			break ;
		}
		//
		iMiddle = (iFirst + iEnd) / 2 ;
		pKeyPoint = &(list.m_list[iMiddle]) ;
		//
		if ( pKeyPoint->iKeyFrame == iFrame )
		{
			break ;
		}
		if ( pKeyPoint->iKeyFrame > iFrame )
		{
			iEnd = iMiddle - 1 ;
		}
		else
		{
			iFirst = iMiddle + 1 ;
		}
	}
	Unlock( ) ;
	//
	// ファイルポインタを移動
	//
	DWORD	dwOriginalPointer = m_erif.GetPointer( ) ;
	unsigned int	iCurrentFrame = pKeyPoint->iKeyFrame ;
	m_erif.Seek( pKeyPoint->dwRecOffset ) ;
	//
	// 指定の場所を探す
	//
	do
	{
		//
		// 次のレコードを開く
		//
		DWORD	dwRecPosition = m_erif.GetPointer( ) ;
		if ( !m_erif.DescendRecord( ) )
		{
			m_erif.Seek( 0 ) ;
			break ;
		}
		//
		// レコードの種類を判別
		//
		UINT64	recid = m_erif.GetRecordID( ) ;
		if ( (recid == *((UINT64*)"ImageFrm")) ||
				(recid == *((UINT64*)"DiffeFrm")) )
		{
			//
			// 画像データレコード
			//
			m_erif.AscendRecord( ) ;
			++ iCurrentFrame ;
			if ( IsKeyFrame( iCurrentFrame ) )
			{
				KEY_POINT *	pKeyPoint =
					SearchKeyPoint( m_listKeyFrame, iCurrentFrame ) ;
				if ( pKeyPoint == NULL )
				{
					KEY_POINT	keypoint ;
					keypoint.iKeyFrame = iCurrentFrame ;
					keypoint.dwRecOffset = m_erif.GetPointer( ) ;
					AddKeyPoint( m_listKeyFrame, keypoint ) ;
				}
			}
		}
		else if ( recid == *((UINT64*)"SoundStm") )
		{
			//
			// 音声ストリームレコード
			//
			MIO_DATA_HEADER	miodh ;
			m_erif.Read( &miodh, sizeof(MIO_DATA_HEADER) ) ;
			if ( miodh.bytFlags & MIO_LEAD_BLOCK )
			{
				KEY_POINT *	pKeyPoint =
					SearchKeyPoint( m_listKeyWave, iCurrentFrame ) ;
				if ( pKeyPoint == NULL )
				{
					KEY_POINT	keypoint ;
					keypoint.iKeyFrame = iCurrentFrame ;
					keypoint.dwRecOffset = dwRecPosition ;
					AddKeyPoint( m_listKeyWave, keypoint ) ;
				}
			}
			//
			// 音声ストリーミングモード
			//		→ デコードして出力
			//
			DWORD	dwBytes = miodh.dwSampleCount
						* m_erif.m_MIOInfHdr.dwChannelCount
						* (m_erif.m_MIOInfHdr.dwBitsPerSample / 8) ;
			void *	ptrWaveBuf = AllocateWaveBuffer( dwBytes ) ;
			if ( ptrWaveBuf != NULL )
			{
				if ( !m_pmiod->DecodeSound( *m_pmioc, miodh, ptrWaveBuf ) )
				{
					if ( iCurrentFrame >= iFrame )
					{
						PushWaveBuffer( ptrWaveBuf, dwBytes ) ;
					}
					else
					{
						DeleteWaveBuffer( ptrWaveBuf ) ;
					}
				}
				else
				{
					DeleteWaveBuffer( ptrWaveBuf ) ;
				}
			}
			//
			m_erif.AscendRecord( ) ;
		}
		else
		{
			m_erif.AscendRecord( ) ;
		}
	}
	while ( m_erif.GetPointer() < dwOriginalPointer ) ;
}

//
// 排他処理（クリティカルセクション）
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::Lock( void )
{
	::EnterCriticalSection( &m_cs ) ;
}

void ERIAnimation::Unlock( void )
{
	::LeaveCriticalSection( &m_cs ) ;
}

