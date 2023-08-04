#if !defined(AFX_PROGRESSDLG_H__276DBFC3_E245_4AA8_8807_F456F0C86154__INCLUDED_)
#define AFX_PROGRESSDLG_H__276DBFC3_E245_4AA8_8807_F456F0C86154__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// ProgressDlg.h : �w�b�_�[ �t�@�C��
//

/////////////////////////////////////////////////////////////////////////////
// CProgressDlg �_�C�A���O

class CProgressDlg : public CDialog
{
// �R���X�g���N�V����
public:
	CProgressDlg(CWnd* pParent = NULL);   // �W���̃R���X�g���N�^
	~CProgressDlg( void ) ;

// �_�C�A���O �f�[�^
	//{{AFX_DATA(CProgressDlg)
	enum { IDD = IDD_PROGRESS_DLG };
	CProgressCtrl	m_progress;
	//}}AFX_DATA


// �I�[�o�[���C�h
	// ClassWizard �͉��z�֐��̃I�[�o�[���C�h�𐶐����܂��B
	//{{AFX_VIRTUAL(CProgressDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV �T�|�[�g
	virtual LRESULT WindowProc(UINT message, WPARAM wParam, LPARAM lParam);
	//}}AFX_VIRTUAL

protected:
	// ���k�p�����[�^
	bool			m_fLossless ;
	double			m_rLowWeight ;
	double			m_rMiddleWeight ;
	int				m_nOddWeight ;
	int				m_nPEThreshold ;
	double			m_rPowerScale ;
	unsigned int	m_nMatrixDegree ;
	unsigned int	m_nLappedDegree ;
	bool			m_fUseMSS ;
	// ���k�t�@�C�����X�g
	CStringArray	m_listSrcFiles ;
	CStringArray	m_listDstFiles ;
	// �X���b�h
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
	// ���k�p�����[�^�ݒ�
	void SetCompressionParameter
		( bool fLossless, double rLowWeight,
			double rMiddleWeight, int nOddWeight, int nPEThreshold, double rPowerScale,
			unsigned int nMatrixDegree, unsigned int nLappedDegree, bool fUseMSS ) ;
	// ���k����t�@�C�����ǉ�
	void AddFileEntry( const char * pszFilePath ) ;

protected:
	// ���k����X���b�h
	static UINT ThreadProc( LPVOID parameter ) ;
	UINT CompressThreadProc( void ) ;

// �C���v�������e�[�V����
protected:

	// �������ꂽ���b�Z�[�W �}�b�v�֐�
	//{{AFX_MSG(CProgressDlg)
	virtual BOOL OnInitDialog();
	virtual void OnCancel();
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ �͑O�s�̒��O�ɒǉ��̐錾��}�����܂��B

#endif // !defined(AFX_PROGRESSDLG_H__276DBFC3_E245_4AA8_8807_F456F0C86154__INCLUDED_)
