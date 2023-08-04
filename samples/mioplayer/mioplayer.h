// mioplayer.h : MIOPLAYER アプリケーションのメイン ヘッダー ファイルです。
//

#if !defined(AFX_MIOPLAYER_H__549CDCF7_B010_4BA6_B89E_2D8B3078587E__INCLUDED_)
#define AFX_MIOPLAYER_H__549CDCF7_B010_4BA6_B89E_2D8B3078587E__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// メイン シンボル

/////////////////////////////////////////////////////////////////////////////
// CMioplayerApp:
// このクラスの動作の定義に関しては mioplayer.cpp ファイルを参照してください。
//

class CMioplayerApp : public CWinApp
{
public:
	CMioplayerApp( void ) ;
	~CMioplayerApp( void ) ;

// オーバーライド
	// ClassWizard は仮想関数のオーバーライドを生成します。
	//{{AFX_VIRTUAL(CMioplayerApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// インプリメンテーション

	//{{AFX_MSG(CMioplayerApp)
		// メモ - ClassWizard はこの位置にメンバ関数を追加または削除します。
		//        この位置に生成されるコードを編集しないでください。
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

extern	CMioplayerApp theApp ;

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio は前行の直前に追加の宣言を挿入します。

#endif // !defined(AFX_MIOPLAYER_H__549CDCF7_B010_4BA6_B89E_2D8B3078587E__INCLUDED_)
