
/*****************************************************************************
                      標準恵理ちゃん展開 Susie プラグイン
 ----------------------------------------------------------------------------
          Copyright (C) 2001 Leshade Entis. All rights reserved.
 *****************************************************************************/


//
// ライブラリ連結用
//////////////////////////////////////////////////////////////////////////////

#define	STRICT	1
#include <windows.h>
#include <memory.h>
#include <algorithm>
#define min(x, y) std::min((unsigned int)(x), (unsigned int)(y))

#include <eritypes.h>
#include <erinalib.h>


//
// エクスポート関数
//////////////////////////////////////////////////////////////////////////////

// プラグインの情報を取得
extern "C" __declspec( dllexport )
	int PASCAL GetPluginInfo( int infono, LPSTR buf, int buflen ) ;

// 展開可能なファイルかどうかを調べる
extern "C" __declspec( dllexport )
	int PASCAL IsSupported( LPSTR filename, DWORD dw ) ;

// 画像情報を取得する
extern "C" __declspec( dllexport ) int PASCAL GetPictureInfo
	( LPSTR buf, long len, unsigned int flag, struct PictureInfo *lpInfo ) ;

#pragma	pack( push, ENTER_SUSIE_ALIGN )
#pragma	pack( 1 )

struct	PictureInfo
{
	long	left, top ;		// 画像を展開する位置
	long	width ;			// 画像の幅(pixel)
	long	height ;		// 画像の高さ(pixel)
	WORD	x_density ;		// 画素の水平方向密度
	WORD	y_density ;		// 画素の垂直方向密度
	short	colorDepth ;	// １画素当たりのbit数
	HLOCAL	hInfo ;			// 画像内のテキスト情報
} ;

#pragma	pack( pop, ENTER_SUSIE_ALIGN )


// コールバック関数
typedef	int (PASCAL *PFUNC_PROGRESSCALLBACK)
					( int nNum, int nDenom, long lData ) ;

// 画像を展開する
extern "C" __declspec( dllexport )
	int PASCAL GetPicture
		(
			LPSTR buf, long len, unsigned int flag,
			HANDLE * pHBInfo, HANDLE * pHBm,
			PFUNC_PROGRESSCALLBACK lpPrgressCallback, long lData
		) ;

// プレビュー表示画像展開ルーチン
extern "C" __declspec( dllexport )
	int PASCAL GetPreview
		(
			LPSTR buf, long len, unsigned int flag,
			HANDLE * pHBInfo, HANDLE * pHBm,
			PFUNC_PROGRESSCALLBACK lpPrgressCallback, long lData
		) ;

//
// データ入力インターフェース
//////////////////////////////////////////////////////////////////////////////

class	ERIInputContext : public	RLHDecodeContext
{
public:
	ERIFile *	m_pFile ;

public:
	// 構築関数
	ERIInputContext( ULONG nBufferingSize ) ;
	// 次のデータを読み込む
	virtual ULONG ReadNextData( PBYTE ptrBuffer, ULONG nBytes ) ;
} ;


//
// 展開オブジェクト
//////////////////////////////////////////////////////////////////////////////

class	MyERIDecoder : public	ERIDecoder
{
public:
	PFUNC_PROGRESSCALLBACK	m_pfnPrgCallback ;
	long					m_nInstance ;
	int						m_nLastRatio ;

public:
	// 展開進行状況通知関数
	virtual int OnDecodedBlock( LONG line, LONG column ) ;
	virtual int OnDecodedLine( LONG line ) ;

} ;

