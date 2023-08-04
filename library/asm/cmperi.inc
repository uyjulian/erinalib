
; ****************************************************************************
;                        E R I N A - L i b r a r y
;                                                      最終更新 2000/04/06
; ----------------------------------------------------------------------------
;         Copyright (C) 2000-2001 Leshade Entis. All rights reserved.
; ****************************************************************************


;
;	圧縮コンテキスト
; ----------------------------------------------------------------------------

RLHEncodeContext	Struct

pvfnTable		PVOID	?	; 仮想関数テーブル

m_nIntBufCount		SDWord	?	; 中間入力バッファに蓄積されているビット数
m_dwIntBuffer		DWord	?	; 中間入力バッファ
m_nBufferingSize	DWord	?	; バッファリングするバイト数
m_nBufCount		DWord	?	; バッファに蓄積されているバイト数
m_ptrBuffer		PBYTE	?	; 出力バッファの先頭へのポインタ

m_pMTFTable		PMTF_TABLE	101H Dup( ? )

m_pLastHuffmanTree	PERINA_HUFFMAN_TREE	?
m_pHuffmanTree		PERINA_HUFFMAN_TREE	101H Dup( ? )

RLHEncodeContext	EndS

PRLHEncodeContext	TypeDef	Ptr RLHEncodeContext


VFI_WriteNextData	Equ	4


;
;	圧縮オブジェクト
; ----------------------------------------------------------------------------

ERIEncoder		Struct

pvfnTable		PVOID	?		; 仮想関数テーブル

m_EriInfHdr		ERI_INFO_HEADER	{ }	; 画像情報ヘッダ

m_nBlockSize		DWord	?		; ブロッキングサイズ
m_nBlockArea		DWord	?		; ブロック面積
m_nBlockSamples		DWord	?		; ブロックのサンプル数
m_nChannelCount		DWord	?		; チャネル数
m_nWidthBlocks		DWord	?		; 画像の幅（ブロック数）
m_nHeightBlocks		DWord	?		; 画像の高さ（ブロック数）

m_nSrcBytesPerPixel	DWord	?		; 1ピクセルのバイト数

m_ptrColumnBuf		PINT	?		; 列バッファ
m_ptrLineBuf		PINT	?		; 行バッファ
m_ptrBuffer1		PINT	?		; 内部バッファ
m_ptrBuffer2		PINT	?
m_nChannelDepth		SDWord	?		; チャネルのビット深度

m_pArrangeTable		PINT	4 Dup( ? )	; サンプリングテーブル

m_ptrOperations		PBYTE	?		; オペレーションテーブル
m_ptrDstBuffer		PINT	?		; デスティネーションバッファ

m_pHuffmanTree		PERINA_HUFFMAN_TREE ?	; ハフマン木

ERIEncoder		EndS

PERIEncoder	TypeDef	Ptr ERIEncoder



;
;	関数プロトタイプ
; ----------------------------------------------------------------------------

IfNDef	_BORLAND_CPP

RLHEncodeContext@@OutNBits	TextEqu	\
	<?OutNBits@RLHEncodeContext@@QAEHKH@Z>
RLHEncodeContext@@OutACode	TextEqu	\
	<?OutACode@RLHEncodeContext@@QAEHH@Z>
RLHEncodeContext@@TryEncodeGammaCodes	TextEqu	\
	<?TryEncodeGammaCodes@RLHEncodeContext@@SAHPBHH@Z>
RLHEncodeContext@@OutAHuffmanCode	TextEqu	\
	<?OutAHuffmanCode@RLHEncodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@H@Z>
RLHEncodeContext@@OutLengthHuffman	TextEqu	\
	<?OutLengthHuffman@RLHEncodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@H@Z>
RLHEncodeContext@@EncodeERINACodes	TextEqu	\
	<?EncodeERINACodes@RLHEncodeContext@@QAEHPBHH@Z>
RLHEncodeContext@@EncodeERINACodes256	TextEqu	\
	<?EncodeERINACodes256@RLHEncodeContext@@QAEHPBEH@Z>
RLHEncodeContext@@EncodeERINACodesSBZL	TextEqu	\
	<?EncodeERINACodesSBZL@RLHEncodeContext@@QAEHPBCH@Z>

ERIEncoder@@m_pfnColorOperation		TextEqu	\
	<?m_pfnColorOperation@ERIEncoder@@1PAP81@AEXXZA>
ERIEncoder@@DifferentialOperation	TextEqu	\
	<?DifferentialOperation@ERIEncoder@@IAEXJPAPAH@Z>
ERIEncoder@@DecideOperationCode		TextEqu	\
	<?DecideOperationCode@ERIEncoder@@IAEKHJPAPAH@Z>
ERIEncoder@@ColorOperation0000		TextEqu	\
	<?ColorOperation0000@ERIEncoder@@IAEXXZ>
ERIEncoder@@ColorOperation0101		TextEqu	\
	<?ColorOperation0101@ERIEncoder@@IAEXXZ>
ERIEncoder@@ColorOperation0110		TextEqu	\
	<?ColorOperation0110@ERIEncoder@@IAEXXZ>
ERIEncoder@@ColorOperation0111		TextEqu	\
	<?ColorOperation0111@ERIEncoder@@IAEXXZ>
ERIEncoder@@ColorOperation1001		TextEqu	\
	<?ColorOperation1001@ERIEncoder@@IAEXXZ>
ERIEncoder@@ColorOperation1010		TextEqu	\
	<?ColorOperation1010@ERIEncoder@@IAEXXZ>
ERIEncoder@@ColorOperation1011		TextEqu	\
	<?ColorOperation1011@ERIEncoder@@IAEXXZ>
ERIEncoder@@ColorOperation1101		TextEqu	\
	<?ColorOperation1101@ERIEncoder@@IAEXXZ>
ERIEncoder@@ColorOperation1110		TextEqu	\
	<?ColorOperation1110@ERIEncoder@@IAEXXZ>
ERIEncoder@@ColorOperation1111		TextEqu	\
	<?ColorOperation1111@ERIEncoder@@IAEXXZ>

RLHEncodeContext@@OutNBits	Proto	Near32 SysCall ,
	dwData:DWord, n:SDWord
RLHEncodeContext@@OutACode	Proto	Near32 SysCall ,
	num:SDWord
RLHEncodeContext@@TryEncodeGammaCodes	Proto	Near32 SysCall ,
	ptrSrc:PINT, nCount:DWord
RLHEncodeContext@@OutAHuffmanCode	Proto	Near32 SysCall ,
	tree:PERINA_HUFFMAN_TREE, num:SDWord
RLHEncodeContext@@OutLengthHuffman	Proto	Near32 SysCall ,
	tree:PERINA_HUFFMAN_TREE, _length:DWord
RLHEncodeContext@@EncodeERINACodes	Proto	Near32 SysCall ,
	ptrSrc:PINT, nCount:DWord
RLHEncodeContext@@EncodeERINACodes256	Proto	Near32 SysCall ,
	ptrSrc:PBYTE, nCount:DWord
RLHEncodeContext@@EncodeERINACodesSBZL	Proto	Near32 SysCall ,
	ptrSrc:Ptr SByte, nCount:DWord

ExternDef	ERIEncoder@@m_pfnColorOperation:Ptr Near32
ERIEncoder@@DifferentialOperation	Proto	Near32 SysCall ,
	nAllBlockLines:DWord, ptrNextLineBuf:Ptr PINT
ERIEncoder@@DecideOperationCode	Proto	Near32 SysCall ,
	nCompressMode:DWord, nAllBlockLines:DWord, ptrNextLineBuf:Ptr PINT
ERIEncoder@@ColorOperation0000	Proto	Near32 SysCall
ERIEncoder@@ColorOperation0101	Proto	Near32 SysCall
ERIEncoder@@ColorOperation0110	Proto	Near32 SysCall
ERIEncoder@@ColorOperation0111	Proto	Near32 SysCall
ERIEncoder@@ColorOperation1001	Proto	Near32 SysCall
ERIEncoder@@ColorOperation1010	Proto	Near32 SysCall
ERIEncoder@@ColorOperation1011	Proto	Near32 SysCall
ERIEncoder@@ColorOperation1101	Proto	Near32 SysCall
ERIEncoder@@ColorOperation1110	Proto	Near32 SysCall
ERIEncoder@@ColorOperation1111	Proto	Near32 SysCall

Else

RLHEncodeContext@@OutNBits	TextEqu	\
	<@RLHEncodeContext@OutNBits$quli>
RLHEncodeContext@@OutACode	TextEqu	\
	<@RLHEncodeContext@TryOutACode$qi>
RLHEncodeContext@@TryEncodeGammaCodes	TextEqu	\
	<@RLHEncodeContext@TryEncodeGammaCodes$qpxii>
RLHEncodeContext@@OutAHuffmanCode	TextEqu	\
	<@RLHEncodeContext@OutAHuffmanCode$qp18ERINA_HUFFMAN_TREEi>
RLHEncodeContext@@OutLengthHuffman	TextEqu	\
	<@RLHEncodeContext@OutLengthHuffman$qp18ERINA_HUFFMAN_TREEi>
RLHEncodeContext@@EncodeERINACodes	TextEqu	\
	<@RLHEncodeContext@EncodeERINACodes$qpxii>
RLHEncodeContext@@EncodeERINACodes256	TextEqu	\
	<@RLHEncodeContext@EncodeERINACodes256$qpxuci>
RLHEncodeContext@@EncodeERINACodesSBZL	TextEqu	\
	<@RLHEncodeContext@EncodeERINACodesSBZL$qpxzci>

ERIEncoder@@m_pfnColorOperation		TextEqu	\
	<@ERIEncoder@m_pfnColorOperation>
ERIEncoder@@DifferentialOperation	TextEqu	\
	<@ERIEncoder@DifferentialOperation$qlppi>
ERIEncoder@@DecideOperationCode		TextEqu	\
	<@ERIEncoder@DecideOperationCode$qilppi>
ERIEncoder@@ColorOperation0000		TextEqu	\
	<@ERIEncoder@ColorOperation0000$qv>
ERIEncoder@@ColorOperation0101		TextEqu	\
	<@ERIEncoder@ColorOperation0101$qv>
ERIEncoder@@ColorOperation0110		TextEqu	\
	<@ERIEncoder@ColorOperation0110$qv>
ERIEncoder@@ColorOperation0111		TextEqu	\
	<@ERIEncoder@ColorOperation0111$qv>
ERIEncoder@@ColorOperation1001		TextEqu	\
	<@ERIEncoder@ColorOperation1001$qv>
ERIEncoder@@ColorOperation1010		TextEqu	\
	<@ERIEncoder@ColorOperation1010$qv>
ERIEncoder@@ColorOperation1011		TextEqu	\
	<@ERIEncoder@ColorOperation1011$qv>
ERIEncoder@@ColorOperation1101		TextEqu	\
	<@ERIEncoder@ColorOperation1101$qv>
ERIEncoder@@ColorOperation1110		TextEqu	\
	<@ERIEncoder@ColorOperation1110$qv>
ERIEncoder@@ColorOperation1111		TextEqu	\
	<@ERIEncoder@ColorOperation1111$qv>

RLHEncodeContext@@OutNBits	Proto	Near32 SysCall ,
	_this:PRLHEncodeContext, dwData:DWord, n:SDWord
RLHEncodeContext@@OutACode	Proto	Near32 SysCall ,
	_this:PRLHEncodeContext, num:SDWord
RLHEncodeContext@@TryEncodeGammaCodes	Proto	Near32 SysCall ,
	ptrSrc:PINT, nCount:DWord
RLHEncodeContext@@OutAHuffmanCode	Proto	Near32 SysCall ,
	_this:PRLHEncodeContext, tree:PERINA_HUFFMAN_TREE, num:SDWord
RLHEncodeContext@@OutLengthHuffman	Proto	Near32 SysCall ,
	_this:PRLHEncodeContext, tree:PERINA_HUFFMAN_TREE, _length:DWord
RLHEncodeContext@@EncodeERINACodes	Proto	Near32 SysCall ,
	_this:PRLHEncodeContext, ptrSrc:PINT, nCount:DWord
RLHEncodeContext@@EncodeERINACodes256	Proto	Near32 SysCall ,
	_this:PRLHEncodeContext, ptrSrc:PBYTE, nCount:DWord
RLHEncodeContext@@EncodeERINACodesSBZL	Proto	Near32 SysCall ,
	_this:PRLHEncodeContext, ptrSrc:Ptr SByte, nCount:DWord

ExternDef	ERIEncoder@@m_pfnColorOperation:Ptr Near32
ERIEncoder@@DifferentialOperation	Proto	Near32 SysCall ,
	_this:PERIEncoder, nAllBlockLines:DWord, ptrNextLineBuf:Ptr PINT
ERIEncoder@@DecideOperationCode	Proto	Near32 SysCall ,
	_this:PERIEncoder,
	nCompressMode:DWord, nAllBlockLines:DWord, ptrNextLineBuf:Ptr PINT
ERIEncoder@@ColorOperation0000	Proto	Near32 SysCall ,
	_this:PERIEncoder
ERIEncoder@@ColorOperation0101	Proto	Near32 SysCall ,
	_this:PERIEncoder
ERIEncoder@@ColorOperation0110	Proto	Near32 SysCall ,
	_this:PERIEncoder
ERIEncoder@@ColorOperation0111	Proto	Near32 SysCall ,
	_this:PERIEncoder
ERIEncoder@@ColorOperation1001	Proto	Near32 SysCall ,
	_this:PERIEncoder
ERIEncoder@@ColorOperation1010	Proto	Near32 SysCall ,
	_this:PERIEncoder
ERIEncoder@@ColorOperation1011	Proto	Near32 SysCall ,
	_this:PERIEncoder
ERIEncoder@@ColorOperation1101	Proto	Near32 SysCall ,
	_this:PERIEncoder
ERIEncoder@@ColorOperation1110	Proto	Near32 SysCall ,
	_this:PERIEncoder
ERIEncoder@@ColorOperation1111	Proto	Near32 SysCall ,
	_this:PERIEncoder

EndIf
