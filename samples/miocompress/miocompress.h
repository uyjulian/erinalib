// miocompress.h : MIOCOMPRESS �A�v���P�[�V�����̃��C�� �w�b�_�[ �t�@�C���ł��B
//

#if !defined(AFX_MIOCOMPRESS_H__5F9AA228_BA2F_47B1_909F_734A78DF5B7A__INCLUDED_)
#define AFX_MIOCOMPRESS_H__5F9AA228_BA2F_47B1_909F_734A78DF5B7A__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// ���C�� �V���{��

/////////////////////////////////////////////////////////////////////////////
// CMiocompressApp:
// ���̃N���X�̓���̒�`�Ɋւ��Ă� miocompress.cpp �t�@�C�����Q�Ƃ��Ă��������B
//

class CMiocompressApp : public CWinApp
{
public:
	CMiocompressApp( void ) ;
	~CMiocompressApp( void ) ;

// �I�[�o�[���C�h
	// ClassWizard �͉��z�֐��̃I�[�o�[���C�h�𐶐����܂��B
	//{{AFX_VIRTUAL(CMiocompressApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// �C���v�������e�[�V����

	//{{AFX_MSG(CMiocompressApp)
		// ���� - ClassWizard �͂��̈ʒu�Ƀ����o�֐���ǉ��܂��͍폜���܂��B
		//        ���̈ʒu�ɐ��������R�[�h��ҏW���Ȃ��ł��������B
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

extern	CMiocompressApp theApp ;

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio �͑O�s�̒��O�ɒǉ��̐錾��}�����܂��B

#endif // !defined(AFX_MIOCOMPRESS_H__5F9AA228_BA2F_47B1_909F_734A78DF5B7A__INCLUDED_)
