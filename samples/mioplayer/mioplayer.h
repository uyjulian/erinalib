// mioplayer.h : MIOPLAYER �A�v���P�[�V�����̃��C�� �w�b�_�[ �t�@�C���ł��B
//

#if !defined(AFX_MIOPLAYER_H__549CDCF7_B010_4BA6_B89E_2D8B3078587E__INCLUDED_)
#define AFX_MIOPLAYER_H__549CDCF7_B010_4BA6_B89E_2D8B3078587E__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// ���C�� �V���{��

/////////////////////////////////////////////////////////////////////////////
// CMioplayerApp:
// ���̃N���X�̓���̒�`�Ɋւ��Ă� mioplayer.cpp �t�@�C�����Q�Ƃ��Ă��������B
//

class CMioplayerApp : public CWinApp
{
public:
	CMioplayerApp( void ) ;
	~CMioplayerApp( void ) ;

// �I�[�o�[���C�h
	// ClassWizard �͉��z�֐��̃I�[�o�[���C�h�𐶐����܂��B
	//{{AFX_VIRTUAL(CMioplayerApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// �C���v�������e�[�V����

	//{{AFX_MSG(CMioplayerApp)
		// ���� - ClassWizard �͂��̈ʒu�Ƀ����o�֐���ǉ��܂��͍폜���܂��B
		//        ���̈ʒu�ɐ��������R�[�h��ҏW���Ȃ��ł��������B
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

extern	CMioplayerApp theApp ;

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio �͑O�s�̒��O�ɒǉ��̐錾��}�����܂��B

#endif // !defined(AFX_MIOPLAYER_H__549CDCF7_B010_4BA6_B89E_2D8B3078587E__INCLUDED_)
