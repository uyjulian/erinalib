
/*****************************************************************************
                          E R I N A - L i b r a r y
                                                      �ŏI�X�V 2001/11/04
 ----------------------------------------------------------------------------
          Copyright (C) 2000-2001 Leshade Entis. All rights reserved.
 *****************************************************************************/


#define	STRICT	1
#include <windows.h>


//
// ERINA �W�J���C�u������`�t�@�C��
//////////////////////////////////////////////////////////////////////////////

#include "eritypes.h"
#include "erinalib.h"


/*****************************************************************************
                        �t�@�C�����ۃI�u�W�F�N�g
 *****************************************************************************/

EFileObject::EFileObject( void )
{
}

EFileObject::~EFileObject( void )
{
}


/*****************************************************************************
                          �t�@�C���I�u�W�F�N�g
 *****************************************************************************/

//
// �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
EReadFile::EReadFile( void )
{
	m_hFile = INVALID_HANDLE_VALUE ;
	m_flagToClose = false ;
}

EReadFile::EReadFile( HANDLE hFile )
{
	m_hFile = hFile ;
	m_flagToClose = false ;
}

//
// ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
EReadFile::~EReadFile( void )
{
	Close( ) ;
}

//
// �t�@�C�����J��
//////////////////////////////////////////////////////////////////////////////
bool EReadFile::Open( const char * pszFile )
{
	Close( ) ;
	//
	m_hFile = ::CreateFile
		(
			pszFile,
			GENERIC_READ,
			FILE_SHARE_READ,
			NULL,
			OPEN_EXISTING,
			FILE_ATTRIBUTE_NORMAL,
			NULL
		) ;
	return	m_flagToClose = (m_hFile != INVALID_HANDLE_VALUE) ;
}

//
// �t�@�C���n���h�����֘A�t����
//////////////////////////////////////////////////////////////////////////////
void EReadFile::Attach( HANDLE hFile )
{
	Close( ) ;
	//
	m_hFile = hFile ;
}

//
// �t�@�C�������
//////////////////////////////////////////////////////////////////////////////
void EReadFile::Close( void )
{
	if ( m_flagToClose )
	{
		::CloseHandle( m_hFile ) ;
		//
		m_hFile = INVALID_HANDLE_VALUE ;
		m_flagToClose = false ;
	}
}

//
// �ǂݍ���
//////////////////////////////////////////////////////////////////////////////
DWORD EReadFile::Read( void * ptrBuf, DWORD dwByte )
{
	DWORD	dwReadBytes ;
	if ( ::ReadFile( m_hFile, ptrBuf, dwByte, &dwReadBytes, NULL ) )
		return	dwReadBytes ;
	return	0 ;
}

//
// �T�C�Y�擾
//////////////////////////////////////////////////////////////////////////////
DWORD EReadFile::GetLength( void )
{
	return	::GetFileSize( m_hFile, NULL ) ;
}

//
// �t�@�C���|�C���^�擾
//////////////////////////////////////////////////////////////////////////////
DWORD EReadFile::GetPointer( void )
{
	return	::SetFilePointer( m_hFile, 0, NULL, FILE_CURRENT ) ;
}

//
// �t�@�C���|�C���^�ړ�
//////////////////////////////////////////////////////////////////////////////
void EReadFile::Seek( DWORD dwPointer )
{
	::SetFilePointer( m_hFile, dwPointer, NULL, FILE_BEGIN ) ;
}


/*****************************************************************************
                       �������t�@�C���I�u�W�F�N�g
 *****************************************************************************/

//
// �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
EMemFile::EMemFile( const BYTE * ptrMem, DWORD dwLength )
{
	m_ptrMemory = ptrMem ;
	m_dwLength = dwLength ;
	m_dwPointer = 0 ;
}

//
// ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
EMemFile::~EMemFile( void )
{
}

//
// �ǂݍ���
//////////////////////////////////////////////////////////////////////////////
DWORD EMemFile::Read( void * ptrBuf, DWORD dwByte )
{
	DWORD	dwReadBytes = m_dwLength - m_dwPointer ;
	if ( dwReadBytes > dwByte )
		dwReadBytes = dwByte ;
	::memcpy( ptrBuf, m_ptrMemory + m_dwPointer, dwReadBytes ) ;
	m_dwPointer += dwReadBytes ;
	return	dwReadBytes ;
}

//
// �T�C�Y�擾
//////////////////////////////////////////////////////////////////////////////
DWORD EMemFile::GetLength( void )
{
	return	m_dwLength ;
}

//
// �|�C���^�擾
//////////////////////////////////////////////////////////////////////////////
DWORD EMemFile::GetPointer( void )
{
	return	m_dwPointer ;
}

//
// �|�C���^�ړ�
//////////////////////////////////////////////////////////////////////////////
void EMemFile::Seek( DWORD dwPointer )
{
	m_dwPointer = dwPointer ;
	if ( m_dwPointer > m_dwLength )
		m_dwPointer = m_dwLength ;
}


/*****************************************************************************
                          �ȈՕ�����I�u�W�F�N�g
 *****************************************************************************/

//
// �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
ERIFile::EStringObj::EStringObj( void )
{
	m_ptrString = NULL ;
	m_nLength = 0 ;
}

ERIFile::EStringObj::EStringObj
	( const char * pszString, int nLength )
{
	if ( nLength == -1 )
	{
		for ( m_nLength = 0; pszString[m_nLength] != '\0'; m_nLength ++ )
			;
	}
	else
	{
		m_nLength = nLength ;
	}
	m_ptrString = (char*) ::eriAllocateMemory( m_nLength + 1 ) ;
	for ( int i = 0; i < m_nLength; i ++ )
	{
		m_ptrString[i] = pszString[i] ;
	}
	m_ptrString[m_nLength] = '\0' ;
}

ERIFile::EStringObj::EStringObj
	( const wchar_t * pwszString, int nLength )
{
	m_nLength = ::WideCharToMultiByte
		( CP_ACP, 0, pwszString, nLength, NULL, 0, NULL, NULL ) ;
	if ( nLength == -1 )
	{
		m_nLength -- ;
	}
	m_ptrString = (char*) ::eriAllocateMemory( m_nLength + 1 ) ;
	::WideCharToMultiByte( CP_ACP, 0,
		pwszString, nLength, m_ptrString, m_nLength + 1, NULL, NULL ) ;
	m_ptrString[m_nLength] = '\0' ;
}

//
// ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
ERIFile::EStringObj::~EStringObj( void )
{
	if ( m_ptrString != NULL )
	{
		::eriFreeMemory( m_ptrString ) ;
	}
}

//
// �����񉄒�
//////////////////////////////////////////////////////////////////////////////
void ERIFile::EStringObj::AddString( const ERIFile::EStringObj & string )
{
	if ( string.m_nLength > 0 )
	{
		int		i ;
		char *	pszOrgString = m_ptrString ;
		int		nOrgLength = m_nLength ;
		m_nLength += string.m_nLength ;
		m_ptrString = (char*) ::eriAllocateMemory( m_nLength + 1 ) ;
		for ( i = 0; i < nOrgLength; i ++ )
		{
			m_ptrString[i] = pszOrgString[i] ;
		}
		for ( i = 0; i <= string.m_nLength; i ++ )
		{
			m_ptrString[nOrgLength + i] = string.m_ptrString[i] ;
		}
		if ( pszOrgString != NULL )
		{
			::eriFreeMemory( pszOrgString ) ;
		}
	}
}

//
// ���
//////////////////////////////////////////////////////////////////////////////
const ERIFile::EStringObj &
	ERIFile::EStringObj::operator = ( const ERIFile::EStringObj & string )
{
	if ( m_ptrString != NULL )
	{
		::eriFreeMemory( m_ptrString ) ;
	}
	m_nLength = string.m_nLength ;
	m_ptrString = (char*) ::eriAllocateMemory( m_nLength + 1 ) ;
	for ( int i = 0; i < m_nLength; i ++ )
	{
		m_ptrString[i] = string.m_ptrString[i] ;
	}
	m_ptrString[m_nLength] = '\0' ;
	//
	return	*this ;
}


/*****************************************************************************
                          �^�O����̓N���X
 *****************************************************************************/

//
// ETagObject �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
ERIFile::ETagObject::ETagObject( void )
{
	m_next = NULL ;
}

//
// ETagObject ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
ERIFile::ETagObject::~ETagObject( void )
{
}

//
// ETagInfo �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
ERIFile::ETagInfo::ETagInfo( void )
{
	m_pTags = NULL ;
}

//
// ETagInfo ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
ERIFile::ETagInfo::~ETagInfo( void )
{
	DeleteContents( ) ;
}

//
// �^�O�����
//////////////////////////////////////////////////////////////////////////////
void ERIFile::ETagInfo::CreateTagInfo( const char * pszDesc )
{
	//
	// ���݂̏����N���A
	//
	DeleteContents( ) ;
	//
	// ��������
	//
	if ( pszDesc == NULL )
	{
		return ;
	}
	if ( pszDesc[0] != '#' )
	{
		m_pTags = new ETagObject ;
		m_pTags->m_tag = EStringObj( "comment" ) ;
		m_pTags->m_contents = EStringObj( pszDesc ) ;
		return ;
	}
	//
	ETagObject *	pLastTag = NULL ;
	//
	while ( *pszDesc != '\0' )
	{
		//
		// �^�O�����擾
		//
		unsigned char	c ;
		ETagObject *	pTag = new ETagObject ;
		int		i = 1 ;
		while ( pszDesc[i] != '\0' )
		{
			c = pszDesc[i] ;
			if ( c > ' ' )
				break ;
			++ i ;
		}
		//
		int		iBegin = i ;
		while ( pszDesc[i] != '\0' )
		{
			c = pszDesc[i] ;
			if ( c <= ' ' )
				break ;
			++ i ;
		}
		//
		pTag->m_tag = EStringObj( pszDesc + iBegin, i - iBegin ) ;
		//
		// ���̍s��
		//
		while ( pszDesc[i] != '\0' )
		{
			c = pszDesc[i ++] ;
			if ( (c == '\r') && (pszDesc[i] == '\n') )
			{
				++ i ;
				break ;
			}
		}
		pszDesc += i ;
		//
		// �^�O�̓��e���擾
		//
		while ( *pszDesc != '\0' )
		{
			//
			// �P�s�擾
			//
			iBegin = 0 ;
			if ( pszDesc[0] == '#' )
			{
				if ( pszDesc[1] != '#' )
					break ;
				iBegin = 1 ;
			}
			i = iBegin ;
			while ( pszDesc[i] != '\0' )
			{
				c = pszDesc[i ++] ;
				if ( (c == '\r') && (pszDesc[i] == '\n') )
				{
					++ i ;
					break ;
				}
			}
			//
			// �P�s�ǉ�
			//
			pTag->m_contents.AddString
				( EStringObj( pszDesc + iBegin, i - iBegin ) ) ;
			//
			pszDesc += i ;
		}
		//
		const char *	pszTag = pTag->m_contents ;
		int				nLen = pTag->m_contents.GetLength( ) ;
		while ( nLen > 0 )
		{
			if ( (unsigned char) pszTag[-- nLen] > (unsigned char) ' ' )
			{
				++ nLen ;
				break ;
			}
		}
		if ( nLen != pTag->m_contents.GetLength() )
		{
			EStringObj	contents( pszTag, nLen ) ;
			pTag->m_contents = contents ;
		}
		//
		// �^�O��ǉ�
		//
		if ( pLastTag == NULL )
		{
			m_pTags = pTag ;
		}
		else
		{
			pLastTag->m_next = pTag ;
		}
		pLastTag = pTag ;
	}
}

//
// �^�O���̃N���A
//////////////////////////////////////////////////////////////////////////////
void ERIFile::ETagInfo::DeleteContents( void )
{
	ETagObject *	pTag = m_pTags ;
	while ( pTag != NULL )
	{
		ETagObject *	pNext = pTag->m_next ;
		delete	pTag ;
		pTag = pNext ;
	}
	m_pTags = NULL ;
}

//
// �^�O���擾
//////////////////////////////////////////////////////////////////////////////
const char * ERIFile::ETagInfo::GetTagContents( const char * pszTag )
{
	ETagObject *	pTag = m_pTags ;
	while ( pTag != NULL )
	{
		if ( !strcmp( pTag->m_tag, pszTag ) )
		{
			return	pTag->m_contents ;
		}
		pTag = pTag->m_next ;
	}
	return	NULL ;
}

//
// �g���b�N�ԍ����擾
//////////////////////////////////////////////////////////////////////////////
int ERIFile::ETagInfo::GetTrackNumber( void )
{
	const char *	pszTrack = GetTagContents( "track" ) ;
	if ( pszTrack != NULL )
	{
		return	StringToInt( pszTrack ) ;
	}
	return	0 ;
}

//
// ���[�v�|�C���g���擾
//////////////////////////////////////////////////////////////////////////////
int ERIFile::ETagInfo::GetRewindPoint( void )
{
	const char *	pszRewindPoint = GetTagContents( "rewind-point" ) ;
	if ( pszRewindPoint != NULL )
	{
		return	StringToInt( pszRewindPoint ) ;
	}
	return	0 ;
}

//
// �����[�X�N�������擾
//////////////////////////////////////////////////////////////////////////////
bool ERIFile::ETagInfo::GetReleaseDate( int & year, int & month, int & day )
{
	year = 0 ;
	month = 0 ;
	day = 0 ;
	//
	const char *	pszDate = GetTagContents( "release-date" ) ;
	if ( pszDate == NULL )
		return	false ;
	//
	year = StringToInt( pszDate ) ;
	if ( *(pszDate ++) != '/' )
		return	false ;
	//
	month = StringToInt( pszDate ) ;
	if ( *(pszDate ++) != '/' )
		return	false ;
	//
	day = StringToInt( pszDate ) ;

	return	true ;
}

//
// ������𐔒l�ɕϊ�
//////////////////////////////////////////////////////////////////////////////
int ERIFile::ETagInfo::StringToInt( const char *& pszValue )
{
	const char *	pszNext = pszValue ;
	int				nValue = 0 ;
	//
	while ( *pszNext )
	{
		char	c = *pszNext ;
		if ( (c != ' ') && ((c < '0') || ('9' < c)) )
		{
			break ;
		}
		pszNext ++ ;
		if ( c != ' ' )
		{
			nValue = nValue * 10 + (c - '0') ;
		}
	}
	//
	pszValue = pszNext ;
	return	nValue ;
}


/*****************************************************************************
              �b�������t�@�C���C���^�[�t�F�[�X�I�u�W�F�N�g
 *****************************************************************************/

//
// �^�O��񕶎���
//////////////////////////////////////////////////////////////////////////////
const char *	ERIFile::m_pszTagName[ERIFile::tagMax] =
{
	"title", "vocal-player", "composer", "arranger",
	"source", "track", "release-date", "genre",
	"rewind-point", "comment", "words"
} ;

//
// �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
ERIFile::ERIFile( void )
{
	m_pFile = NULL ;
	m_pRecInf = NULL ;
}

//
// ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
ERIFile::~ERIFile( void )
{
	Close( ) ;
}

//
// �b�������t�@�C�����J��
//////////////////////////////////////////////////////////////////////////////
bool ERIFile::Open( EFileObject * pFile, ERIFile::OpenType type )
{
	//
	// �ǂݍ��݃t���O���N���A
	//////////////////////////////////////////////////////////////////////////
	m_fdwReadMask = 0 ;
	//
	// EMC�w�b�_��ǂݍ���
	//////////////////////////////////////////////////////////////////////////
	struct	HEADER_INFO
	{
		unsigned __int8		EMCHeader[8] ;
		unsigned __int32	FileIdentity ;
		unsigned __int32	ExpandedInfo ;
		unsigned __int8		FileDetails[0x30] ;
	}		emc_header ;
	if ( pFile->Read( &emc_header,
			sizeof(HEADER_INFO) ) < sizeof(HEADER_INFO) )
		return	false ;
	//
	// �t�@�C���V�O�l�`���E�`�F�b�N
	if ( *((UINT64*)&emc_header.EMCHeader[0]) != *((UINT64*)"Entis\x1a\0\0") ||
			emc_header.FileIdentity != 0x03000100 )
		return	false ;
	//
	// �ǂݍ��ݏ���
	m_pFile = pFile ;
	m_pRecInf = new RECORD_INFO ;
	m_pRecInf->pParent = NULL ;
	m_pRecInf->dwOffset = m_pFile->GetPointer( ) ;
	m_pRecInf->dwLimit = m_pFile->GetLength( ) ;
	//
	if ( type == otOpenRoot )
		return	true ;
	//
	// ���w�b�_���R�[�h��ǂݍ���
	//////////////////////////////////////////////////////////////////////////
	typedef	const UINT64 *	PCUINT64 ;
	if ( !DescendRecord( (PCUINT64)"Header  " ) )
		return	false ;
	//
	// �t�@�C���w�b�_��ǂݍ���
	if ( !DescendRecord( (PCUINT64)"FileHdr " ) )
		return	false ;
	if ( Read( &m_FileHeader,
			sizeof(ERI_FILE_HEADER) ) < sizeof(ERI_FILE_HEADER) )
		return	false ;
	AscendRecord( ) ;
	//
	m_fdwReadMask |= rmFileHeader ;
	//
	// �o�[�W�������̃`�F�b�N
	if ( m_FileHeader.dwVersion > 0x00020100 )
		return	false ;
	//
	// �摜���w�b�_��ǂݍ���
	for ( ; ; )
	{
		if ( !DescendRecord( ) )
			break ;
		//
		UINT64	ui64RecID = m_pRecInf->header.ui64ID ;
		if ( ui64RecID == *((PCUINT64)"PrevwInf") )
		{
			//
			// �v���r���[�摜���w�b�_
			if ( Read( &m_PreviewInfo,
					sizeof(ERI_INFO_HEADER) ) == sizeof(ERI_INFO_HEADER) )
			{
				m_fdwReadMask |= rmPreviewInfo ;
			}
		}
		else if ( ui64RecID == *((PCUINT64)"ImageInf") )
		{
			//
			// �摜���w�b�_
			if ( Read( &m_InfoHeader,
					sizeof(ERI_INFO_HEADER) ) == sizeof(ERI_INFO_HEADER) )
			{
				m_fdwReadMask |= rmImageInfo ;
			}
		}
		else if ( ui64RecID == *((PCUINT64)"SoundInf") )
		{
			//
			// �������w�b�_
			if ( Read( &m_MIOInfHdr,
					sizeof(MIO_INFO_HEADER) ) == sizeof(MIO_INFO_HEADER) )
			{
				m_fdwReadMask |= rmSoundInfo ;
			}
		}
		else
		{
			//
			// ���쌠���E�R�����g�Ȃ�
			int	nType = -1 ;
			if ( ui64RecID == *((PCUINT64)"cpyright") )
			{
				nType = 0 ;
				m_fdwReadMask |= rmCopyright ;
			}
			else if ( ui64RecID == *((PCUINT64)"descript") )
			{
				nType = 1 ;
				m_fdwReadMask |= rmDescription ;
			}
			if ( nType >= 0 )
			{
				int	nLength = (int) m_pRecInf->header.ui64Length ;
				char *	pszBuf = (char*) ::eriAllocateMemory( nLength + 2 ) ;
				Read( pszBuf, nLength ) ;
				if ( (nLength >= 2) &&
					(pszBuf[0] == '\xff') && (pszBuf[1] == '\xfe') )
				{
					wchar_t *	pwszBuf = (wchar_t *) (pszBuf + 2) ;
					int	nWideLen = (nLength - 2) / 2 ;
					pwszBuf[nWideLen] = L'\0' ;
					if ( nType == 0 )
						m_strCopyright = EStringObj( pwszBuf ) ;
					else
						m_strDescription = EStringObj( pwszBuf ) ;
				}
				else
				{
					pszBuf[nLength] = '\0' ;
					if ( nType == 0 )
						m_strCopyright = EStringObj( pszBuf ) ;
					else
						m_strDescription = EStringObj( pszBuf ) ;
				}
				::eriFreeMemory( pszBuf ) ;
			}
		}
		//
		// ���̃��R�[�h��
		AscendRecord( ) ;
	}
	//
	AscendRecord( ) ;
	//
	// ���k�I�v�V�����̃`�F�b�N
	if ( !(m_fdwReadMask & rmImageInfo) && !(m_fdwReadMask & rmSoundInfo) )
		return	false ;
	if ( type == otReadHeader )
		return	true ;
	//
	// �X�g���[�����R�[�h���J��
	//////////////////////////////////////////////////////////////////////////
	if ( !DescendRecord( (PCUINT64)"Stream  " ) )
		return	false ;
	if ( type == otOpenStream )
		return	true ;
	//
	// �摜�f�[�^���R�[�h��{��
	for ( ; ; )
	{
		if ( !DescendRecord( ) )
			return	false ;
		if ( m_pRecInf->header.ui64ID == *((PCUINT64)"ImageFrm") )
			break ;
		if ( m_pRecInf->header.ui64ID == *((PCUINT64)"Palette ") )
		{
			//
			// �p���b�g�e�[�u���ǂݍ���
			::memset( m_PaletteTable, 0, sizeof(m_PaletteTable) ) ;
			Read( m_PaletteTable, sizeof(m_PaletteTable) ) ;
			//
			m_fdwReadMask |= rmPaletteTable ;
		}
		AscendRecord( ) ;
	}

	return	true ;
}

//
// �t�@�C�������
//////////////////////////////////////////////////////////////////////////////
void ERIFile::Close( void )
{
	while ( m_pRecInf != NULL )
	{
		RECORD_INFO *	pRecInf = m_pRecInf->pParent ;
		delete	m_pRecInf ;
		m_pRecInf = pRecInf ;
	}
}

//
// ���R�[�h���J��
//////////////////////////////////////////////////////////////////////////////
bool ERIFile::DescendRecord( const UINT64 * pRecID )
{
	for ( ; ; )
	{
		RECORD_INFO *	pRecInf = new RECORD_INFO ;
		if ( Read( &pRecInf->header,
				sizeof(RECORD_HEADER) ) < sizeof(RECORD_HEADER) )
		{
			delete	pRecInf ;
			return	false ;
		}
		pRecInf->pParent = m_pRecInf ;
		pRecInf->dwOffset = m_pFile->GetPointer( ) ;
		if ( pRecInf->header.ui64Length == 0xFFFFFFFFFFFFFFFF )
		{
			pRecInf->dwLimit = m_pRecInf->dwLimit ;
		}
		else
		{
			pRecInf->dwLimit =
				pRecInf->dwOffset + (DWORD) pRecInf->header.ui64Length ;
			if ( pRecInf->dwLimit > m_pRecInf->dwLimit )
				pRecInf->dwLimit = m_pRecInf->dwLimit ;
		}
		m_pRecInf = pRecInf ;
		if ( pRecID == NULL )
			break ;
		if ( m_pRecInf->header.ui64ID == *pRecID )
			break ;
		AscendRecord( ) ;
	}
	return	true ;
}

//
// ���R�[�h�����
//////////////////////////////////////////////////////////////////////////////
void ERIFile::AscendRecord( void )
{
	if ( (m_pRecInf != NULL) && (m_pRecInf->pParent != NULL) )
	{
		RECORD_INFO *	pRecInf = m_pRecInf->pParent ;
		if ( m_pFile != NULL )
			m_pFile->Seek( m_pRecInf->dwLimit ) ;
		delete	m_pRecInf ;
		m_pRecInf = pRecInf ;
	}
}

//
// ���R�[�hID���擾����
//////////////////////////////////////////////////////////////////////////////
UINT64 ERIFile::GetRecordID( void ) const
{
	return	(m_pRecInf != NULL) ? m_pRecInf->header.ui64ID : 0 ;
}

//
// �f�[�^��ǂݍ���
//////////////////////////////////////////////////////////////////////////////
DWORD ERIFile::Read( void * ptrBuf, DWORD dwByte )
{
	if ( m_pFile == NULL )
		return	0 ;
	DWORD	dwReadBytes = m_pRecInf->dwLimit - m_pFile->GetPointer() ;
	if ( dwReadBytes > dwByte )
		dwReadBytes = dwByte ;
	return	m_pFile->Read( ptrBuf, dwReadBytes ) ;
}

//
// ���R�[�h���擾
//////////////////////////////////////////////////////////////////////////////
DWORD ERIFile::GetLength( void )
{
	if ( m_pFile == NULL )
		return	0 ;
	return	m_pRecInf->dwLimit - m_pRecInf->dwOffset ;
}

//
// �|�C���^�擾
//////////////////////////////////////////////////////////////////////////////
DWORD ERIFile::GetPointer( void )
{
	if ( m_pFile == NULL )
		return	0 ;
	return	m_pFile->GetPointer() - m_pRecInf->dwOffset ;
}

//
// �|�C���^�ړ�
//////////////////////////////////////////////////////////////////////////////
void ERIFile::Seek( DWORD dwPointer )
{
	if ( m_pFile == NULL )
		return ;
	dwPointer += m_pRecInf->dwOffset ;
	if ( dwPointer > m_pRecInf->dwLimit )
		dwPointer = m_pRecInf->dwLimit ;
	m_pFile->Seek( dwPointer ) ;
}


