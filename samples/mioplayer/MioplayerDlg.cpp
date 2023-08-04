// mioplayerDlg.cpp : �C���v�������e�[�V���� �t�@�C��
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
// CMioplayerDlg �_�C�A���O

CMioplayerDlg::CMioplayerDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CMioplayerDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CMioplayerDlg)
		// ����: ���̈ʒu�� ClassWizard �ɂ���ă����o�̏��������ǉ�����܂��B
	//}}AFX_DATA_INIT
	// ����: LoadIcon �� Win32 �� DestroyIcon �̃T�u�V�[�P���X��v�����܂���B
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
// �t�@�C����ǂݍ���
//////////////////////////////////////////////////////////////////////////////
void CMioplayerDlg::LoadMIOFile( const char * pszFileName )
{
	//
	// MIO �t�@�C����ǂݍ���
	const char *	pszErrMsg = m_mioPlayObj.Open( pszFileName ) ;
	if ( pszErrMsg != NULL )
	{
		MessageBox( pszErrMsg, "�G���[", MB_OK | MB_ICONERROR ) ;
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
	// �ǂݍ��ݐ���
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
// �\�����X�V
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
// CMioplayerDlg ���b�Z�[�W �n���h��

BOOL CMioplayerDlg::OnInitDialog()
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

	return TRUE;  // TRUE ��Ԃ��ƃR���g���[���ɐݒ肵���t�H�[�J�X�͎����܂���B
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

// �����_�C�A���O�{�b�N�X�ɍŏ����{�^����ǉ�����Ȃ�΁A�A�C�R����`�悷��
// �R�[�h���ȉ��ɋL�q����K�v������܂��BMFC �A�v���P�[�V������ document/view
// ���f�����g���Ă���̂ŁA���̏����̓t���[�����[�N�ɂ�莩���I�ɏ�������܂��B

void CMioplayerDlg::OnPaint() 
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
HCURSOR CMioplayerDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

//
// �_�~�[
//////////////////////////////////////////////////////////////////////////////
void CMioplayerDlg::OnOK() 
{
//	CDialog::OnOK();
}

//
// �I��
//////////////////////////////////////////////////////////////////////////////
void CMioplayerDlg::OnCancel() 
{
	CDialog::OnCancel();
}

//
// �t�@�C�����h���b�v����
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
// �X���C�_�o�[���ړ�����
//////////////////////////////////////////////////////////////////////////////
void CMioplayerDlg::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar) 
{
	if ( pScrollBar->m_hWnd == m_sliderPos.m_hWnd )
	{
		if ( nSBCode == TB_THUMBPOSITION )
		{
			//
			// �w��|�C���g�փV�[�N
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
			// �g���b�L���O�J�n
			m_fTracking = true ;
		}
	}

	CDialog::OnHScroll(nSBCode, nPos, pScrollBar);
}

//
// �t�@�C�����J��
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
// �Đ��J�n�^�ꎞ��~
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
// ��~
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
// �^�C�}�[
//////////////////////////////////////////////////////////////////////////////
void CMioplayerDlg::OnTimer(UINT nIDEvent) 
{
	UpdateDisplay( ) ;

	CDialog::OnTimer(nIDEvent);
}

//
// �E�B���h�E�v���V�[�W��
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
