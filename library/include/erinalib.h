
/*****************************************************************************
                         E R I N A - L i b r a r y
                                                      �ŏI�X�V 2002/05/26
 ----------------------------------------------------------------------------
         Copyright (C) 2000-2002 Leshade Entis. All rights reserved.
 *****************************************************************************/


#if	!defined(ERINALIB_H_INCLUDE)
#define	ERINALIB_H_INCLUDE

#include "experi.h"
#include "cmperi.h"
#include "cxmio.h"


/*****************************************************************************
                    MIO�t�@�C���X�g���[���Đ��I�u�W�F�N�g
 *****************************************************************************/

class	MIODynamicPlayer
{
public:
	// �\�z�֐�
	MIODynamicPlayer( void ) ;
	// ���Ŋ֐�
	~MIODynamicPlayer( void ) ;

protected:
	//
	// ���R�[�h��ǂ݃I�u�W�F�N�g
	class	EPreloadBuffer	: public	EMemFile
	{
	public:
		BYTE *			m_ptrBuffer ;
		ULONG			m_nKeySample ;
		MIO_DATA_HEADER	m_miodh ;
	public:
		// �\�z�֐�
		EPreloadBuffer( DWORD dwLength ) ;
		// ���Ŋ֐�
		virtual ~EPreloadBuffer( void ) ;
	} ;
	//
	// �L�[�t���[���|�C���g�\����
	struct	KEY_POINT
	{
		ULONG	nKeySample ;
		DWORD	dwRecOffset ;
	} ;
	//
	// EPreloadBuffer �z��I�u�W�F�N�g
	class	EPreloadQueue
	{
	public:
		EPreloadBuffer **	m_queue ;
		unsigned int		m_length ;
		unsigned int		m_limit ;
	public:
		// �\�z�֐�
		EPreloadQueue( void ) ;
		// ���Ŋ֐�
		~EPreloadQueue( void ) ;
		// �z��̍ő�̒�����ݒ�
		void SetLimit( unsigned int nLimit ) ;
		// �z�������
		void RemoveAll( void ) ;
	} ;
	//
	// KEY_POINT �z��I�u�W�F�N�g
	class	EKeyPointList
	{
	public:
		KEY_POINT *		m_list ;
		unsigned int	m_count ;
		unsigned int	m_limit ;
	public:
		// �\�z�֐�
		EKeyPointList( void ) ;
		// ���Ŋ֐�
		~EKeyPointList( void ) ;
		// �z��̍ō܂̒�����ݒ�
		void SetLimit( unsigned int nLimit ) ;
		// �z�������
		void RemoveAll( void ) ;
	} ;
	//
	// �X���b�h�p���b�Z�[�W
	enum	ThreadMessage
	{
		tmSeekSound	= WM_USER,
		tmQuit
	} ;

	// ERI�A�j���[�V�����t�@�C��
	ERIFile					m_erif ;
	// �W�J�I�u�W�F�N�g
	EFileDecodeContext *	m_pmioc ;
	MIODecoder *			m_pmiod ;
	// ��ǂ݃X���b�h
	HANDLE					m_hThread ;
	DWORD					m_idThread ;
	// ��ǂ݃L���[
	EPreloadQueue			m_queueSound ;
	HANDLE					m_hQueueFull ;		// ��ǂ݃L���[����t
	HANDLE					m_hQueueNotEmpty ;	// ��ǂ݃L���[����łȂ�
	HANDLE					m_hQueueSpace ;		// ��ǂ݃L���[�ɓǂݍ��݉\
	// �����V�[�N�p�L�[�|�C���g�z��
	EKeyPointList			m_listKeySample ;
	// �r���I����
	CRITICAL_SECTION		m_cs ;

public:
	// MIO �t�@�C�����J��
	bool Open( EFileObject * pFile, unsigned int nPreloadSize = 0 ) ;
	// MIO �t�@�C�������
	void Close( void ) ;

	// �w��T���v���ֈړ����A���߂̃u���b�N�̃f�[�^���擾����
	virtual void * GetWaveBufferFrom
		( ULONG nSample, DWORD & dwBytes, DWORD & dwOffsetBytes ) ;
	// ���̉����f�[�^���X�g���[���̐擪�ł��邩�H
	virtual bool IsNextDataRewound( void ) ;
	// ���̉����f�[�^���擾
	virtual void * GetNextWaveBuffer( DWORD & dwBytes ) ;
	// �����o�b�t�@�m��
	virtual void * AllocateWaveBuffer( DWORD dwBytes ) ;
	// �����f�[�^�j������
	virtual void DeleteWaveBuffer( void * ptrWaveBuf ) ;
	// �����W�J�I�u�W�F�N�g�𐶐�
	virtual MIODecoder * CreateMIODecoder( void ) ;

public:
	// ERIFile �I�u�W�F�N�g���擾����
	const ERIFile & GetERIFile( void ) const ;
	// �`���l�������擾����
	DWORD GetChannelCount( void ) const ;
	// �T���v�����O���g�����擾����
	DWORD GetFrequency( void ) const ;
	// �T���v�����O�r�b�g����\���擾����
	DWORD GetBitsPerSample( void ) const ;
	// �S�̂̒����i�T���v�����j���擾����
	DWORD GetTotalSampleCount( void ) const ;

protected:
	// ��ǂ݃o�b�t�@���擾����
	EPreloadBuffer * GetPreloadBuffer( void ) ;
	// ��ǂ݃o�b�t�@�ɒǉ�����
	void AddPreloadBuffer( EPreloadBuffer * pBuffer ) ;

protected:
	// �X���b�h�֐�
	static DWORD WINAPI ThreadProc( LPVOID parameter ) ;
	DWORD LoadingThreadProc( void ) ;
	// �L�[�t���[���|�C���g��ǉ�����
	void AddKeySample( KEY_POINT key ) ;
	// �w��̃L�[�t���[������������
	KEY_POINT * SearchKeySample( unsigned int nKeySample ) ;
	// �w��̃T���v�����܂ރu���b�N��ǂݍ���
	void SeekKeySample( ULONG nSample, unsigned int & nCurrentSample ) ;

public:
	// �r�������i�N���e�B�J���Z�N�V�����j
	void Lock( void ) ;
	void Unlock( void ) ;

} ;


/*****************************************************************************
                    ERI�A�j���[�V�����t�@�C���I�u�W�F�N�g
 *****************************************************************************/

class	ERIAnimation
{
public:
	// �\�z�֐�
	ERIAnimation( void ) ;
	// ���Ŋ֐�
	~ERIAnimation( void ) ;

protected:
	//
	// ���R�[�h��ǂ݃I�u�W�F�N�g
	class	EPreloadBuffer	: public	EMemFile
	{
	public:
		BYTE *	m_ptrBuffer ;
		ULONG	m_iFrameIndex ;
		UINT64	m_ui64RecType ;
	public:
		// �\�z�֐�
		EPreloadBuffer( DWORD dwLength ) ;
		// ���Ŋ֐�
		virtual ~EPreloadBuffer( void ) ;
	} ;
	//
	// �L�[�t���[���|�C���g�\����
	struct	KEY_POINT
	{
		ULONG	iKeyFrame ;
		DWORD	dwRecOffset ;
	} ;
	//
	// EPreloadBuffer �z��I�u�W�F�N�g
	class	EPreloadQueue
	{
	public:
		EPreloadBuffer **	m_queue ;
		unsigned int		m_length ;
		unsigned int		m_limit ;
	public:
		// �\�z�֐�
		EPreloadQueue( void ) ;
		// ���Ŋ֐�
		~EPreloadQueue( void ) ;
		// �z��̍ő�̒�����ݒ�
		void SetLimit( unsigned int nLimit ) ;
		// �z�������
		void RemoveAll( void ) ;
	} ;
	//
	// KEY_POINT �z��I�u�W�F�N�g
	class	EKeyPointList
	{
	public:
		KEY_POINT *		m_list ;
		unsigned int	m_count ;
		unsigned int	m_limit ;
	public:
		// �\�z�֐�
		EKeyPointList( void ) ;
		// ���Ŋ֐�
		~EKeyPointList( void ) ;
		// �z��̍ō܂̒�����ݒ�
		void SetLimit( unsigned int nLimit ) ;
		// �z�������
		void RemoveAll( void ) ;
	} ;
	//
	// �X���b�h�p���b�Z�[�W
	enum	ThreadMessage
	{
		tmSeekFrame	= WM_USER,
		tmSeekSound,
		tmQuit
	} ;

	// ERI�A�j���[�V�����t�@�C��
	bool					m_fTopDown ;
	bool					m_fWaveOutput ;
	bool					m_fWaveStreaming ;
	ERIFile					m_erif ;
	// �W�J�I�u�W�F�N�g
	EFileDecodeContext *	m_peric ;
	ERIDecoder *			m_perid ;
	EFileDecodeContext *	m_pmioc ;
	MIODecoder *			m_pmiod ;
	// �摜�o�b�t�@
	unsigned int			m_iCurrentFrame ;
	RASTER_IMAGE_INFO *		m_pDstImage ;
	ENTIS_PALETTE *			m_pPaletteTable ;
	RASTER_IMAGE_INFO *		m_pWorkImage ;
	// ��ǂ݃X���b�h
	HANDLE					m_hThread ;
	DWORD					m_idThread ;
	// �摜��ǂ݃L���[
	EPreloadQueue			m_queueImage ;
	HANDLE					m_hQueueNotEmpty ;	// ��ǂ݃L���[����łȂ�
	HANDLE					m_hQueueSpace ;		// ��ǂ݃L���[�ɓǂݍ��݉\
	// �t���[���V�[�N�p�L�[�t���[���|�C���g�z��
	EKeyPointList			m_listKeyFrame ;
	EKeyPointList			m_listKeyWave ;
	// �r���I����
	CRITICAL_SECTION		m_cs ;

protected:
	// �摜�W�J�o�̓o�b�t�@�v��
	virtual RASTER_IMAGE_INFO * CreateImageBuffer
		( DWORD format, SDWORD width, SDWORD height,
					DWORD bpp, ENTIS_PALETTE ** ppaltbl ) ;
	// �摜�W�J�o�̓o�b�t�@����
	virtual void DeleteImageBuffer
		( RASTER_IMAGE_INFO * prii, ENTIS_PALETTE * paltbl ) ;
	// �摜�W�J�I�u�W�F�N�g����
	virtual ERIDecoder * CreateERIDecoder( void ) ;
	// �����W�J�I�u�W�F�N�g����
	virtual MIODecoder * CreateMIODecoder( void ) ;
	// �����o�͗v��
	virtual bool RequestWaveOut
		( DWORD channels, DWORD frequency, DWORD bps ) ;
	// �����o�͏I��
	virtual void CloseWaveOut( void ) ;
	// �����f�[�^�o��
	virtual void PushWaveBuffer( void * ptrWaveBuf, DWORD dwBytes ) ;
public:
	// �����o�b�t�@�m��
	virtual void * AllocateWaveBuffer( DWORD dwBytes ) ;
	// �����f�[�^�j������
	virtual void DeleteWaveBuffer( void * ptrWaveBuf ) ;
	// �����X�g���[�~���O�J�n
	virtual void BeginWaveStreaming( void ) ;
	// �����X�g���[�~���O�I��
	virtual void EndWaveStreaming( void ) ;

public:
	// �A�j���[�V�����t�@�C�����J��
	bool Open( EFileObject * pFile,
			unsigned int nPreloadSize = 0, bool fTopDown = false ) ;
	// �A�j���[�V�����t�@�C�������
	void Close( void ) ;

	// �擪�t���[���ֈړ�
	bool SeekToBegin( void ) ;
	// ���̃t���[���ֈړ�
	bool SeekToNextFrame( int nSkipFrame = 0 ) ;
	// �w��̃t���[���Ɉړ�
	bool SeekToFrame( unsigned int iFrameIndex ) ;
	// �w��̃t���[���̓L�[�t���[�����H
	bool IsKeyFrame( unsigned int iFrameIndex ) ;

protected:
	// ���̃t���[����W�J����
	bool DecodeNextFrame( void ) ;
	// ��ǂ݃o�b�t�@���擾����
	EPreloadBuffer * GetPreloadBuffer( void ) ;
	// ��ǂ݃o�b�t�@�ɒǉ�����
	void AddPreloadBuffer( EPreloadBuffer * pBuffer ) ;

public:
	// ERIFile �I�u�W�F�N�g���擾����
	const ERIFile & GetERIFile( void ) const ;
	// �J�����g�t���[���̃C���f�b�N�X���擾����
	unsigned int CurrentIndex( void ) const ;
	// �J�����g�t���[���̉摜���擾
	const RASTER_IMAGE_INFO * GetImageInfo( void ) const ;
	// �p���b�g�e�[�u���擾
	const ENTIS_PALETTE * GetPaletteEntries( void ) const ;
	// �L�[�t���[�����擾
	unsigned int GetKeyFrameCount( void ) const ;
	// �S�t���[�������擾
	unsigned int GetAllFrameCount( void ) const ;
	// �S�A�j���[�V�������Ԃ��擾
	unsigned int GetTotalTime( void ) const ;
	// �t���[���ԍ����玞�Ԃ֕ϊ�
	unsigned int FrameIndexToTime( unsigned int iFrameIndex ) const ;
	// ���Ԃ���t���[���ԍ��֕ϊ�
	unsigned int TimeToFrameIndex( unsigned int nMilliSec ) const ;

protected:
	// �X���b�h�֐�
	static DWORD WINAPI ThreadProc( LPVOID parameter ) ;
	DWORD LoadingThreadProc( void ) ;
	// �L�[�t���[���|�C���g��ǉ�����
	void AddKeyPoint( EKeyPointList & list, KEY_POINT key ) ;
	// �w��̃L�[�t���[������������
	KEY_POINT * SearchKeyPoint
		( EKeyPointList & list, unsigned int iKeyFrame ) ;
	// �w��̃t���[���ɃV�[�N����
	void SeekKeyPoint
		( EKeyPointList & list,
			unsigned int iFrame, unsigned int & iCurtrentFrame ) ;
	// �w��̉����f�[�^�܂ŃV�[�N���ăX�g���[�~���O�o�͂���
	void SeekKeyWave
		( EKeyPointList & list, unsigned int iFrame ) ;

public:
	// �r�������i�N���e�B�J���Z�N�V�����j
	void Lock( void ) ;
	void Unlock( void ) ;

} ;


/*****************************************************************************
                  ERI�A�j���[�V�����t�@�C���o�̓I�u�W�F�N�g
 *****************************************************************************/

class	ERIAnimationWriter
{
public:
	// �\�z�֐�
	ERIAnimationWriter( void ) ;
	// ���Ŋ֐�
	~ERIAnimationWriter( void ) ;

protected:
	//
	// �o�̓o�b�t�@�I�u�W�F�N�g
	class	EOutputBuffer
	{
	public:
		EOutputBuffer *	m_ptrNext ;
		DWORD			m_dwBytes ;
		PVOID			m_ptrBuffer ;
	public:
		// �\�z�֐�
		EOutputBuffer( const BYTE * ptrBuffer, ULONG nBytes ) ;
		// ���Ŋ֐�
		~EOutputBuffer( void ) ;
	} ;
	//
	// ���k�R���e�L�X�g
	class	EEncodeContext	: public	RLHEncodeContext
	{
	public:
		EOutputBuffer *	m_pFirstBuf ;
		EOutputBuffer *	m_pLastBuf ;
		DWORD			m_dwTotalBytes ;
	public:
		// �\�z�֐�
		EEncodeContext( void ) ;
		// ���Ŋ֐�
		virtual ~EEncodeContext( void ) ;
		// �f�[�^����
		void Delete( void ) ;
		// ���̃f�[�^�������o��
		virtual ULONG WriteNextData( const BYTE * ptrBuffer, ULONG nBytes ) ;
	} ;
	//
	// �X���b�h���b�Z�[�W
	enum	ThreadMessage
	{
		tmEncodeImage	= WM_USER,
		tmQuit
	} ;

	// �����o���X�e�[�^�X
	enum	WriterStatus
	{
		wsNotOpened,
		wsOpened,
		wsWritingHeader,
		wsWritingStream
	} ;
	WriterStatus			m_wsStatus ;		// �X�e�[�^�X
	// �t�@�C���I�u�W�F�N�g
	ERIWriteFile			m_eriwf ;			// �t�@�C���I�u�W�F�N�g
	// �w�b�_���
	DWORD					m_dwHeaderBytes ;	// �w�b�_���R�[�h�̃o�C�g��
	ERI_FILE_HEADER			m_efh ;				// �t�@�C���w�b�_
	ERI_INFO_HEADER			m_prvwih ;			// �v���r���[�摜���w�b�_
	ERI_INFO_HEADER			m_eih ;				// �摜���w�b�_
	MIO_INFO_HEADER			m_mih ;				// �������w�b�_
	// �t���[���ԍ�
	DWORD					m_dwKeyFrame ;		// �L�[�t���[��
	DWORD					m_dwKeyWave ;		// �L�[�E�F�[�u
	DWORD					m_dwFrameCount ;	// �o�͍ς݃t���[������
	DWORD					m_dwWaveCount ;		// �o�͍ς݃E�F�[�u����
	// �����o�͏��
	DWORD					m_dwMioHeaderPos ;		// �������w�b�_�̈ʒu
	DWORD					m_dwOutputWaveSamples ;	// �o�͍ς݃T���v����
	// ���k�I�u�W�F�N�g
	EEncodeContext			m_eric1 ;
	EEncodeContext			m_eric2 ;
	ERIEncoder *			m_perie1 ;
	ERIEncoder *			m_perie2 ;
	EFileEncodeContext *	m_pmioc ;
	MIOEncoder *			m_pmioe ;
	// ���������p�o�b�t�@
	RASTER_IMAGE_INFO *		m_priiLast ;
	RASTER_IMAGE_INFO *		m_priiBuf ;
	// �摜���k�X���b�h
	bool					m_fDualEncoding ;
	bool					m_fCompressSuccessed ;
	HANDLE					m_hCompressed ;
	HANDLE					m_hThread ;
	DWORD					m_idThread ;
	// �摜�̈��k�p�����[�^
	ERIEncoder::PARAMETER	m_eriep ;
	// �����̈��k�p�����[�^
	MIOEncoder::PARAMETER	m_mioep ;

public:
	// �t�@�C�����J��
	bool Open( EWriteFileObj * pFile, ERIWriteFile::FileID fidType ) ;
	// �t�@�C�������
	void Close( void ) ;

public:
	// �t�@�C���w�b�_���J��
	bool BeginFileHeader( DWORD dwKeyFrame, DWORD dwKeyWave ) ;
	// �v���r���[�摜���w�b�_�������o��
	bool WritePreviewInfo( const ERI_INFO_HEADER & eih ) ;
	// �摜���w�b�_�������o��
	bool WriteEriInfoHeader( const ERI_INFO_HEADER & eih ) ;
	// �������w�b�_�������o��
	bool WriteMioInfoHeader( const MIO_INFO_HEADER & mih ) ;
	// ���쌠���������o��
	bool WriteCopyright( const void * ptrCopyright, DWORD dwBytes ) ;
	// �R�����g�������o��
	bool WriteDescription( const void * ptrDescription, DWORD dwBytes ) ;
	// �t�@�C���w�b�_�����
	void EndFileHeader( void ) ;

public:
	// �摜�̈��k�p�����[�^��ݒ肷��
	void SetImageCompressionParameter
			( const ERIEncoder::PARAMETER & eriep ) ;
	// �����̈��k�p�����[�^��ݒ肷��
	void SetSoundCompressionParameter
			( const MIOEncoder::PARAMETER & mioep ) ;

public:
	// �X�g���[�����J�n����
	bool BeginStream( void ) ;
	// �p���b�g�e�[�u���������o��
	bool WritePaletteTable
		( const ENTIS_PALETTE * paltbl, unsigned int nLength ) ;
	// �v���r���[�摜���o�͂���
	bool WritePreviewData( const RASTER_IMAGE_INFO & rii, DWORD fdwFlags ) ;
	// �����f�[�^���o�͂���
	bool WriteWaveData( const void * ptrWaveBuf, DWORD dwSampleCount ) ;
	// �摜�f�[�^���o�͂���
	bool WriteImageData( const RASTER_IMAGE_INFO & rii, DWORD fdwFlags ) ;
	// �X�g���[�������
	bool EndStream( DWORD dwTotalTime ) ;

protected:
	// �摜�o�b�t�@�𐶐�
	RASTER_IMAGE_INFO * CreateImageBuffer( const ERI_INFO_HEADER & eih ) ;
	// �摜�o�b�t�@������
	void DeleteImageBuffer( RASTER_IMAGE_INFO * prii ) ;
	// �摜���k�I�u�W�F�N�g�𐶐�
	virtual ERIEncoder * CreateERIEncoder( void ) ;
	// �������k�I�u�W�F�N�g�𐶐�
	virtual MIOEncoder * CreateMIOEncoder( void ) ;

public:
	// �o�͂��ꂽ�摜�̖������擾����
	DWORD GetWrittenFrameCount( void ) const ;
	// �}���`�X���b�h���k��L����
	void EnableDualEncoding( bool fDualEncoding ) ;

protected:
	// �X���b�h�֐�
	static DWORD WINAPI ThreadProc( LPVOID parameter ) ;
	DWORD EncodingThreadProc( void ) ;

} ;


#endif
