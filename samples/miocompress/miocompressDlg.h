// miocompressDlg.h : ヘッダー ファイル
//

#if !defined(AFX_MIOCOMPRESSDLG_H__2939458E_7510_4A54_A709_619C9F640FE1__INCLUDED_)
#define AFX_MIOCOMPRESSDLG_H__2939458E_7510_4A54_A709_619C9F640FE1__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CMiocompressDlg ダイアログ

class CMiocompressDlg : public CDialog
{
// 構築
public:
	CMiocompressDlg(CWnd* pParent = NULL);	// 標準のコンストラクタ

// ダイアログ データ
	//{{AFX_DATA(CMiocompressDlg)
	enum { IDD = IDD_MIOCOMPRESS_DIALOG };
	CEdit	m_editPEThreshold;
	CButton	m_checkUseMSS;
	CEdit	m_editOddWeight;
	CComboBox	m_comboDegree;
	CEdit	m_editMiddleWeight;
	CEdit	m_editLowWeight;
	CEdit	m_editPowerScale;
	CListBox	m_listFiles;
	CComboBox	m_comboOption;
	//}}AFX_DATA

	// ClassWizard は仮想関数のオーバーライドを生成します。
	//{{AFX_VIRTUAL(CMiocompressDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV のサポート
	//}}AFX_VIRTUAL

public:
	// プリセット値を設定
	void SetPresetParameter( int nSimpleOption ) ;
	// 実数を取得する
	bool GetDlgItemDouble( int nID, double & value ) ;
	// 実数を設定する
	void SetDlgItemDouble( int nID, double value ) ;

// インプリメンテーション
protected:
	HICON m_hIcon;

	// 生成されたメッセージ マップ関数
	//{{AFX_MSG(CMiocompressDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnDropFiles(HDROP hDropInfo);
	afx_msg void OnButtonAdd();
	afx_msg void OnButtonDelete();
	afx_msg void OnButtonDeleteAll();
	virtual void OnOK();
	afx_msg void OnSelchangeComboOption();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ は前行の直前に追加の宣言を挿入します。

#endif // !defined(AFX_MIOCOMPRESSDLG_H__2939458E_7510_4A54_A709_619C9F640FE1__INCLUDED_)
