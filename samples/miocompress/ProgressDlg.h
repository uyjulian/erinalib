#if !defined(AFX_PROGRESSDLG_H__276DBFC3_E245_4AA8_8807_F456F0C86154__INCLUDED_)
#define AFX_PROGRESSDLG_H__276DBFC3_E245_4AA8_8807_F456F0C86154__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// ProgressDlg.h : ヘッダー ファイル
//

/////////////////////////////////////////////////////////////////////////////
// CProgressDlg ダイアログ

class CProgressDlg : public CDialog
{
// コンストラクション
public:
	CProgressDlg(CWnd* pParent = NULL);   // 標準のコンストラクタ
	~CProgressDlg( void ) ;

// ダイアログ データ
	//{{AFX_DATA(CProgressDlg)
	enum { IDD = IDD_PROGRESS_DLG };
	CProgressCtrl	m_progress;
	//}}AFX_DATA


// オーバーライド
	// ClassWizard は仮想関数のオーバーライドを生成します。
	//{{AFX_VIRTUAL(CProgressDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV サポート
	virtual LRESULT WindowProc(UINT message, WPARAM wParam, LPARAM lParam);
	//}}AFX_VIRTUAL

protected:
	// 圧縮パラメータ
	bool			m_fLossless ;
	double			m_rLowWeight ;
	double			m_rMiddleWeight ;
	int				m_nOddWeight ;
	int				m_nPEThreshold ;
	double			m_rPowerScale ;
	unsigned int	m_nMatrixDegree ;
	unsigned int	m_nLappedDegree ;
	bool			m_fUseMSS ;
	// 圧縮ファイルリスト
	CStringArray	m_listSrcFiles ;
	CStringArray	m_listDstFiles ;
	// スレッド
	CWinThread *	m_pThread ;

protected:
	enum	Message
	{
		WM_MESSAGEBOX	= WM_USER,
		WM_ENDDIALOG
	} ;
	struct	MESSAGEBOX_STRUCT
	{
		int				nResult ;
		const char *	pszMsg ;
		const char *	pszCaption ;
		int				nMBType ;
		HANDLE			hEvent ;

		MESSAGEBOX_STRUCT( void )
			{
				hEvent = ::CreateEvent( NULL, FALSE, FALSE, NULL ) ;
			}
		~MESSAGEBOX_STRUCT( void )
			{
				::CloseHandle( hEvent ) ;
			}
	} ;

public:
	// 圧縮パラメータ設定
	void SetCompressionParameter
		( bool fLossless, double rLowWeight,
			double rMiddleWeight, int nOddWeight, int nPEThreshold, double rPowerScale,
			unsigned int nMatrixDegree, unsigned int nLappedDegree, bool fUseMSS ) ;
	// 圧縮するファイル名追加
	void AddFileEntry( const char * pszFilePath ) ;

protected:
	// 圧縮操作スレッド
	static UINT ThreadProc( LPVOID parameter ) ;
	UINT CompressThreadProc( void ) ;

// インプリメンテーション
protected:

	// 生成されたメッセージ マップ関数
	//{{AFX_MSG(CProgressDlg)
	virtual BOOL OnInitDialog();
	virtual void OnCancel();
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ は前行の直前に追加の宣言を挿入します。

#endif // !defined(AFX_PROGRESSDLG_H__276DBFC3_E245_4AA8_8807_F456F0C86154__INCLUDED_)
