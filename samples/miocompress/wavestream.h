
/*****************************************************************************
                  WAV �t�@�C���X�g���[�~���O�I�u�W�F�N�g
 *****************************************************************************/


#if	!defined(__WAVESTREAM_H__)
#define	__WAVESTREAM_H__


class	EWaveFileStream
{
public:
	// �\�z�֐�
	EWaveFileStream( void ) ;
	// ���Ŋ֐�
	~EWaveFileStream( void ) ;

protected:
	CFile *			m_pfile ;			// �t�@�C���I�u�W�F�N�g
	WAVEFORMATEX *	m_pwfx ;			// �`���f�[�^
	DWORD			m_dwDataBytes ;		// �f�[�^�����̃o�C�g��

public:
	// �t�@�C�����J��
	bool Open( const char * pszFileName ) ;
	// �t�@�C�������
	void Close( void ) ;
	// �f�[�^�`�����擾
	WAVEFORMATEX * GetWaveFormat( void ) ;
	// �f�[�^�̑��o�C�g�����擾
	DWORD GetDataLength( void ) ;
	// �t�@�C����ǂݍ���
	UINT Read( void * lpBuf, UINT nBytes ) ;

} ;


#endif
