
; ****************************************************************************
;                        E R I N A - L i b r a r y
;                                                      �ŏI�X�V 2001/11/04
; ----------------------------------------------------------------------------
;         Copyright (C) 2000-2001 Leshade Entis. All rights reserved.
; ****************************************************************************



;
;	DCT�s�񉉎Z�p�萔
; ----------------------------------------------------------------------------

MIN_DCT_DEGREE	Equ	2
MAX_DCT_DEGREE	Equ	12


;
;	�����ۂߊ֐�
; ----------------------------------------------------------------------------

eriRoundR32ToInt	Proto	Near32 C , r:Real4
eriRoundR64ToLInt	Proto	Near32 C , r:Real8
eriRoundR32ToWordArray	Proto	Near32 C ,
	ptrDst:Ptr SWord, nStep:DWord, ptrSrc:Ptr Real4, nCount:DWord


;
;	��]�s��\����
; ----------------------------------------------------------------------------

SIN_COS	Struct

rSin	Real4	?
rCos	Real4	?

SIN_COS	EndS


;
;	DCT �s�񉉎Z�֐�
; ----------------------------------------------------------------------------

eriInitializeMatrixDCT	Proto	Near32 C

eriScalarMultiply	Proto	Near32 C ,
		ptrDst:Ptr Real4,
		rScalar:Real4,
		nCount:DWord

eriFastDCT_FPU		Proto	Near32 C ,
		ptrDst:Ptr Real4,
		nDstInterval:DWord,
		ptrSrc:Ptr Real4,
		ptrWorkBuf:Ptr Real4,
		nDegreeDCT:DWord

eriFastDCT_XMM		Proto	Near32 C ,
		ptrDst:Ptr Real4,
		nDstInterval:DWord,
		ptrSrc:Ptr Real4,
		ptrWorkBuf:Ptr Real4,
		nDegreeDCT:DWord

eriFastIDCT_FPU		Proto	Near32 C ,
		ptrDst:Ptr Real4,
		ptrSrc:Ptr Real4,
		nSrcInterval:DWord,
		ptrWorkBuf:Ptr Real4,
		nDegreeDCT:DWord

eriFastIDCT_XMM		Proto	Near32 C ,
		ptrDst:Ptr Real4,
		ptrSrc:Ptr Real4,
		nSrcInterval:DWord,
		ptrWorkBuf:Ptr Real4,
		nDegreeDCT:DWord

eriFastDCT		Proto	Near32 C ,
		ptrDst:Ptr Real4,
		nDstInterval:DWord,
		ptrSrc:Ptr Real4,
		ptrWorkBuf:Ptr Real4,
		nDegreeDCT:DWord

eriFastIDCT		Proto	Near32 C ,
		ptrDst:Ptr Real4,
		ptrSrc:Ptr Real4,
		nSrcInterval:DWord,
		ptrWorkBuf:Ptr Real4,
		nDegreeDCT:DWord

eriCreateRevolveParameter	Proto	Near32 C ,
		nDegreeDCT:DWord

eriSquareDCT		Proto	Near32 C ,
		ptrDst:Ptr Real4,
		ptrSrc:Ptr Real4,
		nDegreeDCT:DWord,
		ptrWorkBuf1:Ptr Real4,
		ptrWorkBuf2:Ptr Real4

eriSquareIDCT		Proto	Near32 C ,
		ptrDst:Ptr Real4,
		ptrSrc:Ptr Real4,
		nDegreeDCT:DWord,
		ptrWorkBuf1:Ptr Real4,
		ptrWorkBuf2:Ptr Real4


;
;	���� DCT �ϊ��}�N��
; ----------------------------------------------------------------------------
; �p�����[�^�G
;	ESI register	: ���̓f�[�^�ւ̃|�C���^
;	EDI register	: �o�̓o�b�t�@�ւ̃|�C���^
;	EBX register	: ���ԃo�b�t�@�ւ̃|�C���^
;	EDX register	: �o�͐�̃X�e�b�v���i�o�C�g�P�ʁj
;	degree		: DCT �����i���l�j
;	xmm_flag	: 0 �̎��AXMM ���W�X�^���g�p���Ȃ��i���l�j
; ���W�X�^�G
;	EBX, EDX, ESI, EDI, EBP, ESP ���W�X�^�̓��e�͕ۏ؂����
; ----------------------------------------------------------------------------

@FastDCT	Macro	degree:Req, xmm_flag:Req
	Local	degree_num, half_degree

	If	(degree Lt MIN_DCT_DEGREE) Or (degree Gt MAX_DCT_DEGREE)
		.Err
	EndIf
	;
	If	degree Eq MIN_DCT_DEGREE
		;
		;	4�� DCT �͓������
		; ------------------------------------------------------------
		If	xmm_flag
			;
			;	XMM ��p�R�[�h
			; ----------------------------------------------------
			Lea	ecx, [edx + edx * 2]
			;
			movss	xmm0, [esi]
			movss	xmm1, [esi + 4]
			movss	xmm2, [esi + 8]
			movss	xmm3, [esi + 12]
			;
			shufps	xmm0, xmm0, 0
			shufps	xmm1, xmm1, 0
			shufps	xmm2, xmm2, 0
			shufps	xmm3, xmm3, 0
			;
			mulps	xmm0, ERI_MatrixDCT4[0]
			mulps	xmm1, ERI_MatrixDCT4[16]
			mulps	xmm2, ERI_MatrixDCT4[32]
			mulps	xmm3, ERI_MatrixDCT4[48]
			;
			addps	xmm0, xmm1
			addps	xmm2, xmm3
			addps	xmm0, xmm2
			;
			movaps	xmm1, xmm0
			movaps	xmm2, xmm0
			movss	[edi], xmm0
			shufps	xmm0, xmm0, 00111001B
			shufps	xmm1, xmm1, 01001110B
			shufps	xmm2, xmm2, 10010011B
			movss	[edi + edx],     xmm0
			movss	[edi + edx * 2], xmm1
			movss	[edi + ecx],     xmm2

		Else
			;
			;	FPU �݊��R�[�h
			; ----------------------------------------------------
			Lea	ecx, [edx + edx * 2]
			;
			; ���������Z�i�O���j
			;
			fld	Real4 Ptr [esi]
			fadd	Real4 Ptr [esi + 12]
			fld	Real4 Ptr [esi + 4]
			fadd	Real4 Ptr [esi + 8]
			;
			; �O�� �F A2 * DCT2
			;
			fld	st(1)
			fadd	st, st(1)
			fmul	ERI_rHalf
			fstp	Real4 Ptr [edi]
			fsubp	st(1), st
			fmul	ERI_rCosPI4
			fstp	Real4 Ptr [edi + edx * 2]
			;
			; ���������Z�i�㔼�j
			;
			fld	Real4 Ptr [esi + 4]
			fsub	Real4 Ptr [esi + 8]
			fld	Real4 Ptr [esi]
			fsub	Real4 Ptr [esi + 12]
			;
			; �㔼 �F R2 * 2 * A2 * DCT2 * K2
			;
			fld	ERI_DCTofK2[0]
			fld	ERI_DCTofK2[4]
			fxch	st(1)
			fmulp	st(2), st
			fmulp	st(2), st
			;
			fld	st(1)
			fadd	st, st(1)
			fxch	st(2)
			fsubp	st(1), st
			fmul	ERI_r2CosPI4
			;
			fsub	st, st(1)
			;
			fstp	Real4 Ptr [edi + ecx]
			fstp	Real4 Ptr [edi + edx]
		EndIf

	Else
		;
		;	�ėp DCT �ϊ�
		; ------------------------------------------------------------
		;              | I   J |
		; ���������Z = |       |
		;              | I  -J |
		degree_num = 1 Shl degree
		half_degree = degree_num / 2
		Xor	ecx, ecx
		Mov	eax, degree_num - 1
		.Repeat
			fld	Real4 Ptr [esi + eax * 4]
			fld	Real4 Ptr [esi + ecx * 4]
			fld	st(1)
			fadd	st, st(1)
			fxch	st(2)
			fsubp	st(1), st
			fxch	st(1)
			fstp	Real4 Ptr [ebx + ecx * 4]
			fstp	Real4 Ptr [ebx + ecx * 4 + half_degree * 4]
			Dec	eax
			Inc	ecx
		.Until	ecx >= half_degree
		;
		; �O���@DCT �F A * DCT
		;
		Push	ebx
		Push	esi
		Push	edi
		Shl	edx, 1
		Xchg	ebx, esi
		@FastDCT	%(degree - 1), xmm_flag
		Mov	ebx, esi
		Shr	edx, 1
		;
		; �㔼 DCT-IV �F R * 2 * A * DCT * K
		;
		Mov	eax, ERI_pMatrixDCTofK[(degree - 1) * 4]
		Add	esi, (half_degree) * (SizeOf Real4)
		Add	edi, edx
		;
		If	xmm_flag
			If	degree Eq 3
				movups	xmm0, [esi]
				mulps	xmm0, [eax]
				movups	[esi], xmm0
			ElseIf	degree Eq 4
				movups	xmm0, [esi]
				movups	xmm1, [esi + 16]
				mulps	xmm0, [eax]
				mulps	xmm1, [eax + 16]
				movups	[esi],      xmm0
				movups	[esi + 16], xmm1
			Else
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
				.Until	ecx >= half_degree * (SizeOf Real4)
			EndIf
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
			.Until	ecx >= half_degree
		EndIf
		;
		Shl	edx, 1
		@FastDCT	%(degree - 1), xmm_flag
		;
		fld	Real4 Ptr [edi]
		fadd	st(0), st
		fst	Real4 Ptr [edi]
		Add	edi, edx
		;
		Mov	ecx, half_degree - 1
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
		Shr	edx, 1
		Pop	edi
		Pop	esi
		Pop	ebx

	EndIf

		EndM


;
;	���� IDCT �ϊ��}�N��
; ----------------------------------------------------------------------------
; �p�����[�^�G
;	ESI register	: ���̓f�[�^�ւ̃|�C���^
;	EDI register	: �o�̓o�b�t�@�ւ̃|�C���^
;	EBX register	: ���ԃo�b�t�@�ւ̃|�C���^
;	EDX register	: �\�[�X�̃X�e�b�v���i�o�C�g�P�ʁj
;	degree		: DCT �����i���l�j
;	xmm_flag	: 0 �̎��AXMM ���W�X�^���g�p���Ȃ��i���l�j
; ���W�X�^�G
;	EBX, EDX, ESI, EDI, EBP, ESP ���W�X�^�̓��e�͕ۏ؂����
; ----------------------------------------------------------------------------

@FastIDCT	Macro	degree:Req, xmm_flag:Req
	Local	degree_num, half_degree

	If	(degree Lt MIN_DCT_DEGREE) Or (degree Gt MAX_DCT_DEGREE)
		.Err
	EndIf
	;
	If	degree Eq MIN_DCT_DEGREE
		;
		;	4�� DCT �͓������
		; ------------------------------------------------------------
		If	xmm_flag
			;
			;	XMM ��p�R�[�h
			; ----------------------------------------------------
			Lea	ecx, [edx + edx * 2]
			;
			movss	xmm0, [esi]
			movss	xmm1, [esi + edx]
			movss	xmm2, [esi + edx * 2]
			movss	xmm3, [esi + ecx]
			;
			shufps	xmm0, xmm0, 0
			shufps	xmm1, xmm1, 0
			shufps	xmm2, xmm2, 0
			shufps	xmm3, xmm3, 0
			;
			mulps	xmm0, ERI_MatrixIDCT4[0]
			mulps	xmm1, ERI_MatrixIDCT4[16]
			mulps	xmm2, ERI_MatrixIDCT4[32]
			mulps	xmm3, ERI_MatrixIDCT4[48]
			;
			addps	xmm0, xmm1
			addps	xmm2, xmm3
			addps	xmm0, xmm2
			;
			movups	[edi], xmm0

		Else
			;
			;	FPU �݊��R�[�h
			; ----------------------------------------------------
			Lea	ecx, [edx + edx * 2]
			;
			; �����s �F IDCT2
			;
			fld	Real4 Ptr [esi + edx * 2]
			fmul	ERI_rCosPI4
			fld	Real4 Ptr [esi]
			;
			fld	st(1)
			fadd	st, st(1)
			fxch	st(2)
			fsubp	st(1), st
			;
			; ��s �F R * 2 * A * DCT * K
			;
			fld	Real4 Ptr [esi + ecx]
			fmul	ERI_DCTofK2[4]
			fld	Real4 Ptr [esi + edx]
			fmul	ERI_DCTofK2[0]
			;
			fld	st(1)
			fadd	st, st(1)
			fxch	st(2)
			fsubp	st(1), st
			fmul	ERI_r2CosPI4
			;
			fsub	st, st(1)
			;
			; ���������Z
			;
			fld	st(0)
			fadd	st, st(3)
			fstp	Real4 Ptr [edi + 4]
			fsubp	st(2), st
			;
			fld	st(0)
			fadd	st, st(3)
			fstp	Real4 Ptr [edi]
			fsubp	st(2), st
			;
			fstp	Real4 Ptr [edi + 8]
			fstp	Real4 Ptr [edi + 12]
		EndIf

	Else
		;
		;	�ėp IDCT �ϊ�
		; ------------------------------------------------------------
		;
		; �����s �F IDCT
		;
		degree_num = 1 Shl degree
		half_degree = degree_num / 2
		;
		Push	edx
		Shl	edx, 1
		@FastIDCT	%(degree - 1), xmm_flag
		;
		; ��s �F R * 2 * A * DCT * K
		;
		Push	esi
		Push	edi
		Shr	edx, 1
		Mov	eax, ERI_pMatrixDCTofK[(degree - 1) * 4]
		Add	esi, edx
		Add	edi, half_degree * (SizeOf Real4)
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
		.Until	ecx >= half_degree
		;
		Mov	esi, ebx
		Add	ebx, half_degree * (SizeOf Real4)
		Mov	edx, (SizeOf Real4)
		@FastDCT	%(degree - 1), xmm_flag
		Sub	ebx, half_degree * (SizeOf Real4)
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
		.Until	ecx >= half_degree
		;
		fstp	st(0)
		;              | I   I |
		; ���������Z = |       |
		;              | J  -J |
		Sub	edi, half_degree * (SizeOf Real4)
		Xor	eax, eax
		Mov	ecx, -1
		.Repeat
			fld	Real4 Ptr [edi + eax * 4 + (half_degree * 4)]
			fld	Real4 Ptr [edi + eax * 4]
			fld	st(1)
			fadd	st, st(1)
			fxch	st(2)
			fsubp	st(1), st
			;
			fld	Real4 Ptr [edi + ecx * 4 + (degree_num * 4)]
			fld	Real4 Ptr [edi + ecx * 4 + (half_degree * 4)]
			fld	st(1)
			fadd	st, st(1)
			fxch	st(2)
			fsubp	st(1), st
			;
			fstp	Real4 Ptr [edi + eax * 4 + (half_degree * 4)]
			fstp	Real4 Ptr [edi + ecx * 4 + (half_degree * 4)]
			fstp	Real4 Ptr [edi + ecx * 4 + (degree_num * 4)]
			fstp	Real4 Ptr [edi + eax * 4]
			;
			Inc	eax
			Dec	ecx
		.Until	eax >= (half_degree / 2)
		;
		Pop	edi
		Pop	esi
		Pop	edx

	EndIf

		EndM

