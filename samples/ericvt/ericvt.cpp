
/*****************************************************************************
                       恵理ちゃん画像コンバーター CL
 -----------------------------------------------------------------------------
           Copyright (C) 20001 Leshade Entis. All rights reserved.
 *****************************************************************************/


#include "ericvt.h"
#pragma comment( lib, "experi.lib" )


//
// エントリポイント
//////////////////////////////////////////////////////////////////////////////
int main( int argc, char * argv[] )
{
	//
	// ライブラリを初期化
	//
	eriInitializeLibrary( ) ;
	//
	// 引数を解析
	//
	MyArgument	argument ;
	bool	fError = !argument.Interpret( argc, argv ) ;
	if ( !argument.m_fNologo )
	{
		PrintLogo( ) ;
	}
	if ( fError )
	{
		PrintUsage( ) ;
		return	0 ;
	}
	//
	if ( argument.m_fEncode )
	{
		//
		// 圧縮実行
		//
		EncodeToEri( argument ) ;
	}
	else
	{
		//
		// 伸張実行
		//
		DecodeEriToBmp( argument ) ;
	}
	//
	// ライブラリを終了
	//
	eriCloseLibrary( ) ;
	//
	return	0 ;
}

//
// ロゴを表示
//////////////////////////////////////////////////////////////////////////////
void PrintLogo( void )
{
	printf( "恵理ちゃん画像コンバーター ＣＬ version 1.02\n" ) ;
	printf( "Copyright (C) 2001 Leshade Entis. All rights reserved.\n\n" ) ;
}

//
// 書式を表示
//////////////////////////////////////////////////////////////////////////////
void PrintUsage( void )
{
	printf( "書式１：ericvt [<オプション>...] <入力ファイル> [<出力ファイル>]\n" ) ;
	printf( "書式２：ericvt [<オプション>...] <入力ファイル> <出力ディレクトリ>\n" ) ;
	printf( "\n" ) ;
	printf( "オプション；\n" ) ;
	printf( "    -nologo : ロゴを表示しません。(デフォルトは無指定)\n" ) ;
	printf( "    -time   : 所要時間を計測します。(デフォルトは無指定)\n" ) ;
	printf( "    -e      : BMP から ERI ファイルへ圧縮します。\n" ) ;
	printf( "    -d      : ERI から BMP ファイルへ展開します。(デフォルト)\n" ) ;
	printf( "    -x      : 拡張フォーマットを使って圧縮します。(デフォルト)\n" ) ;
	printf( "    -s      : 標準フォーマットを使って圧縮します。\n" ) ;
	printf( "    -i      : ブロック独立型で圧縮します。(デフォルトは無指定)\n" ) ;
	printf( "    -b<n>   : ブロック化係数を指定します。\n" ) ;
	printf( "              n は 3 以上の整数。\n" ) ;
	printf( "              指定しないとプログラムが自動的に決定します。\n" ) ;
	printf( "    -p<n>   : 圧縮モードを指定します。n は 0 から 3 までの整数。\n" ) ;
	printf( "              -p0 で最高圧縮率最低速度、-p3 で最低圧縮率最高速度となります。\n" ) ;
	printf( "              フルカラー圧縮のときのみ有効。デフォルトは -p1 です。\n" ) ;
	printf( "    -l=<parameter-file>\n" ) ;
	printf( "            : 非可逆圧縮を行います。\n" ) ;
	printf( "              parameter-file にはパラメータを格納したファイル名を指定します。\n" ) ;
}


//
// グローバル変数
//////////////////////////////////////////////////////////////////////////////

int		nEncodedCount = 0 ;


//
// BMP を ERI に圧縮
//////////////////////////////////////////////////////////////////////////////
void EncodeToEri( MyArgument & argument )
{
	//
	// ファイルを探して順次圧縮
	//
	WIN32_FIND_DATA	wfd ;
	HANDLE	hFind = ::FindFirstFile( argument.m_pszSrcName, &wfd ) ;
	if ( hFind == INVALID_HANDLE_VALUE )
	{
		printf( "指定されたファイルを見つけることが出来ませんでした。\n" ) ;
		return ;
	}
	char *	pszDir = GetPathDirectory( argument.m_pszSrcName ) ;
	nEncodedCount = 0 ;
	do
	{
		//
		// 入出力ファイル名を生成
		//
		char *	pszBmpFile = CombineString( pszDir, wfd.cFileName ) ;
		char *	pszEriFile ;
		if ( argument.m_fDstIsDir )
		{
			char *	pszFileTitle = GetFileNameTitle( wfd.cFileName ) ;
			char *	pszFileName = CombineString( pszFileTitle, ".eri" ) ;
			::eriFreeMemory( pszFileTitle ) ;
			pszEriFile = CombineString( argument.m_pszDstName, pszFileName ) ;
			::eriFreeMemory( pszFileName ) ;
		}
		else
		{
			pszEriFile = CombineString( argument.m_pszDstName, "" ) ;
		}
		//
		// ファイルを圧縮
		//
		EncodeBmpToEri( pszBmpFile, pszEriFile, argument ) ;
		//
		::eriFreeMemory( pszBmpFile ) ;
		::eriFreeMemory( pszEriFile ) ;
	}
	while ( ::FindNextFile( hFind, &wfd ) ) ;
	//
	::eriFreeMemory( pszDir ) ;
	//
	printf( "\n%d 枚の画像を圧縮しました。\n\n", nEncodedCount ) ;
}

//
// BMP を ERI に圧縮
//////////////////////////////////////////////////////////////////////////////
void EncodeBmpToEri
( const char * pszBmpFile, const char * pszEriFile, MyArgument & argument )
{
	//
	// ファイルの圧縮開始
	//
	char	szProgress[0x100] ;
	sprintf( szProgress, "%s : %%d ％\r", GetFilePathName( pszBmpFile ) ) ;
	printf( "%s : \r", GetFilePathName( pszBmpFile ) ) ;
	//
	// BMP ファイルを読み込む
	//
	EReadFile	rf ;
	if ( !rf.Open( pszBmpFile ) )
	{
		printf( "\nファイルを開けませんでした。\n" ) ;
		return ;
	}
	MyBitmap	bmp ;
	if ( !bmp.ReadBitmap( &rf ) )
	{
		printf( "\n不正なビットマップファイルです。\n" ) ;
		return ;
	}
	//
	// ERI ファイルを開く
	//
	EWriteFile	wf ;
	ERIWriteFile	erif ;
	if ( !wf.Open( pszEriFile ) || !erif.Open( &wf, erif.fidImage ) )
	{
		printf( "\n出力ファイルを開けませんでした。\n" ) ;
		return ;
	}
	//
	// ファイルヘッダを書き出す
	//
	ERI_FILE_HEADER	efh ;
	ERI_INFO_HEADER	eih ;
	const RASTER_IMAGE_INFO &	srii = bmp.GetRasterImage( ) ;
	//
	efh.dwVersion = 0x00020100 ;
	efh.dwContainedFlag = EFH_CONTAIN_IMAGE ;
	if ( srii.fdwFormatType & ERI_WITH_PALETTE )
	{
		efh.dwContainedFlag |= EFH_CONTAIN_PALETTE ;
	}
	efh.dwKeyFrameCount = 1 ;
	efh.dwFrameCount = 1 ;
	efh.dwAllFrameTime = 0 ;
	//
	::memset( &eih, 0, sizeof(eih) ) ;
	if ( argument.m_fEnhancedMode
			&& (srii.fdwFormatType != ERI_GRAY_IMAGE) )
	{
		eih.dwVersion = 0x00020200 ;
		eih.dwArchitecture = ERI_RUNLENGTH_HUFFMAN ;
	}
	else
	{
		eih.dwVersion = 0x00020100 ;
		eih.dwArchitecture = ERI_RUNLENGTH_GAMMA ;
	}
	if ( argument.m_fLossless )
	{
		eih.fdwTransformation = CVTYPE_LOSSLESS_ERI ;
	}
	else
	{
		eih.fdwTransformation = CVTYPE_DCT_ERI ;
	}
	eih.fdwFormatType = srii.fdwFormatType ;
	eih.nImageWidth = srii.nImageWidth ;
	eih.nImageHeight = - srii.nImageHeight ;
	eih.dwBitsPerPixel = srii.dwBitsPerPixel ;
	if ( argument.m_fLossless )
	{
		if ( !(srii.fdwFormatType & ERI_WITH_PALETTE) )
		{
			if ( argument.m_nBlockSize != 0 )
			{
				eih.dwBlockingDegree = argument.m_nBlockSize ;
			}
			else
			{
				if ( srii.nImageWidth * srii.nImageHeight < 512 * 512 )
				{
					eih.dwBlockingDegree = 4 ;
				}
				else
				{
					eih.dwBlockingDegree = 5 ;
				}
			}
		}
	}
	else
	{
		eih.dwBlockingDegree = argument.m_nBlockingDegree ;
		eih.dwSamplingFlags = argument.m_dwSamplingFlags ;
	}
	//
	if ( !erif.WriteHeader( efh, eih ) )
	{
		printf( "\nヘッダ情報の書き出しに失敗しました。\n" ) ;
		erif.Close( ) ;
		wf.Close( ) ;
		return ;
	}
	//
	// ストリームレコードの書き出し
	//
	bool	fSuccessful = false ;
	do
	{
		//
		// ストリームレコードを開く
		//
		if ( !erif.DescendRecord( (PCUINT64)"Stream  " ) )
		{
			break ;
		}
		//
		// パレットテーブルの書き出し
		//
		if ( srii.fdwFormatType & ERI_WITH_PALETTE )
		{
			if ( !erif.DescendRecord( (PCUINT64)"Palette " ) )
			{
				break ;
			}
			if ( erif.Write( bmp.GetPaletteTable(),
						0x100 * sizeof(ENTIS_PALETTE) )
							< 0x100 * sizeof(ENTIS_PALETTE) )
			{
				break ;
			}
			erif.AscendRecord( ) ;
		}
		//
		// 画像データレコードを開く
		//
		if ( !erif.DescendRecord( (PCUINT64)"ImageFrm" ) )
		{
			break ;
		}
		//
		// 画像データ圧縮準備
		//
		EFileEncodeContext	context( &erif, 0x10000 ) ;
		MyERIEncoder		encoder ;
		if ( encoder.Initialize( eih ) )
		{
			break ;
		}
		DWORD	fdwFlags = 0 ;
		if ( argument.m_fIndependentBlock )
		{
			fdwFlags |= ERI_ENCODE_INDEPENDENT_BLOCK ;
		}
		fdwFlags |= ERI_MAKE_COMPRESS_MODE(argument.m_nCompressMode) ;
		if ( !argument.m_fLossless )
		{
			encoder.SetCompressionParameter( argument.m_eriep ) ;
		}
		//
		// 時間計測開始
		//
		BOOL	fPeformanceCounter ;
		__int64	qwFrequency, qwBeginTime ;
		DWORD	dwBegintTime ;
		if ( !argument.m_fTime )
		{
			encoder.AttachProgressFormat( szProgress ) ;
		}
		else
		{
			fPeformanceCounter =
				QueryPerformanceFrequency( (LARGE_INTEGER*) &qwFrequency ) ;
			if ( fPeformanceCounter )
			{
				QueryPerformanceCounter( (LARGE_INTEGER*) &qwBeginTime ) ;
			}
			else
			{
				dwBegintTime = GetTickCount( ) ;
			}
		}
		//
		// 画像データを圧縮
		//
		if ( encoder.EncodeImage( srii, context, fdwFlags ) )
		{
			break ;
		}
		//
		if ( argument.m_fTime )
		{
			if ( fPeformanceCounter )
			{
				__int64	qwEndTime, qwDurationTime ;
				QueryPerformanceCounter( (LARGE_INTEGER*) &qwEndTime ) ;
				qwDurationTime = qwEndTime - qwBeginTime ;
				printf( "%s : 圧縮時間 %.5f [ms]\r",
					GetFilePathName( pszBmpFile ),
					(double) qwDurationTime * 1000.0 / qwFrequency ) ;
			}
			else
			{
				DWORD	dwDurationTime = GetTickCount( ) - dwBegintTime ;
				printf( "%s : 圧縮時間 %d [ms]\r",
					GetFilePathName( pszBmpFile ), dwDurationTime ) ;
			}
		}
		//
		// ストリームレコードを閉じる
		//
		erif.AscendRecord( ) ;
		erif.AscendRecord( ) ;
		//
		fSuccessful = true ;
	}
	while ( false ) ;
	//
	erif.Close( ) ;
	wf.Close( ) ;
	//
	if ( fSuccessful )
	{
		nEncodedCount ++ ;
		printf( "\n" ) ;
	}
	else
	{
		printf( "\n展開に失敗しました。\n" ) ;
	}
}

//
// ERI を BMP に展開
//////////////////////////////////////////////////////////////////////////////
void DecodeEriToBmp( MyArgument & argument )
{
	//
	// ファイルを探して順次圧縮
	//
	WIN32_FIND_DATA	wfd ;
	HANDLE	hFind = ::FindFirstFile( argument.m_pszSrcName, &wfd ) ;
	if ( hFind == INVALID_HANDLE_VALUE )
	{
		printf( "指定されたファイルを見つけることが出来ませんでした。\n" ) ;
		return ;
	}
	int		nDecodedCount = 0 ;
	char *	pszDir = GetPathDirectory( argument.m_pszSrcName ) ;
	do
	{
		//
		// ファイルの圧縮開始
		//
		char	szProgress[0x100] ;
		sprintf( szProgress, "%s : %%d ％\r", GetFilePathName( wfd.cFileName ) ) ;
		printf( "%s : \r", wfd.cFileName ) ;
		//
		// ERI ファイルを開く
		//
		char *	pszEriFile = CombineString( pszDir, wfd.cFileName ) ;
		EReadFile	rf ;
		ERIFile		erif ;
		if ( !rf.Open( pszEriFile ) || !erif.Open( &rf ) )
		{
			printf( "\nファイルを開けませんでした。\n" ) ;
			::eriFreeMemory( pszEriFile ) ;
			continue ;
		}
		::eriFreeMemory( pszEriFile ) ;
		//
		// 展開先のビットマップを作る
		//
		MyBitmap	bmp ;
		bmp.CreateBitmap
			( erif.m_InfoHeader.fdwFormatType,
				erif.m_InfoHeader.nImageWidth, erif.m_InfoHeader.nImageHeight,
				erif.m_InfoHeader.dwBitsPerPixel, erif.m_PaletteTable ) ;
		//
		// ERI の展開を準備する
		//
		EFileDecodeContext	context( &erif, 0x10000 ) ;
		MyERIDecoder		decoder ;
		if ( decoder.Initialize( erif.m_InfoHeader ) )
		{
			printf( "\n展開できない形式です。\n" ) ;
			erif.Close( ) ;
			rf.Close( ) ;
			continue ;
		}
		//
		// 時間の計測開始
		//
		BOOL	fPeformanceCounter ;
		__int64	qwFrequency, qwBeginTime ;
		DWORD	dwBegintTime ;
		if ( !argument.m_fTime )
		{
			decoder.AttachProgressFormat( szProgress ) ;
		}
		else
		{
			fPeformanceCounter =
				QueryPerformanceFrequency( (LARGE_INTEGER*) &qwFrequency ) ;
			if ( fPeformanceCounter )
			{
				QueryPerformanceCounter( (LARGE_INTEGER*) &qwBeginTime ) ;
			}
			else
			{
				dwBegintTime = GetTickCount( ) ;
			}
		}
		//
		// ERI を展開する
		//
		if ( decoder.DecodeImage( bmp.GetRasterImage(), context, false ) )
		{
			printf( "\n展開に失敗しました。\n" ) ;
			erif.Close( ) ;
			rf.Close( ) ;
			continue ;
		}
		//
		if ( argument.m_fTime )
		{
			if ( fPeformanceCounter )
			{
				__int64	qwEndTime, qwDurationTime ;
				QueryPerformanceCounter( (LARGE_INTEGER*) &qwEndTime ) ;
				qwDurationTime = qwEndTime - qwBeginTime ;
				printf( "%s : 展開時間 %.5f [ms]\r",
					GetFilePathName( wfd.cFileName ),
					(double) qwDurationTime * 1000.0 / qwFrequency ) ;
			}
			else
			{
				DWORD	dwDurationTime = GetTickCount( ) - dwBegintTime ;
				printf( "%s : 展開時間 %d [ms]\r",
					GetFilePathName( wfd.cFileName ), dwDurationTime ) ;
			}
		}
		//
		// BMP ファイルを書き出す
		//
		EWriteFile	wf ;
		char *	pszBmpFile ;
		if ( argument.m_fDstIsDir )
		{
			char *	pszFileTitle = GetFileNameTitle( wfd.cFileName ) ;
			char *	pszFileName = CombineString( pszFileTitle, ".bmp" ) ;
			::eriFreeMemory( pszFileTitle ) ;
			pszBmpFile = CombineString( argument.m_pszDstName, pszFileName ) ;
			::eriFreeMemory( pszFileName ) ;
		}
		else
		{
			pszBmpFile = CombineString( argument.m_pszDstName, "" ) ;
		}
		if ( !wf.Open( pszBmpFile ) )
		{
			printf( "\n出力ファイルを開けませんでした。\n" ) ;
			::eriFreeMemory( pszBmpFile ) ;
			continue ;
		}
		::eriFreeMemory( pszBmpFile ) ;
		//
		if ( !bmp.WriteBitmap( &wf ) )
		{
			printf( "\nBMP ファイルの書き出しに失敗しました。\n" ) ;
			continue ;
		}
		//
		printf( "\n" ) ;
		nDecodedCount ++ ;
	}
	while ( ::FindNextFile( hFind, &wfd ) ) ;
	//
	::eriFreeMemory( pszDir ) ;
	//
	printf( "\n%d 枚の画像を展開しました。\n\n", nDecodedCount ) ;
}

//
// パスからディレクトリを抽出
//////////////////////////////////////////////////////////////////////////////
char * GetPathDirectory( const char * pszPath )
{
	int		i = 0, dl = 0 ;
	while ( pszPath[i] != '\0' )
	{
		if ( ::IsDBCSLeadByte( pszPath[i] ) )
		{
			i += 2 ;
		}
		else
		{
			if ( pszPath[i ++] == '\\' )
			{
				dl = i ;
			}
		}
	}
	char *	str = (char*) ::eriAllocateMemory( dl + 1 ) ;
	memcpy( str, pszPath, dl ) ;
	str[dl] = '\0' ;
	return	str ;
}

//
// パスからファイル名を抽出
//////////////////////////////////////////////////////////////////////////////
const char * GetFilePathName( const char * pszPath )
{
	int		i = 0, dl = 0 ;
	while ( pszPath[i] != '\0' )
	{
		if ( ::IsDBCSLeadByte( pszPath[i] ) )
		{
			i += 2 ;
		}
		else
		{
			if ( pszPath[i ++] == '\\' )
			{
				dl = i ;
			}
		}
	}
	return	pszPath + dl ;
}

//
// ファイル名からファイルタイトルを抽出
//////////////////////////////////////////////////////////////////////////////
char * GetFileNameTitle( const char * pszFileName )
{
	int		i = 0, tl = 0 ;
	while ( pszFileName[i] != '\0' )
	{
		if ( ::IsDBCSLeadByte( pszFileName[i] ) )
		{
			i += 2 ;
		}
		else
		{
			if ( pszFileName[i] == '.' )
			{
				tl = i ;
			}
			i ++ ;
		}
	}
	char *	str = (char*) ::eriAllocateMemory( tl + 1 ) ;
	memcpy( str, pszFileName, tl ) ;
	str[tl] = '\0' ;
	return	str ;
}

//
// 文字列を結合
//////////////////////////////////////////////////////////////////////////////
char * CombineString( const char * str1, const char * str2 )
{
	size_t	sl1 = strlen( str1 ) ;
	size_t	sl2 = strlen( str2 ) ;
	char *	str = (char*) ::eriAllocateMemory( sl1 + sl2 + 1 ) ;
	memcpy( str, str1, sl1 ) ;
	memcpy( str + sl1, str2, sl2 ) ;
	str[sl1 + sl2] = '\0' ;
	return	str ;
}


//////////////////////////////////////////////////////////////////////////////
// ビットマップオブジェクト
//////////////////////////////////////////////////////////////////////////////

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
MyBitmap::MyBitmap( void )
{
	m_ptrBitmap = NULL ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
MyBitmap::~MyBitmap( void )
{
	Delete( ) ;
}

//
// 画像データ取得
//////////////////////////////////////////////////////////////////////////////
const RASTER_IMAGE_INFO & MyBitmap::GetRasterImage( void ) const
{
	return	m_rii ;
}

//
// パレットテーブル取得
//////////////////////////////////////////////////////////////////////////////
const RGBQUAD * MyBitmap::GetPaletteTable( void ) const
{
	return	m_palette ;
}

//
// ビットマップファイルを読み込み
//////////////////////////////////////////////////////////////////////////////
bool MyBitmap::ReadBitmap( EFileObject * pfile )
{
	//
	// 現在のデータを削除
	//
	Delete( ) ;
	//
	// ファイルヘッダを読み込む
	//
	BITMAPFILEHEADER	bfh ;
	if ( pfile->Read( &bfh, sizeof(bfh) ) < sizeof(bfh) )
	{
		return	false ;
	}
	if ( bfh.bfType != 'MB' )
	{
		return	false ;
	}
	//
	// 情報ヘッダを読み込む
	//
	if ( pfile->Read( &m_bmih, sizeof(m_bmih) ) < sizeof(m_bmih) )
	{
		return	false ;
	}
	//
	// パレットテーブルを読み込む
	//
	unsigned int	plen = 0 ;
	if ( m_bmih.biClrUsed != 0 )
	{
		plen = m_bmih.biClrUsed ;
	}
	else if ( m_bmih.biBitCount <= 8 )
	{
		plen = (1 << m_bmih.biBitCount) ;
	}
	if ( plen > 0x100 )
	{
		plen = 0x100 ;
	}
	plen *= sizeof(RGBQUAD) ;
	if ( bfh.bfOffBits != sizeof(bfh) + sizeof(m_bmih) + plen )
	{
		return	false ;
	}
	::memset( m_palette, 0, sizeof(m_palette) ) ;
	if ( pfile->Read( m_palette, plen ) < plen )
	{
		return	false ;
	}
	//
	// 画像情報を設定する
	//
	m_rii.fdwFormatType = ERI_RGB_IMAGE ;
	m_rii.nImageWidth = m_bmih.biWidth ;
	m_rii.nImageHeight = m_bmih.biHeight ;
	m_rii.dwBitsPerPixel = m_bmih.biBitCount ;
	m_rii.BytesPerLine =
		((m_rii.nImageWidth * m_rii.dwBitsPerPixel + 0x1F) & ~0x1F) >> 3 ;
	//
	if ( m_rii.dwBitsPerPixel <= 8 )
	{
		m_rii.fdwFormatType |= ERI_WITH_PALETTE ;
		//
		for ( int i = 0; i < 0x100; i ++ )
		{
			if ( (m_palette[i].rgbRed != (BYTE) i) ||
					(m_palette[i].rgbGreen != (BYTE) i) ||
					(m_palette[i].rgbBlue != (BYTE) i) )
			{
				break ;
			}
		}
		if ( i >= 0x100 )
		{
			m_rii.fdwFormatType = ERI_GRAY_IMAGE ;
		}
	}
	//
	// ビットマップ配列を読み込む
	//
	m_bmih.biSizeImage = m_rii.BytesPerLine * m_rii.nImageHeight ;
	m_ptrBitmap = ::eriAllocateMemory( m_bmih.biSizeImage ) ;
	if ( pfile->Read( m_ptrBitmap, m_bmih.biSizeImage ) < m_bmih.biSizeImage )
	{
		return	false ;
	}
	m_rii.ptrImageArray = (PBYTE) m_ptrBitmap ;

	return	true ;
}

//
// ビットマップデータを作成
//////////////////////////////////////////////////////////////////////////////
bool MyBitmap::CreateBitmap
	( DWORD format, SDWORD width, SDWORD height,
				DWORD bpp, ENTIS_PALETTE * paltbl )
{
	//
	// 現在のデータを削除
	//
	Delete( ) ;
	//
	// 画像情報を設定
	//
	if ( height < 0 )
	{
		height = - height ;
	}
	m_rii.fdwFormatType = format ;
	m_rii.nImageWidth = width ;
	m_rii.nImageHeight = height ;
	m_rii.dwBitsPerPixel = bpp ;
	m_rii.BytesPerLine = ((width * bpp / 8) + 0x03) & ~0x03 ;
	//
	// ビットマップ形式に変換
	//
	::memset( &m_bmih, 0, sizeof(m_bmih) ) ;
	m_bmih.biSize = sizeof(m_bmih) ;
	m_bmih.biWidth = width ;
	m_bmih.biHeight = height ;
	m_bmih.biPlanes = 1 ;
	m_bmih.biBitCount = (WORD) bpp ;
	m_bmih.biSizeImage = m_rii.BytesPerLine * height ;
	if ( bpp <= 8 )
	{
		m_bmih.biClrUsed = (1 << bpp) ;
	}
	//
	// ビットマップメモリを確保
	//
	m_ptrBitmap = ::eriAllocateMemory( m_bmih.biSizeImage ) ;
	m_rii.ptrImageArray = (PBYTE) m_ptrBitmap ;
	//
	// パレットテーブルを設定
	//
	if ( format == ERI_GRAY_IMAGE )
	{
		for ( int i = 0; i < 0x100; i ++ )
		{
			m_palette[i].rgbBlue = (BYTE) i ;
			m_palette[i].rgbGreen = (BYTE) i ;
			m_palette[i].rgbRed = (BYTE) i ;
			m_palette[i].rgbReserved = 0 ;
		}
	}
	else if ( (bpp <= 8) && (paltbl != NULL) )
	{
		::memcpy( m_palette, paltbl, sizeof(m_palette) ) ;
	}

	return	true ;
}

//
// ビットマップファイルを書き出す
//////////////////////////////////////////////////////////////////////////////
bool MyBitmap::WriteBitmap( EWriteFileObj * pfile )
{
	if ( m_ptrBitmap == NULL )
	{
		return	false ;
	}
	//
	// ファイルヘッダを書き出す
	//
	BITMAPFILEHEADER	bfh ;
	bfh.bfType = 'MB' ;
	bfh.bfOffBits = sizeof(BITMAPFILEHEADER) + sizeof(BITMAPINFOHEADER) ;
	if ( m_bmih.biBitCount <= 8 )
	{
		bfh.bfOffBits += (sizeof(RGBQUAD) << m_bmih.biBitCount) ;
	}
	bfh.bfSize = bfh.bfOffBits + m_bmih.biSizeImage ;
	//
	if ( pfile->Write( &bfh, sizeof(bfh) ) < sizeof(bfh) )
	{
		return	false ;
	}
	//
	// 情報ヘッダを書き出す
	//
	if ( pfile->Write( &m_bmih, sizeof(m_bmih) ) < sizeof(m_bmih) )
	{
		return	false ;
	}
	//
	// パレットテーブルを書き出す
	//
	if ( m_bmih.biBitCount <= 8 )
	{
		if ( pfile->Write( m_palette, sizeof(m_palette) ) < sizeof(m_palette) )
		{
			return	false ;
		}
	}
	//
	// ビットマップ配列を読み込む
	//
	if ( pfile->Write( m_ptrBitmap, m_bmih.biSizeImage ) < m_bmih.biSizeImage )
	{
		return	false ;
	}

	return	true ;
}

//
// データを削除
//////////////////////////////////////////////////////////////////////////////
void MyBitmap::Delete( void )
{
	if ( m_ptrBitmap != NULL )
	{
		::eriFreeMemory( m_ptrBitmap ) ;
		m_ptrBitmap = NULL ;
	}
}


//////////////////////////////////////////////////////////////////////////////
// コマンドライン引数オブジェクト
//////////////////////////////////////////////////////////////////////////////

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
MyArgument::MyArgument( void )
{
	m_fNologo = false ;
	m_fTime = false ;
	m_fEncode = false ;
	m_fDstIsDir = false ;
	m_fIndependentBlock = false ;
	m_fEnhancedMode = true ;
	m_nBlockSize = 0 ;
	m_nCompressMode = 1 ;
	m_fLossless = true ;
	m_dwSamplingFlags = 0 ;
	m_pszSrcName = NULL ;
	m_pszDstName = NULL ;
	m_pszDstBuf = NULL ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
MyArgument::~MyArgument( void )
{
	if ( m_pszDstBuf != NULL )
	{
		::eriFreeMemory( m_pszDstBuf ) ;
	}
}

//
// 引数解析
//////////////////////////////////////////////////////////////////////////////
bool MyArgument::Interpret( int argc, const char *const * argv )
{
	//
	// オプション解析
	//
	int		i = 1 ;
	while ( i < argc )
	{
		if ( (argv[i][0] != '-') && (argv[i][0] != '/') )
		{
			break ;
		}
		int		param ;
		switch ( argv[i][1] )
		{
		case	'e':
		case	'E':
			if ( argv[i][2] != '\0' )
			{
				return	false ;
			}
			m_fEncode = true ;
			break ;

		case	'd':
		case	'D':
			if ( argv[i][2] != '\0' )
			{
				return	false ;
			}
			m_fEncode = false ;
			break ;

		case	'x':
		case	'X':
			if ( argv[i][2] != '\0' )
			{
				return	false ;
			}
			m_fEncode = true ;
			m_fEnhancedMode = true ;
			break ;

		case	's':
		case	'S':
			if ( argv[i][2] != '\0' )
			{
				return	false ;
			}
			m_fEncode = true ;
			m_fEnhancedMode = false ;
			break ;

		case	'i':
		case	'I':
			if ( argv[i][2] != '\0' )
			{
				return	false ;
			}
			m_fIndependentBlock = true ;
			break ;

		case	'b':
		case	'B':
			if ( !Value( argv[i] + 2, &param ) )
			{
				return	false ;
			}
			if ( param < 3 )
			{
				return	false ;
			}
			m_nBlockSize = param ;
			break ;

		case	'p':
		case	'P':
			if ( !Value( argv[i] + 2, &param ) )
			{
				return	false ;
			}
			if ( (param < 0) || (param > 3) )
			{
				return	false ;
			}
			m_nCompressMode = param ;
			break ;

		case	'l':
		case	'L':
			{
				if ( argv[i][2] != '=' )
				{
					return	false ;
				}
				char	szBuf[0x200] ;
				char *	pszFilePart ;
				if ( ::GetFullPathName
					( argv[i] + 3, 0x200, szBuf, &pszFilePart ) == 0 )
				{
					return	false ;
				}
				if ( !LoadCompressionParameter( szBuf ) )
				{
					return	false ;
				}
			}
			break ;

		case	'n':
		case	'N':
			if ( ::_strcmpi( argv[i] + 1, "nologo" ) )
			{
				return	false ;
			}
			m_fNologo = true ;
			break ;

		case	't':
		case	'T':
			if ( ::_strcmpi( argv[i] + 1, "time" ) )
			{
				return	false ;
			}
			m_fTime = true ;
			break ;

		default:
			return	false ;
		}
		++ i ;
	}
	//
	// 入出力ファイル名取得
	//
	if ( argc < i + 1 )
	{
		return	false ;
	}
	m_pszSrcName = argv[i] ;
	//
	if ( argc < i + 2 )
	{
		char *	pszBaseName = ::GetFileNameTitle( m_pszSrcName ) ;
		m_pszDstBuf =
			::CombineString( pszBaseName, (m_fEncode ? ".eri" : ".bmp") ) ;
		::eriFreeMemory( pszBaseName ) ;
		m_pszDstName = m_pszDstBuf ;
	}
	else
	{
		m_pszDstName = argv[i + 1] ;
	}
	//
	// 出力先がディレクトリかどうか判別
	//
	for ( i = 0; m_pszDstName[i] != '\0'; i ++ )
		;
	if ( (i > 0) &&
		((m_pszDstName[i - 1] == '\\') || (m_pszDstName[i - 1] == ':')) )
	{
		m_fDstIsDir = true ;
	}
	//
	// 正常終了
	//
	return	true ;
}

//
// 非可逆圧縮パラメータを設定
//////////////////////////////////////////////////////////////////////////////
bool MyArgument::LoadCompressionParameter( const char * pszIniFile )
{
	//
	// サンプリングフラグを取得
	//
	char	szBuf[0x100] ;
	if ( ::GetPrivateProfileString
		( "parameter", "sampling_flag",
			"4:4:4", szBuf, 0x100, pszIniFile ) >= 0xFF )
	{
		return	false ;
	}
	if ( !::_strcmpi( szBuf, "4:4:4" ) )
	{
		m_dwSamplingFlags = ERISF_YUV_4_4_4 ;
	}
	else if ( !::_strcmpi( szBuf, "4:2:2" ) )
	{
		m_dwSamplingFlags = ERISF_YUV_4_2_2 ;
	}
	else if ( !::_strcmpi( szBuf, "4:1:1" ) )
	{
		m_dwSamplingFlags = ERISF_YUV_4_1_1 ;
	}
	else
	{
		return	false ;
	}
	//
	// ブロッキングサイズを取得
	//
	if ( ::GetPrivateProfileString
		( "parameter", "blocking_degree",
			"3", szBuf, 0x100, pszIniFile ) >= 0xFF )
	{
		return	false ;
	}
	if ( !Value( szBuf, &m_nBlockingDegree ) )
	{
		return	false ;
	}
	if ( (m_nBlockingDegree < 3) || (5 < m_nBlockingDegree) )
	{
		return	false ;
	}
	//
	// 量子化係数を取得
	//
	if ( !GetParameter( &m_eriep.m_rYScaleDC,
			pszIniFile, "parameter", "y_dc_scale", "1.0" ) )
	{
		return	false ;
	}
	if ( !GetParameter( &m_eriep.m_rCScaleDC,
			pszIniFile, "parameter", "c_dc_scale", "1.0" ) )
	{
		return	false ;
	}
	if ( !GetParameter( &m_eriep.m_rYScaleLow,
			pszIniFile, "parameter", "y_low_scale", "1.0" ) )
	{
		return	false ;
	}
	if ( !GetParameter( &m_eriep.m_rCScaleLow,
			pszIniFile, "parameter", "c_low_scale", "1.0" ) )
	{
		return	false ;
	}
	if ( !GetParameter( &m_eriep.m_rYScaleHigh,
			pszIniFile, "parameter", "y_high_scale", "1.0" ) )
	{
		return	false ;
	}
	if ( !GetParameter( &m_eriep.m_rCScaleHigh,
			pszIniFile, "parameter", "c_high_scale", "1.0" ) )
	{
		return	false ;
	}
	//
	// 閾値を取得
	//
	if ( ::GetPrivateProfileString
		( "parameter", "low_threshold",
			"0", szBuf, 0x100, pszIniFile ) >= 0xFF )
	{
		return	false ;
	}
	if ( !Value( szBuf, &m_eriep.m_nLowThreshold ) )
	{
		return	false ;
	}
	if ( ::GetPrivateProfileString
		( "parameter", "high_threshold",
			"0", szBuf, 0x100, pszIniFile ) >= 0xFF )
	{
		return	false ;
	}
	if ( !Value( szBuf, &m_eriep.m_nHighThreshold ) )
	{
		return	false ;
	}
	//
	// 非可逆圧縮に設定
	//
	m_fEncode = true ;
	m_fEnhancedMode = true ;
	m_fLossless = false ;

	return	true ;
}

//
// ini ファイルから指定のパラメータを取得する
//////////////////////////////////////////////////////////////////////////////
bool MyArgument::GetParameter
	( REAL32 * val,
		const char * pszIniFile, const char * pszSection,
		const char * pszKey, const char * pszDefault )
{
	char	szBuf[0x100] ;
	if ( ::GetPrivateProfileString
		( pszSection, pszKey, pszDefault, szBuf, 0x100, pszIniFile ) >= 0xFF )
	{
		::lstrcpy( szBuf, pszDefault ) ;
	}
	return	Real( szBuf, val ) ;
}

//
// 文字列から数値に変換
//////////////////////////////////////////////////////////////////////////////
bool MyArgument::Value( const char * str, int * val )
{
	int		i = 0, n = 0 ;
	if ( *str == '\0' )
	{
		return	false ;
	}
	do
	{
		char	c = str[i ++] ;
		if ( (c < '0') || (c > '9') )
		{
			return	false ;
		}
		n = (n * 10) + (c - '0') ;
	}
	while ( str[i] != '\0' ) ;
	//
	*val = n ;
	return	true ;
}

//
// 文字列から実数に変換
//////////////////////////////////////////////////////////////////////////////
bool MyArgument::Real( const char * str, REAL32 * val )
{
	int		i = 0 ;
	REAL32	r = 0.0 ; 
	REAL32	base = 1.0 ;
	//
	if ( *str == '\0' )
	{
		return	false ;
	}
	do
	{
		char	c = str[i ++] ;
		if ( c == '.' )
		{
			if ( base < 1.0 )
			{
				return	false ;
			}
			base = 0.1F ;
		}
		else if ( ('0' <= c) || (c <= '9') )
		{
			if ( base < 1.0 )
			{
				r += (c - '0') * base ;
				base *= 0.1F ;
			}
			else
			{
				r = (r * 10.0F) + (c - '0') ;
			}
		}
		else
		{
			return	false ;
		}
	}
	while ( str[i] != '\0' ) ;
	//
	*val = r ;
	return	true ;
}


//////////////////////////////////////////////////////////////////////////////
// 圧縮オブジェクト
//////////////////////////////////////////////////////////////////////////////

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
MyERIEncoder::MyERIEncoder( void )
{
	m_dwLastProgress = -1 ;
	m_pszProgressFormat = NULL ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
MyERIEncoder::~MyERIEncoder( void )
{
}

//
// 進行状況文字列を関連付ける
//////////////////////////////////////////////////////////////////////////////
void MyERIEncoder::AttachProgressFormat( const char * pszPrgFormat )
{
	m_pszProgressFormat = pszPrgFormat ;
}

//
// 画像を圧縮
//////////////////////////////////////////////////////////////////////////////
int MyERIEncoder::EncodeImage
	( const RASTER_IMAGE_INFO & srcimginf,
		RLHEncodeContext & context, DWORD fdwFlags )
{
	PrintProgress( 0 ) ;
	//
	return	ERIEncoder::EncodeImage( srcimginf, context, fdwFlags ) ;
}

//
// 展開進行状況通知関数
//////////////////////////////////////////////////////////////////////////////
int MyERIEncoder::OnEncodedBlock( LONG line, LONG column )
{
	DWORD	dwTotalBlock = m_nWidthBlocks * m_nHeightBlocks ;
	DWORD	dwDecodedBlock = line * m_nWidthBlocks + column + 1 ;
	DWORD	dwProgress = dwDecodedBlock * 100 / dwTotalBlock ;
	PrintProgress( dwProgress ) ;
	return	0 ;
}

int MyERIEncoder::OnEncodedLine( LONG line )
{
	SDWORD	nImageHeight = m_EriInfHdr.nImageHeight ;
	if ( nImageHeight < 0 )
	{
		nImageHeight = - nImageHeight ;
	}
	DWORD	dwProgress = (line + 1) * 100 / nImageHeight ;
	PrintProgress( dwProgress ) ;
	return	0 ;
}

//
// 進行状況表示
//////////////////////////////////////////////////////////////////////////////
void MyERIEncoder::PrintProgress( DWORD dwProgress )
{
	if ( (m_pszProgressFormat != NULL)
			&& (m_dwLastProgress != dwProgress) )
	{
		m_dwLastProgress = dwProgress ;
		printf( m_pszProgressFormat, dwProgress ) ;
	}
}


//////////////////////////////////////////////////////////////////////////////
// 展開オブジェクト
//////////////////////////////////////////////////////////////////////////////

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
MyERIDecoder::MyERIDecoder( void )
{
	m_pszProgressFormat = NULL ;
	m_dwLastProgress = -1 ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
MyERIDecoder::~MyERIDecoder( void )
{
}

//
// 進行状況文字列を関連付ける
//////////////////////////////////////////////////////////////////////////////
void MyERIDecoder::AttachProgressFormat( const char * pszPrgFormat )
{
	m_pszProgressFormat = pszPrgFormat ;
}

//
// 画像を展開
//////////////////////////////////////////////////////////////////////////////
int MyERIDecoder::DecodeImage
	( const RASTER_IMAGE_INFO & dstimginf,
		RLHDecodeContext & context, bool fTopDown )
{
	PrintProgress( 0 ) ;
	//
	return	ERIDecoder::DecodeImage( dstimginf, context, fTopDown ) ;
}

//
// 展開進行状況通知関数
//////////////////////////////////////////////////////////////////////////////
int MyERIDecoder::OnDecodedBlock( LONG line, LONG column )
{
	DWORD	dwTotalBlock = m_nWidthBlocks * m_nHeightBlocks ;
	DWORD	dwDecodedBlock = line * m_nWidthBlocks + column + 1 ;
	DWORD	dwProgress = dwDecodedBlock * 100 / dwTotalBlock ;
	PrintProgress( dwProgress ) ;
	return	0 ;
}

int MyERIDecoder::OnDecodedLine( LONG line )
{
	SDWORD	nImageHeight = m_EriInfHdr.nImageHeight ;
	if ( nImageHeight < 0 )
	{
		nImageHeight = - nImageHeight ;
	}
	DWORD	dwProgress = (line + 1) * 100 / nImageHeight ;
	PrintProgress( dwProgress ) ;
	return	0 ;
}

//
// 進行状況表示
//////////////////////////////////////////////////////////////////////////////
void MyERIDecoder::PrintProgress( DWORD dwProgress )
{
	if ( (m_pszProgressFormat != NULL)
			&& (m_dwLastProgress != dwProgress) )
	{
		m_dwLastProgress = dwProgress ;
		printf( m_pszProgressFormat, dwProgress ) ;
	}
}
