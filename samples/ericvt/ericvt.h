
/*****************************************************************************
                       恵理ちゃん画像コンバーター CL
 -----------------------------------------------------------------------------
           Copyright (C) 20001 Leshade Entis. All rights reserved.
 *****************************************************************************/


#define	STRICT	1
#include <windows.h>
#include <stdio.h>
#include <memory.h>
#include <string.h>


//
// ERINA ライブラリ定義ファイル
//////////////////////////////////////////////////////////////////////////////

#include <eritypes.h>
#include <erinalib.h>
#include <erimatrix.h>

typedef	const UINT64 *		PCUINT64 ;


//
// ビットマップオブジェクト
//////////////////////////////////////////////////////////////////////////////

class	MyBitmap
{
protected:
	RASTER_IMAGE_INFO	m_rii ;
	BITMAPINFOHEADER	m_bmih ;
	RGBQUAD				m_palette[0x100] ;
	void *				m_ptrBitmap ;

public:
	// 構築関数
	MyBitmap( void ) ;
	// 消滅関数
	~MyBitmap( void ) ;
	// 画像データ取得
	const RASTER_IMAGE_INFO & GetRasterImage( void ) const ;
	// パレットテーブル取得
	const RGBQUAD * GetPaletteTable( void ) const ;
	// ビットマップファイルを読み込み
	bool ReadBitmap( EFileObject * pfile ) ;
	// ビットマップデータを作成
	bool CreateBitmap
		( DWORD format, SDWORD width, SDWORD height,
					DWORD bpp, ENTIS_PALETTE * paltbl ) ;
	// ビットマップファイルを書き出す
	bool WriteBitmap( EWriteFileObj * pfile ) ;
	// データを削除
	void Delete( void ) ;

} ;


//
// コマンドライン引数オブジェクト
//////////////////////////////////////////////////////////////////////////////

class	MyArgument
{
public:
	bool			m_fNologo ;				// ロゴを表示しない
	bool			m_fTime ;				// 時間を計測する
	bool			m_fEncode ;				// 圧縮か伸張か？
	bool			m_fDstIsDir ;			// 出力先はディレクトリか？
	bool			m_fIndependentBlock ;	// ブロック独立型か？
	bool			m_fEnhancedMode ;		// 拡張フォーマットを使う？
	int				m_nBlockSize ;			// ブロッキングサイズ
	int				m_nCompressMode ;		// 圧縮モード

	bool			m_fLossless ;			// 可逆圧縮か？
	int				m_nBlockingDegree ;		// ブロッキングサイズ
	DWORD			m_dwSamplingFlags ;		// サンプリングフラグ
	ERIEncoder::PARAMETER	m_eriep ;		// 圧縮パラメータ

	const char *	m_pszSrcName ;			// 入力ファイル名
	const char *	m_pszDstName ;			// 出力ファイル名
	char *			m_pszDstBuf ;

public:
	// 構築関数
	MyArgument( void ) ;
	// 消滅関数
	~MyArgument( void ) ;
	// 引数解析
	bool Interpret( int argc, const char *const * argv ) ;
	// 非可逆圧縮パラメータを設定
	bool LoadCompressionParameter( const char * pszIniFile ) ;
	// ini ファイルから指定のパラメータを取得する
	static bool GetParameter
		( REAL32 * val,
			const char * pszIniFile, const char * pszSection,
			const char * pszKey, const char * pszDefault ) ;
	// 文字列から数値に変換
	static bool Value( const char * str, int * val ) ;
	static bool Real( const char * str, REAL32 * val ) ;

} ;


//
// 圧縮オブジェクト
//////////////////////////////////////////////////////////////////////////////

class	MyERIEncoder	: public	ERIEncoder
{
public:
	// 構築関数
	MyERIEncoder( void ) ;
	// 消滅関数
	~MyERIEncoder( void ) ;

protected:
	const char *	m_pszProgressFormat ;
	DWORD			m_dwLastProgress ;

public:
	// 進行状況文字列を関連付ける
	void AttachProgressFormat( const char * pszPrgFormat ) ;
	// 画像を圧縮
	int EncodeImage
		( const RASTER_IMAGE_INFO & srcimginf,
			RLHEncodeContext & context, DWORD fdwFlags = 0x0021 ) ;

protected:
	// 展開進行状況通知関数
	virtual int OnEncodedBlock( LONG line, LONG column ) ;
	virtual int OnEncodedLine( LONG line ) ;
	// 進行状況表示
	void PrintProgress( DWORD dwProgress ) ;

} ;


//
// 展開オブジェクト
//////////////////////////////////////////////////////////////////////////////

class	MyERIDecoder	: public	ERIDecoder
{
public:
	// 構築関数
	MyERIDecoder( void ) ;
	// 消滅関数
	~MyERIDecoder( void ) ;

protected:
	const char *	m_pszProgressFormat ;
	DWORD			m_dwLastProgress ;

public:
	// 進行状況文字列を関連付ける
	void AttachProgressFormat( const char * pszPrgFormat ) ;
	// 画像を展開
	int DecodeImage
		( const RASTER_IMAGE_INFO & dstimginf,
			RLHDecodeContext & context, bool fTopDown ) ;

protected:
	// 展開進行状況通知関数
	virtual int OnDecodedBlock( LONG line, LONG column ) ;
	virtual int OnDecodedLine( LONG line ) ;
	// 進行状況表示
	void PrintProgress( DWORD dwProgress ) ;

} ;


//
// グローバル関数
//////////////////////////////////////////////////////////////////////////////

// ロゴを表示
void PrintLogo( void ) ;

// 書式を表示
void PrintUsage( void ) ;

// ERI に圧縮
void EncodeToEri( MyArgument & argument ) ;

// BMP を ERI に圧縮
void EncodeBmpToEri
( const char * pszBmpFile, const char * pszEriFile, MyArgument & argument ) ;

// ERI を BMP に展開
void DecodeEriToBmp( MyArgument & argument ) ;

// パスからディレクトリを抽出
char * GetPathDirectory( const char * pszPath ) ;

// パスからファイル名を抽出
const char * GetFilePathName( const char * pszPath ) ;

// ファイル名からファイルタイトルを抽出
char * GetFileNameTitle( const char * pszFileName ) ;

// 文字列を結合
char * CombineString( const char * str1, const char * str2 ) ;

