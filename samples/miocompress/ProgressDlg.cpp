// ProgressDlg.cpp : �C���v�������e�[�V���� �t�@�C��
//

#include "stdafx.h"
#include "miocompress.h"
#include "wavestream.h"
#include "ProgressDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CProgressDlg �_�C�A���O


CProgressDlg::CProgressDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CProgressDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CProgressDlg)
		// ���� - ClassWizard �͂��̈ʒu�Ƀ}�b�s���O�p�̃}�N����ǉ��܂��͍폜���܂��B
	//}}AFX_DATA_INIT

	m_pThread = NULL ;
}

CProgressDlg::~CProgressDlg( void )
{
	if ( m_pThread != NULL )
	{
		::WaitForSingleObject( m_pThread->m_hThread, INFINITE ) ;
		delete	m_pThread ;
	}
}

void CProgressDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CProgressDlg)
	DDX_Control(pDX, IDC_PROGRESS, m_progress);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CProgressDlg, CDialog)
	//{{AFX_MSG_MAP(CProgressDlg)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


//
// ���k�p�����[�^�ݒ�
//////////////////////////////////////////////////////////////////////////////
void CProgressDlg::SetCompressionParameter
	( bool fLossless, double rLowWeight,
		double rMiddleWeight, int nOddWeight, int nPEThreshold, double rPowerScale,
		unsigned int nMatrixDegree, unsigned int nLappedDegree, bool fUseMSS )
{
	m_fLossless = fLossless ;
	m_rLowWeight = rLowWeight ;
	m_rMiddleWeight = rMiddleWeight ;
	m_nOddWeight = nOddWeight ;
	m_nPEThreshold = nPEThreshold ;
	m_rPowerScale = rPowerScale ;
	m_nMatrixDegree = nMatrixDegree ;
	m_nLappedDegree = nLappedDegree ;
	m_fUseMSS = fUseMSS ;
}

//
// ���k����t�@�C�����ǉ�
//////////////////////////////////////////////////////////////////////////////
void CProgressDlg::AddFileEntry( const char * pszFilePath )
{
	//
	// ���̓t�@�C������ǉ�
	CString		strSrcFile = pszFilePath ;
	m_listSrcFiles.Add( strSrcFile ) ;
	//
	// �o�̓t�@�C�����𐶐�
	int		i = 0, j = 0 ;
	while ( pszFilePath[i] != '\0' )
	{
		if ( ::IsDBCSLeadByte( pszFilePath[i] ) )
		{
			i ++ ;
		}
		else if ( pszFilePath[i] == '.' )
		{
			j = i ;
		}
		i ++ ;
	}
	CString		strDstFile( pszFilePath, j ) ;
	strDstFile += ".mio" ;
	//
	// �o�̓t�@�C������ǉ�
	m_listDstFiles.Add( strDstFile ) ;
}


/////////////////////////////////////////////////////////////////////////////
// CProgressDlg ���b�Z�[�W �n���h��

//
// �_�C�A���O������
//////////////////////////////////////////////////////////////////////////////
BOOL CProgressDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: ���̈ʒu�ɏ������̕⑫������ǉ����Ă�������
	//
	// �X���b�h�N��
	m_pThread = AfxBeginThread( &CProgressDlg::ThreadProc, this ) ;
	m_pThread->m_bAutoDelete = FALSE ;

	return TRUE;  // �R���g���[���Ƀt�H�[�J�X��ݒ肵�Ȃ��Ƃ��A�߂�l�� TRUE �ƂȂ�܂�
	              // ��O: OCX �v���p�e�B �y�[�W�̖߂�l�� FALSE �ƂȂ�܂�
}

//
// �_�~�[
//////////////////////////////////////////////////////////////////////////////
void CProgressDlg::OnOK() 
{
//	CDialog::OnOK();
}

//
// ���k�̃L�����Z��
//////////////////////////////////////////////////////////////////////////////
void CProgressDlg::OnCancel() 
{
	if ( m_pThread != NULL )
	{
		m_pThread->PostThreadMessage( WM_QUIT, 0, 0 ) ;
	}
	else
	{
		CDialog::OnCancel( ) ;
	}
}

//
// �E�B���h�E�v���V�[�W��
//////////////////////////////////////////////////////////////////////////////
LRESULT CProgressDlg::WindowProc(UINT message, WPARAM wParam, LPARAM lParam) 
{
	if ( message == WM_MESSAGEBOX )
	{
		MESSAGEBOX_STRUCT *	pmbs = (MESSAGEBOX_STRUCT*) lParam ;
		if ( pmbs != NULL )
		{
			try
			{
				pmbs->nResult = MessageBox
					( pmbs->pszMsg, pmbs->pszCaption, pmbs->nMBType ) ;
				::SetEvent( pmbs->hEvent ) ;
				return	pmbs->nResult ;
			}
			catch ( ... )
			{
			}
		}
	}
	else if ( message == WM_ENDDIALOG )
	{
		EndDialog( wParam ) ;
		return	0 ;
	}

	return CDialog::WindowProc(message, wParam, lParam);
}

//
// ���k����X���b�h
//////////////////////////////////////////////////////////////////////////////
UINT CProgressDlg::ThreadProc( LPVOID parameter )
{
	::eriInitializeTask( ) ;
	DWORD	dwResult =
		((CProgressDlg*)parameter)->CompressThreadProc( ) ;
	::eriCloseTask( ) ;
	return	dwResult ;
}

UINT CProgressDlg::CompressThreadProc( void )
{
	MESSAGEBOX_STRUCT	mbs ;
	//
	// ���b�Z�[�W�|���v�쐬
	MSG		msg ;
	::PeekMessage( &msg, NULL, 0, 0, PM_NOREMOVE ) ;
	//
	// ���t�@�C�����擾
	int		nFileCount = m_listSrcFiles.GetSize( ) ;
	ASSERT( m_listDstFiles.GetSize( ) == nFileCount ) ;
	//
	// �v���O���X�o�[�����ݒ�
	m_progress.SetRange( 0, 0xFFFFU ) ;
	//
	bool	fQuitFlag = false ;
	int		nExitCode = IDOK ;
	//
	for ( int i = 0; i < nFileCount; i ++ )
	{
		//
		// �i�s�󋵕\��
		m_progress.SetPos( 0 ) ;
		//
		CString		strTitle ;
		strTitle.Format( "���k���E�E�E�@[%d/%d]", i + 1, nFileCount ) ;
		SetWindowText( strTitle ) ;
		//
		CString		strMessage ;
		CString		strSrcFile = m_listSrcFiles.GetAt( i ) ;
		CString		strDstFile = m_listDstFiles.GetAt( i ) ;
		strMessage.Format
			( "���̓t�@�C���F%s\n�o�̓t�@�C���F%s",
				(const char *) strSrcFile, (const char *) strDstFile ) ;
		SetDlgItemText( IDC_STATIC_MSG, strMessage ) ;
		//
		// .wav �t�@�C�����J��
		EWaveFileStream	wfs ;
		if ( !wfs.Open( strSrcFile ) )
		{
			mbs.pszCaption = "�G���[" ;
			mbs.pszMsg = "���̓t�@�C�����J���܂���ł����B" ;
			mbs.nMBType = MB_OK | MB_ICONERROR ;
			PostMessage( WM_MESSAGEBOX, 0, (LPARAM) &mbs ) ;
			::WaitForSingleObject( mbs.hEvent, INFINITE ) ;
			continue ;
		}
		//
		// ���̓E�F�[�u�t�H�[�}�b�g���擾
		WAVEFORMATEX *	pwfx = wfs.GetWaveFormat( ) ;
		DWORD			dwDataBytes = wfs.GetDataLength( ) ;
		if ( pwfx->wFormatTag != WAVE_FORMAT_PCM )
		{
			mbs.pszCaption = "�G���[" ;
			mbs.pszMsg = "PCM �ȊO�̃t�@�C�������k���邱�Ƃ͏o���܂���B" ;
			mbs.nMBType = MB_OK | MB_ICONERROR ;
			PostMessage( WM_MESSAGEBOX, 0, (LPARAM) &mbs ) ;
			::WaitForSingleObject( mbs.hEvent, INFINITE ) ;
			continue ;
		}
		DWORD	dwSampleBytes =
			(DWORD) pwfx->nChannels * pwfx->wBitsPerSample / 8 ;
		//
		if ( (dwSampleBytes == 0) ||
			(!m_fLossless && (pwfx->wBitsPerSample != 16)) )
		{
			mbs.pszCaption = "�G���[" ;
			mbs.pszMsg = "16�r�b�g�ȊO��PCM�f�[�^���t���k�ł��܂���B" ;
			mbs.nMBType = MB_OK | MB_ICONERROR ;
			PostMessage( WM_MESSAGEBOX, 0, (LPARAM) &mbs ) ;
			::WaitForSingleObject( mbs.hEvent, INFINITE ) ;
			continue ;
		}
		//
		// �u���b�N�̃T�C�Y���Z�o����
		DWORD	dwKeyWave = 4 ;
		DWORD	dwBlockSamples = 0x8000 ;
		DWORD	dwBlockBytes = dwBlockSamples * dwSampleBytes ;
		if ( m_fLossless )
		{
			dwKeyWave = 16 ;
		}
		//
		// .mio �t�@�C�����J��
		EWriteFile			wf ;
		ERIAnimationWriter	eriaw ;
		//
		if ( !wf.Open( strDstFile ) ||
				!eriaw.Open( &wf, ERIWriteFile::fidSound ) )
		{
			mbs.pszCaption = "�G���[" ;
			mbs.pszMsg = "�o�̓t�@�C�����J���܂���ł����B" ;
			mbs.nMBType = MB_OK | MB_ICONERROR ;
			PostMessage( WM_MESSAGEBOX, 0, (LPARAM) &mbs ) ;
			::WaitForSingleObject( mbs.hEvent, INFINITE ) ;
			continue ;
		}
		//
		// �w�b�_�[���o�͂���
		MIO_INFO_HEADER	mioih ;
		::memset( &mioih, 0, sizeof(mioih) ) ;
		mioih.dwVersion = 0x00020300 ;
		if ( m_fLossless )
		{
			mioih.fdwTransformation = CVTYPE_LOSSLESS_ERI ;
			mioih.dwArchitecture = ERI_RUNLENGTH_HUFFMAN ;
		}
		else
		{
			if ( m_fUseMSS && (pwfx->nChannels == 2) )
				mioih.fdwTransformation = CVTYPE_LOT_ERI_MSS ;
			else
				mioih.fdwTransformation = CVTYPE_LOT_ERI ;
			mioih.dwArchitecture = ERI_RUNLENGTH_GAMMA ;
			mioih.dwSubbandDegree = m_nMatrixDegree ;
			mioih.dwLappedDegree = m_nLappedDegree ;
		}
		mioih.dwChannelCount = pwfx->nChannels ;
		mioih.dwSamplesPerSec = pwfx->nSamplesPerSec ;
		mioih.dwBitsPerSample = pwfx->wBitsPerSample ;
		mioih.dwAllSampleCount = dwDataBytes / dwSampleBytes ;
		//
		eriaw.BeginFileHeader( 1, dwKeyWave ) ;
		eriaw.WriteMioInfoHeader( mioih ) ;
		eriaw.EndFileHeader( ) ;
		//
		// ���k�p�����[�^��ݒ肷��
		MIOEncoder::PARAMETER	parameter ;
		parameter.rLowWeight = m_rLowWeight ;
		parameter.rMiddleWeight = m_rMiddleWeight ;
		parameter.rPowerScale = m_rPowerScale ;
		parameter.nOddWeight = m_nOddWeight ;
		parameter.nPreEchoThreshold = m_nPEThreshold ;
		eriaw.SetSoundCompressionParameter( parameter ) ;
		//
		// �X�g���[���J�n
		void *	ptrWaveBuf = malloc( dwBlockBytes ) ;
		DWORD	dwWrittenBytes = 0 ;
		eriaw.BeginStream( ) ;
		//
		while ( dwWrittenBytes < dwDataBytes )
		{
			//
			// �I�����b�Z�[�W��M
			if ( ::PeekMessage( &msg, NULL, 0, 0, PM_REMOVE ) )
			{
				if ( msg.message == WM_QUIT )
				{
					fQuitFlag = true ;
					nExitCode = IDCANCEL ;
					break ;
				}
			}
			//
			// �����o���T���v�������Z�o
			DWORD	dwWriteBytes = dwDataBytes - dwWrittenBytes ;
			if ( dwWriteBytes > dwBlockBytes )
			{
				dwWriteBytes = dwBlockBytes ;
			}
			DWORD	dwWriteSample = dwWriteBytes / dwSampleBytes ;
			//
			// �ǂݍ���ň��k���ď����o��
			wfs.Read( ptrWaveBuf, dwWriteBytes ) ;
			eriaw.WriteWaveData( ptrWaveBuf, dwWriteSample ) ;
			dwWrittenBytes += dwWriteBytes ;
			//
			// �v���O���X�o�[�̕\�����X�V
			m_progress.SetPos
				( ::MulDiv( dwWrittenBytes, 0xFFFF, dwDataBytes ) ) ;
		}
		//
		// �X�g���[���I��
		eriaw.EndStream
			( ::MulDiv( dwWrittenBytes / dwSampleBytes,
							1000, mioih.dwSamplesPerSec ) ) ;
		free( ptrWaveBuf ) ;
		//
		if ( fQuitFlag )
			break ;
	}

	PostMessage( WM_ENDDIALOG, nExitCode, 0 ) ;

	return	0 ;
}

