// mioplayerDlg.h : �w�b�_�[ �t�@�C��
//

#if !defined(AFX_MIOPLAYERDLG_H__2E68952C_98B6_42D1_8658_B26512F8549D__INCLUDED_)
#define AFX_MIOPLAYERDLG_H__2E68952C_98B6_42D1_8658_B26512F8549D__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CMioplayerDlg �_�C�A���O

class CMioplayerDlg : public CDialog
{
// �\�z
public:
	CMioplayerDlg(CWnd* pParent = NULL);	// �W���̃R���X�g���N�^

// �_�C�A���O �f�[�^
	//{{AFX_DATA(CMioplayerDlg)
	enum { IDD = IDD_MIOPLAYER_DIALOG };
	CSliderCtrl	m_sliderPos;
	CBitmapButton	m_buttonStop;
	CBitmapButton	m_buttonPlay;
	//}}AFX_DATA

	// ClassWizard �͉��z�֐��̃I�[�o�[���C�h�𐶐����܂��B
	//{{AFX_VIRTUAL(CMioplayerDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV �̃T�|�[�g
	virtual LRESULT WindowProc(UINT message, WPARAM wParam, LPARAM lParam);
	//}}AFX_VIRTUAL

protected:
	bool			m_fLoaded ;
	bool			m_fTracking ;
	MIOPlayObject	m_mioPlayObj ;
	DWORD			m_dwLastTime ;

protected:
	// �t�@�C����ǂݍ���
	void LoadMIOFile( const char * pszFileName ) ;
	// �\�����X�V
	void UpdateDisplay( void ) ;

// �C���v�������e�[�V����
protected:
	HICON m_hIcon;

	// �������ꂽ���b�Z�[�W �}�b�v�֐�
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
// Microsoft Visual C++ �͑O�s�̒��O�ɒǉ��̐錾��}�����܂��B

#endif // !defined(AFX_MIOPLAYERDLG_H__2E68952C_98B6_42D1_8658_B26512F8549D__INCLUDED_)
