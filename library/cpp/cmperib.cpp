
/*****************************************************************************
                         E R I N A - L i b r a r y
                                                      最終更新 2001/11/04
 ----------------------------------------------------------------------------
          Copyright (C) 2000-2001 Leshade Entis. All rights reserved.
 *****************************************************************************/


#define	STRICT	1
#include <windows.h>
#include <stdio.h>

//
// ERINA ライブラリ定義ファイル
//////////////////////////////////////////////////////////////////////////////

#include "eritypes.h"
#include "erinalib.h"
#include "erimatrix.h"


/*****************************************************************************
                   ランレングス・ガンマ・コンテキスト
 *****************************************************************************/

//
// ｎビット出力する
//////////////////////////////////////////////////////////////////////////////
int RLHEncodeContext::OutNBits( DWORD dwData, int n )
{
	while ( n > 0 )
	{
		if ( m_nIntBufCount + n >= 32 )
		{
			//
			// 中間バッファがいっぱいになる
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
			// バッファに出力
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
			// 中間バッファには余裕がある
			m_dwIntBuffer = (m_dwIntBuffer << n) | (dwData >> (32 - n)) ;
			m_nIntBufCount += n ;
			break ;
		}
	}
	return	0 ;
}

//
// ランレングスガンマ符号に符号化した際のサイズ（ビット数）を計算
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
			// ゼロ信号の連続数を取得
			c = i ;
			while ( ptrSrc[i] == 0 )
			{
				if ( ++ i >= nCount )
					break ;
			}
			//
			// 符号の長さを加算
			l += TryOutACode( i - c ) ;
		}
		else
		{
			//
			// 非ゼロ信号の連続数を取得
			c = i ;
			while ( ptrSrc[c] != 0 )
			{
				if ( ++ c >= nCount )
					break ;
			}
			//
			// 符号の長さを加算
			l += TryOutACode( c - i ) ;
			//
			// 各符号の長さを加算
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
// ハフマン符号で出力する
//////////////////////////////////////////////////////////////////////////////
int RLHEncodeContext::OutAHuffmanCode( ERINA_HUFFMAN_TREE * tree, int num )
{
	//
	// 指定のツリーエントリを取得
	int		iEntry = tree->m_iSymLookup[num & 0xFF] ;
	if ( iEntry == ERINA_HUFFMAN_NULL )
	{
		//
		// エスケープコードを出力
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
		// 普通のコードを出力
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
// 長さをハフマン符号で出力する
//////////////////////////////////////////////////////////////////////////////
int RLHEncodeContext::OutLengthHuffman
	( ERINA_HUFFMAN_TREE * tree, int length )
{
	ERINA_HUFFMAN_NODE *	phnEntry ;
	int		iChild, iParent, nCodeLength ;
	DWORD	dwCode ;
	//
	// 指定のツリーエントリを取得
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
			// エスケープコードを出力
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
	// 通常のハフマン符号を出力
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
// ERINA 符号に符号化して出力する
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
// ERINA 符号に符号化して出力する（8ビットバージョン）
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
// ERINA 符号（256色用）に符号化して出力する
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
                               圧縮オブジェクト
 *****************************************************************************/

//
// 差分処理
//////////////////////////////////////////////////////////////////////////////
void ERIEncoder::DifferentialOperation
	( LONG nAllBlockLines, PINT * ptrNextLineBuf )
{
	INT		i, j, k ;
	PINT	ptrLineBuf, ptrNextBuf, ptrNextColBuf ;
	//
	// 差分処理を実行（垂直方向）
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
	// 差分処理を実行（水平方向）
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
// オペレーションコードを取得
//////////////////////////////////////////////////////////////////////////////
DWORD ERIEncoder::DecideOperationCode
	( int nCompressMode, LONG nAllBlockLines, PINT * ptrNextLineBuf )
{
	unsigned int	i, j, k ;
	int		nBestSize, nTrySize ;
	//
	// 最適な差分処理コードを選択
	int		iBestDifOp ;
	if ( nCompressMode >= 2 )
	{
		//
		// 差分処理の選択はしない
		iBestDifOp = 0x03 ;
		DifferentialOperation( nAllBlockLines, ptrNextLineBuf ) ;
		nBestSize = RLHEncodeContext::TryEncodeGammaCodes
							( m_ptrBuffer1, m_nBlockSamples ) ;
	}
	else // if ( nCompressMode <= 1 )
	{
		//
		// 差分処理を実行（垂直方向）
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
		// 中間状態を保存
		for ( i = 0; i < m_nBlockSamples; i ++ )
			m_ptrBuffer2[i] = m_ptrBuffer1[i] ;
		//
		// 差分処理を実行（水平方向）
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
		// カラーオペレーションは使用しない
		return	(DWORD) (iBestDifOp << 6) ;
	}
	//
	// アルファチャネルをコピーする
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
	// 最適なカラーオペレーションを選択
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
	// カラーオペレーションを実行
	(this->*m_pfnColorOperation[iBestClrOp])( ) ;
	//
	// 不要なビットを削除
	NormalizeWithDepth
		( m_ptrBuffer2, m_ptrBuffer2, m_nBlockSamples ) ;
	//
	// 最適なアレンジコードを選ぶ
	//
	int		iBestArrange = 0 ;
	PINT	pArrange ;
	if ( nCompressMode == 2 )
	{
		//
		// アレンジコードは使わない
	}
	else if ( nCompressMode == 1 )
	{
		//
		// インターリーブの有効性を検証
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
		// 垂直走査の有効性を検証
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
		// 総当たり
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
	// オペレーションコードを返す
	return	(DWORD) (iBestDifOp << 6) | (iBestArrange << 4) | iBestClrOp ;
}

//
// カラーオペレーション関数群
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

