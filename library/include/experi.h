
/*****************************************************************************
                         E R I N A - L i b r a r y
                                                      �ŏI�X�V 2002/05/26
 ----------------------------------------------------------------------------
         Copyright (C) 2000-2002 Leshade Entis. All rights reserved.
 *****************************************************************************/


#if	!defined(EXPERI_H_INCLUDED)
#define	EXPERI_H_INCLUDED


/*****************************************************************************
                       ���C�u�����������E�I���֐�
 *****************************************************************************/

#if	defined(_M_IX86) && !defined(ERI_INTEL_X86)
#define	ERI_INTEL_X86
#endif

extern	"C"
{
	void eriInitializeLibrary( void ) ;
	void eriCloseLibrary( void ) ;
	void eriInitializeTask( void ) ;
	void eriCloseTask( void ) ;
#if	defined(ERI_INTEL_X86)
	void eriEnableMMX( int fForceEnable = 0 ) ;
	void eriDisableMMX( int fForceDisable = 0 ) ;
	void eriInitializeFPU( void ) ;
#endif

} ;

#if	defined(ERI_INTEL_X86)
#define	ERI_USE_MMX_PENTIUM	0x0002
#define	ERI_USE_XMM_P3		0x0008
extern	"C"	DWORD	ERI_EnabledProcessorType ;
#endif


/*****************************************************************************
                         �������A���P�[�V����
 *****************************************************************************/

extern	PVOID eriAllocateMemory( DWORD dwBytes ) ;
extern	void eriFreeMemory( PVOID ptrMem ) ;


/*****************************************************************************
                                �摜���
 *****************************************************************************/

struct	ERI_FILE_HEADER
{
	DWORD	dwVersion ;
	DWORD	dwContainedFlag ;
	DWORD	dwKeyFrameCount ;
	DWORD	dwFrameCount ;
	DWORD	dwAllFrameTime ;
} ;

struct	ERI_INFO_HEADER
{
	DWORD	dwVersion ;
	DWORD	fdwTransformation ;
	DWORD	dwArchitecture ;
	DWORD	fdwFormatType ;
	SDWORD	nImageWidth ;
	SDWORD	nImageHeight ;
	DWORD	dwBitsPerPixel ;
	DWORD	dwClippedPixel ;
	DWORD	dwSamplingFlags ;
	SDWORD	dwQuantumizedBits[2] ;
	DWORD	dwAllottedBits[2] ;
	DWORD	dwBlockingDegree ;
	DWORD	dwLappedBlock ;
	DWORD	dwFrameTransform ;
	DWORD	dwFrameDegree ;
} ;

struct	RASTER_IMAGE_INFO
{
	DWORD	fdwFormatType ;
	PBYTE	ptrImageArray ;
	SDWORD	nImageWidth ;
	SDWORD	nImageHeight ;
	DWORD	dwBitsPerPixel ;
	SDWORD	BytesPerLine ;
} ;

#if	!defined(__ENTISGLS_H__)
union	ENTIS_PALETTE
{
	struct
	{
		BYTE	Blue ;
		BYTE	Green ;
		BYTE	Red ;
		BYTE	Reserved ;
	}			rgb ;
	struct
	{
		BYTE	Blue ;
		BYTE	Green ;
		BYTE	Red ;
		BYTE	Alpha ;
	}			rgba ;
} ;
#endif

#define	EFH_CONTAIN_IMAGE		0x00000001
#define	EFH_CONTAIN_ALPHA		0x00000002
#define	EFH_CONTAIN_PALETTE		0x00000010
#define	EFH_CONTAIN_WAVE		0x00000100
#define	EFH_CONTAIN_SEQUENCE	0x00000200

#define	ERI_RGB_IMAGE			0x00000001
#define	ERI_RGBA_IMAGE			0x04000001
#define	ERI_GRAY_IMAGE			0x00000002
#define	ERI_TYPE_MASK			0x00FFFFFF
#define	ERI_WITH_PALETTE		0x01000000
#define	ERI_USE_CLIPPING		0x02000000
#define	ERI_WITH_ALPHA			0x04000000

#define	CVTYPE_LOSSLESS_ERI		0x03020000
#define	CVTYPE_DCT_ERI			0x00000001
#define	CVTYPE_LOT_ERI			0x00000005
#define	CVTYPE_LOT_ERI_MSS		0x00000105

#define	ERI_ARITHMETIC_CODE		32
#define	ERI_RUNLENGTH_GAMMA		0xFFFFFFFF
#define	ERI_RUNLENGTH_HUFFMAN	0xFFFFFFFC

#define	ERISF_YUV_4_4_4			0x00040404
#define	ERISF_YUV_4_2_2			0x00040202
#define	ERISF_YUV_4_1_1			0x00040101


/*****************************************************************************
                                �������
 *****************************************************************************/

struct	MIO_INFO_HEADER
{
	DWORD	dwVersion ;
	DWORD	fdwTransformation ;
	DWORD	dwArchitecture ;
	DWORD	dwChannelCount ;
	DWORD	dwSamplesPerSec ;
	DWORD	dwBlocksetCount ;
	DWORD	dwSubbandDegree ;
	DWORD	dwAllSampleCount ;
	DWORD	dwLappedDegree ;
	DWORD	dwBitsPerSample ;
} ;

struct	MIO_DATA_HEADER
{
	BYTE	bytVersion ;
	BYTE	bytFlags ;
	BYTE	bytReserved1 ;
	BYTE	bytReserved2 ;
	DWORD	dwSampleCount ;
} ;

#define	MIO_LEAD_BLOCK	0x01


/*****************************************************************************
                            �A�j���[�V�����p�֐�
 *****************************************************************************/

extern	"C"
{
	int eriAdditionOfFrame
		( const RASTER_IMAGE_INFO & riiDst,
			const RASTER_IMAGE_INFO & riiSrc ) ;
	int eriSubtractionOfFrame
		( const RASTER_IMAGE_INFO & riiDst,
			const RASTER_IMAGE_INFO & riiSrc ) ;
	int eriCopyImage
		( const RASTER_IMAGE_INFO & riiDst,
			const RASTER_IMAGE_INFO & riiSrc ) ;

} ;


/*****************************************************************************
                                 �`��֐�
 *****************************************************************************/

extern	"C"
{
	void eriDrawImageToDC
		( HDC hDC, int x, int y, const RASTER_IMAGE_INFO & rii,
			const ENTIS_PALETTE * ppalette = NULL, const SIZE * psize = NULL ) ;
	int eriEnlargeImageDouble
		( const RASTER_IMAGE_INFO & riiDst,
			const RASTER_IMAGE_INFO & riiSrc ) ;

} ;


/*****************************************************************************
                             �t�@�C���I�u�W�F�N�g
 *****************************************************************************/

class	EFileObject
{
public:
	// �\�z�֐�
	EFileObject( void ) ;
	// ���Ŋ֐�
	virtual ~EFileObject( void ) ;
	// �f�[�^��ǂݍ���
	virtual DWORD Read( void * ptrBuf, DWORD dwByte ) = 0 ;
	// �t�@�C���̒������擾����
	virtual DWORD GetLength( void ) = 0 ;
	// �t�@�C���|�C���^���擾����
	virtual DWORD GetPointer( void ) = 0 ;
	// �t�@�C���|�C���^���ړ�����
	virtual void Seek( DWORD dwPointer ) = 0 ;

} ;

class	EReadFile	: public	EFileObject
{
protected:
	HANDLE	m_hFile ;
	bool	m_flagToClose ;

public:
	EReadFile( void ) ;
	EReadFile( HANDLE hFile ) ;
	virtual ~EReadFile( void ) ;

	bool Open( const char * pszFile ) ;
	void Attach( HANDLE hFile ) ;
	void Close( void ) ;

	virtual DWORD Read( void * ptrBuf, DWORD dwByte ) ;
	virtual DWORD GetLength( void ) ;
	virtual DWORD GetPointer( void ) ;
	virtual void Seek( DWORD dwPointer ) ;

} ;

class	EMemFile	: public	EFileObject
{
protected:
	const BYTE *	m_ptrMemory ;
	DWORD			m_dwLength ;
	DWORD			m_dwPointer ;

public:
	EMemFile( const BYTE * ptrMem, DWORD dwLength ) ;
	virtual ~EMemFile( void ) ;
	virtual DWORD Read( void * ptrBuf, DWORD dwByte ) ;
	virtual DWORD GetLength( void ) ;
	virtual DWORD GetPointer( void ) ;
	virtual void Seek( DWORD dwPointer ) ;

} ;


/*****************************************************************************
                        ERI �t�@�C���C���^�[�t�F�[�X
 *****************************************************************************/

class	ERIFile	: public	EFileObject
{
protected:
	EFileObject *	m_pFile ;
	struct	RECORD_HEADER
	{
		UINT64	ui64ID ;
		UINT64	ui64Length ;
	} ;
	struct	RECORD_INFO
	{
		RECORD_HEADER	header ;
		RECORD_INFO *	pParent ;
		DWORD			dwOffset ;
		DWORD			dwLimit ;
	} ;
	RECORD_INFO *	m_pRecInf ;

public:
	//
	// ������I�u�W�F�N�g
	class	EStringObj
	{
	protected:
		char *	m_ptrString ;
		int		m_nLength ;
	public:
		// �\�z�֐�
		EStringObj( void ) ;
		EStringObj( const char * pszString, int nLength = -1 ) ;
		EStringObj( const wchar_t * pwszString, int nLength = -1 ) ;
		// ���Ŋ֐�
		~EStringObj( void ) ;
		// ������Q��
		operator const char * ( void ) const
			{	return	m_ptrString ;	}
		const char * CharPtr( void ) const
			{	return	m_ptrString ;	}
		int GetLength( void ) const
			{	return	m_nLength ;		}
		// �����񉄒�
		void AddString( const EStringObj & string ) ;
		// ���
		const EStringObj & operator = ( const EStringObj & string ) ;
	} ;
	//
	// �^�O���C���f�b�N�X
	enum	TagIndex
	{
		tagTitle,				// �Ȗ�
		tagVocalPlayer,			// �̎�E���t��
		tagComposer,			// ��Ȏ�
		tagArranger,			// �ҋȎ�
		tagSource,				// �o�W�E�A���o��
		tagTrack,				// �g���b�N
		tagReleaseDate,			// �����[�X�N����
		tagGenre,				// �W������
		tagRewindPoint,			// ���[�v�|�C���g
		tagComment,				// �R�����g
		tagWords,				// �̎�
		tagMax
	} ;
	//
	// �^�O��񕶎���
	static const char *	m_pszTagName[tagMax] ;
	//
	// �^�O���I�u�W�F�N�g
	class	ETagObject
	{
	public:
		ETagObject *	m_next ;
		EStringObj		m_tag ;
		EStringObj		m_contents ;
	public:
		// �\�z�֐�
		ETagObject( void ) ;
		// ���Ŋ֐�
		~ETagObject( void ) ;
	} ;
	//
	// �^�O����̓I�u�W�F�N�g
	class	ETagInfo
	{
	public:
		ETagObject *	m_pTags ;
	public:
		// �\�z�֐�
		ETagInfo( void ) ;
		// ���Ŋ֐�
		~ETagInfo( void ) ;
		// �^�O�����
		void CreateTagInfo( const char * pszDesc ) ;
		// �^�O���̃N���A
		void DeleteContents( void ) ;
		// �^�O���擾
		const char * GetTagContents( const char * pszTag ) ;
		// �g���b�N�ԍ����擾
		int GetTrackNumber( void ) ;
		// ���[�v�|�C���g���擾
		int GetRewindPoint( void ) ;
		// �����[�X�N�������擾
		bool GetReleaseDate( int & year, int & month, int & day ) ;
	private:
		// ������𐔒l�ɕϊ�
		int StringToInt( const char *& pszValue ) ;
	} ;

	// �ǂݍ��݃}�X�N
	enum	ReadMask
	{
		rmFileHeader	= 0x00000001,
		rmPreviewInfo	= 0x00000002,
		rmImageInfo		= 0x00000004,
		rmSoundInfo		= 0x00000008,
		rmCopyright		= 0x00000010,
		rmDescription	= 0x00000020,
		rmPaletteTable	= 0x00000040
	} ;
	DWORD			m_fdwReadMask ;
	// �t�@�C���w�b�_
	ERI_FILE_HEADER	m_FileHeader ;
	// �v���r���[�摜���w�b�_
	ERI_INFO_HEADER	m_PreviewInfo ;
	// �摜���w�b�_
	ERI_INFO_HEADER	m_InfoHeader ;
	// �������w�b�_
	MIO_INFO_HEADER	m_MIOInfHdr ;
	// �p���b�g�e�[�u��
	ENTIS_PALETTE	m_PaletteTable[0x100] ;
	// ���쌠���
	EStringObj		m_strCopyright ;
	// �R�����g
	EStringObj		m_strDescription ;

public:
	// �\�z�֐�
	ERIFile( void ) ;
	// ���Ŋ֐�
	virtual ~ERIFile( void ) ;

	// �t�@�C���̃I�[�v�����@
	enum	OpenType
	{
		otOpenRoot,			// ���[�g���R�[�h���J������
		otReadHeader,		// ���w�b�_���R�[�h��ǂݍ���Œl������
		otOpenStream,		// �w�b�_��ǂݍ��݃X�g���[�����R�[�h���J��
		otOpenImageData		// �摜�f�[�^���R�[�h���J��
	} ;
	// �b�������t�@�C�����J��
	bool Open( EFileObject * pFile, OpenType type = otOpenImageData ) ;
	// �t�@�C�������
	void Close( void ) ;

	// ���R�[�h���J��
	bool DescendRecord( const UINT64 * pRecID = NULL ) ;
	// ���R�[�h�����
	void AscendRecord( void ) ;
	// ���R�[�hID���擾����
	UINT64 GetRecordID( void ) const ;

	virtual DWORD Read( void * ptrBuf, DWORD dwByte ) ;
	virtual DWORD GetLength( void ) ;
	virtual DWORD GetPointer( void ) ;
	virtual void Seek( DWORD dwPointer ) ;

} ;


/*****************************************************************************
                         �n�t�}���E�c���[�E�\����
 *****************************************************************************/

#define	ERINA_CODE_FLAG			0x80000000U
#define	ERINA_HUFFMAN_ESCAPE	0x7FFFFFFF
#define	ERINA_HUFFMAN_NULL		0x8000U
#define	ERINA_HUFFMAN_MAX		0x4000
#define	ERINA_HUFFMAN_ROOT		0x200

struct	ERINA_HUFFMAN_NODE
{
	WORD	m_weight ;
	WORD	m_parent ;
	DWORD	m_child_code ;
} ;

struct	ERINA_HUFFMAN_TREE
{
	ERINA_HUFFMAN_NODE	m_hnTree[0x201] ;
	int					m_iSymLookup[0x100] ;
	int					m_iEscape ;
	int					m_iTreePointer ;

	// �c���[�̏�����
	void Initialize( void ) ;
	// �����p�x���C���N�������g
	void IncreaseOccuedCount( int iEntry ) ;
	// �e�̏d�݂��Čv�Z����
	void RecountOccuredCount( int iParent ) ;
	// �c���[�̐��K��
	void Normalize( int iEntry ) ;
	// �V�����t���[�G���g�����쐬���Ēǉ�
	void AddNewEntry( int nNewCode ) ;
	// �e�o������2����1�ɂ��Ė؂��č\��
	void HalfAndRebuild( void ) ;

} ;


/*****************************************************************************
                     ���������O�X�E�K���}�E�R���e�L�X�g
 *****************************************************************************/

class	RLHDecodeContext
{
protected:
	int		m_flgZero ;			// �[���t���O
	ULONG	m_nLength ;			// ���������O�X
	int		m_nIntBufCount ;	// ���ԓ��̓o�b�t�@�ɒ~�ς���Ă���r�b�g��
	DWORD	m_dwIntBuffer ;		// ���ԓ��̓o�b�t�@
	ULONG	m_nBufferingSize ;	// �o�b�t�@�����O����o�C�g��
	ULONG	m_nBufCount ;		// �o�b�t�@�̎c��o�C�g��
	PBYTE	m_ptrBuffer ;		// ���̓o�b�t�@�̐擪�ւ̃|�C���^
	PBYTE	m_ptrNextBuf ;		// ���ɓǂݍ��ނׂ����̓o�b�t�@�ւ̃|�C���^

	struct	ARITHCODE_SYMBOL
	{
		WORD	wOccured ;					// �V���{���̏o����
		SWORD	wSymbol ;					// �V���{��
	} ;
	struct	STATISTICAL_MODEL
	{
		DWORD				dwTotalSymbolCount ;	// �S�V���{���� < 10000H
		ARITHCODE_SYMBOL	SymbolTable[1] ;		// ���v���f��
	} ;
	DWORD	m_dwCodeRegister ;		// �R�[�h���W�X�^
	DWORD	m_dwAugendRegister ;	// �I�[�W�F���h���W�X�^
	DWORD	m_dwCodeBuffer ;		// �r�b�g�o�b�t�@
	int		m_nVirtualPostBuf ;		// ���z�o�b�t�@�J�E���^
	int		m_nSymbolBitCount ;		// �����̃r�b�g��
	int		m_nSymbolSortCount ;	// �����̑���
	int		m_maskSymbolBit ;		// �����̃r�b�g�}�X�N
	STATISTICAL_MODEL *	m_pLastStatisticalModel ;		// �Ō�̓��v���f��
	STATISTICAL_MODEL *	m_pStatisticalTable[0x100] ;	// ���v���f��

	// MTF �e�[�u��
	struct	MTF_TABLE
	{
		BYTE	iplt[0x100] ;

		inline void Initialize( void ) ;
		inline BYTE MoveToFront( int index ) ;
	} ;
	MTF_TABLE *	m_pMTFTable[0x101] ;

	// �����֐�
	typedef	ULONG (RLHDecodeContext::*PFUNC_DECODE_SYMBOLS)
									( PINT ptrDst, ULONG nCount ) ;
	PFUNC_DECODE_SYMBOLS	m_pfnDecodeSymbols ;

	// �n�t�}����
	ERINA_HUFFMAN_TREE *	m_pLastHuffmanTree ;
	ERINA_HUFFMAN_TREE *	m_pHuffmanTree[0x101] ;

public:
	// �\�z�֐�
	RLHDecodeContext( ULONG nBufferingSize ) ;
	// ���Ŋ֐�
	virtual ~RLHDecodeContext( void ) ;

	// ���̃f�[�^��ǂݍ���
	virtual ULONG ReadNextData( PBYTE ptrBuffer, ULONG nBytes ) = 0 ;

	// �[���t���O��ǂݍ���ŁA�R���e�L�X�g������������
	void Initialize( void ) ;
	// �o�b�t�@����̎��A���̃f�[�^��ǂݍ���
	int PrefetchBuffer( void ) ;
	// 1�r�b�g�擾����i 0 ���́|1��Ԃ� �j
	INT GetABit( void ) ;
	// n�r�b�g�擾����
	UINT GetNBits( int n ) ;
	// �K���}�R�[�h���擾����
	INT GetACode( void ) ;

	// �o�b�t�@���t���b�V������
	void FlushBuffer( void ) ;
	// �Z�p�����̕����̏�������
	void PrepareToDecodeArithmeticCode( int nBitCount ) ;
	// RL-MTF-G �����̕����̏���������
	void PrepareToDecodeRLMTFGCode( void ) ;

	// �W�J�����f�[�^���擾����
	inline ULONG DecodeSymbols( PINT ptrDst, ULONG nCount ) ;
	ULONG DecodeGammaCodes( PINT ptrDst, ULONG nCount ) ;
	ULONG DecodeArithmeticCodes( PINT ptrDst, ULONG nCount ) ;
	ULONG DecodeRLMTFGCodes( PBYTE ptrDst, ULONG nCount ) ;

	// ERINA �����̕����̏���������
	void PrepareToDecodeERINACode( void ) ;
	// �n�t�}���������擾����
	int GetAHuffmanCode( ERINA_HUFFMAN_TREE * tree ) ;
	// �����̃n�t�}���������擾����
	int GetLengthHuffman( ERINA_HUFFMAN_TREE * tree ) ;
	// ERINA �����𕜍�����
	ULONG DecodeERINACodes( PINT ptrDst, ULONG nCount ) ;
	// ERINA �����𕜍�����
	ULONG DecodeERINACodesSBZL( SBYTE * ptrDst, ULONG nCount ) ;
	// ERINA �����i256�F�p�j�𕜍�����
	ULONG DecodeERINACodes256( PBYTE ptrDst, ULONG nCount ) ;

} ;

//
// MTF_TABLE ������������
//////////////////////////////////////////////////////////////////////////////
inline void RLHDecodeContext::MTF_TABLE::Initialize( void )
{
	for ( int i = 0; i < 0x100; i ++ )
		iplt[i] = (BYTE) i ;
}

//
// Move To Front �����s
//////////////////////////////////////////////////////////////////////////////
inline BYTE RLHDecodeContext::MTF_TABLE::MoveToFront( int index )
{
	BYTE	pplt = iplt[index] ;
	while ( index > 0 )
	{
		iplt[index] = iplt[index - 1] ;
		index -- ;
	}
	return	(iplt[0] = pplt) ;
}

//
// �W�J�����f�[�^���擾����
//////////////////////////////////////////////////////////////////////////////
inline ULONG RLHDecodeContext::DecodeSymbols( PINT ptrDst, ULONG nCount )
{
	return	(this->*m_pfnDecodeSymbols)( ptrDst, nCount ) ;
}


/*****************************************************************************
                               �W�J�I�u�W�F�N�g
 *****************************************************************************/

class	ERIDecoder
{
protected:
	ERI_INFO_HEADER		m_EriInfHdr ;			// �摜���w�b�_

	UINT				m_nBlockSize ;			// �u���b�L���O�T�C�Y
	ULONG				m_nBlockArea ;			// �u���b�N�ʐ�
	ULONG				m_nBlockSamples ;		// �u���b�N�̃T���v����
	UINT				m_nChannelCount ;		// �`���l����
	ULONG				m_nWidthBlocks ;		// �摜�̕��i�u���b�N���j
	ULONG				m_nHeightBlocks ;		// �摜�̍����i�u���b�N���j

	UINT				m_nDstBytesPerPixel ;	// 1�s�N�Z���̃o�C�g��

	PBYTE				m_ptrOperations ;		// �I�y���[�V�����e�[�u��
	PINT				m_ptrColumnBuf ;		// ��o�b�t�@
	PINT				m_ptrLineBuf ;			// �s�o�b�t�@
	PINT				m_ptrBuffer ;			// �����o�b�t�@
	PINT				m_ptrSubBuf ;			// �����o�b�t�@

	INT					m_fEnhancedMode ;		// �g�����[�h
	PINT				m_pArrangeTable[4] ;	// �T���v�����O�e�[�u��

	ERINA_HUFFMAN_TREE *	m_pHuffmanTree ;	// �n�t�}����

public:
	typedef	void (ERIDecoder::*PFUNC_COLOR_OPRATION)( void ) ;
	typedef	void (ERIDecoder::*PFUNC_RESTORE)
		( PBYTE ptrDst, LONG nLineBytes, int nWidth, int nHeight ) ;
	struct		OPERATION_CODE_II
	{
		int		ColorOperation ;
		int		ArrangeCode ;
	} ;
	typedef	void (ERIDecoder::*PFUNC_RESTOREII)
		( PBYTE ptrDst, LONG nLineBytes,
			REAL32 * ptrSrc[], int nWidth, int nHeight ) ;
	typedef	void (ERIDecoder::*PFUNC_BLOCK_SCALING)( void ) ;

protected:
	UINT				m_nBlocksetCount ;		// 1�u���b�N�Z�b�g�̃u���b�N��
	PFUNC_BLOCK_SCALING	m_pfnBlockScaling ;		// �u���b�N�X�P�[�����O�֐�

	REAL32 *			m_ptrBuffer2[4][4] ;	// �����o�b�t�@
	REAL32 *			m_ptrBuffer3[16] ;
	REAL32 *			m_ptrBuffer4[16] ;
	REAL32 *			m_ptrWorkDCT1 ;			// DCT �ϊ��p��Ɨ̈�
	REAL32 *			m_ptrWorkDCT2 ;
	INT					m_nDCDiffBuffer[16] ;	// DC ���������p�o�b�t�@

	PINT				m_ptrTableDC ;			// ��������

	REAL32				m_rMatrixScale ;		// DCT �s��W��
	REAL32				m_rYScaleDC ;			// ���������̋t�ʎq���W��
	REAL32				m_rCScaleDC ;

protected:
	static PFUNC_COLOR_OPRATION	m_pfnColorOperation[0x10] ;
	static const OPERATION_CODE_II	m_opcCodeTable[0x40] ;

public:
	// �\�z�֐�
	ERIDecoder( void ) ;
	// ���Ŋ֐�
	virtual ~ERIDecoder( void ) ;

	// �������i�p�����[�^�̐ݒ�j
	virtual int Initialize( const ERI_INFO_HEADER & infhdr ) ;
	// �I���i�������̉���Ȃǁj
	virtual void Delete( void ) ;
	// �摜��W�J
	virtual int DecodeImage
		( const RASTER_IMAGE_INFO & dstimginf,
			RLHDecodeContext & context, bool fTopDown ) ;

protected:
	// �T���v�����O�e�[�u���̏�����
	void InitializeArrangeTable( void ) ;
	void InitializeArrangeTableII( void ) ;
	// �t���J���[�摜�̓W�J
	int DecodeTrueColorImage
		( const RASTER_IMAGE_INFO & dstimginf, RLHDecodeContext & context ) ;
	// �t���J���[�摜�g���t�H�[�}�b�g�̓W�J
	int DecodeTrueColorImageII
		( const RASTER_IMAGE_INFO & dstimginf, RLHDecodeContext & context ) ;
	// �p���b�g�摜�̓W�J
	int DecodePaletteImage
		( const RASTER_IMAGE_INFO & dstimginf, RLHDecodeContext & context ) ;

	// �I�y���[�V�������s
	void PerformOperation
		( DWORD dwOpCode, LONG nAllBlockLines, PINT * ptrNextLineBuf ) ;

	// �W�J�摜���X�g�A����֐��ւ̃|�C���^���擾����
	virtual PFUNC_RESTORE GetRestoreFunc
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

	// �O���C�摜�̓W�J
	void RestoreGray8
		( PBYTE ptrDst, LONG nLineBytes, int nWidth, int nHeight ) ;
	// RGB�摜(15�r�b�g)�̓W�J
	void RestoreRGB16
		( PBYTE ptrDst, LONG nLineBytes, int nWidth, int nHeight ) ;
	// RGB�摜�̓W�J
	void RestoreRGB24
		( PBYTE ptrDst, LONG nLineBytes, int nWidth, int nHeight ) ;
	// RGBA�摜�̓W�J
	void RestoreRGBA32
		( PBYTE ptrDst, LONG nLineBytes, int nWidth, int nHeight ) ;

protected:
	// �T���v�����O�e�[�u���̏�����
	void InitializeZigZagTable( void ) ;
	// �t���J���[�摜�̈��k
	int DecodeTrueColorImageDCT
		( const RASTER_IMAGE_INFO & imginf, RLHDecodeContext & context ) ;

	// �W�J�摜���X�g�A����֐��ւ̃|�C���^���擾����
	virtual PFUNC_RESTOREII GetRestoreFuncII
		( DWORD fdwFormatType, DWORD dwBitsPerPixel ) ;

	// �����𐮐��Ɋۂ߂�BYTE�^�ɖO�a
	BYTE RoundR32ToByte( REAL32 r ) ;
	// RGB�摜�̓W�J
	void RestoreRGB24II
		( PBYTE ptrDst, LONG nLineBytes,
			REAL32 * ptrSrc[], int nWidth, int nHeight ) ;
	// RGBA�摜�̓W�J
	void RestoreRGBA32II
		( PBYTE ptrDst, LONG nLineBytes,
			REAL32 * ptrSrc[], int nWidth, int nHeight ) ;

	// YUV -> RGB �ϊ��֐�
	void ConvertYUVtoRGB( void ) ;

	// 4:4:4 �X�P�[�����O
	void BlockScaling444( void ) ;
	// 4:2:2 �X�P�[�����O
	void BlockScaling422( void ) ;
	// 4:1:1 �X�P�[�����O
	void BlockScaling411( void ) ;

	// IDCT �ϊ����{��
	void PerformIDCT( void ) ;

	// �t�ʎq�����{��
	void ArrangeAndIQuantumize( BYTE bytCoefficient[] ) ;

protected:
	// �W�J�i�s�󋵒ʒm�֐�
	virtual int OnDecodedBlock( LONG line, LONG column ) ;
	virtual int OnDecodedLine( LONG line ) ;

} ;


/*****************************************************************************
                     �t�@�C���X�g���[���R���e�L�X�g
 *****************************************************************************/

class	EFileDecodeContext	: public	RLHDecodeContext
{
public:
	// �\�z�֐�
	EFileDecodeContext( EFileObject * pFileObj, ULONG nBufferingSize ) ;
	// ���Ŋ֐�
	virtual ~EFileDecodeContext( void ) ;

protected:
	EFileObject *	m_pFileObj ;

public:
	// ���̃f�[�^��ǂݍ���
	virtual ULONG ReadNextData( PBYTE ptrBuffer, ULONG nBytes ) ;
	// �t�@�C���I�u�W�F�N�g��ݒ肷��
	void AttachFileObject( EFileObject * pFileObj ) ;

} ;


#endif
