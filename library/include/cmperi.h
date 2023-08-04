
/*****************************************************************************
                         E R I N A - L i b r a r y
                                                      �ŏI�X�V 2002/05/26
 ----------------------------------------------------------------------------
         Copyright (C) 2000-2002 Leshade Entis. All rights reserved.
 *****************************************************************************/


#if	!defined(CMPERI_H_INCLUDE)
#define	CMPERI_H_INCLUDE

#include "experi.h"


/*****************************************************************************
                               �t�@�C���I�u�W�F�N�g
 *****************************************************************************/

class	EWriteFileObj
{
public:
	// �\�z�֐�
	EWriteFileObj( void ) ;
	// ���Ŋ֐�
	virtual ~EWriteFileObj( void ) ;
	// �f�[�^�������o��
	virtual DWORD Write( const void * ptrBuf, DWORD dwByte ) = 0 ;
	// �t�@�C���̒������擾����
	virtual DWORD GetLength( void ) = 0 ;
	// �t�@�C���|�C���^���擾����
	virtual DWORD GetPointer( void ) = 0 ;
	// �t�@�C���|�C���^���ړ�����
	virtual void Seek( DWORD dwPointer ) = 0 ;

} ;

class	EWriteFile	: public	EWriteFileObj
{
protected:
	HANDLE	m_hFile ;
	bool	m_flagToClose ;

public:
	EWriteFile( void ) ;
	EWriteFile( HANDLE hFile ) ;
	virtual ~EWriteFile( void ) ;

	bool Open( const char * pszFile ) ;
	void Attach( HANDLE hFile ) ;
	void Close( void ) ;

	virtual DWORD Write( const void * ptrBuf, DWORD dwByte ) ;
	virtual DWORD GetLength( void ) ;
	virtual DWORD GetPointer( void ) ;
	virtual void Seek( DWORD dwPointer ) ;

} ;

class	ERIWriteFile	: public	EWriteFileObj
{
protected:
	EWriteFileObj *	m_pFile ;
	struct	RECORD_INFO
	{
		RECORD_INFO *	pParent ;
		DWORD			dwOffset ;
		DWORD			dwLimit ;
	} ;
	RECORD_INFO *	m_pRecInf ;

public:
	//
	// �t�@�C��ID
	enum	FileID
	{
		fidImage,
		fidSound,
		fidMovie
	} ;
	//
	// Unicode ������I�u�W�F�N�g
	class	EWStringObj
	{
	protected:
		wchar_t *	m_pwszString ;
		int			m_nLength ;
		int			m_nBufLimit ;
	public:
		// �\�z�֐�
		EWStringObj( void ) ;
		EWStringObj( const char * pszString, int nLength = -1 ) ;
		EWStringObj( const wchar_t * pwszString, int nLength = -1 ) ;
		// ���Ŋ֐�
		~EWStringObj( void ) ;
		// ������Q��
		operator const wchar_t * ( void ) const
			{	return	m_pwszString ;	}
		const wchar_t * CharPtr( void ) const
			{	return	m_pwszString ;	}
		int GetLength( void ) const
			{	return	m_nLength ;		}
		// �����񉄒�
		void AddString( const EWStringObj & string ) ;
		// ���
		const EWStringObj & operator = ( const EWStringObj & string ) ;
	} ;
	//
	// �^�O���\�z�I�u�W�F�N�g
	class	ETagInfo
	{
	protected:
		wchar_t *	m_pwszData ;
		int			m_nLength ;
	public:
		// �\�z�֐�
		ETagInfo( void ) ;
		// ���Ŋ֐�
		~ETagInfo( void ) ;
		// �^�O���擾
		const wchar_t * GetTagData( void ) const
			{	return	m_pwszData ;	}
		int GetTagBytes( void ) const
			{	return	m_nLength * sizeof(wchar_t) ;	}
		// �^�O���i���쌠���j�ݒ�
		void CreatePlaneText
			( const EWStringObj & string, int nAlign = 0x20 ) ;
		// �^�O���i�f�B�X�N���v�V�����j�ݒ�
		void CreateTagInfo
			( ERIFile::ETagObject * pTags, int nAlign = 0x40 ) ;
		// ���������
		void DeleteContents( void ) ;
	} ;

public:
	// �\�z�֐�
	ERIWriteFile( void ) ;
	// ���Ŋ֐�
	virtual ~ERIWriteFile( void ) ;
	// �b�������t�@�C�����J��
	bool Open( EWriteFileObj * pFile, FileID fidType ) ;
	// �b�������t�@�C�������
	void Close( void ) ;
	// �w�b�_���R�[�h�������o��
	bool WriteHeader
		( const ERI_FILE_HEADER & efh, const ERI_INFO_HEADER & eih ) ;
	// ���R�[�h���J��
	bool DescendRecord( const UINT64 * pRecID ) ;
	// ���R�[�h�����
	void AscendRecord( void ) ;

	virtual DWORD Write( const void * ptrBuf, DWORD dwByte ) ;
	virtual DWORD GetLength( void ) ;
	virtual DWORD GetPointer( void ) ;
	virtual void Seek( DWORD dwPointer ) ;

} ;


/*****************************************************************************
                   ���������O�X�E�K���}�E�R���e�L�X�g
 *****************************************************************************/

class	RLHEncodeContext
{
protected:
	int		m_nIntBufCount ;	// ���ԓ��̓o�b�t�@�ɒ~�ς���Ă���r�b�g��
	DWORD	m_dwIntBuffer ;		// ���ԓ��̓o�b�t�@
	ULONG	m_nBufferingSize ;	// �o�b�t�@�����O����o�C�g��
	ULONG	m_nBufCount ;		// �o�b�t�@�ɒ~�ς���Ă���o�C�g��
	PBYTE	m_ptrBuffer ;		// �o�̓o�b�t�@�̐擪�ւ̃|�C���^

	struct	MTF_TABLE
	{
		BYTE	iplt[0x100] ;

		inline void Initialize( void ) ;
		inline int Search( BYTE p ) ;
	} ;
	MTF_TABLE *	m_pMTFTable[0x101] ;	// MTF�e�[�u��

	ERINA_HUFFMAN_TREE *	m_pLastHuffmanTree ;
	ERINA_HUFFMAN_TREE *	m_pHuffmanTree[0x101] ;

public:
	// �\�z�֐�
	RLHEncodeContext( ULONG nBufferingSize ) ;
	// ���Ŋ֐�
	virtual ~RLHEncodeContext( void ) ;

	// ���r�b�g�o�͂���
	int OutNBits( DWORD dwData, int n ) ;
	// �K���}�R�[�h�ɕ����������ۂ̃r�b�g�����v�Z
	static inline int TryOutACode( int num ) ;
	// �K���}�R�[�h���o�͂���
	int OutACode( int num ) ;
	// �o�b�t�@�̓��e���o�͂��ċ�ɂ���
	int Flushout( void ) ;
	// �o�b�t�@�̓��e���o�͂���
	virtual ULONG WriteNextData( const BYTE * ptrBuffer, ULONG nBytes ) = 0 ;

	// ���������O�X�K���}�����ɕ����������ۂ̃T�C�Y�i�r�b�g���j���v�Z
	static int TryEncodeGammaCodes( const INT * ptrSrc, int nCount ) ;
	// ���������O�X�K���}�����ɕ��������ďo�͂���
	int EncodeGammaCodes( const INT * ptrSrc, int nCount ) ;

	// RL-MTF-G �����̕������̏���������
	void PrepareToEncodeRLMTFGCode( void ) ;
	// RL-MTF-G �����ɕ��������ďo�͂���
	int EncodeRLMTFGCodes( PBYTE ptrSrc, int nCount ) ;

	// ERINA �����̕������̏���������
	void PrepareToEncodeERINACode( void ) ;
	// �n�t�}�������ŏo�͂���
	int OutAHuffmanCode( ERINA_HUFFMAN_TREE * tree, int num ) ;
	// �������n�t�}�������ŏo�͂���
	int OutLengthHuffman( ERINA_HUFFMAN_TREE * tree, int length ) ;
	// ERINA �����ɕ��������ďo�͂���
	int EncodeERINACodes( const INT * ptrSrc, int nCount ) ;
	// ERINA �����ɕ��������ďo�͂���
	int EncodeERINACodesSBZL( const SBYTE * ptrSrc, int nCount ) ;
	// ERINA �����i256�F�p�j�ɕ��������ďo�͂���
	int EncodeERINACodes256( const BYTE * ptrSrc, int nCount ) ;

} ;

//
// MTF_TABLE ������������
//////////////////////////////////////////////////////////////////////////////
inline void RLHEncodeContext::MTF_TABLE::Initialize( void )
{
	for ( int i = 0; i < 0x100; i ++ )
		iplt[i] = (BYTE) i ;
}

//
// �e�[�u���̒����������āAMove To Front �����s
//////////////////////////////////////////////////////////////////////////////
inline int RLHEncodeContext::MTF_TABLE::Search( BYTE p )
{
	BYTE	lplt, cplt ;
	int		index = 0 ;
	lplt = p ;
	for ( ; ; )
	{
		cplt = iplt[index] ;
		iplt[index ++] = lplt ;
		if ( cplt == p )
			break ;
		lplt = cplt ;
	}
	return	index ;
}

//
// �K���}�R�[�h�ɕ����������ۂ̃r�b�g�����v�Z
//////////////////////////////////////////////////////////////////////////////
inline int RLHEncodeContext::TryOutACode( int num )
{
	int	b = 0, c = 1 ;
	num -- ;
	while ( num >= c )
	{
		num -= c ;
		c <<= 1 ;
		b ++ ;
	}
	return	b * 2 + 1 ;
}


/*****************************************************************************
                               ���k�I�u�W�F�N�g
 *****************************************************************************/

class	ERIEncoder
{
protected:
	ERI_INFO_HEADER		m_EriInfHdr ;			// �摜���w�b�_

	UINT				m_nBlockSize ;			// �u���b�L���O�T�C�Y
	ULONG				m_nBlockArea ;			// �u���b�N�ʐ�
	ULONG				m_nBlockSamples ;		// �u���b�N�̃T���v����
	UINT				m_nChannelCount ;		// �`���l����
	ULONG				m_nWidthBlocks ;		// �摜�̕��i�u���b�N���j
	ULONG				m_nHeightBlocks ;		// �摜�̍����i�u���b�N���j

	UINT				m_nSrcBytesPerPixel ;	// 1�s�N�Z���̃o�C�g��

	PINT				m_ptrColumnBuf ;		// ��o�b�t�@
	PINT				m_ptrLineBuf ;			// �s�o�b�t�@
	PINT				m_ptrBuffer1 ;			// �����o�b�t�@
	PINT				m_ptrBuffer2 ;
	int					m_nChannelDepth ;		// �`���l���̃r�b�g�[�x

	PINT				m_pArrangeTable[4] ;	// �T���v�����O�e�[�u��

	PBYTE				m_ptrOperations ;		// �I�y���[�V�����e�[�u��
	PINT				m_ptrDstBuffer ;		// �f�B�X�e�B�l�[�V�����o�b�t�@

	ERINA_HUFFMAN_TREE *	m_pHuffmanTree ;	// �n�t�}����

public:
	typedef	void (ERIEncoder::*PFUNC_COLOR_OPRATION)( void ) ;
	typedef	void (ERIEncoder::*PFUNC_SAMPLING)
		( PBYTE ptrSrc, LONG nLineBytes, int nWidth, int nHeight ) ;
	typedef	void (ERIEncoder::*PFUNC_SAMPLINGII)
		( REAL32 * ptrBuffer[], PBYTE ptrSrc,
			LONG nLineBytes, int nWidth, int nHeight ) ;
	typedef	void (ERIEncoder::*PFUNC_BLOCK_SCALING)( void ) ;

protected:
	UINT				m_nBlocksetCount ;		// 1�u���b�N�Z�b�g�̃u���b�N��
	PFUNC_BLOCK_SCALING	m_pfnBlockScaling ;		// �u���b�N�X�P�[�����O�֐�

	REAL32 *			m_ptrBuffer3[4][4] ;	// �����o�b�t�@
	REAL32 *			m_ptrBuffer4[16] ;
	REAL32 *			m_ptrBuffer5[16] ;
	REAL32 *			m_ptrWorkDCT1 ;			// DCT �ϊ��p��Ɨ̈�
	REAL32 *			m_ptrWorkDCT2 ;
	INT					m_nDCDiffBuffer[16] ;	// DC ���������p�o�b�t�@

	PINT				m_ptrTableDC ;			// ��������

public:
	struct	PARAMETER
	{
		REAL32			m_rYScaleDC ;			// �P�x���������̗ʎq���W��
		REAL32			m_rCScaleDC ;			// �F�����������̗ʎq���W��
		REAL32			m_rYScaleLow ;			// �P�x����g�����̗ʎq���W��
		REAL32			m_rCScaleLow ;			// �F������g�����̗ʎq���W��
		REAL32			m_rYScaleHigh ;			// �P�x�����g�����̗ʎq���W��
		REAL32			m_rCScaleHigh ;			// �F�������g�����̗ʎq���W��
		int				m_nLowThreshold ;		// �P�x����g������臒l
		int				m_nHighThreshold ;		// �P�x�����g������臒l

		PARAMETER( void ) ;
	} ;
protected:
	PARAMETER			m_parameter ;			// ���k�p�����[�^

	static PFUNC_COLOR_OPRATION	m_pfnColorOperation[0x10] ;

public:
	// �\�z�֐�
	ERIEncoder( void ) ;
	// ���Ŋ֐�
	virtual ~ERIEncoder( void ) ;

	// �������i�p�����[�^�̐ݒ�j
	virtual int Initialize( const ERI_INFO_HEADER & infhdr ) ;
	// �I���i�������̉���Ȃǁj
	virtual void Delete( void ) ;
	// �摜�����k
	virtual int EncodeImage
		( const RASTER_IMAGE_INFO & srcimginf,
			RLHEncodeContext & context, DWORD fdwFlags = 0x0021 ) ;
	// ���k�I�v�V������ݒ�
	void SetCompressionParameter( const PARAMETER & parameter ) ;

protected:
	// �T���v�����O�e�[�u���̏�����
	void InitializeSamplingTable( void ) ;
	// �t���J���[�摜�̈��k
	int EncodeTrueColorImage
		( const RASTER_IMAGE_INFO & imginf,
			RLHEncodeContext & context, DWORD fdwFlags ) ;
	// �t���J���[�摜�̈��k
	int EncodeTrueColorImageII
		( const RASTER_IMAGE_INFO & imginf,
			RLHEncodeContext & context, DWORD fdwFlags ) ;
	// �p���b�g�摜�̈��k
	int EncodePaletteImage
		( const RASTER_IMAGE_INFO & imginf, RLHEncodeContext & context ) ;

	// ��������
	void DifferentialOperation( LONG nAllBlockLines, PINT * ptrNextLineBuf ) ;
	// �I�y���[�V�����R�[�h���擾
	DWORD DecideOperationCode
		( int nCompressMode, LONG nAllBlockLines, PINT * ptrNextLineBuf ) ;

	// �`���l���̃r�b�g�[�x���擾����
	virtual int GetChannelDepth
		( DWORD fdwFormatType, DWORD dwBitsPerPixel ) ;
	// �w��̃r�b�g�[�x�Ƀf�[�^�𐳋K������
	void NormalizeWithDepth( PINT ptrDst, PINT ptrSrc, int nCount ) ;
	// �摜���T���v�����O����֐��ւ̃|�C���^���擾����
	virtual PFUNC_SAMPLING GetSamplingFunc
		( DWORD fdwFormatType, DWORD dwBitsPerPixel ) ;

	// �J���[�I�y���[�V�����֐��Q
	void ColorOperation0000( void ) ;
	void ColorOperation0101( void ) ;
	void ColorOperation0110( void ) ;
	void ColorOperation0111( void ) ;
	void ColorOperation1001( void ) ;
	void ColorOperation1010( void ) ;
	void ColorOperation1011( void ) ;
	void ColorOperation1101( void ) ;
	void ColorOperation1110( void ) ;
	void ColorOperation1111( void ) ;

	// �O���C�摜�̃T���v�����O
	void SamplingGray8
		( PBYTE ptrSrc, LONG nLineBytes, int nWidth, int nHeight ) ;
	// RGB�摜(15�r�b�g)�̃T���v�����O
	void SamplingRGB16
		( PBYTE ptrSrc, LONG nLineBytes, int nWidth, int nHeight ) ;
	// RGB�摜�̃T���v�����O
	void SamplingRGB24
		( PBYTE ptrSrc, LONG nLineBytes, int nWidth, int nHeight ) ;
	// RGBA�摜�̃T���v�����O
	void SamplingRGBA32
		( PBYTE ptrSrc, LONG nLineBytes, int nWidth, int nHeight ) ;

protected:
	// �T���v�����O�e�[�u���̏�����
	void InitializeZigZagTable( void ) ;
	// �t���J���[�摜�̈��k
	int EncodeTrueColorImageDCT
		( const RASTER_IMAGE_INFO & imginf,
			RLHEncodeContext & context, DWORD fdwFlags ) ;

	// �摜���T���v�����O����֐��ւ̃|�C���^���擾����
	virtual PFUNC_SAMPLINGII GetSamplingFuncII
		( DWORD fdwFormatType, DWORD dwBitsPerPixel ) ;

	// RGB�摜�̃T���v�����O
	void SamplingRGB24II
		( REAL32 * ptrBuffer[], PBYTE ptrSrc,
			LONG nLineBytes, int nWidth, int nHeight ) ;
	// RGBA�摜�̃T���v�����O
	void SamplingRGBA32II
		( REAL32 * ptrBuffer[], PBYTE ptrSrc,
			LONG nLineBytes, int nWidth, int nHeight ) ;
	// ���[�̈�Ɏw��l��ݒ�
	void FillOddArea
		( REAL32 * ptrBuffer, int nWidth, int nHeight, REAL32 rFill ) ;

	// RGB -> YUV �ϊ��֐�
	void ConvertRGBtoYUV( void ) ;

	// 4:4:4 �X�P�[�����O
	void BlockScaling444( void ) ;
	// 4:2:2 �X�P�[�����O
	void BlockScaling422( void ) ;
	// 4:1:1 �X�P�[�����O
	void BlockScaling411( void ) ;

	// DCT �ϊ����{��
	void PerformDCT( void ) ;

	// �ʎq�����{��
	void ArrangeAndQuantumize( BYTE bytCoefficient[] ) ;

protected:
	// �W�J�i�s�󋵒ʒm�֐�
	virtual int OnEncodedBlock( LONG line, LONG column ) ;
	virtual int OnEncodedLine( LONG line ) ;

} ;

#define	ERI_ENCODE_INDEPENDENT_BLOCK	0x0001
#define	ERI_MAKE_COMPRESS_MODE(x)		(((x) & 0x03) << 4)
#define	ERI_GET_COMPRESS_MODE(x)		(((x) & 0x30) >> 4)



/*****************************************************************************
                     �t�@�C���X�g���[���R���e�L�X�g
 *****************************************************************************/

class	EFileEncodeContext	: public	RLHEncodeContext
{
public:
	// �\�z�֐�
	EFileEncodeContext( EWriteFileObj * pFileObj, ULONG nBufferingSize ) ;
	// ���Ŋ֐�
	virtual ~EFileEncodeContext( void ) ;

protected:
	EWriteFileObj *	m_pFileObj ;

public:
	// ���̃f�[�^�������o��
	virtual ULONG WriteNextData( const BYTE * ptrBuffer, ULONG nBytes ) ;
	// �t�@�C���I�u�W�F�N�g��ݒ肷��
	void AttachFileObject( EWriteFileObj * pFileObj ) ;

} ;


#endif
