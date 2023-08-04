// miocompressDlg.cpp : �C���v�������e�[�V���� �t�@�C��
//

#include "stdafx.h"
#include "miocompress.h"
#include "ProgressDlg.h"
#include "miocompressDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// �A�v���P�[�V�����̃o�[�W�������Ŏg���Ă��� CAboutDlg �_�C�A���O

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// �_�C�A���O �f�[�^
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard �͉��z�֐��̃I�[�o�[���C�h�𐶐����܂�
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV �̃T�|�[�g
	//}}AFX_VIRTUAL

// �C���v�������e�[�V����
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
		// ���b�Z�[�W �n���h��������܂���B
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMiocompressDlg �_�C�A���O

CMiocompressDlg::CMiocompressDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CMiocompressDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CMiocompressDlg)
	//}}AFX_DATA_INIT
	// ����: LoadIcon �� Win32 �� DestroyIcon �̃T�u�V�[�P���X��v�����܂���B
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CMiocompressDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CMiocompressDlg)
	DDX_Control(pDX, IDC_EDIT_PE_THRESHOLD, m_editPEThreshold);
	DDX_Control(pDX, IDC_CHECK_MSS, m_checkUseMSS);
	DDX_Control(pDX, IDC_EDIT_ODD_WEIGHT, m_editOddWeight);
	DDX_Control(pDX, IDC_COMBO_DEGREE, m_comboDegree);
	DDX_Control(pDX, IDC_EDIT_MIDDLE_WEIGHT, m_editMiddleWeight);
	DDX_Control(pDX, IDC_EDIT_LOW_WEIGHT, m_editLowWeight);
	DDX_Control(pDX, IDC_EDIT_POWER_SCALE, m_editPowerScale);
	DDX_Control(pDX, IDC_LIST_FILES, m_listFiles);
	DDX_Control(pDX, IDC_COMBO_OPTION, m_comboOption);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CMiocompressDlg, CDialog)
	//{{AFX_MSG_MAP(CMiocompressDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_WM_DROPFILES()
	ON_BN_CLICKED(IDC_BUTTON_ADD, OnButtonAdd)
	ON_BN_CLICKED(IDC_BUTTON_DELETE, OnButtonDelete)
	ON_BN_CLICKED(IDC_BUTTON_DELETE_ALL, OnButtonDeleteAll)
	ON_CBN_SELCHANGE(IDC_COMBO_OPTION, OnSelchangeComboOption)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMiocompressDlg ���b�Z�[�W �n���h��

BOOL CMiocompressDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// "�o�[�W�������..." ���j���[���ڂ��V�X�e�� ���j���[�֒ǉ����܂��B

	// IDM_ABOUTBOX �̓R�}���h ���j���[�͈̔͂łȂ���΂Ȃ�܂���B
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

	// ���̃_�C�A���O�p�̃A�C�R����ݒ肵�܂��B�t���[�����[�N�̓A�v���P�[�V�����̃��C��
	// �E�B���h�E���_�C�A���O�łȂ����͎����I�ɐݒ肵�܂���B
	SetIcon(m_hIcon, TRUE);			// �傫���A�C�R����ݒ�
	SetIcon(m_hIcon, FALSE);		// �������A�C�R����ݒ�
	
	// TODO: ���ʂȏ��������s�����͂��̏ꏊ�ɒǉ����Ă��������B
	int	nSimpleOption =
		theApp.GetProfileInt( "option", "simple_option", 4 ) ;
	m_comboOption.SetCurSel( nSimpleOption ) ;
	SetDlgItemDouble( IDC_EDIT_LOW_WEIGHT,
		theApp.GetProfileInt( "option", "low_weight", 400000 ) / 100000.0 ) ;
	SetDlgItemDouble( IDC_EDIT_MIDDLE_WEIGHT,
		theApp.GetProfileInt( "option", "middle_weight", 300000 ) / 100000.0 ) ;
	SetDlgItemInt( IDC_EDIT_ODD_WEIGHT,
		theApp.GetProfileInt( "option", "odd_weight", 1 ), FALSE ) ;
	SetDlgItemInt( IDC_EDIT_PE_THRESHOLD,
		theApp.GetProfileInt( "option", "pe_threshold", 2 ), FALSE ) ;
	SetDlgItemInt( IDC_EDIT_POWER_SCALE,
		theApp.GetProfileInt( "option", "power_scale", 95 ), FALSE ) ;
	m_comboDegree.SetCurSel
		( theApp.GetProfileInt( "option", "matrix_degree", 1 ) ) ;
	m_checkUseMSS.SetCheck( theApp.GetProfileInt( "option", "use_mss", 1 ) ) ;
	//
	if ( nSimpleOption == 0 )
	{
		m_editLowWeight.EnableWindow( FALSE ) ;
		m_editMiddleWeight.EnableWindow( FALSE ) ;
		m_editOddWeight.EnableWindow( FALSE ) ;
		m_editPEThreshold.EnableWindow( FALSE ) ;
		m_editPowerScale.EnableWindow( FALSE ) ;
		m_comboDegree.EnableWindow( FALSE ) ;
		m_checkUseMSS.EnableWindow( FALSE ) ;
	}
	//
	DragAcceptFiles( TRUE ) ;

	return TRUE;  // TRUE ��Ԃ��ƃR���g���[���ɐݒ肵���t�H�[�J�X�͎����܂���B
}

void CMiocompressDlg::OnSysCommand(UINT nID, LPARAM lParam)
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

// �����_�C�A���O�{�b�N�X�ɍŏ����{�^����ǉ�����Ȃ�΁A�A�C�R����`�悷��
// �R�[�h���ȉ��ɋL�q����K�v������܂��BMFC �A�v���P�[�V������ document/view
// ���f�����g���Ă���̂ŁA���̏����̓t���[�����[�N�ɂ�莩���I�ɏ�������܂��B

void CMiocompressDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // �`��p�̃f�o�C�X �R���e�L�X�g

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// �N���C�A���g�̋�`�̈���̒���
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// �A�C�R����`�悵�܂��B
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// �V�X�e���́A���[�U�[���ŏ����E�B���h�E���h���b�O���Ă���ԁA
// �J�[�\����\�����邽�߂ɂ������Ăяo���܂��B
HCURSOR CMiocompressDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

//
// �t�@�C�����h���b�v����
//////////////////////////////////////////////////////////////////////////////
void CMiocompressDlg::OnDropFiles(HDROP hDropInfo) 
{
	CString	strFileName ;
	UINT	nFileCount = ::DragQueryFile( hDropInfo, -1, NULL, 0 ) ;
	for ( UINT i = 0; i < nFileCount; i ++ )
	{
		::DragQueryFile
			( hDropInfo, i, strFileName.GetBuffer( 0x200 ), 0x200 ) ;
		strFileName.ReleaseBuffer( ) ;
		//
		m_listFiles.AddString( strFileName ) ;
	}

	CDialog::OnDropFiles(hDropInfo);
}

//
// �t�@�C���ǉ�
//////////////////////////////////////////////////////////////////////////////
void CMiocompressDlg::OnButtonAdd() 
{
	//
	// �t�@�C���I��
	CString	strFileBuf ;
	CFileDialog	fdlg( TRUE, NULL, NULL,
		(OFN_ALLOWMULTISELECT | OFN_FILEMUSTEXIST),
		"Wave form audio (*.wav)|*.wav||", this ) ;
	fdlg.m_ofn.lpstrFile = strFileBuf.GetBuffer( 0xFFFF ) ;
	fdlg.m_ofn.nMaxFile = 0xFFFF ;
	//
	if ( fdlg.DoModal( ) == IDOK )
	{
		//
		// �t�@�C�������X�g�ɒǉ�
		POSITION	pos = fdlg.GetStartPosition( ) ;
		while ( pos != NULL )
		{
			m_listFiles.AddString( fdlg.GetNextPathName( pos ) ) ;
		}
	}
}

//
// �t�@�C�������X�g����폜
//////////////////////////////////////////////////////////////////////////////
void CMiocompressDlg::OnButtonDelete() 
{
	int	nListCount = m_listFiles.GetCount( ) ;
	if ( nListCount > 0 )
	{
		int *	pSelItem = new int[nListCount] ;
		int	nSelCount = m_listFiles.GetSelItems( nListCount, pSelItem ) ;
		//
		for ( int i = nSelCount - 1; i >= 0; i -- )
		{
			m_listFiles.DeleteString( pSelItem[i] ) ;
		}
		delete []	pSelItem ;
	}
}

//
// �S�Ẵt�@�C�������X�g����폜
//////////////////////////////////////////////////////////////////////////////
void CMiocompressDlg::OnButtonDeleteAll() 
{
	m_listFiles.ResetContent( ) ;
}

//
// �ȈՃp�����[�^�w�肪�ύX���ꂽ
//////////////////////////////////////////////////////////////////////////////
void CMiocompressDlg::OnSelchangeComboOption( )
{
	int	nSimpleOption = m_comboOption.GetCurSel( ) ;
	SetPresetParameter( nSimpleOption ) ;
}

//
// �v���Z�b�g�l��ݒ�
//////////////////////////////////////////////////////////////////////////////
void CMiocompressDlg::SetPresetParameter( int nSimpleOption )
{
	struct	PRESET_PARAMETER
	{
		double		low_weight ;
		double		middle_weight ;
		int			odd_weight ;
		int			pe_threshold ;
		signed int	power_scale ;
		int			matrix_degree ;
		int			use_mss ;
	} ;
	static const PRESET_PARAMETER	preset[9] =
	{
		{	4.0,	3.0,	0,	2,	256,	0,	0	},			// 1/6
		{	4.0,	3.0,	0,	2,	140,	1,	0	},			// 1/8
		{	4.0,	3.0,	0,	2,	108,	1,	1	},			// 1/9
		{	4.0,	3.0,	1,	2,	95,		1,	1	},			// 1/10
		{	4.0,	3.0,	1,	2,	85,		1,	1	},			// 1/11
		{	4.0,	3.0,	1,	2,	75,		1,	1	},			// 1/12
		{	4.0,	3.0,	2,	4,	57,		2,	1	},			// 1/15
		{	4.0,	3.0,	2,	6,	49,		2,	1	},			// 1/18
		{	4.0,	3.0,	2,	8,	42,		3,	1	}			// 1/20
	} ;
	if ( nSimpleOption == 0 )
	{
		m_editLowWeight.EnableWindow( FALSE ) ;
		m_editMiddleWeight.EnableWindow( FALSE ) ;
		m_editOddWeight.EnableWindow( FALSE ) ;
		m_editPEThreshold.EnableWindow( FALSE ) ;
		m_editPowerScale.EnableWindow( FALSE ) ;
		m_comboDegree.EnableWindow( FALSE ) ;
		m_checkUseMSS.EnableWindow( FALSE ) ;
	}
	else if ( nSimpleOption <= 9 )
	{
		m_editLowWeight.EnableWindow( TRUE ) ;
		m_editMiddleWeight.EnableWindow( TRUE ) ;
		m_editOddWeight.EnableWindow( TRUE ) ;
		m_editPEThreshold.EnableWindow( TRUE ) ;
		m_editPowerScale.EnableWindow( TRUE ) ;
		m_comboDegree.EnableWindow( TRUE ) ;
		m_checkUseMSS.EnableWindow( TRUE ) ;
		//
		nSimpleOption -- ;
		SetDlgItemDouble
			( IDC_EDIT_LOW_WEIGHT, preset[nSimpleOption].low_weight ) ;
		SetDlgItemDouble
			( IDC_EDIT_MIDDLE_WEIGHT, preset[nSimpleOption].middle_weight ) ;
		SetDlgItemInt
			( IDC_EDIT_ODD_WEIGHT, preset[nSimpleOption].odd_weight, FALSE ) ;
		SetDlgItemInt
			( IDC_EDIT_PE_THRESHOLD, preset[nSimpleOption].pe_threshold, FALSE ) ;
		SetDlgItemInt
			( IDC_EDIT_POWER_SCALE,
				preset[nSimpleOption].power_scale, FALSE ) ;
		m_comboDegree.SetCurSel( preset[nSimpleOption].matrix_degree ) ;
		m_checkUseMSS.SetCheck( preset[nSimpleOption].use_mss ) ;
	}
}

//
// �������擾����
//////////////////////////////////////////////////////////////////////////////
bool CMiocompressDlg::GetDlgItemDouble( int nID, double & value )
{
	//
	// ������擾
	CString	string ;
	GetDlgItemText( nID, string ) ;
	//
	// �����ɕϊ�
	bool	fSuccessful = true ;
	int		i = 0 ;
	double	r = 0.0 ;
	double	base = 1.0 ;
	while ( i < string.GetLength() )
	{
		char	c = string.GetAt( i ++ ) ;
		if ( (c >= '0') && (c <= '9') )
		{
			if ( base >= 1.0 )
			{
				r = r * 10.0 + (c - '0') ;
			}
			else
			{
				r += (c - '0') * base ;
				base *= 0.1 ;
			}
		}
		else if ( c == '.' )
		{
			base *= 0.1 ;
		}
		else
		{
			fSuccessful = false ;
			break ;
		}
	}
	//
	value = r ;
	return	fSuccessful ;
}

//
// ������ݒ肷��
//////////////////////////////////////////////////////////////////////////////
void CMiocompressDlg::SetDlgItemDouble( int nID, double value )
{
	//
	// �����񐶐�
	CString	string ;
	string.Format( "%d.", (int) value ) ;
	//
	int	decimal = (int)(value * 100000 + 0.5) - ((int)value) * 100000 ;
	while ( decimal != 0 )
	{
		int		n = decimal / 10000 ;
		string += (char)(n + '0') ;
		decimal = (decimal - n * 10000) * 10 ;
	}
	//
	// ������ݒ�
	SetDlgItemText( nID, string ) ;
}

//
// ���k�J�n
//////////////////////////////////////////////////////////////////////////////
void CMiocompressDlg::OnOK() 
{
	CProgressDlg	prgdlg( this ) ;
	//
	// ���k�p�����[�^�ݒ�
	//
	BOOL			fTrans ;
	bool			fLossless ;
	int				nSimpleOption ;
	double			rLowWeight, rMiddleWeight ;
	int				nOddWeight ;
	int				nPEThreshold ;
	signed int		nPowerScale ;
	signed int		nDegreeSel ;
	unsigned int	nMatrixDegree ;
	bool			fUseMSS ;
	//
	nSimpleOption = m_comboOption.GetCurSel( ) ;
	fLossless = (nSimpleOption == 0) ;
	fTrans = GetDlgItemDouble( IDC_EDIT_LOW_WEIGHT, rLowWeight ) ;
	if ( !fLossless && !fTrans )
	{
		MessageBox
			( "�u����g�̏d�݁v�ɐ��������l���w�肵�Ă��������B",
				"�G���[", (MB_OK | MB_ICONERROR) ) ;
		return ;
	}
	fTrans = GetDlgItemDouble( IDC_EDIT_MIDDLE_WEIGHT, rMiddleWeight ) ;
	if ( !fLossless && !fTrans )
	{
		MessageBox
			( "�u�����g�̏d�݁v�ɐ��������l���w�肵�Ă��������B",
				"�G���[", (MB_OK | MB_ICONERROR) ) ;
		return ;
	}
	nOddWeight = GetDlgItemInt( IDC_EDIT_ODD_WEIGHT, &fTrans, FALSE ) ;
	if ( !fLossless && !fTrans )
	{
		MessageBox
			( "�u�a�c�΍�W���v�ɐ��������l���w�肵�Ă��������B",
				"�G���[", (MB_OK | MB_ICONERROR) ) ;
		return ;
	}
	if ( (nOddWeight < 0) || (nOddWeight > 2) )
	{
		MessageBox
			( "�u�a�c�΍�W���v�ɂ́A0�`2���w�肵�Ă��������B",
				"�G���[", (MB_OK | MB_ICONERROR) ) ;
		return ;
	}
	nPEThreshold = GetDlgItemInt( IDC_EDIT_PE_THRESHOLD, &fTrans, FALSE ) ;
	if ( !fLossless && !fTrans )
	{
		MessageBox
			( "�uPE臒l�W���v�ɐ��������l���w�肵�Ă��������B",
				"�G���[", (MB_OK | MB_ICONERROR) ) ;
		return ;
	}
	if ( nPEThreshold < 2 )
	{
		MessageBox
			( "�uPE臒l�W���v�ɂ́A2�ȏ�̐��l���w�肵�Ă��������B",
				"�G���[", (MB_OK | MB_ICONERROR) ) ;
		return ;
	}
	nPowerScale = GetDlgItemInt( IDC_EDIT_POWER_SCALE, &fTrans, FALSE ) ;
	if ( !fLossless && !fTrans )
	{
		MessageBox
			( "�u�ʎq���W���v�ɐ��������l���w�肵�Ă��������B",
				"�G���[", (MB_OK | MB_ICONERROR) ) ;
		return ;
	}
	nDegreeSel = m_comboDegree.GetCurSel( ) ;
	if ( (nDegreeSel < 0) || (nDegreeSel > 4) )
	{
		MessageBox
			( "�u�s��T�C�Y�v��I�����Ă��������B",
				"�G���[", (MB_OK | MB_ICONERROR) ) ;
	}
	else
	{
		nMatrixDegree = nDegreeSel + 9 ;
	}
	fUseMSS = !!m_checkUseMSS.GetCheck( ) ;
	//
	prgdlg.SetCompressionParameter
		( fLossless, rLowWeight, rMiddleWeight, nOddWeight,
			nPEThreshold, nPowerScale / 256.0, nMatrixDegree, 1, fUseMSS ) ;
	//
	// ���k�t�@�C�����X�g�ݒ�
	//
	int		nFileCount = m_listFiles.GetCount( ) ;
	if ( nFileCount <= 0 )
	{
		MessageBox
			( "�t�@�C�����w�肳��Ă��܂���B",
				"�G���[", (MB_OK | MB_ICONERROR) ) ;
		return ;
	}
	for ( int i = 0; i < nFileCount; i ++ )
	{
		CString		strFilePath ;
		m_listFiles.GetText( i, strFilePath ) ;
		prgdlg.AddFileEntry( strFilePath ) ;
	}
	//
	// ���k�p�����[�^��ۑ�
	//
	theApp.WriteProfileInt( "option", "simple_option", nSimpleOption ) ;
	theApp.WriteProfileInt
		( "option", "low_weight", (int)(rLowWeight * 100000) ) ;
	theApp.WriteProfileInt
		( "option", "middle_weight", (int)(rMiddleWeight * 100000) ) ;
	theApp.WriteProfileInt( "option", "odd_weight", nOddWeight ) ;
	theApp.WriteProfileInt( "option", "pe_threshold", nPEThreshold ) ;
	theApp.WriteProfileInt( "option", "power_scale", nPowerScale ) ;
	theApp.WriteProfileInt( "option", "matrix_degree", nDegreeSel ) ;
	theApp.WriteProfileInt( "option", "use_mss", fUseMSS ) ;
	//
	// �v���O���X�o�[��\��
	//
	if ( prgdlg.DoModal( ) == IDOK )
	{
		if ( MessageBox
			( "���X�g����S�Ẵt�@�C�����폜���܂����H",
				"MIO���k����", (MB_YESNO | MB_ICONQUESTION) ) == IDYES )
		{
			m_listFiles.ResetContent( ) ;
		}
	}

//	CDialog::OnOK();
}

