// miocompressDlg.h : �w�b�_�[ �t�@�C��
//

#if !defined(AFX_MIOCOMPRESSDLG_H__2939458E_7510_4A54_A709_619C9F640FE1__INCLUDED_)
#define AFX_MIOCOMPRESSDLG_H__2939458E_7510_4A54_A709_619C9F640FE1__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CMiocompressDlg �_�C�A���O

class CMiocompressDlg : public CDialog
{
// �\�z
public:
	CMiocompressDlg(CWnd* pParent = NULL);	// �W���̃R���X�g���N�^

// �_�C�A���O �f�[�^
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

	// ClassWizard �͉��z�֐��̃I�[�o�[���C�h�𐶐����܂��B
	//{{AFX_VIRTUAL(CMiocompressDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV �̃T�|�[�g
	//}}AFX_VIRTUAL

public:
	// �v���Z�b�g�l��ݒ�
	void SetPresetParameter( int nSimpleOption ) ;
	// �������擾����
	bool GetDlgItemDouble( int nID, double & value ) ;
	// ������ݒ肷��
	void SetDlgItemDouble( int nID, double value ) ;

// �C���v�������e�[�V����
protected:
	HICON m_hIcon;

	// �������ꂽ���b�Z�[�W �}�b�v�֐�
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
// Microsoft Visual C++ �͑O�s�̒��O�ɒǉ��̐錾��}�����܂��B

#endif // !defined(AFX_MIOCOMPRESSDLG_H__2939458E_7510_4A54_A709_619C9F640FE1__INCLUDED_)
