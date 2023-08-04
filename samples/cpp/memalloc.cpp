
/*****************************************************************************
                         E R I N A - L i b r a r y
                                                      �ŏI�X�V 2001/05/30
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


//////////////////////////////////////////////////////////////////////////////
//                 Win32 �������A���P�[�V���� �T���v��
//////////////////////////////////////////////////////////////////////////////

PVOID eriAllocateMemory( DWORD dwBytes )
{
	PVOID	ptrMemBlock ;
	DWORD *	pdwMem ;
	//
	if ( dwBytes < 0x10000 )
	{
		//
		// 64kByte �����̃������̓q�[�v���犄�蓖�Ă�
		// �i8�o�C�g���E�ɃA���C������j
		pdwMem = (DWORD*) ::GlobalAlloc( GMEM_FIXED, dwBytes + 0x08 ) ;
		pdwMem[1] = *((DWORD*)"heap") ;
		ptrMemBlock = (PVOID)(pdwMem + 2) ;
	}
	else
	{
		//
		// 64kByte �ȏ�̃������̓y�[�W�A���P�[�V�����Œ��ڊ��蓖�Ă�
		// �i16�o�C�g���E�ɃA���C������j
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
	// �������̊m�ۂ̎�ނ𔻕ʂ���
	DWORD *	pdwMem = (DWORD*) ptrMem ;
	DWORD	dwMemType = pdwMem[-1] ;
	//
	if ( dwMemType == *((DWORD*)"heap") )
	{
		//
		// �q�[�v�����������
		::GlobalFree( (HGLOBAL) (pdwMem - 2) ) ;
	}
	else if ( dwMemType == *((DWORD*)"page") )
	{
		//
		// �y�[�W�����������
		::VirtualFree( (pdwMem - 4), 0, MEM_RELEASE ) ;
	}
	else
	{
		// �G���[
	}
}

