// ProgressDlg.cpp : インプリメンテーション ファイル
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
// CProgressDlg ダイアログ


CProgressDlg::CProgressDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CProgressDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CProgressDlg)
		// メモ - ClassWizard はこの位置にマッピング用のマクロを追加または削除します。
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
// 圧縮パラメータ設定
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
// 圧縮するファイル名追加
//////////////////////////////////////////////////////////////////////////////
void CProgressDlg::AddFileEntry( const char * pszFilePath )
{
	//
	// 入力ファイル名を追加
	CString		strSrcFile = pszFilePath ;
	m_listSrcFiles.Add( strSrcFile ) ;
	//
	// 出力ファイル名を生成
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
	// 出力ファイル名を追加
	m_listDstFiles.Add( strDstFile ) ;
}


/////////////////////////////////////////////////////////////////////////////
// CProgressDlg メッセージ ハンドラ

//
// ダイアログ初期化
//////////////////////////////////////////////////////////////////////////////
BOOL CProgressDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: この位置に初期化の補足処理を追加してください
	//
	// スレッド起動
	m_pThread = AfxBeginThread( &CProgressDlg::ThreadProc, this ) ;
	m_pThread->m_bAutoDelete = FALSE ;

	return TRUE;  // コントロールにフォーカスを設定しないとき、戻り値は TRUE となります
	              // 例外: OCX プロパティ ページの戻り値は FALSE となります
}

//
// ダミー
//////////////////////////////////////////////////////////////////////////////
void CProgressDlg::OnOK() 
{
//	CDialog::OnOK();
}

//
// 圧縮のキャンセル
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
// ウィンドウプロシージャ
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
// 圧縮操作スレッド
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
	// メッセージポンプ作成
	MSG		msg ;
	::PeekMessage( &msg, NULL, 0, 0, PM_NOREMOVE ) ;
	//
	// 総ファイル数取得
	int		nFileCount = m_listSrcFiles.GetSize( ) ;
	ASSERT( m_listDstFiles.GetSize( ) == nFileCount ) ;
	//
	// プログレスバー初期設定
	m_progress.SetRange( 0, 0xFFFFU ) ;
	//
	bool	fQuitFlag = false ;
	int		nExitCode = IDOK ;
	//
	for ( int i = 0; i < nFileCount; i ++ )
	{
		//
		// 進行状況表示
		m_progress.SetPos( 0 ) ;
		//
		CString		strTitle ;
		strTitle.Format( "圧縮中・・・　[%d/%d]", i + 1, nFileCount ) ;
		SetWindowText( strTitle ) ;
		//
		CString		strMessage ;
		CString		strSrcFile = m_listSrcFiles.GetAt( i ) ;
		CString		strDstFile = m_listDstFiles.GetAt( i ) ;
		strMessage.Format
			( "入力ファイル：%s\n出力ファイル：%s",
				(const char *) strSrcFile, (const char *) strDstFile ) ;
		SetDlgItemText( IDC_STATIC_MSG, strMessage ) ;
		//
		// .wav ファイルを開く
		EWaveFileStream	wfs ;
		if ( !wfs.Open( strSrcFile ) )
		{
			mbs.pszCaption = "エラー" ;
			mbs.pszMsg = "入力ファイルを開けませんでした。" ;
			mbs.nMBType = MB_OK | MB_ICONERROR ;
			PostMessage( WM_MESSAGEBOX, 0, (LPARAM) &mbs ) ;
			::WaitForSingleObject( mbs.hEvent, INFINITE ) ;
			continue ;
		}
		//
		// 入力ウェーブフォーマットを取得
		WAVEFORMATEX *	pwfx = wfs.GetWaveFormat( ) ;
		DWORD			dwDataBytes = wfs.GetDataLength( ) ;
		if ( pwfx->wFormatTag != WAVE_FORMAT_PCM )
		{
			mbs.pszCaption = "エラー" ;
			mbs.pszMsg = "PCM 以外のファイルを圧縮することは出来ません。" ;
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
			mbs.pszCaption = "エラー" ;
			mbs.pszMsg = "16ビット以外のPCMデータを非可逆圧縮できません。" ;
			mbs.nMBType = MB_OK | MB_ICONERROR ;
			PostMessage( WM_MESSAGEBOX, 0, (LPARAM) &mbs ) ;
			::WaitForSingleObject( mbs.hEvent, INFINITE ) ;
			continue ;
		}
		//
		// ブロックのサイズを算出する
		DWORD	dwKeyWave = 4 ;
		DWORD	dwBlockSamples = 0x8000 ;
		DWORD	dwBlockBytes = dwBlockSamples * dwSampleBytes ;
		if ( m_fLossless )
		{
			dwKeyWave = 16 ;
		}
		//
		// .mio ファイルを開く
		EWriteFile			wf ;
		ERIAnimationWriter	eriaw ;
		//
		if ( !wf.Open( strDstFile ) ||
				!eriaw.Open( &wf, ERIWriteFile::fidSound ) )
		{
			mbs.pszCaption = "エラー" ;
			mbs.pszMsg = "出力ファイルを開けませんでした。" ;
			mbs.nMBType = MB_OK | MB_ICONERROR ;
			PostMessage( WM_MESSAGEBOX, 0, (LPARAM) &mbs ) ;
			::WaitForSingleObject( mbs.hEvent, INFINITE ) ;
			continue ;
		}
		//
		// ヘッダーを出力する
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
		// 圧縮パラメータを設定する
		MIOEncoder::PARAMETER	parameter ;
		parameter.rLowWeight = m_rLowWeight ;
		parameter.rMiddleWeight = m_rMiddleWeight ;
		parameter.rPowerScale = m_rPowerScale ;
		parameter.nOddWeight = m_nOddWeight ;
		parameter.nPreEchoThreshold = m_nPEThreshold ;
		eriaw.SetSoundCompressionParameter( parameter ) ;
		//
		// ストリーム開始
		void *	ptrWaveBuf = malloc( dwBlockBytes ) ;
		DWORD	dwWrittenBytes = 0 ;
		eriaw.BeginStream( ) ;
		//
		while ( dwWrittenBytes < dwDataBytes )
		{
			//
			// 終了メッセージ受信
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
			// 書き出すサンプル数を算出
			DWORD	dwWriteBytes = dwDataBytes - dwWrittenBytes ;
			if ( dwWriteBytes > dwBlockBytes )
			{
				dwWriteBytes = dwBlockBytes ;
			}
			DWORD	dwWriteSample = dwWriteBytes / dwSampleBytes ;
			//
			// 読み込んで圧縮して書き出す
			wfs.Read( ptrWaveBuf, dwWriteBytes ) ;
			eriaw.WriteWaveData( ptrWaveBuf, dwWriteSample ) ;
			dwWrittenBytes += dwWriteBytes ;
			//
			// プログレスバーの表示を更新
			m_progress.SetPos
				( ::MulDiv( dwWrittenBytes, 0xFFFF, dwDataBytes ) ) ;
		}
		//
		// ストリーム終了
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

