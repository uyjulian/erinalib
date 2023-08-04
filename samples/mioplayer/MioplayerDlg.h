// mioplayerDlg.h : ヘッダー ファイル
//

#if !defined(AFX_MIOPLAYERDLG_H__2E68952C_98B6_42D1_8658_B26512F8549D__INCLUDED_)
#define AFX_MIOPLAYERDLG_H__2E68952C_98B6_42D1_8658_B26512F8549D__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CMioplayerDlg ダイアログ

class CMioplayerDlg : public CDialog
{
// 構築
public:
	CMioplayerDlg(CWnd* pParent = NULL);	// 標準のコンストラクタ

// ダイアログ データ
	//{{AFX_DATA(CMioplayerDlg)
	enum { IDD = IDD_MIOPLAYER_DIALOG };
	CSliderCtrl	m_sliderPos;
	CBitmapButton	m_buttonStop;
	CBitmapButton	m_buttonPlay;
	//}}AFX_DATA

	// ClassWizard は仮想関数のオーバーライドを生成します。
	//{{AFX_VIRTUAL(CMioplayerDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV のサポート
	virtual LRESULT WindowProc(UINT message, WPARAM wParam, LPARAM lParam);
	//}}AFX_VIRTUAL

protected:
	bool			m_fLoaded ;
	bool			m_fTracking ;
	MIOPlayObject	m_mioPlayObj ;
	DWORD			m_dwLastTime ;

protected:
	// ファイルを読み込む
	void LoadMIOFile( const char * pszFileName ) ;
	// 表示を更新
	void UpdateDisplay( void ) ;

// インプリメンテーション
protected:
	HICON m_hIcon;

	// 生成されたメッセージ マップ関数
	//{{AFX_MSG(CMioplayerDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnDropFiles(HDROP hDropInfo);
	afx_msg void OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
	virtual void OnOK();
	virtual void OnCancel();
	afx_msg void OnButtonBrowse();
	afx_msg void OnButtonPlay();
	afx_msg void OnButtonStop();
	afx_msg void OnTimer(UINT nIDEvent);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ は前行の直前に追加の宣言を挿入します。

#endif // !defined(AFX_MIOPLAYERDLG_H__2E68952C_98B6_42D1_8658_B26512F8549D__INCLUDED_)
