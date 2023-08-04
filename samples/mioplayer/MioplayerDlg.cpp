// mioplayerDlg.cpp : インプリメンテーション ファイル
//

#include "stdafx.h"
#include "mioplayer.h"
#include "mioplayobj.h"
#include "mioplayerDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// アプリケーションのバージョン情報で使われている CAboutDlg ダイアログ

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// ダイアログ データ
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard は仮想関数のオーバーライドを生成します
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV のサポート
	//}}AFX_VIRTUAL

// インプリメンテーション
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// メッセージ ハンドラがありません。
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMioplayerDlg ダイアログ

CMioplayerDlg::CMioplayerDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CMioplayerDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CMioplayerDlg)
		// メモ: この位置に ClassWizard によってメンバの初期化が追加されます。
	//}}AFX_DATA_INIT
	// メモ: LoadIcon は Win32 の DestroyIcon のサブシーケンスを要求しません。
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);

	m_fLoaded = false ;
	m_dwLastTime = -1 ;
}

void CMioplayerDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CMioplayerDlg)
	DDX_Control(pDX, IDC_SLIDER, m_sliderPos);
	DDX_Control(pDX, IDC_BUTTON_STOP, m_buttonStop);
	DDX_Control(pDX, IDC_BUTTON_PLAY, m_buttonPlay);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CMioplayerDlg, CDialog)
	//{{AFX_MSG_MAP(CMioplayerDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_WM_DROPFILES()
	ON_WM_HSCROLL()
	ON_BN_CLICKED(IDC_BUTTON_BROWSE, OnButtonBrowse)
	ON_BN_CLICKED(IDC_BUTTON_PLAY, OnButtonPlay)
	ON_BN_CLICKED(IDC_BUTTON_STOP, OnButtonStop)
	ON_WM_TIMER()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


//
// ファイルを読み込む
//////////////////////////////////////////////////////////////////////////////
void CMioplayerDlg::LoadMIOFile( const char * pszFileName )
{
	//
	// MIO ファイルを読み込む
	const char *	pszErrMsg = m_mioPlayObj.Open( pszFileName ) ;
	if ( pszErrMsg != NULL )
	{
		MessageBox( pszErrMsg, "エラー", MB_OK | MB_ICONERROR ) ;
		//
		m_buttonPlay.LoadBitmaps
			( IDB_PLAY0, IDB_PLAY1, IDB_PLAY2, IDB_PLAY3 ) ;
		m_buttonPlay.InvalidateRect( NULL, FALSE ) ;
		m_buttonPlay.EnableWindow( FALSE ) ;
		m_buttonStop.EnableWindow( FALSE ) ;
		//
		SetDlgItemText( IDC_STATIC_FILE, "" ) ;
		m_fLoaded = false ;
		UpdateDisplay( ) ;
		return ;
	}
	//
	// 読み込み成功
	SetDlgItemText( IDC_STATIC_FILE, pszFileName ) ;
	m_fLoaded = true ;
	m_fTracking = false ;
	m_dwLastTime = -1 ;
	m_sliderPos.SetRange( 0, 0xFFFF, FALSE ) ;
	//
	m_buttonPlay.LoadBitmaps
		( IDB_PLAY0, IDB_PLAY1, IDB_PLAY2, IDB_PLAY3 ) ;
	m_buttonPlay.InvalidateRect( NULL, FALSE ) ;
	m_buttonPlay.EnableWindow( TRUE ) ;
	m_buttonStop.EnableWindow( FALSE ) ;
	//
	UpdateDisplay( ) ;
}

//
// 表示を更新
//////////////////////////////////////////////////////////////////////////////
void CMioplayerDlg::UpdateDisplay( void )
{
	if ( m_fLoaded )
	{
		DWORD	dwTotalSample = m_mioPlayObj.GetTotalSampleCount( ) ;
		DWORD	dwCurrentSample = m_mioPlayObj.GetCurrentSample( ) ;
		DWORD	dwTotal =
			m_mioPlayObj.SampleToMilliSec( dwTotalSample ) / 1000 ;
		DWORD	dwCurrent =
			m_mioPlayObj.SampleToMilliSec( dwCurrentSample ) / 1000 ;
		//
		if ( dwCurrent != m_dwLastTime )
		{
			m_dwLastTime = dwCurrent ;
			//
			int		nTotalSec = dwTotal % 60 ;
			int		nTotalMinute = (dwTotal / 60) % 60 ;
			int		nTotalHour = dwTotal / (60 * 60) ;
			int		nCurrentSec = dwCurrent % 60 ;
			int		nCurrentMinute = (dwCurrent / 60) % 60 ;
			int		nCurrentHour = dwCurrent / (60 * 60) ;
			//
			CString	strTime ;
			strTime.Format
				( "%02d:%02d:%02d / %02d:%02d:%02d",
					nCurrentHour, nCurrentMinute, nCurrentSec,
					nTotalHour, nTotalMinute, nTotalSec ) ;
			SetDlgItemText( IDC_STATIC_TIME, strTime ) ;
			//
			if ( (dwTotalSample != 0) && !m_fTracking )
			{
				m_sliderPos.SetPos
					( ::MulDiv( dwCurrentSample, 0xFFFF, dwTotalSample ) ) ;
			}
		}
	}
	else
	{
		if ( m_dwLastTime != (DWORD) -1 )
		{
			m_dwLastTime = (DWORD) -1 ;
			//
			SetDlgItemText( IDC_STATIC_TIME, "##:##:## / ##:##:##" ) ;
			m_sliderPos.SetRange( 0, 0, FALSE ) ;
			m_sliderPos.SetPos( 0 ) ;
		}
	}
}


/////////////////////////////////////////////////////////////////////////////
// CMioplayerDlg メッセージ ハンドラ

BOOL CMioplayerDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// "バージョン情報..." メニュー項目をシステム メニューへ追加します。

	// IDM_ABOUTBOX はコマンド メニューの範囲でなければなりません。
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// このダイアログ用のアイコンを設定します。フレームワークはアプリケーションのメイン
	// ウィンドウがダイアログでない時は自動的に設定しません。
	SetIcon(m_hIcon, TRUE);			// 大きいアイコンを設定
	SetIcon(m_hIcon, FALSE);		// 小さいアイコンを設定

	// TODO: 特別な初期化を行う時はこの場所に追加してください。
	m_mioPlayObj.SetWindowToNotifyDone( m_hWnd ) ;
	//
	m_buttonPlay.LoadBitmaps( IDB_PLAY0, IDB_PLAY1, IDB_PLAY2, IDB_PLAY3 ) ;
	m_buttonStop.LoadBitmaps( IDB_STOP0, IDB_STOP1, IDB_STOP2, IDB_STOP3 ) ;
	m_buttonPlay.EnableWindow( FALSE ) ;
	m_buttonStop.EnableWindow( FALSE ) ;
	//
	m_sliderPos.SetRange( 0, 0, FALSE ) ;
	//
	DragAcceptFiles( TRUE ) ;
	//
	SetTimer( 1, 200, NULL ) ;

	return TRUE;  // TRUE を返すとコントロールに設定したフォーカスは失われません。
}

void CMioplayerDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// もしダイアログボックスに最小化ボタンを追加するならば、アイコンを描画する
// コードを以下に記述する必要があります。MFC アプリケーションは document/view
// モデルを使っているので、この処理はフレームワークにより自動的に処理されます。

void CMioplayerDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // 描画用のデバイス コンテキスト

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// クライアントの矩形領域内の中央
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// アイコンを描画します。
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// システムは、ユーザーが最小化ウィンドウをドラッグしている間、
// カーソルを表示するためにここを呼び出します。
HCURSOR CMioplayerDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

//
// ダミー
//////////////////////////////////////////////////////////////////////////////
void CMioplayerDlg::OnOK() 
{
//	CDialog::OnOK();
}

//
// 終了
//////////////////////////////////////////////////////////////////////////////
void CMioplayerDlg::OnCancel() 
{
	CDialog::OnCancel();
}

//
// ファイルをドロップした
//////////////////////////////////////////////////////////////////////////////
void CMioplayerDlg::OnDropFiles(HDROP hDropInfo) 
{
	CString	strFileName ;
	::DragQueryFile( hDropInfo, 0, strFileName.GetBuffer( 0x200 ), 0x200 ) ;
	strFileName.ReleaseBuffer( ) ;
	//
	LoadMIOFile( strFileName ) ;

	CDialog::OnDropFiles(hDropInfo);
}

//
// スライダバーを移動した
//////////////////////////////////////////////////////////////////////////////
void CMioplayerDlg::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar) 
{
	if ( pScrollBar->m_hWnd == m_sliderPos.m_hWnd )
	{
		if ( nSBCode == TB_THUMBPOSITION )
		{
			//
			// 指定ポイントへシーク
			if ( m_fLoaded && m_mioPlayObj.IsPlaying() )
			{
				if ( m_mioPlayObj.IsPaused() )
				{
					OnButtonStop( ) ;
				}
				else
				{
					m_mioPlayObj.Stop( ) ;
					//
					MSG		msg ;
					while ( ::GetMessage( &msg, m_hWnd, 0, 0 ) )
					{
						::TranslateMessage( &msg ) ;
						::DispatchMessage( &msg ) ;
						//
						if ( msg.message == MM_WOM_DONE )
							break ;
					}
					//
					OnButtonPlay( ) ;
				}
			}
			m_fTracking = false ;
		}
		else if ( nSBCode == TB_THUMBTRACK )
		{
			//
			// トラッキング開始
			m_fTracking = true ;
		}
	}

	CDialog::OnHScroll(nSBCode, nPos, pScrollBar);
}

//
// ファイルを開く
//////////////////////////////////////////////////////////////////////////////
void CMioplayerDlg::OnButtonBrowse() 
{
	CFileDialog	fdlg
		( TRUE, NULL, NULL, OFN_FILEMUSTEXIST,
			"MIO file (*.mio)|*.mio||", this ) ;
	if ( fdlg.DoModal( ) == IDOK )
	{
		LoadMIOFile( fdlg.GetPathName( ) ) ;
	}
}

//
// 再生開始／一時停止
//////////////////////////////////////////////////////////////////////////////
void CMioplayerDlg::OnButtonPlay() 
{
	if ( !m_fLoaded )
	{
		return ;
	}
	if ( m_mioPlayObj.IsPlaying() )
	{
		if ( m_mioPlayObj.IsPaused() )
		{
			m_mioPlayObj.Restart( ) ;
		}
		else
		{
			m_mioPlayObj.Pause( ) ;
		}
	}
	else
	{
		if ( m_mioPlayObj.PlayFrom
			( ::MulDiv( m_sliderPos.GetPos(),
					m_mioPlayObj.GetTotalSampleCount(), 0xFFFF ) ) )
		{
			m_buttonPlay.LoadBitmaps
				( IDB_PAUSE0, IDB_PAUSE1, IDB_PAUSE2, IDB_PAUSE3 ) ;
			m_buttonPlay.InvalidateRect( NULL, FALSE ) ;
			m_buttonPlay.EnableWindow( TRUE ) ;
			m_buttonStop.EnableWindow( TRUE ) ;
		}
	}
}

//
// 停止
//////////////////////////////////////////////////////////////////////////////
void CMioplayerDlg::OnButtonStop() 
{
	if ( !m_fLoaded )
	{
		return ;
	}
	if ( m_mioPlayObj.IsPaused() )
	{
		m_mioPlayObj.Restart( ) ;
	}
	if ( m_mioPlayObj.IsPlaying() )
	{
		m_mioPlayObj.Stop( ) ;
	}
	//
	m_buttonPlay.LoadBitmaps
		( IDB_PLAY0, IDB_PLAY1, IDB_PLAY2, IDB_PLAY3 ) ;
	m_buttonPlay.InvalidateRect( NULL, FALSE ) ;
	m_buttonPlay.EnableWindow( TRUE ) ;
	m_buttonStop.EnableWindow( FALSE ) ;
}

//
// タイマー
//////////////////////////////////////////////////////////////////////////////
void CMioplayerDlg::OnTimer(UINT nIDEvent) 
{
	UpdateDisplay( ) ;

	CDialog::OnTimer(nIDEvent);
}

//
// ウィンドウプロシージャ
//////////////////////////////////////////////////////////////////////////////
LRESULT CMioplayerDlg::WindowProc(UINT message, WPARAM wParam, LPARAM lParam) 
{
	if ( message == MM_WOM_DONE )
	{
		m_buttonPlay.LoadBitmaps
			( IDB_PLAY0, IDB_PLAY1, IDB_PLAY2, IDB_PLAY3 ) ;
		m_buttonPlay.InvalidateRect( NULL, FALSE ) ;
		m_buttonPlay.EnableWindow( TRUE ) ;
		m_buttonStop.EnableWindow( FALSE ) ;
	}

	return CDialog::WindowProc(message, wParam, lParam);
}
