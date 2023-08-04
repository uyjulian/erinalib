
/*****************************************************************************
                       MIO ファイル再生オブジェクト
 *****************************************************************************/


#if	!defined(__MIOPLAYOBJ_H__)
#define	__MIOPLAYOBJ_H__


class	MIOPlayObject	: public	MIODynamicPlayer
{
public:
	// 構築関数
	MIOPlayObject( void ) ;
	// 消滅関数
	~MIOPlayObject( void ) ;

protected:
	EReadFile	m_file ;
	HWAVEOUT	m_hWaveOut ;
	//
	HANDLE		m_hThread ;
	DWORD		m_idThread ;
	//
	int			m_nOutBufCount ;
	HANDLE		m_hReleased ;
	DWORD		m_dwPlayOffset ;
	void *		m_pFirstOut ;
	DWORD		m_dwOffsetSample ;
	//
	bool		m_fPlaying ;
	bool		m_fPaused ;
	//
	HWND		m_hwndNotifyDone ;
	UINT		m_msgNotifyDone ;
	LPARAM		m_paramNotifyDone ;

public:
	// MIO ファイルを開く
	const char * Open( const char * pszMioFile ) ;
	// MIO ファイルを閉じる
	void Close( void ) ;

	// 再生開始
	bool PlayFrom( ULONG nSample = 0 ) ;
	// 再生停止
	bool Stop( void ) ;
	// 再生一時停止
	bool Pause( void ) ;
	// 再生再開
	bool Restart( void ) ;

	// 現在再生中か？
	bool IsPlaying( void ) const ;
	// 一時停止中か？
	bool IsPaused( void ) const ;

	// 再生が終了した時、ポストするウィンドウメッセージを設定する
	void SetWindowToNotifyDone
		( HWND hwndNotify, UINT uMsg = MM_WOM_DONE, LPARAM lParam = 0 ) ;
	// 再生が終了した
	virtual void OnEndPlaying( void ) ;

	// 現在の再生ポイント（サンプル数）
	DWORD GetCurrentSample( void ) ;
	// サンプル数からミリ秒を取得
	DWORD SampleToMilliSec( DWORD dwSample ) const ;

protected:
	// WAVE 出力デバイスコールバック関数
	static void CALLBACK waveOutProc
		( HWAVEOUT hwo, UINT uMsg,
			DWORD dwInstance, DWORD dwParam1, DWORD dwParam2 ) ;
	void WaveOutCallbackProc
		( HWAVEOUT hwo, UINT uMsg, DWORD dwParam1, DWORD dwParam2 ) ;
	// ストリーミング処理用スレッド
	static DWORD WINAPI ThreadProc( LPVOID parameter ) ;
	DWORD StreamingThreadProc( void ) ;

} ;


#endif
