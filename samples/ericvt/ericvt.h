
/*****************************************************************************
                       �b�������摜�R���o�[�^�[ CL
 -----------------------------------------------------------------------------
           Copyright (C) 20001 Leshade Entis. All rights reserved.
 *****************************************************************************/


#define	STRICT	1
#include <windows.h>
#include <stdio.h>
#include <memory.h>
#include <string.h>


//
// ERINA ���C�u������`�t�@�C��
//////////////////////////////////////////////////////////////////////////////

#include <eritypes.h>
#include <erinalib.h>
#include <erimatrix.h>

typedef	const UINT64 *		PCUINT64 ;


//
// �r�b�g�}�b�v�I�u�W�F�N�g
//////////////////////////////////////////////////////////////////////////////

class	MyBitmap
{
protected:
	RASTER_IMAGE_INFO	m_rii ;
	BITMAPINFOHEADER	m_bmih ;
	RGBQUAD				m_palette[0x100] ;
	void *				m_ptrBitmap ;

public:
	// �\�z�֐�
	MyBitmap( void ) ;
	// ���Ŋ֐�
	~MyBitmap( void ) ;
	// �摜�f�[�^�擾
	const RASTER_IMAGE_INFO & GetRasterImage( void ) const ;
	// �p���b�g�e�[�u���擾
	const RGBQUAD * GetPaletteTable( void ) const ;
	// �r�b�g�}�b�v�t�@�C����ǂݍ���
	bool ReadBitmap( EFileObject * pfile ) ;
	// �r�b�g�}�b�v�f�[�^���쐬
	bool CreateBitmap
		( DWORD format, SDWORD width, SDWORD height,
					DWORD bpp, ENTIS_PALETTE * paltbl ) ;
	// �r�b�g�}�b�v�t�@�C���������o��
	bool WriteBitmap( EWriteFileObj * pfile ) ;
	// �f�[�^���폜
	void Delete( void ) ;

} ;


//
// �R�}���h���C�������I�u�W�F�N�g
//////////////////////////////////////////////////////////////////////////////

class	MyArgument
{
public:
	bool			m_fNologo ;				// ���S��\�����Ȃ�
	bool			m_fTime ;				// ���Ԃ��v������
	bool			m_fEncode ;				// ���k���L�����H
	bool			m_fDstIsDir ;			// �o�͐�̓f�B���N�g�����H
	bool			m_fIndependentBlock ;	// �u���b�N�Ɨ��^���H
	bool			m_fEnhancedMode ;		// �g���t�H�[�}�b�g���g���H
	int				m_nBlockSize ;			// �u���b�L���O�T�C�Y
	int				m_nCompressMode ;		// ���k���[�h

	bool			m_fLossless ;			// �t���k���H
	int				m_nBlockingDegree ;		// �u���b�L���O�T�C�Y
	DWORD			m_dwSamplingFlags ;		// �T���v�����O�t���O
	ERIEncoder::PARAMETER	m_eriep ;		// ���k�p�����[�^

	const char *	m_pszSrcName ;			// ���̓t�@�C����
	const char *	m_pszDstName ;			// �o�̓t�@�C����
	char *			m_pszDstBuf ;

public:
	// �\�z�֐�
	MyArgument( void ) ;
	// ���Ŋ֐�
	~MyArgument( void ) ;
	// �������
	bool Interpret( int argc, const char *const * argv ) ;
	// ��t���k�p�����[�^��ݒ�
	bool LoadCompressionParameter( const char * pszIniFile ) ;
	// ini �t�@�C������w��̃p�����[�^���擾����
	static bool GetParameter
		( REAL32 * val,
			const char * pszIniFile, const char * pszSection,
			const char * pszKey, const char * pszDefault ) ;
	// �����񂩂琔�l�ɕϊ�
	static bool Value( const char * str, int * val ) ;
	static bool Real( const char * str, REAL32 * val ) ;

} ;


//
// ���k�I�u�W�F�N�g
//////////////////////////////////////////////////////////////////////////////

class	MyERIEncoder	: public	ERIEncoder
{
public:
	// �\�z�֐�
	MyERIEncoder( void ) ;
	// ���Ŋ֐�
	~MyERIEncoder( void ) ;

protected:
	const char *	m_pszProgressFormat ;
	DWORD			m_dwLastProgress ;

public:
	// �i�s�󋵕�������֘A�t����
	void AttachProgressFormat( const char * pszPrgFormat ) ;
	// �摜�����k
	int EncodeImage
		( const RASTER_IMAGE_INFO & srcimginf,
			RLHEncodeContext & context, DWORD fdwFlags = 0x0021 ) ;

protected:
	// �W�J�i�s�󋵒ʒm�֐�
	virtual int OnEncodedBlock( LONG line, LONG column ) ;
	virtual int OnEncodedLine( LONG line ) ;
	// �i�s�󋵕\��
	void PrintProgress( DWORD dwProgress ) ;

} ;


//
// �W�J�I�u�W�F�N�g
//////////////////////////////////////////////////////////////////////////////

class	MyERIDecoder	: public	ERIDecoder
{
public:
	// �\�z�֐�
	MyERIDecoder( void ) ;
	// ���Ŋ֐�
	~MyERIDecoder( void ) ;

protected:
	const char *	m_pszProgressFormat ;
	DWORD			m_dwLastProgress ;

public:
	// �i�s�󋵕�������֘A�t����
	void AttachProgressFormat( const char * pszPrgFormat ) ;
	// �摜��W�J
	int DecodeImage
		( const RASTER_IMAGE_INFO & dstimginf,
			RLHDecodeContext & context, bool fTopDown ) ;

protected:
	// �W�J�i�s�󋵒ʒm�֐�
	virtual int OnDecodedBlock( LONG line, LONG column ) ;
	virtual int OnDecodedLine( LONG line ) ;
	// �i�s�󋵕\��
	void PrintProgress( DWORD dwProgress ) ;

} ;


//
// �O���[�o���֐�
//////////////////////////////////////////////////////////////////////////////

// ���S��\��
void PrintLogo( void ) ;

// ������\��
void PrintUsage( void ) ;

// ERI �Ɉ��k
void EncodeToEri( MyArgument & argument ) ;

// BMP �� ERI �Ɉ��k
void EncodeBmpToEri
( const char * pszBmpFile, const char * pszEriFile, MyArgument & argument ) ;

// ERI �� BMP �ɓW�J
void DecodeEriToBmp( MyArgument & argument ) ;

// �p�X����f�B���N�g���𒊏o
char * GetPathDirectory( const char * pszPath ) ;

// �p�X����t�@�C�����𒊏o
const char * GetFilePathName( const char * pszPath ) ;

// �t�@�C��������t�@�C���^�C�g���𒊏o
char * GetFileNameTitle( const char * pszFileName ) ;

// �����������
char * CombineString( const char * str1, const char * str2 ) ;

