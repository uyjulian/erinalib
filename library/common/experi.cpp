
/*****************************************************************************
                          E R I N A - L i b r a r y
                                                      最終更新 2002/05/26
 ----------------------------------------------------------------------------
          Copyright (C) 2000-2002 Leshade Entis. All rights reserved.
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

//
// ライブラリ初期化関数
//////////////////////////////////////////////////////////////////////////////
void eriInitializeLibrary( void )
{
#if	defined(ERI_INTEL_X86)
	//
	// MMX を搭載していれば有効に
	eriEnableMMX( 0 ) ;
	//
	// FPUを初期化
	eriInitializeFPU( ) ;
#endif
	//
	// DCT 行列演算用のテーブルを初期化
	eriInitializeMatrixDCT( ) ;
}

//
// ライブラリ終了関数
//////////////////////////////////////////////////////////////////////////////
void eriCloseLibrary( void )
{
}

//
// スレッド初期化関数
//////////////////////////////////////////////////////////////////////////////
void eriInitializeTask( void )
{
#if	defined(ERI_INTEL_X86)
	//
	// FPUを初期化
	eriInitializeFPU( ) ;
#endif
}

//
// スレッド終了関数
//////////////////////////////////////////////////////////////////////////////
void eriCloseTask( void )
{
}


/*****************************************************************************
                                 描画関数
 *****************************************************************************/

void eriDrawImageToDC
	( HDC hDC, int x, int y, const RASTER_IMAGE_INFO & rii,
				const ENTIS_PALETTE * ppalette, const SIZE * psize )
{
	//
	// メモリアドレスを正規化
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
	// BITMAPINFO 構造体を作る
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
	// デバイスコンテキストに描画
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
                         ハフマン・ツリー・構造体
 *****************************************************************************/

//
// ツリーの初期化
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
// 親の重みを再計算する
//////////////////////////////////////////////////////////////////////////////
void ERINA_HUFFMAN_TREE::RecountOccuredCount( int iParent )
{
	int	iChild = m_hnTree[iParent].m_child_code ;
	m_hnTree[iParent].m_weight =
		m_hnTree[iChild].m_weight
			+ m_hnTree[iChild + 1].m_weight ;
}

//
// 新しいフリーエントリを作成して追加
//////////////////////////////////////////////////////////////////////////////
void ERINA_HUFFMAN_TREE::AddNewEntry( int nNewCode )
{
	if ( m_iTreePointer > 0 )
	{
		//
		// 2つの領域を確保する
		int		i = m_iTreePointer = m_iTreePointer - 2 ;
		//
		// 新しいエントリを初期設定
		ERINA_HUFFMAN_NODE *	phnNew = &m_hnTree[i] ;
		phnNew->m_weight = 1 ;
		phnNew->m_child_code = ERINA_CODE_FLAG | nNewCode ;
		m_iSymLookup[nNewCode & 0xFF] = i ;
		//
		ERINA_HUFFMAN_NODE *	phnRoot = &m_hnTree[ERINA_HUFFMAN_ROOT] ;
		if ( phnRoot->m_child_code != ERINA_HUFFMAN_NULL )
		{
			//
			// 新しいエントリをツリーの末端に追加
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
			// 親エントリの正規化
			Normalize( i + 2 ) ;
		}
		else
		{
			//
			// 初期状態のツリーを構築
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
		// 最も出現頻度の低いシンボルを新しいシンボルで置き換える
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
// 各出現数を2分の1にして木を再構成
//////////////////////////////////////////////////////////////////////////////
void ERINA_HUFFMAN_TREE::HalfAndRebuild( void )
{
	//
	// 出現頻度を2分の1にする
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
	// ツリーを再構築
	int		iChild, nCode ;
	i = m_iTreePointer ;
	for ( ; ; )
	{
		//
		// 最も重みの小さい2つのエントリをハフマン木に組み込む
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
		// 親エントリをリストに組み込む
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
                   ランレングス・ガンマ・コンテキスト
 *****************************************************************************/

//
// 構築関数
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
// 消滅関数
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
// ゼロフラグを読み込んで、コンテキストを初期化する
//////////////////////////////////////////////////////////////////////////////
void RLHDecodeContext::Initialize( void )
{
	m_flgZero = (int) GetABit( ) ;
	m_nLength = 0 ;
}

//
// バッファをフラッシュする
//////////////////////////////////////////////////////////////////////////////
void RLHDecodeContext::FlushBuffer( void )
{
	//
	// バッファをクリア
	m_nIntBufCount = 0 ;
	m_nBufCount = 0 ;
}

//
// 算術符号の復号の準備する
//////////////////////////////////////////////////////////////////////////////
void RLHDecodeContext::PrepareToDecodeArithmeticCode( int nBitCount )
{
	//
	// 統計モデルを初期化
	//
	m_nSymbolBitCount = nBitCount ;
	m_nSymbolSortCount = (1 << nBitCount) ;
	m_maskSymbolBit = m_nSymbolSortCount - 1 ;
	//
	// メモリを確保
	if ( m_pStatisticalTable[0] != NULL )
	{
		::eriFreeMemory( m_pStatisticalTable[0] ) ;
	}
	m_pLastStatisticalModel = (STATISTICAL_MODEL*)
		::eriAllocateMemory( m_nSymbolSortCount *
			(sizeof(DWORD) + m_nSymbolSortCount * sizeof(ARITHCODE_SYMBOL)) ) ;
	//
	// 統計モデルを設定
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
	// レジスタを初期化
	//
	m_dwCodeRegister = 0 ;
	m_dwAugendRegister = 0xFFFFFFFF ;
	m_dwCodeBuffer = GetNBits( 32 ) ;
	//
	for ( i = 0; i < 32; i ++ )
	{
		//
		// ビットスタッフィング
		if ( m_dwCodeBuffer == 0xFFFFFFFF )
		{
			m_dwCodeBuffer -= (GetABit() >> 1) ;
			if ( m_dwCodeBuffer == 0 )
				m_dwCodeRegister ++ ;
		}
		//
		// 1ビットシフトイン
		m_dwCodeRegister = (m_dwCodeRegister << 1) | (m_dwCodeBuffer >> 31) ;
		m_dwCodeBuffer = (m_dwCodeBuffer << 1) | (GetABit() & 0x01) ;
	}
	//
	// ビットスタッフィング
	if ( m_dwCodeBuffer == 0xFFFFFFFF )
	{
		m_dwCodeBuffer -= (GetABit() >> 1) ;
		if ( m_dwCodeBuffer == 0 )
			m_dwCodeRegister ++ ;
	}
	//
	// 展開関数設定
	m_nVirtualPostBuf = 0 ;
	m_pfnDecodeSymbols = &RLHDecodeContext::DecodeArithmeticCodes ;
}

//
// RL-MTF-G 符号の復号の準備をする
//////////////////////////////////////////////////////////////////////////////
void RLHDecodeContext::PrepareToDecodeRLMTFGCode( void )
{
	//
	// MTFテーブルを確保
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
	// MTFテーブルを初期化
	for ( int i = 0; i <= 0x100; i ++ )
	{
		m_pMTFTable[i] = (MTF_TABLE*) ptrBuffer ;
		m_pMTFTable[i]->Initialize( ) ;
		ptrBuffer += sizeof(MTF_TABLE) ;
	}
}

//
// ERINA 符号の復号の準備をする
//////////////////////////////////////////////////////////////////////////////
void RLHDecodeContext::PrepareToDecodeERINACode( void )
{
	//
	// メモリを確保
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
	// ハフマンテーブルを初期化
	for ( int i = 0; i < 0x101; i ++ )
	{
		m_pHuffmanTree[i] = (ERINA_HUFFMAN_TREE*) ptrBuf ;
		ptrBuf += sizeof(ERINA_HUFFMAN_TREE) ;
		m_pHuffmanTree[i]->Initialize( ) ;
	}
	m_pLastHuffmanTree = m_pHuffmanTree[0] ;
}


/*****************************************************************************
                               展開オブジェクト
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
// 構築関数
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
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
ERIDecoder::~ERIDecoder( void )
{
	Delete( ) ;
}

//
// 初期化（パラメータの設定）
//////////////////////////////////////////////////////////////////////////////
int ERIDecoder::Initialize( const ERI_INFO_HEADER & infhdr )
{
	//
	// 以前のデータを消去
	Delete( ) ;
	//
	// 画像情報ヘッダをコピー
	m_EriInfHdr = infhdr ;
	//
	if ( m_EriInfHdr.fdwTransformation == CVTYPE_LOSSLESS_ERI )
	{
		//
		// パラメータのチェック
		if ( (m_EriInfHdr.dwArchitecture != ERI_RUNLENGTH_GAMMA)
				&& (m_EriInfHdr.dwArchitecture != ERI_RUNLENGTH_HUFFMAN)
				&& (m_EriInfHdr.dwArchitecture != ERI_ARITHMETIC_CODE) )
		{
			return	1 ;		// エラー（未対応の圧縮フォーマット）
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
			return	1 ;		// エラー（未対応の画像フォーマット）
		}
		//
		if ( m_EriInfHdr.dwBlockingDegree != 0 )
		{
			//
			// 各定数を計算
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
			// ワーキングメモリを確保
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
		// バージョンのチェック
		if ( m_EriInfHdr.dwVersion == 0x00020100 )
		{
			//
			// 標準フォーマット
			m_fEnhancedMode = 0 ;
		}
		else if ( m_EriInfHdr.dwVersion == 0x00020200 )
		{
			//
			// 拡張フォーマット
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
			return	1 ;		// エラー（未対応のバージョン）
		}
	}
	else if ( m_EriInfHdr.fdwTransformation == CVTYPE_DCT_ERI )
	{
		if ( (m_EriInfHdr.dwArchitecture != ERI_RUNLENGTH_GAMMA)
				&& (m_EriInfHdr.dwArchitecture != ERI_RUNLENGTH_HUFFMAN) )
		{
			return	1 ;		// （未対応の圧縮フォーマット）
		}
		//
		if ( (m_EriInfHdr.fdwFormatType & ERI_TYPE_MASK) != ERI_RGB_IMAGE )
		{
			return	1 ;		// （未対応の画像フォーマット）
		}
		if ( m_EriInfHdr.dwBitsPerPixel < 24 )
		{
			return	1 ;		// （未対応の画像フォーマット）
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
			return	1 ;		// （未対応のフォーマット）
		}
		//
		// 各定数を計算
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
			return	1 ;			// エラー（未対応のフォーマット）
		}
		if ( m_nChannelCount == 4 )
		{
			m_nBlocksetCount += 4 ;
		}
		//
		// ワーキングメモリを確保
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
		// ハフマン木用のメモリを確保
		m_pHuffmanTree = (ERINA_HUFFMAN_TREE*)
			::eriAllocateMemory( sizeof(ERINA_HUFFMAN_TREE) ) ;
		//
		// サンプリングテーブルの準備
		InitializeZigZagTable( ) ;
	}
	else
	{
		return	1 ;			// エラー（未対応のフォーマット）
	}

	//
	// 正常終了
	return	0 ;
}

//
// 終了（メモリの解放など）
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
// 画像を展開
//////////////////////////////////////////////////////////////////////////////
int ERIDecoder::DecodeImage
( const RASTER_IMAGE_INFO & dstimginf,
		RLHDecodeContext & context, bool fTopDown )
{
	//
	// 出力画像情報をコピーする
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
		// ERIバージョンを取得
		context.FlushBuffer( ) ;
		UINT	nERIVersion = context.GetNBits( 8 ) ;
		if ( (nERIVersion == 1) || (nERIVersion == 4) )
		{
			//
			// フルカラーフォーマット
			if ( (nERIVersion == 4) && (m_fEnhancedMode != 1) )
			{
				return	1 ;			// 未対応のフォーマット
			}
			return	DecodeTrueColorImage( imginf, context ) ;
		}
		else if ( nERIVersion == 8 )
		{
			//
			// フルカラー拡張フォーマット
			return	DecodeTrueColorImageII( imginf, context ) ;
		}
		else if ( nERIVersion == 2 )
		{
			//
			// パレット画像フォーマット
			return	DecodePaletteImage( imginf, context ) ;
		}
	}
	else if ( m_EriInfHdr.fdwTransformation == CVTYPE_DCT_ERI )
	{
		//
		// 非可逆フルカラーフォーマット
		return	DecodeTrueColorImageDCT( imginf, context ) ;
	}

	return	1 ;			// 未対応のフォーマット
}

//
// アレンジテーブルの初期化
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
	// サンプリングテーブル用バッファ確保
	PINT	ptrTable =
		(PINT) ::eriAllocateMemory( nBlockArea * 4 * sizeof(INT) ) ;
	m_pArrangeTable[0] = ptrTable ;
	m_pArrangeTable[1] = ptrTable + nBlockArea ;
	m_pArrangeTable[2] = ptrTable + nBlockArea * 2 ;
	m_pArrangeTable[3] = ptrTable + nBlockArea * 3 ;
	//
	// 水平方向走査
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
	// 垂直方向走査
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
	// 斜め順方向走査
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
	// 斜め逆方向走査
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
// ERINA 用再配置テーブルの初期化
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::InitializeArrangeTableII( void )
{
	unsigned int	i, j, k, l, m ;
	//
	// サンプリングテーブル用バッファ確保
	PINT	ptrTable =
		(PINT) ::eriAllocateMemory( m_nBlockSamples * 4 * sizeof(INT) ) ;
	PINT	ptrNext ;
	m_pArrangeTable[0] = ptrTable ;
	m_pArrangeTable[1] = ptrTable + m_nBlockSamples ;
	m_pArrangeTable[2] = ptrTable + m_nBlockSamples * 2 ;
	m_pArrangeTable[3] = ptrTable + m_nBlockSamples * 3 ;
	//
	// 水平方向走査
	ptrNext = m_pArrangeTable[0] ;
	for ( i = 0; i < m_nBlockSamples; i ++ )
	{
		ptrNext[i] = i ;
	}
	//
	// 垂直方向走査
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
	// 水平方向インターリーブ
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
	// 垂直方向インターリーブ
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
// フルカラー画像の展開
//////////////////////////////////////////////////////////////////////////////
int ERIDecoder::DecodeTrueColorImage
( const RASTER_IMAGE_INFO & imginf, RLHDecodeContext & context )
{
	//
	// 画像ストア関数のアドレスを取得
	m_nDstBytesPerPixel = (UINT) imginf.dwBitsPerPixel >> 3 ;
	PFUNC_RESTORE	pfnRestore =
		GetRestoreFunc( imginf.fdwFormatType, imginf.dwBitsPerPixel ) ;
	if ( pfnRestore == 0 )
		return	1 ;			// エラー（該当するストア関数が定義されていない）
	//
	// ラインバッファをクリア
	INT		i, j, k ;
	LONG	nWidthSamples =
		m_nChannelCount * (m_nWidthBlocks << m_EriInfHdr.dwBlockingDegree) ;
	for ( i = 0; i < nWidthSamples; i ++ )
	{
		m_ptrLineBuf[i] = 0 ;
	}
	//
	// 展開開始
	//
	// ERIヘッダを取得
	UINT	fOpTable = context.GetNBits( 8 ) ;
	UINT	fEncodeType = context.GetNBits( 8 ) ;
	UINT	fReserved = context.GetNBits( 8 ) ;
	int		nBitCount = 0 ;
	if ( m_EriInfHdr.dwArchitecture == 32 )
	{
		if ( (fOpTable != 0) || (fReserved != 0) )
		{
			return	1 ;					// 未対応のフォーマット
		}
		nBitCount = fEncodeType ;
		fEncodeType = 1 ;
	}
	else if ( m_EriInfHdr.dwArchitecture == 0xFFFFFFFF )
	{
		if ( (fOpTable != 0)
			|| (fEncodeType & 0xFE) || (fReserved != 0) )
		{
			return	1 ;					// 未対応のフォーマット
		}
	}
	else
	{
		return	1 ;						// 未対応のフォーマット
	}
	//
	// オペレーションテーブルを取得
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
	// コンテキストを初期化
	if ( context.GetABit( ) != 0 )
	{
		return	1 ;					// 不正なフォーマット
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
		// カラムバッファをクリア
		LONG	nColumnBufSamples = (LONG) (m_nBlockSize * m_nChannelCount) ;
		for ( i = 0; i < nColumnBufSamples; i ++ )
		{
			m_ptrColumnBuf[i] = 0 ;
		}
		//
		// 行の事前処理
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
			// ランレングス・ガンマをデコード
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
				// 互換モード
				if ( context.DecodeSymbols
					( m_ptrBuffer, m_nBlockSamples ) < m_nBlockSamples )
				{
					return	1 ;			// エラー（デコードに失敗）
				}
				nColorOperation = nOperationCode ;
			}
			else
			{
				//
				// 拡張モード
				if ( context.DecodeSymbols
					( m_ptrSubBuf, m_nBlockSamples ) < m_nBlockSamples )
				{
					return	1 ;			// エラー（デコードに失敗）
				}
				//
				// 再配列実行
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
			// カラーオペレーションを実行
			if ( m_nChannelCount >= 3 )
			{
				(this->*m_pfnColorOperation[nColorOperation])( ) ;
			}
			//
			// 差分処理を実行（水平方向）
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
			// 差分処理を実行（垂直方向）
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
			// 処理結果を出力バッファにストア
			int	nBlockWidth = (int) m_nBlockSize ;
			if ( nBlockWidth > nRestWidth )
				nBlockWidth = nRestWidth ;
			(this->*pfnRestore)
				( ptrDstLine, imginf.BytesPerLine, nBlockWidth, nBlockHeight ) ;
			//
			// 展開の状況を通知
			int	flgContinue = OnDecodedBlock( nPosY, nPosX ) ;
			if ( flgContinue != 0 )
				return	flgContinue ;	// 中断
			//
			ptrDstLine +=
				(m_nDstBytesPerPixel << m_EriInfHdr.dwBlockingDegree) ;
			nRestWidth -= (LONG) m_nBlockSize ;
		}
		//
		nRestHeight -= (LONG) m_nBlockSize ;
	}
	//
	return	0 ;				// 正常終了
}

//
// フルカラー画像拡張フォーマットの展開
//////////////////////////////////////////////////////////////////////////////
int ERIDecoder::DecodeTrueColorImageII
( const RASTER_IMAGE_INFO & imginf, RLHDecodeContext & context )
{
	//
	// 未対応フォーマットを展開しようとしていないか検証
	if ( (m_nChannelCount < 3) ||
		(m_fEnhancedMode != 2) ||
		(m_EriInfHdr.dwArchitecture != ERI_RUNLENGTH_HUFFMAN) )
	{
		return	1 ;			// エラー（未対応のフォーマット）
	}
	//
	// 画像ストア関数のアドレスを取得
	m_nDstBytesPerPixel = (UINT) imginf.dwBitsPerPixel >> 3 ;
	PFUNC_RESTORE	pfnRestore =
		GetRestoreFunc( imginf.fdwFormatType, imginf.dwBitsPerPixel ) ;
	if ( pfnRestore == 0 )
		return	1 ;			// エラー（該当するストア関数が定義されていない）
	//
	// ラインバッファをクリア
	INT		i ;
	LONG	nWidthSamples =
		m_nChannelCount * (m_nWidthBlocks << m_EriInfHdr.dwBlockingDegree) ;
	for ( i = 0; i < nWidthSamples; i ++ )
	{
		m_ptrLineBuf[i] = 0 ;
	}
	//
	// 展開開始
	//
	// ERIヘッダを取得
	UINT	fOpTable = context.GetNBits( 8 ) ;
	UINT	fEncodeType = context.GetNBits( 8 ) ;
	UINT	nBitCount = context.GetNBits( 8 ) ;
	if ( (fOpTable != 0) || (fEncodeType & 0xFE) || (nBitCount != 8) )
	{
		return	1 ;					// 未対応のフォーマット
	}
	//
	// オペレーションテーブルを取得
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
	// コンテキストを初期化
	if ( context.GetABit( ) != 0 )
	{
		return	1 ;					// 不正なフォーマット
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
		// カラムバッファをクリア
		LONG	nColumnBufSamples = (LONG) (m_nBlockSize * m_nChannelCount) ;
		for ( i = 0; i < nColumnBufSamples; i ++ )
		{
			m_ptrColumnBuf[i] = 0 ;
		}
		//
		// 行の事前処理
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
			// ERINA 符号を復号
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
				return	1 ;			// エラー（デコードに失敗）
			}
			//
			// オペレーションを実行
			PerformOperation
				( dwOperationCode, nAllBlockLines, &ptrNextLineBuf ) ;
			//
			// 処理結果を出力バッファにストア
			int		nBlockWidth = (int) m_nBlockSize ;
			if ( nBlockWidth > nRestWidth )
				nBlockWidth = nRestWidth ;
			(this->*pfnRestore)
				( ptrDstLine, imginf.BytesPerLine, nBlockWidth, nBlockHeight ) ;
			//
			// 展開の状況を通知
			int		flgContinue = OnDecodedBlock( nPosY, nPosX ) ;
			if ( flgContinue != 0 )
				return	flgContinue ;	// 中断
			//
			ptrDstLine +=
				(m_nDstBytesPerPixel << m_EriInfHdr.dwBlockingDegree) ;
			nRestWidth -= (LONG) m_nBlockSize ;
		}
		//
		nRestHeight -= (LONG) m_nBlockSize ;
	}
	//
	return	0 ;				// 正常終了
}

//
// パレット画像の展開
//////////////////////////////////////////////////////////////////////////////
int ERIDecoder::DecodePaletteImage
( const RASTER_IMAGE_INFO & imginf, RLHDecodeContext & context )
{
	//
	// フォーマットの確認
	if ( imginf.dwBitsPerPixel != 8 )
		return	1 ;			// エラー（未対応のフォーマット）
	//
	// ERIヘッダの確認
	UINT	fReserved = context.GetNBits( 24 ) ;
	if ( fReserved != 0 )
		return	1 ;			// エラー（未対応のフォーマット）
	//
	// コンテキストの初期化
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
		return	1 ;			// エラー（未対応のフォーマット）
	}
	//
	// 復号開始
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
			// 算術符号を使って1行展開
			if ( context.DecodeSymbols
					( m_ptrBuffer, nImageWidth ) < nImageWidth )
			{
				return	1 ;				// エラー（デコードに失敗）
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
			// RL-MTF-G 符号を使って1行展開
			if ( context.DecodeRLMTFGCodes
					( ptrDstLine, nImageWidth ) < nImageWidth )
			{
				return	1 ;				// エラー（デコードに失敗）
			}
		}
		else
		{
			//
			// ERINA 符号を使って1行展開
			if ( context.DecodeERINACodes256
					( ptrDstLine, nImageWidth ) < nImageWidth )
			{
				return	1 ;				// エラー（デコードに失敗）
			}
		}
		//
		// 展開の状況を通知
		int	flgContinue = OnDecodedLine( nLine ) ;
		if ( flgContinue != 0 )
			return	flgContinue ;	// 中断
		//
		ptrDstLine += nBytesPerLine ;
	}
	//
	return	0 ;				// 正常終了
}

//
// 展開画像をストアする関数へのポインタを取得する
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
// グレイ画像の展開
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
// RGB画像(15ビット)の展開
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
// RGB画像の展開
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
// RGBA画像の展開
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
// サンプリングテーブルの初期化
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
// フルカラー画像の圧縮
//////////////////////////////////////////////////////////////////////////////
int ERIDecoder::DecodeTrueColorImageDCT
	( const RASTER_IMAGE_INFO & imginf, RLHDecodeContext & context )
{
	//
	// 未対応フォーマットを展開しようとしていないか検証
	if ( (m_nChannelCount < 3) ||
		((m_EriInfHdr.dwArchitecture != ERI_RUNLENGTH_HUFFMAN)
			&& (m_EriInfHdr.dwArchitecture != ERI_RUNLENGTH_GAMMA)) )
	{
		return	1 ;			// エラー（未対応のフォーマット）
	}
	//
	// 画像ストア関数のアドレスを取得
	m_nDstBytesPerPixel = (UINT) imginf.dwBitsPerPixel >> 3 ;
	PFUNC_RESTOREII	pfnRestore =
		GetRestoreFuncII( imginf.fdwFormatType, imginf.dwBitsPerPixel ) ;
	if ( pfnRestore == NULL )
		return	1 ;			// エラー（該当するストア関数が定義されていない）
	//
	// コンテキストを初期化
	if ( m_EriInfHdr.dwArchitecture == ERI_RUNLENGTH_HUFFMAN )
	{
		context.PrepareToDecodeERINACode( ) ;
	}
	//
	// 展開開始
	//
	// ERIヘッダを取得
	UINT	nERIVersion = context.GetNBits( 8 ) ;
	UINT	fOpTable = context.GetNBits( 8 ) ;
	UINT	fEncodeType = context.GetNBits( 8 ) ;
	UINT	nBitCount = context.GetNBits( 8 ) ;
	if ( (nERIVersion != 9) || (fOpTable != 0)
			|| (fEncodeType & 0xFE) || (nBitCount != 8) )
	{
		return	1 ;					// 未対応のフォーマット
	}
	if ( context.GetABit( ) != 0 )
	{
		return	1 ;					// 不正なフォーマット
	}
	//
	// 直流成分係数を取得
	int		nFixedScaleDC = context.GetNBits( 8 ) ;
	m_rYScaleDC = (REAL32)(256.0 / (nFixedScaleDC + 1)) ;
	nFixedScaleDC = context.GetNBits( 8 ) ;
	m_rCScaleDC = (REAL32)(256.0 / (nFixedScaleDC + 1)) ;
	m_rMatrixScale = (REAL32) (2.0 / (LONG) m_nBlockSize) ;
	m_rYScaleDC *= m_rMatrixScale ;
	m_rCScaleDC *= m_rMatrixScale ;
	//
	// 直流成分・及び交流成分係数テーブルを展開
	LONG	i, j ;
	LONG	nAllBlockCount = (LONG) (m_nWidthBlocks * m_nHeightBlocks) ;
	//
	if ( fEncodeType & 0x01 )
	{
		//
		// 直流成分を取得
		ULONG	nDCSampleCount = nAllBlockCount * m_nBlocksetCount ;
		context.Initialize( ) ;
		if ( context.DecodeGammaCodes
				( m_ptrTableDC, nDCSampleCount ) < nDCSampleCount )
		{
			return	1 ;				// デコードに失敗
		}
		//
		// 交流成分係数を取得
		m_pHuffmanTree->Initialize( ) ;
		for ( i = 0; i < nAllBlockCount * 4; i ++ )
		{
			m_ptrOperations[i] =
				(BYTE) context.GetAHuffmanCode( m_pHuffmanTree ) ;
		}
		//
		// ガンマ符号のゼロフラグ取得
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
		// 行の事前処理
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
		// 差分バッファをクリア
		for ( i = 0; i < (LONG) m_nBlocksetCount; i ++ )
		{
			m_nDCDiffBuffer[i] = 0 ;
		}
		//
		for ( nPosX = 0; nPosX < (LONG) m_nWidthBlocks; nPosX ++ )
		{
			//
			// 直流成分及び交流成分係数を取得
			if ( !(fEncodeType & 0x01) )
			{
				context.Initialize( ) ;
				if ( context.DecodeGammaCodes
					( m_ptrBuffer, m_nBlocksetCount ) < m_nBlocksetCount )
				{
					return	1 ;			// デコードに失敗
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
			// 交流成分を復号
			ULONG	nACSampleCount = (m_nBlockArea - 1) * m_nBlocksetCount ;
			if ( m_EriInfHdr.dwArchitecture == ERI_RUNLENGTH_HUFFMAN )
			{
				if ( context.DecodeERINACodes
					( m_ptrBuffer + m_nBlocksetCount,
											nACSampleCount ) < nACSampleCount )
				{
					return	1 ;				// デコードに失敗
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
					return	1 ;				// デコードに失敗
				}
			}
			//
			// 直流成分を差分処理
			for ( i = 0; i < (LONG) m_nBlocksetCount; i ++ )
			{
				m_ptrBuffer[i] = m_nDCDiffBuffer[i]
						= m_ptrBuffer[i] + m_nDCDiffBuffer[i] ;
			}
			//
			// 再配置して逆量子化を施す
			ArrangeAndIQuantumize( ptrNextCoefficient ) ;
			ptrNextCoefficient += 4 ;
			//
			// 逆 DCT を施す
			PerformIDCT( ) ;
			//
			// スケーリング
			(this->*m_pfnBlockScaling)( ) ;
			//
			// YUV -> RGB 変換
			ConvertYUVtoRGB( ) ;
			//
			// 画像展開の準備
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
			// ブロックを展開
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
			// 展開の状況を通知
			int	flgContinue = OnDecodedBlock( nPosY, nPosX ) ;
			if ( flgContinue != 0 )
				return	flgContinue ;		// 中断
			//
			ptrDstLine +=
				(m_nDstBytesPerPixel << (m_EriInfHdr.dwBlockingDegree + 1)) ;
			nRestWidth -= (LONG) (m_nBlockSize * 2) ;
		}
		//
		nRestHeight -= (LONG) (m_nBlockSize * 2) ;
	}
	//
	return	0 ;				// 正常終了
}

//
// 展開画像をストアする関数へのポインタを取得する
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
// 実数を整数に丸めてBYTE型に飽和
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
// IDCT 変換を施す
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
// 逆量子化を施す
//////////////////////////////////////////////////////////////////////////////
void ERIDecoder::ArrangeAndIQuantumize( BYTE bytCoefficient[] )
{
	int		i, j ;
	//
	// 直流成分の逆量子化係数を取得
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
	// 直流成分を逆量子化
	PINT	ptrQuantumized = m_ptrBuffer ;
	REAL32 *	ptrDst = m_ptrBuffer4[0] ;
	int		count = (int) m_nBlocksetCount ;
	for ( i = 0; i < count; i ++ )
	{
		*(ptrDst ++) = (REAL32)(scale[i] * *(ptrQuantumized ++)) ;
	}
	//
	// 交流低周波成分の逆量子化係数を取得
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
	// 交流低周波成分を逆量子化
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
	// 交流高周波成分の逆量子化係数を取得
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
	// 交流高周波成分を逆量子化
	count = (m_nBlockSize * (m_nBlockSize + 1) / 2) ;
	for ( i = 0; i < count; i ++ )
	{
		for ( j = 0; j < (int) m_nBlocksetCount; j ++ )
		{
			*(ptrDst ++) = (REAL32)(scale[j] * *(ptrQuantumized ++)) ;
		}
	}
	//
	// 逆ジグザグ走査と逆インターリーブ
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
// 展開進行状況通知関数
//////////////////////////////////////////////////////////////////////////////
int ERIDecoder::OnDecodedBlock( LONG line, LONG column )
{
	return	0 ;			// 処理を継続
}

int ERIDecoder::OnDecodedLine( LONG line )
{
	return	0 ;			// 処理を継続
}


/*****************************************************************************
                     ファイルストリームコンテキスト
 *****************************************************************************/

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
EFileDecodeContext::EFileDecodeContext
		( EFileObject * pFileObj, ULONG nBufferingSize )
	: RLHDecodeContext( nBufferingSize ), m_pFileObj( pFileObj )
{
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
EFileDecodeContext::~EFileDecodeContext( void )
{
}

//
// 次のデータを読み込む
//////////////////////////////////////////////////////////////////////////////
ULONG EFileDecodeContext::ReadNextData( PBYTE ptrBuffer, ULONG nBytes )
{
	return	m_pFileObj->Read( ptrBuffer, nBytes ) ;
}

//
// ファイルオブジェクトを設定する
//////////////////////////////////////////////////////////////////////////////
void EFileDecodeContext::AttachFileObject( EFileObject * pFileObj )
{
	m_pFileObj = pFileObj ;
	FlushBuffer( ) ;
}
