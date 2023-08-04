
/*****************************************************************************
                          E R I N A - L i b r a r y
                                                        最終更新 2002/05/26
 ----------------------------------------------------------------------------
         Copyright (C) 2000-2002 Leshade Entis. All rights reserved.
 *****************************************************************************/


#if	!defined(CXMIO_H_INCLUDE)
#define	CXMIO_H_INCLUDE

#if	!defined(ERIMATRIX_H_INCLUDE)
#include "erimatrix.h"
#endif

#if	!defined(CMPERI_H_INCLUDE)
#include "cmperi.h"
#endif


/*****************************************************************************
                            音声圧縮オブジェクト
 *****************************************************************************/

class	MIOEncoder
{
protected:
	MIO_INFO_HEADER		m_mioih ;				// 音声情報ヘッダ

	unsigned int		m_nBufLength ;			// バッファ長（サンプル数）
	void *				m_ptrBuffer1 ;			// 差分処理バッファ
	void *				m_ptrBuffer2 ;			// 並び替えバッファ
	SBYTE *				m_ptrBuffer3 ;			// インターリーブ用バッファ
	REAL32 *			m_ptrSamplingBuf ;		// サンプリング用バッファ
	REAL32 *			m_ptrInternalBuf ;		// 中間バッファ
	REAL32 *			m_ptrDstBuf ;			// 出力用バッファ
	REAL32 *			m_ptrWorkBuf ;			// DCT 演算用ワークエリア
	REAL32 *			m_ptrWeightTable ;		// 各周波数成分の重みテーブル
	REAL32 *			m_ptrLastDCT ;			// 直前ブロックの DCT 係数

public:
	struct	PARAMETER
	{
		double			rLowWeight ;			// 低周波成分の重み
		double			rMiddleWeight ;			// 中周波成分の重み
		double			rPowerScale ;			// 量子化の基準ビット数
		int				nOddWeight ;			// ブロック歪対策係数
		int				nPreEchoThreshold ;		// プリエコー対策閾値

		PARAMETER( void ) ;
	} ;

protected:
	PARAMETER			m_parameter ;

	SWORD *				m_ptrNextDstBuf ;		// 出力バッファアドレス
	REAL32 *			m_ptrLastDCTBuf ;		// 重複演算用バッファ
	unsigned int		m_nSubbandDegree ;		// 行列のサイズ
	unsigned int		m_nDegreeNum ;
	int					m_nFrequencyWidth[7] ;	// 各周波数帯の幅
	int					m_nFrequencyPoint[7] ;	// 各周波数帯の中心位置
	SIN_COS *			m_pRevolveParam ;

public:
	// 構築関数
	MIOEncoder( void ) ;
	// 消滅関数
	virtual ~MIOEncoder( void ) ;

	// 初期化（パラメータの設定）
	virtual int Initialize( const MIO_INFO_HEADER & infhdr ) ;
	// 終了（メモリの解放など）
	virtual void Delete( void ) ;
	// 音声を圧縮
	virtual int EncodeSound
		( RLHEncodeContext & context,
			const MIO_DATA_HEADER & datahdr, const void * ptrWaveBuf ) ;
	// 圧縮オプションを設定
	void SetCompressionParameter( const PARAMETER & parameter ) ;

protected:		// 可逆圧縮
	// 8ビットのPCMを圧縮
	int EncodeSoundPCM8
		( RLHEncodeContext & context,
			const MIO_DATA_HEADER & datahdr, const void * ptrWaveBuf ) ;
	// 16ビットのPCMを圧縮
	int EncodeSoundPCM16
		( RLHEncodeContext & context,
			const MIO_DATA_HEADER & datahdr, const void * ptrWaveBuf ) ;

protected:		// 非可逆圧縮
	// 行列サイズの変更に伴うパラメータの再計算
	void InitializeWithDegree( unsigned int nSubbandDegree ) ;
	// 指定サンプル列の音量を求める
	double EvaluateVolume( const REAL32 * ptrWave, int nCount ) ;
	// 分解コードを取得する
	int GetDivisionCode( const REAL32 * ptrSamples ) ;

protected:	// モノラル・ステレオ
	// 16ビットの非可逆圧縮
	int EncodeSoundDCT
		( RLHEncodeContext & context,
			const MIO_DATA_HEADER & datahdr, const void * ptrWaveBuf ) ;
	// LOT 変換を施す
	void PerformLOT
		( RLHEncodeContext & context,
			REAL32 * ptrSamples, REAL32 rPowerScale ) ;
	// 通常のブロックを符号化して出力する
	int EncodeInternalBlock
		( RLHEncodeContext & context,
			REAL32 * ptrSamples, REAL32 rPowerScale ) ;
	// リードブロックを符号化して出力する
	int EncodeLeadBlock
		( RLHEncodeContext & context,
			REAL32 * ptrSamples, REAL32 rPowerScale ) ;
	// ポストブロックを符号化して出力する
	int EncodePostBlock
		( RLHEncodeContext & context, REAL32 rPowerScale ) ;
	// 量子化
	void Quantumize
		( PINT ptrQuantumized, const REAL32 * ptrSource,
			int nDegreeNum, REAL32 rPowerScale,
			DWORD * ptrWeightCode, int * ptrCoefficient ) ;

protected:		// ミドルサイドステレオ
	// 16ビットの非可逆圧縮
	int EncodeSoundDCT_MSS
		( RLHEncodeContext & context,
			const MIO_DATA_HEADER & datahdr, const void * ptrWaveBuf ) ;
	// 回転パラメータを取得する
	int GetRevolveCode
		( const REAL32 * ptrBuf1, const REAL32 * ptrBuf2 ) ;
	// LOT 変換を施す
	void PerformLOT_MSS
		( REAL32 * ptrDst, REAL32 * ptrLapBuf, REAL32 * ptrSrc ) ;
	// 通常のブロックを符号化して出力する
	int EncodeInternalBlock_MSS
		( RLHEncodeContext & context,
			REAL32 * ptrSrc1, REAL32 * ptrSrc2, REAL32 rPowerScale ) ;
	// リードブロックを符号化して出力する
	int EncodeLeadBlock_MSS
		( RLHEncodeContext & context,
			REAL32 * ptrSrc1, REAL32 * ptrSrc2, REAL32 rPowerScale ) ;
	// ポストブロックを符号化して出力する
	int EncodePostBlock_MSS
		( RLHEncodeContext & context, REAL32 rPowerScale ) ;
	// 量子化
	void Quantumize_MSS
		( PINT ptrQuantumized, const REAL32 * ptrSource,
			int nDegreeNum, REAL32 rPowerScale,
			DWORD * ptrWeightCode, int * ptrCoefficient ) ;

} ;


/*****************************************************************************
                            音声展開オブジェクト
 *****************************************************************************/

class	MIODecoder
{
protected:
	MIO_INFO_HEADER		m_mioih ;				// 音声情報ヘッダ

	unsigned int		m_nBufLength ;			// バッファ長（サンプル数）
	void *				m_ptrBuffer1 ;			// 差分処理バッファ
	void *				m_ptrBuffer2 ;			// 並び替えバッファ
	SBYTE *				m_ptrBuffer3 ;			// インターリーブ用バッファ
	PBYTE				m_ptrDivisionTable ;	// 分解コードテーブル
	PBYTE				m_ptrRevolveCode ;		// 回転コードテーブル
	SDWORD *			m_ptrWeightCode ;		// 量子化係数テーブル
	PINT				m_ptrCoefficient ;		//
	REAL32 *			m_ptrMatrixBuf ;		// 行列演算用バッファ
	REAL32 *			m_ptrInternalBuf ;		// 中間バッファ
	REAL32 *			m_ptrWorkBuf ;			// DCT 演算用ワークエリア
	REAL32 *			m_ptrWorkBuf2 ;
	REAL32 *			m_ptrWeightTable ;		// 各周波数成分の重みテーブル
	REAL32 *			m_ptrLastDCT ;			// 直前の DCT 係数

	PBYTE				m_ptrNextDivision ;		// 次の分解コード
	PBYTE				m_ptrNextRevCode ;		// 次の回転コード
	SDWORD *			m_ptrNextWeight ;		// 次の量子化係数
	PINT				m_ptrNextCoefficient ;	//
	PINT				m_ptrNextSource ;		// 次の入力信号
	REAL32 *			m_ptrLastDCTBuf ;		// 重複演算用バッファ
	unsigned int		m_nSubbandDegree ;		// 行列のサイズ
	unsigned int		m_nDegreeNum ;
	SIN_COS *			m_pRevolveParam ;
	int					m_nFrequencyPoint[7] ;	// 各周波数帯の中心位置

public:
	// 構築関数
	MIODecoder( void ) ;
	// 消滅関数
	virtual ~MIODecoder( void ) ;

	// 初期化（パラメータの設定）
	virtual int Initialize( const MIO_INFO_HEADER & infhdr ) ;
	// 終了（メモリの解放など）
	virtual void Delete( void ) ;
	// 音声を圧縮
	virtual int DecodeSound
		( RLHDecodeContext & context,
			const MIO_DATA_HEADER & datahdr, void * ptrWaveBuf ) ;

protected:		// 可逆圧縮
	// 8ビットのPCMを展開
	int DecodeSoundPCM8
		( RLHDecodeContext & context,
			const MIO_DATA_HEADER & datahdr, void * ptrWaveBuf ) ;
	// 16ビットのPCMを展開
	int DecodeSoundPCM16
		( RLHDecodeContext & context,
			const MIO_DATA_HEADER & datahdr, void * ptrWaveBuf ) ;

protected:		// モノラル・ステレオ
	// 行列サイズの変更に伴うパラメータの再計算
	void InitializeWithDegree( unsigned int nSubbandDegree ) ;
	// 16ビットの非可逆展開
	int DecodeSoundDCT
		( RLHDecodeContext & context,
			const MIO_DATA_HEADER & datahdr, void * ptrWaveBuf ) ;
	// 通常のブロックを復号する
	int DecodeInternalBlock
		( SWORD * ptrDst, unsigned int nSamples ) ;
	// リードブロックを復号する
	int DecodeLeadBlock( void ) ;
	// ポストブロックを復号する
	int DecodePostBlock
		( SWORD * ptrDst, unsigned int nSamples ) ;
	// 逆量子化
	void IQuantumize
		( REAL32 * ptrDestination,
			const INT * ptrQuantumized, int nDegreeNum,
			SDWORD nWeightCode, int nCoefficient ) ;

protected:		// ミドルサイドステレオ
	// 16ビットの非可逆展開
	int DecodeSoundDCT_MSS
		( RLHDecodeContext & context,
			const MIO_DATA_HEADER & datahdr, void * ptrWaveBuf ) ;
	// 通常のブロックを復号する
	int DecodeInternalBlock_MSS
		( SWORD * ptrDst, unsigned int nSamples ) ;
	// リードブロックを復号する
	int DecodeLeadBlock_MSS( void ) ;
	// ポストブロックを復号する
	int DecodePostBlock_MSS
		( SWORD * ptrDst, unsigned int nSamples ) ;

} ;


#endif
