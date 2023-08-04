
/*****************************************************************************
                          E R I N A - L i b r a r y
                                                      �ŏI�X�V 2002/05/26
 ----------------------------------------------------------------------------
          Copyright (C) 2000-2002 Leshade Entis. All rights reserved.
 *****************************************************************************/


#define	STRICT	1
#include <windows.h>


//
// ERINA ���C�u������`�t�@�C��
//////////////////////////////////////////////////////////////////////////////

#include "eritypes.h"
#include "erinalib.h"
#include "erimatrix.h"


/*****************************************************************************
                       ���C�u�����������E�I���֐�
 *****************************************************************************/

//
// ���C�u�����������֐�
//////////////////////////////////////////////////////////////////////////////
void eriInitializeLibrary( void )
{
#if	defined(ERI_INTEL_X86)
	//
	// MMX �𓋍ڂ��Ă���ΗL����
	eriEnableMMX( 0 ) ;
	//
	// FPU��������
	eriInitializeFPU( ) ;
#endif
	//
	// DCT �s�񉉎Z�p�̃e�[�u����������
	eriInitializeMatrixDCT( ) ;
}

//
// ���C�u�����I���֐�
//////////////////////////////////////////////////////////////////////////////
void eriCloseLibrary( void )
{
}

//
// �X���b�h�������֐�
//////////////////////////////////////////////////////////////////////////////
void eriInitializeTask( void )
{
#if	defined(ERI_INTEL_X86)
	//
	// FPU��������
	eriInitializeFPU( ) ;
#endif
}

//
// �X���b�h�I���֐�
//////////////////////////////////////////////////////////////////////////////
void eriCloseTask( void )
{
}


/*****************************************************************************
                                 �`��֐�
 *****************************************************************************/

void eriDrawImageToDC
	( HDC hDC, int x, int y, const RASTER_IMAGE_INFO & rii,
				const ENTIS_PALETTE * ppalette, const SIZE * psize )
{
	//
	// �������A�h���X�𐳋K��
	PBYTE	ptrImageArray = rii.ptrImageArray ;
	SDWORD	nBytesPerLine = rii.BytesPerLine ;
	SDWORD	nImageWidth = rii.nImageWidth ;
	SDWORD	nImageHeight = rii.nImageHeight ;
	if ( ptrImageArray == NULL )
		return ;
	if ( nBytesPerLine < 0 )
	{
		ptrImageArray += (nImageHeight - 1) * nBytesPerLine ;
		nBytesPerLine = - nBytesPerLine ;
	}
	//
	// BITMAPINFO �\���̂����
	struct	BITMAPINFO_256
	{
		BITMAPINFOHEADER	header ;
		RGBQUAD				colors[0x100] ;
	}		srcbmi ;
	//
	srcbmi.header.biSize = sizeof(BITMAPINFOHEADER) ;
	srcbmi.header.biWidth = nImageWidth ;
	srcbmi.header.biHeight = nImageHeight ;
	srcbmi.header.biPlanes = 1 ;
	srcbmi.header.biBitCount = (WORD) rii.dwBitsPerPixel ;
	srcbmi.header.biCompression = BI_RGB ;
	srcbmi.header.biSizeImage = nBytesPerLine * nImageHeight ;
	srcbmi.header.biXPelsPerMeter = 0 ;
	srcbmi.header.biYPelsPerMeter = 0 ;
	srcbmi.header.biClrUsed = 0 ;
	srcbmi.header.biClrImportant = 0 ;
	//
	if ( (rii.dwBitsPerPixel <= 8) && (ppalette != NULL) )
	{
		memcpy( srcbmi.colors, ppalette,
				(sizeof(RGBQUAD) << rii.dwBitsPerPixel) ) ;
	}
	//
	// �f�o�C�X�R���e�L�X�g�ɕ`��
	int	nDstWidth, nDstHeight ;
	if ( psize != NULL )
	{
		nDstWidth = psize->cx ;
		nDstHeight = psize->cy ;
	}
	else
	{
		nDstWidth = nImageWidth ;
		nDstHeight = nImageHeight ;
	}
	::StretchDIBits
		( hDC, x, y, nDstWidth, nDstHeight,
			0, 0, nImageWidth, nImageHeight,
			ptrImageArray, (BITMAPINFO*) &srcbmi,
			DIB_RGB_COLORS, SRCCOPY ) ;
}


/*****************************************************************************
                         �n�t�}���E�c���[�E�\����
 *****************************************************************************/

//
// �c���[�̏�����
//////////////////////////////////////////////////////////////////////////////
void ERINA_HUFFMAN_TREE::Initialize( void )
{
	int	i ;
	for ( i = 0; i < 0x100; i ++ )
	{
		m_iSymLookup[i] = ERINA_HUFFMAN_NULL ;
	}
	m_iEscape = ERINA_HUFFMAN_NULL ;
	m_iTreePointer = ERINA_HUFFMAN_ROOT ;
	m_hnTree[ERINA_HUFFMAN_ROOT].m_weight = 0 ;
	m_hnTree[ERINA_HUFFMAN_ROOT].m_parent = ERINA_HUFFMAN_NULL ;
	m_hnTree[ERINA_HUFFMAN_ROOT].m_child_code = ERINA_HUFFMAN_NULL ;
}

//
// �e�̏d�݂��Čv�Z����
//////////////////////////////////////////////////////////////////////////////
void ERINA_HUFFMAN_TREE::RecountOccuredCount( int iParent )
{
	int	iChild = m_hnTree[iParent].m_child_code ;
	m_hnTree[iParent].m_weight =
		m_hnTree[iChild].m_weight
			+ m_hnTree[iChild + 1].m_weight ;
}

//
// �V�����t���[�G���g�����쐬���Ēǉ�
//////////////////////////////////////////////////////////////////////////////
void ERINA_HUFFMAN_TREE::AddNewEntry( int nNewCode )
{
	if ( m_iTreePointer > 0 )
	{
		//
		// 2�̗̈���m�ۂ���
		int		i = m_iTreePointer = m_iTreePointer - 2 ;
		//
		// �V�����G���g���������ݒ�
		ERINA_HUFFMAN_NODE *	phnNew = &m_hnTree[i] ;
		phnNew->m_weight = 1 ;
		phnNew->m_child_code = ERINA_CODE_FLAG | nNewCode ;
		m_iSymLookup[nNewCode & 0xFF] = i ;
		//
		ERINA_HUFFMAN_NODE *	phnRoot = &m_hnTree[ERINA_HUFFMAN_ROOT] ;
		if ( phnRoot->m_child_code != ERINA_HUFFMAN_NULL )
		{
			//
			// �V�����G���g�����c���[�̖��[�ɒǉ�
			ERINA_HUFFMAN_NODE *	phnParent = &m_hnTree[i + 2] ;
			ERINA_HUFFMAN_NODE *	phnChild = &m_hnTree[i + 1] ;
			m_hnTree[i + 1] = m_hnTree[i + 2] ;
			//
			if ( phnChild->m_child_code & ERINA_CODE_FLAG )
			{
				int	nCode = phnChild->m_child_code & ~ERINA_CODE_FLAG ;
				if ( nCode != ERINA_HUFFMAN_ESCAPE )
					m_iSymLookup[nCode & 0xFF] = i + 1 ;
				else
					m_iEscape = i + 1 ;
			}
			//
			phnParent->m_weight =
				phnNew->m_weight + phnChild->m_weight ;
			phnParent->m_parent = phnChild->m_parent ;
			phnParent->m_child_code = i ;
			//
			phnNew->m_parent = phnChild->m_parent = i + 2 ;
			//
			// �e�G���g���̐��K��
			Normalize( i + 2 ) ;
		}
		else
		{
			//
			// ������Ԃ̃c���[���\�z
			phnNew->m_parent = ERINA_HUFFMAN_ROOT ;
			//
			ERINA_HUFFMAN_NODE *
				phnEscape = &m_hnTree[m_iEscape = i + 1] ;
			phnEscape->m_weight = 1 ;
			phnEscape->m_parent = ERINA_HUFFMAN_ROOT ;
			phnEscape->m_child_code = ERINA_CODE_FLAG | ERINA_HUFFMAN_ESCAPE ;
			//
			phnRoot->m_weight = 2 ;
			phnRoot->m_child_code = i ;
		}
	}
	else
	{
		//
		// �ł��o���p�x�̒Ⴂ�V���{����V�����V���{���Œu��������
		int		i = m_iTreePointer ;
		ERINA_HUFFMAN_NODE *	phnEntry = &m_hnTree[i] ;
		if ( phnEntry->m_child_code
				== (ERINA_CODE_FLAG | ERINA_HUFFMAN_ESCAPE) )
		{
			phnEntry = &m_hnTree[i + 1] ;
		}
		phnEntry->m_child_code = ERINA_CODE_FLAG | nNewCode ;
	}
}

//
// �e�o������2����1�ɂ��Ė؂��č\��
//////////////////////////////////////////////////////////////////////////////
void ERINA_HUFFMAN_TREE::HalfAndRebuild( void )
{
	//
	// �o���p�x��2����1�ɂ���
	int		i ;
	int		iNextEntry = ERINA_HUFFMAN_ROOT ;
	for ( i = ERINA_HUFFMAN_ROOT - 1; i >= m_iTreePointer; i -- )
	{
		if ( m_hnTree[i].m_child_code & ERINA_CODE_FLAG )
		{
			m_hnTree[i].m_weight = (m_hnTree[i].m_weight + 1) >> 1 ;
			m_hnTree[iNextEntry --] = m_hnTree[i] ;
		}
	}
	++ iNextEntry ;
	//
	// �c���[���č\�z
	int		iChild, nCode ;
	i = m_iTreePointer ;
	for ( ; ; )
	{
		//
		// �ł��d�݂̏�����2�̃G���g�����n�t�}���؂ɑg�ݍ���
		m_hnTree[i] = m_hnTree[iNextEntry] ;
		m_hnTree[i + 1] = m_hnTree[iNextEntry + 1] ;
		iNextEntry += 2 ;
		ERINA_HUFFMAN_NODE *	phnChild1 = &m_hnTree[i] ;
		ERINA_HUFFMAN_NODE *	phnChild2 = &m_hnTree[i + 1] ;
		//
		if ( !(phnChild1->m_child_code & ERINA_CODE_FLAG) )
		{
			iChild = phnChild1->m_child_code ;
			m_hnTree[iChild].m_parent = i ;
			m_hnTree[iChild + 1].m_parent = i ;
		}
		else
		{
			nCode = phnChild1->m_child_code & ~ERINA_CODE_FLAG ;
			if ( nCode == ERINA_HUFFMAN_ESCAPE )
				m_iEscape = i ;
			else
				m_iSymLookup[nCode & 0xFF] = i ;
		}
		//
		if ( !(phnChild2->m_child_code & ERINA_CODE_FLAG) )
		{
			iChild = phnChild2->m_child_code ;
			m_hnTree[iChild].m_parent = i + 1 ;
			m_hnTree[iChild + 1].m_parent = i + 1 ;
		}
		else
		{
			nCode = phnChild2->m_child_code & ~ERINA_CODE_FLAG ;
			if ( nCode == ERINA_HUFFMAN_ESCAPE )
				m_iEscape = i + 1 ;
			else
				m_iSymLookup[nCode & 0xFF] = i + 1 ;
		}
		//
		WORD	weight = phnChild1->m_weight + phnChild2->m_weight ;
		//
		// �e�G���g�������X�g�ɑg�ݍ���
		if ( iNextEntry <= ERINA_HUFFMAN_ROOT )
		{
			int		j = iNextEntry ;
			for ( ; ; )
			{
				if ( weight <= m_hnTree[j].m_weight )
				{
					m_hnTree[j - 1].m_weight = weight ;
					m_hnTree[j - 1].m_child_code = i ;
					break ;
				}
				m_hnTree[j - 1] = m_hnTree[j] ;
				if ( ++ j > ERINA_HUFFMAN_ROOT )
				{
					m_hnTree[ERINA_HUFFMAN_ROOT].m_weight = weight ;
					m_hnTree[ERINA_HUFFMAN_ROOT].m_child_code = i ;
					break ;
				}
			}
			-- iNextEntry ;
		}
		else
		{
			m_hnTree[ERINA_HUFFMAN_ROOT].m_weight = weight ;
			m_hnTree[ERINA_HUFFMAN_ROOT].m_parent = ERINA_HUFFMAN_NULL ;
			m_hnTree[ERINA_HUFFMAN_ROOT].m_child_code = i ;
			phnChild1->m_parent = ERINA_HUFFMAN_ROOT ;
			phnChild2->m_parent = ERINA_HUFFMAN_ROOT ;
			break ;
		}
		//
		i += 2 ;
	}
}


/*****************************************************************************
                   ���������O�X�E�K���}�E�R���e�L�X�g
 *****************************************************************************/

//
// �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
RLHDecodeContext::RLHDecodeContext( ULONG nBufferingSize )
{
	m_nIntBufCount = 0 ;
	m_nBufferingSize = (nBufferingSize + 0x03) & ~0x03 ;
	m_nBufCount = 0 ;
	m_ptrBuffer = (PBYTE) ::eriAllocateMemory( nBufferingSize ) ;
	m_pStatisticalTable[0] = 0 ;
	m_pMTFTable[0] = 0 ;
	m_pfnDecodeSymbols = &RLHDecodeContext::DecodeGammaCodes ;
	m_pHuffmanTree[0] = 0 ;
}

//
// ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
RLHDecodeContext::~RLHDecodeContext( void )
{
	::eriFreeMemory( m_ptrBuffer ) ;
	if ( m_pStatisticalTable[0] != 0 )
	{
		::eriFreeMemory( m_pStatisticalTable[0] ) ;
	}
	if ( m_pMTFTable[0] != 0 )
	{
		::eriFreeMemory( m_pMTFTable[0] ) ;
	}
	if ( m_pHuffmanTree[0] != 0 )
	{
		::eriFreeMemory( m_pHuffmanTree[0] ) ;
	}
}

//
// �[���t���O��ǂݍ���ŁA�R���e�L�X�g������������
//////////////////////////////////////////////////////////////////////////////
void RLHDecodeContext::Initialize( void )
{
	m_flgZero = (int) GetABit( ) ;
	m_nLength = 0 ;
}

//
// �o�b�t�@���t���b�V������
//////////////////////////////////////////////////////////////////////////////
void RLHDecodeContext::FlushBuffer( void )
{
	//
	// �o�b�t�@���N���A
	m_nIntBufCount = 0 ;
	m_nBufCount = 0 ;
}

//
// �Z�p�����̕����̏�������
//////////////////////////////////////////////////////////////////////////////
void RLHDecodeContext::PrepareToDecodeArithmeticCode( int nBitCount )
{
	//
	// ���v���f����������
	//
	m_nSymbolBitCount = nBitCount ;
	m_nSymbolSortCount = (1 << nBitCount) ;
	m_maskSymbolBit = m_nSymbolSortCount - 1 ;
	//
	// ���������m��
	if ( m_pStatisticalTable[0] != NULL )
	{
		::eriFreeMemory( m_pStatisticalTable[0] ) ;
	}
	m_pLastStatisticalModel = (STATISTICAL_MODEL*)
		::eriAllocateMemory( m_nSymbolSortCount *
			(sizeof(DWORD) + m_nSymbolSortCount * sizeof(ARITHCODE_SYMBOL)) ) ;
	//
	// ���v���f����ݒ�
	int	i, j ;
	int	maskSignBit = (m_nSymbolSortCount >> 1) ;
	int	bitSignExpansion = -1 << nBitCount ;
	m_pLastStatisticalModel->dwTotalSymbolCount = m_nSymbolSortCount ;
	ARITHCODE_SYMBOL *	pSymbolTable = m_pLastStatisticalModel->SymbolTable ;
	for ( i = 0; i < m_nSymbolSortCount; i ++ )
	{
		pSymbolTable[i].wOccured = 1 ;
		if ( i & maskSignBit )
			pSymbolTable[i].wSymbol = i | bitSignExpansion ;
		else
			pSymbolTable[i].wSymbol = i ;
	}
	//
	m_pStatisticalTable[0] = m_pLastStatisticalModel ;
	STATISTICAL_MODEL *	pStatisticalModel =
			(STATISTICAL_MODEL*)
				&(m_pLastStatisticalModel->SymbolTable[m_nSymbolSortCount]) ;
	//
	for ( i = 1; i < m_nSymbolSortCount; i ++ )
	{
		m_pStatisticalTable[i] = pStatisticalModel ;
		pStatisticalModel->dwTotalSymbolCount = m_nSymbolSortCount ;
		ARITHCODE_SYMBOL *	pacs = pStatisticalModel->SymbolTable ;
		//
		for ( j = 0; j < m_nSymbolSortCount; j ++ )
		{
			*(pacs ++) = pSymbolTable[j] ;
		}
		pStatisticalModel = (STATISTICAL_MODEL*) pacs ;
	}
	//
	// ���W�X�^��������
	//
	m_dwCodeRegister = 0 ;
	m_dwAugendRegister = 0xFFFFFFFF ;
	m_dwCodeBuffer = GetNBits( 32 ) ;
	//
	for ( i = 0; i < 32; i ++ )
	{
		//
		// �r�b�g�X�^�b�t�B���O
		if ( m_dwCodeBuffer == 0xFFFFFFFF )
		{
			m_dwCodeBuffer -= (GetABit() >> 1) ;
			if ( m_dwCodeBuffer == 0 )
				m_dwCodeRegister ++ ;
		}
		//
		// 1�r�b�g�V�t�g�C��
		m_dwCodeRegister = (m_dwCodeRegister << 1) | (m_dwCodeBuffer >> 31) ;
		m_dwCodeBuffer = (m_dwCodeBuffer << 1) | (GetABit() & 0x01) ;
	}
	//
	// �r�b�g�X�^�b�t�B���O
	if ( m_dwCodeBuffer == 0xFFFFFFFF )
	{
		m_dwCodeBuffer -= (GetABit() >> 1) ;
		if ( m_dwCodeBuffer == 0 )
			m_dwCodeRegister ++ ;
	}
	//
	// �W�J�֐��ݒ�
	m_nVirtualPostBuf = 0 ;
	m_pfnDecodeSymbols = &RLHDecodeContext::DecodeArithmeticCodes ;
}

//
// RL-MTF-G �����̕����̏���������
//////////////////////////////////////////////////////////////////////////////
void RLHDecodeContext::PrepareToDecodeRLMTFGCode( void )
{
	//
	// MTF�e�[�u�����m��
	PBYTE	ptrBuffer ;
	if ( m_pMTFTable[0] == NULL )
	{
		ptrBuffer =
			(PBYTE)::eriAllocateMemory( sizeof(MTF_TABLE) * 0x101 ) ;
	}
	else
	{
		ptrBuffer = (PBYTE) m_pMTFTable[0] ;
	}
	//
	// MTF�e�[�u����������
	for ( int i = 0; i <= 0x100; i ++ )
	{
		m_pMTFTable[i] = (MTF_TABLE*) ptrBuffer ;
		m_pMTFTable[i]->Initialize( ) ;
		ptrBuffer += sizeof(MTF_TABLE) ;
	}
}

//
// ERINA �����̕����̏���������
//////////////////////////////////////////////////////////////////////////////
void RLHDecodeContext::PrepareToDecodeERINACode( void )
{
	//
	// ���������m��
	m_nLength = 0 ;
	PBYTE	ptrBuf ;
	if ( m_pHuffmanTree[0] == NULL )
	{
		ptrBuf = (PBYTE) ::eriAllocateMemory
					( sizeof(ERINA_HUFFMAN_TREE) * 0x101 ) ;
	}
	else
	{
		ptrBuf = (PBYTE) m_pHuffmanTree[0] ;
	}
	//
	// �n�t�}���e�[�u����������
	for ( int i = 0; i < 0x101; i ++ )
	{
		m_pHuffmanTree[i] = (ERINA_HUFFMAN_TREE*) ptrBuf ;
		ptrBuf += sizeof(ERINA_HUFFMAN_TREE) ;
		m_pHuffmanTree[i]->Initialize( ) ;
	}
	m_pLastHuffmanTree = m_pHuffmanTree[0] ;
}


/*****************************************************************************
                               �W�J�I�u�W�F�N�g
 *****************************************************************************/

ERIDecoder::PFUNC_COLOR_OPRATION	ERIDecoder::m_pfnColorOperation[0x10] =
{
	&ERIDecoder::ColorOperation0000,
	&ERIDecoder::ColorOperation0000,
	&ERIDecoder::ColorOperation0000,
	&ERIDecoder::ColorOperation0000,
	&ERIDecoder::ColorOperation0000,
	&ERIDecoder::ColorOperation0101,
	&ERIDecoder::ColorOperation0110,
	&ERIDecoder::ColorOperation0111,
	&ERIDecoder::ColorOperation0000,
	&ERIDecoder::ColorOperation1001,
	&ERIDecoder::ColorOperation1010,
	&ERIDecoder::ColorOperation1011,
	&ERIDecoder::ColorOperation0000,
	&ERIDecoder::ColorOperation1101,
	&ERIDecoder::ColorOperation1110,
	&ERIDecoder::ColorOperation1111
} ;

const ERIDecoder::OPERATION_CODE_II	ERIDecoder::m_opcCodeTable[0x40] =
{
	{  0, 0 }, {  5, 0 }, {  6, 0 }, {  7, 0 }, {  9, 0 },
	{ 10, 0 }, { 11, 0 }, { 13, 0 }, { 14, 0 }, { 15, 0 },
	{  0, 1 }, {  5, 1 }, {  6, 1 }, {  7, 1 }, {  9, 1 },
	{ 10, 1 }, { 11, 1 }, { 13, 1 }, { 14, 1 }, { 15, 1 },
	{  0, 2 }, {  5, 2 }, {  6, 2 }, {  7, 2 }, {  9, 2 },
	{ 10, 2 }, { 11, 2 }, { 13, 2 }, { 14, 2 }, { 15, 2 },
	{  0, 3 }, {  5, 3 }, {  6, 3 }, {  7, 3 }, {  9, 3 },
	{ 10, 3 }, { 11, 3 }, { 13, 3 }, { 14, 3 }, { 15, 3 },
	{  0, 4 }, {  5, 4 }, {  6, 4 }, {  7, 4 }, {  9, 4 },
	{ 10, 4 }, { 11, 4 }, { 13, 4 }, { 14, 4 }, { 15, 4 }
} ;

//
// �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
ERIDecoder::ERIDecoder( void )
{
	m_ptrOperations = 0 ;
	m_ptrColumnBuf = 0 ;
	m_ptrLineBuf = 0 ;
	m_ptrBuffer = 0 ;
	m_ptrSubBuf = 0 ;
	//
	m_pArrangeTable[0] = NULL ;
	m_pArrangeTable[1] = NULL ;
	m_pArrangeTable[2] = NULL ;
	m_pArrangeTable[3] = NULL ;
	//
	m_pHuffmanTree = NULL ;
	//
	m_ptrBuffer2[0][0] = NULL ;
	m_ptrBuffer3[0] = NULL ;
	m_ptrBuffer4[0] = NULL ;
	m_ptrWorkDCT1 = NULL ;
	m_ptrWorkDCT2 = NULL ;
	//
	m_ptrTableDC = NULL ;
}

//
// ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
ERIDecoder::~ERIDecoder( void )
{
	Delete( ) ;
}

//
// �������i�p�����[�^�̐ݒ�j
//////////////////////////////////////////////////////////////////////////////
int ERIDecoder::Initialize( const ERI_INFO_HEADER & infhdr )
{
	//
	// �ȑO�̃f�[�^������
	Delete( ) ;
	//
	// �摜���w�b�_���R�s�[
	m_EriInfHdr = infhdr ;
	//
	if ( m_EriInfHdr.fdwTransformation == CVTYPE_LOSSLESS_ERI )
	{
		//
		// �p�����[�^�̃`�F�b�N
		if ( (m_EriInfHdr.dwArchitecture != ERI_RUNLENGTH_GAMMA)
				&& (m_EriInfHdr.dwArchitecture != ERI_RUNLENGTH_HUFFMAN)
				&& (m_EriInfHdr.dwArchitecture != ERI_ARITHMETIC_CODE) )
		{
			return	1 ;		// �G���[�i���Ή��̈��k�t�H�[�}�b�g�j
		}
		//
		switch ( (m_EriInfHdr.fdwFormatType & ERI_TYPE_MASK) )
		{
		case	ERI_RGB_IMAGE:
			if ( m_EriInfHdr.dwBitsPerPixel <= 8 )
				m_nChannelCount = 1 ;
			else if ( !(m_EriInfHdr.fdwFormatType & ERI_WITH_ALPHA) )
				m_nChannelCount = 3 ;
			else
				m_nChannelCount = 4 ;
			break ;

		case	ERI_GRAY_IMAGE:
			m_nChannelCount = 1 ;
			break;

		default:
			return	1 ;		// �G���[�i���Ή��̉摜�t�H�[�}�b�g�j
		}
		//
		if ( m_EriInfHdr.dwBlockingDegree != 0 )
		{
			//
			// �e�萔���v�Z
			m_nBlockSize = (ULONG) (1 << m_EriInfHdr.dwBlockingDegree) ;
			m_nBlockArea = (ULONG) (1 << (m_EriInfHdr.dwBlockingDegree << 1)) ;
			m_nBlockSamples = m_nBlockArea * m_nChannelCount ;
			m_nWidthBlocks =
				(ULONG) ((m_EriInfHdr.nImageWidth + m_nBlockSize - 1)
									>> m_EriInfHdr.dwBlockingDegree) ;
			if ( m_EriInfHdr.nImageHeight < 0 )
			{
				m_nHeightBlocks = (ULONG) - m_EriInfHdr.nImageHeight ;
			}
			else
			{
				m_nHeightBlocks = (ULONG) m_EriInfHdr.nImageHeight ;
			}
			m_nHeightBlocks =
				(m_nHeightBlocks + m_nBlockSize - 1)
									>> m_EriInfHdr.dwBlockingDegree ;
			//
			// ���[�L���O���������m��
			m_ptrOperations =
				(PBYTE) ::eriAllocateMemory( m_nWidthBlocks * m_nHeightBlocks ) ;
			m_ptrColumnBuf =
				(PINT) ::eriAllocateMemory
					( m_nBlockSize * m_nChannelCount * sizeof(INT) ) ;
			m_ptrLineBuf =
				(PINT) ::eriAllocateMemory( m_nChannelCount *
					(m_nWidthBlocks << m_EriInfHdr.dwBlockingDegree) * sizeof(INT) ) ;
			m_ptrBuffer =
				(PINT) ::eriAllocateMemory( m_nBlockSamples * sizeof(INT) ) ;
			m_ptrSubBuf =
				(PINT) ::eriAllocateMemory( m_nBlockSamples * sizeof(INT) ) ;
		}
		//
		// �o�[�W�����̃`�F�b�N
		if ( m_EriInfHdr.dwVersion == 0x00020100 )
		{
			//
			// �W���t�H�[�}�b�g
			m_fEnhancedMode = 0 ;
		}
		else if ( m_EriInfHdr.dwVersion == 0x00020200 )
		{
			//
			// �g���t�H�[�}�b�g
			if ( m_EriInfHdr.dwArchitecture == ERI_RUNLENGTH_HUFFMAN )
			{
				m_fEnhancedMode = 2 ;
				if ( m_EriInfHdr.dwBlockingDegree != 0 )
				{
					InitializeArrangeTableII( ) ;
					//
					m_pHuffmanTree = (ERINA_HUFFMAN_TREE*)
						::eriAllocateMemory( sizeof(ERINA_HUFFMAN_TREE) ) ;
				}
			}
			else
			{
				m_fEnhancedMode = 1 ;
				if ( m_EriInfHdr.dwBlockingDegree != 0 )
				{
					InitializeArrangeTable( ) ;
				}
			}
		}
		else
		{
			return	1 ;		// �G���[�i���Ή��̃o�[�W�����j
		}
	}
	else if ( m_EriInfHdr.fdwTransformation == CVTYPE_DCT_ERI )
	{
		if ( (m_EriInfHdr.dwArchitecture != ERI_RUNLENGTH_GAMMA)
				&& (m_EriInfHdr.dwArchitecture != ERI_RUNLENGTH_HUFFMAN) )
		{
			return	1 ;		// �i���Ή��̈��k�t�H�[�}�b�g�j
		}
		//
		if ( (m_EriInfHdr.fdwFormatType & ERI_TYPE_MASK) != ERI_RGB_IMAGE )
		{
			return	1 ;		// �i���Ή��̉摜�t�H�[�}�b�g�j
		}
		if ( m_EriInfHdr.dwBitsPerPixel < 24 )
		{
			return	1 ;		// �i���Ή��̉摜�t�H�[�}�b�g�j
		}
		if ( !(m_EriInfHdr.fdwFormatType & ERI_WITH_ALPHA) )
		{
			m_nChannelCount = 3 ;
		}
		else
		{
			m_nChannelCount = 4 ;
		}
		//
		if ( (m_EriInfHdr.dwBlockingDegree < 3)
			|| (5 < m_EriInfHdr.dwBlockingDegree) )
		{
			return	1 ;		// �i���Ή��̃t�H�[�}�b�g�j
		}
		//
		// �e�萔���v�Z
		m_nBlockSize = (ULONG) (1 << m_EriInfHdr.dwBlockingDegree) ;
		m_nBlockArea = (ULONG) (1 << (m_EriInfHdr.dwBlockingDegree << 1)) ;
		m_nBlockSamples = m_nBlockArea * 4 * m_nChannelCount ;
		m_nWidthBlocks =
			(ULONG) ((m_EriInfHdr.nImageWidth + (m_nBlockSize * 2) - 1)
								>> (m_EriInfHdr.dwBlockingDegree + 1)) ;
		if ( m_EriInfHdr.nImageHeight < 0 )
		{
			m_nHeightBlocks = (ULONG) - m_EriInfHdr.nImageHeight ;
		}
		else
		{
			m_nHeightBlocks = (ULONG) m_EriInfHdr.nImageHeight ;
		}
		m_nHeightBlocks =
			(m_nHeightBlocks + (m_nBlockSize * 2) - 1)
								>> (m_EriInfHdr.dwBlockingDegree + 1) ;
		//
		m_nBlocksetCount = 0 ;
		switch ( m_EriInfHdr.dwSamplingFlags )
		{
		case	ERISF_YUV_4_4_4:
			m_nBlocksetCount = 12 ;
			m_pfnBlockScaling = &ERIDecoder::BlockScaling444 ;
			break ;
		case	ERISF_YUV_4_2_2:
			m_nBlocksetCount = 8 ;
			m_pfnBlockScaling = &ERIDecoder::BlockScaling422 ;
			break ;
		case	ERISF_YUV_4_1_1:
			m_nBlocksetCount = 6 ;
			m_pfnBlockScaling = &ERIDecoder::BlockScaling411 ;
			break ;
		default:
			return	1 ;			// �G���[�i���Ή��̃t�H�[�}�b�g�j
		}
		if ( m_nChannelCount == 4 )
		{
			m_nBlocksetCount += 4 ;
		}
		//
		// ���[�L���O���������m��
		m_ptrOperations =
			(PBYTE) ::eriAllocateMemory
				( m_nWidthBlocks * m_nHeightBlocks * 4 ) ;
		m_ptrTableDC =
			(PINT) ::eriAllocateMemory
				( m_nWidthBlocks * m_nHeightBlocks
					* m_nBlocksetCount * sizeof(INT) ) ;
		//
		m_ptrBuffer =
			(PINT) ::eriAllocateMemory
				( m_nBlocksetCount * m_nBlockArea * sizeof(INT) ) ;
		//
		REAL32 *	ptrBuffer =
			(REAL32*) ::eriAllocateMemory
				( m_nBlockArea * sizeof(REAL32) * 16 ) ;
		int		i, j ;
		for ( i = 0; i < 4; i ++ )
		{
			for ( j = 0; j < 4; j ++ )
			{
				m_ptrBuffer2[i][j] = ptrBuffer ;
				ptrBuffer += m_nBlockArea ;
			}
		}
		//
		ptrBuffer =
			(REAL32*) ::eriAllocateMemory
				( m_nBlockArea * sizeof(REAL32) * 16 ) ;
		for ( i = 0; i < 16; i ++ )
		{
			m_ptrBuffer3[i] = ptrBuffer ;
			ptrBuffer += m_nBlockArea ;
		}
		//
		ptrBuffer =
			(REAL32*) ::eriAllocateMemory
				( m_nBlockArea * sizeof(REAL32) * 16 ) ;
		for ( i = 0; i < 16; i ++ )
		{
			m_ptrBuffer4[i] = ptrBuffer ;
			ptrBuffer += m_nBlockArea ;
		}
		//
		m_ptrWorkDCT1 =
			(REAL32*) ::eriAllocateMemory( m_nBlockArea * sizeof(REAL32) ) ;
		m_ptrWorkDCT2 =
			(REAL32*) ::eriAllocateMemory( m_nBlockSize * sizeof(REAL32) ) ;
		//
		// �n�t�}���ؗp�̃��������m��
		m_pHuffmanTree = (ERINA_HUFFMAN_TREE*)
			::eriAllocateMemory( sizeof(ERINA_HUFFMAN_TREE) ) ;
		//
		// �T���v�����O�e�[�u���̏���
		InitializeZigZagTable( ) ;
	}
	else
	{
		return	1 ;			// �G���[�i���Ή��̃t�H�[�}�b�g�j
	}

	//
	// ����I��
	return	0 ;
}

//
// �I���i�������̉���Ȃǁj
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::Delete( void )
{
	if ( m_ptrOperations != 0 )
	{
		::eriFreeMemory( m_ptrOperations ) ;
		m_ptrOperations = 0 ;
	}
	if ( m_ptrColumnBuf != 0 )
	{
		::eriFreeMemory( m_ptrColumnBuf ) ;
		m_ptrColumnBuf = 0 ;
	}
	if ( m_ptrLineBuf != 0 )
	{
		::eriFreeMemory( m_ptrLineBuf ) ;
		m_ptrLineBuf = 0 ;
	}
	if ( m_ptrBuffer != 0 )
	{
		::eriFreeMemory( m_ptrBuffer ) ;
		m_ptrBuffer = 0 ;
	}
	if ( m_ptrSubBuf != NULL )
	{
		::eriFreeMemory( m_ptrSubBuf ) ;
		m_ptrSubBuf = NULL ;
	}
	if ( m_pArrangeTable[0] != NULL )
	{
		::eriFreeMemory( m_pArrangeTable[0] ) ;
		m_pArrangeTable[0] = NULL ;
	}
	if ( m_pHuffmanTree != NULL )
	{
		::eriFreeMemory( m_pHuffmanTree ) ;
		m_pHuffmanTree = NULL ;
	}
	if ( m_ptrBuffer2[0][0] != NULL )
	{
		::eriFreeMemory( m_ptrBuffer2[0][0] ) ;
		m_ptrBuffer2[0][0] = NULL ;
	}
	if ( m_ptrBuffer3[0] != NULL )
	{
		::eriFreeMemory( m_ptrBuffer3[0] ) ;
		m_ptrBuffer3[0] = NULL ;
	}
	if ( m_ptrBuffer4[0] != NULL )
	{
		::eriFreeMemory( m_ptrBuffer4[0] ) ;
		m_ptrBuffer4[0] = NULL ;
	}
	if ( m_ptrWorkDCT1 != NULL )
	{
		::eriFreeMemory( m_ptrWorkDCT1 ) ;
		m_ptrWorkDCT1 = NULL ;
	}
	if ( m_ptrWorkDCT2 != NULL )
	{
		::eriFreeMemory( m_ptrWorkDCT2 ) ;
		m_ptrWorkDCT2 = NULL ;
	}
	if ( m_ptrTableDC != NULL )
	{
		::eriFreeMemory( m_ptrTableDC ) ;
		m_ptrTableDC = NULL ;
	}
}

//
// �摜��W�J
//////////////////////////////////////////////////////////////////////////////
int ERIDecoder::DecodeImage
( const RASTER_IMAGE_INFO & dstimginf,
		RLHDecodeContext & context, bool fTopDown )
{
	//
	// �o�͉摜�����R�s�[����
	RASTER_IMAGE_INFO	imginf = dstimginf ;
	bool	fReverse = fTopDown ;
	if ( m_EriInfHdr.nImageHeight < 0 )
	{
		fReverse = ! fReverse ;
	}
	if ( fReverse )
	{
		imginf.ptrImageArray +=
			(imginf.nImageHeight - 1) * imginf.BytesPerLine ;
		imginf.BytesPerLine = - imginf.BytesPerLine ;
	}
	//
	if ( m_EriInfHdr.fdwTransformation == CVTYPE_LOSSLESS_ERI )
	{
		//
		// ERI�o�[�W�������擾
		context.FlushBuffer( ) ;
		UINT	nERIVersion = context.GetNBits( 8 ) ;
		if ( (nERIVersion == 1) || (nERIVersion == 4) )
		{
			//
			// �t���J���[�t�H�[�}�b�g
			if ( (nERIVersion == 4) && (m_fEnhancedMode != 1) )
			{
				return	1 ;			// ���Ή��̃t�H�[�}�b�g
			}
			return	DecodeTrueColorImage( imginf, context ) ;
		}
		else if ( nERIVersion == 8 )
		{
			//
			// �t���J���[�g���t�H�[�}�b�g
			return	DecodeTrueColorImageII( imginf, context ) ;
		}
		else if ( nERIVersion == 2 )
		{
			//
			// �p���b�g�摜�t�H�[�}�b�g
			return	DecodePaletteImage( imginf, context ) ;
		}
	}
	else if ( m_EriInfHdr.fdwTransformation == CVTYPE_DCT_ERI )
	{
		//
		// ��t�t���J���[�t�H�[�}�b�g
		return	DecodeTrueColorImageDCT( imginf, context ) ;
	}

	return	1 ;			// ���Ή��̃t�H�[�}�b�g
}

//
// �A�����W�e�[�u���̏�����
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::InitializeArrangeTable( void )
{
	int	i, j, k, l ;
	PINT	ptrNext ;
	int	nBlockDegree = m_EriInfHdr.dwBlockingDegree ;
	int	nBlockSize = (1 << nBlockDegree) ;
	int	nBlockHalf = nBlockSize >> 1 ;
	int	nBlockArea = (nBlockSize << nBlockDegree) ;
	//
	// �T���v�����O�e�[�u���p�o�b�t�@�m��
	PINT	ptrTable =
		(PINT) ::eriAllocateMemory( nBlockArea * 4 * sizeof(INT) ) ;
	m_pArrangeTable[0] = ptrTable ;
	m_pArrangeTable[1] = ptrTable + nBlockArea ;
	m_pArrangeTable[2] = ptrTable + nBlockArea * 2 ;
	m_pArrangeTable[3] = ptrTable + nBlockArea * 3 ;
	//
	// ������������
	ptrNext = m_pArrangeTable[0] ;
	for ( i = 0; i < 2; i ++ )
	{
		for ( j = 0; j < nBlockHalf; j ++ )
		{
			l = (j * 2 + i) * nBlockSize ;
			for ( k = 0; k < nBlockSize; k ++ )
				*(ptrNext ++) = l ++ ;
		}
	}
	//
	// ������������
	ptrNext = m_pArrangeTable[1] ;
	for ( i = 0; i < 2; i ++ )
	{
		for ( j = 0; j < nBlockHalf; j ++ )
		{
			l = j * 2 + i ;
			for ( k = 0; k < nBlockSize; k ++ )
			{
				*(ptrNext ++) = l ;
				l += nBlockSize ;
			}
		}
	}
	//
	// �΂ߏ���������
	ptrNext = m_pArrangeTable[2] ;
	for ( i = 0; i < 2; i ++ )
	{
		j = i ;
		for ( ; ; )
		{
			k = j ;
			if ( k >= nBlockSize )
			{
				k = nBlockSize - 1 ;
				if ( j - k >= nBlockSize )
					break ;
			}
			for ( ; ; )
			{
				l = j - k ;
				if ( l >= nBlockSize )
					break ;
				*(ptrNext ++) = (l << nBlockDegree) + k ;
				if ( -- k < 0 )
					break ;
			}
			j += 2 ;
		}
	}
	//
	// �΂ߋt��������
	ptrNext = m_pArrangeTable[3] ;
	for ( i = 0; i < 2; i ++ )
	{
		j = i ;
		for ( ; ; )
		{
			k = j ;
			if ( k >= nBlockSize )
			{
				k = nBlockSize - 1 ;
				if ( j - k >= nBlockSize )
					break ;
			}
			for ( ; ; )
			{
				l = j - k ;
				if ( l >= nBlockSize )
					break ;
				*(ptrNext ++) = ((nBlockSize - k - 1) << nBlockDegree) + l ;
				if ( -- k < 0 )
					break ;
			}
			j += 2 ;
		}
	}
}

//
// ERINA �p�Ĕz�u�e�[�u���̏�����
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::InitializeArrangeTableII( void )
{
	unsigned int	i, j, k, l, m ;
	//
	// �T���v�����O�e�[�u���p�o�b�t�@�m��
	PINT	ptrTable =
		(PINT) ::eriAllocateMemory( m_nBlockSamples * 4 * sizeof(INT) ) ;
	PINT	ptrNext ;
	m_pArrangeTable[0] = ptrTable ;
	m_pArrangeTable[1] = ptrTable + m_nBlockSamples ;
	m_pArrangeTable[2] = ptrTable + m_nBlockSamples * 2 ;
	m_pArrangeTable[3] = ptrTable + m_nBlockSamples * 3 ;
	//
	// ������������
	ptrNext = m_pArrangeTable[0] ;
	for ( i = 0; i < m_nBlockSamples; i ++ )
	{
		ptrNext[i] = i ;
	}
	//
	// ������������
	ptrNext = m_pArrangeTable[1] ;
	l = 0 ;
	for ( i = 0; i < m_nChannelCount; i ++ )
	{
		for ( j = 0; j < m_nBlockSize; j ++ )
		{
			m = l + j ;
			for ( k = 0; k < m_nBlockSize; k ++ )
			{
				*(ptrNext ++) = m ;
				m += m_nBlockSize ;
			}
		}
		l += m_nBlockArea ;
	}
	//
	// ���������C���^�[���[�u
	ptrNext = m_pArrangeTable[2] ;
	for ( i = 0; i < m_nBlockArea; i ++ )
	{
		k = i ;
		for ( j = 0; j < m_nChannelCount; j ++ )
		{
			*(ptrNext ++) = k ;
			k += m_nBlockArea ;
		}
	}
	//
	// ���������C���^�[���[�u
	ptrNext = m_pArrangeTable[3] ;
	for ( i = 0; i < m_nBlockSize; i ++ )
	{
		l = i ;
		for ( j = 0; j < m_nBlockSize; j ++ )
		{
			m = l ;
			l += m_nBlockSize ;
			for ( k = 0; k < m_nChannelCount; k ++ )
			{
				*(ptrNext ++) = m ;
				m += m_nBlockArea ;
			}
		}
	}
}

//
// �t���J���[�摜�̓W�J
//////////////////////////////////////////////////////////////////////////////
int ERIDecoder::DecodeTrueColorImage
( const RASTER_IMAGE_INFO & imginf, RLHDecodeContext & context )
{
	//
	// �摜�X�g�A�֐��̃A�h���X���擾
	m_nDstBytesPerPixel = (UINT) imginf.dwBitsPerPixel >> 3 ;
	PFUNC_RESTORE	pfnRestore =
		GetRestoreFunc( imginf.fdwFormatType, imginf.dwBitsPerPixel ) ;
	if ( pfnRestore == 0 )
		return	1 ;			// �G���[�i�Y������X�g�A�֐�����`����Ă��Ȃ��j
	//
	// ���C���o�b�t�@���N���A
	INT		i, j, k ;
	LONG	nWidthSamples =
		m_nChannelCount * (m_nWidthBlocks << m_EriInfHdr.dwBlockingDegree) ;
	for ( i = 0; i < nWidthSamples; i ++ )
	{
		m_ptrLineBuf[i] = 0 ;
	}
	//
	// �W�J�J�n
	//
	// ERI�w�b�_���擾
	UINT	fOpTable = context.GetNBits( 8 ) ;
	UINT	fEncodeType = context.GetNBits( 8 ) ;
	UINT	fReserved = context.GetNBits( 8 ) ;
	int		nBitCount = 0 ;
	if ( m_EriInfHdr.dwArchitecture == 32 )
	{
		if ( (fOpTable != 0) || (fReserved != 0) )
		{
			return	1 ;					// ���Ή��̃t�H�[�}�b�g
		}
		nBitCount = fEncodeType ;
		fEncodeType = 1 ;
	}
	else if ( m_EriInfHdr.dwArchitecture == 0xFFFFFFFF )
	{
		if ( (fOpTable != 0)
			|| (fEncodeType & 0xFE) || (fReserved != 0) )
		{
			return	1 ;					// ���Ή��̃t�H�[�}�b�g
		}
	}
	else
	{
		return	1 ;						// ���Ή��̃t�H�[�}�b�g
	}
	//
	// �I�y���[�V�����e�[�u�����擾
	INT	nOpCodeLen = 4 ;
	if ( m_fEnhancedMode )
	{
		nOpCodeLen = 6 ;
	}
	PBYTE	pNextOperation = m_ptrOperations ;
	if ( (fEncodeType & 0x01) && (m_nChannelCount >= 3) )
	{
		LONG	nAllBlockCount = (LONG) (m_nWidthBlocks * m_nHeightBlocks) ;
		for ( i = 0; i < nAllBlockCount; i ++ )
		{
			m_ptrOperations[i] = (BYTE) context.GetNBits( nOpCodeLen ) ;
		}
	}
	//
	// �R���e�L�X�g��������
	if ( context.GetABit( ) != 0 )
	{
		return	1 ;					// �s���ȃt�H�[�}�b�g
	}
	if ( m_EriInfHdr.dwArchitecture == 32 )
	{
		context.PrepareToDecodeArithmeticCode( nBitCount ) ;
	}
	else
	{
		if ( fEncodeType & 0x01 )
		{
			context.Initialize( ) ;
		}
	}
	//
	LONG	nPosX, nPosY ;
	LONG	nAllBlockLines = (LONG) (m_nBlockSize * m_nChannelCount) ;
	LONG	nRestHeight = (LONG) imginf.nImageHeight ;
	//
	for ( nPosY = 0; nPosY < (LONG) m_nHeightBlocks; nPosY ++ )
	{
		//
		// �J�����o�b�t�@���N���A
		LONG	nColumnBufSamples = (LONG) (m_nBlockSize * m_nChannelCount) ;
		for ( i = 0; i < nColumnBufSamples; i ++ )
		{
			m_ptrColumnBuf[i] = 0 ;
		}
		//
		// �s�̎��O����
		PBYTE	ptrDstLine = imginf.ptrImageArray
			+ ((nPosY * imginf.BytesPerLine) << m_EriInfHdr.dwBlockingDegree) ;
		int	nBlockHeight = (int) m_nBlockSize ;
		if ( nBlockHeight > nRestHeight )
			nBlockHeight = nRestHeight ;
		//
		LONG	nRestWidth = (LONG) imginf.nImageWidth ;
		PINT	ptrNextLineBuf = m_ptrLineBuf ;
		//
		for ( nPosX = 0; nPosX < (LONG) m_nWidthBlocks; nPosX ++ )
		{
			//
			// ���������O�X�E�K���}���f�R�[�h
			UINT	nOperationCode ;
			UINT	nColorOperation ;
			if ( !(fEncodeType & 0x01) )
			{
				if ( m_nChannelCount >= 3 )
					nOperationCode = context.GetNBits( nOpCodeLen ) ;
				context.Initialize( ) ;
			}
			else
			{
				nOperationCode = *(pNextOperation ++) ;
			}
			if ( (m_fEnhancedMode == 0) || (m_nChannelCount < 3) )
			{
				//
				// �݊����[�h
				if ( context.DecodeSymbols
					( m_ptrBuffer, m_nBlockSamples ) < m_nBlockSamples )
				{
					return	1 ;			// �G���[�i�f�R�[�h�Ɏ��s�j
				}
				nColorOperation = nOperationCode ;
			}
			else
			{
				//
				// �g�����[�h
				if ( context.DecodeSymbols
					( m_ptrSubBuf, m_nBlockSamples ) < m_nBlockSamples )
				{
					return	1 ;			// �G���[�i�f�R�[�h�Ɏ��s�j
				}
				//
				// �Ĕz����s
				UINT	nArrangeCode ;
				nColorOperation =
					m_opcCodeTable[nOperationCode].ColorOperation ;
				nArrangeCode =
					m_opcCodeTable[nOperationCode].ArrangeCode ;
				//
				if ( nArrangeCode == 0 )
				{
					for ( i = 0; i < (INT) m_nBlockSamples; i ++ )
					{
						m_ptrBuffer[i] = m_ptrSubBuf[i] ;
					}
				}
				else
				{
					PINT	pArrange = m_pArrangeTable[nArrangeCode - 1] ;
					for ( i = 0; i < (INT) m_nChannelCount; i ++ )
					{
						INT	k = i * m_nBlockArea ;
						for ( j = 0; j < (INT) m_nBlockArea; j ++ )
						{
							m_ptrBuffer[k + pArrange[j]] = m_ptrSubBuf[k + j] ;
						}
					}
				}
			}
			//
			// �J���[�I�y���[�V���������s
			if ( m_nChannelCount >= 3 )
			{
				(this->*m_pfnColorOperation[nColorOperation])( ) ;
			}
			//
			// �������������s�i���������j
			PINT	ptrNextBuf = m_ptrBuffer ;
			PINT	ptrNextColBuf = m_ptrColumnBuf ;
			for ( i = 0; i < nAllBlockLines; i ++ )
			{
				INT	nLastVal = *ptrNextColBuf ;
				for ( j = 0; j < (INT) m_nBlockSize; j ++ )
				{
					nLastVal += *ptrNextBuf ;
					*(ptrNextBuf ++) = nLastVal ;
				}
				*(ptrNextColBuf ++) = nLastVal ;
			}
			//
			// �������������s�i���������j
			ptrNextBuf = m_ptrBuffer ;
			for ( k = 0; k < (INT) m_nChannelCount; k ++ )
			{
				PINT	ptrLastLine = ptrNextLineBuf ;
				for ( i = 0; i < (INT) m_nBlockSize; i ++ )
				{
					PINT	ptrCurrentLine = ptrNextBuf ;
					for ( j = 0; j < (INT) m_nBlockSize; j ++ )
					{
						*(ptrNextBuf ++) += *(ptrLastLine ++) ;
					}
					ptrLastLine = ptrCurrentLine ;
				}
				for ( j = 0; j < (INT) m_nBlockSize; j ++ )
				{
					*(ptrNextLineBuf ++) = *(ptrLastLine ++) ;
				}
			}
			//
			// �������ʂ��o�̓o�b�t�@�ɃX�g�A
			int	nBlockWidth = (int) m_nBlockSize ;
			if ( nBlockWidth > nRestWidth )
				nBlockWidth = nRestWidth ;
			(this->*pfnRestore)
				( ptrDstLine, imginf.BytesPerLine, nBlockWidth, nBlockHeight ) ;
			//
			// �W�J�̏󋵂�ʒm
			int	flgContinue = OnDecodedBlock( nPosY, nPosX ) ;
			if ( flgContinue != 0 )
				return	flgContinue ;	// ���f
			//
			ptrDstLine +=
				(m_nDstBytesPerPixel << m_EriInfHdr.dwBlockingDegree) ;
			nRestWidth -= (LONG) m_nBlockSize ;
		}
		//
		nRestHeight -= (LONG) m_nBlockSize ;
	}
	//
	return	0 ;				// ����I��
}

//
// �t���J���[�摜�g���t�H�[�}�b�g�̓W�J
//////////////////////////////////////////////////////////////////////////////
int ERIDecoder::DecodeTrueColorImageII
( const RASTER_IMAGE_INFO & imginf, RLHDecodeContext & context )
{
	//
	// ���Ή��t�H�[�}�b�g��W�J���悤�Ƃ��Ă��Ȃ�������
	if ( (m_nChannelCount < 3) ||
		(m_fEnhancedMode != 2) ||
		(m_EriInfHdr.dwArchitecture != ERI_RUNLENGTH_HUFFMAN) )
	{
		return	1 ;			// �G���[�i���Ή��̃t�H�[�}�b�g�j
	}
	//
	// �摜�X�g�A�֐��̃A�h���X���擾
	m_nDstBytesPerPixel = (UINT) imginf.dwBitsPerPixel >> 3 ;
	PFUNC_RESTORE	pfnRestore =
		GetRestoreFunc( imginf.fdwFormatType, imginf.dwBitsPerPixel ) ;
	if ( pfnRestore == 0 )
		return	1 ;			// �G���[�i�Y������X�g�A�֐�����`����Ă��Ȃ��j
	//
	// ���C���o�b�t�@���N���A
	INT		i ;
	LONG	nWidthSamples =
		m_nChannelCount * (m_nWidthBlocks << m_EriInfHdr.dwBlockingDegree) ;
	for ( i = 0; i < nWidthSamples; i ++ )
	{
		m_ptrLineBuf[i] = 0 ;
	}
	//
	// �W�J�J�n
	//
	// ERI�w�b�_���擾
	UINT	fOpTable = context.GetNBits( 8 ) ;
	UINT	fEncodeType = context.GetNBits( 8 ) ;
	UINT	nBitCount = context.GetNBits( 8 ) ;
	if ( (fOpTable != 0) || (fEncodeType & 0xFE) || (nBitCount != 8) )
	{
		return	1 ;					// ���Ή��̃t�H�[�}�b�g
	}
	//
	// �I�y���[�V�����e�[�u�����擾
	m_pHuffmanTree->Initialize( ) ;
	PBYTE	pNextOperation = m_ptrOperations ;
	if ( fEncodeType & 0x01 )
	{
		LONG	nAllBlockCount = (LONG) (m_nWidthBlocks * m_nHeightBlocks) ;
		for ( i = 0; i < nAllBlockCount; i ++ )
		{
			m_ptrOperations[i] =
				(BYTE) context.GetAHuffmanCode( m_pHuffmanTree ) ;
		}
	}
	//
	// �R���e�L�X�g��������
	if ( context.GetABit( ) != 0 )
	{
		return	1 ;					// �s���ȃt�H�[�}�b�g
	}
	context.PrepareToDecodeERINACode( ) ;
	//
	LONG	nPosX, nPosY ;
	LONG	nAllBlockLines = (LONG) (m_nBlockSize * m_nChannelCount) ;
	LONG	nRestHeight = (LONG) imginf.nImageHeight ;
	//
	for ( nPosY = 0; nPosY < (LONG) m_nHeightBlocks; nPosY ++ )
	{
		//
		// �J�����o�b�t�@���N���A
		LONG	nColumnBufSamples = (LONG) (m_nBlockSize * m_nChannelCount) ;
		for ( i = 0; i < nColumnBufSamples; i ++ )
		{
			m_ptrColumnBuf[i] = 0 ;
		}
		//
		// �s�̎��O����
		PBYTE	ptrDstLine = imginf.ptrImageArray
			+ ((nPosY * imginf.BytesPerLine) << m_EriInfHdr.dwBlockingDegree) ;
		int	nBlockHeight = (int) m_nBlockSize ;
		if ( nBlockHeight > nRestHeight )
			nBlockHeight = nRestHeight ;
		//
		LONG	nRestWidth = (LONG) imginf.nImageWidth ;
		PINT	ptrNextLineBuf = m_ptrLineBuf ;
		//
		for ( nPosX = 0; nPosX < (LONG) m_nWidthBlocks; nPosX ++ )
		{
			//
			// ERINA �����𕜍�
			DWORD	dwOperationCode ;
			if ( fEncodeType & 0x01 )
			{
				dwOperationCode = *(pNextOperation ++) ;
			}
			else
			{
				dwOperationCode =
					context.GetAHuffmanCode( m_pHuffmanTree ) ;
			}
			if ( context.DecodeERINACodes
				( m_ptrSubBuf, m_nBlockSamples ) < m_nBlockSamples )
			{
				return	1 ;			// �G���[�i�f�R�[�h�Ɏ��s�j
			}
			//
			// �I�y���[�V���������s
			PerformOperation
				( dwOperationCode, nAllBlockLines, &ptrNextLineBuf ) ;
			//
			// �������ʂ��o�̓o�b�t�@�ɃX�g�A
			int		nBlockWidth = (int) m_nBlockSize ;
			if ( nBlockWidth > nRestWidth )
				nBlockWidth = nRestWidth ;
			(this->*pfnRestore)
				( ptrDstLine, imginf.BytesPerLine, nBlockWidth, nBlockHeight ) ;
			//
			// �W�J�̏󋵂�ʒm
			int		flgContinue = OnDecodedBlock( nPosY, nPosX ) ;
			if ( flgContinue != 0 )
				return	flgContinue ;	// ���f
			//
			ptrDstLine +=
				(m_nDstBytesPerPixel << m_EriInfHdr.dwBlockingDegree) ;
			nRestWidth -= (LONG) m_nBlockSize ;
		}
		//
		nRestHeight -= (LONG) m_nBlockSize ;
	}
	//
	return	0 ;				// ����I��
}

//
// �p���b�g�摜�̓W�J
//////////////////////////////////////////////////////////////////////////////
int ERIDecoder::DecodePaletteImage
( const RASTER_IMAGE_INFO & imginf, RLHDecodeContext & context )
{
	//
	// �t�H�[�}�b�g�̊m�F
	if ( imginf.dwBitsPerPixel != 8 )
		return	1 ;			// �G���[�i���Ή��̃t�H�[�}�b�g�j
	//
	// ERI�w�b�_�̊m�F
	UINT	fReserved = context.GetNBits( 24 ) ;
	if ( fReserved != 0 )
		return	1 ;			// �G���[�i���Ή��̃t�H�[�}�b�g�j
	//
	// �R���e�L�X�g�̏�����
	if ( m_EriInfHdr.dwArchitecture == 32 )
	{
		context.PrepareToDecodeArithmeticCode( 8 ) ;
		if ( m_ptrBuffer != NULL )
			::eriFreeMemory( m_ptrBuffer ) ;
		m_ptrBuffer =
			(PINT) ::eriAllocateMemory( imginf.nImageWidth * sizeof(INT) ) ;
	}
	else if ( m_EriInfHdr.dwArchitecture == 0xFFFFFFFF )
	{
		context.PrepareToDecodeRLMTFGCode( ) ;
	}
	else if ( m_EriInfHdr.dwArchitecture == 0xFFFFFFFC )
	{
		context.PrepareToDecodeERINACode( ) ;
	}
	else
	{
		return	1 ;			// �G���[�i���Ή��̃t�H�[�}�b�g�j
	}
	//
	// �����J�n
	LONG	nLine, nHeight ;
	nHeight = imginf.nImageHeight ;
	PBYTE	ptrDstLine = imginf.ptrImageArray ;
	ULONG	nImageWidth = (ULONG) imginf.nImageWidth ;
	SDWORD	nBytesPerLine = imginf.BytesPerLine ;
	//
	for ( nLine = 0; nLine < nHeight; nLine ++ )
	{
		if ( m_EriInfHdr.dwArchitecture == 32 )
		{
			//
			// �Z�p�������g����1�s�W�J
			if ( context.DecodeSymbols
					( m_ptrBuffer, nImageWidth ) < nImageWidth )
			{
				return	1 ;				// �G���[�i�f�R�[�h�Ɏ��s�j
			}
			//
			for ( ULONG i = 0; i < nImageWidth; i ++ )
			{
				ptrDstLine[i] = (BYTE) m_ptrBuffer[i] ;
			}
		}
		else if ( m_EriInfHdr.dwArchitecture == 0xFFFFFFFF )
		{
			//
			// RL-MTF-G �������g����1�s�W�J
			if ( context.DecodeRLMTFGCodes
					( ptrDstLine, nImageWidth ) < nImageWidth )
			{
				return	1 ;				// �G���[�i�f�R�[�h�Ɏ��s�j
			}
		}
		else
		{
			//
			// ERINA �������g����1�s�W�J
			if ( context.DecodeERINACodes256
					( ptrDstLine, nImageWidth ) < nImageWidth )
			{
				return	1 ;				// �G���[�i�f�R�[�h�Ɏ��s�j
			}
		}
		//
		// �W�J�̏󋵂�ʒm
		int	flgContinue = OnDecodedLine( nLine ) ;
		if ( flgContinue != 0 )
			return	flgContinue ;	// ���f
		//
		ptrDstLine += nBytesPerLine ;
	}
	//
	return	0 ;				// ����I��
}

//
// �W�J�摜���X�g�A����֐��ւ̃|�C���^���擾����
//////////////////////////////////////////////////////////////////////////////
ERIDecoder::PFUNC_RESTORE
	ERIDecoder::GetRestoreFunc( DWORD fdwFormatType, DWORD dwBitsPerPixel )
{
	m_nDstBytesPerPixel = (UINT) dwBitsPerPixel >> 3 ;

	switch ( m_EriInfHdr.fdwFormatType )
	{
	case	ERI_RGB_IMAGE:
		if ( dwBitsPerPixel == 16 )
		{
			return	&ERIDecoder::RestoreRGB16 ;
		}
		else if ( (dwBitsPerPixel == 24)
					|| (dwBitsPerPixel == 32) )
		{
			return	&ERIDecoder::RestoreRGB24 ;
		}
		break ;

	case	ERI_RGBA_IMAGE:
		if ( dwBitsPerPixel == 32 )
			return	&ERIDecoder::RestoreRGBA32 ;
		break ;

	case	ERI_GRAY_IMAGE:
		if ( dwBitsPerPixel == 8 )
			return	&ERIDecoder::RestoreGray8 ;
		break ;
	}
	return	0 ;
}

//
// �O���C�摜�̓W�J
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::RestoreGray8
	( PBYTE ptrDst, LONG nLineBytes, int nWidth, int nHeight )
{
	PINT	ptrNextBuf = m_ptrBuffer ;
	//
	while ( nHeight -- )
	{
		for ( int x = 0; x < nWidth; x ++ )
		{
			ptrDst[x] = (BYTE) ptrNextBuf[x] ;
		}
		ptrNextBuf += m_nBlockSize ;
		ptrDst += nLineBytes ;
	}
}

//
// RGB�摜(15�r�b�g)�̓W�J
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::RestoreRGB16
	( PBYTE ptrDst, LONG nLineBytes, int nWidth, int nHeight )
{
	PBYTE	ptrDstLine = ptrDst ;
	PINT	ptrBufLine = m_ptrBuffer ;
	LONG	nBlockSamples = (LONG) m_nBlockArea ;
	//
	while ( nHeight -- )
	{
		PINT	ptrNextBuf = ptrBufLine ;
		PWORD	pwDst = (PWORD) ptrDstLine ;
		//
		int	i = nWidth ;
		while ( i -- )
		{
			*pwDst = (WORD)
				(((int) *ptrNextBuf & 0x1F)) |
				(((int) ptrNextBuf[nBlockSamples] & 0x1F) << 5) |
				(((int) ptrNextBuf[nBlockSamples * 2] & 0x1F) << 10) ;
			ptrNextBuf ++ ;
			pwDst ++ ;
		}
		ptrBufLine += m_nBlockSize ;
		ptrDstLine += nLineBytes ;
	}
}

//
// RGB�摜�̓W�J
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::RestoreRGB24
	( PBYTE ptrDst, LONG nLineBytes, int nWidth, int nHeight )
{
	PBYTE	ptrDstLine = ptrDst ;
	PINT	ptrBufLine = m_ptrBuffer ;
	int		nBytesPerPixel = (int) m_nDstBytesPerPixel ;
	LONG	nBlockSamples = (LONG) m_nBlockArea ;
	//
	while ( nHeight -- )
	{
		PINT	ptrNextBuf = ptrBufLine ;
		ptrDst = ptrDstLine ;
		//
		int	i = nWidth ;
		while ( i -- )
		{
			ptrDst[0] = (BYTE) *ptrNextBuf ;
			ptrDst[1] = (BYTE) ptrNextBuf[nBlockSamples] ;
			ptrDst[2] = (BYTE) ptrNextBuf[nBlockSamples * 2] ;
			ptrNextBuf ++ ;
			ptrDst += nBytesPerPixel ;
		}
		ptrBufLine += m_nBlockSize ;
		ptrDstLine += nLineBytes ;
	}
}

//
// RGBA�摜�̓W�J
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::RestoreRGBA32
	( PBYTE ptrDst, LONG nLineBytes, int nWidth, int nHeight )
{
	PBYTE	ptrDstLine = ptrDst ;
	PINT	ptrBufLine = m_ptrBuffer ;
	LONG	nBlockSamples = (LONG) m_nBlockArea ;
	LONG	nBlockSamplesX3 = nBlockSamples * 3 ;
	//
	while ( nHeight -- )
	{
		PINT	ptrNextBuf = ptrBufLine ;
		ptrDst = ptrDstLine ;
		//
		int	i = nWidth ;
		while ( i -- )
		{
			ptrDst[0] = (BYTE) *ptrNextBuf ;
			ptrDst[1] = (BYTE) ptrNextBuf[nBlockSamples] ;
			ptrDst[2] = (BYTE) ptrNextBuf[nBlockSamples * 2] ;
			ptrDst[3] = (BYTE) ptrNextBuf[nBlockSamplesX3] ;
			ptrNextBuf ++ ;
			ptrDst += 4 ;
		}
		ptrBufLine += m_nBlockSize ;
		ptrDstLine += nLineBytes ;
	}
}

//
// �T���v�����O�e�[�u���̏�����
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::InitializeZigZagTable( void )
{
	PINT	ptrArrange = (PINT)
		::eriAllocateMemory( m_nBlockArea * sizeof(INT) ) ;
	m_pArrangeTable[0] = ptrArrange ;
	//
	unsigned int	i = 0 ;
	INT		x = 0, y = 0 ;
	for ( ; ; )
	{
		for ( ; ; )
		{
			ptrArrange[i ++] = x + y * m_nBlockSize ;
			if ( i >= m_nBlockArea )
				return ;
			++ x ;
			-- y ;
			if ( x >= (INT) m_nBlockSize )
			{
				-- x ;
				y += 2 ;
				break ;
			}
			else if ( y < 0 )
			{
				y = 0 ;
				break ;
			}
		}
		for ( ; ; )
		{
			ptrArrange[i ++] = x + y * m_nBlockSize ;
			if ( i >= m_nBlockArea )
				return ;
			++ y ;
			-- x ;
			if ( y >= (INT) m_nBlockSize )
			{
				-- y ;
				x += 2 ;
				break ;
			}
			else if ( x < 0 )
			{
				x = 0 ;
				break ;
			}
		}
	}
}

//
// �t���J���[�摜�̈��k
//////////////////////////////////////////////////////////////////////////////
int ERIDecoder::DecodeTrueColorImageDCT
	( const RASTER_IMAGE_INFO & imginf, RLHDecodeContext & context )
{
	//
	// ���Ή��t�H�[�}�b�g��W�J���悤�Ƃ��Ă��Ȃ�������
	if ( (m_nChannelCount < 3) ||
		((m_EriInfHdr.dwArchitecture != ERI_RUNLENGTH_HUFFMAN)
			&& (m_EriInfHdr.dwArchitecture != ERI_RUNLENGTH_GAMMA)) )
	{
		return	1 ;			// �G���[�i���Ή��̃t�H�[�}�b�g�j
	}
	//
	// �摜�X�g�A�֐��̃A�h���X���擾
	m_nDstBytesPerPixel = (UINT) imginf.dwBitsPerPixel >> 3 ;
	PFUNC_RESTOREII	pfnRestore =
		GetRestoreFuncII( imginf.fdwFormatType, imginf.dwBitsPerPixel ) ;
	if ( pfnRestore == NULL )
		return	1 ;			// �G���[�i�Y������X�g�A�֐�����`����Ă��Ȃ��j
	//
	// �R���e�L�X�g��������
	if ( m_EriInfHdr.dwArchitecture == ERI_RUNLENGTH_HUFFMAN )
	{
		context.PrepareToDecodeERINACode( ) ;
	}
	//
	// �W�J�J�n
	//
	// ERI�w�b�_���擾
	UINT	nERIVersion = context.GetNBits( 8 ) ;
	UINT	fOpTable = context.GetNBits( 8 ) ;
	UINT	fEncodeType = context.GetNBits( 8 ) ;
	UINT	nBitCount = context.GetNBits( 8 ) ;
	if ( (nERIVersion != 9) || (fOpTable != 0)
			|| (fEncodeType & 0xFE) || (nBitCount != 8) )
	{
		return	1 ;					// ���Ή��̃t�H�[�}�b�g
	}
	if ( context.GetABit( ) != 0 )
	{
		return	1 ;					// �s���ȃt�H�[�}�b�g
	}
	//
	// ���������W�����擾
	int		nFixedScaleDC = context.GetNBits( 8 ) ;
	m_rYScaleDC = (REAL32)(256.0 / (nFixedScaleDC + 1)) ;
	nFixedScaleDC = context.GetNBits( 8 ) ;
	m_rCScaleDC = (REAL32)(256.0 / (nFixedScaleDC + 1)) ;
	m_rMatrixScale = (REAL32) (2.0 / (LONG) m_nBlockSize) ;
	m_rYScaleDC *= m_rMatrixScale ;
	m_rCScaleDC *= m_rMatrixScale ;
	//
	// ���������E�y�ь𗬐����W���e�[�u����W�J
	LONG	i, j ;
	LONG	nAllBlockCount = (LONG) (m_nWidthBlocks * m_nHeightBlocks) ;
	//
	if ( fEncodeType & 0x01 )
	{
		//
		// �����������擾
		ULONG	nDCSampleCount = nAllBlockCount * m_nBlocksetCount ;
		context.Initialize( ) ;
		if ( context.DecodeGammaCodes
				( m_ptrTableDC, nDCSampleCount ) < nDCSampleCount )
		{
			return	1 ;				// �f�R�[�h�Ɏ��s
		}
		//
		// �𗬐����W�����擾
		m_pHuffmanTree->Initialize( ) ;
		for ( i = 0; i < nAllBlockCount * 4; i ++ )
		{
			m_ptrOperations[i] =
				(BYTE) context.GetAHuffmanCode( m_pHuffmanTree ) ;
		}
		//
		// �K���}�����̃[���t���O�擾
		if ( m_EriInfHdr.dwArchitecture != ERI_RUNLENGTH_HUFFMAN )
		{
			context.Initialize( ) ;
		}
	}
	//
	PINT	ptrNextDCSamples = m_ptrTableDC ;
	PBYTE	ptrNextCoefficient = m_ptrOperations ;
	//
	LONG	nPosX, nPosY ;
	LONG	nRestHeight = (LONG) imginf.nImageHeight ;
	//
	for ( nPosY = 0; nPosY < (LONG) m_nHeightBlocks; nPosY ++ )
	{
		//
		// �s�̎��O����
		PBYTE	ptrDstLine =
			imginf.ptrImageArray
				+ ((nPosY * imginf.BytesPerLine)
					<< (m_EriInfHdr.dwBlockingDegree + 1)) ;
		//
		int		nBlockHeightA = m_nBlockSize ;
		int		nBlockHeightB = m_nBlockSize ;
		if ( nRestHeight < (LONG) m_nBlockSize )
		{
			nBlockHeightA = nRestHeight ;
			nBlockHeightB = 0 ;
		}
		else if ( nRestHeight < (LONG) m_nBlockSize * 2 )
		{
			nBlockHeightB = nRestHeight - m_nBlockSize ;
		}
		//
		LONG	nRestWidth = (LONG) imginf.nImageWidth ;
		//
		// �����o�b�t�@���N���A
		for ( i = 0; i < (LONG) m_nBlocksetCount; i ++ )
		{
			m_nDCDiffBuffer[i] = 0 ;
		}
		//
		for ( nPosX = 0; nPosX < (LONG) m_nWidthBlocks; nPosX ++ )
		{
			//
			// ���������y�ь𗬐����W�����擾
			if ( !(fEncodeType & 0x01) )
			{
				context.Initialize( ) ;
				if ( context.DecodeGammaCodes
					( m_ptrBuffer, m_nBlocksetCount ) < m_nBlocksetCount )
				{
					return	1 ;			// �f�R�[�h�Ɏ��s
				}
				//
				ptrNextCoefficient[0] =
					(BYTE) context.GetAHuffmanCode( m_pHuffmanTree ) ;
				ptrNextCoefficient[1] =
					(BYTE) context.GetAHuffmanCode( m_pHuffmanTree ) ;
				ptrNextCoefficient[2] =
					(BYTE) context.GetAHuffmanCode( m_pHuffmanTree ) ;
				ptrNextCoefficient[3] =
					(BYTE) context.GetAHuffmanCode( m_pHuffmanTree ) ;
			}
			else
			{
				for ( i = 0; i < (LONG) m_nBlocksetCount; i ++ )
				{
					m_ptrBuffer[i] = ptrNextDCSamples[i] ;
				}
				ptrNextDCSamples += m_nBlocksetCount ;
			}
			//
			// �𗬐����𕜍�
			ULONG	nACSampleCount = (m_nBlockArea - 1) * m_nBlocksetCount ;
			if ( m_EriInfHdr.dwArchitecture == ERI_RUNLENGTH_HUFFMAN )
			{
				if ( context.DecodeERINACodes
					( m_ptrBuffer + m_nBlocksetCount,
											nACSampleCount ) < nACSampleCount )
				{
					return	1 ;				// �f�R�[�h�Ɏ��s
				}
			}
			else
			{
				if ( !(fEncodeType & 0x01) )
				{
					context.Initialize( ) ;
				}
				if ( context.DecodeGammaCodes
					( m_ptrBuffer + m_nBlocksetCount,
											nACSampleCount ) < nACSampleCount )
				{
					return	1 ;				// �f�R�[�h�Ɏ��s
				}
			}
			//
			// ������������������
			for ( i = 0; i < (LONG) m_nBlocksetCount; i ++ )
			{
				m_ptrBuffer[i] = m_nDCDiffBuffer[i]
						= m_ptrBuffer[i] + m_nDCDiffBuffer[i] ;
			}
			//
			// �Ĕz�u���ċt�ʎq�����{��
			ArrangeAndIQuantumize( ptrNextCoefficient ) ;
			ptrNextCoefficient += 4 ;
			//
			// �t DCT ���{��
			PerformIDCT( ) ;
			//
			// �X�P�[�����O
			(this->*m_pfnBlockScaling)( ) ;
			//
			// YUV -> RGB �ϊ�
			ConvertYUVtoRGB( ) ;
			//
			// �摜�W�J�̏���
			int		nBlockWidthL = m_nBlockSize ;
			int		nBlockWidthR = m_nBlockSize ;
			if ( nRestWidth < (LONG) m_nBlockSize )
			{
				nBlockWidthL = nRestWidth ;
				nBlockWidthR = 0 ;
			}
			else if ( nRestWidth < (LONG) m_nBlockSize * 2 )
			{
				nBlockWidthR = nRestWidth - m_nBlockSize ;
			}
			//
			int		widthBlock[4] =
			{
				nBlockWidthL, nBlockWidthR,
				nBlockWidthL, nBlockWidthR
			} ;
			int		heightBlock[4] =
			{
				nBlockHeightA, nBlockHeightA,
				nBlockHeightB, nBlockHeightB
			} ;
			DWORD	dwOffsetAddr[4] =
			{
				0,
				m_nBlockSize * m_nDstBytesPerPixel,
				m_nBlockSize * imginf.BytesPerLine,
				m_nBlockSize * m_nDstBytesPerPixel
					+ m_nBlockSize * imginf.BytesPerLine
			} ;
			//
			// �u���b�N��W�J
			for ( i = 0; i < 4; i ++ )
			{
				REAL32 *	ptrBuf[4] ;
				for ( j = 0; j < 4; j ++ )
				{
					ptrBuf[j] = m_ptrBuffer2[j][i] ;
				}
				(this->*pfnRestore)
					( ptrDstLine + dwOffsetAddr[i],
						imginf.BytesPerLine,
						ptrBuf, widthBlock[i], heightBlock[i] ) ;
			}
			//
			// �W�J�̏󋵂�ʒm
			int	flgContinue = OnDecodedBlock( nPosY, nPosX ) ;
			if ( flgContinue != 0 )
				return	flgContinue ;		// ���f
			//
			ptrDstLine +=
				(m_nDstBytesPerPixel << (m_EriInfHdr.dwBlockingDegree + 1)) ;
			nRestWidth -= (LONG) (m_nBlockSize * 2) ;
		}
		//
		nRestHeight -= (LONG) (m_nBlockSize * 2) ;
	}
	//
	return	0 ;				// ����I��
}

//
// �W�J�摜���X�g�A����֐��ւ̃|�C���^���擾����
//////////////////////////////////////////////////////////////////////////////
ERIDecoder::PFUNC_RESTOREII ERIDecoder::GetRestoreFuncII
	( DWORD fdwFormatType, DWORD dwBitsPerPixel )
{
	if ( (dwBitsPerPixel != 24) && (dwBitsPerPixel != 32) )
	{
		return	NULL ;
	}
	//
	if ( fdwFormatType & ERI_WITH_ALPHA )
	{
		return	&ERIDecoder::RestoreRGBA32II ;
	}
	else
	{
		return	&ERIDecoder::RestoreRGB24II ;
	}
}

//
// �����𐮐��Ɋۂ߂�BYTE�^�ɖO�a
//////////////////////////////////////////////////////////////////////////////
BYTE ERIDecoder::RoundR32ToByte( REAL32 r )
{
	int		n = ::eriRoundR32ToInt( r ) ;
	if ( n < 0 )
	{
		return	0 ;
	}
	else if ( n >= 0x100 )
	{
		return	0xFF ;
	}
	return	(BYTE) n ;
}

//
// IDCT �ϊ����{��
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::PerformIDCT( void )
{
	for ( int i = 0; i < (int) m_nBlocksetCount; i ++ )
	{
		::eriSquareIDCT
			( m_ptrBuffer4[i], m_ptrBuffer3[i],
				m_EriInfHdr.dwBlockingDegree,
				m_ptrWorkDCT1, m_ptrWorkDCT2 ) ;
	}
}

//
// �t�ʎq�����{��
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::ArrangeAndIQuantumize( BYTE bytCoefficient[] )
{
	int		i, j ;
	//
	// ���������̋t�ʎq���W�����擾
	REAL32	scale[16] ;
	int		c_count = 12 ;
	if ( m_EriInfHdr.dwSamplingFlags == ERISF_YUV_4_2_2 )
	{
		c_count = 8 ;
	}
	else if ( m_EriInfHdr.dwSamplingFlags == ERISF_YUV_4_1_1 )
	{
		c_count = 6 ;
	}
	scale[0] = scale[1] = scale[2] = scale[3] = m_rYScaleDC ;
	for ( i = 4; i < c_count; i ++ )
	{
		scale[i] = m_rCScaleDC ;
	}
	for ( ; i < (int) m_nBlocksetCount; i ++ )
	{
		scale[i] = m_rYScaleDC ;
	}
	//
	// �����������t�ʎq��
	PINT	ptrQuantumized = m_ptrBuffer ;
	REAL32 *	ptrDst = m_ptrBuffer4[0] ;
	int		count = (int) m_nBlocksetCount ;
	for ( i = 0; i < count; i ++ )
	{
		*(ptrDst ++) = (REAL32)(scale[i] * *(ptrQuantumized ++)) ;
	}
	//
	// �𗬒���g�����̋t�ʎq���W�����擾
	REAL32	rYScale, rCScale ;
	rYScale = m_rMatrixScale * 256.0F / (int)(bytCoefficient[0] + 1) ;
	rCScale = m_rMatrixScale * 256.0F / (int)(bytCoefficient[1] + 1) ;
	//
	scale[0] = scale[1] = scale[2] = scale[3] = rYScale ;
	for ( i = 4; i < c_count; i ++ )
	{
		scale[i] = rCScale ;
	}
	for ( ; i < (int) m_nBlocksetCount; i ++ )
	{
		scale[i] = rYScale ;
	}
	//
	// �𗬒���g�������t�ʎq��
	//
	count = ((m_nBlockSize - 1) * m_nBlockSize / 2 - 1) ;
	for ( i = 0; i < count; i ++ )
	{
		for ( j = 0; j < (int) m_nBlocksetCount; j ++ )
		{
			*(ptrDst ++) = (REAL32)(scale[j] * *(ptrQuantumized ++)) ;
		}
	}
	//
	// �𗬍����g�����̋t�ʎq���W�����擾
	rYScale = m_rMatrixScale * 256.0F / (int)(bytCoefficient[2] + 1) ;
	rCScale = m_rMatrixScale * 256.0F / (int)(bytCoefficient[3] + 1) ;
	//
	scale[0] = scale[1] = scale[2] = scale[3] = rYScale ;
	for ( i = 4; i < c_count; i ++ )
	{
		scale[i] = rCScale ;
	}
	for ( ; i < (int) m_nBlocksetCount; i ++ )
	{
		scale[i] = rYScale ;
	}
	//
	// �𗬍����g�������t�ʎq��
	count = (m_nBlockSize * (m_nBlockSize + 1) / 2) ;
	for ( i = 0; i < count; i ++ )
	{
		for ( j = 0; j < (int) m_nBlocksetCount; j ++ )
		{
			*(ptrDst ++) = (REAL32)(scale[j] * *(ptrQuantumized ++)) ;
		}
	}
	//
	// �t�W�O�U�O�����Ƌt�C���^�[���[�u
	PINT	pArrange = m_pArrangeTable[0] ;
	for ( i = 0; i < (int) m_nBlocksetCount; i ++ )
	{
		REAL32 *	ptrSrc = m_ptrBuffer4[0] + i ;
		ptrDst = m_ptrBuffer3[i] ;
		//
		for ( j = 0; j < (int) m_nBlockArea; j ++ )
		{
			ptrDst[pArrange[j]] = *ptrSrc ;
			ptrSrc += m_nBlocksetCount ;
		}
	}
}

//
// �W�J�i�s�󋵒ʒm�֐�
//////////////////////////////////////////////////////////////////////////////
int ERIDecoder::OnDecodedBlock( LONG line, LONG column )
{
	return	0 ;			// �������p��
}

int ERIDecoder::OnDecodedLine( LONG line )
{
	return	0 ;			// �������p��
}


/*****************************************************************************
                     �t�@�C���X�g���[���R���e�L�X�g
 *****************************************************************************/

//
// �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
EFileDecodeContext::EFileDecodeContext
		( EFileObject * pFileObj, ULONG nBufferingSize )
	: RLHDecodeContext( nBufferingSize ), m_pFileObj( pFileObj )
{
}

//
// ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
EFileDecodeContext::~EFileDecodeContext( void )
{
}

//
// ���̃f�[�^��ǂݍ���
//////////////////////////////////////////////////////////////////////////////
ULONG EFileDecodeContext::ReadNextData( PBYTE ptrBuffer, ULONG nBytes )
{
	return	m_pFileObj->Read( ptrBuffer, nBytes ) ;
}

//
// �t�@�C���I�u�W�F�N�g��ݒ肷��
//////////////////////////////////////////////////////////////////////////////
void EFileDecodeContext::AttachFileObject( EFileObject * pFileObj )
{
	m_pFileObj = pFileObj ;
	FlushBuffer( ) ;
}
