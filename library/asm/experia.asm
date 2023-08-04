
; ****************************************************************************
;                        E R I N A - L i b r a r y
;                                                      最終更新 2002/05/26
; ----------------------------------------------------------------------------
;         Copyright (C) 2000-2002 Leshade Entis. All rights reserved.
; ****************************************************************************


	.586
	.XMM
	.Model	Flat

	Include	experi.inc

	MMWord	TextEqu	<QWord>


; ----------------------------------------------------------------------------
;                            データセグメント
; ----------------------------------------------------------------------------

DataSeg	Segment	Para Flat 'DATA'

ERI_EnabledProcessorType	DWord	0

DataSeg	EndS


ConstSeg	Segment	Para ReadOnly Flat 'CONST'

;
;	YUV -> RGB 変換定数
; ----------------------------------------------------------------------------

Align	10H
ERI_r3by2	Real8	1.5
ERI_rM3by8	Real8	-0.375
ERI_rM3by4	Real8	-0.75
ERI_r7by4	Real8	1.75

Align	10H
ERI_XMM_r3by2	Real4	1.5, 1.5, 1.5, 1.5
ERI_XMM_rM3by8	Real4	-0.375, -0.375, -0.375, -0.375
ERI_XMM_rM3by4	Real4	-0.75, -0.75, -0.75, -0.75
ERI_XMM_r7by4	Real4	1.75, 1.75, 1.75, 1.75


ConstSeg	EndS



; ----------------------------------------------------------------------------
;                             コードセグメント
; ----------------------------------------------------------------------------

CodeSeg	Segment	Para ReadOnly Flat 'CODE'

;
;	CPU が MMX に対応しているか調べ、フラグを設定する
; ----------------------------------------------------------------------------
Align	10H
eriEnableMMX	Proc	Near32 C Uses ebx edi esi, fForceEnable:DWord

	.If	fForceEnable != 0
		Or	ERI_EnabledProcessorType, ERI_USE_MMX_PENTIUM
		Ret
	.EndIf
	;
	; プロセッサが 80386 か 80486 以降かを判定
	;
	Mov	ERI_EnabledProcessorType, 0
	Mov	ecx, esp
	And	esp, (Not 03H)
	PushFD
	PushFD
	Pop	eax
	Mov	ebx, eax
	Xor	eax, 00040000H
	Push	eax
	PopFD
	PushFD
	Pop	eax
	PopFD
	Mov	esp, ecx
	Cmp	eax, ebx
	Jz	Label_Exit	; → 80386
	;
	; ローカル例外ハンドラを設定
	;
	PushContext	Assumes
	Assume	fs:Flat
	Push	ebp
	Push	(Offset Label_ExceptionHandler)
	Push	DWord Ptr fs:[TIB_pSEHList]
	Mov	DWord Ptr fs:[TIB_pSEHList], esp
	;
	; ベンダー ID 取得 (インテル純正プロセッサか比較 : "GenuineIntel")
	;
	Xor	eax, eax
	CPUID
	.If	(eax >= 1) && (ebx == 756E6547H) && \
			(edx == 49656E69H) && (ecx == 6C65746EH)
		;
		; ヒューチャーフラグを取得
		; 
		Mov	eax, 1
		CPUID
		.If	(fForceEnable & ERI_USE_MMX_PENTIUM) \
				|| (edx & (1 Shl 23))
			;
			; MMX 命令セットがサポートされている
			;
			Or	ERI_EnabledProcessorType, ERI_USE_MMX_PENTIUM
		.EndIf
		.If	(fForceEnable & ERI_USE_XMM_P3) \
				|| (edx & (1 Shl 25))
			;
			; XMM 命令セットがサポートされている
			;
			Or	ERI_EnabledProcessorType, ERI_USE_XMM_P3
		.EndIf
	.EndIf
Label_EndTry:
	;
	; ローカル例外ハンドラを閉じる
	;
	Pop	DWord Ptr fs:[TIB_pSEHList]
	Add	esp, (SizeOf DWord) * 2
	PopContext	Assumes
	;
Label_Exit:
	Ret


Label_ExceptionHandler:
	Push	ebp
	Mov	edx, DWord Ptr ss:[esp+08H+08H]
	Mov	(CONTEXT Ptr [edx]).__Eip, Offset Label_EndTry
	Mov	eax, ExceptionContinueExecution
	Pop	ebp
	Byte	0C3H	; Ret	0

eriEnableMMX	EndP

;
;	MMX, XMM フラグをリセットする
; ----------------------------------------------------------------------------
Align	10H
eriDisableMMX	Proc	Near32 C , fForceDisable:DWord

	Mov	eax, fForceDisable
	Not	eax
	And	ERI_EnabledProcessorType, eax
	Ret

eriDisableMMX	EndP

;
;	FPU を初期化する
; ----------------------------------------------------------------------------
eriInitializeFPU	Proc	Near32 C Uses ebx edi esi

	Local	dwMXCSR:DWord

	;
	; FPU を初期化
	;
	FInit

	;
	; XMM を初期化
	;
	.If	ERI_EnabledProcessorType & ERI_USE_XMM_P3
		;
		; XMM の丸め方法を最近値に設定
		;
		STMXCSR	dwMXCSR
		And	dwMXCSR, (Not 6000H)
		LDMXCSR	dwMXCSR
	.EndIf

	Ret

eriInitializeFPU	EndP

;
;	@CompareImageInformation マクロ
; ----------------------------------------------------------------------------
; 引数；
;	ESI register	: 一方の画像情報を含んだ RASTER_IMAGE_INFO 構造体
;	EDI register	: もう一方の画像情報を含んだ RASTER_IMAGE_INFO 構造体
; 返り値；
;	EAX に一致した場合には0、それ以外の場合には1が返されます。
; ----------------------------------------------------------------------------

@CompareImageInformation	Macro
	Local	LabelExit

	Mov	eax, 1
	;;
	;; 画像サイズの比較
	Mov	ecx, [esi].nImageWidth
	Mov	edx, [esi].nImageHeight
	Cmp	ecx, [edi].nImageWidth
	Jnz	LabelExit
	Cmp	edx, [edi].nImageHeight
	Jnz	LabelExit
	Or	ecx, ecx
	Jz	LabelExit
	Or	edx, edx
	Jz	LabelExit
	;;
	;; ビット深度の比較
	Mov	ecx, [esi].dwBitsPerPixel
	Cmp	ecx, [edi].dwBitsPerPixel
	Jnz	LabelExit
	.If	(ecx == 8) || (ecx == 24) || (ecx == 32)
		Xor	eax, eax
	.EndIf
LabelExit:

				EndM

;
;	フレームの加算処理
; ----------------------------------------------------------------------------
Align	10H
eriAdditionOfFrame	Proc	Near32 C Uses ebx esi edi,
	riiDst:PRASTER_IMAGE_INFO, riiSrc:PRASTER_IMAGE_INFO

	Local	dwLineBytes:DWord
	Local	dwSrcBytesPerLine:DWord
	Local	dwDstBytesPerLine:DWord

	Mov	esi, riiSrc
	Mov	edi, riiDst
	Assume	esi:PRASTER_IMAGE_INFO
	Assume	edi:PRASTER_IMAGE_INFO
	;
	; 画像情報を検証する
	@CompareImageInformation
	.If	eax != 0
		Ret
	.EndIf
	;
	Mov	eax, [esi].dwBitsPerPixel
	Shr	eax, 3
	IMul	eax, [esi].nImageWidth
	Mov	dwLineBytes, eax
	;
	Mov	ecx, [esi].BytesPerLine
	Mov	edx, [edi].BytesPerLine
	Mov	dwSrcBytesPerLine, ecx
	Mov	dwDstBytesPerLine, edx
	;
	Mov	edx, [esi].nImageHeight
	Mov	esi, [esi].ptrImageArray
	Mov	edi, [edi].ptrImageArray
	Assume	esi:Nothing
	Assume	edi:Nothing
	;
	; 加算処理
	.Repeat
		Push	edx
		Push	esi
		Push	edi
		;
		Mov	ecx, dwLineBytes
		.If	ERI_EnabledProcessorType & ERI_USE_MMX_PENTIUM
		.While	ecx >= 16
			Sub	ecx, 16
			movq	mm0, MMWord Ptr [esi]
			movq	mm2, MMWord Ptr [edi]
			movq	mm1, MMWord Ptr [esi + 8]
			movq	mm3, MMWord Ptr [edi + 8]
			paddb	mm0, mm2
			paddb	mm1, mm3
			Add	esi, 16
			movq	MMWord Ptr [edi], mm0
			movq	MMWord Ptr [edi + 8], mm1
			Add	edi, 16
		.EndW
		.EndIf
		;
		.While	ecx >= 2
			Sub	ecx, 2
			Mov	al, Byte Ptr [esi]
			Mov	dl, Byte Ptr [edi]
			Mov	ah, Byte Ptr [esi + 1]
			Mov	dh, Byte Ptr [edi + 2]
			Add	al, dl
			Add	ah, dh
			Add	esi, 2
			Mov	Byte Ptr [edi], al
			Mov	Byte Ptr [edi + 1], ah
			Add	edi, 2
		.EndW
		;
		.If	ecx != 0
			Mov	al, Byte Ptr [esi]
			Add	al, Byte Ptr [edi]
			Mov	Byte Ptr [esi], al
			Mov	Byte Ptr [edi], al
		.EndIf
		;
		Pop	edi
		Pop	esi
		Pop	edx
		Add	edi, dwDstBytesPerLine
		Add	esi, dwSrcBytesPerLine
		Dec	edx
	.Until	Zero?

	.If	ERI_EnabledProcessorType & ERI_USE_MMX_PENTIUM
		emms
	.EndIf

	Xor	eax, eax
	Ret

eriAdditionOfFrame	EndP

;
;	フレームの減算処理
; ----------------------------------------------------------------------------
Align	10H
eriSubtractionOfFrame	Proc	Near32 C Uses ebx esi edi,
	riiDst:PRASTER_IMAGE_INFO, riiSrc:PRASTER_IMAGE_INFO

	Local	dwLineBytes:DWord
	Local	dwSrcBytesPerLine:DWord
	Local	dwDstBytesPerLine:DWord

	Mov	esi, riiSrc
	Mov	edi, riiDst
	Assume	esi:PRASTER_IMAGE_INFO
	Assume	edi:PRASTER_IMAGE_INFO
	;
	; 画像情報を検証する
	@CompareImageInformation
	.If	eax != 0
		Ret
	.EndIf
	;
	Mov	eax, [esi].dwBitsPerPixel
	Shr	eax, 3
	IMul	eax, [esi].nImageWidth
	Mov	dwLineBytes, eax
	;
	Mov	ecx, [esi].BytesPerLine
	Mov	edx, [edi].BytesPerLine
	Mov	dwSrcBytesPerLine, ecx
	Mov	dwDstBytesPerLine, edx
	;
	Mov	edx, [esi].nImageHeight
	Mov	esi, [esi].ptrImageArray
	Mov	edi, [edi].ptrImageArray
	Assume	esi:Nothing
	Assume	edi:Nothing
	;
	; 減算処理
	.Repeat
		Push	edx
		Push	esi
		Push	edi
		;
		Mov	ecx, dwLineBytes
		.If	ERI_EnabledProcessorType & ERI_USE_MMX_PENTIUM
		.While	ecx >= 16
			Sub	ecx, 16
			movq	mm0, MMWord Ptr [edi]
			movq	mm2, MMWord Ptr [esi]
			movq	mm1, MMWord Ptr [edi + 8]
			movq	mm3, MMWord Ptr [esi + 8]
			psubb	mm0, mm2
			psubb	mm1, mm3
			Add	esi, 16
			movq	MMWord Ptr [edi], mm0
			movq	MMWord Ptr [edi + 8], mm1
			Add	edi, 16
		.EndW
		.EndIf
		;
		.While	ecx >= 2
			Sub	ecx, 2
			Mov	al, Byte Ptr [edi]
			Mov	dl, Byte Ptr [esi]
			Mov	ah, Byte Ptr [edi + 1]
			Mov	dh, Byte Ptr [esi + 2]
			Sub	al, dl
			Sub	ah, dh
			Add	esi, 2
			Mov	Byte Ptr [edi], al
			Mov	Byte Ptr [edi + 1], ah
			Add	edi, 2
		.EndW
		;
		.If	ecx != 0
			Mov	al, Byte Ptr [edi]
			Sub	al, Byte Ptr [esi]
			Mov	Byte Ptr [edi], al
		.EndIf
		;
		Pop	edi
		Pop	esi
		Pop	edx
		Add	edi, dwDstBytesPerLine
		Add	esi, dwSrcBytesPerLine
		Dec	edx
	.Until	Zero?

	.If	ERI_EnabledProcessorType & ERI_USE_MMX_PENTIUM
		emms
	.EndIf

	Xor	eax, eax
	Ret

eriSubtractionOfFrame	EndP

;
;	フレームの複製処理
; ----------------------------------------------------------------------------
Align	10H
eriCopyImage	Proc	Near32 C Uses ebx esi edi,
	riiDst:PRASTER_IMAGE_INFO, riiSrc:PRASTER_IMAGE_INFO

	Local	dwLineBytes:DWord
	Local	dwSrcBytesPerLine:DWord
	Local	dwDstBytesPerLine:DWord

	Mov	esi, riiSrc
	Mov	edi, riiDst
	Assume	esi:PRASTER_IMAGE_INFO
	Assume	edi:PRASTER_IMAGE_INFO
	;
	; 画像情報を検証する
	@CompareImageInformation
	.If	eax != 0
		Ret
	.EndIf
	;
	Mov	eax, [esi].dwBitsPerPixel
	Shr	eax, 3
	IMul	eax, [esi].nImageWidth
	Mov	dwLineBytes, eax
	;
	Mov	ecx, [esi].BytesPerLine
	Mov	edx, [edi].BytesPerLine
	Mov	dwSrcBytesPerLine, ecx
	Mov	dwDstBytesPerLine, edx
	;
	Mov	edx, [esi].nImageHeight
	Mov	esi, [esi].ptrImageArray
	Mov	edi, [edi].ptrImageArray
	Assume	esi:Nothing
	Assume	edi:Nothing
	;
	; 複製処理
	.Repeat
		Push	edx
		Push	esi
		Push	edi
		;
		Mov	ecx, dwLineBytes
		.If	ERI_EnabledProcessorType & ERI_USE_MMX_PENTIUM
		.While	ecx >= 16
			Sub	ecx, 16
			Mov	eax, DWord Ptr [edi]
			movq	mm0, MMWord Ptr [esi]
			movq	mm1, MMWord Ptr [esi + 8]
			Add	esi, 16
			movq	MMWord Ptr [edi], mm0
			movq	MMWord Ptr [edi + 8], mm1
			Add	edi, 16
		.EndW
		.EndIf
		;
		.While	ecx >= 8
			Sub	ecx, 8
			Mov	eax, DWord Ptr [esi]
			Mov	edx, DWord Ptr [esi + 4]
			Add	esi, 8
			Mov	DWord Ptr [edi], eax
			Mov	DWord Ptr [edi + 4], edx
			Add	edi, 8
		.EndW
		;
		.If	ecx != 0
		.Repeat
			Mov	al, Byte Ptr [esi]
			Inc	esi
			Mov	Byte Ptr [edi], al
			Inc	edi
			Dec	ecx
		.Until	Zero?
		.EndIf
		;
		Pop	edi
		Pop	esi
		Pop	edx
		Add	edi, dwDstBytesPerLine
		Add	esi, dwSrcBytesPerLine
		Dec	edx
	.Until	Zero?

	.If	ERI_EnabledProcessorType & ERI_USE_MMX_PENTIUM
		emms
	.EndIf

	Xor	eax, eax
	Ret

eriCopyImage	EndP

;
;	画像の拡大
; ----------------------------------------------------------------------------
Align	10H
eriEnlargeImageDouble	Proc	Near32 C Uses ebx esi edi,
	riiDst:PRASTER_IMAGE_INFO, riiSrc:PRASTER_IMAGE_INFO

	Local	dwSrcWidth:DWord
	Local	dwSrcHeight:DWord
	Local	dwSrcBytesPerLine:DWord
	Local	dwDstBytesPerLine:DWord
	Local	ptrSrcImage:Ptr DWord
	Local	ptrDstImage:Ptr DWord
	Local	dwLineCount:DWord
	Local	ptrSrcLine:Ptr DWord
	Local	ptrDstLine:Ptr DWord

	;
	; 画像フォーマットのチェック
	;
	Mov	esi, riiSrc
	Mov	edi, riiDst
	Assume	esi:PRASTER_IMAGE_INFO
	Assume	edi:PRASTER_IMAGE_INFO
	;
	Mov	ecx, [esi].nImageWidth
	Mov	edx, [esi].nImageHeight
	Mov	dwSrcWidth, ecx
	Mov	dwSrcHeight, edx
	Add	ecx, ecx
	Add	edx, edx
	;
	.If	(ecx != [edi].nImageWidth) || (edx != [edi].nImageHeight) \
			|| ([esi].dwBitsPerPixel != 32) \
			|| ([edi].dwBitsPerPixel != 32) \
			|| (ecx == 0) || (edx == 0)
		Mov	eax, 1
		Ret
	.EndIf
	;
	; 画像フォーマット取得
	;
	Mov	ecx, [esi].BytesPerLine
	Mov	edx, [edi].BytesPerLine
	Mov	dwSrcBytesPerLine, ecx
	Mov	dwDstBytesPerLine, edx
	;
	Mov	esi, [esi].ptrImageArray
	Mov	edi, [edi].ptrImageArray
	Assume	esi:Nothing
	Assume	edi:Nothing
	Mov	ptrSrcImage, esi
	Mov	ptrDstImage, edi
	;
	; 画像データの拡大複製（水平方向）
	;
	Mov	ecx, dwSrcHeight
	.Repeat
		Mov	dwLineCount, ecx
		Mov	ptrSrcLine, esi
		Mov	ptrDstLine, edi
		Mov	ecx, dwSrcWidth
		;
		.If	ERI_EnabledProcessorType & ERI_USE_XMM_P3
			movd	mm3, [esi]
			psllq	mm3, 32
			.While	ecx >= 4
				Sub	ecx, 4
				movq		mm0, [esi]
				movq		mm1, [esi + 08H]
				Add	esi, 10H
				movq		mm4, mm0
				movq		mm5, mm1
				pshufw		mm3, mm4, 01001110B
				pshufw		mm4, mm5, 01001110B
				pavgb		mm3, mm0
				pavgb		mm4, mm1
				movq		mm6, mm3
				movq		mm7, mm4
				punpckldq	mm3, mm0
				punpckldq	mm4, mm1
				punpckhdq	mm6, mm0
				punpckhdq	mm7, mm1
				movntq		[edi      ], mm3
				movntq		[edi + 08H], mm6
				movntq		[edi + 10H], mm4
				movntq		[edi + 18H], mm7
				Add	edi, 20H
				movq		mm3, mm1
			.EndW
		.EndIf
		;
		Test	ecx, ecx
		.While	!Zero?
			Mov	eax, DWord Ptr [esi]
			Add	esi, (SizeOf DWord)
			Mov	DWord Ptr [edi], eax
			Mov	DWord Ptr [edi + 4], eax
			Add	edi, (SizeOf DWord) * 2
			Dec	ecx
		.EndW
		;
		Mov	eax, dwDstBytesPerLine
		Mov	edx, dwSrcBytesPerLine
		Mov	edi, ptrDstLine
		Mov	esi, ptrSrcLine
		Mov	ecx, dwLineCount
		Add	esi, edx
		Lea	edi, [edi + eax * 2]
		;
		Dec	ecx
	.Until	Zero?
	;
	; 画像データの拡大複製（垂直方向）
	;
	Mov	ecx, dwSrcHeight
	Mov	esi, ptrDstImage
	Dec	ecx
	.While	!Zero?
		Mov	eax, dwDstBytesPerLine
		Mov	dwLineCount, ecx
		Mov	ptrSrcLine, esi
		Mov	ecx, dwSrcWidth
		Lea	edi, [esi + eax]
		Lea	ebx, [esi + eax * 2]
		;
		.If	ERI_EnabledProcessorType & ERI_USE_XMM_P3
			.While	ecx >= 4
				Sub	ecx, 4
				movq	mm0, [esi]
				movq	mm1, [esi + 08H]
				movq	mm2, [esi + 10H]
				movq	mm3, [esi + 18H]
				Add	esi, 20H
				pavgb	mm0, [ebx]
				pavgb	mm1, [ebx + 08H]
				pavgb	mm2, [ebx + 10H]
				pavgb	mm3, [ebx + 18H]
				Add	ebx, 20H
				movntq	[edi      ], mm0
				movntq	[edi + 08H], mm1
				movntq	[edi + 10H], mm2
				movntq	[edi + 18H], mm3
				Add	edi, 20H
			.EndW
		.EndIf
		;
		Test	ecx, ecx
		.While	!Zero?
			Mov	eax, DWord Ptr [esi]
			Mov	edx, DWord Ptr [esi + 4]
			Add	esi, (SizeOf DWord) * 2
			Mov	DWord Ptr [edi], eax
			Mov	DWord Ptr [edi + 4], edx
			Add	edi, (SizeOf DWord) * 2
			Dec	ecx
		.EndW
		;
		Mov	eax, dwDstBytesPerLine
		Mov	esi, ptrSrcLine
		Mov	ecx, dwLineCount
		Lea	esi, [esi + eax * 2]
		;
		Dec	ecx
	.EndW
	;
	; 最後のラインの複製
	;
	Mov	eax, dwDstBytesPerLine
	Mov	ecx, dwSrcWidth
	Lea	edi, [esi + eax]
	;
	.If	ERI_EnabledProcessorType & ERI_USE_XMM_P3
		.While	ecx >= 4
			Sub	ecx, 4
			movq	mm0, [esi]
			movq	mm1, [esi + 08H]
			movq	mm2, [esi + 10H]
			movq	mm3, [esi + 18H]
			Add	esi, 20H
			movntq	[edi      ], mm0
			movntq	[edi + 08H], mm1
			movntq	[edi + 10H], mm2
			movntq	[edi + 18H], mm3
			Add	edi, 20H
		.EndW
	.EndIf
	;
	Test	ecx, ecx
	.While	!Zero?
		Mov	eax, DWord Ptr [esi]
		Mov	edx, DWord Ptr [esi + 4]
		Add	esi, (SizeOf DWord) * 2
		Mov	DWord Ptr [edi], eax
		Mov	DWord Ptr [edi + 4], edx
		Add	edi, (SizeOf DWord) * 2
		Dec	ecx
	.EndW
	;
	; 終了
	;
	.If	ERI_EnabledProcessorType & ERI_USE_XMM_P3
		emms
	.EndIf
	Xor	eax, eax
	Ret

eriEnlargeImageDouble	EndP

;
;	ハフマン木の1つの葉の出現頻度を増加させる
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
ERINA_HUFFMAN_TREE@@IncreaseOccuredCount	\
					Proc	Near32 SysCall Uses ebx esi edi,
	iEntry:SDWord
Else
ERINA_HUFFMAN_TREE@@IncreaseOccuredCount	\
					Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERINA_HUFFMAN_TREE, iEntry:SDWord
EndIf

	Local	iSwap:SDWord


	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
	Else
		Mov	ebx, _this
	EndIf
	Assume	ebx:PERINA_HUFFMAN_TREE
	Mov	eax, iEntry

	@TREE@@IncreaseOccuredCount	0

	Assume	ebx:Nothing

	IfNDef	_BORLAND_CPP
		Ret	4 * 1
	Else
		Ret
	EndIf

ERINA_HUFFMAN_TREE@@IncreaseOccuredCount	EndP

;
;	指定ノードの出現頻度からあるべきハフマン木の状態に正規化する
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
ERINA_HUFFMAN_TREE@@Normalize		Proc	Near32 SysCall Uses ebx esi edi,
	iEntry:SDWord
Else
ERINA_HUFFMAN_TREE@@Normalize		Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERINA_HUFFMAN_TREE, iEntry:SDWord
EndIf

	Local	iSwap:SDWord

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
	Else
		Mov	ebx, _this
	EndIf
	Assume	ebx:PERINA_HUFFMAN_TREE

	Mov	eax, iEntry

	@TREE@@Normalize	0

	Assume	ebx:Nothing

	IfNDef	_BORLAND_CPP
		Ret	4 * 1
	Else
		Ret
	EndIf

ERINA_HUFFMAN_TREE@@Normalize		EndP


;
;	@PrefetchBuffer マクロ
; ----------------------------------------------------------------------------
; @PrefetchBuffer <esc_label>, <reg_mode>
; ----------------------------------------------------------------------------
; 引数；
;	EBX register	: RLHDecodeContext オブジェクトへのポインタ 
;	esc_label	: 脱出ラベル
;	reg_mode	: 指定された時には、ecx に [ebx].m_nIntBufCount が、
;			: edx に [ebx].m_dwIntBuffer が読み込まれているものと
;			: して処理される。これらの内容は保証される。
; レジスタ；
;	すべてのレジスタは保存される
; ----------------------------------------------------------------------------

@PrefetchBuffer	Macro	esc_label:Req, reg_mode:=<0>, inst_align:=<0>, p3_code:=<0>
	Local	Label1

	If	reg_mode Eq 1
	.If	ecx == 0
	ElseIf	reg_mode Eq 2
	.If	Zero?
	Else
	.If	[ebx].m_nIntBufCount == 0
	EndIf
		;;
		Push	eax
		If	reg_mode Eq 0
			Push	ecx
			Push	edx
		EndIf
		;;
		.If	[ebx].m_nBufCount == 0
			;;
			;; バッファに読み込む
			IfNDef	_BORLAND_CPP
				Mov	ecx, ebx
				Mov	eax, [ebx].m_ptrBuffer
				Mov	edx, [ebx].pvfnTable
				Mov	[ebx].m_ptrNextBuf, eax
				Push	[ebx].m_nBufferingSize
				Push	eax
				Call	Near32 Ptr [edx + VFI_ReadNextData]
			Else
				Mov	eax, [ebx].m_ptrBuffer
				Mov	edx, [ebx].pvfnTable
				Mov	[ebx].m_ptrNextBuf, eax
				Push	[ebx].m_nBufferingSize
				Push	eax
				Push	ebx
				Call	Near32 Ptr [edx + VFI_ReadNextData]
				Add	esp, (SizeOf DWord) * 3
			EndIf
			Mov	[ebx].m_nBufCount, eax
			Test	eax, eax
			.If	Zero?
				If	reg_mode Eq 0
					Pop	edx
					Pop	ecx
				EndIf
				Pop	eax
				Jmp	esc_label
			.EndIf
			;;
			;; ４の剰余バイトに0を埋め込む
			Dec	eax
			Mov	edx, [ebx].m_ptrBuffer
			Xor	eax, 0011B
			Add	edx, [ebx].m_nBufCount
			And	eax, 0011B
			.If	!Zero?
				Add	[ebx].m_nBufCount, eax
				.Repeat
					Mov	Byte Ptr [edx], 00H
					Inc	edx
					Dec	eax
				.Until	Zero?
			.EndIf
		.EndIf
		;;
		;; 中間バッファに読み込む
		Mov	eax, [ebx].m_ptrNextBuf
		Mov	ecx, [ebx].m_nBufCount
		If	p3_code
			prefetchnta	[eax]
		EndIf
		If	reg_mode Eq 0
			Mov	[ebx].m_nIntBufCount, 32
		EndIf
		Sub	ecx, 4
		Mov	edx, DWord Ptr [eax]
		Add	eax, (SizeOf DWord)
		BSwap	edx
		Mov	[ebx].m_nBufCount, ecx
		Mov	[ebx].m_ptrNextBuf, eax
		;;
		If	reg_mode Eq 0
			Mov	[ebx].m_dwIntBuffer, edx
			Pop	edx
			Pop	ecx
		Else
			Mov	ecx, 32
		EndIf
		Pop	eax
	If	inst_align
		Jmp	Label1
		Align	inst_align
Label1:
	EndIf
	.EndIf

		EndM


;
;	@GetABit マクロ
; ----------------------------------------------------------------------------
; @GetABit <esc_label>
; ----------------------------------------------------------------------------
; 引数；
;	EBX register	: RLHDecodeContext オブジェクトへのポインタ 
;	esc_label	: 脱出ラベル
; レジスタ;
;	EBX、ESI、EDI、EBP、ESP レジスタは保存される
;	EAX レジスタに、0または−1が返されます。
; ----------------------------------------------------------------------------

@GetABit	Macro	esc_label:Req, p3_code:=<0>

	Mov	ecx, [ebx].m_nIntBufCount
	Mov	edx, [ebx].m_dwIntBuffer
	;;
	@PrefetchBuffer	esc_label, 1, 0, p3_code
	;;
	Dec	ecx
	Add	edx, edx
	Sbb	eax, eax
	Mov	[ebx].m_nIntBufCount, ecx
	Mov	[ebx].m_dwIntBuffer, edx

		EndM


;
;	@GetNBits マクロ
; ----------------------------------------------------------------------------
; @GetNBits <esc_label>
; ----------------------------------------------------------------------------
; 引数；
;	EBX register	: RLHDecodeContext 構造体へのポインタ
;	ESI register	: 読み込むビット数
;	esc_label	: 脱出ラベル
; レジスタ；
;	EBX, EBP, ESP レジスタは保存される。
;	EAX レジスタに読み込まれたビット列が返される。
; ----------------------------------------------------------------------------

@GetNBits	Macro	esc_label:Req

	Xor	eax, eax
	Mov	ecx, [ebx].m_nIntBufCount
	Mov	edx, [ebx].m_dwIntBuffer
	.While	esi != 0
		;;
		@PrefetchBuffer	esc_label, 1
		;;
		Mov	edi, ecx
		Mov	ecx, esi
		.If	ecx > edi
			Mov	ecx, edi
		.EndIf
		Sub	edi, ecx
		.If	ecx == 32
			Mov	eax, edx
			Xor	edx, edx
		.Else
			ShlD	eax, edx, cl
			Shl	edx, cl
		.EndIf
		Sub	esi, ecx
		Mov	ecx, edi
	.EndW
	Mov	[ebx].m_nIntBufCount, ecx
	Mov	[ebx].m_dwIntBuffer, edx

	EndM


;
;	@GetACode マクロ
; ----------------------------------------------------------------------------
; @GetACode <esc_label>
; ----------------------------------------------------------------------------
; 引数；
;	EBX register	: RLHDecodeContext オブジェクトへのポインタ 
;	esc_label	: 脱出ラベル
; レジスタ;
;	EBX、EDI、EBP、ESP レジスタは保存される
;	EAX レジスタに復号されたガンマコードが返されます。
; ----------------------------------------------------------------------------

@GetACode	Macro	esc_label:Req, p3_code:=<0>

	Xor	eax, eax
	Mov	esi, 1
	Mov	ecx, [ebx].m_nIntBufCount
	Mov	edx, [ebx].m_dwIntBuffer
	;;
	.While	1
		@PrefetchBuffer	esc_label, 1, 0, p3_code
		;;
		;; 1ビット取り出し
		Dec	ecx
		Add	edx, edx
		.Break	.If	!Carry?
		;;
		;; コード継続
		@PrefetchBuffer	esc_label, 1, 0, p3_code
		;;
		;; 1ビット取り出し
		Shl	esi, 1
		Dec	ecx
		Add	edx, edx
		Adc	eax, eax
	.EndW
	;;
	;; コード完成
	Mov	[ebx].m_nIntBufCount, ecx
	Mov	[ebx].m_dwIntBuffer, edx
	Add	eax, esi

		EndM


;
;	バッファが空のとき、次のデータを読み込む
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
RLHDecodeContext@@PrefetchBuffer	Proc	Near32 SysCall Uses ebx
Else
RLHDecodeContext@@PrefetchBuffer	Proc	Near32 SysCall Uses ebx,
	_this:PRLHDecodeContext
EndIf

	Local	dwInitESP:DWord

	Mov	dwInitESP, esp

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
	Else
		Mov	ebx, _this
	EndIf
	Assume	ebx:PRLHDecodeContext
	@PrefetchBuffer	esc_label
	Assume	ebx:Nothing
	Xor	eax, eax
	Ret	0

esc_label:
	Mov	esp, dwInitESP
	Mov	eax, 1
	Ret	0

RLHDecodeContext@@PrefetchBuffer	EndP

;
;	1ビット取得する
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
RLHDecodeContext@@GetABit		Proc	Near32 SysCall Uses ebx
Else
RLHDecodeContext@@GetABit		Proc	Near32 SysCall Uses ebx,
	_this:PRLHDecodeContext
EndIf

	Local	dwInitESP:DWord

	Mov	dwInitESP, esp

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
	Else
		Mov	ebx, _this
	EndIf
	Assume	ebx:PRLHDecodeContext
	@GetABit	esc_label
	Assume	ebx:Nothing
	Ret	0

esc_label:
	Mov	esp, dwInitESP
	Mov	eax, 1
	Ret	0

RLHDecodeContext@@GetABit		EndP

;
;	n ビット取得する
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
RLHDecodeContext@@GetNBits		Proc	Near32 SysCall Uses ebx esi edi,
	n:SDWord
Else
RLHDecodeContext@@GetNBits		Proc	Near32 SysCall Uses ebx esi edi,
	_this:PRLHDecodeContext, n:SDWord
EndIf

	Local	dwInitESP:DWord

	Mov	dwInitESP, esp

	Mov	esi, n
	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
	Else
		Mov	ebx, _this
	EndIf
	Assume	ebx:PRLHDecodeContext

	@GetNBits	esc_label

	Assume	ebx:Nothing

	IfNDef	_BORLAND_CPP
		Ret	4
	Else
		Ret
	EndIf

esc_label:
	Mov	esp, dwInitESP
	Xor	eax, eax
	IfNDef	_BORLAND_CPP
		Ret	4
	Else
		Ret
	EndIf

RLHDecodeContext@@GetNBits		EndP

;
;	ガンマコードを取得する
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
RLHDecodeContext@@GetACode		Proc	Near32 SysCall Uses ebx esi
Else
RLHDecodeContext@@GetACode		Proc	Near32 SysCall Uses ebx esi,
	_this:PRLHDecodeContext
EndIf

	Local	dwInitESP:DWord

	Mov	dwInitESP, esp

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
	Else
		Mov	ebx, _this
	EndIf
	Assume	ebx:PRLHDecodeContext
	@GetACode	esc_label
	Assume	ebx:Nothing
	Ret	0

esc_label:
	Mov	esp, dwInitESP
	Mov	eax, -1
	Ret	0

RLHDecodeContext@@GetACode		EndP

;
;	展開したデータを取得する（ガンマ符号）
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
RLHDecodeContext@@DecodeGammaCodes	Proc	Near32 SysCall Uses ebx esi edi,
	ptrDst:PINT, nCount:DWord
Else
RLHDecodeContext@@DecodeGammaCodes	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PRLHDecodeContext, ptrDst:PINT, nCount:DWord
EndIf

	Local	nDecoded:DWord
	Local	dwInitESP:DWord

	Mov	nDecoded, 0
	Mov	edi, ptrDst
	Mov	dwInitESP, esp
	;;
	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
	Else
		Mov	ebx, _this
	EndIf
	Assume	ebx:PRLHDecodeContext

	.If	ERI_EnabledProcessorType & ERI_USE_XMM_P3
	;
	; --------------------------------------------------------------------
	;	Pentium III 専用コード
	; --------------------------------------------------------------------
	;
	.If	[ebx].m_nLength == 0
		@GetACode	esc_label, 1
		Mov	[ebx].m_nLength, eax
	.EndIf

	.While	1
		prefetchnta	[edi]
		;;
		;; 出力シンボル数を算出
		Mov	ecx, [ebx].m_nLength
		Mov	eax, nCount
		Mov	edx, ecx
		.If	ecx > eax
			Mov	ecx, eax
		.EndIf
		Sub	edx, ecx
		Sub	eax, ecx
		Mov	[ebx].m_nLength, edx
		;;
		;; シンボルを出力
		Mov	edx, [ebx].m_flgZero
		Mov	nCount, eax
		Or	edx, edx
		.If	Zero?
			Add	nDecoded, ecx
			Xor	eax, eax
			.If	ecx != 0
			.Repeat
				Mov	DWord Ptr [edi], eax
				Add	edi, (SizeOf DWord)
				Dec	ecx
			.Until	Zero?
			.EndIf
		.Else
			.If	ecx != 0
			.Repeat
				Push	ecx
				;;
				@GetABit	esc_label, 1
				Push	eax
				@GetACode	esc_label, 1
				Pop	edx
				Mov	ecx, nDecoded
				Xor	eax, edx
				Inc	ecx
				Sub	eax, edx
				Mov	nDecoded, ecx
				Mov	SDWord Ptr [edi], eax
				;;
				Pop	ecx
				Add	edi, (SizeOf SDWord)
				Dec	ecx
			.Until	Zero?
			.EndIf
		.EndIf
		;;
		;; 終了？
		.Break	.If	nCount == 0
		;;
		;; レングスコードを取得
		Not	[ebx].m_flgZero
		@GetACode	esc_label, 1
		Mov	[ebx].m_nLength, eax
	.EndW

	.If	[ebx].m_nLength == 0
		Not	[ebx].m_flgZero
	.EndIf
	sfence

	.Else
	;
	; --------------------------------------------------------------------
	;	IA32 汎用コード
	; --------------------------------------------------------------------
	;

	.If	[ebx].m_nLength == 0
		@GetACode	esc_label
		Mov	[ebx].m_nLength, eax
	.EndIf

	.While	1
		;;
		;; 出力シンボル数を算出
		Mov	ecx, [ebx].m_nLength
		Mov	eax, nCount
		Mov	edx, ecx
		.If	ecx > eax
			Mov	ecx, eax
		.EndIf
		Sub	edx, ecx
		Sub	eax, ecx
		Mov	[ebx].m_nLength, edx
		;;
		;; シンボルを出力
		Mov	edx, [ebx].m_flgZero
		Mov	nCount, eax
		Or	edx, edx
		.If	Zero?
			Add	nDecoded, ecx
			Xor	eax, eax
			.If	ecx != 0
			.Repeat
				Mov	DWord Ptr [edi], eax
				Add	edi, (SizeOf DWord)
				Dec	ecx
			.Until	Zero?
			.EndIf
		.Else
			.If	ecx != 0
			.Repeat
				Push	ecx
				;;
				@GetABit	esc_label
				Push	eax
				@GetACode	esc_label
				Pop	edx
				Mov	ecx, nDecoded
				Xor	eax, edx
				Inc	ecx
				Sub	eax, edx
				Mov	nDecoded, ecx
				Mov	SDWord Ptr [edi], eax
				;;
				Pop	ecx
				Add	edi, (SizeOf SDWord)
				Dec	ecx
			.Until	Zero?
			.EndIf
		.EndIf
		;;
		;; 終了？
		.Break	.If	nCount == 0
		;;
		;; レングスコードを取得
		Not	[ebx].m_flgZero
		@GetACode	esc_label
		Mov	[ebx].m_nLength, eax
	.EndW

	.If	[ebx].m_nLength == 0
		Not	[ebx].m_flgZero
	.EndIf

	.EndIf

	Assume	ebx:Nothing

esc_label:
	Mov	esp, dwInitESP
	Mov	eax, nDecoded
	IfNDef	_BORLAND_CPP
		Ret	4 * 2
	Else
		Ret
	EndIf

RLHDecodeContext@@DecodeGammaCodes	EndP

;
;	展開してデータを取得する（算術符号）
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
RLHDecodeContext@@DecodeArithmeticCodes	Proc	Near32 SysCall Uses ebx esi edi,
	ptrDst:PINT, nCount:DWord
Else
RLHDecodeContext@@DecodeArithmeticCodes	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PRLHDecodeContext, ptrDst:PINT, nCount:DWord
EndIf

	Local	nDecoded:DWord
	Local	nSymbolIndex:DWord
	Local	nSourceCode:DWord
	Local	dwInitESP:DWord

	Mov	dwInitESP, esp
	Mov	nDecoded, 0
	;
	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
	Else
		Mov	ebx, _this
	EndIf
	Assume	ebx:PRLHDecodeContext
	;
	Mov	ecx, nDecoded
	.While	ecx < nCount
		;
		; chop( C * N / A )
		;
		Mov	esi, [ebx].m_pLastStatisticalModel
		Assume	esi:PSTATISTICAL_MODEL
		Mov	eax, [ebx].m_dwCodeRegister
		Mul	[esi].dwTotalSymbolCount
		Div	[ebx].m_dwAugendRegister
		;
		; シンボルの指標を検索
		;
		Xor	edi, edi
		Xor	edx, edx
		Xor	ecx, ecx
		.Break	.If	eax >= 10000H
		.While	1
			Mov	dx, [esi].SymbolTable[edi * 4].wOccured
			.Break	.If	ax < dx
			Inc	edi
			Sub	ax, dx
			Add	cx, dx
			Cmp	edi, [ebx].m_nSymbolSortCount
			Jae	esc_label
		.EndW
		Mov	nSymbolIndex, edi
		Mov	edi, edx
		;
		; コードレジスタとオージェンドレジスタを更新
		;
		Mov	eax, [ebx].m_dwAugendRegister
		Mul	ecx
		Div	[esi].dwTotalSymbolCount
		Mov	ecx, [ebx].m_dwCodeRegister
		Add	edx, 0FFFFFFFFH
		Sbb	ecx, eax
		Mov	eax, [ebx].m_dwAugendRegister
		Mul	edi
		Div	[esi].dwTotalSymbolCount
		Assume	esi:Nothing
		;
		; オージェンドレジスタを正規化し、コードレジスタに符号を読み込む
		;
		Mov	esi, [ebx].m_dwCodeBuffer
		Or	eax, eax
		.If	!Sign?
			.Repeat
				;
				; コードレジスタにシフトイン
				@PrefetchBuffer	overflow_label1
				;
				Mov	edi, [ebx].m_nIntBufCount
				Mov	edx, [ebx].m_dwIntBuffer
				Dec	edi
continue_label1:		Add	edx, edx
				Adc	esi, esi
				Adc	ecx, ecx
				;
				; ビットスタッフィング
				.If	esi == 0FFFFFFFFH
					Mov	[ebx].m_nIntBufCount, edi
					Mov	[ebx].m_dwIntBuffer, edx
					;
					@PrefetchBuffer	overflow_label2
					;
					Mov	edi, [ebx].m_nIntBufCount
					Mov	edx, [ebx].m_dwIntBuffer
					Dec	edi
continue_label2:			Add	edx, edx
					Adc	esi, 0
					Adc	ecx, 0
				.EndIf
				;
				Mov	[ebx].m_nIntBufCount, edi
				Mov	[ebx].m_dwIntBuffer, edx
				Add	eax, eax
			.Until	Sign?
			;
			Mov	[ebx].m_dwCodeBuffer, esi
		.EndIf
		;
		Mov	[ebx].m_dwCodeRegister, ecx
		Mov	[ebx].m_dwAugendRegister, eax
		;
		; 現在の統計モデルを更新
		;
		Mov	esi, [ebx].m_pLastStatisticalModel
		Assume	esi:PSTATISTICAL_MODEL
		Mov	ecx, nSymbolIndex
		Mov	edx, [esi].SymbolTable[ecx * 4]
		Inc	dx
		;
		.If	ecx != 0
			.Repeat
				Mov	eax, [esi].SymbolTable[ecx * 4 - 4]
				.Break	.If	ax > dx
				Mov	[esi].SymbolTable[ecx * 4], eax
				Dec	ecx
			.Until	Zero?
		.EndIf
		;
		Mov	[esi].SymbolTable[ecx * 4], edx
		;
		; データを出力
		;
		Mov	edi, ptrDst
		Sar	edx, 16
		Mov	SDWord Ptr [edi], edx
		;
		; 総合計生起シンボル数更新
		;
		Mov	eax, [esi].dwTotalSymbolCount
		Add	edi, (SizeOf SDWord)
		And	edx, [ebx].m_maskSymbolBit
		Inc	eax
		Mov	ptrDst, edi
		Mov	nSourceCode, edx
		Mov	[esi].dwTotalSymbolCount, eax
		.If	eax >= 10000H
			;
			Xor	edx, edx
			Mov	ecx, [ebx].m_nSymbolSortCount
			.Repeat
				MovZx	eax, [esi].SymbolTable[ecx*4-4].wOccured
				Inc	eax
				Shr	eax, 1
				Add	edx, eax
				Mov	[esi].SymbolTable[ecx*4-4].wOccured, ax
				Dec	ecx
			.Until	Zero?
			;
			Mov	[esi].dwTotalSymbolCount, edx
		.EndIf
		;
		Assume	esi:Nothing
		;
		; 次のシンボルの復号へ
		;
		Mov	eax, nSourceCode
		Mov	ecx, nDecoded
		Mov	eax, [ebx].m_pStatisticalTable[eax * 4]
		Inc	ecx
		Mov	[ebx].m_pLastStatisticalModel, eax
		Mov	nDecoded, ecx
	.EndW
	;
esc_label:
	Mov	eax, nDecoded
	Mov	esp, dwInitESP
	IfNDef	_BORLAND_CPP
		Ret	4 * 2
	Else
		Ret
	EndIf

overflow_label1:
	Push	eax
	Mov	eax, [ebx].m_nVirtualPostBuf
	Inc	eax
	Cmp	eax, 2
	Mov	[ebx].m_nVirtualPostBuf, eax
	Pop	eax
	Jae	esc_label
	Mov	edi, 128
	Xor	edx, edx
	Jmp	continue_label1

overflow_label2:
	Push	eax
	Mov	eax, [ebx].m_nVirtualPostBuf
	Inc	eax
	Cmp	eax, 2
	Mov	[ebx].m_nVirtualPostBuf, eax
	Pop	eax
	Jae	esc_label
	Mov	edi, 128
	Xor	edx, edx
	Jmp	continue_label2

	Assume	ebx:Nothing

RLHDecodeContext@@DecodeArithmeticCodes	EndP

;
;	1ライン展開したデータを取得する（RL-MTF-G 符号）
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
RLHDecodeContext@@DecodeRLMTFGCodes	Proc	Near32 SysCall Uses ebx esi edi,
	ptrDst:PBYTE, nCount:DWord
Else
RLHDecodeContext@@DecodeRLMTFGCodes	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PRLHDecodeContext, ptrDst:PBYTE, nCount:DWord
EndIf

	Local	nDecoded:DWord
	Local	dwInitESP:DWord
	Local	iLastPlt:SDWord
	Local	pCurTable:PMTF_TABLE

	PushFD
	Cld
	Mov	dwInitESP, esp

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
	Else
		Mov	ebx, _this
	EndIf
	Assume	ebx:PRLHDecodeContext

	Mov	nDecoded, 0
	Mov	iLastPlt, -1
	Mov	eax, [ebx].m_pMTFTable[100H * 4]
	Mov	edi, ptrDst
	Mov	pCurTable, eax

	;
	; ラインをすべてでコードするまで繰り返し
	;
	.While	1
		Mov	eax, nDecoded
		.Break	.If	eax >= nCount
		;
		; ガンマ符号を復号
		@GetACode	esc_label
		Mov	esi, pCurTable
		Dec	eax
		.Break	.If	eax & 0FFFFFF00H
		;
		; カレントMTFテーブルを参照する
		MovZx	edx, Byte Ptr [esi + eax]
		.If	eax != 0
			.Repeat
				Mov	cl, Byte Ptr [esi + eax - 1]
				Mov	Byte Ptr [esi + eax], cl
				Dec	eax
			.Until	Zero?
			Mov	Byte Ptr [esi], dl
		.EndIf
		;
		; 復号されたパレット番号を出力
		Mov	eax, nDecoded
		Mov	Byte Ptr [edi], dl
		Inc	eax
		Inc	edi
		Mov	nDecoded, eax
		;
		; 直前のパレット番号と一致しないか比較
		.If	edx == iLastPlt
			;
			; ランレングスの適用
			@GetACode	esc_label
			Mov	edx, nCount
			Dec	eax
			.Break	.If	Sign?
			Sub	edx, nDecoded
			.If	eax > edx
				Mov	ecx, edx
			.Else
				Mov	ecx, eax
			.EndIf
			Mov	eax, iLastPlt
			Add	nDecoded, ecx
			Rep	Stos	Byte Ptr [edi]
		.Else
			;
			; カレントMTFテーブルの更新
			Mov	eax, [ebx].m_pMTFTable[edx * 4]
			Mov	iLastPlt, edx
			Mov	pCurTable, eax
		.EndIf
	.EndW

	Assume	ebx:Nothing

esc_label:
	Mov	esp, dwInitESP
	Mov	eax, nDecoded
	PopFD
	IfNDef	_BORLAND_CPP
		Ret	4 * 2
	Else
		Ret
	EndIf

RLHDecodeContext@@DecodeRLMTFGCodes	EndP

;
;	ハフマン符号取得マクロ
; ----------------------------------------------------------------------------
; @GetAHuffmanCode <esc_label>
; ----------------------------------------------------------------------------
; 引数 ;
;	EBX register	: RLHDecodeContext 構造体へのポインタ
;	ESI register	: ERINA_HUFFMAN_TREE 構造体へのポインタ
; 不変変数；
;	_this		: Ptr RLHDecodeContext
;	tree		: Ptr ERINA_HUFFMAN_TREE
; レジスタ；
;	EBX, EBP, ESP レジスタは保存される
;	EAX レジスタに復号された符号が返される
; ----------------------------------------------------------------------------

@GetAHuffmanCode	Macro	esc_label:Req
	Local	Label_Exit, Label_ESC, Label_ESC2, Label_Decoded

	PushContext	Assumes
	.If	[esi].m_hnTree[ERINA_HUFFMAN_ROOT*8].m_child_code != ERINA_HUFFMAN_NULL
		;;
		Mov	ecx, [ebx].m_nIntBufCount
		Mov	edx, [ebx].m_dwIntBuffer
		Push	ebp
		Mov	eax, [esi].m_hnTree[ERINA_HUFFMAN_ROOT * 8].m_child_code
		;;
		;; ハフマン符号を復号
		;;
		@PrefetchBuffer	Label_ESC, 1, 10H
		.Repeat
			;;
			;; 1ビット取り出す
			Add	edx, edx
			Adc	eax, 0
			Dec	ecx
			@PrefetchBuffer	Label_ESC2, 2
			Mov	ebp, eax
			Mov	eax, [esi].m_hnTree[eax * 8].m_child_code
		.Until	eax & ERINA_CODE_FLAG
Label_Decoded:	;;
		And	eax, Not ERINA_CODE_FLAG
		Pop	edi
		Push	eax
		Mov	eax, ebp
		Mov	ebp, edi
		Assume	edi:Nothing
		Mov	[ebx].m_nIntBufCount, ecx
		Mov	[ebx].m_dwIntBuffer, edx
		;;
		;; 符号の出現頻度を増加させる
		Mov	ebx, esi
		Assume	ebx:PERINA_HUFFMAN_TREE
		Assume	esi:Nothing
		@TREE@@IncreaseOccuredCount	1
		;;
		;; エスケープコードか判別
		Pop	eax
		Cmp	eax, ERINA_HUFFMAN_ESCAPE
		Jnz	Label_Exit
	.EndIf
	;;
	;; エスケープコードの時は8ビット固定長
	Mov	ebx, _this
	Assume	ebx:PRLHDecodeContext
	Mov	esi, 8
	@GetNBits	esc_label
	;;
	Push	eax
	IfNDef	_BORLAND_CPP
		Push	eax
		Mov	ecx, tree
		Call	ERINA_HUFFMAN_TREE@@AddNewEntry
	Else
		Push	eax
		Push	tree
		Call	ERINA_HUFFMAN_TREE@@AddNewEntry
		Add	esp, (SizeOf DWord) * 2
	EndIf
	Pop	eax
	PopContext	Assumes
	Jmp	Label_Exit

Label_ESC:
	Pop	ebp
	Jmp	esc_label

Label_ESC2:
	Mov	ebp, eax
	Mov	eax, [esi].m_hnTree[eax * 8].m_child_code
	Test	eax, ERINA_CODE_FLAG
	Jnz	Label_Decoded
	Pop	ebp
	Jmp	esc_label

Label_Exit:

	EndM

;
;	長さのハフマン符号取得マクロ
; ----------------------------------------------------------------------------
; @GetLengthHuffman <esc_label>
; ----------------------------------------------------------------------------
; 引数 ;
;	EBX register	: RLHDecodeContext 構造体へのポインタ
;	ESI register	: ERINA_HUFFMAN_TREE 構造体へのポインタ
; 不変変数；
;	_this		: Ptr RLHDecodeContext
;	tree		: Ptr ERINA_HUFFMAN_TREE
; レジスタ；
;	EBX, EBP, ESP レジスタは保存される
;	EAX レジスタに復号された符号が返される
; ----------------------------------------------------------------------------

@GetLengthHuffman	Macro	esc_label:Req
	Local	Label_Exit, Label_ESC, Label_ESC2, Label_Decoded

	PushContext	Assumes
	.If	[esi].m_hnTree[ERINA_HUFFMAN_ROOT*8].m_child_code != ERINA_HUFFMAN_NULL
		;;
		;; ビットマップテーブルを使って先頭の4ビットを解析
		Mov	ecx, [ebx].m_nIntBufCount
		Mov	edx, [ebx].m_dwIntBuffer
		Push	ebp
		Mov	eax, [esi].m_hnTree[ERINA_HUFFMAN_ROOT * 8].m_child_code
		;;
		;; ハフマン符号を復号
		;;
		@PrefetchBuffer	Label_ESC, 1, 10H
		.Repeat
			;;
			;; 1ビット取り出す
			Add	edx, edx
			Adc	eax, 0
			Dec	ecx
			@PrefetchBuffer	Label_ESC2, 2
			Mov	ebp, eax
			Mov	eax, [esi].m_hnTree[eax * 8].m_child_code
		.Until	eax & ERINA_CODE_FLAG
Label_Decoded:	;;
		And	eax, Not ERINA_CODE_FLAG
		Pop	edi
		Push	eax
		Mov	eax, ebp
		Mov	ebp, edi
		Assume	edi:Nothing
		Mov	[ebx].m_nIntBufCount, ecx
		Mov	[ebx].m_dwIntBuffer, edx
		;;
		;; 符号の出現頻度を増加させる
		Mov	ebx, esi
		Assume	ebx:PERINA_HUFFMAN_TREE
		Assume	esi:Nothing
		@TREE@@IncreaseOccuredCount	1
		;;
		;; エスケープコードか判別
		Pop	eax
		Cmp	eax, ERINA_HUFFMAN_ESCAPE
		Jnz	Label_Exit
	.EndIf
	;;
	;; エスケープコードの時はガンマ符号
	Mov	ebx, _this
	Assume	ebx:PRLHDecodeContext
	@GetACode	esc_label
	;;
	Push	eax
	IfNDef	_BORLAND_CPP
		Push	eax
		Mov	ecx, tree
		Call	ERINA_HUFFMAN_TREE@@AddNewEntry
	Else
		Push	eax
		Push	tree
		Call	ERINA_HUFFMAN_TREE@@AddNewEntry
		Add	esp, (SizeOf DWord) * 2
	EndIf
	Pop	eax
	PopContext	Assumes
	Jmp	Label_Exit

Label_ESC:
	Pop	ebp
	Jmp	esc_label

Label_ESC2:
	Mov	ebp, eax
	Mov	eax, [esi].m_hnTree[eax * 8].m_child_code
	Test	eax, ERINA_CODE_FLAG
	Jnz	Label_Decoded
	Pop	ebp
	Jmp	esc_label

Label_Exit:

	EndM

;
;	ハフマン符号を展開
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
RLHDecodeContext@@GetAHuffmanCode	Proc	Near32 SysCall Uses ebx esi edi,
	tree:PERINA_HUFFMAN_TREE
	Local	_this:PRLHDecodeContext
Else
RLHDecodeContext@@GetAHuffmanCode	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PRLHDecodeContext, tree:PERINA_HUFFMAN_TREE
EndIf

	Local	dwInitESP:DWord
	Local	phnEntry:Ptr ERINA_HUFFMAN_NODE

	Mov	dwInitESP, esp

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
		Mov	_this, ecx
	Else
		Mov	ebx, _this
	EndIf
	Mov	esi, tree

	Assume	ebx:Ptr RLHDecodeContext
	Assume	esi:Ptr ERINA_HUFFMAN_TREE
	@GetAHuffmanCode	esc_label
	Assume	ebx:Nothing
	Assume	esi:Nothing

	IfNDef	_BORLAND_CPP
		Ret	4
	Else
		Ret
	EndIf

esc_label:
	Mov	esp, dwInitESP
	Mov	eax, ERINA_HUFFMAN_ESCAPE
	IfNDef	_BORLAND_CPP
		Ret	4
	Else
		Ret
	EndIf

RLHDecodeContext@@GetAHuffmanCode	EndP

;
;	長さのハフマン符号を展開
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
RLHDecodeContext@@GetLengthHuffman	Proc	Near32 SysCall Uses ebx esi edi,
	tree:PERINA_HUFFMAN_TREE
	Local	_this:PRLHDecodeContext
Else
RLHDecodeContext@@GetLengthHuffman	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PRLHDecodeContext, tree:PERINA_HUFFMAN_TREE
EndIf

	Local	dwInitESP:DWord
	Local	phnEntry:Ptr ERINA_HUFFMAN_NODE

	Mov	dwInitESP, esp

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
		Mov	_this, ecx
	Else
		Mov	ebx, _this
	EndIf
	Mov	esi, tree

	Assume	ebx:Ptr RLHDecodeContext
	Assume	esi:Ptr ERINA_HUFFMAN_TREE
	@GetLengthHuffman	esc_label
	Assume	ebx:Nothing
	Assume	esi:Nothing

	IfNDef	_BORLAND_CPP
		Ret	4
	Else
		Ret
	EndIf

esc_label:
	Mov	esp, dwInitESP
	Mov	eax, ERINA_HUFFMAN_ESCAPE
	IfNDef	_BORLAND_CPP
		Ret	4
	Else
		Ret
	EndIf

RLHDecodeContext@@GetLengthHuffman	EndP

;
;	ERINA 符号を復号する
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
RLHDecodeContext@@DecodeERINACodes	Proc	Near32 SysCall Uses ebx esi edi,
	ptrDst:PINT, nCount:DWord
	Local	_this:PRLHDecodeContext
Else
RLHDecodeContext@@DecodeERINACodes	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PRLHDecodeContext, ptrDst:PINT, nCount:DWord
EndIf

	Local	dwInitESP:DWord
	Local	phnEntry:Ptr ERINA_HUFFMAN_NODE
	Local	tree:Ptr ERINA_HUFFMAN_TREE
	Local	nDecoded:DWord

	Mov	dwInitESP, esp

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
		Mov	_this, ecx
	Else
		Mov	ebx, _this
	EndIf
	Assume	ebx:Ptr RLHDecodeContext

	;;
	;; 零ランレングスの残りを展開
	Mov	ecx, [ebx].m_nLength
	Mov	nDecoded, 0
	.If	ecx != 0
		.If	ecx > nCount
			Mov	ecx, nCount
		.EndIf
		Xor	eax, eax
		Mov	edi, ptrDst
		Sub	[ebx].m_nLength, ecx
		Sub	nCount, ecx
		Add	nDecoded, ecx
		.If	ecx != 0
		.Repeat
			Mov	SDWord Ptr [edi], eax
			Add	edi, 4
			Dec	ecx
		.Until	Zero?
		.EndIf
		Mov	ptrDst, edi
	.EndIf
	;;
	Mov	eax, [ebx].m_pLastHuffmanTree
	Mov	ecx, nCount
	Mov	tree, eax
	Mov	esi, eax
	.While	ecx != 0
		;;
		;; 次の符号を復号
		Assume	esi:Ptr ERINA_HUFFMAN_TREE
		@GetAHuffmanCode	esc_label
		Assume	esi:Nothing
		Mov	ecx, nDecoded
		Mov	edi, ptrDst
		Mov	edx, nCount
		MovSx	eax, al
		Mov	ebx, _this
		Inc	ecx
		Dec	edx
		Mov	SDWord Ptr [edi], eax
		Mov	nDecoded, ecx
		Mov	nCount, edx
		Add	edi, (SizeOf SDWord)
		;;
		;; 零ランレングス
		.If	 eax == 0
			;;
			;; 長さの符号を取得
			Mov	esi, [ebx].m_pHuffmanTree[100H * 4]
			Assume	esi:Ptr ERINA_HUFFMAN_TREE
			Mov	tree, esi
			Mov	ptrDst, edi
			@GetLengthHuffman	esc_label
			Mov	ebx, _this
			Mov	edi, ptrDst
			Assume	esi:Nothing
			;;
			Dec	eax
			.If	!Zero?
				;;
				;; 零ランレングスを展開
				Mov	ecx, eax
				.If	eax > nCount
					Mov	ecx, nCount
				.EndIf
				Sub	eax, ecx
				Sub	nCount, ecx
				Add	nDecoded, ecx
				Mov	[ebx].m_nLength, eax
				Xor	eax, eax
				.If	ecx != 0
				.Repeat
					Mov	SDWord Ptr [edi], eax
					Add	edi, 4
					Dec	ecx
				.Until	Zero?
				.EndIf
			.EndIf
		.EndIf
		And	eax, 0FFH
		Mov	ptrDst, edi
		Mov	ecx, nCount
		Mov	esi, [ebx].m_pHuffmanTree[eax * 4]
		Mov	tree, esi
	.EndW
	;;
	Mov	[ebx].m_pLastHuffmanTree, esi

	Assume	ebx:Nothing

esc_label:
	Mov	esp, dwInitESP
	Mov	eax, nDecoded
	IfNDef	_BORLAND_CPP
		Ret	4 * 2
	Else
		Ret
	EndIf

RLHDecodeContext@@DecodeERINACodes	EndP

;
;	ERINA 符号を復号する（8ビットバージョン）
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
RLHDecodeContext@@DecodeERINACodesSBZL	Proc	Near32 SysCall Uses ebx esi edi,
	ptrDst:Ptr SByte, nCount:DWord
	Local	_this:PRLHDecodeContext
Else
RLHDecodeContext@@DecodeERINACodesSBZL	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PRLHDecodeContext, ptrDst:Ptr SByte, nCount:DWord
EndIf

	Local	dwInitESP:DWord
	Local	phnEntry:Ptr ERINA_HUFFMAN_NODE
	Local	tree:Ptr ERINA_HUFFMAN_TREE
	Local	nDecoded:DWord

	Mov	dwInitESP, esp

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
		Mov	_this, ecx
	Else
		Mov	ebx, _this
	EndIf
	Assume	ebx:Ptr RLHDecodeContext

	;;
	;; 零ランレングスの残りを展開
	Mov	ecx, [ebx].m_nLength
	Mov	nDecoded, 0
	.If	ecx != 0
		.If	ecx > nCount
			Mov	ecx, nCount
		.EndIf
		Xor	eax, eax
		Mov	edi, ptrDst
		Sub	[ebx].m_nLength, ecx
		Sub	nCount, ecx
		Add	nDecoded, ecx
		.If	ecx != 0
		.Repeat
			Mov	SByte Ptr [edi], al
			Inc	edi
			Dec	ecx
		.Until	Zero?
		.EndIf
		Mov	ptrDst, edi
	.EndIf
	;;
	Mov	eax, [ebx].m_pLastHuffmanTree
	Mov	ecx, nCount
	Mov	tree, eax
	Mov	esi, eax
	.While	ecx != 0
		;;
		;; 次の符号を復号
		Assume	esi:Ptr ERINA_HUFFMAN_TREE
		@GetAHuffmanCode	esc_label
		Assume	esi:Nothing
		Mov	ecx, nDecoded
		Mov	edi, ptrDst
		Mov	edx, nCount
		Mov	ebx, _this
		Inc	ecx
		Dec	edx
		Mov	SByte Ptr [edi], al
		Mov	nDecoded, ecx
		Mov	nCount, edx
		Inc	edi
		;;
		;; 零ランレングス
		.If	 al == 0
			;;
			;; 長さの符号を取得
			Mov	esi, [ebx].m_pHuffmanTree[100H * 4]
			Assume	esi:Ptr ERINA_HUFFMAN_TREE
			Mov	tree, esi
			Mov	ptrDst, edi
			@GetLengthHuffman	esc_label
			Mov	ebx, _this
			Mov	edi, ptrDst
			Assume	esi:Nothing
			;;
			Dec	eax
			.If	!Zero?
				;;
				;; 零ランレングスを展開
				Mov	ecx, eax
				.If	eax > nCount
					Mov	ecx, nCount
				.EndIf
				Sub	eax, ecx
				Sub	nCount, ecx
				Add	nDecoded, ecx
				Mov	[ebx].m_nLength, eax
				Xor	eax, eax
				.If	ecx != 0
				.Repeat
					Mov	SByte Ptr [edi], al
					Inc	edi
					Dec	ecx
				.Until	Zero?
				.EndIf
			.EndIf
		.EndIf
		And	eax, 0FFH
		Mov	ptrDst, edi
		Mov	ecx, nCount
		Mov	esi, [ebx].m_pHuffmanTree[eax * 4]
		Mov	tree, esi
	.EndW
	;;
	Mov	[ebx].m_pLastHuffmanTree, esi

	Assume	ebx:Nothing

esc_label:
	Mov	esp, dwInitESP
	Mov	eax, nDecoded
	IfNDef	_BORLAND_CPP
		Ret	4 * 2
	Else
		Ret
	EndIf

RLHDecodeContext@@DecodeERINACodesSBZL	EndP

;
;	ERINA 符号（256色用）を復号する
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
RLHDecodeContext@@DecodeERINACodes256	Proc	Near32 SysCall Uses ebx esi edi,
	ptrDst:PBYTE, nCount:DWord
	Local	_this:Ptr RLHDecodeContext
Else
RLHDecodeContext@@DecodeERINACodes256	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PRLHDecodeContext, ptrDst:PBYTE, nCount:DWord
EndIf

	Local	dwInitESP:DWord
	Local	phnEntry:Ptr ERINA_HUFFMAN_NODE
	Local	tree:Ptr ERINA_HUFFMAN_TREE
	Local	nDecoded:DWord
	Local	nLastSymbol:SDWord

	Mov	dwInitESP, esp

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
		Mov	_this, ecx
	Else
		Mov	ebx, _this
	EndIf
	Assume	ebx:Ptr RLHDecodeContext

	;;
	;; 初期化
	Mov	esi, [ebx].m_pLastHuffmanTree
	Mov	ecx, nCount
	Mov	nDecoded, 0
	Mov	nLastSymbol, ERINA_HUFFMAN_ESCAPE
	Mov	tree, esi
	;;
	.While	ecx != 0
		;;
		;; 次の符号を復号
		Assume	esi:Ptr ERINA_HUFFMAN_TREE
		@GetAHuffmanCode	esc_label
		Assume	esi:Nothing
		Mov	ecx, nDecoded
		Mov	edi, ptrDst
		Mov	edx, nCount
		Mov	ebx, _this
		Inc	ecx
		Dec	edx
		Mov	Byte Ptr [edi], al
		Mov	nDecoded, ecx
		Mov	nCount, edx
		Inc	edi
		;;
		;; ランレングス
		.If	nLastSymbol == eax
			;;
			;; 長さの符号を取得
			Mov	esi, [ebx].m_pHuffmanTree[100H * 4]
			Assume	esi:Ptr ERINA_HUFFMAN_TREE
			Mov	tree, esi
			Mov	ptrDst, edi
			@GetLengthHuffman	esc_label
			Mov	ebx, _this
			Mov	edi, ptrDst
			Assume	esi:Nothing
			;;
			Dec	eax
			.If	!Zero?
				;;
				;; ランレングスを展開
				Mov	ecx, eax
				Cmp	eax, nCount
				Ja	esc_label
				Sub	nCount, ecx
				Add	nDecoded, ecx
				Mov	eax, nLastSymbol
				.If	ecx != 0
				.Repeat
					Mov	Byte Ptr [edi], al
					Inc	edi
					Dec	ecx
				.Until	Zero?
				.EndIf
			.EndIf
			Mov	eax, nLastSymbol
		.EndIf
		;;
		Mov	nLastSymbol, eax
		And	eax, 0FFH
		Mov	ptrDst, edi
		Mov	ecx, nCount
		Mov	esi, [ebx].m_pHuffmanTree[eax * 4]
		Mov	tree, esi
	.EndW

	Mov	eax, tree
	Mov	[ebx].m_pLastHuffmanTree, eax
	Assume	ebx:Nothing

esc_label:
	Mov	esp, dwInitESP
	Mov	eax, nDecoded
	IfNDef	_BORLAND_CPP
		Ret	4 * 2
	Else
		Ret
	EndIf

RLHDecodeContext@@DecodeERINACodes256	EndP


;
;	オペレーションを実行
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
ERIDecoder@@PerformOperation		Proc	Near32 SysCall Uses ebx esi edi,
	dwOpCode:DWord, nAllBlockLines:DWord, ptrNextLineBuf:Ptr PINT
	Local	_this:PERIDecoder
Else
ERIDecoder@@PerformOperation		Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIDecoder,
	dwOpCode:DWord, nAllBlockLines:DWord, ptrNextLineBuf:Ptr PINT
EndIf

	Local	iLoopCount:DWord
	Local	ptrLineBuf:PINT

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
		Mov	_this, ecx
	Else
		Mov	ebx, _this
	EndIf
	Assume	ebx:PERIDecoder

	;
	;	再配列の実行
	; --------------------------------------------------------------------
	Mov	eax, dwOpCode
	Shr	eax, 4
	And	eax, 03H
	Mov	ecx, [ebx].m_nBlockSamples
	Mov	esi, [ebx].m_ptrSubBuf
	Mov	edi, [ebx].m_ptrBuffer
	Mov	ebx, [ebx].m_pArrangeTable[eax * 4]
	Assume	ebx:Nothing
	.Repeat
		Mov	eax, DWord Ptr [ebx]
		Mov	edx, SDWord Ptr [esi]
		Add	ebx, (SizeOf DWord)
		Add	esi, (SizeOf SDWord)
		Mov	SDWord Ptr [edi + eax * 4], edx
		Dec	ecx
	.Until	Zero?
	Mov	ebx, _this
	Assume	ebx:PERIDecoder

	;
	;	カラーオペレーションを実行
	; --------------------------------------------------------------------
	Mov	eax, dwOpCode
	And	eax, 0FH
	IfNDef	_BORLAND_CPP
		Mov	ecx, ebx
		Call	ERIDecoder@@m_pfnColorOperation[eax * 4]
	Else
		Push	ebx
		Call	ERIDecoder@@m_pfnColorOperation[eax * 4]
		Add	esp, (SizeOf DWord)
	EndIf

	;
	;	差分処理を実行（水平方向）
	; --------------------------------------------------------------------
	.If	dwOpCode & 40H
		Mov	ecx, nAllBlockLines
		Mov	esi, [ebx].m_ptrBuffer
		Mov	edi, [ebx].m_ptrColumnBuf
		.Repeat
			Mov	iLoopCount, ecx
			;
			Mov	ecx, [ebx].m_nBlockSize
			Mov	eax, SDWord Ptr [edi]
			Mov	edx, SDWord Ptr [edi + 4]
			Lea	ebx, [esi + ecx * 4]
			Assume	ebx:Nothing
			;
			.Repeat
				Add	eax, SDWord Ptr [esi]
				Add	edx, SDWord Ptr [ebx]
				Mov	SDWord Ptr [esi], eax
				Add	esi, (SizeOf SDWord)
				Mov	SDWord Ptr [ebx], edx
				Add	ebx, (SizeOf SDWord)
				Dec	ecx
			.Until	Zero?
			;
			Mov	ecx, iLoopCount
			Mov	esi, ebx
			Mov	ebx, _this
			Assume	ebx:PERIDecoder
			Mov	SDWord Ptr [edi], eax
			Mov	SDWord Ptr [edi + 4], edx
			Add	edi, (SizeOf SDWord) * 2
			;
			Sub	ecx, 2
		.Until	Zero?

	.Else
		Mov	ecx, nAllBlockLines
		Mov	edx, [ebx].m_nBlockSize
		Mov	esi, [ebx].m_ptrBuffer
		Mov	edi, [ebx].m_ptrColumnBuf
		.Repeat
			Mov	eax, SDWord Ptr [esi + edx * 4 - 4]
			Lea	esi, [esi + edx * 4]
			Mov	SDWord Ptr [edi], eax
			Add	edi, (SizeOf SDWord)
			Dec	ecx
		.Until	Zero?
	.EndIf

	;
	;	差分処理を実行（垂直方向）
	; --------------------------------------------------------------------
	Mov	eax, [ebx].m_nBlockSize
	Mov	edi, ptrNextLineBuf
	Mov	esi, [ebx].m_ptrBuffer
	Mov	ecx, [ebx].m_nChannelCount
	Mov	edi, PINT Ptr [edi]
	;
	.If	(eax >= 4) && \
			(ERI_EnabledProcessorType & ERI_USE_MMX_PENTIUM)
		.Repeat
			Mov	iLoopCount, ecx
			Mov	ptrLineBuf, edi
			;
			Mov	edx, [ebx].m_nBlockSize
			.Repeat
				Mov	ecx, [ebx].m_nBlockSize
				Mov	eax, esi
				.Repeat
					movq	mm0, MMWord Ptr [esi]
					movq	mm2, MMWord Ptr [edi]
					movq	mm1, MMWord Ptr [esi + 8]
					movq	mm3, MMWord Ptr [edi + 8]
					Add	edi, 16
					paddd	mm0, mm2
					paddd	mm1, mm3
					movq	MMWord Ptr [esi], mm0
					movq	MMWord Ptr [esi + 8], mm1
					Add	esi, 16
					Sub	ecx, 4
				.Until	Zero?
				Mov	edi, eax
				Dec	edx
			.Until	Zero?
			;
			Mov	edx, eax
			Mov	edi, ptrLineBuf
			Mov	ecx, [ebx].m_nBlockSize
			.Repeat
				movq	mm0, MMWord Ptr [edx]
				movq	mm1, MMWord Ptr [edx + 8]
				Add	edx, 16
				movq	MMWord Ptr [edi], mm0
				movq	MMWord Ptr [edi + 8], mm1
				Add	edi, 16
				Sub	ecx, 4
			.Until	Zero?
			;
			Mov	ecx, iLoopCount
			Dec	ecx
		.Until	Zero?

	.Else
		.Repeat
			Push	ecx
			Mov	ptrLineBuf, edi
			;
			Mov	ecx, [ebx].m_nBlockSize
			.Repeat
				Push	ecx
				Mov	ecx, [ebx].m_nBlockSize
				Push	esi
				.Repeat
					Mov	eax, SDWord Ptr [esi]
					Mov	edx, SDWord Ptr [edi]
					Add	edi, (SizeOf SDWord)
					Add	eax, edx
					Mov	SDWord Ptr [esi], eax
					Add	esi, (SizeOf SDWord)
					Dec	ecx
				.Until	Zero?
				Pop	edi
				Pop	ecx
				Dec	ecx
			.Until	Zero?
			;
			Mov	edx, edi
			Mov	edi, ptrLineBuf
			Mov	ecx, [ebx].m_nBlockSize
			.Repeat
				Mov	eax, SDWord Ptr [edx]
				Add	edx, (SizeOf SDWord)
				Mov	SDWord Ptr [edi], eax
				Add	edi, (SizeOf SDWord)
				Dec	ecx
			.Until	Zero?
			;
			Pop	ecx
			Dec	ecx
		.Until	Zero?

	.EndIf

	Mov	eax, ptrNextLineBuf
	Mov	PINT Ptr [eax], edi

	.If	ERI_EnabledProcessorType & ERI_USE_MMX_PENTIUM
		emms
	.EndIf

	Assume	ebx:Nothing

	IfNDef	_BORLAND_CPP
		Ret	4 * 3
	Else
		Ret
	EndIf

ERIDecoder@@PerformOperation		EndP


;
;
;	チャネル間差分処理マクロ
; ----------------------------------------------------------------------------
;  Parameters ;
;	EBX register : ERIDecoder オブジェクトへのポインタ
;  Registers ;
;	EBX, EBP, ESP レジスタは保証される
; ----------------------------------------------------------------------------

@ERImage_DifferenceBetweenChannel	Macro	op_code:Req
	Local	AddrSource, AddrDest1, AddrDest2

	If	(op_code And 1100B) Eq 0100B
		AddrSource	TextEqu	<edi>
		AddrDest1	TextEqu	<edi + edx>
		AddrDest2	TextEqu	<edi + edx * 2>
	ElseIf	(op_code And 1100B) Eq 1000B
		AddrSource	TextEqu	<edi + edx>
		AddrDest1	TextEqu	<edi>
		AddrDest2	TextEqu	<edi + edx * 2>
	ElseIf	(op_code And 1100B) Eq 1100B
		AddrSource	TextEqu	<edi + edx * 2>
		AddrDest1	TextEqu	<edi>
		AddrDest2	TextEqu	<edi + edx>
	EndIf

	Assume	ebx:Ptr ERIDecoder
	;;
	Mov	ecx, [ebx].m_nBlockArea
	Mov	edi, [ebx].m_ptrBuffer
	Lea	edx, [ecx * (SizeOf DWord)]
	.If	ERI_EnabledProcessorType & ERI_USE_MMX_PENTIUM
	.While	ecx >= 4
		Sub	ecx, 4
		If	op_code And 0001B
			movq	mm2, MMWord Ptr [AddrDest1]
			movq	mm3, MMWord Ptr [AddrDest1 + 8]
		EndIf
		If	op_code And 0010B
			movq	mm4, MMWord Ptr [AddrDest2]
			movq	mm5, MMWord Ptr [AddrDest2 + 8]
		EndIf
		movq	mm0, MMWord Ptr [AddrSource]
		movq	mm1, MMWord Ptr [AddrSource + 8]
		If	op_code And 0001B
			paddd	mm2, mm0
			paddd	mm3, mm1
		EndIf
		If	op_code And 0010B
			paddd	mm4, mm0
			paddd	mm5, mm1
		EndIf
		If	op_code And 0001B
			movq	MMWord Ptr [AddrDest1], mm2
			movq	MMWord Ptr [AddrDest1 + 8], mm3
		EndIf
		If	op_code And 0010B
			movq	MMWord Ptr [AddrDest2], mm4
			movq	MMWord Ptr [AddrDest2 + 8], mm5
		EndIf
		Add	edi, (SizeOf SDWord) * 4
	.EndW
	emms
	.EndIf
	.While	ecx >= 2
		Sub	ecx, 2
		Mov	eax, SDWord Ptr [AddrSource]
		Mov	esi, SDWord Ptr [AddrSource + 4]
		If	op_code And 0001B
			Add	SDWord Ptr [AddrDest1], eax
			Add	SDWord Ptr [AddrDest1 + 4], esi
		EndIf
		If	op_code And 0010B
			Add	SDWord Ptr [AddrDest2], eax
			Add	SDWord Ptr [AddrDest2 + 4], esi
		EndIf
		Add	edi, (SizeOf SDWord) * 2
	.EndW
	.If	ecx != 0
		Mov	eax, SDWord Ptr [AddrSource]
		If	op_code And 0001B
			Add	SDWord Ptr [AddrDest1], eax
		EndIf
		If	op_code And 0010B
			Add	SDWord Ptr [AddrDest2], eax
		EndIf
	.EndIf
	;;
	Assume	ebx:Nothing

					EndM

Align	10H
IfNDef	_BORLAND_CPP
ERIDecoder@@ColorOperation0000	Proc	Near32 SysCall Uses ebx esi edi
Else
ERIDecoder@@ColorOperation0000	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIDecoder
EndIf
	Ret
ERIDecoder@@ColorOperation0000	EndP

Align	10H
IfNDef	_BORLAND_CPP
ERIDecoder@@ColorOperation0101	Proc	Near32 SysCall Uses ebx esi edi
	Mov	ebx, ecx
Else
ERIDecoder@@ColorOperation0101	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIDecoder
	Mov	ebx, _this
EndIf
	@ERImage_DifferenceBetweenChannel	0101B
	Ret
ERIDecoder@@ColorOperation0101	EndP

Align	10H
IfNDef	_BORLAND_CPP
ERIDecoder@@ColorOperation0110	Proc	Near32 SysCall Uses ebx esi edi
	Mov	ebx, ecx
Else
ERIDecoder@@ColorOperation0110	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIDecoder
	Mov	ebx, _this
EndIf
	@ERImage_DifferenceBetweenChannel	0110B
	Ret
ERIDecoder@@ColorOperation0110	EndP

Align	10H
IfNDef	_BORLAND_CPP
ERIDecoder@@ColorOperation0111	Proc	Near32 SysCall Uses ebx esi edi
	Mov	ebx, ecx
Else
ERIDecoder@@ColorOperation0111	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIDecoder
	Mov	ebx, _this
EndIf
	@ERImage_DifferenceBetweenChannel	0111B
	Ret
ERIDecoder@@ColorOperation0111	EndP

Align	10H
IfNDef	_BORLAND_CPP
ERIDecoder@@ColorOperation1001	Proc	Near32 SysCall Uses ebx esi edi
	Mov	ebx, ecx
Else
ERIDecoder@@ColorOperation1001	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIDecoder
	Mov	ebx, _this
EndIf
	@ERImage_DifferenceBetweenChannel	1001B
	Ret
ERIDecoder@@ColorOperation1001	EndP

Align	10H
IfNDef	_BORLAND_CPP
ERIDecoder@@ColorOperation1010	Proc	Near32 SysCall Uses ebx esi edi
	Mov	ebx, ecx
Else
ERIDecoder@@ColorOperation1010	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIDecoder
	Mov	ebx, _this
EndIf
	@ERImage_DifferenceBetweenChannel	1010B
	Ret
ERIDecoder@@ColorOperation1010	EndP

Align	10H
IfNDef	_BORLAND_CPP
ERIDecoder@@ColorOperation1011	Proc	Near32 SysCall Uses ebx esi edi
	Mov	ebx, ecx
Else
ERIDecoder@@ColorOperation1011	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIDecoder
	Mov	ebx, _this
EndIf
	@ERImage_DifferenceBetweenChannel	1011B
	Ret
ERIDecoder@@ColorOperation1011	EndP

Align	10H
IfNDef	_BORLAND_CPP
ERIDecoder@@ColorOperation1101	Proc	Near32 SysCall Uses ebx esi edi
	Mov	ebx, ecx
Else
ERIDecoder@@ColorOperation1101	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIDecoder
	Mov	ebx, _this
EndIf
	@ERImage_DifferenceBetweenChannel	1101B
	Ret
ERIDecoder@@ColorOperation1101	EndP

Align	10H
IfNDef	_BORLAND_CPP
ERIDecoder@@ColorOperation1110	Proc	Near32 SysCall Uses ebx esi edi
	Mov	ebx, ecx
Else
ERIDecoder@@ColorOperation1110	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIDecoder
	Mov	ebx, _this
EndIf
	@ERImage_DifferenceBetweenChannel	1110B
	Ret
ERIDecoder@@ColorOperation1110	EndP

Align	10H
IfNDef	_BORLAND_CPP
ERIDecoder@@ColorOperation1111	Proc	Near32 SysCall Uses ebx esi edi
	Mov	ebx, ecx
Else
ERIDecoder@@ColorOperation1111	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIDecoder
	Mov	ebx, _this
EndIf
	@ERImage_DifferenceBetweenChannel	1111B
	Ret
ERIDecoder@@ColorOperation1111	EndP


;
;	RGB24 フォーマットでデータをストア
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
ERIDecoder@@RestoreRGB24II		Proc	Near32 SysCall Uses ebx esi edi,
	ptrDst:PBYTE, nLineBytes:SDWord,
	ptrSrc:Ptr PREAL32, nWidth:SDWord, nHeight:SDWord
	Local	_this:PERIDecoder
Else
ERIDecoder@@RestoreRGB24II		Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIDecoder,
	ptrDst:PBYTE, nLineBytes:SDWord,
	ptrSrc:Ptr PREAL32, nWidth:SDWord, nHeight:SDWord
EndIf

	Local	nTempBuf[4]:SDWord
	Local	nLineOffset:SDWord
	Local	ptrDstLine:PBYTE
	Local	nBytesPerPixel:DWord

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
		Mov	_this, ecx
	Else
		Mov	ebx, _this
	EndIf
	;
	Mov	eax, (ERIDecoder Ptr [ebx]).m_nDstBytesPerPixel
	Mov	nBytesPerPixel, eax
	Mov	eax, ptrDst
	Mov	nLineOffset, 0
	Mov	ptrDstLine, eax
	.If	(ERI_EnabledProcessorType & ERI_USE_XMM_P3) && \
			!(nWidth & 0003H) && (nBytesPerPixel == 4)
	;
	; XMM, MMX を使ったバージョン
	;
	Xor	ecx, ecx
	.If	ecx < nHeight
	.Repeat
		Push	ecx
		;
		Mov	eax, ptrSrc
		Mov	esi, PREAL32 Ptr [eax]
		Mov	edx, PREAL32 Ptr [eax + 4]
		Mov	ebx, PREAL32 Ptr [eax + 8]
		Mov	eax, nLineOffset
		Lea	esi, [esi + eax * 4]
		Lea	edx, [edx + eax * 4]
		Lea	ebx, [ebx + eax * 4]
		;
		prefetchnta	[esi]
		Mov	edi, ptrDstLine
		prefetchnta	[edx]
		Xor	ecx, ecx
		prefetchnta	[ebx]
		Mov	eax, nWidth
		.If	ecx < nWidth
		.Repeat
			pxor		mm3, mm3
			movups		xmm0, [esi + ecx * 4]
			movups		xmm1, [edx + ecx * 4]
			movups		xmm2, [ebx + ecx * 4]
			;
			cvtps2pi	mm0, xmm0
			shufps		xmm0, xmm0, 11101110B
			prefetchnta	[esi + ecx * 4 + 32]
			cvtps2pi	mm1, xmm1
			shufps		xmm1, xmm1, 11101110B
			prefetchnta	[edx + ecx * 4 + 32]
			cvtps2pi	mm2, xmm2
			shufps		xmm2, xmm2, 11101110B
			prefetchnta	[ebx + ecx * 4 + 32]
			;
			cvtps2pi	mm4, xmm0
			cvtps2pi	mm5, xmm1
			cvtps2pi	mm6, xmm2
			;
			packssdw	mm0, mm4
			packssdw	mm1, mm5
			packssdw	mm2, mm6
			;
			packuswb	mm0, mm3
			packuswb	mm1, mm3
			packuswb	mm2, mm3
			;
			punpcklbw	mm0, mm1
			punpcklbw	mm2, mm3
			movq		mm1, mm0
			;
			punpcklwd	mm0, mm2
			punpckhwd	mm1, mm2
			;
			movntq		[edi]    , mm0
			movntq		[edi + 8], mm1
			;
			Add	ecx, 4
			Add	edi, 16
			;
		.Until	ecx >= eax
		.EndIf
		;
		Pop	ecx
		;
		Mov	ebx, _this
		Mov	eax, nLineOffset
		Mov	edx, ptrDstLine
		Add	eax, (ERIDecoder Ptr [ebx]).m_nBlockSize
		Add	edx, nLineBytes
		Mov	nLineOffset, eax
		Mov	ptrDstLine, edx
		;
		Inc	ecx
	.Until	ecx >= nHeight
	.EndIf
	sfence
	emms
	;
	.Else
	;
	; 互換バージョン
	;
	Xor	ecx, ecx
	.If	ecx < nHeight
	.Repeat
		Push	ecx
		;
		Mov	eax, ptrSrc
		Mov	esi, PREAL32 Ptr [eax]
		Mov	edx, PREAL32 Ptr [eax + 4]
		Mov	ebx, PREAL32 Ptr [eax + 8]
		Mov	eax, nLineOffset
		Lea	esi, [esi + eax * 4]
		Lea	edx, [edx + eax * 4]
		Lea	ebx, [ebx + eax * 4]
		;
		Mov	edi, ptrDstLine
		Xor	ecx, ecx
		.If	ecx < nWidth
		.Repeat
			fld	Real4 Ptr [esi + ecx * 4]
			fistp	nTempBuf[0]
			fld	Real4 Ptr [edx + ecx * 4]
			fistp	nTempBuf[4]
			fld	Real4 Ptr [ebx + ecx * 4]
			fistp	nTempBuf[8]
			;
			Mov	eax, nTempBuf[0]
			Cmp	eax, 100H
			.If	!Carry?
				Sar	eax, 31
				Not	eax
			.EndIf
			Mov	Byte Ptr [edi], al
			Mov	eax, nTempBuf[4]
			Cmp	eax, 100H
			.If	!Carry?
				Sar	eax, 31
				Not	eax
			.EndIf
			Mov	Byte Ptr [edi + 1], al
			Mov	eax, nTempBuf[8]
			Cmp	eax, 100H
			.If	!Carry?
				Sar	eax, 31
				Not	eax
			.EndIf
			Mov	Byte Ptr [edi + 2], al
			;
			Inc	ecx
			Add	edi, nBytesPerPixel
			;
		.Until	ecx >= nWidth
		.EndIf
		;
		Pop	ecx
		;
		Mov	ebx, _this
		Mov	eax, nLineOffset
		Mov	edx, ptrDstLine
		Add	eax, (ERIDecoder Ptr [ebx]).m_nBlockSize
		Add	edx, nLineBytes
		Mov	nLineOffset, eax
		Mov	ptrDstLine, edx
		;
		Inc	ecx
	.Until	ecx >= nHeight
	.EndIf
	;
	.EndIf

	IfNDef	_BORLAND_CPP
		Ret	4 * 5
	Else
		Ret
	EndIf

ERIDecoder@@RestoreRGB24II		EndP


;
;	RGBA32 フォーマットでデータをストア
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
ERIDecoder@@RestoreRGBA32II		Proc	Near32 SysCall Uses ebx esi edi,
	ptrDst:PBYTE, nLineBytes:SDWord,
	ptrSrc:Ptr PREAL32, nWidth:SDWord, nHeight:SDWord
	Local	_this:PERIDecoder
Else
ERIDecoder@@RestoreRGBA32II		Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIDecoder,
	ptrDst:PBYTE, nLineBytes:SDWord,
	ptrSrc:Ptr PREAL32, nWidth:SDWord, nHeight:SDWord
EndIf

	Local	flagUseXMM:SDWord
	Local	nTempBuf[4]:SDWord
	Local	nLineOffset:SDWord
	Local	ptrDstLine:PBYTE

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
		Mov	_this, ecx
	Else
		Mov	ebx, _this
	EndIf
	;
	Mov	flagUseXMM, 0
	Mov	eax, ptrDst
	Mov	nLineOffset, 0
	Mov	ptrDstLine, eax
	.If	(ERI_EnabledProcessorType & ERI_USE_XMM_P3) \
					&& !(nWidth & 0001H)
		Mov	flagUseXMM, 1
	.EndIf
	;
	Xor	ecx, ecx
	.If	ecx < nHeight
	.Repeat
		Push	ecx
		;
		Mov	eax, ptrSrc
		Mov	esi, PREAL32 Ptr [eax]
		Mov	edx, PREAL32 Ptr [eax + 4]
		Mov	ecx, PREAL32 Ptr [eax + 8]
		Mov	ebx, PREAL32 Ptr [eax + 12]
		Mov	eax, nLineOffset
		Lea	esi, [esi + eax * 4]
		Lea	edx, [edx + eax * 4]
		Lea	ecx, [ecx + eax * 4]
		Lea	ebx, [ebx + eax * 4]
		;
		prefetchnta	[esi]
		Mov	edi, ptrDstLine
		prefetchnta	[edx]
		Xor	eax, eax
		prefetchnta	[ebx]
		.If	eax < nWidth
		.If	flagUseXMM != 0
		.Repeat
			movss	xmm0, [esi + eax * 4]
			movss	xmm1, [edx + eax * 4]
			movss	xmm2, [ecx + eax * 4]
			movss	xmm3, [ebx + eax * 4]
			;
			movss	xmm4, [esi + eax * 4 + 4]
			movss	xmm5, [edx + eax * 4 + 4]
			movss	xmm6, [ecx + eax * 4 + 4]
			movss	xmm7, [ebx + eax * 4 + 4]
			;
			unpcklps	xmm0, xmm1
			unpcklps	xmm2, xmm3
			unpcklps	xmm4, xmm5
			unpcklps	xmm6, xmm7
			;
			cvtps2pi	mm0, xmm0
			cvtps2pi	mm1, xmm2
			cvtps2pi	mm2, xmm4
			cvtps2pi	mm3, xmm6
			;
			packssdw	mm0, mm1
			packssdw	mm2, mm3
			;
			packuswb	mm0, mm2
			;
			movntq	MMWord Ptr [edi], mm0
			;
			Add	eax, 2
			Add	edi, 8
			;
		.Until	eax >= nWidth
		.Else
		.Repeat
			Push	eax
			;
			fld	Real4 Ptr [esi + eax * 4]
			fistp	nTempBuf[0]
			fld	Real4 Ptr [edx + eax * 4]
			fistp	nTempBuf[4]
			fld	Real4 Ptr [ecx + eax * 4]
			fistp	nTempBuf[8]
			fld	Real4 Ptr [ebx + eax * 4]
			fistp	nTempBuf[12]
			;
			Mov	eax, nTempBuf[0]
			Cmp	eax, 100H
			.If	!Carry?
				Sar	eax, 31
				Not	eax
			.EndIf
			Mov	Byte Ptr [edi], al
			Mov	eax, nTempBuf[4]
			Cmp	eax, 100H
			.If	!Carry?
				Sar	eax, 31
				Not	eax
			.EndIf
			Mov	Byte Ptr [edi + 1], al
			Mov	eax, nTempBuf[8]
			Cmp	eax, 100H
			.If	!Carry?
				Sar	eax, 31
				Not	eax
			.EndIf
			Mov	Byte Ptr [edi + 2], al
			Mov	eax, nTempBuf[12]
			Cmp	eax, 100H
			.If	!Carry?
				Sar	eax, 31
				Not	eax
			.EndIf
			Mov	Byte Ptr [edi + 3], al
			;
			Pop	eax
			Add	edi, 4
			Inc	eax
			;
		.Until	eax >= nWidth
		.EndIf
		.EndIf
		;
		Pop	ecx
		;
		Mov	ebx, _this
		Mov	eax, nLineOffset
		Mov	edx, ptrDstLine
		Add	eax, (ERIDecoder Ptr [ebx]).m_nBlockSize
		Add	edx, nLineBytes
		Mov	nLineOffset, eax
		Mov	ptrDstLine, edx
		;
		Inc	ecx
	.Until	ecx >= nHeight
	.EndIf

	.If	flagUseXMM != 0
		emms
	.EndIf

	IfNDef	_BORLAND_CPP
		Ret	4 * 5
	Else
		Ret
	EndIf

ERIDecoder@@RestoreRGBA32II		EndP


;
;	YUV → RGB 変換
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
ERIDecoder@@ConvertYUVtoRGB		Proc	Near32 SysCall Uses ebx esi edi
Else
ERIDecoder@@ConvertYUVtoRGB		Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIDecoder
EndIf

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
	Else
		Mov	ebx, _this
	EndIf
	Assume	ebx:PERIDecoder

	Xor	ecx, ecx
	.Repeat
		Mov	edx, [ebx].m_ptrBuffer2[0 * 16 + ecx * 4]
		Mov	esi, [ebx].m_ptrBuffer2[1 * 16 + ecx * 4]
		Mov	edi, [ebx].m_ptrBuffer2[2 * 16 + ecx * 4]
		;
		.If	ERI_EnabledProcessorType & ERI_USE_XMM_P3
			Xor	eax, eax
			prefetchnta	[edi + eax * 4]
			prefetchnta	[edx + eax * 4]
			prefetchnta	[esi + eax * 4]
			;
			.Repeat
				movups	xmm2, [edi + eax * 4]
				movups	xmm6, [edi + eax * 4 + 16]
				prefetchnta	[edi + eax * 4 + 32]
				movups	xmm0, [edx + eax * 4]
				movups	xmm4, [edx + eax * 4 + 16]
				prefetchnta	[edx + eax * 4 + 32]
				movups	xmm1, [esi + eax * 4]
				movups	xmm5, [esi + eax * 4 + 16]
				prefetchnta	[esi + eax * 4 + 32]
				;
				movaps	xmm3, xmm2
				movaps	xmm7, xmm6
				mulps	xmm2, ERI_XMM_r3by2
				mulps	xmm6, ERI_XMM_r3by2
				addps	xmm2, xmm0
				mulps	xmm3, ERI_XMM_rM3by4
				addps	xmm6, xmm4
				mulps	xmm7, ERI_XMM_rM3by4
				movups	[edx + eax * 4], xmm2
				movups	[edx + eax * 4 + 16], xmm6
				;
				movaps	xmm2, xmm1
				movaps	xmm6, xmm5
				mulps	xmm1, ERI_XMM_r7by4
				mulps	xmm5, ERI_XMM_r7by4
				addps	xmm1, xmm0
				mulps	xmm2, ERI_XMM_rM3by8
				addps	xmm5, xmm4
				mulps	xmm6, ERI_XMM_rM3by8
				movups	[edi + eax * 4], xmm1
				addps	xmm0, xmm3
				movups	[edi + eax * 4 + 16], xmm5
				addps	xmm4, xmm7
				;
				addps	xmm0, xmm2
				addps	xmm4, xmm6
				;
				movups	[esi + eax * 4], xmm0
				movups	[esi + eax * 4 + 16], xmm4
				;
				Add	eax, 8
			.Until	eax >= [ebx].m_nBlockArea
		.Else
			Xor	eax, eax
			.Repeat
				fld	Real4 Ptr [edx + eax * 4]
				fld	Real4 Ptr [esi + eax * 4]
				fld	Real4 Ptr [edi + eax * 4]
				;
				fld	st(0)
				fmul	ERI_r3by2
				fadd	st, st(3)
				fstp	Real4 Ptr [edx + eax * 4]
				;
				fld	st(1)
				fmul	ERI_rM3by8
				fxch	st(1)
				fmul	ERI_rM3by4
				faddp	st(1), st
				fadd	st, st(2)
				fstp	Real4 Ptr [esi + eax * 4]
				;
				fmul	ERI_r7by4
				faddp	st(1), st
				fstp	Real4 Ptr [edi + eax * 4]
				;
				Inc	eax
			.Until	eax >= [ebx].m_nBlockArea
		.EndIf
		;
		Inc	ecx
	.Until	ecx >= 4

	Assume	ebx:Nothing

	Ret

ERIDecoder@@ConvertYUVtoRGB		EndP


;
;	4:4:4 データコピー
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
ERIDecoder@@BlockScaling444		Proc	Near32 SysCall Uses ebx esi edi
Else
ERIDecoder@@BlockScaling444		Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIDecoder
EndIf

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
	Else
		Mov	ebx, _this
	EndIf
	Assume	ebx:PERIDecoder

	Xor	ecx, ecx
	.Repeat
		Xor	edx, edx
		.Repeat
			Lea	eax, [ecx * 4 + edx]
			Push	ecx
			Push	edx
			;
			Mov	esi, [ebx].m_ptrBuffer4[eax * 4]
			Mov	edi, [ebx].m_ptrBuffer2[eax * 4]
			Mov	ecx, [ebx].m_nBlockArea
			.Repeat
				Mov	eax, DWord Ptr [esi]
				Mov	edx, DWord Ptr [esi + 4]
				Add	esi, 8
				Mov	DWord Ptr [edi], eax
				Mov	DWord Ptr [edi + 4], edx
				Add	edi, 8
				Sub	ecx, 2
			.Until	Zero?
			;
			Pop	edx
			Pop	ecx
			Inc	edx
		.Until	edx >= 4
		;
		Inc	ecx
	.Until	ecx >= [ebx].m_nChannelCount

	Assume	ebx:Nothing

	Ret

ERIDecoder@@BlockScaling444		EndP


;
;	4:2:2 データスケーリング
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
ERIDecoder@@BlockScaling422		Proc	Near32 SysCall Uses ebx esi edi
Else
ERIDecoder@@BlockScaling422		Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIDecoder
EndIf

	Local	index[5]:DWord

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
	Else
		Mov	ebx, _this
	EndIf
	Assume	ebx:PERIDecoder

	;
	;	輝度成分をコピー
	; --------------------------------------------------------------------
	Xor	edx, edx
	.Repeat
		Mov	esi, [ebx].m_ptrBuffer4[edx * 4]
		Mov	edi, [ebx].m_ptrBuffer2[edx * 4]
		Push	edx
		Mov	ecx, [ebx].m_nBlockArea
		.Repeat
			Mov	eax, Real4 Ptr [esi]
			Mov	edx, Real4 Ptr [esi + 4]
			Add	esi, 8
			Mov	Real4 Ptr [edi], eax
			Mov	Real4 Ptr [edi + 4], edx
			Add	edi, 8
			;
			Sub	ecx, 2
		.Until	Zero?
		Pop	edx
		;
		Inc	edx
	.Until	edx >= 4

	;
	;	色差信号を垂直方向に伸張
	; --------------------------------------------------------------------
	Xor	ecx, ecx
	.Repeat
		Mov	eax, ecx
		Mov	edx, ecx
		And	eax, 03H
		Shr	edx, 2
		Mov	index[4], eax
		Mov	index[0], edx
		Mov	index[8], ecx
		;
		Lea	eax, [eax + edx * 2]
		Mov	esi, [ebx].m_ptrBuffer4[16 + eax * 4]
		;
		Xor	ecx, ecx
		.Repeat
			Mov	index[12], ecx
			;
			Mov	eax, index[0]
			Mov	edx, index[4]
			Shl	eax, 4
			Lea	edx, [edx * 2 + ecx]
			Lea	eax, [eax + edx * 4 + 16]
			Mov	edi, [ebx].m_ptrBuffer2[eax]
			;
			Mov	ecx, [ebx].m_nBlockSize
			Shr	ecx, 1
			Mov	edx, [ebx].m_nBlockSize
			;
			.Repeat
				Mov	index[16], ecx
				;
				Mov	ecx, edx
				.Repeat
					Mov	eax, Real4 Ptr [esi]
					Add	esi, (SizeOf Real4)
					Mov	Real4 Ptr [edi], eax
					Mov	Real4 Ptr [edi + edx * 4], eax
					Add	edi, (SizeOf Real4)
					;
					Dec	ecx
				.Until	Zero?
				;
				Mov	ecx, index[16]
				Lea	edi, [edi + edx * 4]
				;
				Dec	ecx
			.Until	Zero?
			;
			Mov	ecx, index[12]
			Inc	ecx
		.Until	ecx >= 2
		;
		Mov	ecx, index[8]
		Inc	ecx
	.Until	ecx >= 4

	;
	;	αチャネルをコピー
	; --------------------------------------------------------------------
	.If	[ebx].m_nChannelCount == 4
		Xor	edx, edx
		.Repeat
			Mov	esi, [ebx].m_ptrBuffer4[8*4 + edx * 4]
			Mov	edi, [ebx].m_ptrBuffer2[3*16 + edx * 4]
			Push	edx
			Mov	ecx, [ebx].m_nBlockArea
			.Repeat
				Mov	eax, Real4 Ptr [esi]
				Mov	edx, Real4 Ptr [esi + 4]
				Add	esi, 8
				Mov	Real4 Ptr [edi], eax
				Mov	Real4 Ptr [edi + 4], edx
				Add	edi, 8
				;
				Sub	ecx, 2
			.Until	Zero?
			Pop	edx
			;
			Inc	edx
		.Until	edx >= 4
	.EndIf

	Assume	ebx:Nothing

	Ret

ERIDecoder@@BlockScaling422		EndP


;
;	4:1:1 データスケーリング
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
ERIDecoder@@BlockScaling411		Proc	Near32 SysCall Uses ebx esi edi
Else
ERIDecoder@@BlockScaling411		Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIDecoder
EndIf

	Local	dwOffset[4]:DWord
	Local	index[3]:DWord

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
	Else
		Mov	ebx, _this
	EndIf
	Assume	ebx:PERIDecoder

	;
	;	輝度成分をコピー
	; --------------------------------------------------------------------
	Xor	edx, edx
	.Repeat
		Mov	esi, [ebx].m_ptrBuffer4[edx * 4]
		Mov	edi, [ebx].m_ptrBuffer2[edx * 4]
		Push	edx
		Mov	ecx, [ebx].m_nBlockArea
		.If	ERI_EnabledProcessorType & ERI_USE_XMM_P3
			prefetchnta	[esi]
			.Repeat
				prefetchnta	[esi + 32]
				movups	xmm0, [esi]
				movups	xmm1, [esi + 16]
				Add	esi, 32
				movups	[edi], xmm0
				movups	[edi + 16], xmm1
				Add	edi, 32
				;
				Sub	ecx, 8
			.Until	Zero?
		.Else
			.Repeat
				Mov	eax, Real4 Ptr [esi]
				Mov	edx, Real4 Ptr [esi + 4]
				Add	esi, 8
				Mov	Real4 Ptr [edi], eax
				Mov	Real4 Ptr [edi + 4], edx
				Add	edi, 8
				;
				Sub	ecx, 2
			.Until	Zero?
		.EndIf
		Pop	edx
		;
		Inc	edx
	.Until	edx >= 4

	;
	;	色差信号を垂直水平方向に伸張
	; --------------------------------------------------------------------
	Mov	dwOffset[0], 0
	Mov	eax, [ebx].m_nBlockSize
	Mov	edx, [ebx].m_nBlockArea
	Shr	eax, 1
	Shr	edx, 1
	Mov	dwOffset[4], eax
	Mov	dwOffset[8], edx
	Add	eax, edx
	Mov	dwOffset[12], eax
	;
	Xor	ecx, ecx
	.Repeat
		Mov	index[0], ecx
		;
		Xor	ecx, ecx
		.Repeat
			Mov	edx, index[0]
			Mov	index[4], ecx
			;
			Mov	eax, dwOffset[ecx * 4]
			Mov	esi, [ebx].m_ptrBuffer4[4*4 + edx * 4]
			Lea	edx, [edx * 4 + ecx + 4]
			Lea	esi, [esi + eax * 4]
			Mov	edi, [ebx].m_ptrBuffer2[edx * 4]
			;
	.If	(edx == 8) && !(edi & 0FH) && \
			(ERI_EnabledProcessorType & ERI_USE_XMM_P3)
		Mov	ecx, [ebx].m_nBlockSize
		Shr	ecx, 1
		Mov	edx, [ebx].m_nBlockSize
		movups		xmm0, [esi]
		movups		xmm1, [esi + 8 * 4 * 1]
		movups		xmm2, [esi + 8 * 4 * 2]
		movaps		xmm4, xmm0
		movups		xmm3, [esi + 8 * 4 * 3]
		unpcklps	xmm0, xmm0
		movaps		xmm5, xmm1
		unpcklps	xmm1, xmm1
		movaps		xmm6, xmm2
		unpcklps	xmm2, xmm2
		movaps		xmm7, xmm3
		unpcklps	xmm3, xmm3
		unpckhps	xmm4, xmm4
		unpckhps	xmm5, xmm5
		unpckhps	xmm6, xmm6
		unpckhps	xmm7, xmm7
		movups		[edi]            , xmm0
		movups		[edi + 16]            , xmm4
		movups		[edi + 8 * 4 * 1], xmm0
		movups		[edi + 8 * 4 * 1 + 16], xmm4
		movups		[edi + 8 * 4 * 2], xmm1
		movups		[edi + 8 * 4 * 2 + 16], xmm5
		movups		[edi + 8 * 4 * 3], xmm1
		movups		[edi + 8 * 4 * 3 + 16], xmm5
		movups		[edi + 8 * 4 * 4], xmm2
		movups		[edi + 8 * 4 * 4 + 16], xmm6
		movups		[edi + 8 * 4 * 5], xmm2
		movups		[edi + 8 * 4 * 5 + 16], xmm6
		movups		[edi + 8 * 4 * 6], xmm3
		movups		[edi + 8 * 4 * 6 + 16], xmm7
		movups		[edi + 8 * 4 * 7], xmm3
		movups		[edi + 8 * 4 * 7 + 16], xmm7
	.Else
		Mov	ecx, [ebx].m_nBlockSize
		Shr	ecx, 1
		Mov	edx, [ebx].m_nBlockSize
		;
		.Repeat
			Mov	index[8], ecx
			;
			Mov	ecx, edx
			.Repeat
				Mov	eax, Real4 Ptr [esi]
				Add	esi, (SizeOf Real4)
				Mov	Real4 Ptr [edi], eax
				Mov	Real4 Ptr [edi + edx * 4], eax
				Mov	Real4 Ptr [edi + 4], eax
				Mov	Real4 Ptr [edi + edx * 4 + 4], eax
				Add	edi, (SizeOf Real4) * 2
				;
				Sub	ecx, 2
			.Until	Zero?
			;
			Mov	ecx, index[8]
			Lea	esi, [esi + edx * 2]
			Lea	edi, [edi + edx * 4]
			;
			Dec	ecx
		.Until	Zero?
	.EndIf
			;
			Mov	ecx, index[4]
			Inc	ecx
		.Until	ecx >= 4
		;
		Mov	ecx, index[0]
		Inc	ecx
	.Until	ecx >= 2

	;
	;	αチャネルをコピー
	; --------------------------------------------------------------------
	.If	[ebx].m_nChannelCount == 4
		Xor	edx, edx
		.Repeat
			Mov	esi, [ebx].m_ptrBuffer4[6*4 + edx * 4]
			Mov	edi, [ebx].m_ptrBuffer2[3*16 + edx * 4]
			Push	edx
			Mov	ecx, [ebx].m_nBlockArea
			.If	ERI_EnabledProcessorType & ERI_USE_XMM_P3
				prefetchnta	[esi]
				.Repeat
					prefetchnta	[esi + 32]
					movups	xmm0, [esi]
					movups	xmm1, [esi + 16]
					Add	esi, 32
					movups	[edi], xmm0
					movups	[edi + 16], xmm1
					Add	edi, 32
					;
					Sub	ecx, 8
				.Until	Zero?
			.Else
				.Repeat
					Mov	eax, Real4 Ptr [esi]
					Mov	edx, Real4 Ptr [esi + 4]
					Add	esi, 8
					Mov	Real4 Ptr [edi], eax
					Mov	Real4 Ptr [edi + 4], edx
					Add	edi, 8
					;
					Sub	ecx, 2
				.Until	Zero?
			.EndIf
			Pop	edx
			;
			Inc	edx
		.Until	edx >= 4
	.EndIf

	Assume	ebx:Nothing

	Ret

ERIDecoder@@BlockScaling411		EndP


CodeSeg	EndS

	End
