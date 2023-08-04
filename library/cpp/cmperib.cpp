
/*****************************************************************************
                         E R I N A - L i b r a r y
                                                      �ŏI�X�V 2001/11/04
 ----------------------------------------------------------------------------
          Copyright (C) 2000-2001 Leshade Entis. All rights reserved.
 *****************************************************************************/


#define	STRICT	1
#include <windows.h>
#include <stdio.h>

//
// ERINA ���C�u������`�t�@�C��
//////////////////////////////////////////////////////////////////////////////

#include "eritypes.h"
#include "erinalib.h"
#include "erimatrix.h"


/*****************************************************************************
                   ���������O�X�E�K���}�E�R���e�L�X�g
 *****************************************************************************/

//
// ���r�b�g�o�͂���
//////////////////////////////////////////////////////////////////////////////
int RLHEncodeContext::OutNBits( DWORD dwData, int n )
{
	while ( n > 0 )
	{
		if ( m_nIntBufCount + n >= 32 )
		{
			//
			// ���ԃo�b�t�@�������ς��ɂȂ�
			int	sc = 32 - m_nIntBufCount ;
			if ( m_nIntBufCount == 0 )
			{
				m_dwIntBuffer = dwData ;
			}
			else
			{
				m_dwIntBuffer =
					(m_dwIntBuffer << sc) | (dwData >> m_nIntBufCount) ;
				dwData <<= sc ;
			}
			m_nIntBufCount = 0 ;
			n -= sc ;
			//
			// �o�b�t�@�ɏo��
			m_ptrBuffer[m_nBufCount] = (BYTE) (m_dwIntBuffer >> 24) ;
			m_ptrBuffer[m_nBufCount + 1] = (BYTE) (m_dwIntBuffer >> 16) ;
			m_ptrBuffer[m_nBufCount + 2] = (BYTE) (m_dwIntBuffer >> 8) ;
			m_ptrBuffer[m_nBufCount + 3] = (BYTE) m_dwIntBuffer ;
			m_nBufCount += sizeof(DWORD) ;
			if ( m_nBufCount >= m_nBufferingSize )
			{
				if ( WriteNextData( m_ptrBuffer, m_nBufCount ) < m_nBufCount )
					return	1 ;
				m_nBufCount = 0 ;
			}
		}
		else
		{
			//
			// ���ԃo�b�t�@�ɂ͗]�T������
			m_dwIntBuffer = (m_dwIntBuffer << n) | (dwData >> (32 - n)) ;
			m_nIntBufCount += n ;
			break ;
		}
	}
	return	0 ;
}

//
// ���������O�X�K���}�����ɕ����������ۂ̃T�C�Y�i�r�b�g���j���v�Z
//////////////////////////////////////////////////////////////////////////////
int RLHEncodeContext::TryEncodeGammaCodes( const INT * ptrSrc, int nCount )
{
	int		c, i = 0, l = 1 ;
	//
	while ( i < nCount )
	{
		if ( ptrSrc[i] == 0 )
		{
			//
			// �[���M���̘A�������擾
			c = i ;
			while ( ptrSrc[i] == 0 )
			{
				if ( ++ i >= nCount )
					break ;
			}
			//
			// �����̒��������Z
			l += TryOutACode( i - c ) ;
		}
		else
		{
			//
			// ��[���M���̘A�������擾
			c = i ;
			while ( ptrSrc[c] != 0 )
			{
				if ( ++ c >= nCount )
					break ;
			}
			//
			// �����̒��������Z
			l += TryOutACode( c - i ) ;
			//
			// �e�����̒��������Z
			while ( i < c )
			{
				int	num = ptrSrc[i ++] ;
				if ( num < 0 )
					num = - num ;
				l += TryOutACode( num ) + 1 ;
			}
		}
	}

	return	l ;
}

//
// �n�t�}�������ŏo�͂���
//////////////////////////////////////////////////////////////////////////////
int RLHEncodeContext::OutAHuffmanCode( ERINA_HUFFMAN_TREE * tree, int num )
{
	//
	// �w��̃c���[�G���g�����擾
	int		iEntry = tree->m_iSymLookup[num & 0xFF] ;
	if ( iEntry == ERINA_HUFFMAN_NULL )
	{
		//
		// �G�X�P�[�v�R�[�h���o��
		if ( tree->m_iEscape != ERINA_HUFFMAN_NULL )
		{
			DWORD	dwCode = 0 ;
			int		nCodeLength = 0 ;
			int		iChild = tree->m_iEscape ;
			int		iParent ;
			do
			{
				iParent = tree->m_hnTree[iChild].m_parent ;
				++ nCodeLength ;
				if ( tree->m_hnTree[iParent].m_child_code == (DWORD) iChild )
					dwCode >>= 1 ;
				else
					dwCode = (dwCode >> 1) | 0x80000000 ;
				iChild = iParent ;
			}
			while ( iParent < ERINA_HUFFMAN_ROOT ) ;
			//
			if ( OutNBits( dwCode, nCodeLength ) )
				return	1 ;
			//
			tree->IncreaseOccuedCount( tree->m_iEscape ) ;
		}
		if ( OutNBits( (DWORD) num << 24, 8 ) )
			return	1 ;
		//
		tree->AddNewEntry( num ) ;
	}
	else
	{
		//
		// ���ʂ̃R�[�h���o��
		DWORD	dwCode = 0 ;
		int		nCodeLength = 0 ;
		int		iChild = iEntry ;
		int		iParent ;
		do
		{
			iParent = tree->m_hnTree[iChild].m_parent ;
			++ nCodeLength ;
			if ( tree->m_hnTree[iParent].m_child_code == (DWORD) iChild )
				dwCode >>= 1 ;
			else
				dwCode = (dwCode >> 1) | 0x80000000 ;
			iChild = iParent ;
		}
		while ( iParent < ERINA_HUFFMAN_ROOT ) ;
		//
		if ( OutNBits( dwCode, nCodeLength ) )
			return	1 ;
		//
		tree->IncreaseOccuedCount( iEntry ) ;
	}
	return	0 ;
}

//
// �������n�t�}�������ŏo�͂���
//////////////////////////////////////////////////////////////////////////////
int RLHEncodeContext::OutLengthHuffman
	( ERINA_HUFFMAN_TREE * tree, int length )
{
	ERINA_HUFFMAN_NODE *	phnEntry ;
	int		iChild, iParent, nCodeLength ;
	DWORD	dwCode ;
	//
	// �w��̃c���[�G���g�����擾
	int		iEntry = tree->m_iSymLookup[length & 0xFF] ;
	//
	if ( (iEntry == ERINA_HUFFMAN_NULL) ||
		(tree->m_hnTree[iEntry].m_child_code != (ERINA_CODE_FLAG | length)) )
	{
		int		iTreePointer = tree->m_iTreePointer ;
		iEntry = ERINA_HUFFMAN_ROOT - 1 ;
		while ( iEntry >= iTreePointer )
		{
			phnEntry = &tree->m_hnTree[iEntry] ;
			if ( (phnEntry->m_child_code & ERINA_CODE_FLAG)
				&& (phnEntry->m_child_code == (ERINA_CODE_FLAG | length)) )
			{
				break ;
			}
			-- iEntry ;
		}
		if ( iEntry < iTreePointer )
		{
			//
			// �G�X�P�[�v�R�[�h���o��
			if ( tree->m_iEscape != ERINA_HUFFMAN_NULL )
			{
				iChild = tree->m_iEscape ;
				nCodeLength = 0 ;
				dwCode = 0 ;
				do
				{
					iParent = tree->m_hnTree[iChild].m_parent ;
					++ nCodeLength ;
					if ( tree->m_hnTree[iParent].m_child_code == (DWORD) iChild )
						dwCode >>= 1 ;
					else
						dwCode = (dwCode >> 1) | 0x80000000 ;
					iChild = iParent ;
				}
				while ( iParent < ERINA_HUFFMAN_ROOT ) ;
				//
				if ( OutNBits( dwCode, nCodeLength ) )
					return	1 ;
				//
				tree->IncreaseOccuedCount( tree->m_iEscape ) ;
			}
			if ( OutACode( length ) )
				return	1 ;
			//
			tree->AddNewEntry( length ) ;
			//
			return	0 ;
		}
	}
	//
	// �ʏ�̃n�t�}���������o��
	iChild = iEntry ;
	dwCode = 0 ;
	nCodeLength = 0 ;
	do
	{
		iParent = tree->m_hnTree[iChild].m_parent ;
		++ nCodeLength ;
		if ( tree->m_hnTree[iParent].m_child_code == (DWORD) iChild )
			dwCode >>= 1 ;
		else
			dwCode = (dwCode >> 1) | 0x80000000 ;
		iChild = iParent ;
	}
	while ( iParent < ERINA_HUFFMAN_ROOT ) ;
	//
	if ( OutNBits( dwCode, nCodeLength ) )
		return	1 ;
	//
	tree->IncreaseOccuedCount( iEntry ) ;
	//
	return	0 ;
}

//
// ERINA �����ɕ��������ďo�͂���
//////////////////////////////////////////////////////////////////////////////
int RLHEncodeContext::EncodeERINACodes( const INT * ptrSrc, int nCount )
{
	ERINA_HUFFMAN_TREE *	tree = m_pLastHuffmanTree ;
	INT		symbol = ERINA_HUFFMAN_ESCAPE ;
	int		i = 0 ;
	while ( i < nCount )
	{
		symbol = ptrSrc[i ++] & 0xFF ;
		if ( OutAHuffmanCode( tree, symbol ) )
			break ;
		if ( symbol == 0 )
		{
			int		j = i ;
			while ( i < nCount )
			{
				if ( ptrSrc[i] & 0xFF )
					break ;
				++ i ;
			}
			if ( OutLengthHuffman( m_pHuffmanTree[0x100], i - j + 1 ) )
				break ;
		}
		tree = m_pHuffmanTree[symbol] ;
	}
	m_pLastHuffmanTree = tree ;
	//
	return	i ;
}

//
// ERINA �����ɕ��������ďo�͂���i8�r�b�g�o�[�W�����j
//////////////////////////////////////////////////////////////////////////////
int RLHEncodeContext::EncodeERINACodesSBZL( const SBYTE * ptrSrc, int nCount )
{
	ERINA_HUFFMAN_TREE *	tree = m_pLastHuffmanTree ;
	INT		symbol = ERINA_HUFFMAN_ESCAPE ;
	int		i = 0 ;
	while ( i < nCount )
	{
		symbol = ptrSrc[i ++] & 0xFF ;
		if ( OutAHuffmanCode( tree, symbol ) )
			break ;
		if ( symbol == 0 )
		{
			int		j = i ;
			while ( i < nCount )
			{
				if ( ptrSrc[i] & 0xFF )
					break ;
				++ i ;
			}
			if ( OutLengthHuffman( m_pHuffmanTree[0x100], i - j + 1 ) )
				break ;
		}
		tree = m_pHuffmanTree[symbol] ;
	}
	m_pLastHuffmanTree = tree ;
	//
	return	i ;
}

//
// ERINA �����i256�F�p�j�ɕ��������ďo�͂���
//////////////////////////////////////////////////////////////////////////////
int RLHEncodeContext::EncodeERINACodes256( const BYTE * ptrSrc, int nCount )
{
	ERINA_HUFFMAN_TREE *	tree = m_pLastHuffmanTree ;
	INT		nLastSymbol = ERINA_HUFFMAN_ESCAPE ;
	int		i = 0 ;
	while ( i < nCount )
	{
		INT		symbol = ptrSrc[i ++] ;
		if ( OutAHuffmanCode( tree, symbol ) )
			break ;
		if ( nLastSymbol == symbol )
		{
			int		j = i ;
			while ( i < nCount )
			{
				if ( ptrSrc[i] != symbol )
					break ;
				++ i ;
			}
			if ( OutLengthHuffman( m_pHuffmanTree[0x100], i - j + 1 ) )
				break ;
		}
		nLastSymbol = symbol ;
		tree = m_pHuffmanTree[symbol] ;
	}
	m_pLastHuffmanTree = tree ;
	//
	return	i ;
}


/*****************************************************************************
                               ���k�I�u�W�F�N�g
 *****************************************************************************/

//
// ��������
//////////////////////////////////////////////////////////////////////////////
void ERIEncoder::DifferentialOperation
	( LONG nAllBlockLines, PINT * ptrNextLineBuf )
{
	INT		i, j, k ;
	PINT	ptrLineBuf, ptrNextBuf, ptrNextColBuf ;
	//
	// �������������s�i���������j
	ptrLineBuf = *ptrNextLineBuf ;
	ptrNextBuf = m_ptrBuffer1 ;
	for ( k = 0; k < (INT) m_nChannelCount; k ++ )
	{
		for ( i = 0; i < (INT) m_nBlockSize; i ++ )
		{
			for ( j = 0; j < (INT) m_nBlockSize; j ++ )
			{
				INT	nCurVal = *ptrNextBuf ;
				*(ptrNextBuf ++) -= ptrLineBuf[j] ;
				ptrLineBuf[j] = nCurVal ;
			}
		}
		ptrLineBuf += m_nBlockSize ;
	}
	*ptrNextLineBuf = ptrLineBuf ;
	//
	// �������������s�i���������j
	ptrNextBuf = m_ptrBuffer1 ;
	ptrNextColBuf = m_ptrColumnBuf ;
	for ( i = 0; i < nAllBlockLines; i ++ )
	{
		INT	nRightVal = ptrNextBuf[m_nBlockSize - 1] ;
		j = m_nBlockSize ;
		while ( -- j )
		{
			ptrNextBuf[j] -= ptrNextBuf[j - 1] ;
		}
		ptrNextBuf[0] -= ptrNextColBuf[i] ;
		ptrNextBuf += m_nBlockSize ;
		ptrNextColBuf[i] = nRightVal ;
	}
}

//
// �I�y���[�V�����R�[�h���擾
//////////////////////////////////////////////////////////////////////////////
DWORD ERIEncoder::DecideOperationCode
	( int nCompressMode, LONG nAllBlockLines, PINT * ptrNextLineBuf )
{
	unsigned int	i, j, k ;
	int		nBestSize, nTrySize ;
	//
	// �œK�ȍ��������R�[�h��I��
	int		iBestDifOp ;
	if ( nCompressMode >= 2 )
	{
		//
		// ���������̑I���͂��Ȃ�
		iBestDifOp = 0x03 ;
		DifferentialOperation( nAllBlockLines, ptrNextLineBuf ) ;
		nBestSize = RLHEncodeContext::TryEncodeGammaCodes
							( m_ptrBuffer1, m_nBlockSamples ) ;
	}
	else // if ( nCompressMode <= 1 )
	{
		//
		// �������������s�i���������j
		PINT	ptrLineBuf, ptrNextBuf, ptrNextColBuf ;
		ptrLineBuf = *ptrNextLineBuf ;
		ptrNextBuf = m_ptrBuffer1 ;
		for ( k = 0; k < (INT) m_nChannelCount; k ++ )
		{
			for ( i = 0; i < (INT) m_nBlockSize; i ++ )
			{
				for ( j = 0; j < (INT) m_nBlockSize; j ++ )
				{
					INT	nCurVal = *ptrNextBuf ;
					*(ptrNextBuf ++) -= ptrLineBuf[j] ;
					ptrLineBuf[j] = nCurVal ;
				}
			}
			ptrLineBuf += m_nBlockSize ;
		}
		*ptrNextLineBuf = ptrLineBuf ;
		//
		iBestDifOp = 0x02 ;
		nBestSize = RLHEncodeContext::TryEncodeGammaCodes
							( m_ptrBuffer1, m_nBlockSamples ) ;
		//
		// ���ԏ�Ԃ�ۑ�
		for ( i = 0; i < m_nBlockSamples; i ++ )
			m_ptrBuffer2[i] = m_ptrBuffer1[i] ;
		//
		// �������������s�i���������j
		ptrNextBuf = m_ptrBuffer1 ;
		ptrNextColBuf = m_ptrColumnBuf ;
		for ( i = 0; i < (ULONG) nAllBlockLines; i ++ )
		{
			INT	nRightVal = ptrNextBuf[m_nBlockSize - 1] ;
			j = m_nBlockSize ;
			while ( -- j )
			{
				ptrNextBuf[j] -= ptrNextBuf[j - 1] ;
			}
			ptrNextBuf[0] -= ptrNextColBuf[i] ;
			ptrNextBuf += m_nBlockSize ;
			ptrNextColBuf[i] = nRightVal ;
		}
		//
		nTrySize = RLHEncodeContext::TryEncodeGammaCodes
							( m_ptrBuffer1, m_nBlockSamples ) ;
		if ( nTrySize < nBestSize )
		{
			iBestDifOp = 0x03 ;
			nBestSize = nTrySize ;
		}
		else
		{
			for ( i = 0; i < m_nBlockSamples; i ++ )
				m_ptrBuffer1[i] = m_ptrBuffer2[i] ;
		}
	}
	//
	if ( nCompressMode == 3 )
	{
		// �J���[�I�y���[�V�����͎g�p���Ȃ�
		return	(DWORD) (iBestDifOp << 6) ;
	}
	//
	// �A���t�@�`���l�����R�s�[����
	if ( m_nChannelCount >= 4 )
	{
		PINT	ptrSrc = m_ptrBuffer1 + m_nBlockArea * 3 ;
		PINT	ptrDst = m_ptrBuffer2 + m_nBlockArea * 3 ;
		for ( i = 0; i < m_nBlockArea; i ++ )
		{
			ptrDst[i] = ptrSrc[i] ;
		}
	}
	//
	// �œK�ȃJ���[�I�y���[�V������I��
	static const int	iClrOpFull[9] =
	{
		5, 6, 7, 9, 10, 11, 13, 14, 15
	} ;
	static const int	iClrOpHalf[3] =
	{
		7, 11, 15
	} ;
	int		iBestClrOp = 0 ;
	//
	const int *		pClrOp ;
	unsigned int	nClrOpCount ;
	if ( nCompressMode >= 1 )
	{
		pClrOp = iClrOpHalf ;
		nClrOpCount = 3 ;
	}
	else // if ( nCompressMode == 0 )
	{
		pClrOp = iClrOpFull ;
		nClrOpCount = 9 ;
	}
	for ( i = 0; i < nClrOpCount; i ++ )
	{
		(this->*m_pfnColorOperation[pClrOp[i]])( ) ;
		//
		nTrySize =
			RLHEncodeContext::TryEncodeGammaCodes
				( m_ptrBuffer2, m_nBlockSamples ) ;
		if ( nTrySize < nBestSize )
		{
			iBestClrOp = pClrOp[i] ;
			nBestSize = nTrySize ;
		}
	}
	// 
	// �J���[�I�y���[�V���������s
	(this->*m_pfnColorOperation[iBestClrOp])( ) ;
	//
	// �s�v�ȃr�b�g���폜
	NormalizeWithDepth
		( m_ptrBuffer2, m_ptrBuffer2, m_nBlockSamples ) ;
	//
	// �œK�ȃA�����W�R�[�h��I��
	//
	int		iBestArrange = 0 ;
	PINT	pArrange ;
	if ( nCompressMode == 2 )
	{
		//
		// �A�����W�R�[�h�͎g��Ȃ�
	}
	else if ( nCompressMode == 1 )
	{
		//
		// �C���^�[���[�u�̗L����������
		pArrange = m_pArrangeTable[2] ;
		for ( j = 0; j < (INT) m_nBlockSamples; j ++ )
		{
			m_ptrBuffer1[pArrange[j]] = m_ptrBuffer2[j] ;
		}
		nTrySize =
			RLHEncodeContext::TryEncodeGammaCodes
				( m_ptrBuffer1, m_nBlockSamples ) ;
		if ( nTrySize < nBestSize )
		{
			nBestSize = nTrySize ;
			iBestArrange |= 0x02 ;
		}
		//
		// ���������̗L����������
		pArrange = m_pArrangeTable[iBestArrange | 0x01] ;
		for ( j = 0; j < (INT) m_nBlockSamples; j ++ )
		{
			m_ptrBuffer1[pArrange[j]] = m_ptrBuffer2[j] ;
		}
		nTrySize =
			RLHEncodeContext::TryEncodeGammaCodes
				( m_ptrBuffer1, m_nBlockSamples ) ;
		if ( nTrySize < nBestSize )
		{
			nBestSize = nTrySize ;
			iBestArrange |= 0x01 ;
		}
	}
	else // if ( nCompressMode == 0 )
	{
		//
		// ��������
		for ( i = 1; i < 4; i ++ )
		{
			pArrange = m_pArrangeTable[i] ;
			for ( j = 0; j < (INT) m_nBlockSamples; j ++ )
			{
				m_ptrBuffer1[pArrange[j]] = m_ptrBuffer2[j] ;
			}
			nTrySize =
				RLHEncodeContext::TryEncodeGammaCodes
					( m_ptrBuffer1, m_nBlockSamples ) ;
			//
			if ( nTrySize < nBestSize )
			{
				nBestSize = nTrySize ;
				iBestArrange = i ;
			}
		}
	}
	pArrange = m_pArrangeTable[iBestArrange] ;
	for ( i = 0; i < m_nBlockSamples; i ++ )
	{
		m_ptrBuffer1[pArrange[i]] = m_ptrBuffer2[i] ;
	}
	//
	// �I�y���[�V�����R�[�h��Ԃ�
	return	(DWORD) (iBestDifOp << 6) | (iBestArrange << 4) | iBestClrOp ;
}

//
// �J���[�I�y���[�V�����֐��Q
//////////////////////////////////////////////////////////////////////////////
void ERIEncoder::ColorOperation0000( void )
{
	PINT	ptrSrc = m_ptrBuffer1 ;
	PINT	ptrDst = m_ptrBuffer2 ;
	INT		nChannelSamples = m_nBlockArea ;
	INT		nRepCount = m_nBlockArea ;
	//
	do
	{
		ptrDst[0] = ptrSrc[0] ;
		ptrDst[nChannelSamples] = ptrSrc[nChannelSamples] ;
		(ptrDst ++)[nChannelSamples * 2] = (ptrSrc ++)[nChannelSamples * 2] ;
	}
	while ( -- nRepCount ) ;
}

void ERIEncoder::ColorOperation0101( void )
{
	PINT	ptrSrc = m_ptrBuffer1 ;
	PINT	ptrDst = m_ptrBuffer2 ;
	INT		nChannelSamples = m_nBlockArea ;
	INT		nRepCount = m_nBlockArea ;
	//
	do
	{
		INT		nBase = ptrDst[0] = ptrSrc[0] ;
		ptrDst[nChannelSamples] = ptrSrc[nChannelSamples] - nBase ;
		(ptrDst ++)[nChannelSamples * 2] = (ptrSrc ++)[nChannelSamples * 2] ;
	}
	while ( -- nRepCount ) ;
}

void ERIEncoder::ColorOperation0110( void )
{
	PINT	ptrSrc = m_ptrBuffer1 ;
	PINT	ptrDst = m_ptrBuffer2 ;
	INT		nChannelSamples = m_nBlockArea ;
	INT		nRepCount = m_nBlockArea ;
	//
	do
	{
		INT		nBase = ptrDst[0] = ptrSrc[0] ;
		ptrDst[nChannelSamples] = ptrSrc[nChannelSamples] ;
		(ptrDst ++)[nChannelSamples * 2] = (ptrSrc ++)[nChannelSamples * 2] - nBase ;
	}
	while ( -- nRepCount ) ;
}

void ERIEncoder::ColorOperation0111( void )
{
	PINT	ptrSrc = m_ptrBuffer1 ;
	PINT	ptrDst = m_ptrBuffer2 ;
	INT		nChannelSamples = m_nBlockArea ;
	INT		nRepCount = m_nBlockArea ;
	//
	do
	{
		INT		nBase = ptrDst[0] = ptrSrc[0] ;
		ptrDst[nChannelSamples] = ptrSrc[nChannelSamples] - nBase ;
		(ptrDst ++)[nChannelSamples * 2] = (ptrSrc ++)[nChannelSamples * 2] - nBase ;
	}
	while ( -- nRepCount ) ;
}

void ERIEncoder::ColorOperation1001( void )
{
	PINT	ptrSrc = m_ptrBuffer1 ;
	PINT	ptrDst = m_ptrBuffer2 ;
	INT		nChannelSamples = m_nBlockArea ;
	INT		nRepCount = m_nBlockArea ;
	//
	do
	{
		INT		nBase = ptrDst[nChannelSamples] = ptrSrc[nChannelSamples] ;
		ptrDst[0] = ptrSrc[0] - nBase ;
		(ptrDst ++)[nChannelSamples * 2] = (ptrSrc ++)[nChannelSamples * 2] ;
	}
	while ( -- nRepCount ) ;
}

void ERIEncoder::ColorOperation1010( void )
{
	PINT	ptrSrc = m_ptrBuffer1 ;
	PINT	ptrDst = m_ptrBuffer2 ;
	INT		nChannelSamples = m_nBlockArea ;
	INT		nRepCount = m_nBlockArea ;
	//
	do
	{
		INT		nBase = ptrDst[nChannelSamples] = ptrSrc[nChannelSamples] ;
		ptrDst[0] = ptrSrc[0] ;
		(ptrDst ++)[nChannelSamples * 2] = (ptrSrc ++)[nChannelSamples * 2] - nBase ;
	}
	while ( -- nRepCount ) ;
}

void ERIEncoder::ColorOperation1011( void )
{
	PINT	ptrSrc = m_ptrBuffer1 ;
	PINT	ptrDst = m_ptrBuffer2 ;
	INT		nChannelSamples = m_nBlockArea ;
	INT		nRepCount = m_nBlockArea ;
	//
	do
	{
		INT		nBase = ptrDst[nChannelSamples] = ptrSrc[nChannelSamples] ;
		ptrDst[0] = ptrSrc[0] - nBase ;
		(ptrDst ++)[nChannelSamples * 2] = (ptrSrc ++)[nChannelSamples * 2] - nBase ;
	}
	while ( -- nRepCount ) ;
}

void ERIEncoder::ColorOperation1101( void )
{
	PINT	ptrSrc = m_ptrBuffer1 ;
	PINT	ptrDst = m_ptrBuffer2 ;
	INT		nChannelSamples = m_nBlockArea ;
	INT		nRepCount = m_nBlockArea ;
	//
	do
	{
		INT		nBase = ptrDst[nChannelSamples * 2] = ptrSrc[nChannelSamples * 2] ;
		ptrDst[0] = ptrSrc[0] - nBase ;
		(ptrDst ++)[nChannelSamples] = (ptrSrc ++)[nChannelSamples] ;
	}
	while ( -- nRepCount ) ;
}

void ERIEncoder::ColorOperation1110( void )
{
	PINT	ptrSrc = m_ptrBuffer1 ;
	PINT	ptrDst = m_ptrBuffer2 ;
	INT		nChannelSamples = m_nBlockArea ;
	INT		nRepCount = m_nBlockArea ;
	//
	do
	{
		INT		nBase = ptrDst[nChannelSamples * 2] = ptrSrc[nChannelSamples * 2] ;
		ptrDst[0] = ptrSrc[0] ;
		(ptrDst ++)[nChannelSamples] = (ptrSrc ++)[nChannelSamples] - nBase ;
	}
	while ( -- nRepCount ) ;
}

void ERIEncoder::ColorOperation1111( void )
{
	PINT	ptrSrc = m_ptrBuffer1 ;
	PINT	ptrDst = m_ptrBuffer2 ;
	INT		nChannelSamples = m_nBlockArea ;
	INT		nRepCount = m_nBlockArea ;
	//
	do
	{
		INT		nBase = ptrDst[nChannelSamples * 2] = ptrSrc[nChannelSamples * 2] ;
		ptrDst[0] = ptrSrc[0] - nBase ;
		(ptrDst ++)[nChannelSamples] = (ptrSrc ++)[nChannelSamples] - nBase ;
	}
	while ( -- nRepCount ) ;
}

