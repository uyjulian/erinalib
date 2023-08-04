
/*****************************************************************************
                         E R I N A - L i b r a r y
                                                      最終更新 2002/05/26
 ----------------------------------------------------------------------------
         Copyright (C) 2000-2002 Leshade Entis. All rights reserved.
 *****************************************************************************/


#if	!defined(ERINALIB_H_INCLUDE)
#define	ERINALIB_H_INCLUDE

#include "experi.h"
#include "cmperi.h"
#include "cxmio.h"


/*****************************************************************************
                    MIOファイルストリーム再生オブジェクト
 *****************************************************************************/

class	MIODynamicPlayer
{
public:
	// 構築関数
	MIODynamicPlayer( void ) ;
	// 消滅関数
	~MIODynamicPlayer( void ) ;

protected:
	//
	// レコード先読みオブジェクト
	class	EPreloadBuffer	: public	EMemFile
	{
	public:
		BYTE *			m_ptrBuffer ;
		ULONG			m_nKeySample ;
		MIO_DATA_HEADER	m_miodh ;
	public:
		// 構築関数
		EPreloadBuffer( DWORD dwLength ) ;
		// 消滅関数
		virtual ~EPreloadBuffer( void ) ;
	} ;
	//
	// キーフレームポイント構造体
	struct	KEY_POINT
	{
		ULONG	nKeySample ;
		DWORD	dwRecOffset ;
	} ;
	//
	// EPreloadBuffer 配列オブジェクト
	class	EPreloadQueue
	{
	public:
		EPreloadBuffer **	m_queue ;
		unsigned int		m_length ;
		unsigned int		m_limit ;
	public:
		// 構築関数
		EPreloadQueue( void ) ;
		// 消滅関数
		~EPreloadQueue( void ) ;
		// 配列の最大の長さを設定
		void SetLimit( unsigned int nLimit ) ;
		// 配列を消去
		void RemoveAll( void ) ;
	} ;
	//
	// KEY_POINT 配列オブジェクト
	class	EKeyPointList
	{
	public:
		KEY_POINT *		m_list ;
		unsigned int	m_count ;
		unsigned int	m_limit ;
	public:
		// 構築関数
		EKeyPointList( void ) ;
		// 消滅関数
		~EKeyPointList( void ) ;
		// 配列の最剤の長さを設定
		void SetLimit( unsigned int nLimit ) ;
		// 配列を消去
		void RemoveAll( void ) ;
	} ;
	//
	// スレッド用メッセージ
	enum	ThreadMessage
	{
		tmSeekSound	= WM_USER,
		tmQuit
	} ;

	// ERIアニメーションファイル
	ERIFile					m_erif ;
	// 展開オブジェクト
	EFileDecodeContext *	m_pmioc ;
	MIODecoder *			m_pmiod ;
	// 先読みスレッド
	HANDLE					m_hThread ;
	DWORD					m_idThread ;
	// 先読みキュー
	EPreloadQueue			m_queueSound ;
	HANDLE					m_hQueueFull ;		// 先読みキューが一杯
	HANDLE					m_hQueueNotEmpty ;	// 先読みキューが空でない
	HANDLE					m_hQueueSpace ;		// 先読みキューに読み込み可能
	// 音声シーク用キーポイント配列
	EKeyPointList			m_listKeySample ;
	// 排他的処理
	CRITICAL_SECTION		m_cs ;

public:
	// MIO ファイルを開く
	bool Open( EFileObject * pFile, unsigned int nPreloadSize = 0 ) ;
	// MIO ファイルを閉じる
	void Close( void ) ;

	// 指定サンプルへ移動し、初めのブロックのデータを取得する
	virtual void * GetWaveBufferFrom
		( ULONG nSample, DWORD & dwBytes, DWORD & dwOffsetBytes ) ;
	// 次の音声データがストリームの先頭であるか？
	virtual bool IsNextDataRewound( void ) ;
	// 次の音声データを取得
	virtual void * GetNextWaveBuffer( DWORD & dwBytes ) ;
	// 音声バッファ確保
	virtual void * AllocateWaveBuffer( DWORD dwBytes ) ;
	// 音声データ破棄許可
	virtual void DeleteWaveBuffer( void * ptrWaveBuf ) ;
	// 音声展開オブジェクトを生成
	virtual MIODecoder * CreateMIODecoder( void ) ;

public:
	// ERIFile オブジェクトを取得する
	const ERIFile & GetERIFile( void ) const ;
	// チャネル数を取得する
	DWORD GetChannelCount( void ) const ;
	// サンプリング周波数を取得する
	DWORD GetFrequency( void ) const ;
	// サンプリングビット分解能を取得する
	DWORD GetBitsPerSample( void ) const ;
	// 全体の長さ（サンプル数）を取得する
	DWORD GetTotalSampleCount( void ) const ;

protected:
	// 先読みバッファを取得する
	EPreloadBuffer * GetPreloadBuffer( void ) ;
	// 先読みバッファに追加する
	void AddPreloadBuffer( EPreloadBuffer * pBuffer ) ;

protected:
	// スレッド関数
	static DWORD WINAPI ThreadProc( LPVOID parameter ) ;
	DWORD LoadingThreadProc( void ) ;
	// キーフレームポイントを追加する
	void AddKeySample( KEY_POINT key ) ;
	// 指定のキーフレームを検索する
	KEY_POINT * SearchKeySample( unsigned int nKeySample ) ;
	// 指定のサンプルを含むブロックを読み込む
	void SeekKeySample( ULONG nSample, unsigned int & nCurrentSample ) ;

public:
	// 排他処理（クリティカルセクション）
	void Lock( void ) ;
	void Unlock( void ) ;

} ;


/*****************************************************************************
                    ERIアニメーションファイルオブジェクト
 *****************************************************************************/

class	ERIAnimation
{
public:
	// 構築関数
	ERIAnimation( void ) ;
	// 消滅関数
	~ERIAnimation( void ) ;

protected:
	//
	// レコード先読みオブジェクト
	class	EPreloadBuffer	: public	EMemFile
	{
	public:
		BYTE *	m_ptrBuffer ;
		ULONG	m_iFrameIndex ;
		UINT64	m_ui64RecType ;
	public:
		// 構築関数
		EPreloadBuffer( DWORD dwLength ) ;
		// 消滅関数
		virtual ~EPreloadBuffer( void ) ;
	} ;
	//
	// キーフレームポイント構造体
	struct	KEY_POINT
	{
		ULONG	iKeyFrame ;
		DWORD	dwRecOffset ;
	} ;
	//
	// EPreloadBuffer 配列オブジェクト
	class	EPreloadQueue
	{
	public:
		EPreloadBuffer **	m_queue ;
		unsigned int		m_length ;
		unsigned int		m_limit ;
	public:
		// 構築関数
		EPreloadQueue( void ) ;
		// 消滅関数
		~EPreloadQueue( void ) ;
		// 配列の最大の長さを設定
		void SetLimit( unsigned int nLimit ) ;
		// 配列を消去
		void RemoveAll( void ) ;
	} ;
	//
	// KEY_POINT 配列オブジェクト
	class	EKeyPointList
	{
	public:
		KEY_POINT *		m_list ;
		unsigned int	m_count ;
		unsigned int	m_limit ;
	public:
		// 構築関数
		EKeyPointList( void ) ;
		// 消滅関数
		~EKeyPointList( void ) ;
		// 配列の最剤の長さを設定
		void SetLimit( unsigned int nLimit ) ;
		// 配列を消去
		void RemoveAll( void ) ;
	} ;
	//
	// スレッド用メッセージ
	enum	ThreadMessage
	{
		tmSeekFrame	= WM_USER,
		tmSeekSound,
		tmQuit
	} ;

	// ERIアニメーションファイル
	bool					m_fTopDown ;
	bool					m_fWaveOutput ;
	bool					m_fWaveStreaming ;
	ERIFile					m_erif ;
	// 展開オブジェクト
	EFileDecodeContext *	m_peric ;
	ERIDecoder *			m_perid ;
	EFileDecodeContext *	m_pmioc ;
	MIODecoder *			m_pmiod ;
	// 画像バッファ
	unsigned int			m_iCurrentFrame ;
	RASTER_IMAGE_INFO *		m_pDstImage ;
	ENTIS_PALETTE *			m_pPaletteTable ;
	RASTER_IMAGE_INFO *		m_pWorkImage ;
	// 先読みスレッド
	HANDLE					m_hThread ;
	DWORD					m_idThread ;
	// 画像先読みキュー
	EPreloadQueue			m_queueImage ;
	HANDLE					m_hQueueNotEmpty ;	// 先読みキューが空でない
	HANDLE					m_hQueueSpace ;		// 先読みキューに読み込み可能
	// フレームシーク用キーフレームポイント配列
	EKeyPointList			m_listKeyFrame ;
	EKeyPointList			m_listKeyWave ;
	// 排他的処理
	CRITICAL_SECTION		m_cs ;

protected:
	// 画像展開出力バッファ要求
	virtual RASTER_IMAGE_INFO * CreateImageBuffer
		( DWORD format, SDWORD width, SDWORD height,
					DWORD bpp, ENTIS_PALETTE ** ppaltbl ) ;
	// 画像展開出力バッファ消去
	virtual void DeleteImageBuffer
		( RASTER_IMAGE_INFO * prii, ENTIS_PALETTE * paltbl ) ;
	// 画像展開オブジェクト生成
	virtual ERIDecoder * CreateERIDecoder( void ) ;
	// 音声展開オブジェクト生成
	virtual MIODecoder * CreateMIODecoder( void ) ;
	// 音声出力要求
	virtual bool RequestWaveOut
		( DWORD channels, DWORD frequency, DWORD bps ) ;
	// 音声出力終了
	virtual void CloseWaveOut( void ) ;
	// 音声データ出力
	virtual void PushWaveBuffer( void * ptrWaveBuf, DWORD dwBytes ) ;
public:
	// 音声バッファ確保
	virtual void * AllocateWaveBuffer( DWORD dwBytes ) ;
	// 音声データ破棄許可
	virtual void DeleteWaveBuffer( void * ptrWaveBuf ) ;
	// 音声ストリーミング開始
	virtual void BeginWaveStreaming( void ) ;
	// 音声ストリーミング終了
	virtual void EndWaveStreaming( void ) ;

public:
	// アニメーションファイルを開く
	bool Open( EFileObject * pFile,
			unsigned int nPreloadSize = 0, bool fTopDown = false ) ;
	// アニメーションファイルを閉じる
	void Close( void ) ;

	// 先頭フレームへ移動
	bool SeekToBegin( void ) ;
	// 次のフレームへ移動
	bool SeekToNextFrame( int nSkipFrame = 0 ) ;
	// 指定のフレームに移動
	bool SeekToFrame( unsigned int iFrameIndex ) ;
	// 指定のフレームはキーフレームか？
	bool IsKeyFrame( unsigned int iFrameIndex ) ;

protected:
	// 次のフレームを展開する
	bool DecodeNextFrame( void ) ;
	// 先読みバッファを取得する
	EPreloadBuffer * GetPreloadBuffer( void ) ;
	// 先読みバッファに追加する
	void AddPreloadBuffer( EPreloadBuffer * pBuffer ) ;

public:
	// ERIFile オブジェクトを取得する
	const ERIFile & GetERIFile( void ) const ;
	// カレントフレームのインデックスを取得する
	unsigned int CurrentIndex( void ) const ;
	// カレントフレームの画像を取得
	const RASTER_IMAGE_INFO * GetImageInfo( void ) const ;
	// パレットテーブル取得
	const ENTIS_PALETTE * GetPaletteEntries( void ) const ;
	// キーフレームを取得
	unsigned int GetKeyFrameCount( void ) const ;
	// 全フレーム数を取得
	unsigned int GetAllFrameCount( void ) const ;
	// 全アニメーション時間を取得
	unsigned int GetTotalTime( void ) const ;
	// フレーム番号から時間へ変換
	unsigned int FrameIndexToTime( unsigned int iFrameIndex ) const ;
	// 時間からフレーム番号へ変換
	unsigned int TimeToFrameIndex( unsigned int nMilliSec ) const ;

protected:
	// スレッド関数
	static DWORD WINAPI ThreadProc( LPVOID parameter ) ;
	DWORD LoadingThreadProc( void ) ;
	// キーフレームポイントを追加する
	void AddKeyPoint( EKeyPointList & list, KEY_POINT key ) ;
	// 指定のキーフレームを検索する
	KEY_POINT * SearchKeyPoint
		( EKeyPointList & list, unsigned int iKeyFrame ) ;
	// 指定のフレームにシークする
	void SeekKeyPoint
		( EKeyPointList & list,
			unsigned int iFrame, unsigned int & iCurtrentFrame ) ;
	// 指定の音声データまでシークしてストリーミング出力する
	void SeekKeyWave
		( EKeyPointList & list, unsigned int iFrame ) ;

public:
	// 排他処理（クリティカルセクション）
	void Lock( void ) ;
	void Unlock( void ) ;

} ;


/*****************************************************************************
                  ERIアニメーションファイル出力オブジェクト
 *****************************************************************************/

class	ERIAnimationWriter
{
public:
	// 構築関数
	ERIAnimationWriter( void ) ;
	// 消滅関数
	~ERIAnimationWriter( void ) ;

protected:
	//
	// 出力バッファオブジェクト
	class	EOutputBuffer
	{
	public:
		EOutputBuffer *	m_ptrNext ;
		DWORD			m_dwBytes ;
		PVOID			m_ptrBuffer ;
	public:
		// 構築関数
		EOutputBuffer( const BYTE * ptrBuffer, ULONG nBytes ) ;
		// 消滅関数
		~EOutputBuffer( void ) ;
	} ;
	//
	// 圧縮コンテキスト
	class	EEncodeContext	: public	RLHEncodeContext
	{
	public:
		EOutputBuffer *	m_pFirstBuf ;
		EOutputBuffer *	m_pLastBuf ;
		DWORD			m_dwTotalBytes ;
	public:
		// 構築関数
		EEncodeContext( void ) ;
		// 消滅関数
		virtual ~EEncodeContext( void ) ;
		// データ消去
		void Delete( void ) ;
		// 次のデータを書き出す
		virtual ULONG WriteNextData( const BYTE * ptrBuffer, ULONG nBytes ) ;
	} ;
	//
	// スレッドメッセージ
	enum	ThreadMessage
	{
		tmEncodeImage	= WM_USER,
		tmQuit
	} ;

	// 書き出しステータス
	enum	WriterStatus
	{
		wsNotOpened,
		wsOpened,
		wsWritingHeader,
		wsWritingStream
	} ;
	WriterStatus			m_wsStatus ;		// ステータス
	// ファイルオブジェクト
	ERIWriteFile			m_eriwf ;			// ファイルオブジェクト
	// ヘッダ情報
	DWORD					m_dwHeaderBytes ;	// ヘッダレコードのバイト数
	ERI_FILE_HEADER			m_efh ;				// ファイルヘッダ
	ERI_INFO_HEADER			m_prvwih ;			// プレビュー画像情報ヘッダ
	ERI_INFO_HEADER			m_eih ;				// 画像情報ヘッダ
	MIO_INFO_HEADER			m_mih ;				// 音声情報ヘッダ
	// フレーム番号
	DWORD					m_dwKeyFrame ;		// キーフレーム
	DWORD					m_dwKeyWave ;		// キーウェーブ
	DWORD					m_dwFrameCount ;	// 出力済みフレーム総数
	DWORD					m_dwWaveCount ;		// 出力済みウェーブ総数
	// 音声出力情報
	DWORD					m_dwMioHeaderPos ;		// 音声情報ヘッダの位置
	DWORD					m_dwOutputWaveSamples ;	// 出力済みサンプル数
	// 圧縮オブジェクト
	EEncodeContext			m_eric1 ;
	EEncodeContext			m_eric2 ;
	ERIEncoder *			m_perie1 ;
	ERIEncoder *			m_perie2 ;
	EFileEncodeContext *	m_pmioc ;
	MIOEncoder *			m_pmioe ;
	// 差分処理用バッファ
	RASTER_IMAGE_INFO *		m_priiLast ;
	RASTER_IMAGE_INFO *		m_priiBuf ;
	// 画像圧縮スレッド
	bool					m_fDualEncoding ;
	bool					m_fCompressSuccessed ;
	HANDLE					m_hCompressed ;
	HANDLE					m_hThread ;
	DWORD					m_idThread ;
	// 画像の圧縮パラメータ
	ERIEncoder::PARAMETER	m_eriep ;
	// 音声の圧縮パラメータ
	MIOEncoder::PARAMETER	m_mioep ;

public:
	// ファイルを開く
	bool Open( EWriteFileObj * pFile, ERIWriteFile::FileID fidType ) ;
	// ファイルを閉じる
	void Close( void ) ;

public:
	// ファイルヘッダを開く
	bool BeginFileHeader( DWORD dwKeyFrame, DWORD dwKeyWave ) ;
	// プレビュー画像情報ヘッダを書き出す
	bool WritePreviewInfo( const ERI_INFO_HEADER & eih ) ;
	// 画像情報ヘッダを書き出す
	bool WriteEriInfoHeader( const ERI_INFO_HEADER & eih ) ;
	// 音声情報ヘッダを書き出す
	bool WriteMioInfoHeader( const MIO_INFO_HEADER & mih ) ;
	// 著作権情報を書き出す
	bool WriteCopyright( const void * ptrCopyright, DWORD dwBytes ) ;
	// コメントを書き出す
	bool WriteDescription( const void * ptrDescription, DWORD dwBytes ) ;
	// ファイルヘッダを閉じる
	void EndFileHeader( void ) ;

public:
	// 画像の圧縮パラメータを設定する
	void SetImageCompressionParameter
			( const ERIEncoder::PARAMETER & eriep ) ;
	// 音声の圧縮パラメータを設定する
	void SetSoundCompressionParameter
			( const MIOEncoder::PARAMETER & mioep ) ;

public:
	// ストリームを開始する
	bool BeginStream( void ) ;
	// パレットテーブルを書き出す
	bool WritePaletteTable
		( const ENTIS_PALETTE * paltbl, unsigned int nLength ) ;
	// プレビュー画像を出力する
	bool WritePreviewData( const RASTER_IMAGE_INFO & rii, DWORD fdwFlags ) ;
	// 音声データを出力する
	bool WriteWaveData( const void * ptrWaveBuf, DWORD dwSampleCount ) ;
	// 画像データを出力する
	bool WriteImageData( const RASTER_IMAGE_INFO & rii, DWORD fdwFlags ) ;
	// ストリームを閉じる
	bool EndStream( DWORD dwTotalTime ) ;

protected:
	// 画像バッファを生成
	RASTER_IMAGE_INFO * CreateImageBuffer( const ERI_INFO_HEADER & eih ) ;
	// 画像バッファを消去
	void DeleteImageBuffer( RASTER_IMAGE_INFO * prii ) ;
	// 画像圧縮オブジェクトを生成
	virtual ERIEncoder * CreateERIEncoder( void ) ;
	// 音声圧縮オブジェクトを生成
	virtual MIOEncoder * CreateMIOEncoder( void ) ;

public:
	// 出力された画像の枚数を取得する
	DWORD GetWrittenFrameCount( void ) const ;
	// マルチスレッド圧縮を有効化
	void EnableDualEncoding( bool fDualEncoding ) ;

protected:
	// スレッド関数
	static DWORD WINAPI ThreadProc( LPVOID parameter ) ;
	DWORD EncodingThreadProc( void ) ;

} ;


#endif
