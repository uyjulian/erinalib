
/*****************************************************************************
                         E R I N A - L i b r a r y
                                                      最終更新 2001/11/16
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
// 構築関数
//////////////////////////////////////////////////////////////////////////////
RLHEncodeContext::RLHEncodeContext( ULONG nBufferingSize )
{
	m_nIntBufCount = 0 ;
	m_nBufferingSize = (nBufferingSize + 0x03) & ~0x03 ;
	m_nBufCount = 0 ;
	m_ptrBuffer = (PBYTE) ::eriAllocateMemory( nBufferingSize ) ;

	int	i ;
	for ( i = 0; i < 0x101; i ++ )
		m_pMTFTable[i] = 0 ;

	for ( i = 0; i < 0x101; i ++ )
		m_pHuffmanTree[i] = 0 ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
RLHEncodeContext::~RLHEncodeContext( void )
{
	if ( m_ptrBuffer != NULL )
		::eriFreeMemory( m_ptrBuffer ) ;
	if ( m_pMTFTable[0] != 0 )
		::eriFreeMemory( m_pMTFTable[0] ) ;
	if ( m_pHuffmanTree[0] != 0 )
		::eriFreeMemory( m_pHuffmanTree[0] ) ;
}

//
// ガンマコードを出力する
//////////////////////////////////////////////////////////////////////////////
int RLHEncodeContext::OutACode( int num )
{
	int	b = 0, c = 1 ;
	//
	// コードの長さを決定する
	num -- ;
	while ( num >= c )
	{
		num -= c ;
		c <<= 1 ;
		b ++ ;
	}
	//
	// コードを出力
	DWORD	dwNum = (DWORD) num << (32 - b) ;
	while ( b > 0 )
	{
		//
		// "1" を出力
		m_dwIntBuffer = (m_dwIntBuffer << 1) | 0x01 ;
		if ( ++ m_nIntBufCount >= 32 )
		{
			m_nIntBufCount = 0 ;
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
		//
		// コードを出力
		m_dwIntBuffer = (m_dwIntBuffer << 1) | (dwNum >> 31) ;
		dwNum <<= 1 ;
		if ( ++ m_nIntBufCount >= 32 )
		{
			m_nIntBufCount = 0 ;
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
		//
		b -- ;
	}
	//
	// コードの終端を出力
	m_dwIntBuffer <<= 1 ;
	if ( ++ m_nIntBufCount >= 32 )
	{
		m_nIntBufCount = 0 ;
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
	//
	return	0 ;
}

//
// バッファの内容を出力して空にする
//////////////////////////////////////////////////////////////////////////////
int RLHEncodeContext::Flushout( void )
{
	if ( m_nIntBufCount > 0 )
	{
		m_dwIntBuffer <<= (32 - m_nIntBufCount) ;
		m_nIntBufCount = 0 ;
		m_ptrBuffer[m_nBufCount] = (BYTE) (m_dwIntBuffer >> 24) ;
		m_ptrBuffer[m_nBufCount + 1] = (BYTE) (m_dwIntBuffer >> 16) ;
		m_ptrBuffer[m_nBufCount + 2] = (BYTE) (m_dwIntBuffer >> 8) ;
		m_ptrBuffer[m_nBufCount + 3] = (BYTE) m_dwIntBuffer ;
		m_nBufCount += sizeof(DWORD) ;
	}
	if ( WriteNextData( m_ptrBuffer, m_nBufCount ) < m_nBufCount )
		return	1 ;
	m_nBufCount = 0 ;
	return	0 ;
}

//
// ランレングスガンマ符号に符号化して出力する
//////////////////////////////////////////////////////////////////////////////
int RLHEncodeContext::EncodeGammaCodes( const INT * ptrSrc, int nCount )
{
	int		c, i = 0 ;
	//
	if ( ptrSrc[0] == 0 )
		OutNBits( 0, 1 ) ;
	else
		OutNBits( 0x80000000UL, 1 ) ;
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
			// ゼロ信号の長さを出力
			if ( OutACode( i - c ) )
				break ;
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
			// 非ゼロ信号の長さを出力
			if ( OutACode( c - i ) )
				break ;
			//
			// 各符号を符号化
			while ( i < c )
			{
				int	num = ptrSrc[i ++] ;
				if ( num < 0 )
				{
					if ( OutNBits( 0x80000000UL, 1 ) )
						return	i ;
					num = - num ;
				}
				else
				{
					if ( OutNBits( 0, 1 ) )
						return	i ;
				}
				if ( OutACode( num ) )
					return	i ;
			}
		}
	}

	return	i ;
}

//
// RL-MTF-G 符号の符号化の準備をする
//////////////////////////////////////////////////////////////////////////////
void RLHEncodeContext::PrepareToEncodeRLMTFGCode( void )
{
	//
	// MTFテーブルを確保
	PBYTE	ptrBuffer ;
	if ( m_pMTFTable[0] != NULL )
	{
		ptrBuffer = (PBYTE) m_pMTFTable[0] ;
	}
	else
	{
		ptrBuffer =
			(PBYTE) ::eriAllocateMemory( sizeof(MTF_TABLE) * 0x101 ) ;
	}
	//
	// MTFテーブルを初期化
	for ( int i = 0; i < 0x101; i ++ )
	{
		m_pMTFTable[i] = (MTF_TABLE*) ptrBuffer ;
		m_pMTFTable[i]->Initialize( ) ;
		ptrBuffer += sizeof(MTF_TABLE) ;
	}
}

//
// RL-MTF-G 符号に符号化して出力する
//////////////////////////////////////////////////////////////////////////////
int RLHEncodeContext::EncodeRLMTFGCodes( PBYTE ptrSrc, int nCount )
{
	int		i = 0 ;
	//
	// カレントMTFテーブルを設定
	int	iLastPlt = -1 ;
	MTF_TABLE *	pCurTable = m_pMTFTable[0x100] ;
	//
	// ラインを全てエンコードするまで繰り返し
	while ( i < nCount )
	{
		//
		// 現在のパレット番号をMTFテーブルから検索して符号化
		BYTE	iCurPlt = ptrSrc[i ++] ;
		if ( OutACode( pCurTable->Search( iCurPlt ) ) )
			break ;
		//
		// 直前のパレットと一致しないか比較
		if ( iLastPlt == (int) iCurPlt )
		{
			//
			// ランレングスの出力
			int	j = i - 1 ;
			while ( i < nCount )
			{
				if ( ptrSrc[i] != iCurPlt )
					break ;
				i ++ ;
			}
			//
			if ( OutACode( i - j ) )
				break ;
		}
		else
		{
			//
			// カレントMTFテーブルの項真
			iLastPlt = iCurPlt ;
			pCurTable = m_pMTFTable[iCurPlt] ;
		}
	}
	//
	// 終了
	return	i ;
}

//
// ERINA 符号の符号化の準備をする
//////////////////////////////////////////////////////////////////////////////
void RLHEncodeContext::PrepareToEncodeERINACode( void )
{
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
	for ( int i = 0; i < 0x101; i ++ )
	{
		m_pHuffmanTree[i] = (ERINA_HUFFMAN_TREE*) ptrBuf ;
		ptrBuf += sizeof(ERINA_HUFFMAN_TREE) ;
		m_pHuffmanTree[i]->Initialize( ) ;
	}
	m_pLastHuffmanTree = m_pHuffmanTree[0] ;
}


/*****************************************************************************
                               圧縮オブジェクト
 *****************************************************************************/

ERIEncoder::PFUNC_COLOR_OPRATION	ERIEncoder::m_pfnColorOperation[0x10] =
{
	&ERIEncoder::ColorOperation0000,
	&ERIEncoder::ColorOperation0000,
	&ERIEncoder::ColorOperation0000,
	&ERIEncoder::ColorOperation0000,
	&ERIEncoder::ColorOperation0000,
	&ERIEncoder::ColorOperation0101,
	&ERIEncoder::ColorOperation0110,
	&ERIEncoder::ColorOperation0111,
	&ERIEncoder::ColorOperation0000,
	&ERIEncoder::ColorOperation1001,
	&ERIEncoder::ColorOperation1010,
	&ERIEncoder::ColorOperation1011,
	&ERIEncoder::ColorOperation0000,
	&ERIEncoder::ColorOperation1101,
	&ERIEncoder::ColorOperation1110,
	&ERIEncoder::ColorOperation1111
} ;

//
// ERIEncoder::PARAMETER 構造体の構築関数
//////////////////////////////////////////////////////////////////////////////
ERIEncoder::PARAMETER::PARAMETER( void )
{
	m_rYScaleDC = 0.5F ;
	m_rCScaleDC = 0.3F ;
	m_rYScaleLow = 0.25F ;
	m_rCScaleLow = 0.2F ;
	m_rYScaleHigh = 0.25F ;
	m_rCScaleHigh = 0.2F ;
	m_nLowThreshold = 0 ;
	m_nHighThreshold = 0 ;
}

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
ERIEncoder::ERIEncoder( void )
{
	m_ptrColumnBuf = 0 ;
	m_ptrLineBuf = 0 ;
	m_ptrBuffer1 = 0 ;
	m_ptrBuffer2 = 0 ;
	//
	m_pArrangeTable[0] = NULL ;
	m_pArrangeTable[1] = NULL ;
	m_pArrangeTable[2] = NULL ;
	m_pArrangeTable[3] = NULL ;
	//
	m_ptrOperations = 0 ;
	m_ptrDstBuffer = 0 ;
	//
	m_pHuffmanTree = NULL ;
	//
	m_ptrBuffer3[0][0] = NULL ;
	m_ptrBuffer4[0] = NULL ;
	m_ptrBuffer5[0] = NULL ;
	m_ptrWorkDCT1 = NULL ;
	m_ptrWorkDCT2 = NULL ;
	//
	m_ptrTableDC = NULL ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
ERIEncoder::~ERIEncoder( void )
{
	Delete( ) ;
}

//
// 初期化（パラメータの設定）
//////////////////////////////////////////////////////////////////////////////
int ERIEncoder::Initialize( const ERI_INFO_HEADER & infhdr )
{
	//
	// 以前のデータを消去
	Delete( ) ;
	//
	// 画像情報ヘッダをコピー
	m_EriInfHdr = infhdr ;
	//
	// パラメータのチェック
	if ( m_EriInfHdr.fdwTransformation == CVTYPE_LOSSLESS_ERI )
	{
		if ( (m_EriInfHdr.dwArchitecture != ERI_RUNLENGTH_GAMMA)
				&& (m_EriInfHdr.dwArchitecture != ERI_RUNLENGTH_HUFFMAN) )
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
			m_ptrColumnBuf =
				(PINT) ::eriAllocateMemory
					( m_nBlockSize * m_nChannelCount * sizeof(INT) ) ;
			m_ptrLineBuf =
				(PINT) ::eriAllocateMemory( m_nChannelCount *
					(m_nWidthBlocks << m_EriInfHdr.dwBlockingDegree) * sizeof(INT) ) ;
			m_ptrBuffer1 =
				(PINT) ::eriAllocateMemory( m_nBlockSamples * sizeof(INT) ) ;
			m_ptrBuffer2 =
				(PINT) ::eriAllocateMemory( m_nBlockSamples * sizeof(INT) ) ;
		}
		//
		// バージョンのチェックとサンプリングテーブルの準備
		if ( m_EriInfHdr.dwVersion == 0x00020200 )
		{
			if ( m_EriInfHdr.dwBlockingDegree != 0 )
			{
				InitializeSamplingTable( ) ;
			}
			m_pHuffmanTree = (ERINA_HUFFMAN_TREE*)
				::eriAllocateMemory( sizeof(ERINA_HUFFMAN_TREE) ) ;
		}
		else if ( m_EriInfHdr.dwVersion != 0x00020100 )
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
			m_pfnBlockScaling = &ERIEncoder::BlockScaling444 ;
			break ;
		case	ERISF_YUV_4_2_2:
			m_nBlocksetCount = 8 ;
			m_pfnBlockScaling = &ERIEncoder::BlockScaling422 ;
			break ;
		case	ERISF_YUV_4_1_1:
			m_nBlocksetCount = 6 ;
			m_pfnBlockScaling = &ERIEncoder::BlockScaling411 ;
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
		m_ptrBuffer1 =
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
				m_ptrBuffer3[i][j] = ptrBuffer ;
				ptrBuffer += m_nBlockArea ;
			}
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
		ptrBuffer =
			(REAL32*) ::eriAllocateMemory
				( m_nBlockArea * sizeof(REAL32) * 16 ) ;
		for ( i = 0; i < 16; i ++ )
		{
			m_ptrBuffer5[i] = ptrBuffer ;
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
		//
		// デフォルトの圧縮パラメータをセット
		PARAMETER	param ;
		SetCompressionParameter( param ) ;
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
// サンプリングテーブルの初期化
//////////////////////////////////////////////////////////////////////////////
void ERIEncoder::InitializeSamplingTable( void )
{
	unsigned int	i, j, k, l, m, n ;
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
	for ( i = 0; i < m_nChannelCount; i ++ )
	{
		k = i ;
		for ( j = 0; j < m_nBlockArea; j ++ )
		{
			*(ptrNext ++) = k ;
			k += m_nChannelCount ;
		}
	}
	//
	// 垂直方向インターリーブ
	ptrNext = m_pArrangeTable[3] ;
	n = m_nBlockSize * m_nChannelCount ;
	for ( i = 0; i < m_nChannelCount; i ++ )
	{
		l = i ;
		for ( j = 0; j < m_nBlockSize; j ++ )
		{
			m = l ;
			l += m_nChannelCount ;
			for ( k = 0; k < m_nBlockSize; k ++ )
			{
				*(ptrNext ++) = m ;
				m += n ;
			}
		}
	}
}

//
// 終了（メモリの解放など）
//////////////////////////////////////////////////////////////////////////////
void ERIEncoder::Delete( void )
{
	if ( m_ptrColumnBuf != NULL )
	{
		::eriFreeMemory( m_ptrColumnBuf ) ;
		m_ptrColumnBuf = 0 ;
	}
	if ( m_ptrLineBuf != NULL )
	{
		::eriFreeMemory( m_ptrLineBuf ) ;
		m_ptrLineBuf = 0 ;
	}
	if ( m_ptrBuffer1 != NULL )
	{
		::eriFreeMemory( m_ptrBuffer1 ) ;
		m_ptrBuffer1 = 0 ;
	}
	if ( m_ptrBuffer2 != NULL )
	{
		::eriFreeMemory( m_ptrBuffer2 ) ;
		m_ptrBuffer2 = 0 ;
	}
	if ( m_pArrangeTable[0] != NULL )
	{
		::eriFreeMemory( m_pArrangeTable[0] ) ;
		m_pArrangeTable[0] = NULL ;
	}
	if ( m_ptrOperations != NULL )
	{
		::eriFreeMemory( m_ptrOperations ) ;
		m_ptrOperations = NULL ;
	}
	if ( m_ptrDstBuffer != NULL )
	{
		::eriFreeMemory( m_ptrDstBuffer ) ;
		m_ptrDstBuffer = NULL ;
	}
	if ( m_pHuffmanTree != NULL )
	{
		::eriFreeMemory( m_pHuffmanTree ) ;
		m_pHuffmanTree = NULL ;
	}
	if ( m_ptrBuffer3[0][0] != NULL )
	{
		::eriFreeMemory( m_ptrBuffer3[0][0] ) ;
		m_ptrBuffer3[0][0] = NULL ;
	}
	if ( m_ptrBuffer4[0] != NULL )
	{
		::eriFreeMemory( m_ptrBuffer4[0] ) ;
		m_ptrBuffer4[0] = NULL ;
	}
	if ( m_ptrBuffer5[0] != NULL )
	{
		::eriFreeMemory( m_ptrBuffer5[0] ) ;
		m_ptrBuffer5[0] = NULL ;
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
// 画像を圧縮
//////////////////////////////////////////////////////////////////////////////
int ERIEncoder::EncodeImage
	( const RASTER_IMAGE_INFO & srcimginf,
		RLHEncodeContext & context, DWORD fdwFlags )
{
	//
	// 出力画像情報をコピーする
	RASTER_IMAGE_INFO	imginf = srcimginf ;
	if ( m_EriInfHdr.nImageHeight < 0 )
	{
		imginf.ptrImageArray +=
			(imginf.nImageHeight - 1) * imginf.BytesPerLine ;
		imginf.BytesPerLine = - imginf.BytesPerLine ;
	}
	//
	if ( m_EriInfHdr.fdwTransformation == CVTYPE_LOSSLESS_ERI )
	{
		if ( srcimginf.fdwFormatType & ERI_WITH_PALETTE )
		{
			//
			// パレット画像フォーマット
			return	EncodePaletteImage( imginf, context ) ;
		}
		else
		{
			//
			// フルカラーフォーマット
			if ( m_EriInfHdr.dwVersion == 0x00020200 )
			{
				return	EncodeTrueColorImageII( imginf, context, fdwFlags ) ;
			}
			else
			{
				return	EncodeTrueColorImage( imginf, context, fdwFlags ) ;
			}
		}
	}
	else if ( m_EriInfHdr.fdwTransformation == CVTYPE_DCT_ERI )
	{
		//
		// 非可逆フルカラーフォーマット
		return	EncodeTrueColorImageDCT( imginf, context, fdwFlags ) ;
	}

	return	1 ;			// 未対応のフォーマット
}

//
// 圧縮オプションを設定
//////////////////////////////////////////////////////////////////////////////
void ERIEncoder::SetCompressionParameter
	( const ERIEncoder::PARAMETER & parameter )
{
	m_parameter = parameter ;
}

//
// フルカラー画像の圧縮
//////////////////////////////////////////////////////////////////////////////
int ERIEncoder::EncodeTrueColorImage
	( const RASTER_IMAGE_INFO & imginf,
		RLHEncodeContext & context, DWORD fdwFlags )
{
	//
	// バッファ確保
	ULONG	nAllBlockCount, nAllSampleCount ;
	PBYTE	ptrNextOpCode ;
	PINT	ptrNextDstBuf ;
	if ( !(fdwFlags & ERI_ENCODE_INDEPENDENT_BLOCK) )
	{
		nAllBlockCount = m_nWidthBlocks * m_nHeightBlocks ;
		nAllSampleCount = nAllBlockCount * m_nBlockSamples ;
		//
		if ( m_ptrOperations == NULL )
		{
			m_ptrOperations = (PBYTE) ::eriAllocateMemory( nAllBlockCount ) ;
		}
		if ( m_ptrDstBuffer == NULL )
		{
			m_ptrDstBuffer = (PINT) ::eriAllocateMemory
								( nAllSampleCount * sizeof(INT) ) ;
		}
		ptrNextOpCode = m_ptrOperations ;
		ptrNextDstBuf = m_ptrDstBuffer ;
	}
	//
	// ビット深度取得
	m_nChannelDepth = GetChannelDepth
		( imginf.fdwFormatType, imginf.dwBitsPerPixel ) ;
	//
	// 画像サンプリング関数のアドレスを取得
	m_nSrcBytesPerPixel = (UINT) imginf.dwBitsPerPixel >> 3 ;
	PFUNC_SAMPLING	pfnSampling =
		GetSamplingFunc( imginf.fdwFormatType, imginf.dwBitsPerPixel ) ;
	if ( pfnSampling == 0 )
		return	1 ;		// エラー（該当するサンプリング関数が定義されていない）
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
	// 圧縮開始
	//
	// ERIヘッダを出力
	if ( fdwFlags & ERI_ENCODE_INDEPENDENT_BLOCK )
	{
		context.OutNBits( 0x01000000UL, 32 ) ;
		context.OutNBits( 0, 1 ) ;
	}
	else
	{
		context.OutNBits( 0x01000100UL, 32 ) ;
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
		PBYTE	ptrSrcLine = imginf.ptrImageArray
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
			// ブロックをサンプリング
			int	nBlockWidth = (int) m_nBlockSize ;
			if ( nBlockWidth > nRestWidth )
				nBlockWidth = nRestWidth ;
			if ( (nBlockHeight < (int) m_nBlockSize)
					|| (nBlockWidth < (int) m_nBlockSize) )
			{
				for ( i = 0; i < (INT) m_nBlockSamples; i ++ )
				{
					m_ptrBuffer1[i] = 0 ;
				}
			}
			(this->*pfnSampling)
				( ptrSrcLine, imginf.BytesPerLine, nBlockWidth, nBlockHeight ) ;
			//
			// 差分処理を実行
			DifferentialOperation( nAllBlockLines, &ptrNextLineBuf ) ;
			//
			// アルファチャネルをコピーする
			if ( m_nChannelCount >= 4 )
			{
				PINT	ptrSrc = m_ptrBuffer1 + m_nBlockArea * 3 ;
				PINT	ptrDst = m_ptrBuffer2 + m_nBlockArea * 3 ;
				for ( i = 0; i < (INT) m_nBlockArea; i ++ )
				{
					ptrDst[i] = ptrSrc[i] ;
				}
			}
			//
			// 最適なカラーオペレーションを選択
			if ( m_nChannelCount >= 3 )
			{
				//
				// カラーオペレーションを順次実行し最適なものを選ぶ
				static const int	iClrOpFull[9] =
				{
					5, 6, 7, 9, 10, 11, 13, 14, 15
				} ;
				static const int	iClrOpHalf[3] =
				{
					7, 11, 15
				} ;
				int		iBestClrOp = 0 ;
				int		nBestSize =
					RLHEncodeContext::TryEncodeGammaCodes
							( m_ptrBuffer1, m_nBlockSamples ) ;
				//
				const int *		pClrOp ;
				unsigned int	nClrOpCount ;
				switch ( ERI_GET_COMPRESS_MODE(fdwFlags) )
				{
				case	0:
				case	1:
					pClrOp = iClrOpFull ;
					nClrOpCount = 9 ;
					break ;
				case	2:
					pClrOp = iClrOpHalf ;
					nClrOpCount = 3 ;
					break ;
				case	3:
				default:
					nClrOpCount = 0 ;
					break ;
				}
				for ( i = 0; (unsigned int) i < nClrOpCount; i ++ )
				{
					(this->*m_pfnColorOperation[pClrOp[i]])( ) ;
					//
					int	nTrySize =
						RLHEncodeContext::TryEncodeGammaCodes
							( m_ptrBuffer2, m_nBlockSamples ) ;
					if ( nTrySize < nBestSize )
					{
						iBestClrOp = pClrOp[i] ;
						nBestSize = nTrySize ;
					}
				}
				//
				// オペレーションコードを出力
				if ( fdwFlags & ERI_ENCODE_INDEPENDENT_BLOCK )
					context.OutNBits( ((DWORD) iBestClrOp << 28), 4 ) ;
				else
					*(ptrNextOpCode ++) = (BYTE)(iBestClrOp << 4) ;
				// 
				// カラーオペレーションを実行
				(this->*m_pfnColorOperation[iBestClrOp])( ) ;
				NormalizeWithDepth
					( m_ptrBuffer2, m_ptrBuffer2, m_nBlockSamples ) ;
			}
			else
			{
				//
				// バッファの内容を正規化してコピー
				NormalizeWithDepth
					( m_ptrBuffer2, m_ptrBuffer1, m_nBlockSamples ) ;
			}
			if ( fdwFlags & ERI_ENCODE_INDEPENDENT_BLOCK )
			{
				//
				// ランレングスガンマ符号にエンコード
				if ( context.EncodeGammaCodes
					( m_ptrBuffer2, m_nBlockSamples ) < (int) m_nBlockSamples )
				{
					return	1 ;			// エンコードに失敗
				}
			}
			else
			{
				//
				// 出力バッファにコピー
				for ( i = 0; (ULONG) i < m_nBlockSamples; i ++ )
				{
					ptrNextDstBuf[i] = m_ptrBuffer2[i] ;
				}
				ptrNextDstBuf += m_nBlockSamples ;
			}
			//
			// 圧縮の状況を通知
			int	flgContinue = OnEncodedBlock( nPosY, nPosX ) ;
			if ( flgContinue != 0 )
				return	flgContinue ;		// 中断
			//
			ptrSrcLine +=
				(m_nSrcBytesPerPixel << m_EriInfHdr.dwBlockingDegree) ;
			nRestWidth -= (LONG) m_nBlockSize ;
		}
		//
		nRestHeight -= (LONG) m_nBlockSize ;
	}
	//
	// ブロック非独立型の場合、一括圧縮
	if ( !(fdwFlags & ERI_ENCODE_INDEPENDENT_BLOCK) )
	{
		if ( m_nChannelCount >= 3 )
		{
			//
			// オペレーションテーブル出力
			int	nOpCodeBits ;
			if ( m_EriInfHdr.dwVersion == 0x00020100 )
				nOpCodeBits = 4 ;
			else
				nOpCodeBits = 6 ;
			//
			for ( i = 0; i < (INT) nAllBlockCount; i ++ )
			{
				context.OutNBits
					( ((DWORD)m_ptrOperations[i] << 24), nOpCodeBits ) ;
			}
		}
		context.OutNBits( 0, 1 ) ;
		//
		// ランレングスガンマ符号にエンコード
		if ( context.EncodeGammaCodes
			( m_ptrDstBuffer, nAllSampleCount ) < (int) nAllSampleCount )
		{
			return	1 ;			// エンコードに失敗
		}
	}
	//
	if ( context.Flushout( ) )
		return	1 ;
	//
	return	0 ;				// 正常終了
}

//
// フルカラー画像の圧縮
//////////////////////////////////////////////////////////////////////////////
int ERIEncoder::EncodeTrueColorImageII
	( const RASTER_IMAGE_INFO & imginf,
		RLHEncodeContext & context, DWORD fdwFlags )
{
	//
	// バッファ確保
	ULONG	nAllBlockCount, nAllSampleCount ;
	PBYTE	ptrNextOpCode ;
	SBYTE *	ptrNextDstBuf ;
	if ( !(fdwFlags & ERI_ENCODE_INDEPENDENT_BLOCK) )
	{
		nAllBlockCount = m_nWidthBlocks * m_nHeightBlocks ;
		nAllSampleCount = nAllBlockCount * m_nBlockSamples ;
		//
		if ( m_ptrOperations == NULL )
		{
			m_ptrOperations = (PBYTE) ::eriAllocateMemory( nAllBlockCount ) ;
		}
		if ( m_ptrDstBuffer == NULL )
		{
			m_ptrDstBuffer = (PINT) ::eriAllocateMemory
								( nAllSampleCount * sizeof(SBYTE) ) ;
		}
		ptrNextOpCode = m_ptrOperations ;
		ptrNextDstBuf = (SBYTE*) m_ptrDstBuffer ;
	}
	//
	// コンテキストを初期化
	m_pHuffmanTree->Initialize( ) ;
	context.PrepareToEncodeERINACode( ) ;
	//
	// ビット深度取得
	m_nChannelDepth = GetChannelDepth
		( imginf.fdwFormatType, imginf.dwBitsPerPixel ) ;
	//
	// 画像サンプリング関数のアドレスを取得
	m_nSrcBytesPerPixel = (UINT) imginf.dwBitsPerPixel >> 3 ;
	PFUNC_SAMPLING	pfnSampling =
		GetSamplingFunc( imginf.fdwFormatType, imginf.dwBitsPerPixel ) ;
	if ( pfnSampling == 0 )
		return	1 ;		// エラー（該当するサンプリング関数が定義されていない）
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
	// 圧縮開始
	//
	// ERIヘッダを出力
	if ( fdwFlags & ERI_ENCODE_INDEPENDENT_BLOCK )
	{
		context.OutNBits( 0x08000008UL, 32 ) ;
		context.OutNBits( 0, 1 ) ;
	}
	else
	{
		context.OutNBits( 0x08000108UL, 32 ) ;
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
		PBYTE	ptrSrcLine = imginf.ptrImageArray
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
			// ブロックをサンプリング
			int	nBlockWidth = (int) m_nBlockSize ;
			if ( nBlockWidth > nRestWidth )
				nBlockWidth = nRestWidth ;
			if ( (nBlockHeight < (int) m_nBlockSize)
					|| (nBlockWidth < (int) m_nBlockSize) )
			{
				for ( i = 0; i < (INT) m_nBlockSamples; i ++ )
				{
					m_ptrBuffer1[i] = 0 ;
				}
			}
			(this->*pfnSampling)
				( ptrSrcLine, imginf.BytesPerLine, nBlockWidth, nBlockHeight ) ;
			//
			// オペレーションコードを取得
			DWORD	dwOpCode =
				DecideOperationCode
					( ERI_GET_COMPRESS_MODE(fdwFlags),
						nAllBlockLines, &ptrNextLineBuf ) ;
			//
			// オペレーションコードを出力
			if ( fdwFlags & ERI_ENCODE_INDEPENDENT_BLOCK )
			{
				context.OutAHuffmanCode( m_pHuffmanTree, dwOpCode ) ;
				//
				// ERINA 符号にエンコード
				if ( context.EncodeERINACodes
					( m_ptrBuffer1, m_nBlockSamples ) < (int) m_nBlockSamples )
				{
					return	1 ;			// エンコードに失敗
				}
			}
			else
			{
				*(ptrNextOpCode ++) = (BYTE) dwOpCode ;
				//
				// 出力バッファにコピー
				for ( i = 0; (ULONG) i < m_nBlockSamples; i ++ )
				{
					ptrNextDstBuf[i] = (SBYTE) m_ptrBuffer1[i] ;
				}
				ptrNextDstBuf += m_nBlockSamples ;
			}
			//
			// 圧縮の状況を通知
			int	flgContinue = OnEncodedBlock( nPosY, nPosX ) ;
			if ( flgContinue != 0 )
				return	flgContinue ;		// 中断
			//
			ptrSrcLine +=
				(m_nSrcBytesPerPixel << m_EriInfHdr.dwBlockingDegree) ;
			nRestWidth -= (LONG) m_nBlockSize ;
		}
		//
		nRestHeight -= (LONG) m_nBlockSize ;
	}
	//
	// ブロック非独立型の場合、一括圧縮
	if ( !(fdwFlags & ERI_ENCODE_INDEPENDENT_BLOCK) )
	{
		//
		// オペレーションテーブル出力
		for ( i = 0; i < (INT) nAllBlockCount; i ++ )
		{
			context.OutAHuffmanCode( m_pHuffmanTree, m_ptrOperations[i] ) ;
		}
		context.OutNBits( 0, 1 ) ;
		//
		// ERINA 符号にエンコード
		if ( context.EncodeERINACodesSBZL
			( (SBYTE*) m_ptrDstBuffer, nAllSampleCount ) < (int) nAllSampleCount )
		{
			return	1 ;			// エンコードに失敗
		}
	}
	//
	if ( context.Flushout( ) )
		return	1 ;
	//
	return	0 ;				// 正常終了
}

//
// パレット画像の圧縮
//////////////////////////////////////////////////////////////////////////////
int ERIEncoder::EncodePaletteImage
	( const RASTER_IMAGE_INFO & imginf, RLHEncodeContext & context )
{
	//
	// フォーマットの確認
	if ( imginf.dwBitsPerPixel != 8 )
		return	1 ;			// エラー（未対応のフォーマット）
	//
	// ERIヘッダを出力
	context.OutNBits( 0x02000000UL, 32 ) ;
	//
	// コンテキストの初期化
	if ( m_EriInfHdr.dwArchitecture == 0xFFFFFFFC )
		context.PrepareToEncodeERINACode( ) ;
	else
		context.PrepareToEncodeRLMTFGCode( ) ;
	//
	// 圧縮開始
	LONG	nLine, nHeight ;
	if ( imginf.nImageHeight < 0 )
		nHeight = - imginf.nImageHeight ;
	else
		nHeight = imginf.nImageHeight ;
	//
	PBYTE	ptrSrcLine = imginf.ptrImageArray ;
	ULONG	nImageWidth = (ULONG) imginf.nImageWidth ;
	SDWORD	nBytesPerLine = imginf.BytesPerLine ;
	//
	for ( nLine = 0; nLine < nHeight; nLine ++ )
	{
		if ( m_EriInfHdr.dwArchitecture == 0xFFFFFFFC )
		{
			//
			// ERINA 符号を使って1行圧縮
			if ( context.EncodeERINACodes256
					( ptrSrcLine, nImageWidth ) < (int) nImageWidth )
			{
				return	1 ;				// エラー（エンコードに失敗）
			}
		}
		else
		{
			//
			// RL-MTF-G 符号を使って1行圧縮
			if ( context.EncodeRLMTFGCodes
					( ptrSrcLine, nImageWidth ) < (int) nImageWidth )
			{
				return	1 ;				// エラー（エンコードに失敗）
			}
		}
		//
		// 展開の状況を通知
		int	flgContinue = OnEncodedLine( nLine ) ;
		if ( flgContinue != 0 )
			return	flgContinue ;	// 中断
		//
		ptrSrcLine += nBytesPerLine ;
	}
	//
	if ( context.Flushout( ) )
		return	1 ;
	//
	return	0 ;				// 正常終了
}

//
// チャネルのビット深度を取得する
//////////////////////////////////////////////////////////////////////////////
int ERIEncoder::GetChannelDepth
	( DWORD fdwFormatType, DWORD dwBitsPerPixel )
{
	if ( dwBitsPerPixel == 16 )
		return	5 ;
	else
		return	8 ;
}

//
// 指定のビット深度にデータを正規化する
//////////////////////////////////////////////////////////////////////////////
void ERIEncoder::NormalizeWithDepth( PINT ptrDst, PINT ptrSrc, int nCount )
{
	if ( m_nChannelDepth == 8 )
	{
		int	i = 0 ;
		while ( nCount >= 2 )
		{
			nCount -= 2 ;
			ptrDst[i] = (SBYTE) ptrSrc[i] ;
			ptrDst[i + 1] = (SBYTE) ptrSrc[i + 1] ;
			i += 2 ;
		}
		if ( nCount > 0 )
		{
			ptrDst[i] = (SBYTE) ptrSrc[i] ;
		}
	}
	else
	{
		int	sc = sizeof(INT) * 8 - m_nChannelDepth ;
		for ( int i = 0; i < nCount; i ++ )
		{
			ptrDst[i] = (ptrSrc[i] << sc) >> sc ;
		}
	}
}

//
// 画像をサンプリングする関数へのポインタを取得する
//////////////////////////////////////////////////////////////////////////////
ERIEncoder::PFUNC_SAMPLING
	ERIEncoder::GetSamplingFunc( DWORD fdwFormatType, DWORD dwBitsPerPixel )
{
	m_nSrcBytesPerPixel = (UINT) dwBitsPerPixel >> 3 ;

	switch ( m_EriInfHdr.fdwFormatType )
	{
	case	ERI_RGB_IMAGE:
		if ( dwBitsPerPixel == 16 )
		{
			return	&ERIEncoder::SamplingRGB16 ;
		}
		else if ( (dwBitsPerPixel == 24)
					|| (dwBitsPerPixel == 32) )
		{
			return	&ERIEncoder::SamplingRGB24 ;
		}
		break ;

	case	ERI_RGBA_IMAGE:
		if ( dwBitsPerPixel == 32 )
			return	&ERIEncoder::SamplingRGBA32 ;
		break ;

	case	ERI_GRAY_IMAGE:
		if ( dwBitsPerPixel == 8 )
			return	&ERIEncoder::SamplingGray8 ;
		break ;
	}
	return	0 ;
}

//
// グレイ画像のサンプリング
//////////////////////////////////////////////////////////////////////////////
void ERIEncoder::SamplingGray8
	( PBYTE ptrSrc, LONG nLineBytes, int nWidth, int nHeight )
{
	PINT	ptrNextBuf = m_ptrBuffer1 ;
	//
	while ( nHeight -- )
	{
		for ( int x = 0; x < nWidth; x ++ )
		{
			ptrNextBuf[x] = ptrSrc[x] ;
		}
		ptrNextBuf += m_nBlockSize ;
		ptrSrc += nLineBytes ;
	}
}

//
// RGB画像(15ビット)のサンプリング
//////////////////////////////////////////////////////////////////////////////
void ERIEncoder::SamplingRGB16
	( PBYTE ptrSrc, LONG nLineBytes, int nWidth, int nHeight )
{
	PBYTE	ptrSrcLine = ptrSrc ;
	PINT	ptrBufLine = m_ptrBuffer1 ;
	LONG	nBlockSamples = (LONG) m_nBlockArea ;
	//
	while ( nHeight -- )
	{
		PINT	ptrNextBuf = ptrBufLine ;
		PWORD	pwSrc = (PWORD) ptrSrcLine ;
		//
		int	i = nWidth ;
		while ( i -- )
		{
			WORD	p = *(pwSrc ++) ;
			*ptrNextBuf = p & 0x1F ;
			ptrNextBuf[nBlockSamples] = (p >> 5) & 0x1F ;
			ptrNextBuf[nBlockSamples * 2] = (p >> 10) & 0x1F ;
			ptrNextBuf ++ ;
		}
		ptrBufLine += m_nBlockSize ;
		ptrSrcLine += nLineBytes ;
	}
}

//
// RGB画像のサンプリング
//////////////////////////////////////////////////////////////////////////////
void ERIEncoder::SamplingRGB24
	( PBYTE ptrSrc, LONG nLineBytes, int nWidth, int nHeight )
{
	PBYTE	ptrSrcLine = ptrSrc ;
	PINT	ptrBufLine = m_ptrBuffer1 ;
	int		nBytesPerPixel = (int) m_nSrcBytesPerPixel ;
	LONG	nBlockSamples = (LONG) m_nBlockArea ;
	//
	while ( nHeight -- )
	{
		PINT	ptrNextBuf = ptrBufLine ;
		ptrSrc = ptrSrcLine ;
		//
		int	i = nWidth ;
		while ( i -- )
		{
			*ptrNextBuf = ptrSrc[0] ;
			ptrNextBuf[nBlockSamples] = ptrSrc[1] ;
			ptrNextBuf[nBlockSamples * 2] = ptrSrc[2] ;
			ptrSrc += nBytesPerPixel ;
			ptrNextBuf ++ ;
		}
		ptrBufLine += m_nBlockSize ;
		ptrSrcLine += nLineBytes ;
	}
}

//
// RGBA画像のサンプリング
//////////////////////////////////////////////////////////////////////////////
void ERIEncoder::SamplingRGBA32
	( PBYTE ptrSrc, LONG nLineBytes, int nWidth, int nHeight )
{
	PBYTE	ptrSrcLine = ptrSrc ;
	PINT	ptrBufLine = m_ptrBuffer1 ;
	int		nBytesPerPixel = (int) m_nSrcBytesPerPixel ;
	LONG	nBlockSamples = (LONG) m_nBlockArea ;
	LONG	nBlockSamplesX3 = nBlockSamples * 3 ;
	//
	while ( nHeight -- )
	{
		PINT	ptrNextBuf = ptrBufLine ;
		ptrSrc = ptrSrcLine ;
		//
		int	i = nWidth ;
		while ( i -- )
		{
			*ptrNextBuf = ptrSrc[0] ;
			ptrNextBuf[nBlockSamples] = ptrSrc[1] ;
			ptrNextBuf[nBlockSamples * 2] = ptrSrc[2] ;
			ptrNextBuf[nBlockSamplesX3] = ptrSrc[3] ;
			ptrSrc += 4 ;
			ptrNextBuf ++ ;
		}
		ptrBufLine += m_nBlockSize ;
		ptrSrcLine += nLineBytes ;
	}
}

//
// サンプリングテーブルの初期化
//////////////////////////////////////////////////////////////////////////////
void ERIEncoder::InitializeZigZagTable( void )
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
int ERIEncoder::EncodeTrueColorImageDCT
	( const RASTER_IMAGE_INFO & imginf,
		RLHEncodeContext & context, DWORD fdwFlags )
{
	//
	// バッファ確保
	BYTE	bytScaleCode[2] ;
	ULONG	nAllBlockCount, nAllSampleCount ;
	PBYTE	ptrNextScaleCode = bytScaleCode ;
	PINT	ptrNextDCCode ;
	SBYTE *	ptrNextDstBuf ;
	if ( !(fdwFlags & ERI_ENCODE_INDEPENDENT_BLOCK) )
	{
		nAllBlockCount = m_nWidthBlocks * m_nHeightBlocks ;
		nAllSampleCount =
			nAllBlockCount * (m_nBlockArea - 1) * m_nBlocksetCount ;
		//
		if ( m_ptrOperations == NULL )
		{
			m_ptrOperations = (PBYTE)
				::eriAllocateMemory( nAllBlockCount * 4 ) ;
		}
		if ( m_ptrTableDC == NULL )
		{
			m_ptrTableDC = (PINT) ::eriAllocateMemory
				( nAllBlockCount * m_nBlocksetCount * sizeof(INT) ) ;
		}
		if ( m_ptrDstBuffer == NULL )
		{
			unsigned int	nBytes = nAllSampleCount * sizeof(SBYTE) ;
			if ( m_EriInfHdr.dwArchitecture != ERI_RUNLENGTH_HUFFMAN )
			{
				nBytes *= sizeof(INT) ;
			}
			m_ptrDstBuffer = (PINT) ::eriAllocateMemory( nBytes ) ;
		}
		ptrNextScaleCode = m_ptrOperations ;
		ptrNextDCCode = m_ptrTableDC ;
		ptrNextDstBuf = (SBYTE*) m_ptrDstBuffer ;
	}
	//
	// コンテキストを初期化
	m_pHuffmanTree->Initialize( ) ;
	if ( m_EriInfHdr.dwArchitecture == ERI_RUNLENGTH_HUFFMAN )
	{
		context.PrepareToEncodeERINACode( ) ;
	}
	//
	// 画像サンプリング関数のアドレスを取得
	m_nSrcBytesPerPixel = (imginf.dwBitsPerPixel >> 3) ;
	PFUNC_SAMPLINGII	pfnSampling =
		GetSamplingFuncII( imginf.fdwFormatType, imginf.dwBitsPerPixel ) ;
	if ( pfnSampling == NULL )
		return	1 ;		// エラー（該当するサンプリング関数が定義されていない）
	//
	// 圧縮開始
	//
	// ERIヘッダを出力
	if ( fdwFlags & ERI_ENCODE_INDEPENDENT_BLOCK )
	{
		context.OutNBits( 0x09000008UL, 32 ) ;
	}
	else
	{
		context.OutNBits( 0x09000108UL, 32 ) ;
	}
	context.OutNBits( 0, 1 ) ;
	//
	// 直流成分係数を出力
	int		nScaleDC =
		::eriRoundR32ToInt( m_parameter.m_rYScaleDC * 256.0F ) - 1 ;
	if ( nScaleDC < 0 )
	{
		nScaleDC = 0 ;
	}
	else if ( nScaleDC > 0xFF )
	{
		nScaleDC = 0xFF ;
	}
	m_parameter.m_rYScaleDC = (nScaleDC + 1) / 256.0F ;
	context.OutNBits( (((DWORD)nScaleDC) << 24), 8 ) ;
	//
	nScaleDC =
		::eriRoundR32ToInt( m_parameter.m_rCScaleDC * 256.0F ) - 1 ;
	if ( nScaleDC < 0 )
	{
		nScaleDC = 0 ;
	}
	else if ( nScaleDC > 0xFF )
	{
		nScaleDC = 0xFF ;
	}
	m_parameter.m_rCScaleDC = (nScaleDC + 1) / 256.0F ;
	context.OutNBits( (((DWORD)nScaleDC) << 24), 8 ) ;
	//
	LONG	i, j ;
	LONG	nPosX, nPosY ;
	LONG	nRestHeight = (LONG) imginf.nImageHeight ;
	//
	for ( nPosY = 0; nPosY < (LONG) m_nHeightBlocks; nPosY ++ )
	{
		//
		// 行の事前処理
		PBYTE	ptrSrcLine =
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
		for ( i = 0; i < (INT) m_nBlocksetCount; i ++ )
		{
			m_nDCDiffBuffer[i] = 0 ;
		}
		//
		for ( nPosX = 0; nPosX < (LONG) m_nWidthBlocks; nPosX ++ )
		{
			//
			// サンプリング準備
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
				m_nBlockSize * m_nSrcBytesPerPixel,
				m_nBlockSize * imginf.BytesPerLine,
				m_nBlockSize * m_nSrcBytesPerPixel
					+ m_nBlockSize * imginf.BytesPerLine
			} ;
			//
			// ブロックをサンプリング
			for ( i = 0; i < 4; i ++ )
			{
				REAL32 *	ptrBuf[4] ;
				for ( j = 0; j < 4; j ++ )
				{
					ptrBuf[j] = m_ptrBuffer3[j][i] ;
				}
				(this->*pfnSampling)
					( ptrBuf, ptrSrcLine + dwOffsetAddr[i],
						imginf.BytesPerLine, widthBlock[i], heightBlock[i] ) ;
			}
			//
			// RGB -> YUV 変換
			ConvertRGBtoYUV( ) ;
			//
			// スケーリング
			(this->*m_pfnBlockScaling)( ) ;
			//
			// DCT 変換を施す
			PerformDCT( ) ;
			//
			// 再配列して量子化を施す
			ArrangeAndQuantumize( ptrNextScaleCode ) ;
			//
			// 直流成分を差分処理
			for ( i = 0; i < (INT) m_nBlocksetCount; i ++ )
			{
				INT		nLastVal = m_ptrBuffer1[i] ;
				m_ptrBuffer1[i] -= m_nDCDiffBuffer[i] ;
				m_nDCDiffBuffer[i] = nLastVal ;
			}
			//
			// 符号化して出力
			if ( fdwFlags & ERI_ENCODE_INDEPENDENT_BLOCK )
			{
				//
				// 直流成分を出力
				if ( context.EncodeGammaCodes
						( m_ptrBuffer1, (int) m_nBlocksetCount )
											< (int) m_nBlocksetCount )
				{
					return	1 ;			// エンコードに失敗
				}
				//
				// 量子化係数を出力
				context.OutAHuffmanCode
					( m_pHuffmanTree, ptrNextScaleCode[0] ) ;
				context.OutAHuffmanCode
					( m_pHuffmanTree, ptrNextScaleCode[1] ) ;
				context.OutAHuffmanCode
					( m_pHuffmanTree, ptrNextScaleCode[2] ) ;
				context.OutAHuffmanCode
					( m_pHuffmanTree, ptrNextScaleCode[3] ) ;
				//
				// 交流成分を出力
				PINT	ptrBuf = m_ptrBuffer1 + m_nBlocksetCount ;
				INT		nACSamples = (m_nBlockArea - 1) * m_nBlocksetCount ;
				if ( m_EriInfHdr.dwArchitecture == ERI_RUNLENGTH_HUFFMAN )
				{
					if ( context.EncodeERINACodes
								( ptrBuf, nACSamples ) < nACSamples )
					{
						return	1 ;			// エンコードに失敗
					}
				}
				else
				{
					if ( context.EncodeGammaCodes
								( ptrBuf, nACSamples ) < nACSamples )
					{
						return	1 ;			// エンコードに失敗
					}
				}
			}
			else
			{
				//
				// 量子化係数ポインタを進める
				ptrNextScaleCode += 4 ;
				//
				// 直流成分を出力
				for ( i = 0; i < (INT) m_nBlocksetCount; i ++ )
				{
					ptrNextDCCode[i] = m_ptrBuffer1[i] ;
				}
				ptrNextDCCode += m_nBlocksetCount ;
				//
				// 交流成分を出力
				PINT	ptrBuf = m_ptrBuffer1 + m_nBlocksetCount ;
				INT		nACSamples = (m_nBlockArea - 1) * m_nBlocksetCount ;
				if ( m_EriInfHdr.dwArchitecture == ERI_RUNLENGTH_HUFFMAN )
				{
					for ( i = 0; i < nACSamples; i ++ )
					{
						ptrNextDstBuf[i] = (SBYTE) ptrBuf[i] ;
					}
					ptrNextDstBuf += nACSamples ;
				}
				else
				{
					PINT	ptrNextDst = (PINT) ptrNextDstBuf ;
					for ( i = 0; i < nACSamples; i ++ )
					{
						ptrNextDst[i] = (SBYTE) ptrBuf[i] ;
					}
					ptrNextDstBuf += nACSamples * sizeof(INT) ;
				}
			}
			//
			// 圧縮の状況を通知
			int	flgContinue = OnEncodedBlock( nPosY, nPosX ) ;
			if ( flgContinue != 0 )
				return	flgContinue ;		// 中断
			//
			ptrSrcLine +=
				(m_nSrcBytesPerPixel << (m_EriInfHdr.dwBlockingDegree + 1)) ;
			nRestWidth -= (LONG) (m_nBlockSize * 2) ;
		}
		//
		nRestHeight -= (LONG) (m_nBlockSize * 2) ;
	}
	//
	// ブロック非独立型の場合、一括圧縮
	if ( !(fdwFlags & ERI_ENCODE_INDEPENDENT_BLOCK) )
	{
		//
		// 直流成分を出力
		INT		nDCSampleCount = nAllBlockCount * m_nBlocksetCount ;
		if ( context.EncodeGammaCodes
				( m_ptrTableDC, nDCSampleCount ) < nDCSampleCount )
		{
			return	1 ;				// エンコードに失敗
		}
		//
		// 交流成分係数を出力
		for ( i = 0; i < (INT) nAllBlockCount * 4; i ++ )
		{
			context.OutAHuffmanCode
				( m_pHuffmanTree, m_ptrOperations[i] ) ;
		}
		//
		// ERINA 符号にエンコード
		if ( m_EriInfHdr.dwArchitecture == ERI_RUNLENGTH_HUFFMAN )
		{
			if ( context.EncodeERINACodesSBZL
				( (SBYTE*) m_ptrDstBuffer, nAllSampleCount ) < (int) nAllSampleCount )
			{
				return	1 ;			// エンコードに失敗
			}
		}
		else
		{
			if ( context.EncodeGammaCodes
				( m_ptrDstBuffer, nAllSampleCount ) < (int) nAllSampleCount )
			{
				return	1 ;			// エンコードに失敗
			}
		}
	}
	//
	if ( context.Flushout( ) )
		return	1 ;
	//
	return	0 ;				// 正常終了
}

//
// 画像をサンプリングする関数へのポインタを取得する
//////////////////////////////////////////////////////////////////////////////
ERIEncoder::PFUNC_SAMPLINGII ERIEncoder::GetSamplingFuncII
	( DWORD fdwFormatType, DWORD dwBitsPerPixel )
{
	if ( (dwBitsPerPixel != 24) && (dwBitsPerPixel != 32) )
	{
		return	NULL ;
	}
	//
	if ( fdwFormatType & ERI_WITH_ALPHA )
	{
		return	&ERIEncoder::SamplingRGBA32II ;
	}
	else
	{
		return	&ERIEncoder::SamplingRGB24II ;
	}
}

//
// RGB画像のサンプリング
//////////////////////////////////////////////////////////////////////////////
void ERIEncoder::SamplingRGB24II
	( REAL32 * ptrBuffer[], PBYTE ptrSrc,
		LONG nLineBytes, int nWidth, int nHeight )
{
	REAL32	rSum[3] =
	{
		0.0F, 0.0F, 0.0F
	} ;
	int		nLineOffset = 0 ;
	int		nBytesPerPixel = m_nSrcBytesPerPixel ;
	PBYTE	ptrSrcLine = ptrSrc ;
	//
	for ( int y = 0; y < nHeight; y ++ )
	{
		int		nOffsetPos = nLineOffset ;
		PBYTE	ptrNextSrc = ptrSrcLine ;
		//
		for ( int x = 0; x < nWidth; x ++ )
		{
			REAL32	rValue[3] ;
			rValue[0] = (REAL32) ptrNextSrc[0] ;
			rValue[1] = (REAL32) ptrNextSrc[1] ;
			rValue[2] = (REAL32) ptrNextSrc[2] ;
			ptrNextSrc += nBytesPerPixel ;
			rSum[0] += rValue[0] ;
			rSum[1] += rValue[1] ;
			rSum[2] += rValue[2] ;
			ptrBuffer[0][nOffsetPos] = rValue[0] ;
			ptrBuffer[1][nOffsetPos] = rValue[1] ;
			ptrBuffer[2][nOffsetPos] = rValue[2] ;
			++ nOffsetPos ;
		}
		//
		nLineOffset += m_nBlockSize ;
		ptrSrcLine += nLineBytes ;
	}
	//
	if ( (nWidth != (int) m_nBlockSize)
			|| (nHeight != (int) m_nBlockSize) )
	{
		if ( nWidth * nHeight != 0 )
		{
			REAL32	rDiv = 1.0F / (nWidth * nHeight) ;
			rSum[0] *= rDiv ;
			rSum[1] *= rDiv ;
			rSum[2] *= rDiv ;
		}
		FillOddArea( ptrBuffer[0], nWidth, nHeight, rSum[0] ) ;
		FillOddArea( ptrBuffer[1], nWidth, nHeight, rSum[1] ) ;
		FillOddArea( ptrBuffer[2], nWidth, nHeight, rSum[2] ) ;
	}
}

//
// RGBA画像のサンプリング
//////////////////////////////////////////////////////////////////////////////
void ERIEncoder::SamplingRGBA32II
	( REAL32 * ptrBuffer[], PBYTE ptrSrc,
		LONG nLineBytes, int nWidth, int nHeight )
{
	REAL32	rSum[4] =
	{
		0.0F, 0.0F, 0.0F, 0.0F
	} ;
	int		nLineOffset = 0 ;
	PBYTE	ptrSrcLine = ptrSrc ;
	//
	for ( int y = 0; y < nHeight; y ++ )
	{
		int		nOffsetPos = nLineOffset ;
		PBYTE	ptrNextSrc = ptrSrcLine ;
		//
		for ( int x = 0; x < nWidth; x ++ )
		{
			REAL32	rValue[4] ;
			rValue[0] = (REAL32) ptrNextSrc[0] ;
			rValue[1] = (REAL32) ptrNextSrc[1] ;
			rValue[2] = (REAL32) ptrNextSrc[2] ;
			rValue[3] = (REAL32) ptrNextSrc[3] ;
			ptrNextSrc += 4 ;
			rSum[0] += rValue[0] ;
			rSum[1] += rValue[1] ;
			rSum[2] += rValue[2] ;
			rSum[3] += rValue[3] ;
			ptrBuffer[0][nOffsetPos] = rValue[0] ;
			ptrBuffer[1][nOffsetPos] = rValue[1] ;
			ptrBuffer[2][nOffsetPos] = rValue[2] ;
			ptrBuffer[3][nOffsetPos] = rValue[3] ;
			++ nOffsetPos ;
		}
		//
		nLineOffset += m_nBlockSize ;
		ptrSrcLine += nLineBytes ;
	}
	//
	if ( (nWidth != (int) m_nBlockSize)
			|| (nHeight != (int) m_nBlockSize) )
	{
		if ( nWidth * nHeight != 0 )
		{
			REAL32	rDiv = 1.0F / (nWidth * nHeight) ;
			rSum[0] *= rDiv ;
			rSum[1] *= rDiv ;
			rSum[2] *= rDiv ;
			rSum[3] *= rDiv ;
		}
		FillOddArea( ptrBuffer[0], nWidth, nHeight, rSum[0] ) ;
		FillOddArea( ptrBuffer[1], nWidth, nHeight, rSum[1] ) ;
		FillOddArea( ptrBuffer[2], nWidth, nHeight, rSum[2] ) ;
		FillOddArea( ptrBuffer[3], nWidth, nHeight, rSum[3] ) ;
	}
}

//
// 半端領域に指定値を設定
//////////////////////////////////////////////////////////////////////////////
void ERIEncoder::FillOddArea
	( REAL32 * ptrBuffer, int nWidth, int nHeight, REAL32 rFill )
{
	REAL32 *	ptrLineBuf = ptrBuffer ;
	int		x, y ;
	for ( y = 0; y < nHeight; y ++ )
	{
		for ( x = nWidth; x < (int) m_nBlockSize; x ++ )
		{
			ptrLineBuf[x] = rFill ;
		}
		ptrLineBuf += m_nBlockSize ;
	}
	for ( y = nHeight; y < (int) m_nBlockSize; y ++ )
	{
		for ( x = 0; x < (int) m_nBlockSize; x ++ )
		{
			ptrLineBuf[x] = rFill ;
		}
		ptrLineBuf += m_nBlockSize ;
	}
}

//
// RGB -> YUV 変換関数
//////////////////////////////////////////////////////////////////////////////
void ERIEncoder::ConvertRGBtoYUV( void )
{
	static const double	rMatrixRGB2YUV[3][3] =
	{
		{
			7.0 / 24.0,		7.0 / 12.0,		1.0 / 8.0
		},
		{
			-1.0 / 6.0,		-1.0 / 3.0,		1.0 / 2.0
		},
		{
			17.0 / 36.0,	-7.0 / 18.0,	-1.0 / 12.0
		}
	} ;
	for ( int i = 0; i < 4; i ++ )
	{
		for ( int j = 0; j < (int) m_nBlockArea; j ++ )
		{
			REAL32	rSample[3] ;
			rSample[0] = m_ptrBuffer3[0][i][j] ;
			rSample[1] = m_ptrBuffer3[1][i][j] ;
			rSample[2] = m_ptrBuffer3[2][i][j] ;
			m_ptrBuffer3[0][i][j] =
				(REAL32)(rMatrixRGB2YUV[0][0] * rSample[0]
						+ rMatrixRGB2YUV[0][1] * rSample[1]
						+ rMatrixRGB2YUV[0][2] * rSample[2]) ;
			m_ptrBuffer3[1][i][j] =
				(REAL32)(rMatrixRGB2YUV[1][0] * rSample[0]
						+ rMatrixRGB2YUV[1][1] * rSample[1]
						+ rMatrixRGB2YUV[1][2] * rSample[2]) ;
			m_ptrBuffer3[2][i][j] =
				(REAL32)(rMatrixRGB2YUV[2][0] * rSample[0]
						+ rMatrixRGB2YUV[2][1] * rSample[1]
						+ rMatrixRGB2YUV[2][2] * rSample[2]) ;
		}
	}
}

//
// 4:4:4 スケーリング
//////////////////////////////////////////////////////////////////////////////
void ERIEncoder::BlockScaling444( void )
{
	//
	// 全チャネルをコピー
	for ( int i = 0; i < (int) m_nChannelCount; i ++ )
	{
		for ( int j = 0; j < 4; j ++ )
		{
			REAL32 *	ptrSrc = m_ptrBuffer3[i][j] ;
			REAL32 *	ptrDst = m_ptrBuffer4[i * 4 + j] ;
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
void ERIEncoder::BlockScaling422( void )
{
	int		i, j, k, l, m ;
	REAL32 *	ptrSrc ;
	REAL32 *	ptrDst ;
	//
	// 輝度成分をコピー
	for ( i = 0; i < 4; i ++ )
	{
		ptrSrc = m_ptrBuffer3[0][i] ;
		ptrDst = m_ptrBuffer4[i] ;
		//
		for ( j = 0; j < (int) m_nBlockArea; j ++ )
		{
			ptrDst[j] = ptrSrc[j] ;
		}
	}
	//
	// 色差成分を垂直方向に圧縮
	for ( i = 0; i < 2; i ++ )
	{
		for ( j = 0; j < 2; j ++ )
		{
			ptrDst = m_ptrBuffer4[4 + i * 2 + j] ;
			//
			for ( k = 0; k < 2; k ++ )
			{
				ptrSrc = m_ptrBuffer3[i + 1][j * 2 + k] ;
				//
				int		nHalfHeight = (int) m_nBlockSize >> 1 ;
				for ( l = 0; l < nHalfHeight; l ++ )
				{
					REAL32 *	ptrUnderSrc = ptrSrc + m_nBlockSize ;
					for ( m = 0; m < (int) m_nBlockSize; m ++ )
					{
						ptrDst[m] =
							(REAL32)((ptrSrc[m] + ptrUnderSrc[m]) * 0.5) ;
					}
					ptrDst += m_nBlockSize ;
					ptrSrc = ptrUnderSrc + m_nBlockSize ;
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
			ptrSrc = m_ptrBuffer3[3][i] ;
			ptrDst = m_ptrBuffer4[8 + i] ;
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
void ERIEncoder::BlockScaling411( void )
{
	int		i, j, k, l ;
	REAL32 *	ptrSrc ;
	REAL32 *	ptrDst ;
	//
	// 輝度成分をコピー
	for ( i = 0; i < 4; i ++ )
	{
		ptrSrc = m_ptrBuffer3[0][i] ;
		ptrDst = m_ptrBuffer4[i] ;
		//
		for ( j = 0; j < (int) m_nBlockArea; j ++ )
		{
			ptrDst[j] = ptrSrc[j] ;
		}
	}
	//
	// 色差成分を垂直水平方向に圧縮
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
			ptrDst = m_ptrBuffer4[4 + i] + dwOffset[j] ;
			ptrSrc = m_ptrBuffer3[i + 1][j] ;
			//
			int		nHalfWidth = (int) m_nBlockSize >> 1 ;
			for ( k = 0; k < nHalfWidth; k ++ )
			{
				REAL32 *	ptrUnderSrc = ptrSrc + m_nBlockSize ;
				for ( l = 0; l < nHalfWidth; l ++ )
				{
					ptrDst[l] =
						(REAL32)((ptrSrc[l * 2]
								+ ptrSrc[l * 2 + 1]
								+ ptrUnderSrc[l * 2]
								+ ptrUnderSrc[l * 2 + 1]) * 0.25) ;
				}
				ptrDst += m_nBlockSize ;
				ptrSrc = ptrUnderSrc + m_nBlockSize ;
			}
		}
	}
	//
	// アルファチャネルをコピー
	if ( m_nChannelCount == 4 )
	{
		for ( i = 0; i < 4; i ++ )
		{
			ptrSrc = m_ptrBuffer3[3][i] ;
			ptrDst = m_ptrBuffer4[6 + i] ;
			//
			for ( j = 0; j < (int) m_nBlockArea; j ++ )
			{
				ptrDst[j] = ptrSrc[j] ;
			}
		}
	}
}

//
// DCT 変換を施す
//////////////////////////////////////////////////////////////////////////////
void ERIEncoder::PerformDCT( void )
{
	int		i, j ;
	REAL32	rMatrixScale = (REAL32) ( 2.0 / (LONG) m_nBlockSize ) ;
	//
	for ( i = 0; i < (int) m_nBlocksetCount; i ++ )
	{
		::eriSquareDCT
			( m_ptrBuffer5[i], m_ptrBuffer4[i],
				m_EriInfHdr.dwBlockingDegree,
				m_ptrWorkDCT1, m_ptrWorkDCT2 ) ;
		//
		for ( j = 0; j < (int) m_nBlockArea; j ++ )
		{
			m_ptrBuffer5[i][j] *= rMatrixScale ;
		}
	}
}

//
// 量子化を施す
//////////////////////////////////////////////////////////////////////////////
void ERIEncoder::ArrangeAndQuantumize( BYTE bytCoefficient[] )
{
	int		i, j ;
	REAL32	scale[16] ;
	PINT	pArrange = m_pArrangeTable[0] ;
	//
	// ジグザグ走査してインターリーブ
	REAL32 *	ptrDst = m_ptrBuffer4[0] ;
	for ( i = 0; i < (int) m_nBlockArea; i ++ )
	{
		int		iOffset = pArrange[i] ;
		//
		for ( j = 0; j < (int) m_nBlocksetCount; j ++ )
		{
			*(ptrDst ++) = m_ptrBuffer5[j][iOffset] ;
		}
	}
	//
	// 直流成分の量子化係数を取得
	int		c_count = 12 ;
	if ( m_EriInfHdr.dwSamplingFlags == ERISF_YUV_4_2_2 )
	{
		c_count = 8 ;
	}
	else if ( m_EriInfHdr.dwSamplingFlags == ERISF_YUV_4_1_1 )
	{
		c_count = 6 ;
	}
	scale[0] = scale[1] = scale[2] = scale[3] = m_parameter.m_rYScaleDC ;
	for ( i = 4; i < c_count; i ++ )
	{
		scale[i] = m_parameter.m_rCScaleDC ;
	}
	for ( ; i < (int) m_nBlocksetCount; i ++ )
	{
		scale[i] = m_parameter.m_rYScaleDC ;
	}
	//
	// 直流成分を量子化
	REAL32 *	ptrSrc = m_ptrBuffer4[0] ;
	PINT	ptrQuantumized = m_ptrBuffer1 ;
	int		count = (int) m_nBlocksetCount ;
	for ( i = 0; i < count; i ++ )
	{
		*(ptrQuantumized ++) =
			::eriRoundR32ToInt( scale[i] * *(ptrSrc ++) ) ;
	}
	//
	// 交流低周波成分の量子化係数を算出
	count =
		(int) (((m_nBlockSize - 1)
			* m_nBlockSize / 2 - 1) * m_nBlocksetCount) ;
	REAL32	rMax = 0.0 ;
	for ( i = 0; i < count; i ++ )
	{
		REAL32	rAbsSource = ptrSrc[i] ;
		if ( rAbsSource < 0.0 )
		{
			rAbsSource = - rAbsSource ;
		}
		if ( rAbsSource > rMax )
		{
			rMax = rAbsSource ;
		}
	}
	//
	REAL32	rYScale = m_parameter.m_rYScaleLow ;
	if ( rYScale * rMax >= 127.0 )
	{
		rYScale = 127.0F / rMax ;
	}
	int		nFixedScale = ::eriRoundR32ToInt( rYScale * 256.0F ) - 1 ;
	if ( nFixedScale < 0 )
	{
		nFixedScale = 0 ;
	}
	else if ( nFixedScale >= 0x100 )
	{
		nFixedScale = 0xFF ;
	}
	bytCoefficient[0] = (BYTE) nFixedScale ;
	rYScale = (REAL32) ((nFixedScale + 1) / 256.0) ;
	//
	REAL32	rCScale = m_parameter.m_rCScaleLow ;
	if ( rCScale * rMax >= 127.0 )
	{
		rCScale = 127.0F / rMax ;
	}
	nFixedScale = ::eriRoundR32ToInt( rCScale * 256.0F ) - 1 ;
	if ( nFixedScale < 0 )
	{
		nFixedScale = 0 ;
	}
	else if ( nFixedScale >= 0x100 )
	{
		nFixedScale = 0xFF ;
	}
	bytCoefficient[1] = (BYTE) nFixedScale ;
	rCScale = (REAL32) ((nFixedScale + 1) / 256.0) ;
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
	// 交流低周波成分を量子化
	int		nQuantumized ;
	count = ((m_nBlockSize - 1) * m_nBlockSize / 2 - 1) ;
	for ( i = 0; i < count; i ++ )
	{
		for ( j = 0; j < (int) m_nBlocksetCount; j ++ )
		{
			nQuantumized = ::eriRoundR32ToInt( scale[j] * *(ptrSrc ++) ) ;
			if ( nQuantumized < -128 )
			{
				nQuantumized = -128 ;
			}
			else if ( nQuantumized > 127 )
			{
				nQuantumized = 127 ;
			}
			if ( abs( nQuantumized ) <= m_parameter.m_nLowThreshold )
			{
				nQuantumized = 0 ;
			}
			*(ptrQuantumized ++) = nQuantumized ;
		}
	}
	//
	// 交流高周波成分の量子化係数を算出
	count = (int) ((m_nBlockSize
					* (m_nBlockSize + 1) / 2) * m_nBlocksetCount) ;
	rMax = 0.0 ;
	for ( i = 0; i < count; i ++ )
	{
		REAL32	rAbsSource = ptrSrc[i] ;
		if ( rAbsSource < 0.0 )
		{
			rAbsSource = - rAbsSource ;
		}
		if ( rAbsSource > rMax )
		{
			rMax = rAbsSource ;
		}
	}
	//
	rYScale = m_parameter.m_rYScaleHigh ;
	if ( rYScale * rMax >= 127.0 )
	{
		rYScale = 127.0F / rMax ;
	}
	nFixedScale = ::eriRoundR32ToInt( rYScale * 256.0F ) - 1 ;
	if ( nFixedScale < 0 )
	{
		nFixedScale = 0 ;
	}
	else if ( nFixedScale >= 0x100 )
	{
		nFixedScale = 0xFF ;
	}
	bytCoefficient[2] = (BYTE) nFixedScale ;
	rYScale = (REAL32) ((nFixedScale + 1) / 256.0) ;
	//
	rCScale = m_parameter.m_rCScaleHigh ;
	if ( rCScale * rMax >= 127.0 )
	{
		rCScale = 127.0F / rMax ;
	}
	nFixedScale = ::eriRoundR32ToInt( rCScale * 256.0F ) - 1 ;
	if ( nFixedScale < 0 )
	{
		nFixedScale = 0 ;
	}
	else if ( nFixedScale >= 0x100 )
	{
		nFixedScale = 0xFF ;
	}
	bytCoefficient[3] = (BYTE) nFixedScale ;
	rCScale = (REAL32) ((nFixedScale + 1) / 256.0) ;
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
	// 交流高周波成分を量子化
	count = (m_nBlockSize * (m_nBlockSize + 1) / 2) ;
	for ( i = 0; i < count; i ++ )
	{
		for ( j = 0; j < (int) m_nBlocksetCount; j ++ )
		{
			nQuantumized = ::eriRoundR32ToInt( scale[j] * *(ptrSrc ++) ) ;
			if ( nQuantumized < -128 )
			{
				nQuantumized = -128 ;
			}
			else if ( nQuantumized > 127 )
			{
				nQuantumized = 127 ;
			}
			if ( abs( nQuantumized ) <= m_parameter.m_nHighThreshold )
			{
				nQuantumized = 0 ;
			}
			*(ptrQuantumized ++) = nQuantumized ;
		}
	}
}

//
// 展開進行状況通知関数
//////////////////////////////////////////////////////////////////////////////
int ERIEncoder::OnEncodedBlock( LONG line, LONG column )
{
	return	0 ;
}

int ERIEncoder::OnEncodedLine( LONG line )
{
	return	0 ;
}


/*****************************************************************************
                     ファイルストリームコンテキスト
 *****************************************************************************/

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
EFileEncodeContext::EFileEncodeContext
		( EWriteFileObj * pFileObj, ULONG nBufferingSize )
	: RLHEncodeContext( nBufferingSize ), m_pFileObj( pFileObj )
{
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
EFileEncodeContext::~EFileEncodeContext( void )
{
}

//
// 次のデータを書き出す
//////////////////////////////////////////////////////////////////////////////
ULONG EFileEncodeContext::WriteNextData
	( const BYTE * ptrBuffer, ULONG nBytes )
{
	return	m_pFileObj->Write( ptrBuffer, nBytes ) ;
}

//
// ファイルオブジェクトを設定する
//////////////////////////////////////////////////////////////////////////////
void EFileEncodeContext::AttachFileObject( EWriteFileObj * pFileObj )
{
	m_pFileObj = pFileObj ;
}

