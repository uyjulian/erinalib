
; ****************************************************************************
;                        E R I N A - L i b r a r y
;                                                      最終更新 2001/11/04
; ----------------------------------------------------------------------------
;         Copyright (C) 2000-2001 Leshade Entis. All rights reserved.
; ****************************************************************************


;
;	画像情報構造体
; ----------------------------------------------------------------------------

PVOID	TypeDef	Ptr
PBYTE	TypeDef	Ptr Byte
PWORD	TypeDef	Ptr Word
PINT	TypeDef	Ptr SDWord
PREAL32	TypeDef	Ptr Real4

ERI_INFO_HEADER		Struct
dwVersion		DWord	?
fdwTransformation	DWord	?
dwArchitecture		DWord	?
fdwFormatType		DWord	?
nImageWidth		SDWord	?
nImageHeight		SDWord	?
dwBitsPerPixel		DWord	?
dwClippedPixel		DWord	?
dwSamplingFlags		DWord	?
dwQuantumizedBits	SDWord	?, ?
dwAllottedBits		DWord	?, ?
dwBlockingDegree	DWord	?
dwLappedBlock		DWord	?
dwFrameTransform	DWord	?
dwFrameDegree		DWord	?
ERI_INFO_HEADER		EndS

RASTER_IMAGE_INFO	Struct
fdwFormatType		DWord	?
ptrImageArray		PBYTE	?
nImageWidth		SDWord	?
nImageHeight		SDWord	?
dwBitsPerPixel		DWord	?
BytesPerLine		SDWord	?
RASTER_IMAGE_INFO	EndS
PRASTER_IMAGE_INFO	TypeDef	Ptr RASTER_IMAGE_INFO


;
;	例外処理構造体
; ----------------------------------------------------------------------------

TIB_pSEHList		Equ	00H
ExceptionContinueExecution	Equ	0
ExceptionContinueSearch		Equ	1
ExceptionNestedException	Equ	2
ExceptionCollidedUnwind		Equ	3


; ---- The size of 80387 registers in byte ----

SIZE_OF_80387_REGISTERS	Equ	80


; ---- The structure for floating registers ----

FLOATING_SAVE_AREA	Struct	1
ControlWord		DWORD	?
StatusWord		DWORD	?
TagWord			DWORD	?
ErrorOffset		DWORD	?
ErrorSelector		DWORD	?
DataOffset		DWORD	?
DataSelector		DWORD	?
RegisterArea		BYTE	SIZE_OF_80387_REGISTERS Dup( ? )
Cr0NpxState		DWORD	?
FLOATING_SAVE_AREA	EndS


; ---- The structure of the context that is IA32 ----

CONTEXT	Struct	1

ContextFlags	DWORD	?

__Dr0		DWORD	?
__Dr1		DWORD	?
__Dr2		DWORD	?
__Dr3		DWORD	?
__Dr6		DWORD	?
__Dr7		DWORD	?

FloatSave	FLOATING_SAVE_AREA	{}

__SegGs		DWORD	?
__SegFs		DWORD	?
__SegEs		DWORD	?
__SegDs		DWORD	?

__Edi		DWORD	?
__Esi		DWORD	?
__Ebx		DWORD	?
__Edx		DWORD	?
__Ecx		DWORD	?
__Eax		DWORD	?

__Ebp		DWORD	?
__Eip		DWORD	?
__SegCs		DWORD	?
__EFlags	DWORD	?
__Esp		DWORD	?
__SegSs		DWORD	?

CONTEXT	EndS
PCONTEXT		TypeDef	Ptr CONTEXT


; ---- The maximum number of exception parameters ----

EXCEPTION_MAXIMUM_PARAMETERS	Equ	15

; ---- The exception record ----

EXCEPTION_RECORD	Struct	1
ExceptionCode		DWORD	?
ExceptionFlags		DWORD	?
ExceptionRecord		PVOID	?
ExceptionAddress	PVOID	?
NumberParameters	DWORD	?
ExceptionInformation	DWORD	EXCEPTION_MAXIMUM_PARAMETERS Dup( ? )
EXCEPTION_RECORD	EndS
PEXCEPTION_RECORD	TypeDef	Ptr EXCEPTION_RECORD


;
;	ハフマン・ツリー・構造体
; ----------------------------------------------------------------------------

ERINA_CODE_FLAG		Equ	80000000H
ERINA_HUFFMAN_ESCAPE	Equ	7FFFFFFFH
ERINA_HUFFMAN_NULL	Equ	8000H
ERINA_HUFFMAN_MAX	Equ	4000H
ERINA_HUFFMAN_ROOT	Equ	200H

ERINA_HUFFMAN_NODE	Struct
m_weight		Word	?
m_parent		Word	?
m_child_code		DWord	?
ERINA_HUFFMAN_NODE	EndS

If	(SizeOf ERINA_HUFFMAN_NODE) Ne 8
	.Err
EndIf

PERINA_HUFFMAN_NODE	TypeDef	Ptr ERINA_HUFFMAN_NODE

ERINA_HUFFMAN_TREE	Struct
m_hnTree		ERINA_HUFFMAN_NODE	201H Dup( { } )
m_iSymLookup		SDWord	100H Dup( ? )
m_iEscape		SDWord	?
m_iTreePointer		SDWord	?
ERINA_HUFFMAN_TREE	EndS

PERINA_HUFFMAN_TREE	TypeDef	Ptr ERINA_HUFFMAN_TREE



;
;	ランレングス・ガンマ・コンテキスト
; ----------------------------------------------------------------------------

ARITHCODE_SYMBOL	Struct
wOccured		Word	?	; シンボルの出現回数
wSymbol			SWord	?	; シンボル
ARITHCODE_SYMBOL	EndS

STATISTICAL_MODEL	Struct
dwTotalSymbolCount	DWord	?	; 全シンボル数 < 10000H
SymbolTable		ARITHCODE_SYMBOL	1 Dup( { } )
STATISTICAL_MODEL	EndS

PSTATISTICAL_MODEL	TypeDef	Ptr STATISTICAL_MODEL

MTF_TABLE	Struct
iplt		BYTE	100H Dup( ? )
MTF_TABLE	EndS

PMTF_TABLE	TypeDef	Ptr MTF_TABLE


RLHDecodeContext	Struct

pvfnTable		PVOID	?	; 仮想関数テーブル

m_flgZero		SDWord	?	; ゼロフラグ
m_nLength		DWord	?	; ランレングス
m_nIntBufCount		DWord	?	; 中間入力バッファに蓄積されているビット数
m_dwIntBuffer		DWord	?	; 中間入力バッファ
m_nBufferingSize	DWord	?	; バッファリングするバイト数
m_nBufCount		DWord	?	; バッファの残りバイト数
m_ptrBuffer		PBYTE	?	; 入力バッファの先頭へのポインタ
m_ptrNextBuf		PBYTE	?	; 次に読み込むべき入力バッファへのポインタ

m_dwCodeRegister	DWord	?	; コードレジスタ
m_dwAugendRegister	DWord	?	; オージェンドレジスタ
m_dwCodeBuffer		DWord	?	; ビットバッファ
m_nVirtualPostBuf	SDWord	?	; 仮想バッファカウンタ
m_nSymbolBitCount	SDWord	?	; 符号のビット数
m_nSymbolSortCount	SDWord	?	; 符号の総数
m_maskSymbolBit		SDWord	?	; 符号のビットマスク
m_pLastStatisticalModel		PSTATISTICAL_MODEL	?
m_pStatisticalTable		PSTATISTICAL_MODEL	100H Dup( ? )

m_pMTFTable		PMTF_TABLE	101H Dup( ? )

m_pfnDecodeSymbols	PVOID	?

m_pLastHuffmanTree	PERINA_HUFFMAN_TREE	?
m_pHuffmanTree		PERINA_HUFFMAN_TREE	101H Dup( ? )

RLHDecodeContext	EndS

PRLHDecodeContext	TypeDef	Ptr RLHDecodeContext


;
;	仮想関数インデックス
; ----------------------------------------------------------------------------

VFI_Destructer		Equ	0
VFI_ReadNextData	Equ	4


;
;	展開オブジェクト
; ----------------------------------------------------------------------------

ERIDecoder	Struct

pvfnTable		PVOID	?	; 仮想関数テーブル

m_EriInfHdr		ERI_INFO_HEADER	{ }
m_nBlockSize		DWord		?
m_nBlockArea		DWord		?
m_nBlockSamples		DWord		?
m_nChannelCount		DWord		?
m_nWidthBlocks		DWord		?
m_nHeightBlockes	DWord		?

m_nDstBytesPerPixel	DWord		?

m_ptrOperations		PBYTE		?
m_ptrColumnBuf		PINT		?
m_ptrLineBuf		PINT		?
m_ptrBuffer		PINT		?
m_ptrSubBuf		PINT		?

m_fEnhancedMode		SDWord		?
m_pArrangeTable		PINT		4 Dup( ? )

m_pHuffmanTree		PERINA_HUFFMAN_TREE	?

m_nBlocksetCount	DWord		?
m_pfnBlockScaling	PVOID		?

m_ptrBuffer2		PREAL32		4 Dup( 4 Dup( ? ) )
m_ptrBuffer3		PREAL32		16 Dup( ? )
m_ptrBuffer4		PREAL32		16 Dup( ? )
m_ptrWorkDCT1		PREAL32		?
m_ptrWorkDCT2		PREAL32		?
m_nDCDiffBuffer		SDWord		16 Dup( ? )

m_ptrTableDC		PINT		?

m_rMatrixScale		Real4		?
m_rYScaleDC		Real4		?
m_rCScaleDC		Real4		?

ERIDecoder	EndS

PERIDecoder	TypeDef	Ptr ERIDecoder


;
;	グローバル変数
; ----------------------------------------------------------------------------

ERI_USE_MMX_PENTIUM	Equ	0002H
ERI_USE_XMM_P3		Equ	0008H

ExternDef	C ERI_EnabledProcessorType:DWord


;
;	関数プロトタイプ
; ----------------------------------------------------------------------------

IfNDef	_BORLAND_CPP

ERINA_HUFFMAN_TREE@@IncreaseOccuredCount	TextEqu	\
	<?IncreaseOccuedCount@ERINA_HUFFMAN_TREE@@QAEXH@Z>
ERINA_HUFFMAN_TREE@@Normalize		TextEqu	\
	<?Normalize@ERINA_HUFFMAN_TREE@@QAEXH@Z>
ERINA_HUFFMAN_TREE@@AddNewEntry		TextEqu	\
	<?AddNewEntry@ERINA_HUFFMAN_TREE@@QAEXH@Z>
ERINA_HUFFMAN_TREE@@RebuildBitMap	TextEqu	\
	<?RebuildBitMap@ERINA_HUFFMAN_TREE@@QAEXXZ>
ERINA_HUFFMAN_TREE@@HalfAndRebuild	TextEqu	\
	<?HalfAndRebuild@ERINA_HUFFMAN_TREE@@QAEXXZ>

RLHDecodeContext@@PrefetchBuffer	TextEqu	\
	<?PrefetchBuffer@RLHDecodeContext@@QAEHXZ>
RLHDecodeContext@@GetABit		TextEqu	\
	<?GetABit@RLHDecodeContext@@QAEHXZ>
RLHDecodeContext@@GetNBits		TextEqu	\
	<?GetNBits@RLHDecodeContext@@QAEIH@Z>
RLHDecodeContext@@GetACode		TextEqu	\
	<?GetACode@RLHDecodeContext@@QAEHXZ>
RLHDecodeContext@@DecodeGammaCodes	TextEqu	\
	<?DecodeGammaCodes@RLHDecodeContext@@QAEKPAHK@Z>
RLHDecodeContext@@DecodeRLMTFGCodes	TextEqu	\
	<?DecodeRLMTFGCodes@RLHDecodeContext@@QAEKPAEK@Z>
RLHDecodeContext@@DecodeArithmeticCodes	TextEqu	\
	<?DecodeArithmeticCodes@RLHDecodeContext@@QAEKPAHK@Z>
RLHDecodeContext@@GetAHuffmanCode	TextEqu	\
	<?GetAHuffmanCode@RLHDecodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@@Z>
RLHDecodeContext@@GetLengthHuffman	TextEqu	\
	<?GetLengthHuffman@RLHDecodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@@Z>
RLHDecodeContext@@DecodeERINACodes	TextEqu	\
	<?DecodeERINACodes@RLHDecodeContext@@QAEKPAHK@Z>
RLHDecodeContext@@DecodeERINACodes256	TextEqu	\
	<?DecodeERINACodes256@RLHDecodeContext@@QAEKPAEK@Z>
RLHDecodeContext@@DecodeERINACodesSBZL	TextEqu	\
	<?DecodeERINACodesSBZL@RLHDecodeContext@@QAEKPACK@Z>

ERIDecoder@@m_pfnColorOperation	TextEqu	\
	<?m_pfnColorOperation@ERIDecoder@@1PAP81@AEXXZA>
ERIDecoder@@PerformOperation	TextEqu	\
	<?PerformOperation@ERIDecoder@@IAEXKJPAPAH@Z>
ERIDecoder@@ColorOperation0000	TextEqu	\
	<?ColorOperation0000@ERIDecoder@@IAEXXZ>
ERIDecoder@@ColorOperation0101	TextEqu	\
	<?ColorOperation0101@ERIDecoder@@IAEXXZ>
ERIDecoder@@ColorOperation0110	TextEqu	\
	<?ColorOperation0110@ERIDecoder@@IAEXXZ>
ERIDecoder@@ColorOperation0111	TextEqu	\
	<?ColorOperation0111@ERIDecoder@@IAEXXZ>
ERIDecoder@@ColorOperation1001	TextEqu	\
	<?ColorOperation1001@ERIDecoder@@IAEXXZ>
ERIDecoder@@ColorOperation1010	TextEqu	\
	<?ColorOperation1010@ERIDecoder@@IAEXXZ>
ERIDecoder@@ColorOperation1011	TextEqu	\
	<?ColorOperation1011@ERIDecoder@@IAEXXZ>
ERIDecoder@@ColorOperation1101	TextEqu	\
	<?ColorOperation1101@ERIDecoder@@IAEXXZ>
ERIDecoder@@ColorOperation1110	TextEqu	\
	<?ColorOperation1110@ERIDecoder@@IAEXXZ>
ERIDecoder@@ColorOperation1111	TextEqu	\
	<?ColorOperation1111@ERIDecoder@@IAEXXZ>

ERIDecoder@@RestoreRGB24II	TextEqu	\
	<?RestoreRGB24II@ERIDecoder@@IAEXPAEJQAPAMHH@Z>
ERIDecoder@@RestoreRGBA32II	TextEqu	\
	<?RestoreRGBA32II@ERIDecoder@@IAEXPAEJQAPAMHH@Z>
ERIDecoder@@ConvertYUVtoRGB	TextEqu	\
	<?ConvertYUVtoRGB@ERIDecoder@@IAEXXZ>
ERIDecoder@@BlockScaling444	TextEqu	\
	<?BlockScaling444@ERIDecoder@@IAEXXZ>
ERIDecoder@@BlockScaling422	TextEqu	\
	<?BlockScaling422@ERIDecoder@@IAEXXZ>
ERIDecoder@@BlockScaling411	TextEqu	\
	<?BlockScaling411@ERIDecoder@@IAEXXZ>

Else

ERINA_HUFFMAN_TREE@@IncreaseOccuredCount	TextEqu	\
	<@ERINA_HUFFMAN_TREE@IncreaseOccuedCount$qi>
ERINA_HUFFMAN_TREE@@Normalize		TextEqu	\
	<@ERINA_HUFFMAN_TREE@Normalize$qi>
ERINA_HUFFMAN_TREE@@AddNewEntry		TextEqu	\
	<@ERINA_HUFFMAN_TREE@AddNewEntry$qi>
ERINA_HUFFMAN_TREE@@RebuildBitMap	TextEqu	\
	<@ERINA_HUFFMAN_TREE@RebuildBitMap$qv>
ERINA_HUFFMAN_TREE@@HalfAndRebuild	TextEqu	\
	<@ERINA_HUFFMAN_TREE@HalfAndRebuild$qv>

RLHDecodeContext@@PrefetchBuffer	TextEqu	\
	<@RLHDecodeContext@PrefetchBuffer$qv>
RLHDecodeContext@@GetABit		TextEqu	\
	<@RLHDecodeContext@GetABit$qv>
RLHDecodeContext@@GetNBits		TextEqu	\
	<@RLHDecodeContext@GetNBits$qi>
RLHDecodeContext@@GetACode		TextEqu	\
	<@RLHDecodeContext@GetACode$qv>
RLHDecodeContext@@DecodeGammaCodes	TextEqu	\
	<@RLHDecodeContext@DecodeGammaCodes$qpiul>
RLHDecodeContext@@DecodeRLMTFGCodes	TextEqu	\
	<@RLHDecodeContext@DecodeRLMTFGCodes$qpucul>
RLHDecodeContext@@DecodeArithmeticCodes	TextEqu	\
	<@RLHDecodeContext@DecodeArithmeticCodes$qpiul>
RLHDecodeContext@@GetAHuffmanCode	TextEqu	\
	<@RLHDecodeContext@GetAHuffmanCode$qp18ERINA_HUFFMAN_TREE>
RLHDecodeContext@@GetLengthHuffman	TextEqu	\
	<@RLHDecodeContext@GetLengthHuffman$qp18ERINA_HUFFMAN_TREE>
RLHDecodeContext@@DecodeERINACodes	TextEqu	\
	<@RLHDecodeContext@DecodeERINACodes$qpiul>
RLHDecodeContext@@DecodeERINACodes256	TextEqu	\
	<@RLHDecodeContext@DecodeERINACodes256$qpucul>
RLHDecodeContext@@DecodeERINACodesSBZL	TextEqu	\
	<@RLHDecodeContext@DecodeERINACodesSBZL$qpzcul>

ERIDecoder@@m_pfnColorOperation	TextEqu	\
	<@ERIDecoder@m_pfnColorOperation>
ERIDecoder@@PerformOperation	TextEqu	\
	<@ERIDecoder@PerformOperation$qullppi>
ERIDecoder@@ColorOperation0000	TextEqu	\
	<@ERIDecoder@ColorOperation0000$qv>
ERIDecoder@@ColorOperation0101	TextEqu	\
	<@ERIDecoder@ColorOperation0101$qv>
ERIDecoder@@ColorOperation0110	TextEqu	\
	<@ERIDecoder@ColorOperation0110$qv>
ERIDecoder@@ColorOperation0111	TextEqu	\
	<@ERIDecoder@ColorOperation0111$qv>
ERIDecoder@@ColorOperation1001	TextEqu	\
	<@ERIDecoder@ColorOperation1001$qv>
ERIDecoder@@ColorOperation1010	TextEqu	\
	<@ERIDecoder@ColorOperation1010$qv>
ERIDecoder@@ColorOperation1011	TextEqu	\
	<@ERIDecoder@ColorOperation1011$qv>
ERIDecoder@@ColorOperation1101	TextEqu	\
	<@ERIDecoder@ColorOperation1101$qv>
ERIDecoder@@ColorOperation1110	TextEqu	\
	<@ERIDecoder@ColorOperation1110$qv>
ERIDecoder@@ColorOperation1111	TextEqu	\
	<@ERIDecoder@ColorOperation1111$qv>

ERIDecoder@@RestoreRGB24II	TextEqu	\
	<@ERIDecoder@RestoreRGB24II$qpuclppfii>
ERIDecoder@@RestoreRGBA32II	TextEqu	\
	<@ERIDecoder@RestoreRGBA32II$qpuclppfii>
ERIDecoder@@ConvertYUVtoRGB	TextEqu	\
	<@ERIDecoder@ConvertYUVtoRGB$qv>
ERIDecoder@@BlockScaling444	TextEqu	\
	<@ERIDecoder@BlockScaling444$qv>
ERIDecoder@@BlockScaling422	TextEqu	\
	<@ERIDecoder@BlockScaling422$qv>
ERIDecoder@@BlockScaling411	TextEqu	\
	<@ERIDecoder@BlockScaling411$qv>

EndIf


ExternDef	ERIDecoder@@m_pfnColorOperation:Ptr Near32

eriEnableMMX	Proto	Near32 C , fForceEnable:DWord
eriDisableMMX	Proto	Near32 C , fForceDisable:DWord
eriInitializeFPU	Proto	Near32 C

eriAdditionOfFrame	Proto	Near32 C ,
	rii1:PRASTER_IMAGE_INFO, rii2:PRASTER_IMAGE_INFO
eriSubtractionOfFrame	Proto	Near32 C ,
	riiDst:PRASTER_IMAGE_INFO, riiSrc:PRASTER_IMAGE_INFO
eriCopyImage	Proto	Near32 C ,
	riiDst:PRASTER_IMAGE_INFO, riiSrc:PRASTER_IMAGE_INFO
eriEnlargeImageDouble	Proto	Near32 C ,
	riiDst:PRASTER_IMAGE_INFO, riiSrc:PRASTER_IMAGE_INFO

IfNDef	_BORLAND_CPP

ERINA_HUFFMAN_TREE@@IncreaseOccuredCount	Proto	Near32 SysCall ,
	iEntry:SDWord
ERINA_HUFFMAN_TREE@@Normalize		Proto	Near32 SysCall ,
	iEntry:SDWord
ERINA_HUFFMAN_TREE@@AddNewEntry		Proto	Near32 SysCall ,
	nNewCode:SDWord
ERINA_HUFFMAN_TREE@@HalfAndRebuild	Proto	Near32 SysCall

RLHDecodeContext@@PrefetchBuffer	Proto	Near32 SysCall
RLHDecodeContext@@GetABit		Proto	Near32 SysCall
RLHDecodeContext@@GetNBits		Proto	Near32 SysCall ,
	n:SDWord
RLHDecodeContext@@GetACode		Proto	Near32 SysCall
RLHDecodeContext@@DecodeGammaCodes	Proto	Near32 SysCall ,
	ptrDst:PINT, nCount:DWord
RLHDecodeContext@@DecodeRLMTFGCodes	Proto	Near32 SysCall ,
	ptrDst:PBYTE, nCount:DWord

RLHDecodeContext@@GetAHuffmanCode	Proto	Near32 SysCall ,
	tree:PERINA_HUFFMAN_TREE
RLHDecodeContext@@GetLengthHuffman	Proto	Near32 SysCall ,
	tree:PERINA_HUFFMAN_TREE
RLHDecodeContext@@DecodeERINACodes	Proto	Near32 SysCall ,
	ptrDst:PINT, nCount:DWord
RLHDecodeContext@@DecodeERINACodes256	Proto	Near32 SysCall ,
	ptrDst:PBYTE, nCount:DWord
RLHDecodeContext@@DecodeERINACodesSBZL	Proto	Near32 SysCall ,
	ptrDst:Ptr SByte, nCount:DWord

ERIDecoder@@PerformOperation		Proto	Near32 SysCall ,
	dwOpCode:DWord, nAllBlockLines:DWord, ptrNextLineBuf:Ptr PINT
ERIDecoder@@ColorOperation0000		Proto	Near32 SysCall
ERIDecoder@@ColorOperation0101		Proto	Near32 SysCall
ERIDecoder@@ColorOperation0110		Proto	Near32 SysCall
ERIDecoder@@ColorOperation0111		Proto	Near32 SysCall
ERIDecoder@@ColorOperation1001		Proto	Near32 SysCall
ERIDecoder@@ColorOperation1010		Proto	Near32 SysCall
ERIDecoder@@ColorOperation1011		Proto	Near32 SysCall
ERIDecoder@@ColorOperation1101		Proto	Near32 SysCall
ERIDecoder@@ColorOperation1110		Proto	Near32 SysCall
ERIDecoder@@ColorOperation1111		Proto	Near32 SysCall

ERIDecoder@@RestoreRGB24II		Proto	Near32 SysCall ,
	ptrDst:PBYTE, nLineBytes:SDWord,
	ptrSrc:Ptr PREAL32, nWidth:SDWord, nHeight:SDWord
ERIDecoder@@RestoreRGBA32II		Proto	Near32 SysCall ,
	ptrDst:PBYTE, nLineBytes:SDWord,
	ptrSrc:Ptr PREAL32, nWidth:SDWord, nHeight:SDWord
ERIDecoder@@ConvertYUVtoRGB		Proto	Near32 SysCall
ERIDecoder@@BlockScaling444		Proto	Near32 SysCall
ERIDecoder@@BlockScaling422		Proto	Near32 SysCall
ERIDecoder@@BlockScaling411		Proto	Near32 SysCall

Else

ERINA_HUFFMAN_TREE@@IncreaseOccuredCount	Proto	Near32 SysCall ,
	_this:PERINA_HUFFMAN_TREE, iEntry:SDWord
ERINA_HUFFMAN_TREE@@Normalize		Proto	Near32 SysCall ,
	_this:PERINA_HUFFMAN_TREE, iEntry:SDWord
ERINA_HUFFMAN_TREE@@AddNewEntry		Proto	Near32 SysCall ,
	_this:PERINA_HUFFMAN_TREE, nNewCode:SDWord
ERINA_HUFFMAN_TREE@@HalfAndRebuild	Proto	Near32 SysCall ,
	_this:PERINA_HUFFMAN_TREE

RLHDecodeContext@@PrefetchBuffer	Proto	Near32 SysCall ,
	_this:PRLHDecodeContext
RLHDecodeContext@@GetABit		Proto	Near32 SysCall ,
	_this:PRLHDecodeContext
RLHDecodeContext@@GetNBits		Proto	Near32 SysCall ,
	_this:PRLHDecodeContext, n:SDWord
RLHDecodeContext@@GetACode		Proto	Near32 SysCall ,
	_this:PRLHDecodeContext
RLHDecodeContext@@DecodeGammaCodes	Proto	Near32 SysCall ,
	_this:PRLHDecodeContext, ptrDst:PINT, nCount:DWord
RLHDecodeContext@@DecodeRLMTFGCodes	Proto	Near32 SysCall ,
	_this:PRLHDecodeContext, ptrDst:PBYTE, nCount:DWord

RLHDecodeContext@@GetAHuffmanCode	Proto	Near32 SysCall ,
	_this:PRLHDecodeContext, tree:PERINA_HUFFMAN_TREE
RLHDecodeContext@@GetLengthHuffman	Proto	Near32 SysCall ,
	_this:PRLHDecodeContext, tree:PERINA_HUFFMAN_TREE
RLHDecodeContext@@DecodeERINACodes	Proto	Near32 SysCall ,
	_this:PRLHDecodeContext, ptrDst:PINT, nCount:DWord
RLHDecodeContext@@DecodeERINACodes256	Proto	Near32 SysCall ,
	_this:PRLHDecodeContext, ptrDst:PBYTE, nCount:DWord
RLHDecodeContext@@DecodeERINACodesSBZL	Proto	Near32 SysCall ,
	_this:PRLHDecodeContext, ptrDst:Ptr SByte, nCount:DWord

ERIDecoder@@PerformOperation		Proto	Near32 SysCall ,
	_this:PERIDecoder,
	dwOpCode:DWord, nAllBlockLines:DWord, ptrNextLineBuf:Ptr PINT
ERIDecoder@@ColorOperation0000		Proto	Near32 SysCall ,
	_this:PERIDecoder
ERIDecoder@@ColorOperation0101		Proto	Near32 SysCall ,
	_this:PERIDecoder
ERIDecoder@@ColorOperation0110		Proto	Near32 SysCall ,
	_this:PERIDecoder
ERIDecoder@@ColorOperation0111		Proto	Near32 SysCall ,
	_this:PERIDecoder
ERIDecoder@@ColorOperation1001		Proto	Near32 SysCall ,
	_this:PERIDecoder
ERIDecoder@@ColorOperation1010		Proto	Near32 SysCall ,
	_this:PERIDecoder
ERIDecoder@@ColorOperation1011		Proto	Near32 SysCall ,
	_this:PERIDecoder
ERIDecoder@@ColorOperation1101		Proto	Near32 SysCall ,
	_this:PERIDecoder
ERIDecoder@@ColorOperation1110		Proto	Near32 SysCall ,
	_this:PERIDecoder
ERIDecoder@@ColorOperation1111		Proto	Near32 SysCall ,
	_this:PERIDecoder

ERIDecoder@@RestoreRGB24II		Proto	Near32 SysCall ,
	_this:PERIDecoder,
	ptrDst:PBYTE, nLineBytes:SDWord,
	ptrSrc:Ptr PREAL32, nWidth:SDWord, nHeight:SDWord
ERIDecoder@@RestoreRGBA32II		Proto	Near32 SysCall ,
	_this:PERIDecoder,
	ptrDst:PBYTE, nLineBytes:SDWord,
	ptrSrc:Ptr PREAL32, nWidth:SDWord, nHeight:SDWord
ERIDecoder@@ConvertYUVtoRGB		Proto	Near32 SysCall ,
	_this:PERIDecoder
ERIDecoder@@BlockScaling444		Proto	Near32 SysCall ,
	_this:PERIDecoder
ERIDecoder@@BlockScaling422		Proto	Near32 SysCall ,
	_this:PERIDecoder
ERIDecoder@@BlockScaling411		Proto	Near32 SysCall ,
	_this:PERIDecoder

EndIf


;
;	@TREE@@IncreaseOccuredCount マクロ
; ----------------------------------------------------------------------------
; @TREE@@IncreaseOccuredCount <decode_flag>
; ----------------------------------------------------------------------------
; 引数；
;	EBX register	: ERINA_HUFFMAN_TREE 構造体へのポインタ
;	EAX register	: 発生頻度を増加させる指標
;	decode_flag	: 復号専用コード指定フラグ
; レジスタ；
;	EBX, EBP, ESP レジスタは保証される
; ----------------------------------------------------------------------------

@TREE@@IncreaseOccuredCount	Macro	decode_flag:=<0>

	Mov	cx, [ebx].m_hnTree[eax * 8].m_weight
	Inc	cx
	Mov	[ebx].m_hnTree[eax * 8].m_weight, cx

	@TREE@@Normalize	decode_flag

	.If	[ebx].m_hnTree[ERINA_HUFFMAN_ROOT*8].m_weight \
						>= ERINA_HUFFMAN_MAX
		IfNDef	_BORLAND_CPP
			Mov	ecx, ebx
			Call	ERINA_HUFFMAN_TREE@@HalfAndRebuild
		Else
			Push	ebx
			Call	ERINA_HUFFMAN_TREE@@HalfAndRebuild
			Add	esp, (SizeOf DWord)
		EndIf
	.EndIf

	EndM


;
;	@TREE@@Normalize マクロ
; ----------------------------------------------------------------------------
; @TREE@@Normalize
; ----------------------------------------------------------------------------
; 引数；
;	EAX register	: 発生頻度を増加させる指標
;	EBX register	: ERINA_HUFFMAN_TREE 構造体へのポインタ
; レジスタ；
;	EBX, EBP, ESP レジスタは保証される
; ----------------------------------------------------------------------------

@TREE@@Normalize	Macro	decode_flag:=<0>
	Local	Loop_Begin

	MovZx	edx, [ebx].m_hnTree[eax * 8].m_weight
	MovZx	ecx, [ebx].m_hnTree[eax * 8].m_parent
	.If	eax < ERINA_HUFFMAN_ROOT
	Jmp	Loop_Begin
	Align	10H
	.Repeat
		;;
		;; 入れ替えるエントリを検索
Loop_Begin:	.If	[ebx].m_hnTree[eax * 8 + 8].m_weight >= dx
			;;
			;; 親の出現頻度を増加させる
			MovZx	edx, [ebx].m_hnTree[ecx * 8].m_weight
			Inc	edx
			Mov	eax, ecx
			Mov	[ebx].m_hnTree[ecx * 8].m_weight, dx
			MovZx	ecx, [ebx].m_hnTree[ecx * 8].m_parent
			Cmp	eax, ERINA_HUFFMAN_ROOT
			Jb	Loop_Begin
			.Break
		.EndIf
		Mov	ecx, eax			;; ecx = iSwap
		.Repeat
			Inc	ecx
		.Until	[ebx].m_hnTree[ecx * 8 + 8].m_weight >= dx
		;;
		;; 入れ替え
		Mov	edx, [ebx].m_hnTree[eax * 8].m_child_code
		.If	!(edx & ERINA_CODE_FLAG)
			Mov	[ebx].m_hnTree[edx * 8].m_parent, cx
			Mov	[ebx].m_hnTree[edx * 8 + 8].m_parent, cx
		Ife	decode_flag
		.Else
			.If	edx != (ERINA_CODE_FLAG Or ERINA_HUFFMAN_ESCAPE)
				And	edx, 0FFH
				Mov	[ebx].m_iSymLookup[edx * 4], ecx
			.Else
				Mov	[ebx].m_iEscape, ecx
			.EndIf
		EndIf
		.EndIf
		;;
		Mov	edx, [ebx].m_hnTree[ecx * 8].m_child_code
		.If	!(edx & ERINA_CODE_FLAG)
			Mov	[ebx].m_hnTree[edx * 8].m_parent, ax
			Mov	[ebx].m_hnTree[edx * 8 + 8].m_parent, ax
		Ife	decode_flag
		.Else
			.If	edx != (ERINA_CODE_FLAG Or ERINA_HUFFMAN_ESCAPE)
				And	edx, 0FFH
				Mov	[ebx].m_iSymLookup[edx * 4], eax
			.Else
				Mov	[ebx].m_iEscape, eax
			.EndIf
		EndIf
		.EndIf
		;;
		Mov	esi, [ebx].m_hnTree[eax * 8].m_child_code
		Mov	edi, [ebx].m_hnTree[ecx * 8].m_child_code
		Mov	dx, [ebx].m_hnTree[eax * 8].m_weight
		Mov	[ebx].m_hnTree[ecx * 8].m_child_code, esi
		Mov	si, [ebx].m_hnTree[ecx * 8].m_weight
		Mov	[ebx].m_hnTree[eax * 8].m_child_code, edi
		Mov	[ebx].m_hnTree[ecx * 8].m_weight, dx
		MovZx	ecx, [ebx].m_hnTree[ecx * 8].m_parent
		Mov	[ebx].m_hnTree[eax * 8].m_weight, si
		;;
		;; 親の重みを再計算する
		MovZx	edx, [ebx].m_hnTree[ecx * 8].m_weight
		Mov	eax, ecx
		Inc	edx
		Mov	[ebx].m_hnTree[ecx * 8].m_weight, dx
		MovZx	ecx, [ebx].m_hnTree[ecx * 8].m_parent
	.Until	eax >= ERINA_HUFFMAN_ROOT
	.EndIf

	EndM

