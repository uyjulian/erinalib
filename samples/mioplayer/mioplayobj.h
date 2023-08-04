
/*****************************************************************************
                       MIO �t�@�C���Đ��I�u�W�F�N�g
 *****************************************************************************/


#if	!defined(__MIOPLAYOBJ_H__)
#define	__MIOPLAYOBJ_H__


class	MIOPlayObject	: public	MIODynamicPlayer
{
public:
	// �\�z�֐�
	MIOPlayObject( void ) ;
	// ���Ŋ֐�
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
	// MIO �t�@�C�����J��
	const char * Open( const char * pszMioFile ) ;
	// MIO �t�@�C�������
	void Close( void ) ;

	// �Đ��J�n
	bool PlayFrom( ULONG nSample = 0 ) ;
	// �Đ���~
	bool Stop( void ) ;
	// �Đ��ꎞ��~
	bool Pause( void ) ;
	// �Đ��ĊJ
	bool Restart( void ) ;

	// ���ݍĐ������H
	bool IsPlaying( void ) const ;
	// �ꎞ��~�����H
	bool IsPaused( void ) const ;

	// �Đ����I���������A�|�X�g����E�B���h�E���b�Z�[�W��ݒ肷��
	void SetWindowToNotifyDone
		( HWND hwndNotify, UINT uMsg = MM_WOM_DONE, LPARAM lParam = 0 ) ;
	// �Đ����I������
	virtual void OnEndPlaying( void ) ;

	// ���݂̍Đ��|�C���g�i�T���v�����j
	DWORD GetCurrentSample( void ) ;
	// �T���v��������~���b���擾
	DWORD SampleToMilliSec( DWORD dwSample ) const ;

protected:
	// WAVE �o�̓f�o�C�X�R�[���o�b�N�֐�
	static void CALLBACK waveOutProc
		( HWAVEOUT hwo, UINT uMsg,
			DWORD dwInstance, DWORD dwParam1, DWORD dwParam2 ) ;
	void WaveOutCallbackProc
		( HWAVEOUT hwo, UINT uMsg, DWORD dwParam1, DWORD dwParam2 ) ;
	// �X�g���[�~���O�����p�X���b�h
	static DWORD WINAPI ThreadProc( LPVOID parameter ) ;
	DWORD StreamingThreadProc( void ) ;

} ;


#endif
