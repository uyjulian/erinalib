
; ****************************************************************************
;                        E R I N A - L i b r a r y
;                                                      最終更新 2001/11/04
; ----------------------------------------------------------------------------
;         Copyright (C) 2000-2001 Leshade Entis. All rights reserved.
; ****************************************************************************


	.586
	.XMM
	.Model	Flat

	Include	experi.inc
	Include	erimatrix.inc


; ----------------------------------------------------------------------------
;                            データセグメント
; ----------------------------------------------------------------------------

DataSeg	Segment	Para Flat 'DATA'

;
;	定数テーブル
; ----------------------------------------------------------------------------

Align	10H
ERI_r1by8	Real8	0.125
ERI_rQuarter	Real8	0.25
ERI_rHalf	Real8	0.5
ERI_r2		Real8	2.0
ERI_r4		Real8	4.0
ERI_rCosPI4	Real8	?				; = cos( π/4 )
ERI_r2CosPI4	Real8	?				; = 2 * cos( π/4 )

;
; 行列係数配列 : k(n,i) = cos( (2*i+1) / (4*n) )
;
Align	10H
ERI_DCTofK2	Real4	2 Dup( ? )	; = cos( (2*i+1) / 8 )
Align	10H
ERI_DCTofK4	Real4	4 Dup( ? )	; = cos( (2*i+1) / 16 )
ERI_DCTofK8	Real4	8 Dup( ? )	; = cos( (2*i+1) / 32 )
ERI_DCTofK16	Real4	16 Dup( ? )	; = cos( (2*i+1) / 64 )
ERI_DCTofK32	Real4	32 Dup( ? )	; = cos( (2*i+1) / 128 )
ERI_DCTofK64	Real4	64 Dup( ? )	; = cos( (2*i+1) / 256 )
ERI_DCTofK128	Real4	128 Dup( ? )	; = cos( (2*i+1) / 512 )
ERI_DCTofK256	Real4	256 Dup( ? )	; = cos( (2*i+1) / 1024 )
ERI_DCTofK512	Real4	512 Dup( ? )	; = cos( (2*i+1) / 2048 )
ERI_DCTofK1024	Real4	1024 Dup( ? )	; = cos( (2*i+1) / 4096 )
ERI_DCTofK2048	Real4	2048 Dup( ? )	; = cos( (2*i+1) / 8192 )

;
; 行列係数配列へのテーブル
;
Align	10H
ERI_pMatrixDCTofK	Label	DWord
		DWord	0
		DWord	Offset ERI_DCTofK2
		DWord	Offset ERI_DCTofK4
		DWord	Offset ERI_DCTofK8
		DWord	Offset ERI_DCTofK16
		DWord	Offset ERI_DCTofK32
		DWord	Offset ERI_DCTofK64
		DWord	Offset ERI_DCTofK128
		DWord	Offset ERI_DCTofK256
		DWord	Offset ERI_DCTofK512
		DWord	Offset ERI_DCTofK1024
		DWord	Offset ERI_DCTofK2048

;
; XMM 用 DCT 変換係数テーブル
;
Align	10H
ERI_MatrixDCT4	Label	Real4
		Real4	16 Dup( ? )

ERI_MatrixIDCT4	Label	Real4
		Real4	16 Dup( ? )


DataSeg	EndS



; ----------------------------------------------------------------------------
;                             コードセグメント
; ----------------------------------------------------------------------------

CodeSeg	Segment	Para ReadOnly Flat 'CODE'

;
;	行列テーブルの初期化
; ----------------------------------------------------------------------------
Align	10H
eriInitializeMatrixDCT	Proc	Near32 C Uses ebx edi esi

	Local	n:SDWord
	Local	dr:Real8, ir:Real8
	Local	k:Real8

	;
	; 特殊条件の定数を準備
	;
	fldpi
	fmul	ERI_rQuarter
	fcos
	fst	ERI_rCosPI4
	;
	fadd	st, st(0)
	fstp	ERI_r2CosPI4

	;
	; 行列係数配列初期化
	;
	Mov	ecx, 1
	.While	ecx < MAX_DCT_DEGREE
		;
		Mov	eax, 1
		Shl	eax, cl
		Mov	n, eax
		Mov	edi, ERI_pMatrixDCTofK[ecx * 4]
		;
		fldpi
		fild	n
		fmul	ERI_r4
		fdivp	st(1), st
		fst	ir
		fadd	st, st(0)
		fstp	dr
		;
		Mov	eax, n
		.Repeat
			fld	ir
			fld	st(0)
			fcos
			fstp	Real4 Ptr [edi]
			fadd	dr
			fstp	ir
			Add	edi, (SizeOf Real4)
			Dec	eax
		.Until	Zero?
		;
		Inc	ecx
		;
	.EndW
	;
	; XMM 用 DCT 行列初期化
	;
	Lea	edi, ERI_MatrixDCT4
	Xor	edx, edx
	.Repeat
		Lea	eax, [edx * 2 + 1]
		Mov	n, eax
		fild	n
		fldpi
		fmulp	st(1), st
		fmul	ERI_r1by8
		fstp	k		; k = (edx * 2 + 1) * PI / (2 * 4)
		;
		Xor	ecx, ecx
		.Repeat
			Mov	n, ecx
			fild	n
			fmul	k
			fcos
			.If	ecx == 0
				fmul	ERI_rHalf
			.EndIf
			fstp	Real4 Ptr [edi]
			Add	edi, (SizeOf Real4)
			;
			Inc	ecx
		.Until	ecx >= 4
		;
		Inc	edx
	.Until	edx >= 4
	;
	; XMM 用 IDCT 行列初期化
	;
	Lea	edi, ERI_MatrixIDCT4
	Xor	edx, edx
	.Repeat
		Mov	n, edx
		fild	n
		fldpi
		fmulp	st(1), st
		fmul	ERI_r1by8
		fstp	k		; k = edx * PI / (2 * 4)
		;
		Xor	ecx, ecx
		.Repeat
			Lea	eax, [ecx * 2 + 1]
			Mov	n, eax
			fild	n
			fmul	k
			fcos
			fstp	Real4 Ptr [edi]
			Add	edi, (SizeOf Real4)
			;
			Inc	ecx
		.Until	ecx >= 4
		;
		Inc	edx
	.Until	edx >= 4

	Ret

eriInitializeMatrixDCT	EndP

;
;	実数丸め関数
; ----------------------------------------------------------------------------
Align	10H
eriRoundR32ToInt	Proc	Near32 C , r:Real4

	Local	n:SDWord

	fld	r
	fistp	n
	Mov	eax, n
	Ret

eriRoundR32ToInt	EndP

Align	10H
eriRoundR64ToLInt	Proc	Near32 C , r:Real8

	Local	n:QWord

	fld	r
	fistp	n
	Mov	eax, DWord Ptr n[0]
	Mov	edx, DWord Ptr n[4]
	Ret

eriRoundR64ToLInt	EndP

Align	10H
eriRoundR32ToWordArray	Proc	Near32 C Uses ebx esi edi,
	ptrDst:Ptr SWord, nStep:DWord, ptrSrc:Ptr Real4, nCount:DWord

	Local	nValue:SDWord

	Mov	ecx, nCount
	Mov	edx, nStep
	Mov	edi, ptrDst
	Mov	esi, ptrSrc
	Shl	edx, 1
	;
	Or	ecx, ecx
	.While	!Zero?
		fld	Real4 Ptr [esi]
		Add	esi, (SizeOf Real4)
		fistp	nValue
		Mov	eax, nValue
		.If	(SDWord Ptr eax) < -8000H
			Mov	eax, -8000H
		.ElseIf	(SDWord Ptr eax) > 7FFFH
			Mov	eax, 7FFFH
		.EndIf
		Mov	SWord Ptr [edi], ax
		Add	edi, edx
		Dec	ecx
	.EndW
	;
	Ret

eriRoundR32ToWordArray	EndP


;
;	スカラ乗算
; ----------------------------------------------------------------------------
Align	10H
eriScalarMultiply	Proc	Near32 C Uses ebx esi edi,
		ptrDst:Ptr Real4,
		rScalar:Real4,
		nCount:DWord

	Local	rScalarXMM[4]:Real4

	Mov	ecx, nCount
	Mov	esi, ptrDst
	;
	.If	ERI_EnabledProcessorType & ERI_USE_XMM_P3

		Mov	eax, rScalar
		Mov	rScalarXMM[0], eax
		Mov	rScalarXMM[4], eax
		Mov	rScalarXMM[8], eax
		Mov	rScalarXMM[12], eax
		;
		movups	xmm7, rScalarXMM
		;
		.While	ecx >= 8
			movups	xmm0, [esi]
			movups	xmm1, [esi + 16]
			mulps	xmm0, xmm7
			mulps	xmm1, xmm7
			movups	[esi],      xmm0
			movups	[esi + 16], xmm1
			Add	esi, 32
			Sub	ecx, 8
		.EndW

	.EndIf
	;
	fld	Real4 Ptr rScalar
	;
	.While	ecx >= 2
		fld	Real4 Ptr [esi]
		fld	Real4 Ptr [esi + 4]
		fxch	st(1)
		fmul	st, st(2)
		fxch	st(1)
		fmul	st, st(2)
		fxch
		fstp	Real4 Ptr [esi]
		fstp	Real4 Ptr [esi + 4]
		Add	esi, 8
		Sub	ecx, 2
	.EndW
	;
	.If	ecx != 0
		fld	Real4 Ptr [esi]
		fmul	st, st(1)
		fstp	Real4 Ptr [esi]
	.EndIf
	;
	fstp	st(0)

	Ret

eriScalarMultiply	EndP


;
;	DCT 演算関数生成マクロ
; ----------------------------------------------------------------------------

@FastDCTProc	Macro	xmm_flag:Req
	Local	DCTProcName, IDCTProcName

	If	xmm_flag
		DCTProcName	TextEqu	<eriFastDCT_XMM>
		IDCTProcName	TextEqu	<eriFastIDCT_XMM>
	Else
		DCTProcName	TextEqu	<eriFastDCT_FPU>
		IDCTProcName	TextEqu	<eriFastIDCT_FPU>
	EndIf

Align	10H
DCTProcName	Proc	Near32 C Uses ebx esi edi,
		ptrDst:Ptr Real4,
		nDstInterval:DWord,
		ptrSrc:Ptr Real4,
		ptrWorkBuf:Ptr Real4,
		nDegreeDCT:DWord

	Local	nDegreeNum:DWord, nHalfDegree:DWord

	Mov	eax, nDegreeDCT
	Mov	edi, ptrDst
	Mov	esi, ptrSrc
	Mov	ebx, ptrWorkBuf
	Mov	edx, nDstInterval
	;
	.If	eax > 5
		;
		;	汎用 DCT 変換
		; ------------------------------------------------------------
		;              | I   J |
		; 交差加減算 = |       |
		;              | I  -J |
		Mov	ecx, eax
		Mov	eax, 1
		Shl	eax, cl
		Mov	nDegreeNum, eax
		Shr	eax, 1
		Mov	nHalfDegree, eax
		;
		Xor	ecx, ecx
		Mov	eax, nDegreeNum
		Mov	edx, nHalfDegree
		Dec	eax
		Lea	edx, [ebx + edx * 4]
		.Repeat
			fld	Real4 Ptr [esi + eax * 4]
			fld	Real4 Ptr [esi + ecx * 4]
			fld	st(1)
			fadd	st, st(1)
			fxch	st(2)
			fsubp	st(1), st
			fxch	st(1)
			fstp	Real4 Ptr [ebx + ecx * 4]
			fstp	Real4 Ptr [edx + ecx * 4]
			Dec	eax
			Inc	ecx
		.Until	ecx >= nHalfDegree
		;
		; 前半　DCT ： A * DCT
		;
		Mov	ecx, nDegreeDCT
		Mov	edx, nDstInterval
		Dec	ecx
		Shl	edx, 1
		Invoke	DCTProcName , edi, edx, ebx, esi, ecx
		Mov	esi, ebx
		;
		; 後半 DCT-IV ： R * 2 * A * DCT * K
		;
		Mov	eax, nDegreeDCT
		Mov	ecx, nHalfDegree
		Mov	edx, nDstInterval
		Mov	eax, ERI_pMatrixDCTofK[eax * 4 - 4]
		Lea	esi, [esi + ecx * (SizeOf Real4)]
		Add	edi, edx
		Mov	edx, nHalfDegree
		;
		If	xmm_flag
			Lea	edx, [edx * (SizeOf Real4)]
			Xor	ecx, ecx
			.Repeat
				movups	xmm0, [esi + ecx]
				movups	xmm1, [esi + ecx + 16]
				mulps	xmm0, [eax]
				mulps	xmm1, [eax + 16]
				movups	[esi + ecx],      xmm0
				movups	[esi + ecx + 16], xmm1
				Add	ecx, (SizeOf Real4) * 8
				Add	eax, (SizeOf Real4) * 8
			.Until	ecx >= edx
		Else
			Xor	ecx, ecx
			.Repeat
				fld	Real4 Ptr [esi + ecx * 4]
				fld	Real4 Ptr [esi + ecx * 4 + 4]
				fxch	st(1)
				fmul	Real4 Ptr [eax]
				fxch	st(1)
				fmul	Real4 Ptr [eax + 4]
				fxch	st(1)
				Add	eax, (SizeOf Real4) * 2
				fstp	Real4 Ptr [esi + ecx * 4]
				fstp	Real4 Ptr [esi + ecx * 4 + 4]
				Add	ecx, 2
			.Until	ecx >= edx
		EndIf
		;
		Mov	ecx, nDegreeDCT
		Mov	edx, nDstInterval
		Dec	ecx
		Shl	edx, 1
		Invoke	DCTProcName , edi, edx, esi, ebx, ecx
		;
		Mov	edx, nDstInterval
		Mov	ecx, nHalfDegree
		Shl	edx, 1
		Dec	ecx
		;
		fld	Real4 Ptr [edi]
		fadd	st(0), st
		fst	Real4 Ptr [edi]
		Add	edi, edx
		;
		.Repeat
			fld	Real4 Ptr [edi]
			fadd	st(0), st
			fsubrp	st(1), st
			fst	Real4 Ptr [edi]
			Add	edi, edx
			Dec	ecx
		.Until	Zero?
		;
		fstp	st(0)
		;
		Mov	eax, 1
		Ret

	.ElseIf	eax == 3
		@FastDCT	3, xmm_flag
		Mov	eax, 1
		Ret

	.ElseIf	eax == 4
		@FastDCT	4, xmm_flag
		Mov	eax, 1
		Ret

	.ElseIf	eax == 5
		@FastDCT	5, xmm_flag
		Mov	eax, 1
		Ret

	.ElseIf	eax == 2
		@FastDCT	2, xmm_flag
		Mov	eax, 1
		Ret

	.Else
		Xor	eax, eax
		Ret

	.EndIf

DCTProcName	EndP

Align	10H
IDCTProcName	Proc	Near32 C Uses ebx esi edi,
		ptrDst:Ptr Real4,
		ptrSrc:Ptr Real4,
		nSrcInterval:DWord,
		ptrWorkBuf:Ptr Real4,
		nDegreeDCT:DWord

	Local	nDegreeNum:DWord, nHalfDegree:DWord

	Mov	eax, nDegreeDCT
	Mov	edi, ptrDst
	Mov	esi, ptrSrc
	Mov	ebx, ptrWorkBuf
	Mov	edx, nSrcInterval
	;
	.If	eax > 5
		;
		;	汎用 IDCT 変換
		; ------------------------------------------------------------
		;
		; 偶数行 ： IDCT
		;
		Mov	ecx, eax
		Mov	eax, 1
		Shl	eax, cl
		Mov	nDegreeNum, eax
		Shr	eax, 1
		Mov	nHalfDegree, eax
		;
		Dec	ecx
		Shl	edx, 1
		Invoke	IDCTProcName , edi, esi, edx, ebx, ecx
		;
		; 奇数行 ： R * 2 * A * DCT * K
		;
		Mov	ecx, nDegreeDCT
		Mov	edx, nSrcInterval
		Mov	eax, ERI_pMatrixDCTofK[ecx * 4 - 4]
		Mov	ecx, nHalfDegree
		Add	esi, edx
		Lea	edi, [edi + ecx * (SizeOf Real4)]
		;
		Shl	edx, 1
		Xor	ecx, ecx
		.Repeat
			fld	Real4 Ptr [esi]
			fld	Real4 Ptr [esi + edx]
			Lea	esi, [esi + edx * 2]
			fxch	st(1)
			fmul	Real4 Ptr [eax]
			fxch	st(1)
			fmul	Real4 Ptr [eax + 4]
			fxch	st(1)
			Add	eax, (SizeOf Real4) * 2
			fstp	Real4 Ptr [ebx + ecx * 4]
			fstp	Real4 Ptr [ebx + ecx * 4 + 4]
			Add	ecx, 2
		.Until	ecx >= nHalfDegree
		;
		Mov	edx, nDegreeDCT
		Mov	ecx, nHalfDegree
		Mov	esi, ebx
		Dec	edx
		Lea	ebx, [ebx + ecx * (SizeOf Real4)]
		Invoke	DCTProcName , edi, (SizeOf Real4), esi, ebx, edx
		;
		fld	Real4 Ptr [edi]
		fadd	st, st(0)
		fst	Real4 Ptr [edi]
		Mov	ecx, 1
		.Repeat
			fld	Real4 Ptr [edi + ecx * 4]
			fadd	st, st(0)
			fsubrp	st(1), st
			fst	Real4 Ptr [edi + ecx * 4]
			Inc	ecx
		.Until	ecx >= nHalfDegree
		;
		fstp	st(0)
		;              | I   I |
		; 交差加減算 = |       |
		;              | J  -J |
		Mov	eax, nHalfDegree
		Shl	eax, 2
		Sub	edi, eax
		Mov	ebx, nHalfDegree
		Mov	esi, nDegreeNum
		Mov	edx, ebx
		Xor	eax, eax
		Mov	ecx, -1
		Lea	ebx, [edi + ebx * 4]
		Lea	esi, [edi + esi * 4]
		Shr	edx, 1
		.Repeat
			fld	Real4 Ptr [ebx + eax * 4]
			fld	Real4 Ptr [edi + eax * 4]
			fld	st(1)
			fadd	st, st(1)
			fxch	st(2)
			fsubp	st(1), st
			;
			fld	Real4 Ptr [esi + ecx * 4]
			fld	Real4 Ptr [ebx + ecx * 4]
			fld	st(1)
			fadd	st, st(1)
			fxch	st(2)
			fsubp	st(1), st
			;
			fstp	Real4 Ptr [ebx + eax * 4]
			fstp	Real4 Ptr [ebx + ecx * 4]
			fstp	Real4 Ptr [esi + ecx * 4]
			fstp	Real4 Ptr [edi + eax * 4]
			;
			Inc	eax
			Dec	ecx
		.Until	eax >= edx
		;
		Xor	eax, eax
		Ret

	.ElseIf	eax == 3
		@FastIDCT	3, xmm_flag
		Mov	eax, 1
		Ret

	.ElseIf	eax == 4
		@FastIDCT	4, xmm_flag
		Mov	eax, 1
		Ret

	.ElseIf	eax == 5
		@FastIDCT	5, xmm_flag
		Mov	eax, 1
		Ret

	.ElseIf	eax == 2
		@FastIDCT	2, xmm_flag
		Mov	eax, 1
		Ret

	.Else
		Xor	eax, eax
		Ret

	.EndIf

IDCTProcName	EndP

		EndM


;
;	DCT 変換関数生成
; ----------------------------------------------------------------------------

@FastDCTProc	0		; FPU 互換関数

@FastDCTProc	1		; XMM 専用関数


;
;	DCT 変換関数
; ----------------------------------------------------------------------------
Align	10H
eriFastDCT		Proc	Near32 C ,
		ptrDst:Ptr Real4,
		nDstInterval:DWord,
		ptrSrc:Ptr Real4,
		ptrWorkBuf:Ptr Real4,
		nDegreeDCT:DWord

	.If	ERI_EnabledProcessorType & ERI_USE_XMM_P3

		Mov	edx, nDstInterval
		Invoke	eriFastDCT_XMM ,
				ptrDst, Addr [edx * (SizeOf Real4)],
				ptrSrc, ptrWorkBuf, nDegreeDCT
		Ret

	.Else

		Mov	edx, nDstInterval
		Invoke	eriFastDCT_FPU ,
				ptrDst, Addr [edx * (SizeOf Real4)],
				ptrSrc, ptrWorkBuf, nDegreeDCT
		Ret

	.EndIf

eriFastDCT		EndP


;
;	IDCT 変換関数
; ----------------------------------------------------------------------------
Align	10H
eriFastIDCT		Proc	Near32 C ,
		ptrDst:Ptr Real4,
		ptrSrc:Ptr Real4,
		nSrcInterval:DWord,
		ptrWorkBuf:Ptr Real4,
		nDegreeDCT:DWord

	.If	ERI_EnabledProcessorType & ERI_USE_XMM_P3

		Mov	edx, nSrcInterval
		Invoke	eriFastIDCT_XMM ,
				ptrDst, ptrSrc,
				Addr [edx * (SizeOf Real4)],
				ptrWorkBuf, nDegreeDCT
		Ret

	.Else

		Mov	edx, nSrcInterval
		Invoke	eriFastIDCT_FPU ,
				ptrDst, ptrSrc,
				Addr [edx * (SizeOf Real4)],
				ptrWorkBuf, nDegreeDCT
		Ret

	.EndIf

eriFastIDCT		EndP


;
;	高速２次元 DCT 変換
; ----------------------------------------------------------------------------
@eriSquareDCT	Macro	degree:Req, xmm_flag:Req

	Mov	edi, ptrWorkBuf1
	Mov	esi, ptrSrc
	Mov	ebx, ptrWorkBuf2
	Mov	edx, nStepBytes
	Mov	ecx, nDegreeNum
	.Repeat
		Push	ecx
		@FastDCT	degree, xmm_flag
		Pop	ecx
		Add	edi, (SizeOf Real4)
		Add	esi, nStepBytes
		Dec	ecx
	.Until	Zero?
	;
	Mov	edi, ptrDst
	Mov	esi, ptrWorkBuf1
	Mov	ecx, nDegreeNum
	.Repeat
		Push	ecx
		@FastDCT	degree, xmm_flag
		Pop	ecx
		Add	edi, (SizeOf Real4)
		Add	esi, nStepBytes
		Dec	ecx
	.Until	Zero?

		EndM

Align	10H
eriSquareDCT		Proc	Near32 C Uses ebx esi edi,
		ptrDst:Ptr Real4,
		ptrSrc:Ptr Real4,
		nDegreeDCT:DWord,
		ptrWorkBuf1:Ptr Real4,
		ptrWorkBuf2:Ptr Real4

	Local	nDegreeNum:DWord
	Local	nStepBytes:DWord

	Mov	eax, 1
	Mov	ecx, nDegreeDCT
	Shl	eax, cl
	Mov	nDegreeNum, eax
	Shl	eax, 2
	Mov	nStepBytes, eax
	;
	.If	ERI_EnabledProcessorType & ERI_USE_XMM_P3
		.If	ecx == 3
			@eriSquareDCT	3, 1
			Ret
		.ElseIf	ecx == 4
			@eriSquareDCT	4, 1
			Ret
		.ElseIf	ecx == 5
			@eriSquareDCT	5, 1
			Ret
		.EndIf
	.Else
		.If	ecx == 3
			@eriSquareDCT	3, 0
			Ret
		.ElseIf	ecx == 4
			@eriSquareDCT	4, 0
			Ret
		.ElseIf	ecx == 5
			@eriSquareDCT	5, 0
			Ret
		.EndIf
	.EndIf
	;
	Ret

eriSquareDCT		EndP


;
;	高速２次元 IDCT 変換
; ----------------------------------------------------------------------------
@eriSquareIDCT	Macro	degree:Req, xmm_flag:Req

	Mov	edi, ptrWorkBuf1
	Mov	esi, ptrSrc
	Mov	ebx, ptrWorkBuf2
	Mov	edx, nStepBytes
	Mov	ecx, nDegreeNum
	.Repeat
		Push	ecx
		@FastIDCT	degree, xmm_flag
		Pop	ecx
		Add	edi, nStepBytes
		Add	esi, (SizeOf Real4)
		Dec	ecx
	.Until	Zero?
	;
	Mov	edi, ptrDst
	Mov	esi, ptrWorkBuf1
	Mov	ecx, nDegreeNum
	.Repeat
		Push	ecx
		@FastIDCT	degree, xmm_flag
		Pop	ecx
		Add	edi, nStepBytes
		Add	esi, (SizeOf Real4)
		Dec	ecx
	.Until	Zero?

		EndM

Align	10H
eriSquareIDCT		Proc	Near32 C Uses ebx esi edi,
		ptrDst:Ptr Real4,
		ptrSrc:Ptr Real4,
		nDegreeDCT:DWord,
		ptrWorkBuf1:Ptr Real4,
		ptrWorkBuf2:Ptr Real4

	Local	nDegreeNum:DWord
	Local	nStepBytes:DWord

	Mov	eax, 1
	Mov	ecx, nDegreeDCT
	Shl	eax, cl
	Mov	nDegreeNum, eax
	Shl	eax, 2
	Mov	nStepBytes, eax
	;
	.If	ERI_EnabledProcessorType & ERI_USE_XMM_P3
		.If	ecx == 3
			@eriSquareIDCT	3, 1
			Ret
		.ElseIf	ecx == 4
			@eriSquareIDCT	4, 1
			Ret
		.ElseIf	ecx == 5
			@eriSquareIDCT	5, 1
			Ret
		.EndIf
	.Else
		.If	ecx == 3
			@eriSquareIDCT	3, 0
			Ret
		.ElseIf	ecx == 4
			@eriSquareIDCT	4, 0
			Ret
		.ElseIf	ecx == 5
			@eriSquareIDCT	5, 0
			Ret
		.EndIf
	.EndIf
	;
	Ret

eriSquareIDCT		EndP


CodeSeg	EndS

	End
