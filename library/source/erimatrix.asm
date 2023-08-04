	TITLE	I:\EntisGLS\eri-chan\experi\erimatrix.cpp
	.386P
include listing.inc
if @Version gt 510
.model FLAT
else
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
_BSS	SEGMENT DWORD USE32 PUBLIC 'BSS'
_BSS	ENDS
_TLS	SEGMENT DWORD USE32 PUBLIC 'TLS'
_TLS	ENDS
;	COMDAT ??8@YAHABU_GUID@@0@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
_DATA	SEGMENT
_ERI_PI$S31375 DQ 0400921fb5444261er		; 3.14159
_ERI_rHalf$S31376 DD 03f000000r			; 0.5
_DATA	ENDS
PUBLIC	_eriRevolve2x2
EXTRN	__fltused:NEAR
_TEXT	SEGMENT
_ptrBuf1$ = 8
_ptrBuf2$ = 12
_rSin$ = 16
_rCos$ = 20
_nStep$ = 24
_nCount$ = 28
_i$ = -4
_r1$31388 = -8
_r2$31389 = -12
_R1$31390 = -16
_R2$31391 = -20
_eriRevolve2x2 PROC NEAR
; File I:\EntisGLS\eri-chan\experi\erimatrix.cpp
; Line 39
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
; Line 41
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31385
$L31386:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31385:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _nCount$[ebp]
	jae	SHORT $L31387
; Line 43
	mov	edx, DWORD PTR _ptrBuf1$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _r1$31388[ebp], eax
; Line 44
	mov	ecx, DWORD PTR _ptrBuf2$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _r2$31389[ebp], edx
; Line 46
	fld	DWORD PTR _r1$31388[ebp]
	fmul	DWORD PTR _rCos$[ebp]
	fld	DWORD PTR _r2$31389[ebp]
	fmul	DWORD PTR _rSin$[ebp]
	fsubp	ST(1), ST(0)
	fstp	DWORD PTR _R1$31390[ebp]
; Line 47
	fld	DWORD PTR _r1$31388[ebp]
	fmul	DWORD PTR _rSin$[ebp]
	fld	DWORD PTR _r2$31389[ebp]
	fmul	DWORD PTR _rCos$[ebp]
	faddp	ST(1), ST(0)
	fstp	DWORD PTR _R2$31391[ebp]
; Line 49
	mov	eax, DWORD PTR _ptrBuf1$[ebp]
	mov	ecx, DWORD PTR _R1$31390[ebp]
	mov	DWORD PTR [eax], ecx
; Line 50
	mov	edx, DWORD PTR _ptrBuf2$[ebp]
	mov	eax, DWORD PTR _R2$31391[ebp]
	mov	DWORD PTR [edx], eax
; Line 52
	mov	ecx, DWORD PTR _nStep$[ebp]
	mov	edx, DWORD PTR _ptrBuf1$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _ptrBuf1$[ebp], eax
; Line 53
	mov	ecx, DWORD PTR _nStep$[ebp]
	mov	edx, DWORD PTR _ptrBuf2$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _ptrBuf2$[ebp], eax
; Line 54
	jmp	SHORT $L31386
$L31387:
; Line 55
	mov	esp, ebp
	pop	ebp
	ret	0
_eriRevolve2x2 ENDP
_TEXT	ENDS
PUBLIC	_eriCreateRevolveParameter
EXTRN	_atan2:NEAR
EXTRN	_cos:NEAR
EXTRN	_sin:NEAR
EXTRN	?eriAllocateMemory@@YAPAXK@Z:NEAR		; eriAllocateMemory
_TEXT	SEGMENT
_nDegreeDCT$ = 8
_i$ = -20
_nDegreeNum$ = -8
_lc$ = -16
_n$ = -36
_ptrRevolve$ = -4
_k$ = -28
_ptrNextRev$ = -12
_nStep$ = -32
_ws$31413 = -60
_a$31414 = -44
_j$31415 = -64
_r$31419 = -52
_eriCreateRevolveParameter PROC NEAR
; Line 64
	push	ebp
	mov	ebp, esp
	sub	esp, 108				; 0000006cH
; Line 66
	mov	eax, 1
	mov	ecx, DWORD PTR _nDegreeDCT$[ebp]
	shl	eax, cl
	mov	DWORD PTR _nDegreeNum$[ebp], eax
; Line 68
	mov	DWORD PTR _lc$[ebp], 1
	mov	eax, DWORD PTR _nDegreeNum$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	DWORD PTR _n$[ebp], eax
$L31399:
; Line 69
	cmp	DWORD PTR _n$[ebp], 8
	jl	SHORT $L31400
; Line 71
	mov	eax, DWORD PTR _n$[ebp]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	DWORD PTR _n$[ebp], eax
; Line 72
	mov	ecx, DWORD PTR _lc$[ebp]
	add	ecx, 1
	mov	DWORD PTR _lc$[ebp], ecx
; Line 73
	jmp	SHORT $L31399
$L31400:
; Line 75
	mov	edx, DWORD PTR _lc$[ebp]
	shl	edx, 3
	shl	edx, 3
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	DWORD PTR _ptrRevolve$[ebp], eax
; Line 77
	mov	eax, DWORD PTR _nDegreeNum$[ebp]
	shl	eax, 1
	mov	DWORD PTR -68+[ebp], eax
	fild	DWORD PTR -68+[ebp]
	fstp	QWORD PTR -76+[ebp]
	fld	QWORD PTR _ERI_PI$S31375
	fdiv	QWORD PTR -76+[ebp]
	fstp	QWORD PTR _k$[ebp]
; Line 78
	mov	ecx, DWORD PTR _ptrRevolve$[ebp]
	mov	DWORD PTR _ptrNextRev$[ebp], ecx
; Line 79
	mov	DWORD PTR _nStep$[ebp], 2
$L31407:
; Line 82
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31410
$L31411:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31410:
	cmp	DWORD PTR _i$[ebp], 7
	jge	$L31412
; Line 84
	mov	DWORD PTR _ws$31413[ebp], 0
	mov	DWORD PTR _ws$31413[ebp+4], 1072693248	; 3ff00000H
; Line 85
	mov	DWORD PTR _a$31414[ebp], 0
	mov	DWORD PTR _a$31414[ebp+4], 0
; Line 86
	mov	DWORD PTR _j$31415[ebp], 0
	jmp	SHORT $L31416
$L31417:
	mov	eax, DWORD PTR _j$31415[ebp]
	add	eax, 1
	mov	DWORD PTR _j$31415[ebp], eax
$L31416:
	mov	ecx, DWORD PTR _j$31415[ebp]
	cmp	ecx, DWORD PTR _i$[ebp]
	jge	SHORT $L31418
; Line 88
	fild	DWORD PTR _nStep$[ebp]
	fstp	QWORD PTR -84+[ebp]
	fld	QWORD PTR _a$31414[ebp]
	fadd	QWORD PTR -84+[ebp]
	fstp	QWORD PTR _a$31414[ebp]
; Line 90
	mov	edx, DWORD PTR _j$31415[ebp]
	mov	eax, DWORD PTR _ptrNextRev$[ebp]
	fld	DWORD PTR [eax+edx*8]
	fmul	QWORD PTR _ws$31413[ebp]
	fstp	QWORD PTR -92+[ebp]
	mov	ecx, DWORD PTR _j$31415[ebp]
	mov	edx, DWORD PTR _ptrNextRev$[ebp]
	fld	DWORD PTR [edx+ecx*8+4]
	fstp	QWORD PTR -100+[ebp]
	fld	QWORD PTR _a$31414[ebp]
	fmul	QWORD PTR _k$[ebp]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_cos
	add	esp, 8
	fmul	QWORD PTR -100+[ebp]
	fadd	QWORD PTR -92+[ebp]
	fstp	QWORD PTR _ws$31413[ebp]
; Line 91
	jmp	SHORT $L31417
$L31418:
; Line 92
	fild	DWORD PTR _nStep$[ebp]
	fstp	QWORD PTR -108+[ebp]
	fld	QWORD PTR _a$31414[ebp]
	fadd	QWORD PTR -108+[ebp]
	fmul	QWORD PTR _k$[ebp]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_cos
	fstp	QWORD PTR [esp]
	mov	eax, DWORD PTR _ws$31413[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _ws$31413[ebp]
	push	ecx
	call	_atan2
	add	esp, 16					; 00000010H
	fstp	QWORD PTR _r$31419[ebp]
; Line 93
	mov	edx, DWORD PTR _r$31419[ebp+4]
	push	edx
	mov	eax, DWORD PTR _r$31419[ebp]
	push	eax
	call	_sin
	add	esp, 8
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _ptrNextRev$[ebp]
	fstp	DWORD PTR [edx+ecx*8]
; Line 94
	mov	eax, DWORD PTR _r$31419[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _r$31419[ebp]
	push	ecx
	call	_cos
	add	esp, 8
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrNextRev$[ebp]
	fstp	DWORD PTR [eax+edx*8+4]
; Line 95
	jmp	$L31411
$L31412:
; Line 96
	mov	ecx, DWORD PTR _ptrNextRev$[ebp]
	add	ecx, 56					; 00000038H
	mov	DWORD PTR _ptrNextRev$[ebp], ecx
; Line 97
	mov	edx, DWORD PTR _nStep$[ebp]
	shl	edx, 3
	mov	DWORD PTR _nStep$[ebp], edx
; Line 99
	mov	eax, DWORD PTR _nStep$[ebp]
	cmp	eax, DWORD PTR _nDegreeNum$[ebp]
	jl	$L31407
; Line 101
	mov	eax, DWORD PTR _ptrRevolve$[ebp]
; Line 102
	mov	esp, ebp
	pop	ebp
	ret	0
_eriCreateRevolveParameter ENDP
_TEXT	ENDS
PUBLIC	_eriFastPLOT
_TEXT	SEGMENT
_ptrSrc$ = 8
_nDegreeDCT$ = 12
_i$ = -16
_nDegreeNum$ = -8
_r1$ = -4
_r2$ = -12
_eriFastPLOT PROC NEAR
; Line 113
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
; Line 115
	mov	eax, 1
	mov	ecx, DWORD PTR _nDegreeDCT$[ebp]
	shl	eax, cl
	mov	DWORD PTR _nDegreeNum$[ebp], eax
; Line 120
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31429
$L31430:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 2
	mov	DWORD PTR _i$[ebp], ecx
$L31429:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nDegreeNum$[ebp]
	jge	SHORT $L31431
; Line 122
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrSrc$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _r1$[ebp], edx
; Line 123
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrSrc$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4+4]
	mov	DWORD PTR _r2$[ebp], edx
; Line 124
	fld	DWORD PTR _r1$[ebp]
	fadd	DWORD PTR _r2$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrSrc$[ebp]
	fstp	DWORD PTR [ecx+eax*4]
; Line 125
	fld	DWORD PTR _r1$[ebp]
	fsub	DWORD PTR _r2$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	fstp	DWORD PTR [eax+edx*4+4]
; Line 126
	jmp	SHORT $L31430
$L31431:
; Line 127
	mov	esp, ebp
	pop	ebp
	ret	0
_eriFastPLOT ENDP
_TEXT	ENDS
PUBLIC	_eriFastLOT
_TEXT	SEGMENT
_ptrDst$ = 8
_ptrSrc1$ = 12
_ptrSrc2$ = 16
_nDegreeDCT$ = 20
_i$ = -16
_nDegreeNum$ = -8
_r1$ = -4
_r2$ = -12
_eriFastLOT PROC NEAR
; Line 140
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
; Line 142
	mov	eax, 1
	mov	ecx, DWORD PTR _nDegreeDCT$[ebp]
	shl	eax, cl
	mov	DWORD PTR _nDegreeNum$[ebp], eax
; Line 147
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31441
$L31442:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 2
	mov	DWORD PTR _i$[ebp], ecx
$L31441:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nDegreeNum$[ebp]
	jae	SHORT $L31443
; Line 149
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrSrc2$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _r1$[ebp], edx
; Line 150
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrSrc1$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4+4]
	mov	DWORD PTR _r2$[ebp], edx
; Line 151
	fld	DWORD PTR _r1$[ebp]
	fadd	DWORD PTR _r2$[ebp]
	fmul	DWORD PTR _ERI_rHalf$S31376
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrDst$[ebp]
	fstp	DWORD PTR [ecx+eax*4]
; Line 152
	fld	DWORD PTR _r1$[ebp]
	fsub	DWORD PTR _r2$[ebp]
	fmul	DWORD PTR _ERI_rHalf$S31376
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrDst$[ebp]
	fstp	DWORD PTR [eax+edx*4+4]
; Line 153
	jmp	SHORT $L31442
$L31443:
; Line 154
	mov	esp, ebp
	pop	ebp
	ret	0
_eriFastLOT ENDP
_TEXT	ENDS
PUBLIC	_eriOddGivensMatrix
_TEXT	SEGMENT
_ptrDst$ = 8
_ptrRevolve$ = 12
_nDegreeDCT$ = 16
_i$ = -20
_j$ = -24
_k$ = -28
_nDegreeNum$ = -8
_r1$ = -4
_r2$ = -12
_nStep$ = -36
_lc$ = -16
_index$ = -32
_eriOddGivensMatrix PROC NEAR
; Line 166
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
; Line 168
	mov	eax, 1
	mov	ecx, DWORD PTR _nDegreeDCT$[ebp]
	shl	eax, cl
	mov	DWORD PTR _nDegreeNum$[ebp], eax
; Line 174
	mov	DWORD PTR _index$[ebp], 1
; Line 175
	mov	DWORD PTR _nStep$[ebp], 2
; Line 176
	mov	ecx, DWORD PTR _nDegreeNum$[ebp]
	shr	ecx, 1
	shr	ecx, 3
	mov	DWORD PTR _lc$[ebp], ecx
$L31458:
; Line 179
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31460
$L31461:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31460:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _lc$[ebp]
	jae	$L31462
; Line 181
	mov	ecx, DWORD PTR _nStep$[ebp]
	shl	ecx, 3
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, ecx
	add	edx, DWORD PTR _index$[ebp]
	mov	DWORD PTR _k$[ebp], edx
; Line 182
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31463
$L31464:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L31463:
	cmp	DWORD PTR _j$[ebp], 7
	jae	SHORT $L31465
; Line 184
	mov	ecx, DWORD PTR _k$[ebp]
	mov	edx, DWORD PTR _ptrDst$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _r1$[ebp], eax
; Line 185
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, DWORD PTR _nStep$[ebp]
	mov	edx, DWORD PTR _ptrDst$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _r2$[ebp], eax
; Line 187
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _ptrRevolve$[ebp]
	fld	DWORD PTR _r1$[ebp]
	fmul	DWORD PTR [edx+ecx*8+4]
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _ptrRevolve$[ebp]
	fld	DWORD PTR _r2$[ebp]
	fmul	DWORD PTR [ecx+eax*8]
	fsubp	ST(1), ST(0)
	mov	edx, DWORD PTR _k$[ebp]
	mov	eax, DWORD PTR _ptrDst$[ebp]
	fstp	DWORD PTR [eax+edx*4]
; Line 189
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _ptrRevolve$[ebp]
	fld	DWORD PTR _r1$[ebp]
	fmul	DWORD PTR [edx+ecx*8]
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _ptrRevolve$[ebp]
	fld	DWORD PTR _r2$[ebp]
	fmul	DWORD PTR [ecx+eax*8+4]
	faddp	ST(1), ST(0)
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, DWORD PTR _nStep$[ebp]
	mov	eax, DWORD PTR _ptrDst$[ebp]
	fstp	DWORD PTR [eax+edx*4]
; Line 190
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, DWORD PTR _nStep$[ebp]
	mov	DWORD PTR _k$[ebp], ecx
; Line 191
	jmp	SHORT $L31464
$L31465:
; Line 192
	jmp	$L31461
$L31462:
; Line 193
	mov	edx, DWORD PTR _ptrRevolve$[ebp]
	add	edx, 56					; 00000038H
	mov	DWORD PTR _ptrRevolve$[ebp], edx
; Line 194
	mov	eax, DWORD PTR _nStep$[ebp]
	imul	eax, 7
	mov	ecx, DWORD PTR _index$[ebp]
	add	ecx, eax
	mov	DWORD PTR _index$[ebp], ecx
; Line 195
	mov	edx, DWORD PTR _nStep$[ebp]
	shl	edx, 3
	mov	DWORD PTR _nStep$[ebp], edx
; Line 196
	cmp	DWORD PTR _lc$[ebp], 8
	ja	SHORT $L31466
; Line 197
	jmp	SHORT $L31459
$L31466:
; Line 198
	mov	eax, DWORD PTR _lc$[ebp]
	shr	eax, 3
	mov	DWORD PTR _lc$[ebp], eax
; Line 199
	jmp	$L31458
$L31459:
; Line 200
	mov	ecx, DWORD PTR _index$[ebp]
	mov	DWORD PTR _k$[ebp], ecx
; Line 201
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31467
$L31468:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L31467:
	mov	eax, DWORD PTR _lc$[ebp]
	sub	eax, 1
	cmp	DWORD PTR _j$[ebp], eax
	jae	SHORT $L31469
; Line 203
	mov	ecx, DWORD PTR _k$[ebp]
	mov	edx, DWORD PTR _ptrDst$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _r1$[ebp], eax
; Line 204
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, DWORD PTR _nStep$[ebp]
	mov	edx, DWORD PTR _ptrDst$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _r2$[ebp], eax
; Line 206
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _ptrRevolve$[ebp]
	fld	DWORD PTR _r1$[ebp]
	fmul	DWORD PTR [edx+ecx*8+4]
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _ptrRevolve$[ebp]
	fld	DWORD PTR _r2$[ebp]
	fmul	DWORD PTR [ecx+eax*8]
	fsubp	ST(1), ST(0)
	mov	edx, DWORD PTR _k$[ebp]
	mov	eax, DWORD PTR _ptrDst$[ebp]
	fstp	DWORD PTR [eax+edx*4]
; Line 208
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _ptrRevolve$[ebp]
	fld	DWORD PTR _r1$[ebp]
	fmul	DWORD PTR [edx+ecx*8]
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _ptrRevolve$[ebp]
	fld	DWORD PTR _r2$[ebp]
	fmul	DWORD PTR [ecx+eax*8+4]
	faddp	ST(1), ST(0)
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, DWORD PTR _nStep$[ebp]
	mov	eax, DWORD PTR _ptrDst$[ebp]
	fstp	DWORD PTR [eax+edx*4]
; Line 209
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, DWORD PTR _nStep$[ebp]
	mov	DWORD PTR _k$[ebp], ecx
; Line 210
	jmp	$L31468
$L31469:
; Line 211
	mov	esp, ebp
	pop	ebp
	ret	0
_eriOddGivensMatrix ENDP
_TEXT	ENDS
PUBLIC	_eriOddGivensInverseMatrix
_TEXT	SEGMENT
_ptrSrc$ = 8
_ptrRevolve$ = 12
_nDegreeDCT$ = 16
_i$ = -20
_j$ = -24
_k$ = -28
_nDegreeNum$ = -8
_r1$ = -4
_r2$ = -12
_nStep$ = -36
_lc$ = -16
_index$ = -32
_eriOddGivensInverseMatrix PROC NEAR
; Line 223
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
; Line 225
	mov	eax, 1
	mov	ecx, DWORD PTR _nDegreeDCT$[ebp]
	shl	eax, cl
	mov	DWORD PTR _nDegreeNum$[ebp], eax
; Line 231
	mov	DWORD PTR _index$[ebp], 1
; Line 232
	mov	DWORD PTR _nStep$[ebp], 2
; Line 233
	mov	eax, DWORD PTR _nDegreeNum$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	DWORD PTR _lc$[ebp], eax
$L31484:
; Line 236
	mov	ecx, DWORD PTR _ptrRevolve$[ebp]
	add	ecx, 56					; 00000038H
	mov	DWORD PTR _ptrRevolve$[ebp], ecx
; Line 237
	mov	edx, DWORD PTR _nStep$[ebp]
	imul	edx, 7
	mov	eax, DWORD PTR _index$[ebp]
	add	eax, edx
	mov	DWORD PTR _index$[ebp], eax
; Line 238
	mov	ecx, DWORD PTR _nStep$[ebp]
	shl	ecx, 3
	mov	DWORD PTR _nStep$[ebp], ecx
; Line 239
	cmp	DWORD PTR _lc$[ebp], 8
	jg	SHORT $L31486
; Line 240
	jmp	SHORT $L31485
$L31486:
; Line 241
	mov	eax, DWORD PTR _lc$[ebp]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	DWORD PTR _lc$[ebp], eax
; Line 242
	jmp	SHORT $L31484
$L31485:
; Line 243
	mov	edx, DWORD PTR _lc$[ebp]
	sub	edx, 2
	mov	eax, DWORD PTR _nStep$[ebp]
	imul	eax, edx
	mov	ecx, DWORD PTR _index$[ebp]
	add	ecx, eax
	mov	DWORD PTR _k$[ebp], ecx
; Line 244
	mov	edx, DWORD PTR _lc$[ebp]
	sub	edx, 2
	mov	DWORD PTR _j$[ebp], edx
	jmp	SHORT $L31487
$L31488:
	mov	eax, DWORD PTR _j$[ebp]
	sub	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L31487:
	cmp	DWORD PTR _j$[ebp], 0
	jl	SHORT $L31489
; Line 246
	mov	ecx, DWORD PTR _k$[ebp]
	mov	edx, DWORD PTR _ptrSrc$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _r1$[ebp], eax
; Line 247
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, DWORD PTR _nStep$[ebp]
	mov	edx, DWORD PTR _ptrSrc$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _r2$[ebp], eax
; Line 249
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _ptrRevolve$[ebp]
	fld	DWORD PTR _r1$[ebp]
	fmul	DWORD PTR [edx+ecx*8+4]
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _ptrRevolve$[ebp]
	fld	DWORD PTR _r2$[ebp]
	fmul	DWORD PTR [ecx+eax*8]
	faddp	ST(1), ST(0)
	mov	edx, DWORD PTR _k$[ebp]
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	fstp	DWORD PTR [eax+edx*4]
; Line 251
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _ptrRevolve$[ebp]
	fld	DWORD PTR _r2$[ebp]
	fmul	DWORD PTR [edx+ecx*8+4]
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _ptrRevolve$[ebp]
	fld	DWORD PTR _r1$[ebp]
	fmul	DWORD PTR [ecx+eax*8]
	fsubp	ST(1), ST(0)
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, DWORD PTR _nStep$[ebp]
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	fstp	DWORD PTR [eax+edx*4]
; Line 252
	mov	ecx, DWORD PTR _k$[ebp]
	sub	ecx, DWORD PTR _nStep$[ebp]
	mov	DWORD PTR _k$[ebp], ecx
; Line 253
	jmp	SHORT $L31488
$L31489:
$L31491:
; Line 256
	mov	eax, DWORD PTR _nDegreeNum$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	cmp	DWORD PTR _lc$[ebp], eax
	jle	SHORT $L31493
; Line 257
	jmp	$L31492
$L31493:
; Line 259
	mov	edx, DWORD PTR _ptrRevolve$[ebp]
	sub	edx, 56					; 00000038H
	mov	DWORD PTR _ptrRevolve$[ebp], edx
; Line 260
	mov	eax, DWORD PTR _nStep$[ebp]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	DWORD PTR _nStep$[ebp], eax
; Line 261
	mov	eax, DWORD PTR _nStep$[ebp]
	imul	eax, 7
	mov	ecx, DWORD PTR _index$[ebp]
	sub	ecx, eax
	mov	DWORD PTR _index$[ebp], ecx
; Line 263
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31494
$L31495:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31494:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _lc$[ebp]
	jge	$L31496
; Line 265
	mov	ecx, DWORD PTR _nStep$[ebp]
	shl	ecx, 3
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, ecx
	add	edx, DWORD PTR _index$[ebp]
	mov	eax, DWORD PTR _nStep$[ebp]
	imul	eax, 6
	add	edx, eax
	mov	DWORD PTR _k$[ebp], edx
; Line 266
	mov	DWORD PTR _j$[ebp], 6
	jmp	SHORT $L31497
$L31498:
	mov	ecx, DWORD PTR _j$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L31497:
	cmp	DWORD PTR _j$[ebp], 0
	jl	SHORT $L31499
; Line 268
	mov	edx, DWORD PTR _k$[ebp]
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	mov	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _r1$[ebp], ecx
; Line 269
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, DWORD PTR _nStep$[ebp]
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	mov	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _r2$[ebp], ecx
; Line 271
	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _ptrRevolve$[ebp]
	fld	DWORD PTR _r1$[ebp]
	fmul	DWORD PTR [eax+edx*8+4]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _ptrRevolve$[ebp]
	fld	DWORD PTR _r2$[ebp]
	fmul	DWORD PTR [edx+ecx*8]
	faddp	ST(1), ST(0)
	mov	eax, DWORD PTR _k$[ebp]
	mov	ecx, DWORD PTR _ptrSrc$[ebp]
	fstp	DWORD PTR [ecx+eax*4]
; Line 273
	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _ptrRevolve$[ebp]
	fld	DWORD PTR _r2$[ebp]
	fmul	DWORD PTR [eax+edx*8+4]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _ptrRevolve$[ebp]
	fld	DWORD PTR _r1$[ebp]
	fmul	DWORD PTR [edx+ecx*8]
	fsubp	ST(1), ST(0)
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, DWORD PTR _nStep$[ebp]
	mov	ecx, DWORD PTR _ptrSrc$[ebp]
	fstp	DWORD PTR [ecx+eax*4]
; Line 274
	mov	edx, DWORD PTR _k$[ebp]
	sub	edx, DWORD PTR _nStep$[ebp]
	mov	DWORD PTR _k$[ebp], edx
; Line 275
	jmp	SHORT $L31498
$L31499:
; Line 276
	jmp	$L31495
$L31496:
; Line 278
	mov	eax, DWORD PTR _lc$[ebp]
	shl	eax, 3
	mov	DWORD PTR _lc$[ebp], eax
; Line 279
	jmp	$L31491
$L31492:
; Line 280
	mov	esp, ebp
	pop	ebp
	ret	0
_eriOddGivensInverseMatrix ENDP
_TEXT	ENDS
PUBLIC	_eriFastIPLOT
_TEXT	SEGMENT
_ptrSrc$ = 8
_nDegreeDCT$ = 12
_i$ = -16
_nDegreeNum$ = -8
_r1$ = -4
_r2$ = -12
_eriFastIPLOT PROC NEAR
; Line 290
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
; Line 292
	mov	eax, 1
	mov	ecx, DWORD PTR _nDegreeDCT$[ebp]
	shl	eax, cl
	mov	DWORD PTR _nDegreeNum$[ebp], eax
; Line 297
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31507
$L31508:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 2
	mov	DWORD PTR _i$[ebp], ecx
$L31507:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nDegreeNum$[ebp]
	jge	SHORT $L31509
; Line 299
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrSrc$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _r1$[ebp], edx
; Line 300
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrSrc$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4+4]
	mov	DWORD PTR _r2$[ebp], edx
; Line 301
	fld	DWORD PTR _r1$[ebp]
	fadd	DWORD PTR _r2$[ebp]
	fmul	DWORD PTR _ERI_rHalf$S31376
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrSrc$[ebp]
	fstp	DWORD PTR [ecx+eax*4]
; Line 302
	fld	DWORD PTR _r1$[ebp]
	fsub	DWORD PTR _r2$[ebp]
	fmul	DWORD PTR _ERI_rHalf$S31376
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	fstp	DWORD PTR [eax+edx*4+4]
; Line 303
	jmp	SHORT $L31508
$L31509:
; Line 304
	mov	esp, ebp
	pop	ebp
	ret	0
_eriFastIPLOT ENDP
_TEXT	ENDS
PUBLIC	_eriFastILOT
_TEXT	SEGMENT
_ptrDst$ = 8
_ptrSrc1$ = 12
_ptrSrc2$ = 16
_nDegreeDCT$ = 20
_i$ = -16
_nDegreeNum$ = -8
_r1$ = -4
_r2$ = -12
_eriFastILOT PROC NEAR
; Line 317
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
; Line 319
	mov	eax, 1
	mov	ecx, DWORD PTR _nDegreeDCT$[ebp]
	shl	eax, cl
	mov	DWORD PTR _nDegreeNum$[ebp], eax
; Line 324
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31519
$L31520:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 2
	mov	DWORD PTR _i$[ebp], ecx
$L31519:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nDegreeNum$[ebp]
	jae	SHORT $L31521
; Line 326
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrSrc1$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _r1$[ebp], edx
; Line 327
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrSrc2$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4+4]
	mov	DWORD PTR _r2$[ebp], edx
; Line 328
	fld	DWORD PTR _r1$[ebp]
	fadd	DWORD PTR _r2$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrDst$[ebp]
	fstp	DWORD PTR [ecx+eax*4]
; Line 329
	fld	DWORD PTR _r1$[ebp]
	fsub	DWORD PTR _r2$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrDst$[ebp]
	fstp	DWORD PTR [eax+edx*4+4]
; Line 330
	jmp	SHORT $L31520
$L31521:
; Line 331
	mov	esp, ebp
	pop	ebp
	ret	0
_eriFastILOT ENDP
_TEXT	ENDS
END
