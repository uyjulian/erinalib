// miocompress.h : MIOCOMPRESS アプリケーションのメイン ヘッダー ファイルです。
//

#if !defined(AFX_MIOCOMPRESS_H__5F9AA228_BA2F_47B1_909F_734A78DF5B7A__INCLUDED_)
#define AFX_MIOCOMPRESS_H__5F9AA228_BA2F_47B1_909F_734A78DF5B7A__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// メイン シンボル

/////////////////////////////////////////////////////////////////////////////
// CMiocompressApp:
// このクラスの動作の定義に関しては miocompress.cpp ファイルを参照してください。
//

class CMiocompressApp : public CWinApp
{
public:
	CMiocompressApp( void ) ;
	~CMiocompressApp( void ) ;

// オーバーライド
	// ClassWizard は仮想関数のオーバーライドを生成します。
	//{{AFX_VIRTUAL(CMiocompressApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// インプリメンテーション

	//{{AFX_MSG(CMiocompressApp)
		// メモ - ClassWizard はこの位置にメンバ関数を追加または削除します。
		//        この位置に生成されるコードを編集しないでください。
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

extern	CMiocompressApp theApp ;

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio は前行の直前に追加の宣言を挿入します。

#endif // !defined(AFX_MIOCOMPRESS_H__5F9AA228_BA2F_47B1_909F_734A78DF5B7A__INCLUDED_)
