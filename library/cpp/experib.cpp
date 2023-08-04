
/*****************************************************************************
                         E R I N A - L i b r a r y
                                                      最終更新 2001/11/04
 ----------------------------------------------------------------------------
          Copyright (C) 2000-2001 Leshade Entis. All rights reserved.
 *****************************************************************************/


#define	STRICT	1
#include <windows.h>


//
// ERINA ライブラリ定義ファイル
//////////////////////////////////////////////////////////////////////////////

#include "eritypes.h"
#include "erinalib.h"
#include "erimatrix.h"


/*****************************************************************************
                       ライブラリ初期化・終了関数
 *****************************************************************************/

DWORD	ERI_EnabledProcessorType = 0 ;

//
// MMX を有効にする
//////////////////////////////////////////////////////////////////////////////
#if	defined(ERI_INTEL_X86)
void eriEnableMMX( int fForceEnable )
{
	// ダミー
}
#endif

//
// MMX を無効にする
///////////////////////////////////////////////////////////////////////////
#if	defined(ERI_INTEL_X86)
void eriDisableMMX( int fForceDisable )
{
	// ダミー
}
#endif

//
// 浮動小数点演算ユニットを初期化する
///////////////////////////////////////////////////////////////////////////
#if	defined(ERI_INTEL_X86)
void eriInitializeFPU( void )
{
	// ダミー
}
#endif


/*****************************************************************************
                                演算関数
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
                         アニメーション用関数
 *****************************************************************************/

//
// 画像情報を比較
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
// フレーム間加算
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
// フレーム間差分
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
// 画像複製
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
// 拡大描画
//////////////////////////////////////////////////////////////////////////////
int eriEnlargeImageDouble
	( const RASTER_IMAGE_INFO & riiDst, const RASTER_IMAGE_INFO & riiSrc )
{
	//
	// 画像フォーマットのチェック
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
	// 画像データの拡大複製
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
                         ハフマン・ツリー・構造体
 *****************************************************************************/

//
// 発生頻度をインクリメント
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
// ツリーの正規化
//////////////////////////////////////////////////////////////////////////////
void ERINA_HUFFMAN_TREE::Normalize( int iEntry )
{
	while ( iEntry < ERINA_HUFFMAN_ROOT )
	{
		//
		// 入れ替えるエントリを検索
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
		// 入れ替え
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
		// 親の重みを再計算する
		RecountOccuredCount( iSwapParent ) ;
		iEntry = iSwapParent ;
	}
}


/*****************************************************************************
                   ランレングス・ガンマ・コンテキスト
 *****************************************************************************/

//
// バッファが空の時、次のデータを読み込む
//////////////////////////////////////////////////////////////////////////////
// 返り値；
//		0の時、正常終了
//		1の時、異常終了
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
// 1ビットを取得する
//////////////////////////////////////////////////////////////////////////////
// 返り値；
//		0 又は－1を返す。
//		エラーが発生した場合は1を返す。
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
// nビット取得する
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
// ガンマコードを取得する
//////////////////////////////////////////////////////////////////////////////
// 返り値；
//		取得されたガンマコードを返す。
//		エラーが発生した場合は－1を返す。
//////////////////////////////////////////////////////////////////////////////
INT RLHDecodeContext::GetACode( void )
{
	INT	nCode = 0, nBase = 1 ;
	//
	for ( ; ; )
	{
		//
		// バッファへのデータの読み込み
		if ( PrefetchBuffer( ) )
			return	(LONG) -1 ;
		//
		// 1ビット取り出し
		m_nIntBufCount -- ;
		if ( !(m_dwIntBuffer & 0x80000000) )
		{
			//
			// コード終了
			nCode += nBase ;
			m_dwIntBuffer <<= 1 ;
			return	nCode ;
		}
		else
		{
			//
			// コード継続
			nBase <<= 1 ;
			m_dwIntBuffer <<= 1 ;
			//
			// バッファへのデータの読み込み
			if ( PrefetchBuffer( ) )
				return	(LONG) -1 ;
			//
			// 1ビット取り出し
			nCode = (nCode << 1) | (m_dwIntBuffer >> 31) ;
			m_nIntBufCount -- ;
			m_dwIntBuffer <<= 1 ;
		}
	}
}

//
// 展開したデータを取得する（ガンマ符号）
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
		// 出力シンボル数を算出
		nRepeat = m_nLength ;
		if ( nRepeat > nCount )
		{
			nRepeat = nCount ;
		}
		m_nLength -= nRepeat ;
		nCount -= nRepeat ;
		//
		// シンボルを出力
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
		// 終了か？
		if ( nCount == 0 )
		{
			if ( m_nLength == 0 )
				m_flgZero = ~m_flgZero ;
			return	nDecoded ;
		}
		//
		// レングスコードを取得
		m_flgZero = ~m_flgZero ;
		nCode = GetACode( ) ;
		if ( nCode == -1 )
			return	nDecoded ;
		m_nLength = (ULONG) nCode ;
	}
}

//
// 展開したデータを取得する（算術符号）
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
		// シンボルの指標を検索
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
		// コードレジスタとオージェンドレジスタを更新
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
		// オージェントレジスタを正規化し、コードレジスタに符号を読み込む
		while ( !(m_dwAugendRegister & 0x80000000) )
		{
			//
			// コードレジスタにシフトイン
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
			// ビットスタッフィング
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
		// 現在の統計モデルを更新
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
		// データを出力
		*(ptrDst ++) = acsCurrent.wSymbol ;
		//
		// 総合計生起シンボル数更新
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
		// 次のシンボルの復号へ
		m_pLastStatisticalModel = m_pStatisticalTable[nSourceCode] ;
		nDecoded ++ ;
	}
	return	nDecoded ;
}

//
// 1ライン展開したデータを取得する（RL-MTF-G 符号）
//////////////////////////////////////////////////////////////////////////////
ULONG RLHDecodeContext::DecodeRLMTFGCodes( PBYTE ptrDst, ULONG nCount )
{
	ULONG	nDecoded = 0 ;
	//
	// カレントMTFテーブルを設定
	int	iLastPlt = -1 ;
	MTF_TABLE *	pCurTable = m_pMTFTable[0x100] ;
	//
	// ラインを全てデコードするまで繰り返し
	while ( nDecoded < nCount )
	{
		//
		// ガンマ符号を復号
		INT		iCode = GetACode( ) - 1 ;
		if ( iCode & ~0xFF )
			break ;
		//
		// カレントMTFテーブルを参照する
		BYTE	iCurPlt = pCurTable->MoveToFront( iCode ) ;
		//
		// 復号されたパレット番号を出力
		ptrDst[nDecoded ++] = iCurPlt ;
		//
		// 直前のパレット番号と一致しないか比較
		if ( iLastPlt == (int) iCurPlt )
		{
			//
			// ランレングスの適用
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
			// カレントMTFテーブルの更新
			iLastPlt = iCurPlt ;
			pCurTable = m_pMTFTable[iCurPlt] ;
		}
	}
	//
	// 終了
	return	nDecoded ;
}

//
// ハフマン符号を取得する
//////////////////////////////////////////////////////////////////////////////
int RLHDecodeContext::GetAHuffmanCode( ERINA_HUFFMAN_TREE * tree )
{
	int		nCode ;
	if ( tree->m_iEscape != ERINA_HUFFMAN_NULL )
	{
		int		iEntry = ERINA_HUFFMAN_ROOT ;
		int		iChild = tree->m_hnTree[ERINA_HUFFMAN_ROOT].m_child_code ;
		//
		// 符号を復号
		do
		{
			if ( PrefetchBuffer() )
				return	ERINA_HUFFMAN_ESCAPE ;
			//
			// 1ビット取り出す
			iEntry = iChild + (m_dwIntBuffer >> 31) ;
			-- m_nIntBufCount ;
			iChild = tree->m_hnTree[iEntry].m_child_code ;
			m_dwIntBuffer <<= 1 ;
		}
		while ( !(iChild & ERINA_CODE_FLAG) ) ;
		//
		// 符号の出現頻度を加算
		tree->IncreaseOccuedCount( iEntry ) ;
		//
		// エスケープコードか判別
		nCode = iChild & ~ERINA_CODE_FLAG ;
		if ( nCode != ERINA_HUFFMAN_ESCAPE )
			return	nCode ;
	}
	//
	// エスケープコードのときは8ビット固定長
	nCode = GetNBits( 8 ) ;
	tree->AddNewEntry( nCode ) ;
	return	nCode ;
}

//
// 長さのハフマン符号を取得する
//////////////////////////////////////////////////////////////////////////////
int RLHDecodeContext::GetLengthHuffman( ERINA_HUFFMAN_TREE * tree )
{
	int		nCode ;
	if ( tree->m_iEscape != ERINA_HUFFMAN_NULL )
	{
		int		iEntry = ERINA_HUFFMAN_ROOT ;
		int		iChild = tree->m_hnTree[ERINA_HUFFMAN_ROOT].m_child_code ;
		//
		// 符号を復号
		do
		{
			if ( PrefetchBuffer() )
				return	ERINA_HUFFMAN_ESCAPE ;
			//
			// 1ビット取り出す
			iEntry = iChild + (m_dwIntBuffer >> 31) ;
			-- m_nIntBufCount ;
			iChild = tree->m_hnTree[iEntry].m_child_code ;
			m_dwIntBuffer <<= 1 ;
		}
		while ( !(iChild & ERINA_CODE_FLAG) ) ;
		//
		// 符号の出現頻度を加算
		tree->IncreaseOccuedCount( iEntry ) ;
		//
		// エスケープコードか判別
		nCode = iChild & ~ERINA_CODE_FLAG ;
		if ( nCode != ERINA_HUFFMAN_ESCAPE )
			return	nCode ;
	}
	//
	// エスケープコードのときはガンマ符号
	nCode = GetACode( ) ;
	if ( nCode == -1 )
		return	ERINA_HUFFMAN_ESCAPE ;
	tree->AddNewEntry( nCode ) ;
	return	nCode ;
}

//
// ERINA 符号を復号する
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
// ERINA 符号を復号する（8ビットバージョン）
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
// ERINA 符号（256色用）を復号する
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
                               展開オブジェクト
 *****************************************************************************/

//
// オペレーション実行
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::PerformOperation
	( DWORD dwOpCode, LONG nAllBlockLines, PINT * ptrNextLineBuf )
{
	//
	// 再配列実行
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
	// カラーオペレーションを実行
	(this->*m_pfnColorOperation[nColorOperation])( ) ;
	//
	// 差分処理を実行（水平方向）
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
	// 差分処理を実行（垂直方向）
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
// カラーオペレーション関数群
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
// RGB画像のストア
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
// RGBA画像のストア
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
// YUV -> RGB 変換関数
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
// 4:4:4 スケーリング
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::BlockScaling444( void )
{
	//
	// 全チャネルをコピー
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
// 4:2:2 スケーリング
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::BlockScaling422( void )
{
	int		i, j, k, l, m ;
	REAL32 *	ptrSrc ;
	REAL32 *	ptrDst ;
	//
	// 輝度成分をコピー
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
	// 色差信号を垂直方向に伸張
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
	// アルファチャネルをコピー
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
// 4:1:1 スケーリング
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::BlockScaling411( void )
{
	int		i, j, k, l ;
	REAL32 *	ptrSrc ;
	REAL32 *	ptrDst ;
	//
	// 輝度成分をコピー
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
	// 色差信号を垂直水平方向に伸張
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
	// アルファチャネルをコピー
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

