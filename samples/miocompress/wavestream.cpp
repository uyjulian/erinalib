
/*****************************************************************************
                  WAV ファイルストリーミングオブジェクト
 *****************************************************************************/


#include "stdafx.h"
#include "wavestream.h"


//
// 構築関数
//////////////////////////////////////////////////////////////////////////////
EWaveFileStream::EWaveFileStream( void )
{
	m_pfile = NULL ;
	m_pwfx = NULL ;
	m_dwDataBytes = 0 ;
}

//
// 消滅関数
//////////////////////////////////////////////////////////////////////////////
EWaveFileStream::~EWaveFileStream( void )
{
	Close( ) ;
}

//
// ファイルを開く
//////////////////////////////////////////////////////////////////////////////
bool EWaveFileStream::Open( const char * pszFileName )
{
	Close( ) ;
	//
	// ファイルを開く
	m_pfile = new CFile ;
	if ( !m_pfile->Open( pszFileName, CFile::modeRead ) )
	{
		delete	m_pfile ;
		m_pfile = NULL ;
		return	false ;
	}
	//
	// WAV ファイルを開く
	//
	// === Windows Wave Form Audio header ===
	// 'RIFF' : 4 Bytes     : RIFF header
	//      ? : Double Word : file length
	// 'WAVE' : 4 Bytes     : WAVE header
	static const DWORD *	ptrRIFF = (const DWORD *) "RIFF" ;
	static const DWORD *	ptrWAVE = (const DWORD *) "WAVE" ;
	DWORD	dwWavHdr[3] ;
	if ( m_pfile->Read( dwWavHdr, sizeof(dwWavHdr) ) != sizeof(dwWavHdr) )
	{
		return	false ;
	}
	if( (dwWavHdr[0] != *ptrRIFF) || (dwWavHdr[2] != *ptrWAVE) )
	{
		return	false ;
	}
	//
	// フォーマットチャンクを読み込む
	//
	// === Wave Format Header ===
	// 'fmt ' : 4 Bytes     : fmt Chunk
	//      ? : Double Word : Chunk length
	static const DWORD *	ptrfmt = (const DWORD *) "fmt " ;
	for ( ; ; )
	{
		if ( m_pfile->Read
			( dwWavHdr, (sizeof(DWORD) * 2) ) < (sizeof(DWORD) * 2) )
		{
			return	false ;
		}
		if( dwWavHdr[0] == *ptrfmt )
		{
			break ;
		}
		m_pfile->Seek( dwWavHdr[1], CFile::current ) ;
	}
	//
	DWORD	dwFormatBytes = dwWavHdr[1] ;
	m_pwfx = (WAVEFORMATEX*) malloc( dwFormatBytes ) ;
	//
	if( m_pfile->Read( m_pwfx, dwFormatBytes ) != dwFormatBytes )
	{
		return	false ;
	}
	//
	// データチャンクを開く
	//
	// === Wave Data ===
	// 'data' : 4 Bytes     : data chunk
	//      ? : Double Word : Chunk length
	static const DWORD *	ptrdata = (const DWORD *) "data" ;
	for ( ; ; )
	{
		if ( m_pfile->Read
			( dwWavHdr, (sizeof(DWORD) * 2) ) < (sizeof(DWORD) * 2) )
		{
			return	false ;
		}
		if( dwWavHdr[0] == *ptrdata )
		{
			break ;
		}
		m_pfile->Seek( dwWavHdr[1], CFile::current ) ;
	}
	//
	m_dwDataBytes = dwWavHdr[1] ;

	return	true ;
}

//
// ファイルを閉じる
//////////////////////////////////////////////////////////////////////////////
void EWaveFileStream::Close( void )
{
	if ( m_pfile != NULL )
	{
		m_pfile->Close( ) ;
		delete	m_pfile ;
		m_pfile = NULL ;
	}
	if ( m_pwfx != NULL )
	{
		free( m_pwfx ) ;
		m_pwfx = NULL ;
	}
}

//
// データ形式を取得
//////////////////////////////////////////////////////////////////////////////
WAVEFORMATEX * EWaveFileStream::GetWaveFormat( void )
{
	return	m_pwfx ;
}

//
// データの総バイト数を取得
//////////////////////////////////////////////////////////////////////////////
DWORD EWaveFileStream::GetDataLength( void )
{
	return	m_dwDataBytes ;
}

//
// ファイルを読み込む
//////////////////////////////////////////////////////////////////////////////
UINT EWaveFileStream::Read( void * lpBuf, UINT nBytes )
{
	if ( m_pfile == NULL )
	{
		return	0 ;
	}
	return	m_pfile->Read( lpBuf, nBytes ) ;
}

