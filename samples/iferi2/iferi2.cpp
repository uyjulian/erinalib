
/*****************************************************************************
                      恵理ちゃん展開 Susie プラグイン
 ----------------------------------------------------------------------------
           Copyright (C) 2001 Leshade Entis. All rights reserved.
 *****************************************************************************/


#include "iferi2.h"


//////////////////////////////////////////////////////////////////////////////
// ライブラリ初期化
//////////////////////////////////////////////////////////////////////////////

BOOL WINAPI main
(
	HINSTANCE	hinstDLL,		// handle to DLL module 
	DWORD		fdwReason,		// reason for calling function 
	LPVOID		lpvReserved		// reserved
)
{
	switch ( fdwReason )
	{
	case	DLL_PROCESS_ATTACH:
		::eriInitializeLibrary( ) ;
		return	TRUE ;

	case	DLL_PROCESS_DETACH:
		::eriCloseLibrary( ) ;
		break ;

	case	DLL_THREAD_ATTACH:
		::eriInitializeTask( ) ;
		break ;

	case	DLL_THREAD_DETACH:
		::eriCloseTask( ) ;
		break ;
	}

	return	FALSE ;
}


//////////////////////////////////////////////////////////////////////////////
// データ入力インターフェース
//////////////////////////////////////////////////////////////////////////////

//
// 構築関数
ERIInputContext::ERIInputContext( ULONG nBufferingSize )
	: RLHDecodeContext( nBufferingSize )
{
}

//
// 次のデータを読み込む
ULONG ERIInputContext::ReadNextData( PBYTE ptrBuffer, ULONG nBytes )
{
	return	m_pFile->Read( ptrBuffer, nBytes ) ;
}


//////////////////////////////////////////////////////////////////////////////
// 展開オブジェクト
//////////////////////////////////////////////////////////////////////////////

//
// 展開進行状況通知関数
int MyERIDecoder::OnDecodedBlock( LONG line, LONG column )
{
	if ( m_pfnPrgCallback != NULL )
	{
		int	nTotalPrg = m_nWidthBlocks * m_nHeightBlocks - 1 ;
		int	nCurPrg = line * m_nWidthBlocks + column ;
		int	nCurRatio = ::MulDiv( nCurPrg, 100, nTotalPrg ) ;
		if ( nCurRatio != m_nLastRatio )
		{
			m_nLastRatio = nCurRatio ;
			return	(*m_pfnPrgCallback)( nCurPrg, nTotalPrg, m_nInstance ) ;
		}
	}
	return	0 ;
}

int MyERIDecoder::OnDecodedLine( LONG line )
{
	if ( m_pfnPrgCallback != NULL )
	{
		SDWORD	nImageHeight = m_EriInfHdr.nImageHeight ;
		if ( nImageHeight < 0 )
		{
			nImageHeight = - nImageHeight ;
		}
		int	nTotalPrg = nImageHeight - 1 ;
		int	nCurRatio = ::MulDiv( line, 100, nTotalPrg ) ;
		if ( nCurRatio != m_nLastRatio )
		{
			m_nLastRatio = nCurRatio ;
			return	(*m_pfnPrgCallback)( line, nTotalPrg, m_nInstance ) ;
		}
	}
	return	0 ;
}


//////////////////////////////////////////////////////////////////////////////
// エクスポート関数
//////////////////////////////////////////////////////////////////////////////

//
// プラグインの情報を取得
int PASCAL GetPluginInfo( int infono, LPSTR buf, int buflen )
{
	if ( infono == 0 )
	{
		//
		// バージョン番号
		static const char	szVersionNo[] = "00IN";
		size_t	nLength = min( sizeof(szVersionNo), buflen );
		::memcpy( buf, szVersionNo, nLength );
		return	4;
	}
	else if ( infono == 1 )
	{
		//
		// プラグイン情報
		static const char	szPlugInInf[] =
			"恵理ちゃんデコーダー (C) Leshade Entis";
		size_t	nLength = min( sizeof(szPlugInInf), buflen );
		::memcpy( buf, szPlugInInf, nLength );
		return	nLength;
	}
	else if ( infono == 2 )
	{
		//
		// 拡張子
		static const char	szDefExt[] = "*.eri";
		size_t	nLength = min( sizeof(szDefExt), buflen );
		::memcpy( buf, szDefExt, nLength );
		return	nLength;
	}
	else if ( infono == 3 )
	{
		//
		// ファイルの形式名
		static const char	szFormatName[] = "ERI-chan file (*.eri)";
		size_t	nLength = min( sizeof(szFormatName), buflen );
		::memcpy( buf, szFormatName, nLength );
		return	nLength;
	}
	//
	return	0;
}

//
// 展開可能なファイルかどうかを調べる
int PASCAL IsSupported( LPSTR filename, DWORD dw )
{
	int	fSupported = 0 ;
	EFileObject *	pfile = NULL ;
	do
	{
		//
		// ファイルを開く
		if ( !(dw & 0xFFFF0000) )
		{
			pfile = new EReadFile( (HANDLE)dw ) ;
		}
		else
		{
			pfile = new EMemFile( (PBYTE)dw, 2048 ) ;
		}
		ERIFile	erifile ;
		if ( !erifile.Open( pfile, ERIFile::otReadHeader ) )
			break ;
		fSupported = 1 ;
	}
	while ( false ) ;
	//
	delete	pfile ;
	//
	return	fSupported ;
}

//
// 画像情報を取得する
int PASCAL GetPictureInfo
	( LPSTR buf, long len, unsigned int flag, PictureInfo *lpInfo )
{
	int	nResult = 2 ;
	EFileObject *	pfile = NULL ;
	do
	{
		//
		// ファイルを開く
		if ( (flag & 0x07) == 0 )
		{
			pfile = new EReadFile ;
			if ( !((EReadFile*)pfile)->Open( buf ) )
				break ;
			pfile->Seek( len ) ;
		}
		else
		{
			pfile = new EMemFile( (PBYTE)buf, len ) ;
		}
		ERIFile	erifile ;
		if ( !erifile.Open( pfile, ERIFile::otReadHeader ) )
			break ;
		//
		// 画像の情報を設定する
		lpInfo->left = 0 ;
		lpInfo->top = 0 ;
		lpInfo->width = erifile.m_InfoHeader.nImageWidth ;
		if ( erifile.m_InfoHeader.nImageHeight > 0 )
			lpInfo->height = erifile.m_InfoHeader.nImageHeight ;
		else
			lpInfo->height = - erifile.m_InfoHeader.nImageHeight ;
		lpInfo->x_density = 0 ;
		lpInfo->y_density = 0 ;
		lpInfo->colorDepth = (short int) erifile.m_InfoHeader.dwBitsPerPixel ;
		lpInfo->hInfo = NULL ;
		//
		if ( (erifile.m_strCopyright.GetLength() != 0) ||
				(erifile.m_strDescription.GetLength() != 0) )
		{
			int	nDescriptionLength = erifile.m_strDescription.GetLength( ) ;
			int	nCopyrightLength = erifile.m_strCopyright.GetLength( ) ;
			char *	pszInfo = (char*)
				::LocalAlloc( LMEM_FIXED,
					nCopyrightLength + nDescriptionLength + 3 ) ;
			if ( pszInfo == NULL )
			{
				nResult = 4 ;
				break ;
			}
			if ( nDescriptionLength > 0 )
			{
				::memcpy
					(
						pszInfo,
						erifile.m_strDescription.CharPtr( ),
						nDescriptionLength
					) ;
			}
			if ( nCopyrightLength > 0 )
			{
				if ( nDescriptionLength > 0 )
				{
					::memcpy( pszInfo + nDescriptionLength, "\n\n", 2 ) ;
					nDescriptionLength += 2 ;
				}
				::memcpy
					(
						pszInfo + nDescriptionLength,
						erifile.m_strCopyright.CharPtr( ),
						nCopyrightLength
					) ;
			}
			pszInfo[nDescriptionLength+nCopyrightLength] = '\0' ;
			//
			lpInfo->hInfo = (HLOCAL) pszInfo;
		}
		//
		nResult = 0 ;
	}
	while ( false ) ;
	//
	delete	pfile ;
	//
	return	nResult ;
}

//
// 画像を展開する
int PASCAL GetPicture
(
	LPSTR buf, long len, unsigned int flag,
	HANDLE * pHBInfo, HANDLE * pHBm,
	PFUNC_PROGRESSCALLBACK lpPrgressCallback, long lData
)
{
	int	nResult = 2 ;
	EFileObject *	pfile = NULL ;
	do
	{
		//
		// ファイルを開く
		if ( (flag & 0x07) == 0 )
		{
			pfile = new EReadFile ;
			if ( !((EReadFile*)pfile)->Open( buf ) )
				break ;
			pfile->Seek( len ) ;
		}
		else
		{
			pfile = new EMemFile( (PBYTE)buf, len ) ;
		}
		ERIFile	erifile ;
		if ( !erifile.Open( pfile ) )
			break ;
		//
		// 画像の展開の準備をする
		RASTER_IMAGE_INFO	rii ;
		rii.fdwFormatType = erifile.m_InfoHeader.fdwFormatType ;
		rii.nImageWidth = erifile.m_InfoHeader.nImageWidth ;
		rii.nImageHeight = erifile.m_InfoHeader.nImageHeight ;
		if ( rii.nImageHeight < 0 )
			rii.nImageHeight = - rii.nImageHeight ;
		rii.dwBitsPerPixel = erifile.m_InfoHeader.dwBitsPerPixel ;
		rii.BytesPerLine =
			((rii.nImageWidth * rii.dwBitsPerPixel >> 3) + 0x03) & ~0x03 ;
		rii.ptrImageArray =
			(PBYTE) ::LocalAlloc
				( (LMEM_FIXED | LMEM_ZEROINIT),
					rii.BytesPerLine * rii.nImageHeight ) ;
		if ( rii.ptrImageArray == NULL )
		{
			nResult = 4 ;
			break ;
		}
		//
		// 入出力インターフェースをセットアップする
		ERIInputContext	eic( 0x10000 ) ;
		eic.m_pFile = &erifile ;
		MyERIDecoder	myed ;
		if ( myed.Initialize( erifile.m_InfoHeader ) )
			break ;
		myed.m_pfnPrgCallback = lpPrgressCallback ;
		myed.m_nInstance = lData ;
		myed.m_nLastRatio = -1 ;
		//
		// デコード開始
		if ( myed.DecodeImage( rii, eic, false ) )
			break ;
		//
		// 展開した画像を呼び出し元に渡す
		//
		*pHBm = (HANDLE) rii.ptrImageArray ;
		//
		unsigned int	nBMInfSize = sizeof(BITMAPINFOHEADER);
		if ( rii.dwBitsPerPixel == 8 )
			nBMInfSize += sizeof(RGBQUAD) * 0x100 ;
		BITMAPINFOHEADER *	pbmih =
			(BITMAPINFOHEADER*) ::LocalAlloc
				( (LMEM_FIXED | LMEM_ZEROINIT), nBMInfSize ) ;
		if ( pbmih == NULL )
		{
			nResult = 4 ;
			break ;
		}
		//
		pbmih->biSize = sizeof(BITMAPINFOHEADER) ;
		pbmih->biWidth = rii.nImageWidth ;
		pbmih->biHeight = rii.nImageHeight ;
		pbmih->biPlanes = 1 ;
		pbmih->biBitCount = (WORD) rii.dwBitsPerPixel ;
		pbmih->biCompression = BI_RGB ;
		pbmih->biSizeImage = rii.BytesPerLine * rii.nImageHeight ;
		//
		if ( pbmih->biBitCount == 8 )
		{
			BITMAPINFO *	pbmi = (BITMAPINFO*) pbmih ;
			if ( erifile.m_InfoHeader.fdwFormatType == ERI_GRAY_IMAGE )
			{
				for ( int i = 0; i < 0x100; i ++ )
				{
					pbmi->bmiColors[i].rgbRed      = i ;
					pbmi->bmiColors[i].rgbGreen    = i ;
					pbmi->bmiColors[i].rgbBlue     = i ;
					pbmi->bmiColors[i].rgbReserved = 0 ;
				}
			}
			else
			{
				::memcpy( pbmi->bmiColors,
						erifile.m_PaletteTable, sizeof(RGBQUAD) * 0x100 ) ;
			}
		}
		//
		*pHBInfo = (HANDLE) pbmih ;
		//
		nResult = 0 ;
	}
	while ( false ) ;
	//
	delete	pfile ;
	//
	return	nResult ;
}

//
// プレビュー表示画像展開ルーチン
int PASCAL GetPreview
(
	LPSTR buf, long len, unsigned int flag,
	HANDLE * pHBInfo, HANDLE * pHBm,
	PFUNC_PROGRESSCALLBACK lpPrgressCallback, long lData
)
{
	typedef	const UINT64 *	PCUINT64 ;
	int	nResult = 2 ;
	EFileObject *	pfile = NULL ;
	do
	{
		//
		// ファイルを開く
		if ( (flag & 0x07) == 0 )
		{
			pfile = new EReadFile ;
			if ( !((EReadFile*)pfile)->Open( buf ) )
				break ;
			pfile->Seek( len ) ;
		}
		else
		{
			pfile = new EMemFile( (PBYTE)buf, len ) ;
		}
		ERIFile	erifile ;
		if ( !erifile.Open( pfile, ERIFile::otOpenStream ) )
			break ;
		//
		ERI_INFO_HEADER *	peih = NULL ;
		bool	fOpenImageFrm = false ;
		for ( ; ; )
		{
			if ( !erifile.DescendRecord( ) )
				break ;
			//
			UINT64	ui64RecID = erifile.GetRecordID( ) ;
			if ( ui64RecID == *((PCUINT64)"Palette ") )
			{
				//
				// パレットテーブルを読み込む
				::memset( erifile.m_PaletteTable,
							0, sizeof(erifile.m_PaletteTable) ) ;
				erifile.Read( erifile.m_PaletteTable,
							sizeof(erifile.m_PaletteTable) ) ;
			}
			else if ( (erifile.m_fdwReadMask & ERIFile::rmPreviewInfo)
						&& (ui64RecID == *((PCUINT64)"Preview ")) )
			{
				//
				// プレビュー画像を展開へ
				fOpenImageFrm = true ;
				peih = &(erifile.m_PreviewInfo) ;
				break ;
			}
			else if ( ui64RecID == *((PCUINT64)"ImageFrm") )
			{
				//
				// 画像を展開へ
				fOpenImageFrm = true ;
				peih = &(erifile.m_InfoHeader) ;
				break ;
			}
			//
			erifile.AscendRecord( ) ;
		}
		if ( !fOpenImageFrm )
			break ;
		//
		// 画像の展開の準備をする
		RASTER_IMAGE_INFO	rii ;
		rii.fdwFormatType = peih->fdwFormatType ;
		rii.nImageWidth = peih->nImageWidth ;
		rii.nImageHeight = peih->nImageHeight ;
		if ( rii.nImageHeight < 0 )
			rii.nImageHeight = - rii.nImageHeight ;
		rii.dwBitsPerPixel = peih->dwBitsPerPixel ;
		rii.BytesPerLine =
			((rii.nImageWidth * rii.dwBitsPerPixel >> 3) + 0x03) & ~0x03 ;
		rii.ptrImageArray =
			(PBYTE) ::LocalAlloc
				( (LMEM_FIXED | LMEM_ZEROINIT),
					rii.BytesPerLine * rii.nImageHeight ) ;
		if ( rii.ptrImageArray == NULL )
		{
			nResult = 4 ;
			break ;
		}
		//
		// 入出力インターフェースをセットアップする
		ERIInputContext	eic( 0x10000 ) ;
		eic.m_pFile = &erifile ;
		MyERIDecoder	myed ;
		if ( myed.Initialize( *peih ) )
			break ;
		myed.m_pfnPrgCallback = lpPrgressCallback ;
		myed.m_nInstance = lData ;
		myed.m_nLastRatio = -1 ;
		//
		// デコード開始
		if ( myed.DecodeImage( rii, eic, false ) )
			break ;
		//
		// 展開した画像を呼び出し元に渡す
		//
		*pHBm = (HANDLE) rii.ptrImageArray ;
		//
		unsigned int	nBMInfSize = sizeof(BITMAPINFOHEADER);
		if ( rii.dwBitsPerPixel == 8 )
			nBMInfSize += sizeof(RGBQUAD) * 0x100 ;
		BITMAPINFOHEADER *	pbmih =
			(BITMAPINFOHEADER*) ::LocalAlloc
				( (LMEM_FIXED | LMEM_ZEROINIT), nBMInfSize ) ;
		if ( pbmih == NULL )
		{
			nResult = 4 ;
			break ;
		}
		//
		pbmih->biSize = sizeof(BITMAPINFOHEADER) ;
		pbmih->biWidth = rii.nImageWidth ;
		pbmih->biHeight = rii.nImageHeight ;
		pbmih->biPlanes = 1 ;
		pbmih->biBitCount = (WORD) rii.dwBitsPerPixel ;
		pbmih->biCompression = BI_RGB ;
		pbmih->biSizeImage = rii.BytesPerLine * rii.nImageHeight ;
		//
		if ( pbmih->biBitCount == 8 )
		{
			BITMAPINFO *	pbmi = (BITMAPINFO*) pbmih ;
			if ( peih->fdwFormatType == ERI_GRAY_IMAGE )
			{
				for ( int i = 0; i < 0x100; i ++ )
				{
					pbmi->bmiColors[i].rgbRed      = i ;
					pbmi->bmiColors[i].rgbGreen    = i ;
					pbmi->bmiColors[i].rgbBlue     = i ;
					pbmi->bmiColors[i].rgbReserved = 0 ;
				}
			}
			else
			{
				::memcpy( pbmi->bmiColors,
						erifile.m_PaletteTable, sizeof(RGBQUAD) * 0x100 ) ;
			}
		}
		//
		*pHBInfo = (HANDLE) pbmih ;
		//
		nResult = 0 ;
	}
	while ( false ) ;
	//
	delete	pfile ;
	//
	return	nResult ;
}
