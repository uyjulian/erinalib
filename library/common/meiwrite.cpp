
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
typedef	const UINT64 *	PCUINT64 ;


/*****************************************************************************
                  ERIアニメーションファイル出力オブジェクト
 *****************************************************************************/

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
ERIAnimationWriter::EOutputBuffer::EOutputBuffer
			( const BYTE * ptrBuffer, ULONG nBytes )
{
	m_ptrNext = NULL ;
	m_dwBytes = nBytes ;
	m_ptrBuffer = ::eriAllocateMemory( m_dwBytes ) ;
	::memcpy( m_ptrBuffer, ptrBuffer, m_dwBytes ) ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
ERIAnimationWriter::EOutputBuffer::~EOutputBuffer( void )
{
	::eriFreeMemory( m_ptrBuffer ) ;
}

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
ERIAnimationWriter::EEncodeContext::EEncodeContext( void )
	: RLHEncodeContext( 0x10000 )
{
	m_pFirstBuf = NULL ;
	m_pLastBuf = NULL ;
	m_dwTotalBytes = 0 ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
ERIAnimationWriter::EEncodeContext::~EEncodeContext( void )
{
	Delete( ) ;
}

//
// データ消去
//////////////////////////////////////////////////////////////////////////////
void ERIAnimationWriter::EEncodeContext::Delete( void )
{
	EOutputBuffer *	pCurBuf = m_pFirstBuf ;
	while ( pCurBuf != NULL )
	{
		EOutputBuffer *	pNextBuf = pCurBuf->m_ptrNext ;
		delete	pCurBuf ;
		pCurBuf = pNextBuf ;
	}
	m_pFirstBuf = NULL ;
	m_pLastBuf = NULL ;
	m_dwTotalBytes = 0 ;
}

//
// 次のデータを書き出す
//////////////////////////////////////////////////////////////////////////////
ULONG ERIAnimationWriter::EEncodeContext::WriteNextData
					( const BYTE * ptrBuffer, ULONG nBytes )
{
	EOutputBuffer *	pBuffer = new EOutputBuffer( ptrBuffer, nBytes ) ;
	if ( m_pLastBuf != NULL )
	{
		m_pLastBuf->m_ptrNext = pBuffer ;
		m_pLastBuf = pBuffer ;
	}
	else
	{
		m_pLastBuf = m_pFirstBuf = pBuffer ;
	}
	m_dwTotalBytes += nBytes ;

	return	nBytes ;
}

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
ERIAnimationWriter::ERIAnimationWriter( void )
{
	m_wsStatus = wsNotOpened ;
	m_perie1 = NULL ;
	m_perie2 = NULL ;
	m_pmioc = NULL ;
	m_pmioe = NULL ;
	m_priiLast = NULL ;
	m_priiBuf = NULL ;
	m_fDualEncoding = false ;
	m_hCompressed = NULL ;
	m_hThread = NULL ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
ERIAnimationWriter::~ERIAnimationWriter( void )
{
	Close( ) ;
}

//
// ファイルを開く
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::Open
	( EWriteFileObj * pFile, ERIWriteFile::FileID fidType )
{
	//
	// 既にファイルを開いている場合には閉じる
	Close( ) ;
	//
	// ERI ファイルを開く
	if ( !m_eriwf.Open( pFile, fidType ) )
	{
		return	false ;
	}
	//
	// 成功
	m_wsStatus = wsOpened ;

	return	true ;
}

//
// ファイルを閉じる
//////////////////////////////////////////////////////////////////////////////
void ERIAnimationWriter::Close( void )
{
	//
	// レコードを閉じる
	if ( m_wsStatus == wsWritingStream )
	{
		EndFileHeader( ) ;
	}
	else if ( m_wsStatus == wsWritingHeader )
	{
		EndStream( 0 ) ;
	}
	//
	// スレッド終了
	if ( m_hThread != NULL )
	{
		::PostThreadMessage( m_idThread, tmQuit, 0, 0 ) ;
		::WaitForSingleObject( m_hThread, INFINITE ) ;
		::CloseHandle( m_hThread ) ;
		m_hThread = NULL ;
	}
	if ( m_hCompressed != NULL )
	{
		::CloseHandle( m_hCompressed ) ;
		m_hCompressed = NULL ;
	}
	if ( m_perie1 != NULL )
	{
		delete	m_perie1 ;
		m_perie1->Delete( ) ;
		m_perie1 = NULL ;
	}
	if ( m_perie2 != NULL )
	{
		delete	m_perie2 ;
		m_perie2->Delete( ) ;
		m_perie2 = NULL ;
	}
	if ( m_pmioc != NULL )
	{
		delete	m_pmioc ;
		m_pmioc = NULL ;
	}
	if ( m_pmioe != NULL )
	{
		m_pmioe->Delete( ) ;
		delete	m_pmioe ;
		m_pmioe = NULL ;
	}
	if ( m_priiLast != NULL )
	{
		DeleteImageBuffer( m_priiLast ) ;
		m_priiLast = NULL ;
	}
	if ( m_priiBuf != NULL )
	{
		DeleteImageBuffer( m_priiBuf ) ;
		m_priiBuf = NULL ;
	}
	//
	// ファイルを閉じる
	if ( m_wsStatus != wsNotOpened )
	{
		m_eriwf.Close( ) ;
		m_wsStatus = wsNotOpened ;
	}
}

//
// ファイルヘッダを開く
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::BeginFileHeader( DWORD dwKeyFrame, DWORD dwKeyWave )
{
	//
	// パラメータの検証と設定
	if ( m_wsStatus != wsOpened )
	{
		return	false ;
	}
	m_dwKeyFrame = dwKeyFrame ;
	m_dwKeyWave = dwKeyWave ;
	//
	// ヘッダレコードを開く
	if ( !m_eriwf.DescendRecord( (PCUINT64)"Header  " ) )
	{
		return	false ;
	}
	//
	// ファイルヘッダを書き出す（ダミー出力）
	if ( !m_eriwf.DescendRecord( (PCUINT64)"FileHdr " ) )
	{
		return	false ;
	}
	m_efh.dwVersion = 0x00020100 ;
	m_efh.dwContainedFlag = 0 ;
	m_efh.dwKeyFrameCount = dwKeyFrame ;
	m_efh.dwFrameCount = 0 ;
	m_efh.dwAllFrameTime = 0 ;
	m_eriwf.Write( &m_efh, sizeof(m_efh) ) ;
	m_eriwf.AscendRecord( ) ;
	//
	m_dwMioHeaderPos = 0 ;
	m_dwOutputWaveSamples = 0 ;
	//
	// 成功
	m_wsStatus = wsWritingHeader ;

	return	true ;
}

//
// プレビュー画像情報ヘッダを書き出す
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::WritePreviewInfo( const ERI_INFO_HEADER & eih )
{
	if ( m_wsStatus != wsWritingHeader )
	{
		return	false ;
	}
	if ( !m_eriwf.DescendRecord( (PCUINT64)"PrevwInf" ) )
	{
		return	false ;
	}
	m_prvwih = eih ;
	m_eriwf.Write( &m_prvwih, sizeof(m_prvwih) ) ;
	m_eriwf.AscendRecord( ) ;

	return	true ;
}

//
// 画像情報ヘッダを書き出す
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::WriteEriInfoHeader( const ERI_INFO_HEADER & eih )
{
	if ( m_wsStatus != wsWritingHeader )
	{
		return	false ;
	}
	if ( !m_eriwf.DescendRecord( (PCUINT64)"ImageInf" ) )
	{
		return	false ;
	}
	m_eih = eih ;
	m_eriwf.Write( &m_eih, sizeof(m_eih) ) ;
	m_eriwf.AscendRecord( ) ;
	//
	m_efh.dwContainedFlag |= EFH_CONTAIN_IMAGE ;

	return	true ;
}

//
// 音声情報ヘッダを書き出す
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::WriteMioInfoHeader( const MIO_INFO_HEADER & mih )
{
	if ( m_wsStatus != wsWritingHeader )
	{
		return	false ;
	}
	m_dwMioHeaderPos = m_eriwf.GetPointer( ) ;
	//
	if ( !m_eriwf.DescendRecord( (PCUINT64)"SoundInf" ) )
	{
		return	false ;
	}
	m_mih = mih ;
	m_eriwf.Write( &m_mih, sizeof(m_mih) ) ;
	m_eriwf.AscendRecord( ) ;
	//
	m_efh.dwContainedFlag |= EFH_CONTAIN_WAVE ;

	return	true ;
}

//
// 著作権情報を書き出す
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::WriteCopyright
	( const void * ptrCopyright, DWORD dwBytes )
{
	if ( m_wsStatus != wsWritingHeader )
	{
		return	false ;
	}
	if ( !m_eriwf.DescendRecord( (PCUINT64)"cpyright" ) )
	{
		return	false ;
	}
	m_eriwf.Write( ptrCopyright, dwBytes ) ;
	m_eriwf.AscendRecord( ) ;

	return	true ;
}

//
// コメントを書き出す
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::WriteDescription
	( const void * ptrDescription, DWORD dwBytes )
{
	if ( m_wsStatus != wsWritingHeader )
	{
		return	false ;
	}
	if ( !m_eriwf.DescendRecord( (PCUINT64)"descript" ) )
	{
		return	false ;
	}
	m_eriwf.Write( ptrDescription, dwBytes ) ;
	m_eriwf.AscendRecord( ) ;

	return	true ;
}

//
// ファイルヘッダを閉じる
//////////////////////////////////////////////////////////////////////////////
void ERIAnimationWriter::EndFileHeader( void )
{
	if ( m_wsStatus == wsWritingHeader )
	{
		m_dwHeaderBytes = m_eriwf.GetPointer( ) ;
		m_eriwf.AscendRecord( ) ;
		m_wsStatus = wsOpened ;
	}
}

//
// ストリームを開始する
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::BeginStream( void )
{
	//
	// ステータスチェック
	if ( m_wsStatus != wsOpened )
	{
		return	false ;
	}
	//
	// パラメータ初期化
	m_dwFrameCount = 0 ;
	m_dwWaveCount = 0 ;
	//
	// 圧縮オブジェクト初期化
	if ( m_efh.dwContainedFlag & EFH_CONTAIN_IMAGE )
	{
		m_perie1 = CreateERIEncoder( ) ;
		m_perie2 = CreateERIEncoder( ) ;
		if ( m_perie1->Initialize( m_eih ) || m_perie2->Initialize( m_eih ) )
		{
			return	false ;
		}
		m_perie1->SetCompressionParameter( m_eriep ) ;
		m_perie2->SetCompressionParameter( m_eriep ) ;
	}
	if ( m_efh.dwContainedFlag & EFH_CONTAIN_WAVE )
	{
		m_pmioc = new EFileEncodeContext( &m_eriwf, 0x10000 ) ;
		m_pmioe = CreateMIOEncoder( ) ;
		if ( m_pmioe->Initialize( m_mih ) )
		{
			return	false ;
		}
		m_pmioe->SetCompressionParameter( m_mioep ) ;
	}
	//
	// 差分処理用バッファ生成
	if ( m_efh.dwContainedFlag & EFH_CONTAIN_IMAGE )
	{
		m_priiLast = CreateImageBuffer( m_eih ) ;
		m_priiBuf = CreateImageBuffer( m_eih ) ;
	}
	//
	// 圧縮スレッド準備
	m_hCompressed = ::CreateEvent( NULL, TRUE, FALSE, NULL ) ;
	if ( m_hCompressed == NULL )
	{
		return	false ;
	}
	m_hThread = ::CreateThread
		( NULL, 0, &ERIAnimationWriter::ThreadProc, this, 0, &m_idThread ) ;
	if ( m_hThread == NULL )
	{
		return	false ;
	}
	HANDLE	hEventList[2] ;
	hEventList[0] = m_hThread ;
	hEventList[1] = m_hCompressed ;
	DWORD	dwWaitResult =
		::WaitForMultipleObjects( 2, hEventList, FALSE, INFINITE ) ;
	if ( dwWaitResult == WAIT_OBJECT_0 )
	{
		::CloseHandle( m_hCompressed ) ;
		m_hThread = NULL ;
		m_hCompressed = NULL ;
		return	false ;
	}
	m_wsStatus = wsWritingStream ;
	//
	// ストリームレコードを開く
	if ( !m_eriwf.DescendRecord( (PCUINT64)"Stream  " ) )
	{
		EndStream( 0 ) ;
		return	false ;
	}

	return	true ;
}

//
// 画像の圧縮パラメータを設定する
//////////////////////////////////////////////////////////////////////////////
void ERIAnimationWriter::SetImageCompressionParameter
	( const ERIEncoder::PARAMETER & eriep )
{
	m_eriep = eriep ;
	//
	if ( m_perie1 != NULL )
		m_perie1->SetCompressionParameter( eriep ) ;
	if ( m_perie2 != NULL )
		m_perie2->SetCompressionParameter( eriep ) ;
}

//
// 音声の圧縮パラメータを設定する
//////////////////////////////////////////////////////////////////////////////
void ERIAnimationWriter::SetSoundCompressionParameter
	( const MIOEncoder::PARAMETER & mioep )
{
	m_mioep = mioep ;
	//
	if ( m_pmioe != NULL )
		m_pmioe->SetCompressionParameter( mioep ) ;
}

//
// パレットテーブルを書き出す
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::WritePaletteTable
	( const ENTIS_PALETTE * paltbl, unsigned int nLength )
{
	if ( m_wsStatus != wsWritingStream )
	{
		return	false ;
	}
	if ( !m_eriwf.DescendRecord( (PCUINT64)"Palette " ) )
	{
		return	false ;
	}
	m_eriwf.Write( paltbl, nLength * sizeof(ENTIS_PALETTE) ) ;
	m_eriwf.AscendRecord( ) ;
	//
	m_efh.dwContainedFlag |= EFH_CONTAIN_PALETTE ;

	return	true ;
}

//
// プレビュー画像を出力する
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::WritePreviewData
	( const RASTER_IMAGE_INFO & rii, DWORD fdwFlags )
{
	if ( m_wsStatus != wsWritingStream )
	{
		return	false ;
	}
	if ( !m_eriwf.DescendRecord( (PCUINT64)"Preview " ) )
	{
		return	false ;
	}
	//
	// 画像圧縮
	//
	bool	fSuccessed = false ;
	do
	{
		EFileEncodeContext	context( &m_eriwf, 0x10000 ) ;
		ERIEncoder			encoder ;
		//
		if ( encoder.Initialize( m_prvwih ) )
		{
			break ;
		}
		if ( encoder.EncodeImage( rii, context, fdwFlags ) )
		{
			break ;
		}
		//
		fSuccessed = true ;
	}
	while ( false ) ;
	//
	m_eriwf.AscendRecord( ) ;

	return	fSuccessed ;
}

//
// 音声データを出力する
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::WriteWaveData
	( const void * ptrWaveBuf, DWORD dwSampleCount )
{
	if ( m_wsStatus != wsWritingStream )
	{
		return	false ;
	}
	if ( !m_eriwf.DescendRecord( (PCUINT64)"SoundStm" ) )
	{
		return	false ;
	}
	//
	// 音声圧縮
	//
	bool	fSuccessed = false ;
	MIO_DATA_HEADER	miodh ;
	miodh.bytVersion = 1 ;
	miodh.bytFlags = 0 ;
	miodh.bytReserved1 = 0 ;
	miodh.bytReserved2 = 0 ;
	miodh.dwSampleCount = dwSampleCount ;
	if ( ((m_dwKeyWave == 0) && (m_dwWaveCount == 0))
				|| (m_dwWaveCount % m_dwKeyWave) == 0 )
	{
		miodh.bytFlags = MIO_LEAD_BLOCK ;
	}
	if ( m_eriwf.Write( &miodh, sizeof(miodh) ) == sizeof(miodh) )
	{
		if ( !m_pmioe->EncodeSound( *m_pmioc, miodh, ptrWaveBuf ) )
		{
			++ m_dwWaveCount ;
			m_dwOutputWaveSamples += dwSampleCount ;
			fSuccessed = true ;
		}
	}
	//
	m_eriwf.AscendRecord( ) ;

	return	fSuccessed ;
}

//
// 画像データを出力する
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::WriteImageData
	( const RASTER_IMAGE_INFO & rii, DWORD fdwFlags )
{
	if ( m_wsStatus != wsWritingStream )
	{
		return	false ;
	}
	//
	// キーフレームかどうかを判定
	bool	fKeyFrame =
		((m_dwKeyFrame == 0) && (m_dwFrameCount == 0))
			|| ((m_dwFrameCount % m_dwKeyFrame) == 0) ;
	//
	// 差分処理フレームを圧縮
	if ( !fKeyFrame )
	{
		//
		// 差分処理
		::eriCopyImage( *m_priiBuf, rii ) ;
		::eriSubtractionOfFrame( *m_priiBuf, *m_priiLast ) ;
		//
		// 圧縮開始
		m_eric2.Delete( ) ;
		if ( m_fDualEncoding )
		{
			::ResetEvent( m_hCompressed ) ;
			::PostThreadMessage
				( m_idThread, tmEncodeImage, fdwFlags, (LPARAM) m_priiBuf ) ;
		}
		else
		{
			//
			// シングルスレッド処理の場合にはここで圧縮
			if ( m_perie2->EncodeImage( *m_priiBuf, m_eric2, fdwFlags ) )
			{
				return	false ;
			}
		}
	}
	//
	// 非差分処理フレームを圧縮
	m_eric1.Delete( ) ;
	bool	fSuccessed =
		!m_perie1->EncodeImage( rii, m_eric1, fdwFlags ) ;
	//
	// デュアルスレッド圧縮モードの時は、一方の圧縮が終了するのを待つ
	if ( m_fDualEncoding && !fKeyFrame )
	{
		HANDLE	hEventList[2] ;
		hEventList[0] = m_hThread ;
		hEventList[1] = m_hCompressed ;
		DWORD	dwWaitResult =
			::WaitForMultipleObjects( 2, hEventList, FALSE, INFINITE ) ;
		//
		if ( (dwWaitResult == WAIT_OBJECT_0) || !m_fCompressSuccessed )
		{
			fSuccessed = false ;
		}
	}
	if ( !fSuccessed )
	{
		return	false ;
	}
	//
	// フレームを１進める
	++ m_dwFrameCount ;
	::eriCopyImage( *m_priiLast, rii ) ;
	//
	// 圧縮されたデータを取得する
	EEncodeContext *	pEncodedData ;
	PCUINT64			pRecID ;
	//
	if ( fKeyFrame )
	{
		pEncodedData = &m_eric1 ;
		pRecID = (PCUINT64)"ImageFrm" ;
	}
	else
	{
		if ( m_eric1.m_dwTotalBytes < m_eric2.m_dwTotalBytes )
		{
			pEncodedData = &m_eric1 ;
			pRecID = (PCUINT64)"ImageFrm" ;
		}
		else
		{
			pEncodedData = &m_eric2 ;
			pRecID = (PCUINT64)"DiffeFrm" ;
		}
	}
	//
	// データを書き出す
	if ( !m_eriwf.DescendRecord( pRecID ) )
	{
		return	false ;
	}
	//
	EOutputBuffer *	pNextBuf = pEncodedData->m_pFirstBuf ;
	while ( pNextBuf != NULL )
	{
		m_eriwf.Write( pNextBuf->m_ptrBuffer, pNextBuf->m_dwBytes ) ;
		pNextBuf = pNextBuf->m_ptrNext ;
	}
	//
	m_eriwf.AscendRecord( ) ;
	//
	// 出力バッファを破棄する
	m_eric1.Delete( ) ;
	//
	if ( !fKeyFrame )
	{
		m_eric2.Delete( ) ;
	}

	return	fSuccessed ;
}

//
// ストリームを閉じる
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::EndStream( DWORD dwTotalTime )
{
	if ( m_wsStatus != wsWritingStream )
	{
		return	false ;
	}
	//
	// スレッドを終了
	if ( m_hThread != NULL )
	{
		::PostThreadMessage( m_idThread, tmQuit, 0, 0 ) ;
		::WaitForSingleObject( m_hThread, INFINITE ) ;
		::CloseHandle( m_hThread ) ;
		m_hThread = NULL ;
	}
	if ( m_hCompressed != NULL )
	{
		::CloseHandle( m_hCompressed ) ;
		m_hCompressed = NULL ;
	}
	//
	// 圧縮オブジェクトの利用しているリソースを破棄
	if ( m_efh.dwContainedFlag & EFH_CONTAIN_IMAGE )
	{
		m_eric1.Delete( ) ;
		m_eric2.Delete( ) ;
		m_perie1->Delete( ) ;
		m_perie2->Delete( ) ;
	}
	if ( m_pmioc != NULL )
	{
		delete	m_pmioc ;
		m_pmioc = NULL ;
	}
	//
	// バッファを削除
	if ( m_priiLast != NULL )
	{
		DeleteImageBuffer( m_priiLast ) ;
		m_priiLast = NULL ;
	}
	if ( m_priiBuf != NULL )
	{
		DeleteImageBuffer( m_priiBuf ) ;
		m_priiBuf = NULL ;
	}
	//
	// ストリームレコードを閉じる
	m_eriwf.AscendRecord( ) ;
	m_wsStatus = wsOpened ;
	//
	// ファイルヘッダを再出力
	m_eriwf.Seek( 0 ) ;
	//
	if ( !m_eriwf.DescendRecord( (PCUINT64)"Header  " )
		|| !m_eriwf.DescendRecord( (PCUINT64)"FileHdr " ) )
	{
		return	false ;
	}
	m_efh.dwFrameCount = m_dwFrameCount ;
	m_efh.dwAllFrameTime = dwTotalTime ;
	m_eriwf.Write( &m_efh, sizeof(m_efh) ) ;
	m_eriwf.AscendRecord( ) ;
	//
	// 音声情報ヘッダを再出力
	if ( m_efh.dwContainedFlag & EFH_CONTAIN_WAVE )
	{
		m_eriwf.Seek( m_dwMioHeaderPos ) ;
		m_eriwf.DescendRecord( (PCUINT64)"SoundInf" ) ;
		m_mih.dwAllSampleCount = m_dwOutputWaveSamples ;
		m_eriwf.Write( &m_mih, sizeof(m_mih) ) ;
		m_eriwf.AscendRecord( ) ;
	}
	//
	m_eriwf.Seek( m_dwHeaderBytes ) ;
	m_eriwf.AscendRecord( ) ;

	return	true ;
}

//
// 画像バッファを生成
//////////////////////////////////////////////////////////////////////////////
RASTER_IMAGE_INFO *
	 ERIAnimationWriter::CreateImageBuffer( const ERI_INFO_HEADER & eih )
{
	//
	// RASTER_IMAGE_INFO 構造体メモリを確保
	RASTER_IMAGE_INFO *	prii = new RASTER_IMAGE_INFO ;
	//
	// パラメータコピー
	prii->fdwFormatType = eih.fdwFormatType ;
	prii->nImageWidth = eih.nImageWidth ;
	prii->nImageHeight =
		(eih.nImageHeight < 0) ? - eih.nImageHeight : eih.nImageHeight ;
	prii->dwBitsPerPixel = eih.dwBitsPerPixel ;
	prii->BytesPerLine =
		((prii->nImageWidth * prii->dwBitsPerPixel / 8) + 0x03) & ~0x03 ;
	//
	// 画像バッファのメモリを確保
	prii->ptrImageArray = (PBYTE)
		::eriAllocateMemory( prii->BytesPerLine * prii->nImageHeight ) ;

	return	prii ;
}

//
// 画像バッファを消去
//////////////////////////////////////////////////////////////////////////////
void ERIAnimationWriter::DeleteImageBuffer( RASTER_IMAGE_INFO * prii )
{
	if ( prii != NULL )
	{
		::eriFreeMemory( prii->ptrImageArray ) ;
		delete	prii ;
	}
}

//
// 画像圧縮オブジェクトを生成
//////////////////////////////////////////////////////////////////////////////
ERIEncoder * ERIAnimationWriter::CreateERIEncoder( void )
{
	return	new ERIEncoder ;
}

//
// 音声圧縮オブジェクトを生成
//////////////////////////////////////////////////////////////////////////////
MIOEncoder * ERIAnimationWriter::CreateMIOEncoder( void )
{
	return	new MIOEncoder ;
}

//
// 出力された画像の枚数を取得する
//////////////////////////////////////////////////////////////////////////////
DWORD ERIAnimationWriter::GetWrittenFrameCount( void ) const
{
	return	m_dwFrameCount ;
}

//
// マルチスレッド圧縮を有効化
//////////////////////////////////////////////////////////////////////////////
void ERIAnimationWriter::EnableDualEncoding( bool fDualEncoding )
{
	m_fDualEncoding = fDualEncoding ;
}

//
// スレッド関数
//////////////////////////////////////////////////////////////////////////////
DWORD WINAPI ERIAnimationWriter::ThreadProc( LPVOID parameter )
{
	return	((ERIAnimationWriter*)parameter)->EncodingThreadProc( ) ;
}

DWORD ERIAnimationWriter::EncodingThreadProc( void )
{
	::eriInitializeTask( ) ;
	//
	// メッセージキューを生成
	//
	MSG		msg ;
	::PeekMessage( &msg, NULL, 0, 0, PM_NOREMOVE ) ;
	m_fCompressSuccessed = false ;
	::SetEvent( m_hCompressed ) ;
	//
	while ( ::GetMessage( &msg, NULL, 0, 0 ) )
	{
		if ( msg.message == tmEncodeImage )
		{
			//
			// 画像を圧縮
			//
			RASTER_IMAGE_INFO *	prii = (RASTER_IMAGE_INFO*) msg.lParam ;
			DWORD				fdwFlags = msg.wParam ;
			//
			m_fCompressSuccessed =
				!m_perie2->EncodeImage( *prii, m_eric2, fdwFlags ) ;
			//
			::SetEvent( m_hCompressed ) ;
		}
		else if ( msg.message == tmQuit )
		{
			break ;
		}
	}
	//
	::eriCloseTask( ) ;

	return	0 ;
}

