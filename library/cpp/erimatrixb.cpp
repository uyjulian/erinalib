
/*****************************************************************************
                         E R I N A - L i b r a r y
                                                      最終更新 2001/11/04
 ----------------------------------------------------------------------------
         Copyright (C) 2000-2001 Leshade Entis. All rights reserved.
 *****************************************************************************/


#define	STRICT	1
#include <windows.h>
#include <math.h>


//
// ERINA ライブラリ定義ファイル
//////////////////////////////////////////////////////////////////////////////

#include "eritypes.h"
#include "erinalib.h"
#include "erimatrix.h"


//
// 定数テーブル
//////////////////////////////////////////////////////////////////////////////

static double	ERI_PI = 3.141592653589 ;	// = π
static REAL32	ERI_rHalf = 0.5F ;			// = 1/2
static REAL32	ERI_r2 = 2.0F ;				// = 2.0
static REAL32	ERI_rCosPI4 ;				// = cos(pi/4)
static REAL32	ERI_r2CosPI4 ;				// = 2*cos(pi/4)

//
// 行列係数配列 : k(n,i) = cos( (2*i+1) / (4*n) )
//
static REAL32	ERI_DCTofK2[2] ;			// = cos( (2*i+1) / 8 )
static REAL32	ERI_DCTofK4[4] ;			// = cos( (2*i+1) / 16 )
static REAL32	ERI_DCTofK8[8] ;			// = cos( (2*i+1) / 32 )
static REAL32	ERI_DCTofK16[16] ;			// = cos( (2*i+1) / 64 )
static REAL32	ERI_DCTofK32[32] ;			// = cos( (2*i+1) / 128 )
static REAL32	ERI_DCTofK64[64] ;			// = cos( (2*i+1) / 256 )
static REAL32	ERI_DCTofK128[128] ;		// = cos( (2*i+1) / 512 )
static REAL32	ERI_DCTofK256[256] ;		// = cos( (2*i+1) / 1024 )
static REAL32	ERI_DCTofK512[512] ;		// = cos( (2*i+1) / 2048 )
static REAL32	ERI_DCTofK1024[1024] ;		// = cos( (2*i+1) / 4096 )
static REAL32	ERI_DCTofK2048[2048] ;		// = cos( (2*i+1) / 8192 )

//
// 行列係数配列へのテーブル
//
static REAL32 *	ERI_pMatrixDCTofK[MAX_DCT_DEGREE] =
{
	NULL,
	ERI_DCTofK2,
	ERI_DCTofK4,
	ERI_DCTofK8,
	ERI_DCTofK16,
	ERI_DCTofK32,
	ERI_DCTofK64,
	ERI_DCTofK128,
	ERI_DCTofK256,
	ERI_DCTofK512,
	ERI_DCTofK1024,
	ERI_DCTofK2048
} ;


//
// 行列テーブルの初期化
//////////////////////////////////////////////////////////////////////////////
void eriInitializeMatrixDCT( void )
{
	//
	// 特殊条件の定数を準備
	//
	ERI_rCosPI4 = (REAL32) cos( ERI_PI * 0.25 ) ;
	ERI_r2CosPI4 = 2.0F * ERI_rCosPI4 ;
	//
	// 行列係数配列初期化
	//
	for ( int i = 1; i < MAX_DCT_DEGREE; i ++ )
	{
		int			n = (1 << i) ;
		REAL32 *	pDCTofK = ERI_pMatrixDCTofK[i] ;
		double		nr = ERI_PI / (4.0 * n) ;
		double		dr = nr + nr ;
		double		ir = nr ;
		//
		for ( int j = 0; j < n; j ++ )
		{
			pDCTofK[j] = (REAL32) cos( ir ) ;
			ir += dr ;
		}
	}
}


//
// 実数丸め関数
//////////////////////////////////////////////////////////////////////////////
int eriRoundR32ToInt( REAL32 r )
{
#if	defined(ERI_INTEL_X86)
	int		n ;
	__asm
	{
		fld		r
		fistp	n
	}
	return	n ;
#else
	if ( r >= 0.0 )
	{
		return	(int) floor( r + 0.5 ) ;
	}
	else
	{
		return	(int) ceil( r - 0.5 ) ;
	}
#endif
}

INT64 eriRoundR32ToInt( REAL64 r )
{
#if	defined(ERI_INTEL_X86)
	INT64	n ;
	__asm
	{
		fld		r
		fistp	n
	}
	return	n ;
#else
	if ( r >= 0.0 )
	{
		return	(INT64) floor( r + 0.5 ) ;
	}
	else
	{
		return	(INT64) ceil( r - 0.5 ) ;
	}
#endif
}

void eriRoundR32ToWordArray
	( SWORD * ptrDst, int nStep, const REAL32 * ptrSrc, int nCount )
{
	for ( int i = 0; i < nCount; i ++ )
	{
		int		nValue = ::eriRoundR32ToInt( ptrSrc[i] ) ;
		if ( nValue <= -0x8000 )
		{
			*ptrDst = -0x8000 ;
		}
		else if ( nValue >= 0x7FFF )
		{
			*ptrDst = 0x7FFF ;
		}
		else
		{
			*ptrDst = (SWORD) nValue ;
		}
		ptrDst += nStep ;
	}
}


//
// スカラ乗算
//////////////////////////////////////////////////////////////////////////////
void eriScalarMultiply
	(
		REAL32 *		ptrDst,
		REAL32			rScalar,
		unsigned int	nCount
	)
{
	for ( unsigned int i = 0; i < nCount; i ++ )
	{
		ptrDst[i] *= rScalar ;
	}
}


//
// 高速 DCT 変換
//////////////////////////////////////////////////////////////////////////////
bool eriFastDCT
	(
		REAL32 *		ptrDst,
		unsigned int	nDstInterval,
		REAL32 *		ptrSrc,
		REAL32 *		ptrWorkBuf,
		unsigned int	nDegreeDCT
	)
{
	//
	// DCT 次数検証
	//
	if ( (nDegreeDCT < MIN_DCT_DEGREE)
			|| (nDegreeDCT > MAX_DCT_DEGREE) )
	{
		return	false ;
	}
	if ( nDegreeDCT == MIN_DCT_DEGREE )
	{
		//
		// 4次 DCT の時は特殊条件
		//////////////////////////////////////////////////////////////////////
		REAL32	r32Buf[4] ;
		//
		// 交差加減算
		//
		r32Buf[0] = ptrSrc[0] + ptrSrc[3] ;
		r32Buf[2] = ptrSrc[0] - ptrSrc[3] ;
		r32Buf[1] = ptrSrc[1] + ptrSrc[2] ;
		r32Buf[3] = ptrSrc[1] - ptrSrc[2] ;
		//
		// 前半 : A2 * DCT2
		//
		ptrDst[0]                = ERI_rHalf * (r32Buf[0] + r32Buf[1]) ;
		ptrDst[nDstInterval * 2] = ERI_rCosPI4 * (r32Buf[0] - r32Buf[1]) ;
		//
		// 後半 : R2 * 2 * A2 * DCT2 * K2
		//
		r32Buf[2] = ERI_DCTofK2[0] * r32Buf[2] ;
		r32Buf[3] = ERI_DCTofK2[1] * r32Buf[3] ;
		//
		r32Buf[0] =                 r32Buf[2] + r32Buf[3] ;
		r32Buf[1] = ERI_r2CosPI4 * (r32Buf[2] - r32Buf[3]) ;
		//
		r32Buf[1] -= r32Buf[0] ;
		//
		ptrDst[nDstInterval]     = r32Buf[0] ;
		ptrDst[nDstInterval * 3] = r32Buf[1] ;
		//
		return	true ;
	}
	else
	{
		//
		// 汎用 DCT 変換
		//////////////////////////////////////////////////////////////////////
		//              | I   J |
		// 交差加減算 = |       |
		//              | I  -J |
		unsigned int	i ;
		unsigned int	nDegreeNum = (1 << nDegreeDCT) ;
		unsigned int	nHalfDegree = (nDegreeNum >> 1) ;
		for ( i = 0; i < nHalfDegree; i ++ )
		{
			ptrWorkBuf[i] = ptrSrc[i] + ptrSrc[nDegreeNum - i - 1] ;
			ptrWorkBuf[i + nHalfDegree] =
							ptrSrc[i] - ptrSrc[nDegreeNum - i - 1] ;
		}
		//
		// 前半 DCT : A * DCT
		//
		unsigned int	nDstStep = (nDstInterval << 1) ;
		eriFastDCT( ptrDst, nDstStep,
					ptrWorkBuf, ptrSrc, (nDegreeDCT - 1) ) ;
		//
		// 後半 DCT-IV : R * 2 * A * DCT * K
		//
		REAL32 *	pDCTofK = ERI_pMatrixDCTofK[nDegreeDCT - 1] ;
		ptrSrc = ptrWorkBuf + nHalfDegree ;
		ptrDst += nDstInterval ;
		//
		for ( i = 0; i < nHalfDegree; i ++ )
		{
			ptrSrc[i] *= pDCTofK[i] ;
		}
		//
		eriFastDCT( ptrDst, nDstStep,
					ptrSrc, ptrWorkBuf, (nDegreeDCT - 1) ) ;
		//
		REAL32 *	ptrNext = ptrDst ;
		for ( i = 0; i < nHalfDegree; i ++ )
		{
			*ptrNext += *ptrNext ;
			ptrNext += nDstStep ;
		}
		//
		ptrNext = ptrDst ;
		for ( i = 1; i < nHalfDegree; i ++ )
		{
			ptrNext[nDstStep] -= *ptrNext ;
			ptrNext += nDstStep ;
		}
		//
		return	true ;
	}
}


//
// 高速 IDCT 変換
//////////////////////////////////////////////////////////////////////////////
bool eriFastIDCT
	(
		REAL32 *		ptrDst,
		REAL32 *		ptrSrc,
		unsigned int	nSrcInterval,
		REAL32 *		ptrWorkBuf,
		unsigned int	nDegreeDCT
	)
{
	//
	// DCT 次数検証
	//
	if ( (nDegreeDCT < MIN_DCT_DEGREE)
			|| (nDegreeDCT > MAX_DCT_DEGREE) )
	{
		return	false ;
	}
	if ( nDegreeDCT == MIN_DCT_DEGREE )
	{
		//
		// 4次 DCT の時は特殊条件
		//////////////////////////////////////////////////////////////////////
		REAL32	r32Buf1[2] ;
		REAL32	r32Buf2[4] ;
		//
		// 偶数行 : IDCT2
		//
		r32Buf1[0] = ptrSrc[0] ;
		r32Buf1[1] = ERI_rCosPI4 * ptrSrc[nSrcInterval * 2] ;
		//
		r32Buf2[0] = r32Buf1[0] + r32Buf1[1] ;
		r32Buf2[1] = r32Buf1[0] - r32Buf1[1] ;
		//
		// 奇数行 : R * 2 * A * DCT * K
		//
		r32Buf1[0] = ERI_DCTofK2[0] * ptrSrc[nSrcInterval] ;
		r32Buf1[1] = ERI_DCTofK2[1] * ptrSrc[nSrcInterval * 3] ;
		//
		r32Buf2[2] =                 r32Buf1[0] + r32Buf1[1] ;
		r32Buf2[3] = ERI_r2CosPI4 * (r32Buf1[0] - r32Buf1[1]) ;
		//
		r32Buf2[3] -= r32Buf2[2] ;
		//
		// 交差加減算
		//
		ptrDst[0] = r32Buf2[0] + r32Buf2[2] ;
		ptrDst[3] = r32Buf2[0] - r32Buf2[2] ;
		ptrDst[1] = r32Buf2[1] + r32Buf2[3] ;
		ptrDst[2] = r32Buf2[1] - r32Buf2[3] ;
		//
		return	true ;
	}
	else
	{
		//
		// 汎用 IDCT 変換
		//////////////////////////////////////////////////////////////////////
		//
		// 偶数行 : IDCT
		//
		unsigned int	i ;
		unsigned int	nDegreeNum = (1 << nDegreeDCT) ;
		unsigned int	nHalfDegree = (nDegreeNum >> 1) ;
		unsigned int	nSrcStep = (nSrcInterval << 1) ;
		eriFastIDCT( ptrDst, ptrSrc,
					nSrcStep, ptrWorkBuf, (nDegreeDCT - 1) ) ;
		//
		// 奇数行 : R * 2 * A * DCT * K
		//
		REAL32 *	pDCTofK = ERI_pMatrixDCTofK[nDegreeDCT - 1] ;
		REAL32 *	pOddSrc = ptrSrc + nSrcInterval ;
		REAL32 *	pOddDst = ptrDst + nHalfDegree ;
		//
		REAL32 *	ptrNext = pOddSrc ;
		for ( i = 0; i < nHalfDegree; i ++ )
		{
			ptrWorkBuf[i] = *ptrNext * pDCTofK[i] ;
			ptrNext += nSrcStep ;
		}
		//
		eriFastDCT( pOddDst, 1, ptrWorkBuf,
					(ptrWorkBuf + nHalfDegree), (nDegreeDCT - 1) ) ;
		//
		for ( i = 0; i < nHalfDegree; i ++ )
		{
			pOddDst[i] += pOddDst[i] ;
		}
		//
		for ( i = 1; i < nHalfDegree; i ++ )
		{
			pOddDst[i] -= pOddDst[i - 1] ;
		}
		//              | I   I |
		// 交差加減算 = |       |
		//              | J  -J |
		REAL32			r32Buf[4] ;
		unsigned int	nQuadDegree = (nHalfDegree >> 1) ;
		for ( i = 0; i < nQuadDegree; i ++ )
		{
			r32Buf[0] = ptrDst[i] + ptrDst[nHalfDegree + i] ;
			r32Buf[3] = ptrDst[i] - ptrDst[nHalfDegree + i] ;
			r32Buf[1] =
				ptrDst[nHalfDegree - 1 - i] + ptrDst[nDegreeNum - 1 - i] ;
			r32Buf[2] =
				ptrDst[nHalfDegree - 1 - i] - ptrDst[nDegreeNum - 1 - i] ;
			//
			ptrDst[i]                   = r32Buf[0] ;
			ptrDst[nHalfDegree - 1 - i] = r32Buf[1] ;
			ptrDst[nHalfDegree + i]     = r32Buf[2] ;
			ptrDst[nDegreeNum - 1 - i]  = r32Buf[3] ;
		}
		//
		return	true ;
	}
}


//
// 高速２次元 DCT 変換
//////////////////////////////////////////////////////////////////////////////
void eriSquareDCT
	(
		REAL32 *		ptrDst,
		REAL32 *		ptrSrc,
		unsigned int	nDegreeDCT,
		REAL32 *		ptrWorkBuf1,
		REAL32 *		ptrWorkBuf2
	)
{
	unsigned int	i ;
	unsigned int	nDegreeNum = (1 << nDegreeDCT) ;
	//
	REAL32 *	ptrTempBuf = ptrWorkBuf1 ;
	for ( i = 0; i < nDegreeNum; i ++ )
	{
		eriFastDCT
			( ptrTempBuf, nDegreeNum,
				ptrSrc, ptrWorkBuf2, nDegreeDCT ) ;
		ptrTempBuf ++ ;
		ptrSrc += nDegreeNum ;
	}
	//
	ptrTempBuf = ptrWorkBuf1 ;
	for ( i = 0; i < nDegreeNum; i ++ )
	{
		eriFastDCT
			( ptrDst, nDegreeNum,
				ptrTempBuf, ptrWorkBuf2, nDegreeDCT ) ;
		ptrDst ++ ;
		ptrTempBuf += nDegreeNum ;
	}
}


//
// 高速２次元 IDCT 変換
//////////////////////////////////////////////////////////////////////////////
void eriSquareIDCT
	(
		REAL32 *		ptrDst,
		REAL32 *		ptrSrc,
		unsigned int	nDegreeDCT,
		REAL32 *		ptrWorkBuf1,
		REAL32 *		ptrWorkBuf2
	)
{
	unsigned int	i ;
	unsigned int	nDegreeNum = (1 << nDegreeDCT) ;
	//
	REAL32 *	ptrTempBuf = ptrWorkBuf1 ;
	for ( i = 0; i < nDegreeNum; i ++ )
	{
		eriFastIDCT
			( ptrTempBuf, ptrSrc,
				nDegreeNum, ptrWorkBuf2, nDegreeDCT ) ;
		ptrTempBuf += nDegreeNum ;
		ptrSrc ++ ;
	}
	//
	ptrTempBuf = ptrWorkBuf1 ;
	for ( i = 0; i < nDegreeNum; i ++ )
	{
		eriFastIDCT
			( ptrDst, ptrTempBuf,
				nDegreeNum, ptrWorkBuf2, nDegreeDCT ) ;
		ptrDst += nDegreeNum ;
		ptrTempBuf ++ ;
	}
}

