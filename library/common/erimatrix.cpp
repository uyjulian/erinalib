
/*****************************************************************************
                         E R I N A - L i b r a r y
                                                      ç≈èIçXêV 2001/11/04
 ----------------------------------------------------------------------------
         Copyright (C) 2000-2001 Leshade Entis. All rights reserved.
 *****************************************************************************/


#define	STRICT	1
#include <windows.h>
#include <math.h>


//
// ERINA ÉâÉCÉuÉâÉäíËã`ÉtÉ@ÉCÉã
//////////////////////////////////////////////////////////////////////////////

#include "eritypes.h"
#include "erinalib.h"
#include "erimatrix.h"


//
// íËêîÉeÅ[ÉuÉã
//////////////////////////////////////////////////////////////////////////////

static double	ERI_PI = 3.141592653589 ;	// = ÉŒ
static REAL32	ERI_rHalf = 0.5F ;			// = 1/2


//
// 2x2 âÒì]çsóÒ
//////////////////////////////////////////////////////////////////////////////
void eriRevolve2x2
	( REAL32 * ptrBuf1, REAL32 * ptrBuf2,
		REAL32 rSin, REAL32 rCos,
		unsigned int nStep, unsigned int nCount )
{
	unsigned int	i ;
	for ( i = 0; i < nCount; i ++ )
	{
		REAL32	r1 = *ptrBuf1 ;
		REAL32	r2 = *ptrBuf2 ;
		//
		REAL32	R1 = r1 * rCos - r2 * rSin ;
		REAL32	R2 = r1 * rSin + r2 * rCos ;
		//
		*ptrBuf1 = R1 ;
		*ptrBuf2 = R2 ;
		//
		ptrBuf1 += nStep ;
		ptrBuf2 += nStep ;
	}
}

//
// LOT ïœä∑ópâÒì]ÉpÉâÉÅÅ[É^Çê∂ê¨Ç∑ÇÈ
//////////////////////////////////////////////////////////////////////////////
SIN_COS * eriCreateRevolveParameter
	(
		unsigned int nDegreeDCT
	)
{
	signed int	i, nDegreeNum ;
	nDegreeNum = 1 << nDegreeDCT ;
	//
	signed int	lc = 1, n = nDegreeNum / 2 ;
	while ( n >= 8 )
	{
		n /= 8 ;
		++ lc ;
	}
	SIN_COS *	ptrRevolve = (SIN_COS*)
		::eriAllocateMemory( lc * 8 * sizeof(SIN_COS) ) ;
	//
	double	k = ERI_PI / (nDegreeNum * 2) ;
	SIN_COS *	ptrNextRev = ptrRevolve ;
	signed int	nStep = 2 ;
	do
	{
		for ( i = 0; i < 7; i ++ )
		{
			double	ws = 1.0 ;
			double	a = 0.0 ;
			for ( signed int j = 0; j < i; j ++ )
			{
				a += nStep ;
				ws = ws * ptrNextRev[j].rSin
					+ ptrNextRev[j].rCos * cos( a * k ) ;
			}
			double	r = atan2( ws, cos( (a + nStep) * k ) ) ;
			ptrNextRev[i].rSin = (REAL32) sin( r ) ;
			ptrNextRev[i].rCos = (REAL32) cos( r ) ;
		}
		ptrNextRev += 7 ;
		nStep *= 8 ;
	}
	while ( nStep < nDegreeNum ) ;
	//
	return	ptrRevolve ;
}


//
// çÇë¨ LOT ïœä∑éñëOèàóù
//////////////////////////////////////////////////////////////////////////////
void eriFastPLOT
	(
		REAL32 *		ptrSrc,
		unsigned int	nDegreeDCT
	)
{
	signed int	i, nDegreeNum ;
	nDegreeNum = 1 << nDegreeDCT ;
	REAL32	r1, r2 ;
	//
	// ãÙêîé¸îgÇ∆äÔêîé¸îgÇçáéZÇ∑ÇÈ
	//
	for ( i = 0; i < nDegreeNum; i += 2 )
	{
		r1 = ptrSrc[i] ;
		r2 = ptrSrc[i + 1] ;
		ptrSrc[i]     = r1 + r2 ;
		ptrSrc[i + 1] = r1 - r2 ;
	}
}


//
// çÇë¨ LOT ïœä∑
//////////////////////////////////////////////////////////////////////////////
void eriFastLOT
	(
		REAL32 *		ptrDst,
		const REAL32 *	ptrSrc1,
		const REAL32 *	ptrSrc2,
		unsigned int	nDegreeDCT
	)
{
	unsigned int	i, nDegreeNum ;
	nDegreeNum = 1 << nDegreeDCT ;
	REAL32	r1, r2 ;
	//
	// èdï°âª
	//
	for ( i = 0; i < nDegreeNum; i += 2 )
	{
		r1 = ptrSrc2[i] ;
		r2 = ptrSrc1[i + 1] ;
		ptrDst[i]     = ERI_rHalf * (r1 + r2) ;
		ptrDst[i + 1] = ERI_rHalf * (r1 - r2) ;
	}
}


//
// ïΩñ âÒì]çsóÒ
//////////////////////////////////////////////////////////////////////////////
void eriOddGivensMatrix
	(
		REAL32 *		ptrDst,
		const SIN_COS *	ptrRevolve,
		unsigned int	nDegreeDCT
	)
{
	unsigned int	i, j, k, nDegreeNum ;
	nDegreeNum = 1 << nDegreeDCT ;
	REAL32	r1, r2 ;
	//
	// äÔêîé¸îgÇâÒì]ëÄçÏ
	//
	unsigned int	nStep, lc, index ;
	index = 1 ;
	nStep = 2 ;
	lc = (nDegreeNum / 2) / 8 ;
	for ( ; ; )
	{
		for ( i = 0; i < lc; i ++ )
		{
			k = i * (nStep * 8) + index ;
			for ( j = 0; j < 7; j ++ )
			{
				r1 = ptrDst[k] ;
				r2 = ptrDst[k + nStep] ;
				ptrDst[k] =
					r1 * ptrRevolve[j].rCos - r2 * ptrRevolve[j].rSin ;
				ptrDst[k + nStep] =
					r1 * ptrRevolve[j].rSin + r2 * ptrRevolve[j].rCos ;
				k += nStep ;
			}
		}
		ptrRevolve += 7 ;
		index += nStep * 7 ;
		nStep *= 8 ;
		if ( lc <= 8 )
			break ;
		lc /= 8 ;
	}
	k = index ;
	for ( j = 0; j < lc - 1; j ++ )
	{
		r1 = ptrDst[k] ;
		r2 = ptrDst[k + nStep] ;
		ptrDst[k] =
			r1 * ptrRevolve[j].rCos - r2 * ptrRevolve[j].rSin ;
		ptrDst[k + nStep] =
			r1 * ptrRevolve[j].rSin + r2 * ptrRevolve[j].rCos ;
		k += nStep ;
	}
}


//
// ãtïœä∑ïΩñ âÒì]çsóÒ
//////////////////////////////////////////////////////////////////////////////
void eriOddGivensInverseMatrix
	(
		REAL32 *		ptrSrc,
		const SIN_COS *	ptrRevolve,
		unsigned int	nDegreeDCT
	)
{
	signed int	i, j, k, nDegreeNum ;
	nDegreeNum = 1 << nDegreeDCT ;
	REAL32	r1, r2 ;
	//
	// äÔêîé¸îgÇâÒì]ëÄçÏ
	//
	signed int	nStep, lc, index ;
	index = 1 ;
	nStep = 2 ;
	lc = (nDegreeNum / 2) / 8 ;
	for ( ; ; )
	{
		ptrRevolve += 7 ;
		index += nStep * 7 ;
		nStep *= 8 ;
		if ( lc <= 8 )
			break ;
		lc /= 8 ;
	}
	k = index + nStep * (lc - 2) ;
	for ( j = lc - 2; j >= 0; j -- )
	{
		r1 = ptrSrc[k] ;
		r2 = ptrSrc[k + nStep] ;
		ptrSrc[k] =
			r1 * ptrRevolve[j].rCos + r2 * ptrRevolve[j].rSin ;
		ptrSrc[k + nStep] =
			r2 * ptrRevolve[j].rCos - r1 * ptrRevolve[j].rSin ;
		k -= nStep ;
	}
	for ( ; ; )
	{
		if ( lc > (nDegreeNum / 2) / 8 )
			break ;
		//
		ptrRevolve -= 7 ;
		nStep /= 8 ;
		index -= nStep * 7 ;
		//
		for ( i = 0; i < lc; i ++ )
		{
			k = i * (nStep * 8) + index + nStep * 6 ;
			for ( j = 6; j >= 0; j -- )
			{
				r1 = ptrSrc[k] ;
				r2 = ptrSrc[k + nStep] ;
				ptrSrc[k] =
					r1 * ptrRevolve[j].rCos + r2 * ptrRevolve[j].rSin ;
				ptrSrc[k + nStep] =
					r2 * ptrRevolve[j].rCos - r1 * ptrRevolve[j].rSin ;
				k -= nStep ;
			}
		}
		//
		lc *= 8 ;
	}
}

//
// çÇë¨ LOT ãtïœä∑éñëOèàóù
////////////////////////////////////////////////////////////////////////////// 
void eriFastIPLOT
	(
		REAL32 *		ptrSrc,
		unsigned int	nDegreeDCT
	)
{
	signed int	i, nDegreeNum ;
	nDegreeNum = 1 << nDegreeDCT ;
	REAL32	r1, r2 ;
	//
	// äÔêîé¸îgÇ∆ãÙêîé¸îgÇÃê¨ï™Çï™â
	//
	for ( i = 0; i < nDegreeNum; i += 2 )
	{
		r1 = ptrSrc[i] ;
		r2 = ptrSrc[i + 1] ;
		ptrSrc[i]     = ERI_rHalf * (r1 + r2) ;
		ptrSrc[i + 1] = ERI_rHalf * (r1 - r2) ;
	}
}


//
// çÇë¨ LOT ãtïœä∑
//////////////////////////////////////////////////////////////////////////////
void eriFastILOT
	(
		REAL32 *		ptrDst,
		const REAL32 *	ptrSrc1,
		const REAL32 *	ptrSrc2,
		unsigned int	nDegreeDCT
	)
{
	unsigned int	i, nDegreeNum ;
	nDegreeNum = 1 << nDegreeDCT ;
	REAL32	r1, r2 ;
	//
	// ãtèdï°âª
	//
	for ( i = 0; i < nDegreeNum; i += 2 )
	{
		r1 = ptrSrc1[i] ;
		r2 = ptrSrc2[i + 1] ;
		ptrDst[i]     = r1 + r2 ;
		ptrDst[i + 1] = r1 - r2 ;
	}
}

