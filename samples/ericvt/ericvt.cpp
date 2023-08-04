
/*****************************************************************************
                       �b�������摜�R���o�[�^�[ CL
 -----------------------------------------------------------------------------
           Copyright (C) 20001 Leshade Entis. All rights reserved.
 *****************************************************************************/


#include "ericvt.h"
#pragma comment( lib, "experi.lib" )


//
// �G���g���|�C���g
//////////////////////////////////////////////////////////////////////////////
int main( int argc, char * argv[] )
{
	//
	// ���C�u������������
	//
	eriInitializeLibrary( ) ;
	//
	// ���������
	//
	MyArgument	argument ;
	bool	fError = !argument.Interpret( argc, argv ) ;
	if ( !argument.m_fNologo )
	{
		PrintLogo( ) ;
	}
	if ( fError )
	{
		PrintUsage( ) ;
		return	0 ;
	}
	//
	if ( argument.m_fEncode )
	{
		//
		// ���k���s
		//
		EncodeToEri( argument ) ;
	}
	else
	{
		//
		// �L�����s
		//
		DecodeEriToBmp( argument ) ;
	}
	//
	// ���C�u�������I��
	//
	eriCloseLibrary( ) ;
	//
	return	0 ;
}

//
// ���S��\��
//////////////////////////////////////////////////////////////////////////////
void PrintLogo( void )
{
	printf( "�b�������摜�R���o�[�^�[ �b�k version 1.02\n" ) ;
	printf( "Copyright (C) 2001 Leshade Entis. All rights reserved.\n\n" ) ;
}

//
// ������\��
//////////////////////////////////////////////////////////////////////////////
void PrintUsage( void )
{
	printf( "�����P�Fericvt [<�I�v�V����>...] <���̓t�@�C��> [<�o�̓t�@�C��>]\n" ) ;
	printf( "�����Q�Fericvt [<�I�v�V����>...] <���̓t�@�C��> <�o�̓f�B���N�g��>\n" ) ;
	printf( "\n" ) ;
	printf( "�I�v�V�����G\n" ) ;
	printf( "    -nologo : ���S��\�����܂���B(�f�t�H���g�͖��w��)\n" ) ;
	printf( "    -time   : ���v���Ԃ��v�����܂��B(�f�t�H���g�͖��w��)\n" ) ;
	printf( "    -e      : BMP ���� ERI �t�@�C���ֈ��k���܂��B\n" ) ;
	printf( "    -d      : ERI ���� BMP �t�@�C���֓W�J���܂��B(�f�t�H���g)\n" ) ;
	printf( "    -x      : �g���t�H�[�}�b�g���g���Ĉ��k���܂��B(�f�t�H���g)\n" ) ;
	printf( "    -s      : �W���t�H�[�}�b�g���g���Ĉ��k���܂��B\n" ) ;
	printf( "    -i      : �u���b�N�Ɨ��^�ň��k���܂��B(�f�t�H���g�͖��w��)\n" ) ;
	printf( "    -b<n>   : �u���b�N���W�����w�肵�܂��B\n" ) ;
	printf( "              n �� 3 �ȏ�̐����B\n" ) ;
	printf( "              �w�肵�Ȃ��ƃv���O�����������I�Ɍ��肵�܂��B\n" ) ;
	printf( "    -p<n>   : ���k���[�h���w�肵�܂��Bn �� 0 ���� 3 �܂ł̐����B\n" ) ;
	printf( "              -p0 �ōō����k���Œᑬ�x�A-p3 �ōŒሳ�k���ō����x�ƂȂ�܂��B\n" ) ;
	printf( "              �t���J���[���k�̂Ƃ��̂ݗL���B�f�t�H���g�� -p1 �ł��B\n" ) ;
	printf( "    -l=<parameter-file>\n" ) ;
	printf( "            : ��t���k���s���܂��B\n" ) ;
	printf( "              parameter-file �ɂ̓p�����[�^���i�[�����t�@�C�������w�肵�܂��B\n" ) ;
}


//
// �O���[�o���ϐ�
//////////////////////////////////////////////////////////////////////////////

int		nEncodedCount = 0 ;


//
// BMP �� ERI �Ɉ��k
//////////////////////////////////////////////////////////////////////////////
void EncodeToEri( MyArgument & argument )
{
	//
	// �t�@�C����T���ď������k
	//
	WIN32_FIND_DATA	wfd ;
	HANDLE	hFind = ::FindFirstFile( argument.m_pszSrcName, &wfd ) ;
	if ( hFind == INVALID_HANDLE_VALUE )
	{
		printf( "�w�肳�ꂽ�t�@�C���������邱�Ƃ��o���܂���ł����B\n" ) ;
		return ;
	}
	char *	pszDir = GetPathDirectory( argument.m_pszSrcName ) ;
	nEncodedCount = 0 ;
	do
	{
		//
		// ���o�̓t�@�C�����𐶐�
		//
		char *	pszBmpFile = CombineString( pszDir, wfd.cFileName ) ;
		char *	pszEriFile ;
		if ( argument.m_fDstIsDir )
		{
			char *	pszFileTitle = GetFileNameTitle( wfd.cFileName ) ;
			char *	pszFileName = CombineString( pszFileTitle, ".eri" ) ;
			::eriFreeMemory( pszFileTitle ) ;
			pszEriFile = CombineString( argument.m_pszDstName, pszFileName ) ;
			::eriFreeMemory( pszFileName ) ;
		}
		else
		{
			pszEriFile = CombineString( argument.m_pszDstName, "" ) ;
		}
		//
		// �t�@�C�������k
		//
		EncodeBmpToEri( pszBmpFile, pszEriFile, argument ) ;
		//
		::eriFreeMemory( pszBmpFile ) ;
		::eriFreeMemory( pszEriFile ) ;
	}
	while ( ::FindNextFile( hFind, &wfd ) ) ;
	//
	::eriFreeMemory( pszDir ) ;
	//
	printf( "\n%d ���̉摜�����k���܂����B\n\n", nEncodedCount ) ;
}

//
// BMP �� ERI �Ɉ��k
//////////////////////////////////////////////////////////////////////////////
void EncodeBmpToEri
( const char * pszBmpFile, const char * pszEriFile, MyArgument & argument )
{
	//
	// �t�@�C���̈��k�J�n
	//
	char	szProgress[0x100] ;
	sprintf( szProgress, "%s : %%d ��\r", GetFilePathName( pszBmpFile ) ) ;
	printf( "%s : \r", GetFilePathName( pszBmpFile ) ) ;
	//
	// BMP �t�@�C����ǂݍ���
	//
	EReadFile	rf ;
	if ( !rf.Open( pszBmpFile ) )
	{
		printf( "\n�t�@�C�����J���܂���ł����B\n" ) ;
		return ;
	}
	MyBitmap	bmp ;
	if ( !bmp.ReadBitmap( &rf ) )
	{
		printf( "\n�s���ȃr�b�g�}�b�v�t�@�C���ł��B\n" ) ;
		return ;
	}
	//
	// ERI �t�@�C�����J��
	//
	EWriteFile	wf ;
	ERIWriteFile	erif ;
	if ( !wf.Open( pszEriFile ) || !erif.Open( &wf, erif.fidImage ) )
	{
		printf( "\n�o�̓t�@�C�����J���܂���ł����B\n" ) ;
		return ;
	}
	//
	// �t�@�C���w�b�_�������o��
	//
	ERI_FILE_HEADER	efh ;
	ERI_INFO_HEADER	eih ;
	const RASTER_IMAGE_INFO &	srii = bmp.GetRasterImage( ) ;
	//
	efh.dwVersion = 0x00020100 ;
	efh.dwContainedFlag = EFH_CONTAIN_IMAGE ;
	if ( srii.fdwFormatType & ERI_WITH_PALETTE )
	{
		efh.dwContainedFlag |= EFH_CONTAIN_PALETTE ;
	}
	efh.dwKeyFrameCount = 1 ;
	efh.dwFrameCount = 1 ;
	efh.dwAllFrameTime = 0 ;
	//
	::memset( &eih, 0, sizeof(eih) ) ;
	if ( argument.m_fEnhancedMode
			&& (srii.fdwFormatType != ERI_GRAY_IMAGE) )
	{
		eih.dwVersion = 0x00020200 ;
		eih.dwArchitecture = ERI_RUNLENGTH_HUFFMAN ;
	}
	else
	{
		eih.dwVersion = 0x00020100 ;
		eih.dwArchitecture = ERI_RUNLENGTH_GAMMA ;
	}
	if ( argument.m_fLossless )
	{
		eih.fdwTransformation = CVTYPE_LOSSLESS_ERI ;
	}
	else
	{
		eih.fdwTransformation = CVTYPE_DCT_ERI ;
	}
	eih.fdwFormatType = srii.fdwFormatType ;
	eih.nImageWidth = srii.nImageWidth ;
	eih.nImageHeight = - srii.nImageHeight ;
	eih.dwBitsPerPixel = srii.dwBitsPerPixel ;
	if ( argument.m_fLossless )
	{
		if ( !(srii.fdwFormatType & ERI_WITH_PALETTE) )
		{
			if ( argument.m_nBlockSize != 0 )
			{
				eih.dwBlockingDegree = argument.m_nBlockSize ;
			}
			else
			{
				if ( srii.nImageWidth * srii.nImageHeight < 512 * 512 )
				{
					eih.dwBlockingDegree = 4 ;
				}
				else
				{
					eih.dwBlockingDegree = 5 ;
				}
			}
		}
	}
	else
	{
		eih.dwBlockingDegree = argument.m_nBlockingDegree ;
		eih.dwSamplingFlags = argument.m_dwSamplingFlags ;
	}
	//
	if ( !erif.WriteHeader( efh, eih ) )
	{
		printf( "\n�w�b�_���̏����o���Ɏ��s���܂����B\n" ) ;
		erif.Close( ) ;
		wf.Close( ) ;
		return ;
	}
	//
	// �X�g���[�����R�[�h�̏����o��
	//
	bool	fSuccessful = false ;
	do
	{
		//
		// �X�g���[�����R�[�h���J��
		//
		if ( !erif.DescendRecord( (PCUINT64)"Stream  " ) )
		{
			break ;
		}
		//
		// �p���b�g�e�[�u���̏����o��
		//
		if ( srii.fdwFormatType & ERI_WITH_PALETTE )
		{
			if ( !erif.DescendRecord( (PCUINT64)"Palette " ) )
			{
				break ;
			}
			if ( erif.Write( bmp.GetPaletteTable(),
						0x100 * sizeof(ENTIS_PALETTE) )
							< 0x100 * sizeof(ENTIS_PALETTE) )
			{
				break ;
			}
			erif.AscendRecord( ) ;
		}
		//
		// �摜�f�[�^���R�[�h���J��
		//
		if ( !erif.DescendRecord( (PCUINT64)"ImageFrm" ) )
		{
			break ;
		}
		//
		// �摜�f�[�^���k����
		//
		EFileEncodeContext	context( &erif, 0x10000 ) ;
		MyERIEncoder		encoder ;
		if ( encoder.Initialize( eih ) )
		{
			break ;
		}
		DWORD	fdwFlags = 0 ;
		if ( argument.m_fIndependentBlock )
		{
			fdwFlags |= ERI_ENCODE_INDEPENDENT_BLOCK ;
		}
		fdwFlags |= ERI_MAKE_COMPRESS_MODE(argument.m_nCompressMode) ;
		if ( !argument.m_fLossless )
		{
			encoder.SetCompressionParameter( argument.m_eriep ) ;
		}
		//
		// ���Ԍv���J�n
		//
		BOOL	fPeformanceCounter ;
		__int64	qwFrequency, qwBeginTime ;
		DWORD	dwBegintTime ;
		if ( !argument.m_fTime )
		{
			encoder.AttachProgressFormat( szProgress ) ;
		}
		else
		{
			fPeformanceCounter =
				QueryPerformanceFrequency( (LARGE_INTEGER*) &qwFrequency ) ;
			if ( fPeformanceCounter )
			{
				QueryPerformanceCounter( (LARGE_INTEGER*) &qwBeginTime ) ;
			}
			else
			{
				dwBegintTime = GetTickCount( ) ;
			}
		}
		//
		// �摜�f�[�^�����k
		//
		if ( encoder.EncodeImage( srii, context, fdwFlags ) )
		{
			break ;
		}
		//
		if ( argument.m_fTime )
		{
			if ( fPeformanceCounter )
			{
				__int64	qwEndTime, qwDurationTime ;
				QueryPerformanceCounter( (LARGE_INTEGER*) &qwEndTime ) ;
				qwDurationTime = qwEndTime - qwBeginTime ;
				printf( "%s : ���k���� %.5f [ms]\r",
					GetFilePathName( pszBmpFile ),
					(double) qwDurationTime * 1000.0 / qwFrequency ) ;
			}
			else
			{
				DWORD	dwDurationTime = GetTickCount( ) - dwBegintTime ;
				printf( "%s : ���k���� %d [ms]\r",
					GetFilePathName( pszBmpFile ), dwDurationTime ) ;
			}
		}
		//
		// �X�g���[�����R�[�h�����
		//
		erif.AscendRecord( ) ;
		erif.AscendRecord( ) ;
		//
		fSuccessful = true ;
	}
	while ( false ) ;
	//
	erif.Close( ) ;
	wf.Close( ) ;
	//
	if ( fSuccessful )
	{
		nEncodedCount ++ ;
		printf( "\n" ) ;
	}
	else
	{
		printf( "\n�W�J�Ɏ��s���܂����B\n" ) ;
	}
}

//
// ERI �� BMP �ɓW�J
//////////////////////////////////////////////////////////////////////////////
void DecodeEriToBmp( MyArgument & argument )
{
	//
	// �t�@�C����T���ď������k
	//
	WIN32_FIND_DATA	wfd ;
	HANDLE	hFind = ::FindFirstFile( argument.m_pszSrcName, &wfd ) ;
	if ( hFind == INVALID_HANDLE_VALUE )
	{
		printf( "�w�肳�ꂽ�t�@�C���������邱�Ƃ��o���܂���ł����B\n" ) ;
		return ;
	}
	int		nDecodedCount = 0 ;
	char *	pszDir = GetPathDirectory( argument.m_pszSrcName ) ;
	do
	{
		//
		// �t�@�C���̈��k�J�n
		//
		char	szProgress[0x100] ;
		sprintf( szProgress, "%s : %%d ��\r", GetFilePathName( wfd.cFileName ) ) ;
		printf( "%s : \r", wfd.cFileName ) ;
		//
		// ERI �t�@�C�����J��
		//
		char *	pszEriFile = CombineString( pszDir, wfd.cFileName ) ;
		EReadFile	rf ;
		ERIFile		erif ;
		if ( !rf.Open( pszEriFile ) || !erif.Open( &rf ) )
		{
			printf( "\n�t�@�C�����J���܂���ł����B\n" ) ;
			::eriFreeMemory( pszEriFile ) ;
			continue ;
		}
		::eriFreeMemory( pszEriFile ) ;
		//
		// �W�J��̃r�b�g�}�b�v�����
		//
		MyBitmap	bmp ;
		bmp.CreateBitmap
			( erif.m_InfoHeader.fdwFormatType,
				erif.m_InfoHeader.nImageWidth, erif.m_InfoHeader.nImageHeight,
				erif.m_InfoHeader.dwBitsPerPixel, erif.m_PaletteTable ) ;
		//
		// ERI �̓W�J����������
		//
		EFileDecodeContext	context( &erif, 0x10000 ) ;
		MyERIDecoder		decoder ;
		if ( decoder.Initialize( erif.m_InfoHeader ) )
		{
			printf( "\n�W�J�ł��Ȃ��`���ł��B\n" ) ;
			erif.Close( ) ;
			rf.Close( ) ;
			continue ;
		}
		//
		// ���Ԃ̌v���J�n
		//
		BOOL	fPeformanceCounter ;
		__int64	qwFrequency, qwBeginTime ;
		DWORD	dwBegintTime ;
		if ( !argument.m_fTime )
		{
			decoder.AttachProgressFormat( szProgress ) ;
		}
		else
		{
			fPeformanceCounter =
				QueryPerformanceFrequency( (LARGE_INTEGER*) &qwFrequency ) ;
			if ( fPeformanceCounter )
			{
				QueryPerformanceCounter( (LARGE_INTEGER*) &qwBeginTime ) ;
			}
			else
			{
				dwBegintTime = GetTickCount( ) ;
			}
		}
		//
		// ERI ��W�J����
		//
		if ( decoder.DecodeImage( bmp.GetRasterImage(), context, false ) )
		{
			printf( "\n�W�J�Ɏ��s���܂����B\n" ) ;
			erif.Close( ) ;
			rf.Close( ) ;
			continue ;
		}
		//
		if ( argument.m_fTime )
		{
			if ( fPeformanceCounter )
			{
				__int64	qwEndTime, qwDurationTime ;
				QueryPerformanceCounter( (LARGE_INTEGER*) &qwEndTime ) ;
				qwDurationTime = qwEndTime - qwBeginTime ;
				printf( "%s : �W�J���� %.5f [ms]\r",
					GetFilePathName( wfd.cFileName ),
					(double) qwDurationTime * 1000.0 / qwFrequency ) ;
			}
			else
			{
				DWORD	dwDurationTime = GetTickCount( ) - dwBegintTime ;
				printf( "%s : �W�J���� %d [ms]\r",
					GetFilePathName( wfd.cFileName ), dwDurationTime ) ;
			}
		}
		//
		// BMP �t�@�C���������o��
		//
		EWriteFile	wf ;
		char *	pszBmpFile ;
		if ( argument.m_fDstIsDir )
		{
			char *	pszFileTitle = GetFileNameTitle( wfd.cFileName ) ;
			char *	pszFileName = CombineString( pszFileTitle, ".bmp" ) ;
			::eriFreeMemory( pszFileTitle ) ;
			pszBmpFile = CombineString( argument.m_pszDstName, pszFileName ) ;
			::eriFreeMemory( pszFileName ) ;
		}
		else
		{
			pszBmpFile = CombineString( argument.m_pszDstName, "" ) ;
		}
		if ( !wf.Open( pszBmpFile ) )
		{
			printf( "\n�o�̓t�@�C�����J���܂���ł����B\n" ) ;
			::eriFreeMemory( pszBmpFile ) ;
			continue ;
		}
		::eriFreeMemory( pszBmpFile ) ;
		//
		if ( !bmp.WriteBitmap( &wf ) )
		{
			printf( "\nBMP �t�@�C���̏����o���Ɏ��s���܂����B\n" ) ;
			continue ;
		}
		//
		printf( "\n" ) ;
		nDecodedCount ++ ;
	}
	while ( ::FindNextFile( hFind, &wfd ) ) ;
	//
	::eriFreeMemory( pszDir ) ;
	//
	printf( "\n%d ���̉摜��W�J���܂����B\n\n", nDecodedCount ) ;
}

//
// �p�X����f�B���N�g���𒊏o
//////////////////////////////////////////////////////////////////////////////
char * GetPathDirectory( const char * pszPath )
{
	int		i = 0, dl = 0 ;
	while ( pszPath[i] != '\0' )
	{
		if ( ::IsDBCSLeadByte( pszPath[i] ) )
		{
			i += 2 ;
		}
		else
		{
			if ( pszPath[i ++] == '\\' )
			{
				dl = i ;
			}
		}
	}
	char *	str = (char*) ::eriAllocateMemory( dl + 1 ) ;
	memcpy( str, pszPath, dl ) ;
	str[dl] = '\0' ;
	return	str ;
}

//
// �p�X����t�@�C�����𒊏o
//////////////////////////////////////////////////////////////////////////////
const char * GetFilePathName( const char * pszPath )
{
	int		i = 0, dl = 0 ;
	while ( pszPath[i] != '\0' )
	{
		if ( ::IsDBCSLeadByte( pszPath[i] ) )
		{
			i += 2 ;
		}
		else
		{
			if ( pszPath[i ++] == '\\' )
			{
				dl = i ;
			}
		}
	}
	return	pszPath + dl ;
}

//
// �t�@�C��������t�@�C���^�C�g���𒊏o
//////////////////////////////////////////////////////////////////////////////
char * GetFileNameTitle( const char * pszFileName )
{
	int		i = 0, tl = 0 ;
	while ( pszFileName[i] != '\0' )
	{
		if ( ::IsDBCSLeadByte( pszFileName[i] ) )
		{
			i += 2 ;
		}
		else
		{
			if ( pszFileName[i] == '.' )
			{
				tl = i ;
			}
			i ++ ;
		}
	}
	char *	str = (char*) ::eriAllocateMemory( tl + 1 ) ;
	memcpy( str, pszFileName, tl ) ;
	str[tl] = '\0' ;
	return	str ;
}

//
// �����������
//////////////////////////////////////////////////////////////////////////////
char * CombineString( const char * str1, const char * str2 )
{
	size_t	sl1 = strlen( str1 ) ;
	size_t	sl2 = strlen( str2 ) ;
	char *	str = (char*) ::eriAllocateMemory( sl1 + sl2 + 1 ) ;
	memcpy( str, str1, sl1 ) ;
	memcpy( str + sl1, str2, sl2 ) ;
	str[sl1 + sl2] = '\0' ;
	return	str ;
}


//////////////////////////////////////////////////////////////////////////////
// �r�b�g�}�b�v�I�u�W�F�N�g
//////////////////////////////////////////////////////////////////////////////

//
// �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
MyBitmap::MyBitmap( void )
{
	m_ptrBitmap = NULL ;
}

//
// ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
MyBitmap::~MyBitmap( void )
{
	Delete( ) ;
}

//
// �摜�f�[�^�擾
//////////////////////////////////////////////////////////////////////////////
const RASTER_IMAGE_INFO & MyBitmap::GetRasterImage( void ) const
{
	return	m_rii ;
}

//
// �p���b�g�e�[�u���擾
//////////////////////////////////////////////////////////////////////////////
const RGBQUAD * MyBitmap::GetPaletteTable( void ) const
{
	return	m_palette ;
}

//
// �r�b�g�}�b�v�t�@�C����ǂݍ���
//////////////////////////////////////////////////////////////////////////////
bool MyBitmap::ReadBitmap( EFileObject * pfile )
{
	//
	// ���݂̃f�[�^���폜
	//
	Delete( ) ;
	//
	// �t�@�C���w�b�_��ǂݍ���
	//
	BITMAPFILEHEADER	bfh ;
	if ( pfile->Read( &bfh, sizeof(bfh) ) < sizeof(bfh) )
	{
		return	false ;
	}
	if ( bfh.bfType != 'MB' )
	{
		return	false ;
	}
	//
	// ���w�b�_��ǂݍ���
	//
	if ( pfile->Read( &m_bmih, sizeof(m_bmih) ) < sizeof(m_bmih) )
	{
		return	false ;
	}
	//
	// �p���b�g�e�[�u����ǂݍ���
	//
	unsigned int	plen = 0 ;
	if ( m_bmih.biClrUsed != 0 )
	{
		plen = m_bmih.biClrUsed ;
	}
	else if ( m_bmih.biBitCount <= 8 )
	{
		plen = (1 << m_bmih.biBitCount) ;
	}
	if ( plen > 0x100 )
	{
		plen = 0x100 ;
	}
	plen *= sizeof(RGBQUAD) ;
	if ( bfh.bfOffBits != sizeof(bfh) + sizeof(m_bmih) + plen )
	{
		return	false ;
	}
	::memset( m_palette, 0, sizeof(m_palette) ) ;
	if ( pfile->Read( m_palette, plen ) < plen )
	{
		return	false ;
	}
	//
	// �摜����ݒ肷��
	//
	m_rii.fdwFormatType = ERI_RGB_IMAGE ;
	m_rii.nImageWidth = m_bmih.biWidth ;
	m_rii.nImageHeight = m_bmih.biHeight ;
	m_rii.dwBitsPerPixel = m_bmih.biBitCount ;
	m_rii.BytesPerLine =
		((m_rii.nImageWidth * m_rii.dwBitsPerPixel + 0x1F) & ~0x1F) >> 3 ;
	//
	if ( m_rii.dwBitsPerPixel <= 8 )
	{
		m_rii.fdwFormatType |= ERI_WITH_PALETTE ;
		//
		for ( int i = 0; i < 0x100; i ++ )
		{
			if ( (m_palette[i].rgbRed != (BYTE) i) ||
					(m_palette[i].rgbGreen != (BYTE) i) ||
					(m_palette[i].rgbBlue != (BYTE) i) )
			{
				break ;
			}
		}
		if ( i >= 0x100 )
		{
			m_rii.fdwFormatType = ERI_GRAY_IMAGE ;
		}
	}
	//
	// �r�b�g�}�b�v�z���ǂݍ���
	//
	m_bmih.biSizeImage = m_rii.BytesPerLine * m_rii.nImageHeight ;
	m_ptrBitmap = ::eriAllocateMemory( m_bmih.biSizeImage ) ;
	if ( pfile->Read( m_ptrBitmap, m_bmih.biSizeImage ) < m_bmih.biSizeImage )
	{
		return	false ;
	}
	m_rii.ptrImageArray = (PBYTE) m_ptrBitmap ;

	return	true ;
}

//
// �r�b�g�}�b�v�f�[�^���쐬
//////////////////////////////////////////////////////////////////////////////
bool MyBitmap::CreateBitmap
	( DWORD format, SDWORD width, SDWORD height,
				DWORD bpp, ENTIS_PALETTE * paltbl )
{
	//
	// ���݂̃f�[�^���폜
	//
	Delete( ) ;
	//
	// �摜����ݒ�
	//
	if ( height < 0 )
	{
		height = - height ;
	}
	m_rii.fdwFormatType = format ;
	m_rii.nImageWidth = width ;
	m_rii.nImageHeight = height ;
	m_rii.dwBitsPerPixel = bpp ;
	m_rii.BytesPerLine = ((width * bpp / 8) + 0x03) & ~0x03 ;
	//
	// �r�b�g�}�b�v�`���ɕϊ�
	//
	::memset( &m_bmih, 0, sizeof(m_bmih) ) ;
	m_bmih.biSize = sizeof(m_bmih) ;
	m_bmih.biWidth = width ;
	m_bmih.biHeight = height ;
	m_bmih.biPlanes = 1 ;
	m_bmih.biBitCount = (WORD) bpp ;
	m_bmih.biSizeImage = m_rii.BytesPerLine * height ;
	if ( bpp <= 8 )
	{
		m_bmih.biClrUsed = (1 << bpp) ;
	}
	//
	// �r�b�g�}�b�v���������m��
	//
	m_ptrBitmap = ::eriAllocateMemory( m_bmih.biSizeImage ) ;
	m_rii.ptrImageArray = (PBYTE) m_ptrBitmap ;
	//
	// �p���b�g�e�[�u����ݒ�
	//
	if ( format == ERI_GRAY_IMAGE )
	{
		for ( int i = 0; i < 0x100; i ++ )
		{
			m_palette[i].rgbBlue = (BYTE) i ;
			m_palette[i].rgbGreen = (BYTE) i ;
			m_palette[i].rgbRed = (BYTE) i ;
			m_palette[i].rgbReserved = 0 ;
		}
	}
	else if ( (bpp <= 8) && (paltbl != NULL) )
	{
		::memcpy( m_palette, paltbl, sizeof(m_palette) ) ;
	}

	return	true ;
}

//
// �r�b�g�}�b�v�t�@�C���������o��
//////////////////////////////////////////////////////////////////////////////
bool MyBitmap::WriteBitmap( EWriteFileObj * pfile )
{
	if ( m_ptrBitmap == NULL )
	{
		return	false ;
	}
	//
	// �t�@�C���w�b�_�������o��
	//
	BITMAPFILEHEADER	bfh ;
	bfh.bfType = 'MB' ;
	bfh.bfOffBits = sizeof(BITMAPFILEHEADER) + sizeof(BITMAPINFOHEADER) ;
	if ( m_bmih.biBitCount <= 8 )
	{
		bfh.bfOffBits += (sizeof(RGBQUAD) << m_bmih.biBitCount) ;
	}
	bfh.bfSize = bfh.bfOffBits + m_bmih.biSizeImage ;
	//
	if ( pfile->Write( &bfh, sizeof(bfh) ) < sizeof(bfh) )
	{
		return	false ;
	}
	//
	// ���w�b�_�������o��
	//
	if ( pfile->Write( &m_bmih, sizeof(m_bmih) ) < sizeof(m_bmih) )
	{
		return	false ;
	}
	//
	// �p���b�g�e�[�u���������o��
	//
	if ( m_bmih.biBitCount <= 8 )
	{
		if ( pfile->Write( m_palette, sizeof(m_palette) ) < sizeof(m_palette) )
		{
			return	false ;
		}
	}
	//
	// �r�b�g�}�b�v�z���ǂݍ���
	//
	if ( pfile->Write( m_ptrBitmap, m_bmih.biSizeImage ) < m_bmih.biSizeImage )
	{
		return	false ;
	}

	return	true ;
}

//
// �f�[�^���폜
//////////////////////////////////////////////////////////////////////////////
void MyBitmap::Delete( void )
{
	if ( m_ptrBitmap != NULL )
	{
		::eriFreeMemory( m_ptrBitmap ) ;
		m_ptrBitmap = NULL ;
	}
}


//////////////////////////////////////////////////////////////////////////////
// �R�}���h���C�������I�u�W�F�N�g
//////////////////////////////////////////////////////////////////////////////

//
// �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
MyArgument::MyArgument( void )
{
	m_fNologo = false ;
	m_fTime = false ;
	m_fEncode = false ;
	m_fDstIsDir = false ;
	m_fIndependentBlock = false ;
	m_fEnhancedMode = true ;
	m_nBlockSize = 0 ;
	m_nCompressMode = 1 ;
	m_fLossless = true ;
	m_dwSamplingFlags = 0 ;
	m_pszSrcName = NULL ;
	m_pszDstName = NULL ;
	m_pszDstBuf = NULL ;
}

//
// ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
MyArgument::~MyArgument( void )
{
	if ( m_pszDstBuf != NULL )
	{
		::eriFreeMemory( m_pszDstBuf ) ;
	}
}

//
// �������
//////////////////////////////////////////////////////////////////////////////
bool MyArgument::Interpret( int argc, const char *const * argv )
{
	//
	// �I�v�V�������
	//
	int		i = 1 ;
	while ( i < argc )
	{
		if ( (argv[i][0] != '-') && (argv[i][0] != '/') )
		{
			break ;
		}
		int		param ;
		switch ( argv[i][1] )
		{
		case	'e':
		case	'E':
			if ( argv[i][2] != '\0' )
			{
				return	false ;
			}
			m_fEncode = true ;
			break ;

		case	'd':
		case	'D':
			if ( argv[i][2] != '\0' )
			{
				return	false ;
			}
			m_fEncode = false ;
			break ;

		case	'x':
		case	'X':
			if ( argv[i][2] != '\0' )
			{
				return	false ;
			}
			m_fEncode = true ;
			m_fEnhancedMode = true ;
			break ;

		case	's':
		case	'S':
			if ( argv[i][2] != '\0' )
			{
				return	false ;
			}
			m_fEncode = true ;
			m_fEnhancedMode = false ;
			break ;

		case	'i':
		case	'I':
			if ( argv[i][2] != '\0' )
			{
				return	false ;
			}
			m_fIndependentBlock = true ;
			break ;

		case	'b':
		case	'B':
			if ( !Value( argv[i] + 2, &param ) )
			{
				return	false ;
			}
			if ( param < 3 )
			{
				return	false ;
			}
			m_nBlockSize = param ;
			break ;

		case	'p':
		case	'P':
			if ( !Value( argv[i] + 2, &param ) )
			{
				return	false ;
			}
			if ( (param < 0) || (param > 3) )
			{
				return	false ;
			}
			m_nCompressMode = param ;
			break ;

		case	'l':
		case	'L':
			{
				if ( argv[i][2] != '=' )
				{
					return	false ;
				}
				char	szBuf[0x200] ;
				char *	pszFilePart ;
				if ( ::GetFullPathName
					( argv[i] + 3, 0x200, szBuf, &pszFilePart ) == 0 )
				{
					return	false ;
				}
				if ( !LoadCompressionParameter( szBuf ) )
				{
					return	false ;
				}
			}
			break ;

		case	'n':
		case	'N':
			if ( ::_strcmpi( argv[i] + 1, "nologo" ) )
			{
				return	false ;
			}
			m_fNologo = true ;
			break ;

		case	't':
		case	'T':
			if ( ::_strcmpi( argv[i] + 1, "time" ) )
			{
				return	false ;
			}
			m_fTime = true ;
			break ;

		default:
			return	false ;
		}
		++ i ;
	}
	//
	// ���o�̓t�@�C�����擾
	//
	if ( argc < i + 1 )
	{
		return	false ;
	}
	m_pszSrcName = argv[i] ;
	//
	if ( argc < i + 2 )
	{
		char *	pszBaseName = ::GetFileNameTitle( m_pszSrcName ) ;
		m_pszDstBuf =
			::CombineString( pszBaseName, (m_fEncode ? ".eri" : ".bmp") ) ;
		::eriFreeMemory( pszBaseName ) ;
		m_pszDstName = m_pszDstBuf ;
	}
	else
	{
		m_pszDstName = argv[i + 1] ;
	}
	//
	// �o�͐悪�f�B���N�g�����ǂ�������
	//
	for ( i = 0; m_pszDstName[i] != '\0'; i ++ )
		;
	if ( (i > 0) &&
		((m_pszDstName[i - 1] == '\\') || (m_pszDstName[i - 1] == ':')) )
	{
		m_fDstIsDir = true ;
	}
	//
	// ����I��
	//
	return	true ;
}

//
// ��t���k�p�����[�^��ݒ�
//////////////////////////////////////////////////////////////////////////////
bool MyArgument::LoadCompressionParameter( const char * pszIniFile )
{
	//
	// �T���v�����O�t���O���擾
	//
	char	szBuf[0x100] ;
	if ( ::GetPrivateProfileString
		( "parameter", "sampling_flag",
			"4:4:4", szBuf, 0x100, pszIniFile ) >= 0xFF )
	{
		return	false ;
	}
	if ( !::_strcmpi( szBuf, "4:4:4" ) )
	{
		m_dwSamplingFlags = ERISF_YUV_4_4_4 ;
	}
	else if ( !::_strcmpi( szBuf, "4:2:2" ) )
	{
		m_dwSamplingFlags = ERISF_YUV_4_2_2 ;
	}
	else if ( !::_strcmpi( szBuf, "4:1:1" ) )
	{
		m_dwSamplingFlags = ERISF_YUV_4_1_1 ;
	}
	else
	{
		return	false ;
	}
	//
	// �u���b�L���O�T�C�Y���擾
	//
	if ( ::GetPrivateProfileString
		( "parameter", "blocking_degree",
			"3", szBuf, 0x100, pszIniFile ) >= 0xFF )
	{
		return	false ;
	}
	if ( !Value( szBuf, &m_nBlockingDegree ) )
	{
		return	false ;
	}
	if ( (m_nBlockingDegree < 3) || (5 < m_nBlockingDegree) )
	{
		return	false ;
	}
	//
	// �ʎq���W�����擾
	//
	if ( !GetParameter( &m_eriep.m_rYScaleDC,
			pszIniFile, "parameter", "y_dc_scale", "1.0" ) )
	{
		return	false ;
	}
	if ( !GetParameter( &m_eriep.m_rCScaleDC,
			pszIniFile, "parameter", "c_dc_scale", "1.0" ) )
	{
		return	false ;
	}
	if ( !GetParameter( &m_eriep.m_rYScaleLow,
			pszIniFile, "parameter", "y_low_scale", "1.0" ) )
	{
		return	false ;
	}
	if ( !GetParameter( &m_eriep.m_rCScaleLow,
			pszIniFile, "parameter", "c_low_scale", "1.0" ) )
	{
		return	false ;
	}
	if ( !GetParameter( &m_eriep.m_rYScaleHigh,
			pszIniFile, "parameter", "y_high_scale", "1.0" ) )
	{
		return	false ;
	}
	if ( !GetParameter( &m_eriep.m_rCScaleHigh,
			pszIniFile, "parameter", "c_high_scale", "1.0" ) )
	{
		return	false ;
	}
	//
	// 臒l���擾
	//
	if ( ::GetPrivateProfileString
		( "parameter", "low_threshold",
			"0", szBuf, 0x100, pszIniFile ) >= 0xFF )
	{
		return	false ;
	}
	if ( !Value( szBuf, &m_eriep.m_nLowThreshold ) )
	{
		return	false ;
	}
	if ( ::GetPrivateProfileString
		( "parameter", "high_threshold",
			"0", szBuf, 0x100, pszIniFile ) >= 0xFF )
	{
		return	false ;
	}
	if ( !Value( szBuf, &m_eriep.m_nHighThreshold ) )
	{
		return	false ;
	}
	//
	// ��t���k�ɐݒ�
	//
	m_fEncode = true ;
	m_fEnhancedMode = true ;
	m_fLossless = false ;

	return	true ;
}

//
// ini �t�@�C������w��̃p�����[�^���擾����
//////////////////////////////////////////////////////////////////////////////
bool MyArgument::GetParameter
	( REAL32 * val,
		const char * pszIniFile, const char * pszSection,
		const char * pszKey, const char * pszDefault )
{
	char	szBuf[0x100] ;
	if ( ::GetPrivateProfileString
		( pszSection, pszKey, pszDefault, szBuf, 0x100, pszIniFile ) >= 0xFF )
	{
		::lstrcpy( szBuf, pszDefault ) ;
	}
	return	Real( szBuf, val ) ;
}

//
// �����񂩂琔�l�ɕϊ�
//////////////////////////////////////////////////////////////////////////////
bool MyArgument::Value( const char * str, int * val )
{
	int		i = 0, n = 0 ;
	if ( *str == '\0' )
	{
		return	false ;
	}
	do
	{
		char	c = str[i ++] ;
		if ( (c < '0') || (c > '9') )
		{
			return	false ;
		}
		n = (n * 10) + (c - '0') ;
	}
	while ( str[i] != '\0' ) ;
	//
	*val = n ;
	return	true ;
}

//
// �����񂩂�����ɕϊ�
//////////////////////////////////////////////////////////////////////////////
bool MyArgument::Real( const char * str, REAL32 * val )
{
	int		i = 0 ;
	REAL32	r = 0.0 ; 
	REAL32	base = 1.0 ;
	//
	if ( *str == '\0' )
	{
		return	false ;
	}
	do
	{
		char	c = str[i ++] ;
		if ( c == '.' )
		{
			if ( base < 1.0 )
			{
				return	false ;
			}
			base = 0.1F ;
		}
		else if ( ('0' <= c) || (c <= '9') )
		{
			if ( base < 1.0 )
			{
				r += (c - '0') * base ;
				base *= 0.1F ;
			}
			else
			{
				r = (r * 10.0F) + (c - '0') ;
			}
		}
		else
		{
			return	false ;
		}
	}
	while ( str[i] != '\0' ) ;
	//
	*val = r ;
	return	true ;
}


//////////////////////////////////////////////////////////////////////////////
// ���k�I�u�W�F�N�g
//////////////////////////////////////////////////////////////////////////////

//
// �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
MyERIEncoder::MyERIEncoder( void )
{
	m_dwLastProgress = -1 ;
	m_pszProgressFormat = NULL ;
}

//
// ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
MyERIEncoder::~MyERIEncoder( void )
{
}

//
// �i�s�󋵕�������֘A�t����
//////////////////////////////////////////////////////////////////////////////
void MyERIEncoder::AttachProgressFormat( const char * pszPrgFormat )
{
	m_pszProgressFormat = pszPrgFormat ;
}

//
// �摜�����k
//////////////////////////////////////////////////////////////////////////////
int MyERIEncoder::EncodeImage
	( const RASTER_IMAGE_INFO & srcimginf,
		RLHEncodeContext & context, DWORD fdwFlags )
{
	PrintProgress( 0 ) ;
	//
	return	ERIEncoder::EncodeImage( srcimginf, context, fdwFlags ) ;
}

//
// �W�J�i�s�󋵒ʒm�֐�
//////////////////////////////////////////////////////////////////////////////
int MyERIEncoder::OnEncodedBlock( LONG line, LONG column )
{
	DWORD	dwTotalBlock = m_nWidthBlocks * m_nHeightBlocks ;
	DWORD	dwDecodedBlock = line * m_nWidthBlocks + column + 1 ;
	DWORD	dwProgress = dwDecodedBlock * 100 / dwTotalBlock ;
	PrintProgress( dwProgress ) ;
	return	0 ;
}

int MyERIEncoder::OnEncodedLine( LONG line )
{
	SDWORD	nImageHeight = m_EriInfHdr.nImageHeight ;
	if ( nImageHeight < 0 )
	{
		nImageHeight = - nImageHeight ;
	}
	DWORD	dwProgress = (line + 1) * 100 / nImageHeight ;
	PrintProgress( dwProgress ) ;
	return	0 ;
}

//
// �i�s�󋵕\��
//////////////////////////////////////////////////////////////////////////////
void MyERIEncoder::PrintProgress( DWORD dwProgress )
{
	if ( (m_pszProgressFormat != NULL)
			&& (m_dwLastProgress != dwProgress) )
	{
		m_dwLastProgress = dwProgress ;
		printf( m_pszProgressFormat, dwProgress ) ;
	}
}


//////////////////////////////////////////////////////////////////////////////
// �W�J�I�u�W�F�N�g
//////////////////////////////////////////////////////////////////////////////

//
// �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
MyERIDecoder::MyERIDecoder( void )
{
	m_pszProgressFormat = NULL ;
	m_dwLastProgress = -1 ;
}

//
// ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
MyERIDecoder::~MyERIDecoder( void )
{
}

//
// �i�s�󋵕�������֘A�t����
//////////////////////////////////////////////////////////////////////////////
void MyERIDecoder::AttachProgressFormat( const char * pszPrgFormat )
{
	m_pszProgressFormat = pszPrgFormat ;
}

//
// �摜��W�J
//////////////////////////////////////////////////////////////////////////////
int MyERIDecoder::DecodeImage
	( const RASTER_IMAGE_INFO & dstimginf,
		RLHDecodeContext & context, bool fTopDown )
{
	PrintProgress( 0 ) ;
	//
	return	ERIDecoder::DecodeImage( dstimginf, context, fTopDown ) ;
}

//
// �W�J�i�s�󋵒ʒm�֐�
//////////////////////////////////////////////////////////////////////////////
int MyERIDecoder::OnDecodedBlock( LONG line, LONG column )
{
	DWORD	dwTotalBlock = m_nWidthBlocks * m_nHeightBlocks ;
	DWORD	dwDecodedBlock = line * m_nWidthBlocks + column + 1 ;
	DWORD	dwProgress = dwDecodedBlock * 100 / dwTotalBlock ;
	PrintProgress( dwProgress ) ;
	return	0 ;
}

int MyERIDecoder::OnDecodedLine( LONG line )
{
	SDWORD	nImageHeight = m_EriInfHdr.nImageHeight ;
	if ( nImageHeight < 0 )
	{
		nImageHeight = - nImageHeight ;
	}
	DWORD	dwProgress = (line + 1) * 100 / nImageHeight ;
	PrintProgress( dwProgress ) ;
	return	0 ;
}

//
// �i�s�󋵕\��
//////////////////////////////////////////////////////////////////////////////
void MyERIDecoder::PrintProgress( DWORD dwProgress )
{
	if ( (m_pszProgressFormat != NULL)
			&& (m_dwLastProgress != dwProgress) )
	{
		m_dwLastProgress = dwProgress ;
		printf( m_pszProgressFormat, dwProgress ) ;
	}
}
