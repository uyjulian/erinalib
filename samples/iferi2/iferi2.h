
/*****************************************************************************
                      �W���b�������W�J Susie �v���O�C��
 ----------------------------------------------------------------------------
          Copyright (C) 2001 Leshade Entis. All rights reserved.
 *****************************************************************************/


//
// ���C�u�����A���p
//////////////////////////////////////////////////////////////////////////////

#define	STRICT	1
#include <windows.h>
#include <memory.h>

#include <eritypes.h>
#include <erinalib.h>


//
// �G�N�X�|�[�g�֐�
//////////////////////////////////////////////////////////////////////////////

// �v���O�C���̏����擾
extern "C" __declspec( dllexport )
	int PASCAL GetPluginInfo( int infono, LPSTR buf, int buflen ) ;

// �W�J�\�ȃt�@�C�����ǂ����𒲂ׂ�
extern "C" __declspec( dllexport )
	int PASCAL IsSupported( LPSTR filename, DWORD dw ) ;

// �摜�����擾����
extern "C" __declspec( dllexport ) int PASCAL GetPictureInfo
	( LPSTR buf, long len, unsigned int flag, struct PictureInfo *lpInfo ) ;

#pragma	pack( push, ENTER_SUSIE_ALIGN )
#pragma	pack( 1 )

struct	PictureInfo
{
	long	left, top ;		// �摜��W�J����ʒu
	long	width ;			// �摜�̕�(pixel)
	long	height ;		// �摜�̍���(pixel)
	WORD	x_density ;		// ��f�̐����������x
	WORD	y_density ;		// ��f�̐����������x
	short	colorDepth ;	// �P��f�������bit��
	HLOCAL	hInfo ;			// �摜���̃e�L�X�g���
} ;

#pragma	pack( pop, ENTER_SUSIE_ALIGN )


// �R�[���o�b�N�֐�
typedef	int (PASCAL *PFUNC_PROGRESSCALLBACK)
					( int nNum, int nDenom, long lData ) ;

// �摜��W�J����
extern "C" __declspec( dllexport )
	int PASCAL GetPicture
		(
			LPSTR buf, long len, unsigned int flag,
			HANDLE * pHBInfo, HANDLE * pHBm,
			PFUNC_PROGRESSCALLBACK lpPrgressCallback, long lData
		) ;

// �v���r���[�\���摜�W�J���[�`��
extern "C" __declspec( dllexport )
	int PASCAL GetPreview
		(
			LPSTR buf, long len, unsigned int flag,
			HANDLE * pHBInfo, HANDLE * pHBm,
			PFUNC_PROGRESSCALLBACK lpPrgressCallback, long lData
		) ;

//
// �f�[�^���̓C���^�[�t�F�[�X
//////////////////////////////////////////////////////////////////////////////

class	ERIInputContext : public	RLHDecodeContext
{
public:
	ERIFile *	m_pFile ;

public:
	// �\�z�֐�
	ERIInputContext( ULONG nBufferingSize ) ;
	// ���̃f�[�^��ǂݍ���
	virtual ULONG ReadNextData( PBYTE ptrBuffer, ULONG nBytes ) ;
} ;


//
// �W�J�I�u�W�F�N�g
//////////////////////////////////////////////////////////////////////////////

class	MyERIDecoder : public	ERIDecoder
{
public:
	PFUNC_PROGRESSCALLBACK	m_pfnPrgCallback ;
	long					m_nInstance ;
	int						m_nLastRatio ;

public:
	// �W�J�i�s�󋵒ʒm�֐�
	virtual int OnDecodedBlock( LONG line, LONG column ) ;
	virtual int OnDecodedLine( LONG line ) ;

} ;

