
/*****************************************************************************
                         E R I N A - L i b r a r y
                                                      最終更新 2001/11/04
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


/*****************************************************************************
                        ファイル抽象オブジェクト
 *****************************************************************************/

EWriteFileObj::EWriteFileObj( void )
{
}

EWriteFileObj::~EWriteFileObj( void )
{
}


/*****************************************************************************
                          ファイルオブジェクト
 *****************************************************************************/

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
EWriteFile::EWriteFile( void )
{
	m_hFile = INVALID_HANDLE_VALUE ;
	m_flagToClose = false ;
}

EWriteFile::EWriteFile( HANDLE hFile )
{
	m_hFile = hFile ;
	m_flagToClose = false ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
EWriteFile::~EWriteFile( void )
{
	Close( ) ;
}

//
// ファイルを開く
//////////////////////////////////////////////////////////////////////////////
bool EWriteFile::Open( const char * pszFile )
{
	Close( ) ;
	//
	m_hFile = ::CreateFileA
		(
			pszFile,
			GENERIC_WRITE,
			0,
			NULL,
			CREATE_ALWAYS,
			FILE_ATTRIBUTE_NORMAL,
			NULL
		) ;
	return	m_flagToClose = (m_hFile != INVALID_HANDLE_VALUE) ;
}

//
// ファイルハンドルを関連付ける
//////////////////////////////////////////////////////////////////////////////
void EWriteFile::Attach( HANDLE hFile )
{
	Close( ) ;
	//
	m_hFile = hFile ;
}

//
// ファイルを閉じる
//////////////////////////////////////////////////////////////////////////////
void EWriteFile::Close( void )
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
// ファイルへ書き出す
//////////////////////////////////////////////////////////////////////////////
DWORD EWriteFile::Write( const void * ptrBuf, DWORD dwByte )
{
	DWORD	dwWrittenBytes ;
	if ( ::WriteFile( m_hFile, ptrBuf, dwByte, &dwWrittenBytes, NULL ) )
		return	dwWrittenBytes ;
	return	0 ;
}

//
// サイズ取得
//////////////////////////////////////////////////////////////////////////////
DWORD EWriteFile::GetLength( void )
{
	return	::GetFileSize( m_hFile, NULL ) ;
}

//
// ファイルポインタ取得
//////////////////////////////////////////////////////////////////////////////
DWORD EWriteFile::GetPointer( void )
{
	return	::SetFilePointer( m_hFile, 0, NULL, FILE_CURRENT ) ;
}

//
// ファイルポインタ移動
//////////////////////////////////////////////////////////////////////////////
void EWriteFile::Seek( DWORD dwPointer )
{
	::SetFilePointer( m_hFile, dwPointer, NULL, FILE_BEGIN ) ;
}


/*****************************************************************************
              恵理ちゃんファイルインターフェースオブジェクト
 *****************************************************************************/

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
ERIWriteFile::EWStringObj::EWStringObj( void )
{
	m_pwszString = NULL ;
	m_nLength = 0 ;
	m_nBufLimit = 0 ;
}

ERIWriteFile::EWStringObj::EWStringObj
	( const char * pszString, int nLength )
{
	m_nLength = ::MultiByteToWideChar
		( CP_ACP, MB_PRECOMPOSED, pszString, nLength, NULL, 0 ) ;
	if( nLength == -1 )
	{
		m_nLength -- ;
	}
	//
	m_nBufLimit = m_nLength + (m_nLength >> 1) + 1 ;
	m_pwszString = (wchar_t*)
		::eriAllocateMemory( m_nBufLimit * sizeof(wchar_t) ) ;
	//
	::MultiByteToWideChar
		( CP_ACP, MB_PRECOMPOSED,
			pszString, nLength, m_pwszString, m_nBufLimit ) ;
	m_pwszString[m_nLength] = L'\0' ;
}

ERIWriteFile::EWStringObj::EWStringObj
	( const wchar_t * pwszString, int nLength )
{
	if ( nLength == -1 )
	{
		for ( m_nLength = 0; pwszString[m_nLength] != '\0'; m_nLength ++ )
			;
	}
	else
	{
		m_nLength = nLength ;
	}
	//
	m_nBufLimit = m_nLength + (m_nLength >> 1) + 1 ;
	m_pwszString = (wchar_t*)
		::eriAllocateMemory( m_nBufLimit * sizeof(wchar_t) ) ;
	//
	for ( int i = 0; i < m_nLength; i ++ )
	{
		m_pwszString[i] = pwszString[i] ;
	}
	m_pwszString[m_nLength] = L'\0' ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
ERIWriteFile::EWStringObj::~EWStringObj( void )
{
	if ( m_pwszString != NULL )
	{
		::eriFreeMemory( m_pwszString ) ;
	}
}

//
// 文字列延長
//////////////////////////////////////////////////////////////////////////////
void ERIWriteFile::EWStringObj::AddString
	( const ERIWriteFile::EWStringObj & string )
{
	if ( string.m_nLength == 0 )
		return ;
	//
	wchar_t *	pwszOrgString = m_pwszString ;
	int			nOrgLength = m_nLength ;
	m_nLength += string.m_nLength ;
	//
	if ( m_nLength >= m_nBufLimit )
	{
		m_nBufLimit = m_nLength + (m_nLength >> 1) + 1 ;
		m_pwszString = (wchar_t*)
			::eriAllocateMemory( m_nBufLimit * sizeof(wchar_t) ) ;
		for ( int i = 0; i < nOrgLength; i ++ )
		{
			m_pwszString[i] = pwszOrgString[i] ;
		}
		if ( pwszOrgString != NULL )
		{
			::eriFreeMemory( pwszOrgString ) ;
		}
	}
	//
	for ( int i = 0; i < string.m_nLength; i ++ )
	{
		m_pwszString[nOrgLength + i] = string.m_pwszString[i] ;
	}
	m_pwszString[m_nLength] = L'\0' ;
}

//
// 代入
//////////////////////////////////////////////////////////////////////////////
const ERIWriteFile::EWStringObj &
	ERIWriteFile::EWStringObj::operator =
		( const ERIWriteFile::EWStringObj & string )
{
	if ( m_pwszString != NULL )
	{
		::eriFreeMemory( m_pwszString ) ;
	}
	//
	m_nLength = string.m_nLength ;
	m_nBufLimit = m_nLength + (m_nLength >> 1) + 1 ;
	m_pwszString = (wchar_t*)
		::eriAllocateMemory( m_nBufLimit * sizeof(wchar_t) ) ;
	//
	for ( int i = 0; i < m_nLength; i ++ )
	{
		m_pwszString[i] = string.m_pwszString[i] ;
	}
	m_pwszString[m_nLength] = L'\0' ;
	//
	return	*this ;
}

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
ERIWriteFile::ETagInfo::ETagInfo( void )
{
	m_pwszData = NULL ;
	m_nLength = 0 ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
ERIWriteFile::ETagInfo::~ETagInfo( void )
{
}

//
// タグ情報（著作権情報）設定
//////////////////////////////////////////////////////////////////////////////
void ERIWriteFile::ETagInfo::CreatePlaneText
( const ERIWriteFile::EWStringObj & string, int nAlign )
{
	DeleteContents( ) ;
	//
	const wchar_t *	pwszString = string ;
	int				nLength = string.GetLength( ) ;
	m_nLength = nLength + 1 + nAlign ;
	m_nLength -= m_nLength % nAlign ;
	//
	m_pwszData = (wchar_t*)
		::eriAllocateMemory( m_nLength * sizeof(wchar_t) ) ;
	::memset( m_pwszData, 0, m_nLength * sizeof(wchar_t) ) ;
	//
	m_pwszData[0] = 0xFEFF ;
	//
	for ( int i = 0; i < nLength; i ++ )
	{
		m_pwszData[i + 1] = pwszString[i] ;
	}
}

//
// タグ情報（ディスクリプション）設定
//////////////////////////////////////////////////////////////////////////////
void ERIWriteFile::ETagInfo::CreateTagInfo
	( ERIFile::ETagObject * pTags, int nAlign )
{
	EWStringObj	string ;			// フォーマット用文字列
	EWStringObj	strSharp( L"#" ) ;
	EWStringObj	strReturn( L"\r\n" ) ;
	//
	while ( pTags != NULL )
	{
		//
		// タグを宣言するラインを設定
		//
		string.AddString( strSharp ) ;
		string.AddString( EWStringObj( pTags->m_tag.CharPtr() ) ) ;
		string.AddString( strReturn ) ;
		//
		// ＃記号の透過処理
		//
		const char *	pszLine = pTags->m_contents ;
		while ( *pszLine )
		{
			int		nLength = 0 ;
			bool	fReturn = false ;
			while ( pszLine[nLength] )
			{
				if ( pszLine[nLength ++] == '\r' )
				{
					if ( pszLine[nLength] == '\n' )
					{
						fReturn = true ;
						nLength ++ ;
						break ;
					}
				}
			}
			//
			if ( *pszLine == '#' )
			{
				string.AddString( strSharp ) ;
			}
			string.AddString( EWStringObj( pszLine, nLength ) ) ;
			//
			if ( !fReturn )
			{
				string.AddString( strReturn ) ;
			}
			pszLine += nLength ;
		}
		//
		pTags = pTags->m_next ;
	}
	//
	CreatePlaneText( string, nAlign ) ;
}

//
// メモリ解放
//////////////////////////////////////////////////////////////////////////////
void ERIWriteFile::ETagInfo::DeleteContents( void )
{
	if ( m_pwszData != NULL )
	{
		::eriFreeMemory( m_pwszData ) ;
	}
	m_pwszData = NULL ;
	m_nLength = 0 ;
}

//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
ERIWriteFile::ERIWriteFile( void )
{
	m_pFile = NULL ;
	m_pRecInf = NULL ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
ERIWriteFile::~ERIWriteFile( void )
{
	Close( ) ;
}

//
// 恵理ちゃんファイルを開く
//////////////////////////////////////////////////////////////////////////////
bool ERIWriteFile::Open( EWriteFileObj * pFile, FileID fidType )
{
	//
	// 既にファイルを開いている場合には閉じる
	//////////////////////////////////////////////////////////////////////////
	Close( ) ;
	//
	// EMCヘッダを書き出す
	//////////////////////////////////////////////////////////////////////////
	struct	HEADER_INFO
	{
		unsigned __int8		EMCHeader[8] ;
		unsigned __int32	FileIdentity ;
		unsigned __int32	ExpandedInfo ;
		unsigned __int8		FileDetails[0x30] ;
	}		emc_header ;
	*((UINT64*)emc_header.EMCHeader) = *((UINT64*)"Entis\x1a\0\0") ;
	emc_header.FileIdentity = 0x03000100 ;
	emc_header.ExpandedInfo = 0 ;
	static const char	szFileDetails[3][0x30] =
	{
		"Entis Rasterized Image",
		"Music Interleaved and Orthogonal transformed",
		"Moving Entis Image"
	} ;
	for ( int i = 0; i < 0x30; i ++ )
	{
		emc_header.FileDetails[i] = szFileDetails[fidType][i] ;
	}
	//
	if ( pFile->Write( &emc_header,
			sizeof(HEADER_INFO) ) < sizeof(HEADER_INFO) )
		return	false ;
	//
	// ルートレコードを設定
	//////////////////////////////////////////////////////////////////////////
	m_pFile = pFile ;
	m_pRecInf = new RECORD_INFO ;
	m_pRecInf->pParent = NULL ;
	m_pRecInf->dwOffset = m_pFile->GetPointer( ) ;
	m_pRecInf->dwLimit = m_pRecInf->dwOffset ;

	return	true ;
}

//
// 恵理ちゃんファイルを閉じる
//////////////////////////////////////////////////////////////////////////////
void ERIWriteFile::Close( void )
{
	if ( m_pFile != NULL )
	{
		if ( m_pRecInf != NULL )
		{
			while ( m_pRecInf->pParent != NULL )
				AscendRecord( ) ;
			//
			delete	m_pRecInf ;
			m_pRecInf = NULL ;
		}
		m_pFile = NULL ;
	}
}

//
// ヘッダレコードを書き出す
//////////////////////////////////////////////////////////////////////////////
bool ERIWriteFile::WriteHeader
	( const ERI_FILE_HEADER & efh, const ERI_INFO_HEADER & eih )
{
	//
	// 情報ヘッダレコードを開く
	//////////////////////////////////////////////////////////////////////////
	typedef	const UINT64 *	PCUINT64 ;
	if ( !DescendRecord( (PCUINT64)"Header  " ) )
		return	false ;
	//
	// ファイルヘッダを書き出す
	if ( !DescendRecord( (PCUINT64)"FileHdr " ) )
		return	false ;
	if ( Write( &efh, sizeof(ERI_FILE_HEADER) ) < sizeof(ERI_FILE_HEADER) )
		return	false ;
	AscendRecord( ) ;
	//
	// 画像情報ヘッダを書き出す
	if ( !DescendRecord( (PCUINT64)"ImageInf" ) )
		return	false ;
	if ( Write( &eih, sizeof(ERI_INFO_HEADER) ) < sizeof(ERI_INFO_HEADER) )
		return	false ;
	AscendRecord( ) ;
	//
	AscendRecord( ) ;

	return	true ;
}

//
// レコードを開く
//////////////////////////////////////////////////////////////////////////////
bool ERIWriteFile::DescendRecord( const UINT64 * pRecID )
{
	//
	// レコードヘッダ書き出し
	if ( Write( pRecID, sizeof(UINT64) ) < sizeof(UINT64) )
		return	false ;
	UINT64	length = 0 ;
	if ( Write( &length, sizeof(UINT64) ) < sizeof(UINT64) )
		return	false ;
	//
	// レコード情報設定
	RECORD_INFO *	pRecInf = new RECORD_INFO ;
	pRecInf->pParent = m_pRecInf ;
	pRecInf->dwOffset = m_pFile->GetPointer( ) ;
	pRecInf->dwLimit = pRecInf->dwOffset ;
	m_pRecInf = pRecInf ;

	return	true ;
}

//
// レコードを閉じる
//////////////////////////////////////////////////////////////////////////////
void ERIWriteFile::AscendRecord( void )
{
	if ( m_pFile == NULL )
		return ;
	DWORD	dwLimit = m_pFile->GetPointer( ) ;
	if ( dwLimit < m_pRecInf->dwLimit )
		dwLimit = m_pRecInf->dwLimit ;
	UINT64	nRecLen = dwLimit - m_pRecInf->dwOffset ;
	//
	m_pFile->Seek( m_pRecInf->dwOffset - sizeof(UINT64) ) ;
	m_pFile->Write( &nRecLen, sizeof(UINT64) ) ;
	m_pFile->Seek( dwLimit ) ;
	//
	RECORD_INFO *	pRecInf = m_pRecInf->pParent ;
	delete	m_pRecInf ;
	m_pRecInf = pRecInf ;
}

//
// ファイルへ書き出し
//////////////////////////////////////////////////////////////////////////////
DWORD ERIWriteFile::Write( const void * ptrBuf, DWORD dwByte )
{
	if ( m_pFile == NULL )
		return	0 ;
	return	m_pFile->Write( ptrBuf, dwByte ) ;
}

//
// レコードの長さを取得
//////////////////////////////////////////////////////////////////////////////
DWORD ERIWriteFile::GetLength( void )
{
	if ( m_pFile == NULL )
		return	0 ;
	DWORD	dwLimit = m_pFile->GetPointer( ) ;
	if ( dwLimit < m_pRecInf->dwLimit )
		dwLimit = m_pRecInf->dwLimit ;
	else
		m_pRecInf->dwLimit = dwLimit ;

	return	dwLimit - m_pRecInf->dwOffset ;
}

//
// レコード内のオフセットを取得
//////////////////////////////////////////////////////////////////////////////
DWORD ERIWriteFile::GetPointer( void )
{
	if ( m_pFile == NULL )
		return	0 ;
	return	m_pFile->GetPointer() - m_pRecInf->dwOffset ;
}

//
// ファイルポインタを移動
//////////////////////////////////////////////////////////////////////////////
void ERIWriteFile::Seek( DWORD dwPointer )
{
	if ( m_pFile == NULL )
		return ;
	DWORD	dwLimit = m_pFile->GetPointer( ) ;
	dwPointer += m_pRecInf->dwOffset ;
	if ( dwPointer < dwLimit )
		m_pRecInf->dwLimit = dwLimit ;

	m_pFile->Seek( dwPointer ) ;
}

