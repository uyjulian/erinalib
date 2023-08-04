
/*****************************************************************************
                         E R I N A - L i b r a r y
                                                      �ŏI�X�V 2001/11/04
 ----------------------------------------------------------------------------
          Copyright (C) 2000-2001 Leshade Entis. All rights reserved.
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

DWORD	ERI_EnabledProcessorType = 0 ;

//
// MMX ��L���ɂ���
//////////////////////////////////////////////////////////////////////////////
#if	defined(ERI_INTEL_X86)
void eriEnableMMX( int fForceEnable )
{
	// �_�~�[
}
#endif

//
// MMX �𖳌��ɂ���
///////////////////////////////////////////////////////////////////////////
#if	defined(ERI_INTEL_X86)
void eriDisableMMX( int fForceDisable )
{
	// �_�~�[
}
#endif

//
// ���������_���Z���j�b�g������������
///////////////////////////////////////////////////////////////////////////
#if	defined(ERI_INTEL_X86)
void eriInitializeFPU( void )
{
	// �_�~�[
}
#endif


/*****************************************************************************
                                ���Z�֐�
 *****************************************************************************/

static DWORD ChopMulDiv( DWORD x, DWORD y, DWORD z )
{
	DWORD	dwResult ;
	__asm
	{
		mov		eax, x
		mul		y
		div		z
		mov		dwResult, eax
	}
	return	dwResult ;
}

static DWORD RaiseMulDiv( DWORD x, DWORD y, DWORD z )
{
	DWORD	dwResult ;
	__asm
	{
		mov		eax, x
		mul		y
		div		z
		add		edx, 0FFFFFFFFH
		adc		eax, 0
		mov		dwResult, eax
	}
	return	dwResult ;
}


/*****************************************************************************
                         �A�j���[�V�����p�֐�
 *****************************************************************************/

//
// �摜�����r
//////////////////////////////////////////////////////////////////////////////
inline int CompareImageInformation
	( const RASTER_IMAGE_INFO & rii1, const RASTER_IMAGE_INFO & rii2 )
{
	if ( (rii1.nImageWidth != rii2.nImageWidth)
			|| (rii1.nImageHeight != rii2.nImageHeight) )
	{
		return	1 ;
	}
	if ( (rii1.nImageWidth == 0) || (rii1.nImageHeight == 0) )
	{
		return	1 ;
	}
	if ( rii1.dwBitsPerPixel != rii2.dwBitsPerPixel )
	{
		return	1 ;
	}
	if ( (rii1.dwBitsPerPixel != 8) &&
			(rii1.dwBitsPerPixel != 24) && (rii1.dwBitsPerPixel != 32) )
	{
		return	1 ;
	}
	return	0 ;
}

//
// �t���[���ԉ��Z
//////////////////////////////////////////////////////////////////////////////
int eriAdditionOfFrame
	( const RASTER_IMAGE_INFO & riiDst, const RASTER_IMAGE_INFO & riiSrc )
{
	if ( CompareImageInformation( riiDst, riiSrc ) )
	{
		return	1 ;
	}
	DWORD	dwBytesWidth = riiDst.nImageWidth * riiDst.dwBitsPerPixel / 8 ;
	PBYTE	ptrSrcLine = riiSrc.ptrImageArray ;
	PBYTE	ptrDstLine = riiDst.ptrImageArray ;
	//
	for ( SDWORD y = 0; y < riiDst.nImageHeight; y ++ )
	{
		for ( DWORD x = 0; x < dwBytesWidth; x ++ )
		{
			ptrDstLine[x] += ptrSrcLine[x] ;
		}
		ptrSrcLine += riiSrc.BytesPerLine ;
		ptrDstLine += riiDst.BytesPerLine ;
	}
	return	0 ;
}

//
// �t���[���ԍ���
//////////////////////////////////////////////////////////////////////////////
int eriSubtractionOfFrame
	( const RASTER_IMAGE_INFO & riiDst, const RASTER_IMAGE_INFO & riiSrc )
{
	if ( CompareImageInformation( riiDst, riiSrc ) )
	{
		return	1 ;
	}
	DWORD	dwBytesWidth = riiDst.nImageWidth * riiDst.dwBitsPerPixel / 8 ;
	PBYTE	ptrSrcLine = riiSrc.ptrImageArray ;
	PBYTE	ptrDstLine = riiDst.ptrImageArray ;
	//
	for ( SDWORD y = 0; y < riiDst.nImageHeight; y ++ )
	{
		for ( DWORD x = 0; x < dwBytesWidth; x ++ )
		{
			ptrDstLine[x] -= ptrSrcLine[x] ;
		}
		ptrSrcLine += riiSrc.BytesPerLine ;
		ptrDstLine += riiDst.BytesPerLine ;
	}
	return	0 ;
}

//
// �摜����
//////////////////////////////////////////////////////////////////////////////
int eriCopyImage
	( const RASTER_IMAGE_INFO & riiDst, const RASTER_IMAGE_INFO & riiSrc )
{
	if ( CompareImageInformation( riiDst, riiSrc ) )
	{
		return	1 ;
	}
	DWORD	dwBytesWidth = riiDst.nImageWidth * riiDst.dwBitsPerPixel / 8 ;
	PBYTE	ptrSrcLine = riiSrc.ptrImageArray ;
	PBYTE	ptrDstLine = riiDst.ptrImageArray ;
	//
	for ( SDWORD y = 0; y < riiDst.nImageHeight; y ++ )
	{
		for ( DWORD x = 0; x < dwBytesWidth; x ++ )
		{
			ptrDstLine[x] = ptrSrcLine[x] ;
		}
		ptrSrcLine += riiSrc.BytesPerLine ;
		ptrDstLine += riiDst.BytesPerLine ;
	}
	return	0 ;
}

//
// �g��`��
//////////////////////////////////////////////////////////////////////////////
int eriEnlargeImageDouble
	( const RASTER_IMAGE_INFO & riiDst, const RASTER_IMAGE_INFO & riiSrc )
{
	//
	// �摜�t�H�[�}�b�g�̃`�F�b�N
	//
	if ( (riiDst.nImageWidth != riiSrc.nImageWidth * 2)
			|| (riiDst.nImageHeight != riiSrc.nImageHeight * 2) )
	{
		return	1 ;
	}
	if ( (riiDst.nImageWidth == 0) || (riiDst.nImageHeight == 0) )
	{
		return	1 ;
	}
	if ( riiDst.dwBitsPerPixel != riiSrc.dwBitsPerPixel )
	{
		return	1 ;
	}
	if ( riiDst.dwBitsPerPixel != 32 )
	{
		return	1 ;
	}
	//
	// �摜�f�[�^�̊g�啡��
	//
	DWORD *	pdwSrcLine = (DWORD*) riiSrc.ptrImageArray ;
	DWORD *	pdwDstLine1 = (DWORD*) riiDst.ptrImageArray ;
	DWORD *	pdwDstLine2 = (DWORD*)(riiDst.ptrImageArray + riiDst.BytesPerLine) ;
	//
	for ( SDWORD y = 0; y < riiDst.nImageHeight; y ++ )
	{
		SDWORD	nWidth = riiDst.nImageWidth ;
		for ( SDWORD x = 0; x < nWidth; x ++ )
		{
			pdwDstLine2[x * 2] = pdwDstLine2[x * 2 + 1] =
				pdwDstLine1[x * 2]  = pdwDstLine1[x * 2 + 1] = pdwSrcLine[x] ;
		}
		*((PBYTE*)&pdwSrcLine) += riiSrc.BytesPerLine ;
		*((PBYTE*)&pdwDstLine1) += riiDst.BytesPerLine * 2 ;
		*((PBYTE*)&pdwDstLine2) += riiDst.BytesPerLine * 2 ;
	}
	//
	return	0 ;
}



/*****************************************************************************
                         �n�t�}���E�c���[�E�\����
 *****************************************************************************/

//
// �����p�x���C���N�������g
//////////////////////////////////////////////////////////////////////////////
void ERINA_HUFFMAN_TREE::IncreaseOccuedCount( int iEntry )
{
	m_hnTree[iEntry].m_weight ++ ;
	Normalize( iEntry ) ;
	//
	if ( m_hnTree[ERINA_HUFFMAN_ROOT].m_weight >= ERINA_HUFFMAN_MAX )
	{
		HalfAndRebuild( ) ;
	}
}

//
// �c���[�̐��K��
//////////////////////////////////////////////////////////////////////////////
void ERINA_HUFFMAN_TREE::Normalize( int iEntry )
{
	while ( iEntry < ERINA_HUFFMAN_ROOT )
	{
		//
		// ����ւ���G���g��������
		int		iSwap = iEntry + 1 ;
		WORD	weight = m_hnTree[iEntry].m_weight ;
		while ( iSwap < ERINA_HUFFMAN_ROOT )
		{
			if ( m_hnTree[iSwap].m_weight >= weight )
				break ;
			++ iSwap ;
		}
		if ( iEntry == -- iSwap )
		{
			iEntry = m_hnTree[iEntry].m_parent ;
			RecountOccuredCount( iEntry ) ;
			continue ;
		}
		//
		// ����ւ�
		int		iChild, nCode ;
		if ( !(m_hnTree[iEntry].m_child_code & ERINA_CODE_FLAG) )
		{
			iChild = m_hnTree[iEntry].m_child_code ;
			m_hnTree[iChild].m_parent = iSwap ;
			m_hnTree[iChild + 1].m_parent = iSwap ;
		}
		else
		{
			nCode = m_hnTree[iEntry].m_child_code & ~ERINA_CODE_FLAG ;
			if ( nCode != ERINA_HUFFMAN_ESCAPE )
				m_iSymLookup[nCode & 0xFF] = iSwap ;
			else
				m_iEscape = iSwap ;
		}
		if ( !(m_hnTree[iSwap].m_child_code & ERINA_CODE_FLAG) )
		{
			int	iChild = m_hnTree[iSwap].m_child_code ;
			m_hnTree[iChild].m_parent = iEntry ;
			m_hnTree[iChild+1].m_parent = iEntry ;
		}
		else
		{
			int	nCode = m_hnTree[iSwap].m_child_code & ~ERINA_CODE_FLAG ;
			if ( nCode != ERINA_HUFFMAN_ESCAPE )
				m_iSymLookup[nCode & 0xFF] = iEntry ;
			else
				m_iEscape = iEntry ;
		}
		ERINA_HUFFMAN_NODE	node ;
		WORD	iEntryParent = m_hnTree[iEntry].m_parent ;
		WORD	iSwapParent = m_hnTree[iSwap].m_parent ;
		node = m_hnTree[iSwap] ;
		m_hnTree[iSwap] = m_hnTree[iEntry] ;
		m_hnTree[iEntry] = node ;
		m_hnTree[iSwap].m_parent = iSwapParent ;
		m_hnTree[iEntry].m_parent = iEntryParent ;
		//
		// �e�̏d�݂��Čv�Z����
		RecountOccuredCount( iSwapParent ) ;
		iEntry = iSwapParent ;
	}
}


/*****************************************************************************
                   ���������O�X�E�K���}�E�R���e�L�X�g
 *****************************************************************************/

//
// �o�b�t�@����̎��A���̃f�[�^��ǂݍ���
//////////////////////////////////////////////////////////////////////////////
// �Ԃ�l�G
//		0�̎��A����I��
//		1�̎��A�ُ�I��
//////////////////////////////////////////////////////////////////////////////
int RLHDecodeContext::PrefetchBuffer( void )
{
	if ( m_nIntBufCount == 0 )
	{
		if ( m_nBufCount == 0 )
		{
			m_ptrNextBuf = m_ptrBuffer ;
			m_nBufCount = ReadNextData( m_ptrBuffer, m_nBufferingSize ) ;
			if ( m_nBufCount == 0 )
				return	1 ;
			if ( m_nBufCount & 0x03 )
			{
				unsigned int	i = m_nBufCount ;
				m_nBufCount += 4 - (m_nBufCount & 0x03) ;
				while ( i < m_nBufCount )
					m_ptrBuffer[i ++] = 0x00 ;
			}
		}
		m_nIntBufCount = 32 ;
#if	!defined(PROCESSOR_BIG_ENDIAN)
		m_dwIntBuffer =
			((DWORD)m_ptrNextBuf[0] << 24) | ((DWORD)m_ptrNextBuf[1] << 16)
				| ((DWORD)m_ptrNextBuf[2] << 8) | ((DWORD)m_ptrNextBuf[3]) ;
#else
		m_dwIntBuffer = *((DWORD*)m_ptrNextBuf) ;
#endif
		m_ptrNextBuf += 4 ;
		m_nBufCount -= 4 ;
	}
	return	0 ;
}

//
// 1�r�b�g���擾����
//////////////////////////////////////////////////////////////////////////////
// �Ԃ�l�G
//		0 ���́|1��Ԃ��B
//		�G���[�����������ꍇ��1��Ԃ��B
//////////////////////////////////////////////////////////////////////////////
INT RLHDecodeContext::GetABit( void )
{
	if ( PrefetchBuffer( ) )
		return	1 ;
	//
	INT	nValue = - (INT)(m_dwIntBuffer >> 31) ;
	m_nIntBufCount -- ;
	m_dwIntBuffer <<= 1 ;
	return	nValue ;
}

//
// n�r�b�g�擾����
//////////////////////////////////////////////////////////////////////////////
UINT RLHDecodeContext::GetNBits( int n )
{
	UINT	nCode = 0 ;
	while ( n != 0 )
	{
		if ( PrefetchBuffer( ) )
			break ;
		//
		int	nCopyBits = n ;
		if ( nCopyBits > m_nIntBufCount )
			nCopyBits = m_nIntBufCount ;
		//
		nCode = (nCode << nCopyBits) | (m_dwIntBuffer >> (32 - nCopyBits)) ;
		n -= nCopyBits ;
		m_nIntBufCount -= nCopyBits ;
		m_dwIntBuffer <<= nCopyBits ;
	}
	return	nCode ;
}

//
// �K���}�R�[�h���擾����
//////////////////////////////////////////////////////////////////////////////
// �Ԃ�l�G
//		�擾���ꂽ�K���}�R�[�h��Ԃ��B
//		�G���[�����������ꍇ�́|1��Ԃ��B
//////////////////////////////////////////////////////////////////////////////
INT RLHDecodeContext::GetACode( void )
{
	INT	nCode = 0, nBase = 1 ;
	//
	for ( ; ; )
	{
		//
		// �o�b�t�@�ւ̃f�[�^�̓ǂݍ���
		if ( PrefetchBuffer( ) )
			return	(LONG) -1 ;
		//
		// 1�r�b�g���o��
		m_nIntBufCount -- ;
		if ( !(m_dwIntBuffer & 0x80000000) )
		{
			//
			// �R�[�h�I��
			nCode += nBase ;
			m_dwIntBuffer <<= 1 ;
			return	nCode ;
		}
		else
		{
			//
			// �R�[�h�p��
			nBase <<= 1 ;
			m_dwIntBuffer <<= 1 ;
			//
			// �o�b�t�@�ւ̃f�[�^�̓ǂݍ���
			if ( PrefetchBuffer( ) )
				return	(LONG) -1 ;
			//
			// 1�r�b�g���o��
			nCode = (nCode << 1) | (m_dwIntBuffer >> 31) ;
			m_nIntBufCount -- ;
			m_dwIntBuffer <<= 1 ;
		}
	}
}

//
// �W�J�����f�[�^���擾����i�K���}�����j
//////////////////////////////////////////////////////////////////////////////
ULONG RLHDecodeContext::DecodeGammaCodes( PINT ptrDst, ULONG nCount )
{
	ULONG	nDecoded = 0, nRepeat ;
	INT		nSign, nCode ;
	//
	if ( m_nLength == 0 )
	{
		nCode = GetACode( ) ;
		if ( nCode == -1 )
			return	nDecoded ;
		m_nLength = (ULONG) nCode ;
	}
	//
	for ( ; ; )
	{
		//
		// �o�̓V���{�������Z�o
		nRepeat = m_nLength ;
		if ( nRepeat > nCount )
		{
			nRepeat = nCount ;
		}
		m_nLength -= nRepeat ;
		nCount -= nRepeat ;
		//
		// �V���{�����o��
		if ( !m_flgZero )
		{
			nDecoded += nRepeat ;
			while ( nRepeat -- )
				*(ptrDst ++) = 0 ;
		}
		else
		{
			while ( nRepeat -- )
			{
				nSign = GetABit( ) ;
				nCode = GetACode( ) ;
				if ( nCode == -1 )
					return	nDecoded ;
				nDecoded ++ ;
				*(ptrDst ++) = (nCode ^ nSign) - nSign ;
			}
		}
		//
		// �I�����H
		if ( nCount == 0 )
		{
			if ( m_nLength == 0 )
				m_flgZero = ~m_flgZero ;
			return	nDecoded ;
		}
		//
		// �����O�X�R�[�h���擾
		m_flgZero = ~m_flgZero ;
		nCode = GetACode( ) ;
		if ( nCode == -1 )
			return	nDecoded ;
		m_nLength = (ULONG) nCode ;
	}
}

//
// �W�J�����f�[�^���擾����i�Z�p�����j
//////////////////////////////////////////////////////////////////////////////
ULONG RLHDecodeContext::DecodeArithmeticCodes( PINT ptrDst, ULONG nCount )
{
	ULONG	nDecoded = 0 ;
	while ( nDecoded < nCount )
	{
		//
		// chop( C * N / A )
		DWORD	dwAcc = ::ChopMulDiv
			(
				m_dwCodeRegister,
				m_pLastStatisticalModel->dwTotalSymbolCount,
				m_dwAugendRegister
			) ;
		if ( dwAcc >= 0x10000 )
			break ;
		//
		// �V���{���̎w�W������
		int	nSymbolIndex = 0 ;
		WORD	wAcc = (WORD) dwAcc ;
		WORD	wFs = 0 ;
		WORD	wOccured ;
		for ( ; ; )
		{
			wOccured =
				m_pLastStatisticalModel->SymbolTable[nSymbolIndex].wOccured ;
			if ( wAcc < wOccured )
				break ;
			wAcc -= wOccured ;
			wFs += wOccured ;
			nSymbolIndex ++ ;
			if ( nSymbolIndex >= m_nSymbolSortCount )
				return	nDecoded ;
		}
		//
		// �R�[�h���W�X�^�ƃI�[�W�F���h���W�X�^���X�V
		m_dwCodeRegister -= ::RaiseMulDiv
			(
				m_dwAugendRegister,
				wFs,
				m_pLastStatisticalModel->dwTotalSymbolCount
			) ;
		m_dwAugendRegister = ::ChopMulDiv
			(
				m_dwAugendRegister,
				wOccured,
				m_pLastStatisticalModel->dwTotalSymbolCount
			) ;
		//
		// �I�[�W�F���g���W�X�^�𐳋K�����A�R�[�h���W�X�^�ɕ�����ǂݍ���
		while ( !(m_dwAugendRegister & 0x80000000) )
		{
			//
			// �R�[�h���W�X�^�ɃV�t�g�C��
			m_dwCodeRegister =
				(m_dwCodeRegister << 1) | (m_dwCodeBuffer >> 31) ;
			INT	nNextBit = GetABit( ) ;
			if ( nNextBit == 1 )
			{
				if ( (++ m_nVirtualPostBuf) >= 256 )
					return	nDecoded ;
				nNextBit = 0 ;
			}
			m_dwCodeBuffer =
				(m_dwCodeBuffer << 1) | (nNextBit & 0x01) ;
			//
			// �r�b�g�X�^�b�t�B���O
			if ( m_dwCodeBuffer == 0xFFFFFFFF )
			{
				m_dwCodeBuffer -= (GetABit() >> 1) ;
				if ( m_dwCodeBuffer == 0 )
					m_dwCodeRegister ++ ;
			}
			//
			m_dwAugendRegister <<= 1 ;
		}
		//
		// ���݂̓��v���f�����X�V
		ARITHCODE_SYMBOL	acsCurrent =
			m_pLastStatisticalModel->SymbolTable[nSymbolIndex] ;
		acsCurrent.wOccured ++ ;
		while ( nSymbolIndex != 0 )
		{
			ARITHCODE_SYMBOL	acs =
				m_pLastStatisticalModel->SymbolTable[nSymbolIndex - 1] ;
			if ( acs.wOccured > acsCurrent.wOccured )
				break ;
			m_pLastStatisticalModel->SymbolTable[nSymbolIndex] = acs ;
			nSymbolIndex -- ;
		}
		m_pLastStatisticalModel->SymbolTable[nSymbolIndex] = acsCurrent ;
		//
		// �f�[�^���o��
		*(ptrDst ++) = acsCurrent.wSymbol ;
		//
		// �����v���N�V���{�����X�V
		int	nSourceCode = (acsCurrent.wSymbol & m_maskSymbolBit) ;
		if ( (++ m_pLastStatisticalModel->dwTotalSymbolCount) >= 0x10000 )
		{
			DWORD	dwSymbolCount = 0 ;
			ARITHCODE_SYMBOL *	pacs =
				m_pLastStatisticalModel->SymbolTable ;
			for ( int i = 0; i < m_nSymbolSortCount; i ++ )
			{
				WORD	wOccured = pacs[i].wOccured ;
				wOccured = (wOccured & 0x01) + (wOccured >> 1) ;
				pacs[i].wOccured = wOccured ;
				dwSymbolCount += wOccured ;
			}
			m_pLastStatisticalModel->dwTotalSymbolCount = dwSymbolCount ;
		}
		//
		// ���̃V���{���̕�����
		m_pLastStatisticalModel = m_pStatisticalTable[nSourceCode] ;
		nDecoded ++ ;
	}
	return	nDecoded ;
}

//
// 1���C���W�J�����f�[�^���擾����iRL-MTF-G �����j
//////////////////////////////////////////////////////////////////////////////
ULONG RLHDecodeContext::DecodeRLMTFGCodes( PBYTE ptrDst, ULONG nCount )
{
	ULONG	nDecoded = 0 ;
	//
	// �J�����gMTF�e�[�u����ݒ�
	int	iLastPlt = -1 ;
	MTF_TABLE *	pCurTable = m_pMTFTable[0x100] ;
	//
	// ���C����S�ăf�R�[�h����܂ŌJ��Ԃ�
	while ( nDecoded < nCount )
	{
		//
		// �K���}�����𕜍�
		INT		iCode = GetACode( ) - 1 ;
		if ( iCode & ~0xFF )
			break ;
		//
		// �J�����gMTF�e�[�u�����Q�Ƃ���
		BYTE	iCurPlt = pCurTable->MoveToFront( iCode ) ;
		//
		// �������ꂽ�p���b�g�ԍ����o��
		ptrDst[nDecoded ++] = iCurPlt ;
		//
		// ���O�̃p���b�g�ԍ��ƈ�v���Ȃ�����r
		if ( iLastPlt == (int) iCurPlt )
		{
			//
			// ���������O�X�̓K�p
			iCode = GetACode( ) - 1 ;
			if ( iCode < 0 )
				break ;
			if ( (ULONG) (nDecoded + iCode) > (ULONG) nCount )
				iCode = (INT) (nCount - nDecoded) ;
			//
			while ( iCode -- )
			{
				ptrDst[nDecoded ++] = iCurPlt ;
			}
		}
		else
		{
			//
			// �J�����gMTF�e�[�u���̍X�V
			iLastPlt = iCurPlt ;
			pCurTable = m_pMTFTable[iCurPlt] ;
		}
	}
	//
	// �I��
	return	nDecoded ;
}

//
// �n�t�}���������擾����
//////////////////////////////////////////////////////////////////////////////
int RLHDecodeContext::GetAHuffmanCode( ERINA_HUFFMAN_TREE * tree )
{
	int		nCode ;
	if ( tree->m_iEscape != ERINA_HUFFMAN_NULL )
	{
		int		iEntry = ERINA_HUFFMAN_ROOT ;
		int		iChild = tree->m_hnTree[ERINA_HUFFMAN_ROOT].m_child_code ;
		//
		// �����𕜍�
		do
		{
			if ( PrefetchBuffer() )
				return	ERINA_HUFFMAN_ESCAPE ;
			//
			// 1�r�b�g���o��
			iEntry = iChild + (m_dwIntBuffer >> 31) ;
			-- m_nIntBufCount ;
			iChild = tree->m_hnTree[iEntry].m_child_code ;
			m_dwIntBuffer <<= 1 ;
		}
		while ( !(iChild & ERINA_CODE_FLAG) ) ;
		//
		// �����̏o���p�x�����Z
		tree->IncreaseOccuedCount( iEntry ) ;
		//
		// �G�X�P�[�v�R�[�h������
		nCode = iChild & ~ERINA_CODE_FLAG ;
		if ( nCode != ERINA_HUFFMAN_ESCAPE )
			return	nCode ;
	}
	//
	// �G�X�P�[�v�R�[�h�̂Ƃ���8�r�b�g�Œ蒷
	nCode = GetNBits( 8 ) ;
	tree->AddNewEntry( nCode ) ;
	return	nCode ;
}

//
// �����̃n�t�}���������擾����
//////////////////////////////////////////////////////////////////////////////
int RLHDecodeContext::GetLengthHuffman( ERINA_HUFFMAN_TREE * tree )
{
	int		nCode ;
	if ( tree->m_iEscape != ERINA_HUFFMAN_NULL )
	{
		int		iEntry = ERINA_HUFFMAN_ROOT ;
		int		iChild = tree->m_hnTree[ERINA_HUFFMAN_ROOT].m_child_code ;
		//
		// �����𕜍�
		do
		{
			if ( PrefetchBuffer() )
				return	ERINA_HUFFMAN_ESCAPE ;
			//
			// 1�r�b�g���o��
			iEntry = iChild + (m_dwIntBuffer >> 31) ;
			-- m_nIntBufCount ;
			iChild = tree->m_hnTree[iEntry].m_child_code ;
			m_dwIntBuffer <<= 1 ;
		}
		while ( !(iChild & ERINA_CODE_FLAG) ) ;
		//
		// �����̏o���p�x�����Z
		tree->IncreaseOccuedCount( iEntry ) ;
		//
		// �G�X�P�[�v�R�[�h������
		nCode = iChild & ~ERINA_CODE_FLAG ;
		if ( nCode != ERINA_HUFFMAN_ESCAPE )
			return	nCode ;
	}
	//
	// �G�X�P�[�v�R�[�h�̂Ƃ��̓K���}����
	nCode = GetACode( ) ;
	if ( nCode == -1 )
		return	ERINA_HUFFMAN_ESCAPE ;
	tree->AddNewEntry( nCode ) ;
	return	nCode ;
}

//
// ERINA �����𕜍�����
//////////////////////////////////////////////////////////////////////////////
ULONG RLHDecodeContext::DecodeERINACodes( PINT ptrDst, ULONG nCount )
{
	ERINA_HUFFMAN_TREE *	tree = m_pLastHuffmanTree ;
	INT		symbol, length ;
	ULONG	i = 0 ;
	if ( m_nLength > 0 )
	{
		length = m_nLength ;
		if ( length > (INT) nCount )
		{
			length = nCount ;
		}
		m_nLength -= length ;
		do
		{
			ptrDst[i ++] = 0 ;
		}
		while ( -- length ) ;
	}
	while ( i < nCount )
	{
		symbol = GetAHuffmanCode( tree ) ;
		if ( symbol == ERINA_HUFFMAN_ESCAPE )
			break ;
		ptrDst[i ++] = (SBYTE) symbol ;
		//
		if ( symbol == 0 )
		{
			length = GetLengthHuffman( m_pHuffmanTree[0x100] ) ;
			if ( length == ERINA_HUFFMAN_ESCAPE )
				break ;
			if ( -- length )
			{
				m_nLength = length ;
				if ( i + length > nCount )
				{
					length = nCount - i ;
				}
				m_nLength -= length ;
				if ( length > 0 )
				{
					do
					{
						ptrDst[i ++] = 0 ;
					}
					while ( -- length ) ;
				}
			}
		}
		tree = m_pHuffmanTree[symbol & 0xFF] ;
	}
	m_pLastHuffmanTree = tree ;
	//
	return	i ;
}

//
// ERINA �����𕜍�����i8�r�b�g�o�[�W�����j
//////////////////////////////////////////////////////////////////////////////
ULONG RLHDecodeContext::DecodeERINACodesSBZL( SBYTE * ptrDst, ULONG nCount )
{
	ERINA_HUFFMAN_TREE *	tree = m_pLastHuffmanTree ;
	INT		symbol, length ;
	ULONG	i = 0 ;
	if ( m_nLength > 0 )
	{
		length = m_nLength ;
		if ( length > (INT) nCount )
		{
			length = nCount ;
		}
		m_nLength -= length ;
		do
		{
			ptrDst[i ++] = 0 ;
		}
		while ( -- length ) ;
	}
	while ( i < nCount )
	{
		symbol = GetAHuffmanCode( tree ) ;
		if ( symbol == ERINA_HUFFMAN_ESCAPE )
			break ;
		ptrDst[i ++] = (SBYTE) symbol ;
		//
		if ( symbol == 0 )
		{
			length = GetLengthHuffman( m_pHuffmanTree[0x100] ) ;
			if ( length == ERINA_HUFFMAN_ESCAPE )
				break ;
			if ( -- length )
			{
				m_nLength = length ;
				if ( i + length > nCount )
				{
					length = nCount - i ;
				}
				m_nLength -= length ;
				if ( length > 0 )
				{
					do
					{
						ptrDst[i ++] = 0 ;
					}
					while ( -- length ) ;
				}
			}
		}
		tree = m_pHuffmanTree[symbol & 0xFF] ;
	}
	m_pLastHuffmanTree = tree ;
	//
	return	i ;
}

//
// ERINA �����i256�F�p�j�𕜍�����
//////////////////////////////////////////////////////////////////////////////
ULONG RLHDecodeContext::DecodeERINACodes256( PBYTE ptrDst, ULONG nCount )
{
	ERINA_HUFFMAN_TREE *	tree = m_pLastHuffmanTree ;
	INT		nLastSymbol = ERINA_HUFFMAN_ESCAPE ;
	ULONG	i = 0 ;
	while ( i < nCount )
	{
		INT		symbol = GetAHuffmanCode( tree ) ;
		if ( symbol == ERINA_HUFFMAN_ESCAPE )
			break ;
		ptrDst[i ++] = (BYTE) symbol ;
		//
		if ( nLastSymbol == symbol )
		{
			INT		length = GetLengthHuffman( m_pHuffmanTree[0x100] ) ;
			if ( length == ERINA_HUFFMAN_ESCAPE )
				break ;
			while ( -- length )
			{
				ptrDst[i ++] = (BYTE) symbol ;
			}
		}
		nLastSymbol = symbol ;
		tree = m_pHuffmanTree[symbol & 0xFF] ;
	}
	m_pLastHuffmanTree = tree ;
	//
	return	i ;
}


/*****************************************************************************
                               �W�J�I�u�W�F�N�g
 *****************************************************************************/

//
// �I�y���[�V�������s
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::PerformOperation
	( DWORD dwOpCode, LONG nAllBlockLines, PINT * ptrNextLineBuf )
{
	//
	// �Ĕz����s
	INT		i, j, k ;
	UINT	nArrangeCode, nColorOperation, nDiffOperation ;
	nColorOperation = dwOpCode & 0x0F ;
	nArrangeCode = (dwOpCode >> 4) & 0x03 ;
	nDiffOperation = (dwOpCode >> 6) & 0x03 ;
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
		PINT	pArrange = m_pArrangeTable[nArrangeCode] ;
		for ( i = 0; i < (INT) m_nBlockSamples; i ++ )
		{
			m_ptrBuffer[pArrange[i]] = m_ptrSubBuf[i] ;
		}
	}
	//
	// �J���[�I�y���[�V���������s
	(this->*m_pfnColorOperation[nColorOperation])( ) ;
	//
	// �������������s�i���������j
	PINT	ptrNextBuf, ptrNextColBuf, ptrLineBuf ;
	if ( nDiffOperation & 0x01 )
	{
		ptrNextBuf = m_ptrBuffer ;
		ptrNextColBuf = m_ptrColumnBuf ;
		for ( i = 0; i < nAllBlockLines; i ++ )
		{
			INT		nLastVal = *ptrNextColBuf ;
			for ( j = 0; j < (INT) m_nBlockSize; j ++ )
			{
				nLastVal += *ptrNextBuf ;
				*(ptrNextBuf ++) = nLastVal ;
			}
			*(ptrNextColBuf ++) = nLastVal ;
		}
	}
	else
	{
		ptrNextBuf = m_ptrBuffer ;
		ptrNextColBuf = m_ptrColumnBuf ;
		for ( i = 0; i < nAllBlockLines; i ++ )
		{
			*(ptrNextColBuf ++) = ptrNextBuf[m_nBlockSize - 1] ;
			ptrNextBuf += m_nBlockSize ;
		}
	}
	//
	// �������������s�i���������j
	ptrLineBuf = *ptrNextLineBuf ;
	ptrNextBuf = m_ptrBuffer ;
	for ( k = 0; k < (INT) m_nChannelCount; k ++ )
	{
		PINT	ptrLastLine = ptrLineBuf ;
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
			*(ptrLineBuf ++) = *(ptrLastLine ++) ;
		}
	}
	*ptrNextLineBuf = ptrLineBuf ;
}

//
// �J���[�I�y���[�V�����֐��Q
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::ColorOperation0000( void )
{
}

void ERIDecoder::ColorOperation0101( void )
{
	LONG	nChannelSamples = m_nBlockArea ;
	PINT	ptrNext = m_ptrBuffer ;
	LONG	nRepCount = m_nBlockArea ;
	//
	do
	{
		INT	nBase = *ptrNext ;
		ptrNext[nChannelSamples] += nBase ;
		ptrNext ++ ;
	}
	while ( -- nRepCount ) ;
}

void ERIDecoder::ColorOperation0110( void )
{
	LONG	nChannelSamples = m_nBlockArea ;
	PINT	ptrNext = m_ptrBuffer ;
	LONG	nRepCount = m_nBlockArea ;
	//
	do
	{
		INT	nBase = *ptrNext ;
		ptrNext[nChannelSamples * 2] += nBase ;
		ptrNext ++ ;
	}
	while ( -- nRepCount ) ;
}

void ERIDecoder::ColorOperation0111( void )
{
	LONG	nChannelSamples = m_nBlockArea ;
	PINT	ptrNext = m_ptrBuffer ;
	LONG	nRepCount = m_nBlockArea ;
	//
	do
	{
		INT	nBase = *ptrNext ;
		ptrNext[nChannelSamples] += nBase ;
		ptrNext[nChannelSamples * 2] += nBase ;
		ptrNext ++ ;
	}
	while ( -- nRepCount ) ;
}

void ERIDecoder::ColorOperation1001( void )
{
	LONG	nChannelSamples = m_nBlockArea ;
	PINT	ptrNext = m_ptrBuffer ;
	LONG	nRepCount = m_nBlockArea ;
	//
	do
	{
		INT	nBase = ptrNext[nChannelSamples] ;
		*ptrNext += nBase ;
		ptrNext ++ ;
	}
	while ( -- nRepCount ) ;
}

void ERIDecoder::ColorOperation1010( void )
{
	LONG	nChannelSamples = m_nBlockArea ;
	PINT	ptrNext = m_ptrBuffer ;
	LONG	nRepCount = m_nBlockArea ;
	//
	do
	{
		INT	nBase = ptrNext[nChannelSamples] ;
		ptrNext[nChannelSamples * 2] += nBase ;
		ptrNext ++ ;
	}
	while ( -- nRepCount ) ;
}

void ERIDecoder::ColorOperation1011( void )
{
	LONG	nChannelSamples = m_nBlockArea ;
	PINT	ptrNext = m_ptrBuffer ;
	LONG	nRepCount = m_nBlockArea ;
	//
	do
	{
		INT	nBase = ptrNext[nChannelSamples] ;
		*ptrNext += nBase ;
		ptrNext[nChannelSamples * 2] += nBase ;
		ptrNext ++ ;
	}
	while ( -- nRepCount ) ;
}

void ERIDecoder::ColorOperation1101( void )
{
	LONG	nChannelSamples = m_nBlockArea ;
	PINT	ptrNext = m_ptrBuffer ;
	LONG	nRepCount = m_nBlockArea ;
	//
	do
	{
		INT	nBase = ptrNext[nChannelSamples * 2] ;
		*ptrNext += nBase ;
		ptrNext ++ ;
	}
	while ( -- nRepCount ) ;
}

void ERIDecoder::ColorOperation1110( void )
{
	LONG	nChannelSamples = m_nBlockArea ;
	PINT	ptrNext = m_ptrBuffer ;
	LONG	nRepCount = m_nBlockArea ;
	//
	do
	{
		INT	nBase = ptrNext[nChannelSamples * 2] ;
		ptrNext[nChannelSamples] += nBase ;
		ptrNext ++ ;
	}
	while ( -- nRepCount ) ;
}

void ERIDecoder::ColorOperation1111( void )
{
	LONG	nChannelSamples = m_nBlockArea ;
	PINT	ptrNext = m_ptrBuffer ;
	LONG	nRepCount = m_nBlockArea ;
	//
	do
	{
		INT	nBase = ptrNext[nChannelSamples * 2] ;
		*ptrNext += nBase ;
		ptrNext[nChannelSamples] += nBase ;
		ptrNext ++ ;
	}
	while ( -- nRepCount ) ;
}

//
// RGB�摜�̃X�g�A
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::RestoreRGB24II
	( PBYTE ptrDst, LONG nLineBytes,
		REAL32 * ptrSrc[], int nWidth, int nHeight )
{
	int		nLineOffset = 0 ;
	int		nBytesPerPixel = m_nDstBytesPerPixel ;
	PBYTE	ptrDstLine = ptrDst ;
	//
	for ( int y = 0; y < nHeight; y ++ )
	{
		int		nOffsetPos = nLineOffset ;
		PBYTE	ptrNextDst = ptrDstLine ;
		//
		for ( int x = 0; x < nWidth; x ++ )
		{
			ptrNextDst[0] = RoundR32ToByte( ptrSrc[0][nOffsetPos] ) ;
			ptrNextDst[1] = RoundR32ToByte( ptrSrc[1][nOffsetPos] ) ;
			ptrNextDst[2] = RoundR32ToByte( ptrSrc[2][nOffsetPos] ) ;
			++ nOffsetPos ;
			ptrNextDst += nBytesPerPixel ;
		}
		//
		nLineOffset += m_nBlockSize ;
		ptrDstLine += nLineBytes ;
	}
}

//
// RGBA�摜�̃X�g�A
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::RestoreRGBA32II
	( PBYTE ptrDst, LONG nLineBytes,
		REAL32 * ptrSrc[], int nWidth, int nHeight )
{
	int		nLineOffset = 0 ;
	PBYTE	ptrDstLine = ptrDst ;
	//
	for ( int y = 0; y < nHeight; y ++ )
	{
		int		nOffsetPos = nLineOffset ;
		PBYTE	ptrNextDst = ptrDstLine ;
		//
		for ( int x = 0; x < nWidth; x ++ )
		{
			ptrNextDst[0] = RoundR32ToByte( ptrSrc[0][nOffsetPos] ) ;
			ptrNextDst[1] = RoundR32ToByte( ptrSrc[1][nOffsetPos] ) ;
			ptrNextDst[2] = RoundR32ToByte( ptrSrc[2][nOffsetPos] ) ;
			ptrNextDst[3] = RoundR32ToByte( ptrSrc[3][nOffsetPos] ) ;
			++ nOffsetPos ;
			ptrNextDst += 4 ;
		}
		//
		nLineOffset += m_nBlockSize ;
		ptrDstLine += nLineBytes ;
	}
}

//
// YUV -> RGB �ϊ��֐�
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::ConvertYUVtoRGB( void )
{
	static const double	rMatrixYUV2RGB[3][3] =
	{
		{
			1.0,	0.0,	1.5
		},
		{
			1.0,	-0.375,	-0.75
		},
		{
			1.0,	1.75,	0.0
		}
	} ;
	for ( int i = 0; i < 4; i ++ )
	{
		for ( int j = 0; j < (int) m_nBlockArea; j ++ )
		{
			REAL32	rSample[3] ;
			rSample[0] = m_ptrBuffer2[0][i][j] ;
			rSample[1] = m_ptrBuffer2[1][i][j] ;
			rSample[2] = m_ptrBuffer2[2][i][j] ;
			m_ptrBuffer2[0][i][j] =
				(REAL32)(rSample[0] + rMatrixYUV2RGB[0][2] * rSample[2]) ;
			m_ptrBuffer2[1][i][j] =
				(REAL32)(rSample[0]
						+ rMatrixYUV2RGB[1][1] * rSample[1]
						+ rMatrixYUV2RGB[1][2] * rSample[2]) ;
			m_ptrBuffer2[2][i][j] =
				(REAL32)(rSample[0] + rMatrixYUV2RGB[2][1] * rSample[1]) ;
		}
	}
}

//
// 4:4:4 �X�P�[�����O
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::BlockScaling444( void )
{
	//
	// �S�`���l�����R�s�[
	for ( int i = 0; i < (int) m_nChannelCount; i ++ )
	{
		for ( int j = 0; j < 4; j ++ )
		{
			REAL32 *	ptrSrc = m_ptrBuffer4[i * 4 + j] ;
			REAL32 *	ptrDst = m_ptrBuffer2[i][j] ;
			//
			for ( int k = 0; k < (int) m_nBlockArea; k ++ )
			{
				ptrDst[k] = ptrSrc[k] ;
			}
		}
	}
}

//
// 4:2:2 �X�P�[�����O
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::BlockScaling422( void )
{
	int		i, j, k, l, m ;
	REAL32 *	ptrSrc ;
	REAL32 *	ptrDst ;
	//
	// �P�x�������R�s�[
	for ( i = 0; i < 4; i ++ )
	{
		ptrSrc = m_ptrBuffer4[i] ;
		ptrDst = m_ptrBuffer2[0][i] ;
		//
		for ( j = 0; j < (int) m_nBlockArea; j ++ )
		{
			ptrDst[j] = ptrSrc[j] ;
		}
	}
	//
	// �F���M���𐂒������ɐL��
	for ( i = 0; i < 2; i ++ )
	{
		for ( j = 0; j < 2; j ++ )
		{
			ptrSrc = m_ptrBuffer4[4 + i * 2 + j] ;
			//
			for ( k = 0; k < 2; k ++ )
			{
				ptrDst = m_ptrBuffer2[i + 1][j * 2 + k] ;
				//
				int		nHalfHeight = (int) m_nBlockSize >> 1 ;
				for ( l = 0; l < nHalfHeight; l ++ )
				{
					REAL32 *	ptrUnderDst = ptrDst + m_nBlockSize ;
					for ( m = 0; m < (int) m_nBlockSize; m ++ )
					{
						ptrUnderDst[m] = ptrDst[m] = ptrSrc[m] ;
					}
					ptrSrc += m_nBlockSize ;
					ptrDst = ptrUnderDst + m_nBlockSize ;
				}
			}
		}
	}
	//
	// �A���t�@�`���l�����R�s�[
	if ( m_nChannelCount == 4 )
	{
		for ( i = 0; i < 4; i ++ )
		{
			ptrSrc = m_ptrBuffer4[8 + i] ;
			ptrDst = m_ptrBuffer2[3][i] ;
			//
			for ( j = 0; j < (int) m_nBlockArea; j ++ )
			{
				ptrDst[j] = ptrSrc[j] ;
			}
		}
	}
}

//
// 4:1:1 �X�P�[�����O
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::BlockScaling411( void )
{
	int		i, j, k, l ;
	REAL32 *	ptrSrc ;
	REAL32 *	ptrDst ;
	//
	// �P�x�������R�s�[
	for ( i = 0; i < 4; i ++ )
	{
		ptrSrc = m_ptrBuffer4[i] ;
		ptrDst = m_ptrBuffer2[0][i] ;
		//
		for ( j = 0; j < (int) m_nBlockArea; j ++ )
		{
			ptrDst[j] = ptrSrc[j] ;
		}
	}
	//
	// �F���M���𐂒����������ɐL��
	DWORD	dwOffset[4] =
	{
		0,
		m_nBlockSize >> 1,
		m_nBlockArea >> 1,
		(m_nBlockArea + m_nBlockSize) >> 1
	} ;
	for ( i = 0; i < 2; i ++ )
	{
		for ( j = 0; j < 4; j ++ )
		{
			ptrSrc = m_ptrBuffer4[4 + i] + dwOffset[j] ;
			ptrDst = m_ptrBuffer2[i + 1][j] ;
			//
			int		nHalfWidth = (int) m_nBlockSize >> 1 ;
			for ( k = 0; k < nHalfWidth; k ++ )
			{
				REAL32 *	ptrUnderDst = ptrDst + m_nBlockSize ;
				for ( l = 0; l < nHalfWidth; l ++ )
				{
					ptrUnderDst[l * 2 + 1] = ptrUnderDst[l * 2] =
						ptrDst[l * 2 + 1] = ptrDst[l * 2] = ptrSrc[l] ;
				}
				ptrSrc += m_nBlockSize ;
				ptrDst = ptrUnderDst + m_nBlockSize ;
			}
		}
	}
	//
	// �A���t�@�`���l�����R�s�[
	if ( m_nChannelCount == 4 )
	{
		for ( i = 0; i < 4; i ++ )
		{
			ptrSrc = m_ptrBuffer4[6 + i] ;
			ptrDst = m_ptrBuffer2[3][i] ;
			//
			for ( j = 0; j < (int) m_nBlockArea; j ++ )
			{
				ptrDst[j] = ptrSrc[j] ;
			}
		}
	}
}

