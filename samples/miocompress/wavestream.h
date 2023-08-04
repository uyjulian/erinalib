
/*****************************************************************************
                  WAV ファイルストリーミングオブジェクト
 *****************************************************************************/


#if	!defined(__WAVESTREAM_H__)
#define	__WAVESTREAM_H__


class	EWaveFileStream
{
public:
	// 構築関数
	EWaveFileStream( void ) ;
	// 消滅関数
	~EWaveFileStream( void ) ;

protected:
	CFile *			m_pfile ;			// ファイルオブジェクト
	WAVEFORMATEX *	m_pwfx ;			// 形式データ
	DWORD			m_dwDataBytes ;		// データ部分のバイト数

public:
	// ファイルを開く
	bool Open( const char * pszFileName ) ;
	// ファイルを閉じる
	void Close( void ) ;
	// データ形式を取得
	WAVEFORMATEX * GetWaveFormat( void ) ;
	// データの総バイト数を取得
	DWORD GetDataLength( void ) ;
	// ファイルを読み込む
	UINT Read( void * lpBuf, UINT nBytes ) ;

} ;


#endif
