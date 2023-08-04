
/*****************************************************************************
                         E R I N A - L i b r a r y
                                                      最終更新 2001/05/30
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


//////////////////////////////////////////////////////////////////////////////
//                 Win32 メモリアロケーション サンプル
//////////////////////////////////////////////////////////////////////////////

PVOID eriAllocateMemory( DWORD dwBytes )
{
	PVOID	ptrMemBlock ;
	DWORD *	pdwMem ;
	//
	if ( dwBytes < 0x10000 )
	{
		//
		// 64kByte 未満のメモリはヒープから割り当てる
		// （8バイト境界にアラインする）
		pdwMem = (DWORD*) ::GlobalAlloc( GMEM_FIXED, dwBytes + 0x08 ) ;
		pdwMem[1] = *((DWORD*)"heap") ;
		ptrMemBlock = (PVOID)(pdwMem + 2) ;
	}
	else
	{
		//
		// 64kByte 以上のメモリはページアロケーションで直接割り当てる
		// （16バイト境界にアラインする）
		pdwMem = (DWORD*) ::VirtualAlloc
			( NULL, dwBytes + 0x10, MEM_COMMIT, PAGE_READWRITE ) ;
		pdwMem[3] = *((DWORD*)"page") ;
		ptrMemBlock = (PVOID)(pdwMem + 4) ;
	}
	//
	return	ptrMemBlock ;
}

void eriFreeMemory( PVOID ptrMem )
{
	//
	// メモリの確保の種類を判別する
	DWORD *	pdwMem = (DWORD*) ptrMem ;
	DWORD	dwMemType = pdwMem[-1] ;
	//
	if ( dwMemType == *((DWORD*)"heap") )
	{
		//
		// ヒープメモリを解放
		::GlobalFree( (HGLOBAL) (pdwMem - 2) ) ;
	}
	else if ( dwMemType == *((DWORD*)"page") )
	{
		//
		// ページメモリを解放
		::VirtualFree( (pdwMem - 4), 0, MEM_RELEASE ) ;
	}
	else
	{
		// エラー
	}
}

