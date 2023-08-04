// miocompress.cpp : アプリケーション用クラスの定義を行います。
//

#include "stdafx.h"
#include "miocompress.h"
#include "miocompressDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CMiocompressApp

BEGIN_MESSAGE_MAP(CMiocompressApp, CWinApp)
	//{{AFX_MSG_MAP(CMiocompressApp)
		// メモ - ClassWizard はこの位置にマッピング用のマクロを追加または削除します。
		//        この位置に生成されるコードを編集しないでください。
	//}}AFX_MSG
	ON_COMMAND(ID_HELP, CWinApp::OnHelp)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMiocompressApp クラスの構築

CMiocompressApp::CMiocompressApp( void )
{
	// TODO: この位置に構築用のコードを追加してください。
	// ここに InitInstance 中の重要な初期化処理をすべて記述してください。
	::eriInitializeLibrary( ) ;
}

CMiocompressApp::~CMiocompressApp( void )
{
	::eriCloseLibrary( ) ;
}

/////////////////////////////////////////////////////////////////////////////
// 唯一の CMiocompressApp オブジェクト

CMiocompressApp theApp;

/////////////////////////////////////////////////////////////////////////////
// CMiocompressApp クラスの初期化

BOOL CMiocompressApp::InitInstance()
{
	AfxEnableControlContainer();

	// 標準的な初期化処理
	// もしこれらの機能を使用せず、実行ファイルのサイズを小さくしたけ
	//  れば以下の特定の初期化ルーチンの中から不必要なものを削除して
	//  ください。

#ifdef _AFXDLL
	Enable3dControls();			// 共有 DLL 内で MFC を使う場合はここをコールしてください。
#else
	Enable3dControlsStatic();	// MFC と静的にリンクする場合はここをコールしてください。
#endif

	SetRegistryKey( "Entis-soft" ) ;
	free( (void*) m_pszAppName ) ;
	m_pszAppName = _tcsdup( "MIO-compressor" ) ;

	CMiocompressDlg dlg;
	m_pMainWnd = &dlg;
	int nResponse = dlg.DoModal();
	if (nResponse == IDOK)
	{
		// TODO: ダイアログが <OK> で消された時のコードを
		//       記述してください。
	}
	else if (nResponse == IDCANCEL)
	{
		// TODO: ダイアログが <ｷｬﾝｾﾙ> で消された時のコードを
		//       記述してください。
	}

	// ダイアログが閉じられてからアプリケーションのメッセージ ポンプを開始するよりは、
	// アプリケーションを終了するために FALSE を返してください。
	return FALSE;
}
