	TITLE	I:\EntisGLS\eri-chan\experi\cmperi.cpp
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
;	COMDAT ?Initialize@MTF_TABLE@RLHEncodeContext@@QAEXXZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ?Search@MTF_TABLE@RLHEncodeContext@@QAEHE@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_GRLHEncodeContext@@UAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_GERIEncoder@@UAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_GEFileEncodeContext@@UAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_7RLHEncodeContext@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
;	COMDAT ??_7EFileEncodeContext@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
;	COMDAT ??_7ERIEncoder@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	?m_pfnColorOperation@ERIEncoder@@1PAP81@AEXXZA	; ERIEncoder::m_pfnColorOperation
EXTRN	?ColorOperation0000@ERIEncoder@@IAEXXZ:NEAR	; ERIEncoder::ColorOperation0000
EXTRN	?ColorOperation0101@ERIEncoder@@IAEXXZ:NEAR	; ERIEncoder::ColorOperation0101
EXTRN	?ColorOperation0110@ERIEncoder@@IAEXXZ:NEAR	; ERIEncoder::ColorOperation0110
EXTRN	?ColorOperation0111@ERIEncoder@@IAEXXZ:NEAR	; ERIEncoder::ColorOperation0111
EXTRN	?ColorOperation1001@ERIEncoder@@IAEXXZ:NEAR	; ERIEncoder::ColorOperation1001
EXTRN	?ColorOperation1010@ERIEncoder@@IAEXXZ:NEAR	; ERIEncoder::ColorOperation1010
EXTRN	?ColorOperation1011@ERIEncoder@@IAEXXZ:NEAR	; ERIEncoder::ColorOperation1011
EXTRN	?ColorOperation1101@ERIEncoder@@IAEXXZ:NEAR	; ERIEncoder::ColorOperation1101
EXTRN	?ColorOperation1110@ERIEncoder@@IAEXXZ:NEAR	; ERIEncoder::ColorOperation1110
EXTRN	?ColorOperation1111@ERIEncoder@@IAEXXZ:NEAR	; ERIEncoder::ColorOperation1111
_DATA	SEGMENT
?m_pfnColorOperation@ERIEncoder@@1PAP81@AEXXZA DD FLAT:?ColorOperation0000@ERIEncoder@@IAEXXZ ; ERIEncoder::m_pfnColorOperation
	DD	FLAT:?ColorOperation0000@ERIEncoder@@IAEXXZ
	DD	FLAT:?ColorOperation0000@ERIEncoder@@IAEXXZ
	DD	FLAT:?ColorOperation0000@ERIEncoder@@IAEXXZ
	DD	FLAT:?ColorOperation0000@ERIEncoder@@IAEXXZ
	DD	FLAT:?ColorOperation0101@ERIEncoder@@IAEXXZ
	DD	FLAT:?ColorOperation0110@ERIEncoder@@IAEXXZ
	DD	FLAT:?ColorOperation0111@ERIEncoder@@IAEXXZ
	DD	FLAT:?ColorOperation0000@ERIEncoder@@IAEXXZ
	DD	FLAT:?ColorOperation1001@ERIEncoder@@IAEXXZ
	DD	FLAT:?ColorOperation1010@ERIEncoder@@IAEXXZ
	DD	FLAT:?ColorOperation1011@ERIEncoder@@IAEXXZ
	DD	FLAT:?ColorOperation0000@ERIEncoder@@IAEXXZ
	DD	FLAT:?ColorOperation1101@ERIEncoder@@IAEXXZ
	DD	FLAT:?ColorOperation1110@ERIEncoder@@IAEXXZ
	DD	FLAT:?ColorOperation1111@ERIEncoder@@IAEXXZ
_DATA	ENDS
CONST	SEGMENT
_?iClrOpFull@?CL@??EncodeTrueColorImage@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z@4PBHB$S31737 DD 05H
	DD	06H
	DD	07H
	DD	09H
	DD	0aH
	DD	0bH
	DD	0dH
	DD	0eH
	DD	0fH
	ORG $+4
_?iClrOpHalf@?CL@??EncodeTrueColorImage@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z@4PBHB$S31739 DD 07H
	DD	0bH
	DD	0fH
	ORG $+4
_?rMatrixRGB2YUV@?1??ConvertRGBtoYUV@ERIEncoder@@IAEXXZ@4PAY02$$CBNA$S32284 DQ 03fd2aaaaaaaaaaabr ; 0.291667
	DQ	03fe2aaaaaaaaaaabr		; 0.583333
	DQ	03fc0000000000000r		; 0.125
	DQ	0bfc5555555555555r		; -0.166667
	DQ	0bfd5555555555555r		; -0.333333
	DQ	03fe0000000000000r		; 0.5
	DQ	03fde38e38e38e38er		; 0.472222
	DQ	0bfd8e38e38e38e39r		; -0.388889
	DQ	0bfb5555555555555r		; -0.0833333
CONST	ENDS
PUBLIC	??0RLHEncodeContext@@QAE@K@Z			; RLHEncodeContext::RLHEncodeContext
PUBLIC	??_7RLHEncodeContext@@6B@			; RLHEncodeContext::`vftable'
PUBLIC	??_GRLHEncodeContext@@UAEPAXI@Z			; RLHEncodeContext::`scalar deleting destructor'
;PUBLIC	??_ERLHEncodeContext@@UAEPAXI@Z			; RLHEncodeContext::`vector deleting destructor'
EXTRN	__purecall:NEAR
EXTRN	?eriAllocateMemory@@YAPAXK@Z:NEAR		; eriAllocateMemory
;	COMDAT ??_7RLHEncodeContext@@6B@
; File I:\EntisGLS\eri-chan\experi\cmperi.cpp
CONST	SEGMENT
??_7RLHEncodeContext@@6B@	LABEL	DWORD
;DD FLAT:??_ERLHEncodeContext@@UAEPAXI@Z ; RLHEncodeContext::`vftable'
	DD	FLAT:??_GRLHEncodeContext@@UAEPAXI@Z
	DD	FLAT:__purecall
CONST	ENDS
_TEXT	SEGMENT
_nBufferingSize$ = 8
_this$ = -8
_i$ = -4
??0RLHEncodeContext@@QAE@K@Z PROC NEAR			; RLHEncodeContext::RLHEncodeContext
; File I:\EntisGLS\eri-chan\experi\cmperi.cpp
; Line 32
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7RLHEncodeContext@@6B@ ; RLHEncodeContext::`vftable'
; Line 33
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], 0
; Line 34
	mov	edx, DWORD PTR _nBufferingSize$[ebp]
	add	edx, 3
	and	edx, -4					; fffffffcH
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+12], edx
; Line 35
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+16], 0
; Line 36
	mov	edx, DWORD PTR _nBufferingSize$[ebp]
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 39
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31339
$L31340:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31339:
	cmp	DWORD PTR _i$[ebp], 257			; 00000101H
	jge	SHORT $L31341
; Line 40
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+eax*4+24], 0
	jmp	SHORT $L31340
$L31341:
; Line 42
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31342
$L31343:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31342:
	cmp	DWORD PTR _i$[ebp], 257			; 00000101H
	jge	SHORT $L31344
; Line 43
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+eax*4+1056], 0
	jmp	SHORT $L31343
$L31344:
; Line 44
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??0RLHEncodeContext@@QAE@K@Z ENDP			; RLHEncodeContext::RLHEncodeContext
_TEXT	ENDS
PUBLIC	??1RLHEncodeContext@@UAE@XZ			; RLHEncodeContext::~RLHEncodeContext
EXTRN	??3@YAXPAX@Z:NEAR				; operator delete
;	COMDAT ??_GRLHEncodeContext@@UAEPAXI@Z
_TEXT	SEGMENT
___flags$ = 8
_this$ = -4
??_GRLHEncodeContext@@UAEPAXI@Z PROC NEAR		; RLHEncodeContext::`scalar deleting destructor', COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1RLHEncodeContext@@UAE@XZ		; RLHEncodeContext::~RLHEncodeContext
	mov	eax, DWORD PTR ___flags$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L31348
	mov	ecx, DWORD PTR _this$[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L31348:
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??_GRLHEncodeContext@@UAEPAXI@Z ENDP			; RLHEncodeContext::`scalar deleting destructor'
_TEXT	ENDS
EXTRN	?eriFreeMemory@@YAXPAX@Z:NEAR			; eriFreeMemory
_TEXT	SEGMENT
_this$ = -4
??1RLHEncodeContext@@UAE@XZ PROC NEAR			; RLHEncodeContext::~RLHEncodeContext
; Line 50
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7RLHEncodeContext@@6B@ ; RLHEncodeContext::`vftable'
; Line 51
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+20], 0
	je	SHORT $L31352
; Line 52
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+20]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31352:
; Line 53
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+24], 0
	je	SHORT $L31353
; Line 54
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31353:
; Line 55
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+1056], 0
	je	SHORT $L31354
; Line 56
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1056]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31354:
; Line 57
	mov	esp, ebp
	pop	ebp
	ret	0
??1RLHEncodeContext@@UAE@XZ ENDP			; RLHEncodeContext::~RLHEncodeContext
_TEXT	ENDS
PUBLIC	?OutACode@RLHEncodeContext@@QAEHH@Z		; RLHEncodeContext::OutACode
_TEXT	SEGMENT
_num$ = 8
_this$ = -16
_b$ = -8
_c$ = -12
_dwNum$ = -4
?OutACode@RLHEncodeContext@@QAEHH@Z PROC NEAR		; RLHEncodeContext::OutACode
; Line 63
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 64
	mov	DWORD PTR _b$[ebp], 0
	mov	DWORD PTR _c$[ebp], 1
; Line 67
	mov	eax, DWORD PTR _num$[ebp]
	sub	eax, 1
	mov	DWORD PTR _num$[ebp], eax
$L31361:
; Line 68
	mov	ecx, DWORD PTR _num$[ebp]
	cmp	ecx, DWORD PTR _c$[ebp]
	jl	SHORT $L31362
; Line 70
	mov	edx, DWORD PTR _num$[ebp]
	sub	edx, DWORD PTR _c$[ebp]
	mov	DWORD PTR _num$[ebp], edx
; Line 71
	mov	eax, DWORD PTR _c$[ebp]
	shl	eax, 1
	mov	DWORD PTR _c$[ebp], eax
; Line 72
	mov	ecx, DWORD PTR _b$[ebp]
	add	ecx, 1
	mov	DWORD PTR _b$[ebp], ecx
; Line 73
	jmp	SHORT $L31361
$L31362:
; Line 76
	mov	ecx, 32					; 00000020H
	sub	ecx, DWORD PTR _b$[ebp]
	mov	edx, DWORD PTR _num$[ebp]
	shl	edx, cl
	mov	DWORD PTR _dwNum$[ebp], edx
$L31366:
; Line 77
	cmp	DWORD PTR _b$[ebp], 0
	jle	$L31367
; Line 81
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	shl	ecx, 1
	or	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], ecx
; Line 82
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	add	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+4], ecx
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4], 32			; 00000020H
	jl	$L31368
; Line 84
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], 0
; Line 85
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	shr	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	BYTE PTR [edx+ecx], al
; Line 86
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	shr	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	mov	BYTE PTR [ecx+edx+1], al
; Line 87
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	shr	eax, 8
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	mov	BYTE PTR [ecx+edx+2], al
; Line 88
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	cl, BYTE PTR [ecx+8]
	mov	BYTE PTR [edx+eax+3], cl
; Line 89
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	add	eax, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 90
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+16]
	cmp	ecx, DWORD PTR [eax+12]
	jb	SHORT $L31374
; Line 92
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+4]
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	eax, DWORD PTR [ecx+16]
	jae	SHORT $L31375
; Line 93
	mov	eax, 1
	jmp	$L31357
$L31375:
; Line 94
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+16], 0
$L31374:
$L31368:
; Line 99
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	shl	ecx, 1
	mov	edx, DWORD PTR _dwNum$[ebp]
	shr	edx, 31					; 0000001fH
	or	ecx, edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+8], ecx
; Line 100
	mov	ecx, DWORD PTR _dwNum$[ebp]
	shl	ecx, 1
	mov	DWORD PTR _dwNum$[ebp], ecx
; Line 101
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	add	eax, 1
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], eax
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+4], 32			; 00000020H
	jl	$L31376
; Line 103
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 104
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	shr	edx, 24					; 00000018H
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	BYTE PTR [ecx+eax], dl
; Line 105
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	shr	edx, 16					; 00000010H
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	BYTE PTR [eax+ecx+1], dl
; Line 106
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	shr	edx, 8
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	BYTE PTR [eax+ecx+2], dl
; Line 107
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	mov	eax, DWORD PTR _this$[ebp]
	mov	al, BYTE PTR [eax+8]
	mov	BYTE PTR [ecx+edx+3], al
; Line 108
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	add	edx, 4
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+16], edx
; Line 109
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [ecx+16]
	cmp	eax, DWORD PTR [edx+12]
	jb	SHORT $L31382
; Line 111
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	eax, DWORD PTR [ecx+16]
	jae	SHORT $L31383
; Line 112
	mov	eax, 1
	jmp	$L31357
$L31383:
; Line 113
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+16], 0
$L31382:
$L31376:
; Line 117
	mov	eax, DWORD PTR _b$[ebp]
	sub	eax, 1
	mov	DWORD PTR _b$[ebp], eax
; Line 118
	jmp	$L31366
$L31367:
; Line 121
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	shl	edx, 1
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+8], edx
; Line 122
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	add	edx, 1
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+4], edx
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+4], 32			; 00000020H
	jl	$L31384
; Line 124
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+4], 0
; Line 125
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	shr	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	edx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [edx+16]
	mov	BYTE PTR [eax+edx], cl
; Line 126
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	shr	ecx, 16					; 00000010H
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	edx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [edx+20]
	mov	BYTE PTR [edx+eax+1], cl
; Line 127
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	shr	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	edx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [edx+20]
	mov	BYTE PTR [edx+eax+2], cl
; Line 128
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	edx, DWORD PTR _this$[ebp]
	mov	dl, BYTE PTR [edx+8]
	mov	BYTE PTR [eax+ecx+3], dl
; Line 129
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+16], ecx
; Line 130
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+16]
	cmp	edx, DWORD PTR [ecx+12]
	jb	SHORT $L31390
; Line 132
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+20]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+4]
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	eax, DWORD PTR [ecx+16]
	jae	SHORT $L31391
; Line 133
	mov	eax, 1
	jmp	SHORT $L31357
$L31391:
; Line 134
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+16], 0
$L31390:
$L31384:
; Line 138
	xor	eax, eax
$L31357:
; Line 139
	mov	esp, ebp
	pop	ebp
	ret	4
?OutACode@RLHEncodeContext@@QAEHH@Z ENDP		; RLHEncodeContext::OutACode
_TEXT	ENDS
PUBLIC	?Flushout@RLHEncodeContext@@QAEHXZ		; RLHEncodeContext::Flushout
_TEXT	SEGMENT
_this$ = -4
?Flushout@RLHEncodeContext@@QAEHXZ PROC NEAR		; RLHEncodeContext::Flushout
; Line 145
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 146
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jle	$L31395
; Line 148
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, 32					; 00000020H
	sub	edx, DWORD PTR [ecx+4]
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, edx
	shl	eax, cl
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 149
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+4], 0
; Line 150
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	shr	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	edx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [edx+16]
	mov	BYTE PTR [eax+edx], cl
; Line 151
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	shr	ecx, 16					; 00000010H
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	edx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [edx+20]
	mov	BYTE PTR [edx+eax+1], cl
; Line 152
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	shr	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	edx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [edx+20]
	mov	BYTE PTR [edx+eax+2], cl
; Line 153
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	edx, DWORD PTR _this$[ebp]
	mov	dl, BYTE PTR [edx+8]
	mov	BYTE PTR [eax+ecx+3], dl
; Line 154
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+16], ecx
$L31395:
; Line 156
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+20]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+4]
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	eax, DWORD PTR [ecx+16]
	jae	SHORT $L31401
; Line 157
	mov	eax, 1
	jmp	SHORT $L31394
$L31401:
; Line 158
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+16], 0
; Line 159
	xor	eax, eax
$L31394:
; Line 160
	mov	esp, ebp
	pop	ebp
	ret	0
?Flushout@RLHEncodeContext@@QAEHXZ ENDP			; RLHEncodeContext::Flushout
_TEXT	ENDS
PUBLIC	?EncodeGammaCodes@RLHEncodeContext@@QAEHPBHH@Z	; RLHEncodeContext::EncodeGammaCodes
EXTRN	?OutNBits@RLHEncodeContext@@QAEHKH@Z:NEAR	; RLHEncodeContext::OutNBits
_TEXT	SEGMENT
_ptrSrc$ = 8
_nCount$ = 12
_this$ = -16
_c$ = -4
_i$ = -8
_num$31428 = -12
?EncodeGammaCodes@RLHEncodeContext@@QAEHPBHH@Z PROC NEAR ; RLHEncodeContext::EncodeGammaCodes
; Line 166
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 167
	mov	DWORD PTR _i$[ebp], 0
; Line 169
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L31408
; Line 170
	push	1
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 171
	jmp	SHORT $L31409
$L31408:
; Line 172
	push	1
	push	-2147483648				; 80000000H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
$L31409:
$L31411:
; Line 174
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _nCount$[ebp]
	jge	$L31412
; Line 176
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	cmp	DWORD PTR [eax+edx*4], 0
	jne	SHORT $L31413
; Line 180
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _c$[ebp], ecx
$L31415:
; Line 181
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	cmp	DWORD PTR [eax+edx*4], 0
	jne	SHORT $L31416
; Line 183
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nCount$[ebp]
	jl	SHORT $L31417
; Line 184
	jmp	SHORT $L31416
$L31417:
; Line 185
	jmp	SHORT $L31415
$L31416:
; Line 188
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, DWORD PTR _c$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?OutACode@RLHEncodeContext@@QAEHH@Z	; RLHEncodeContext::OutACode
	test	eax, eax
	je	SHORT $L31418
; Line 189
	jmp	$L31412
$L31418:
; Line 191
	jmp	$L31419
$L31413:
; Line 195
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _c$[ebp], ecx
$L31421:
; Line 196
	mov	edx, DWORD PTR _c$[ebp]
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	cmp	DWORD PTR [eax+edx*4], 0
	je	SHORT $L31422
; Line 198
	mov	ecx, DWORD PTR _c$[ebp]
	add	ecx, 1
	mov	DWORD PTR _c$[ebp], ecx
	mov	edx, DWORD PTR _c$[ebp]
	cmp	edx, DWORD PTR _nCount$[ebp]
	jl	SHORT $L31423
; Line 199
	jmp	SHORT $L31422
$L31423:
; Line 200
	jmp	SHORT $L31421
$L31422:
; Line 203
	mov	eax, DWORD PTR _c$[ebp]
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?OutACode@RLHEncodeContext@@QAEHH@Z	; RLHEncodeContext::OutACode
	test	eax, eax
	je	SHORT $L31424
; Line 204
	jmp	SHORT $L31412
$L31424:
$L31426:
; Line 207
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _c$[ebp]
	jge	SHORT $L31427
; Line 209
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	mov	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _num$31428[ebp], ecx
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 210
	cmp	DWORD PTR _num$31428[ebp], 0
	jge	SHORT $L31429
; Line 212
	push	1
	push	-2147483648				; 80000000H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
	test	eax, eax
	je	SHORT $L31430
; Line 213
	mov	eax, DWORD PTR _i$[ebp]
	jmp	SHORT $L31405
$L31430:
; Line 214
	mov	eax, DWORD PTR _num$31428[ebp]
	neg	eax
	mov	DWORD PTR _num$31428[ebp], eax
; Line 216
	jmp	SHORT $L31431
$L31429:
; Line 218
	push	1
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
	test	eax, eax
	je	SHORT $L31432
; Line 219
	mov	eax, DWORD PTR _i$[ebp]
	jmp	SHORT $L31405
$L31432:
$L31431:
; Line 221
	mov	ecx, DWORD PTR _num$31428[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?OutACode@RLHEncodeContext@@QAEHH@Z	; RLHEncodeContext::OutACode
	test	eax, eax
	je	SHORT $L31433
; Line 222
	mov	eax, DWORD PTR _i$[ebp]
	jmp	SHORT $L31405
$L31433:
; Line 223
	jmp	SHORT $L31426
$L31427:
$L31419:
; Line 225
	jmp	$L31411
$L31412:
; Line 227
	mov	eax, DWORD PTR _i$[ebp]
$L31405:
; Line 228
	mov	esp, ebp
	pop	ebp
	ret	8
?EncodeGammaCodes@RLHEncodeContext@@QAEHPBHH@Z ENDP	; RLHEncodeContext::EncodeGammaCodes
_TEXT	ENDS
PUBLIC	?PrepareToEncodeRLMTFGCode@RLHEncodeContext@@QAEXXZ ; RLHEncodeContext::PrepareToEncodeRLMTFGCode
_TEXT	SEGMENT
_this$ = -20
_ptrBuffer$ = -8
_i$ = -4
_i$32570 = -12
$T32574 = -16
?PrepareToEncodeRLMTFGCode@RLHEncodeContext@@QAEXXZ PROC NEAR ; RLHEncodeContext::PrepareToEncodeRLMTFGCode
; Line 234
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 238
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+24], 0
	je	SHORT $L31438
; Line 240
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR _ptrBuffer$[ebp], edx
; Line 242
	jmp	SHORT $L31440
$L31438:
; Line 245
	push	65792					; 00010100H
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	DWORD PTR _ptrBuffer$[ebp], eax
$L31440:
; Line 249
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31444
$L31445:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31444:
	cmp	DWORD PTR _i$[ebp], 257			; 00000101H
	jge	SHORT $L31446
; Line 251
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _ptrBuffer$[ebp]
	mov	DWORD PTR [edx+ecx*4+24], eax
; Line 252
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4+24]
	mov	DWORD PTR $T32574[ebp], eax
	mov	DWORD PTR _i$32570[ebp], 0
	jmp	SHORT $L32571
$L32572:
	mov	ecx, DWORD PTR _i$32570[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$32570[ebp], ecx
$L32571:
	cmp	DWORD PTR _i$32570[ebp], 256		; 00000100H
	jge	SHORT $L32573
	mov	edx, DWORD PTR $T32574[ebp]
	add	edx, DWORD PTR _i$32570[ebp]
	mov	al, BYTE PTR _i$32570[ebp]
	mov	BYTE PTR [edx], al
	jmp	SHORT $L32572
$L32573:
; Line 253
	mov	ecx, DWORD PTR _ptrBuffer$[ebp]
	add	ecx, 256				; 00000100H
	mov	DWORD PTR _ptrBuffer$[ebp], ecx
; Line 254
	jmp	SHORT $L31445
$L31446:
; Line 255
	mov	esp, ebp
	pop	ebp
	ret	0
?PrepareToEncodeRLMTFGCode@RLHEncodeContext@@QAEXXZ ENDP ; RLHEncodeContext::PrepareToEncodeRLMTFGCode
_TEXT	ENDS
PUBLIC	?EncodeRLMTFGCodes@RLHEncodeContext@@QAEHPAEH@Z	; RLHEncodeContext::EncodeRLMTFGCodes
_TEXT	SEGMENT
_ptrSrc$ = 8
_nCount$ = 12
_this$ = -36
_i$ = -8
_iLastPlt$ = -4
_pCurTable$ = -12
_iCurPlt$31459 = -16
_j$31463 = -20
_lplt$32576 = -32
_cplt$32577 = -28
_index$32578 = -24
?EncodeRLMTFGCodes@RLHEncodeContext@@QAEHPAEH@Z PROC NEAR ; RLHEncodeContext::EncodeRLMTFGCodes
; Line 261
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	mov	DWORD PTR _this$[ebp], ecx
; Line 262
	mov	DWORD PTR _i$[ebp], 0
; Line 265
	mov	DWORD PTR _iLastPlt$[ebp], -1
; Line 266
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1048]
	mov	DWORD PTR _pCurTable$[ebp], ecx
$L31457:
; Line 269
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nCount$[ebp]
	jge	$L31458
; Line 273
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR _iCurPlt$31459[ebp], cl
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 274
	mov	DWORD PTR _index$32578[ebp], 0
	mov	al, BYTE PTR _iCurPlt$31459[ebp]
	mov	BYTE PTR _lplt$32576[ebp], al
$L32579:
	mov	ecx, DWORD PTR _pCurTable$[ebp]
	add	ecx, DWORD PTR _index$32578[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR _cplt$32577[ebp], dl
	mov	eax, DWORD PTR _pCurTable$[ebp]
	add	eax, DWORD PTR _index$32578[ebp]
	mov	cl, BYTE PTR _lplt$32576[ebp]
	mov	BYTE PTR [eax], cl
	mov	edx, DWORD PTR _index$32578[ebp]
	add	edx, 1
	mov	DWORD PTR _index$32578[ebp], edx
	mov	eax, DWORD PTR _cplt$32577[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _iCurPlt$31459[ebp]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jne	SHORT $L32581
	jmp	SHORT $L32580
$L32581:
	mov	dl, BYTE PTR _cplt$32577[ebp]
	mov	BYTE PTR _lplt$32576[ebp], dl
	jmp	SHORT $L32579
$L32580:
	mov	eax, DWORD PTR _index$32578[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?OutACode@RLHEncodeContext@@QAEHH@Z	; RLHEncodeContext::OutACode
	test	eax, eax
	je	SHORT $L31460
; Line 275
	jmp	SHORT $L31458
$L31460:
; Line 278
	mov	ecx, DWORD PTR _iCurPlt$31459[ebp]
	and	ecx, 255				; 000000ffH
	cmp	DWORD PTR _iLastPlt$[ebp], ecx
	jne	SHORT $L31462
; Line 282
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	mov	DWORD PTR _j$31463[ebp], edx
$L31465:
; Line 283
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nCount$[ebp]
	jge	SHORT $L31466
; Line 285
	mov	ecx, DWORD PTR _ptrSrc$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx]
	mov	eax, DWORD PTR _iCurPlt$31459[ebp]
	and	eax, 255				; 000000ffH
	cmp	edx, eax
	je	SHORT $L31467
; Line 286
	jmp	SHORT $L31466
$L31467:
; Line 287
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
; Line 288
	jmp	SHORT $L31465
$L31466:
; Line 290
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, DWORD PTR _j$31463[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?OutACode@RLHEncodeContext@@QAEHH@Z	; RLHEncodeContext::OutACode
	test	eax, eax
	je	SHORT $L31468
; Line 291
	jmp	SHORT $L31458
$L31468:
; Line 293
	jmp	SHORT $L31469
$L31462:
; Line 297
	mov	eax, DWORD PTR _iCurPlt$31459[ebp]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _iLastPlt$[ebp], eax
; Line 298
	mov	ecx, DWORD PTR _iCurPlt$31459[ebp]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4+24]
	mov	DWORD PTR _pCurTable$[ebp], eax
$L31469:
; Line 300
	jmp	$L31457
$L31458:
; Line 303
	mov	eax, DWORD PTR _i$[ebp]
; Line 304
	mov	esp, ebp
	pop	ebp
	ret	8
?EncodeRLMTFGCodes@RLHEncodeContext@@QAEHPAEH@Z ENDP	; RLHEncodeContext::EncodeRLMTFGCodes
_TEXT	ENDS
PUBLIC	?PrepareToEncodeERINACode@RLHEncodeContext@@QAEXXZ ; RLHEncodeContext::PrepareToEncodeERINACode
EXTRN	?Initialize@ERINA_HUFFMAN_TREE@@QAEXXZ:NEAR	; ERINA_HUFFMAN_TREE::Initialize
_TEXT	SEGMENT
_this$ = -12
_ptrBuf$ = -4
_i$ = -8
?PrepareToEncodeERINACode@RLHEncodeContext@@QAEXXZ PROC NEAR ; RLHEncodeContext::PrepareToEncodeERINACode
; Line 310
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 312
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1056], 0
	jne	SHORT $L31474
; Line 315
	push	1319952					; 00142410H
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	DWORD PTR _ptrBuf$[ebp], eax
; Line 317
	jmp	SHORT $L31477
$L31474:
; Line 319
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1056]
	mov	DWORD PTR _ptrBuf$[ebp], edx
$L31477:
; Line 321
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31480
$L31481:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31480:
	cmp	DWORD PTR _i$[ebp], 257			; 00000101H
	jge	SHORT $L31482
; Line 323
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _ptrBuf$[ebp]
	mov	DWORD PTR [edx+ecx*4+1056], eax
; Line 324
	mov	ecx, DWORD PTR _ptrBuf$[ebp]
	add	ecx, 5136				; 00001410H
	mov	DWORD PTR _ptrBuf$[ebp], ecx
; Line 325
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+edx*4+1056]
	call	?Initialize@ERINA_HUFFMAN_TREE@@QAEXXZ	; ERINA_HUFFMAN_TREE::Initialize
; Line 326
	jmp	SHORT $L31481
$L31482:
; Line 327
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1056]
	mov	DWORD PTR [ecx+1052], eax
; Line 328
	mov	esp, ebp
	pop	ebp
	ret	0
?PrepareToEncodeERINACode@RLHEncodeContext@@QAEXXZ ENDP	; RLHEncodeContext::PrepareToEncodeERINACode
_TEXT	ENDS
PUBLIC	??0PARAMETER@ERIEncoder@@QAE@XZ			; ERIEncoder::PARAMETER::PARAMETER
EXTRN	__fltused:NEAR
_TEXT	SEGMENT
_this$ = -4
??0PARAMETER@ERIEncoder@@QAE@XZ PROC NEAR		; ERIEncoder::PARAMETER::PARAMETER
; Line 359
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 360
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], 1056964608		; 3f000000H
; Line 361
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], 1050253722		; 3e99999aH
; Line 362
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], 1048576000		; 3e800000H
; Line 363
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+12], 1045220557		; 3e4ccccdH
; Line 364
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+16], 1048576000		; 3e800000H
; Line 365
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+20], 1045220557		; 3e4ccccdH
; Line 366
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+24], 0
; Line 367
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+28], 0
; Line 368
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0PARAMETER@ERIEncoder@@QAE@XZ ENDP			; ERIEncoder::PARAMETER::PARAMETER
_TEXT	ENDS
PUBLIC	??0ERIEncoder@@QAE@XZ				; ERIEncoder::ERIEncoder
PUBLIC	?Initialize@ERIEncoder@@UAEHABUERI_INFO_HEADER@@@Z ; ERIEncoder::Initialize
PUBLIC	?Delete@ERIEncoder@@UAEXXZ			; ERIEncoder::Delete
PUBLIC	?EncodeImage@ERIEncoder@@UAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z ; ERIEncoder::EncodeImage
PUBLIC	?GetChannelDepth@ERIEncoder@@MAEHKK@Z		; ERIEncoder::GetChannelDepth
PUBLIC	?GetSamplingFunc@ERIEncoder@@MAEP81@AEXPAEJHH@ZKK@Z ; ERIEncoder::GetSamplingFunc
PUBLIC	?GetSamplingFuncII@ERIEncoder@@MAEP81@AEXQAPAMPAEJHH@ZKK@Z ; ERIEncoder::GetSamplingFuncII
PUBLIC	?OnEncodedBlock@ERIEncoder@@MAEHJJ@Z		; ERIEncoder::OnEncodedBlock
PUBLIC	?OnEncodedLine@ERIEncoder@@MAEHJ@Z		; ERIEncoder::OnEncodedLine
PUBLIC	??_7ERIEncoder@@6B@				; ERIEncoder::`vftable'
PUBLIC	??_GERIEncoder@@UAEPAXI@Z			; ERIEncoder::`scalar deleting destructor'
;PUBLIC	??_EERIEncoder@@UAEPAXI@Z			; ERIEncoder::`vector deleting destructor'
;	COMDAT ??_7ERIEncoder@@6B@
; File I:\EntisGLS\eri-chan\experi\cmperi.cpp
CONST	SEGMENT
??_7ERIEncoder@@6B@	LABEL	DWORD
; DD FLAT:??_EERIEncoder@@UAEPAXI@Z	; ERIEncoder::`vftable'
	DD	FLAT:??_GERIEncoder@@UAEPAXI@Z
	DD	FLAT:?Initialize@ERIEncoder@@UAEHABUERI_INFO_HEADER@@@Z
	DD	FLAT:?Delete@ERIEncoder@@UAEXXZ
	DD	FLAT:?EncodeImage@ERIEncoder@@UAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z
	DD	FLAT:?GetChannelDepth@ERIEncoder@@MAEHKK@Z
	DD	FLAT:?GetSamplingFunc@ERIEncoder@@MAEP81@AEXPAEJHH@ZKK@Z
	DD	FLAT:?GetSamplingFuncII@ERIEncoder@@MAEP81@AEXQAPAMPAEJHH@ZKK@Z
	DD	FLAT:?OnEncodedBlock@ERIEncoder@@MAEHJJ@Z
	DD	FLAT:?OnEncodedLine@ERIEncoder@@MAEHJ@Z
CONST	ENDS
_TEXT	SEGMENT
_this$ = -4
??0ERIEncoder@@QAE@XZ PROC NEAR				; ERIEncoder::ERIEncoder
; File I:\EntisGLS\eri-chan\experi\cmperi.cpp
; Line 374
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 424				; 000001a8H
	call	??0PARAMETER@ERIEncoder@@QAE@XZ		; ERIEncoder::PARAMETER::PARAMETER
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7ERIEncoder@@6B@ ; ERIEncoder::`vftable'
; Line 375
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+100], 0
; Line 376
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+104], 0
; Line 377
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+108], 0
; Line 378
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+112], 0
; Line 380
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+120], 0
; Line 381
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+124], 0
; Line 382
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+128], 0
; Line 383
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+132], 0
; Line 385
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+136], 0
; Line 386
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+140], 0
; Line 388
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+144], 0
; Line 390
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+156], 0
; Line 391
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+220], 0
; Line 392
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+284], 0
; Line 393
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+348], 0
; Line 394
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+352], 0
; Line 396
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+420], 0
; Line 397
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0ERIEncoder@@QAE@XZ ENDP				; ERIEncoder::ERIEncoder
_TEXT	ENDS
PUBLIC	??1ERIEncoder@@UAE@XZ				; ERIEncoder::~ERIEncoder
;	COMDAT ??_GERIEncoder@@UAEPAXI@Z
_TEXT	SEGMENT
___flags$ = 8
_this$ = -4
??_GERIEncoder@@UAEPAXI@Z PROC NEAR			; ERIEncoder::`scalar deleting destructor', COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1ERIEncoder@@UAE@XZ			; ERIEncoder::~ERIEncoder
	mov	eax, DWORD PTR ___flags$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L31494
	mov	ecx, DWORD PTR _this$[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L31494:
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??_GERIEncoder@@UAEPAXI@Z ENDP				; ERIEncoder::`scalar deleting destructor'
_TEXT	ENDS
_TEXT	SEGMENT
_this$ = -4
??1ERIEncoder@@UAE@XZ PROC NEAR				; ERIEncoder::~ERIEncoder
; Line 403
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7ERIEncoder@@6B@ ; ERIEncoder::`vftable'
; Line 404
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Delete@ERIEncoder@@UAEXXZ		; ERIEncoder::Delete
; Line 405
	mov	esp, ebp
	pop	ebp
	ret	0
??1ERIEncoder@@UAE@XZ ENDP				; ERIEncoder::~ERIEncoder
_TEXT	ENDS
PUBLIC	?SetCompressionParameter@ERIEncoder@@QAEXABUPARAMETER@1@@Z ; ERIEncoder::SetCompressionParameter
PUBLIC	?InitializeSamplingTable@ERIEncoder@@IAEXXZ	; ERIEncoder::InitializeSamplingTable
PUBLIC	?InitializeZigZagTable@ERIEncoder@@IAEXXZ	; ERIEncoder::InitializeZigZagTable
PUBLIC	?BlockScaling444@ERIEncoder@@IAEXXZ		; ERIEncoder::BlockScaling444
PUBLIC	?BlockScaling422@ERIEncoder@@IAEXXZ		; ERIEncoder::BlockScaling422
PUBLIC	?BlockScaling411@ERIEncoder@@IAEXXZ		; ERIEncoder::BlockScaling411
_TEXT	SEGMENT
_infhdr$ = 8
_this$ = -48
_ptrBuffer$31563 = -44
_i$31566 = -36
_j$31567 = -40
_param$31590 = -32
?Initialize@ERIEncoder@@UAEHABUERI_INFO_HEADER@@@Z PROC NEAR ; ERIEncoder::Initialize
; Line 411
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 414
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+8]
; Line 417
	mov	esi, DWORD PTR _infhdr$[ebp]
	mov	edi, DWORD PTR _this$[ebp]
	add	edi, 4
	mov	ecx, 17					; 00000011H
	rep movsd
; Line 420
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 50462720		; 03020000H
	jne	$L31501
; Line 423
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+12], -1
	je	SHORT $L31502
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+12], -4			; fffffffcH
	je	SHORT $L31502
; Line 425
	mov	eax, 1
	jmp	$L31500
$L31502:
; Line 428
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	and	ecx, 16777215				; 00ffffffH
	mov	DWORD PTR -52+[ebp], ecx
	cmp	DWORD PTR -52+[ebp], 1
	je	SHORT $L31507
	cmp	DWORD PTR -52+[ebp], 2
	je	SHORT $L31512
	jmp	SHORT $L31513
$L31507:
; Line 431
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+28], 8
	ja	SHORT $L31508
; Line 432
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+84], 1
; Line 433
	jmp	SHORT $L31509
$L31508:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	and	edx, 67108864				; 04000000H
	test	edx, edx
	jne	SHORT $L31510
; Line 434
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+84], 3
; Line 435
	jmp	SHORT $L31511
$L31510:
; Line 436
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+84], 4
$L31511:
$L31509:
; Line 437
	jmp	SHORT $L31504
$L31512:
; Line 440
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+84], 1
; Line 441
	jmp	SHORT $L31504
$L31513:
; Line 444
	mov	eax, 1
	jmp	$L31500
$L31504:
; Line 447
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+56], 0
	je	$L31514
; Line 451
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, 1
	mov	ecx, DWORD PTR [ecx+56]
	shl	edx, cl
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+72], edx
; Line 452
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+56]
	shl	ecx, 1
	mov	edx, 1
	shl	edx, cl
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+76], edx
; Line 453
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [ecx+76]
	imul	eax, DWORD PTR [edx+84]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+80], eax
; Line 456
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	lea	eax, DWORD PTR [eax+edx-1]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+56]
	shr	eax, cl
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+88], eax
; Line 457
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jge	SHORT $L31518
; Line 459
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	neg	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+92], edx
; Line 461
	jmp	SHORT $L31520
$L31518:
; Line 463
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR [ecx+92], eax
$L31520:
; Line 467
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+92]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	lea	edx, DWORD PTR [edx+ecx-1]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	shr	edx, cl
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+92], edx
; Line 472
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+72]
	imul	ecx, DWORD PTR [eax+84]
	shl	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+100], eax
; Line 475
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+88]
	mov	ecx, DWORD PTR [ecx+56]
	shl	edx, cl
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+84]
	imul	ecx, edx
	shl	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+104], eax
; Line 477
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	shl	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+108], eax
; Line 479
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	shl	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+112], eax
$L31514:
; Line 483
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4], 131584		; 00020200H
	jne	SHORT $L31530
; Line 485
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+56], 0
	je	SHORT $L31531
; Line 487
	mov	ecx, DWORD PTR _this$[ebp]
	call	?InitializeSamplingTable@ERIEncoder@@IAEXXZ ; ERIEncoder::InitializeSamplingTable
$L31531:
; Line 490
	push	5136					; 00001410H
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+144], eax
; Line 492
	jmp	SHORT $L31534
$L31530:
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4], 131328		; 00020100H
	je	SHORT $L31535
; Line 494
	mov	eax, 1
	jmp	$L31500
$L31535:
$L31534:
; Line 497
	jmp	$L31536
$L31501:
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+8], 1
	jne	$L31537
; Line 500
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+12], -1
	je	SHORT $L31538
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+12], -4			; fffffffcH
	je	SHORT $L31538
; Line 502
	mov	eax, 1
	jmp	$L31500
$L31538:
; Line 505
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	and	edx, 16777215				; 00ffffffH
	cmp	edx, 1
	je	SHORT $L31539
; Line 507
	mov	eax, 1
	jmp	$L31500
$L31539:
; Line 509
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+28], 24			; 00000018H
	jae	SHORT $L31540
; Line 511
	mov	eax, 1
	jmp	$L31500
$L31540:
; Line 513
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	and	edx, 67108864				; 04000000H
	test	edx, edx
	jne	SHORT $L31541
; Line 515
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+84], 3
; Line 517
	jmp	SHORT $L31542
$L31541:
; Line 519
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+84], 4
$L31542:
; Line 523
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+56], 3
	jb	SHORT $L31544
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+56], 5
	jbe	SHORT $L31543
$L31544:
; Line 525
	mov	eax, 1
	jmp	$L31500
$L31543:
; Line 529
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, 1
	mov	ecx, DWORD PTR [ecx+56]
	shl	edx, cl
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+72], edx
; Line 530
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+56]
	shl	ecx, 1
	mov	edx, 1
	shl	edx, cl
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+76], edx
; Line 531
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	shl	edx, 2
	mov	eax, DWORD PTR _this$[ebp]
	imul	edx, DWORD PTR [eax+84]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+80], edx
; Line 534
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	lea	eax, DWORD PTR [edx+eax*2-1]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+56]
	add	ecx, 1
	shr	eax, cl
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+88], eax
; Line 535
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jge	SHORT $L31548
; Line 537
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	neg	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+92], edx
; Line 539
	jmp	SHORT $L31550
$L31548:
; Line 541
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR [ecx+92], eax
$L31550:
; Line 545
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+92]
	lea	edx, DWORD PTR [ecx+edx*2-1]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	add	ecx, 1
	shr	edx, cl
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+92], edx
; Line 547
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+148], 0
; Line 548
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+36]
	mov	DWORD PTR -56+[ebp], ecx
	cmp	DWORD PTR -56+[ebp], 262401		; 00040101H
	je	SHORT $L31558
	cmp	DWORD PTR -56+[ebp], 262658		; 00040202H
	je	SHORT $L31557
	cmp	DWORD PTR -56+[ebp], 263172		; 00040404H
	je	SHORT $L31556
	jmp	SHORT $L31559
$L31556:
; Line 551
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+148], 12			; 0000000cH
; Line 552
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+152], OFFSET FLAT:?BlockScaling444@ERIEncoder@@IAEXXZ ; ERIEncoder::BlockScaling444
; Line 553
	jmp	SHORT $L31553
$L31557:
; Line 555
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+148], 8
; Line 556
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+152], OFFSET FLAT:?BlockScaling422@ERIEncoder@@IAEXXZ ; ERIEncoder::BlockScaling422
; Line 557
	jmp	SHORT $L31553
$L31558:
; Line 559
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+148], 6
; Line 560
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+152], OFFSET FLAT:?BlockScaling411@ERIEncoder@@IAEXXZ ; ERIEncoder::BlockScaling411
; Line 561
	jmp	SHORT $L31553
$L31559:
; Line 563
	mov	eax, 1
	jmp	$L31500
$L31553:
; Line 565
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+84], 4
	jne	SHORT $L31560
; Line 567
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+148]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+148], ecx
$L31560:
; Line 573
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+148]
	imul	edx, DWORD PTR [ecx+76]
	shl	edx, 2
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+108], eax
; Line 577
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	shl	eax, 2
	shl	eax, 4
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	DWORD PTR _ptrBuffer$31563[ebp], eax
; Line 579
	mov	DWORD PTR _i$31566[ebp], 0
	jmp	SHORT $L31568
$L31569:
	mov	ecx, DWORD PTR _i$31566[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$31566[ebp], ecx
$L31568:
	cmp	DWORD PTR _i$31566[ebp], 4
	jge	SHORT $L31570
; Line 581
	mov	DWORD PTR _j$31567[ebp], 0
	jmp	SHORT $L31571
$L31572:
	mov	edx, DWORD PTR _j$31567[ebp]
	add	edx, 1
	mov	DWORD PTR _j$31567[ebp], edx
$L31571:
	cmp	DWORD PTR _j$31567[ebp], 4
	jge	SHORT $L31573
; Line 583
	mov	eax, DWORD PTR _i$31566[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _this$[ebp]
	lea	edx, DWORD PTR [ecx+eax+156]
	mov	eax, DWORD PTR _j$31567[ebp]
	mov	ecx, DWORD PTR _ptrBuffer$31563[ebp]
	mov	DWORD PTR [edx+eax*4], ecx
; Line 584
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	mov	ecx, DWORD PTR _ptrBuffer$31563[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _ptrBuffer$31563[ebp], edx
; Line 585
	jmp	SHORT $L31572
$L31573:
; Line 586
	jmp	SHORT $L31569
$L31570:
; Line 590
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	shl	ecx, 2
	shl	ecx, 4
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	DWORD PTR _ptrBuffer$31563[ebp], eax
; Line 591
	mov	DWORD PTR _i$31566[ebp], 0
	jmp	SHORT $L31576
$L31577:
	mov	edx, DWORD PTR _i$31566[ebp]
	add	edx, 1
	mov	DWORD PTR _i$31566[ebp], edx
$L31576:
	cmp	DWORD PTR _i$31566[ebp], 16		; 00000010H
	jge	SHORT $L31578
; Line 593
	mov	eax, DWORD PTR _i$31566[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _ptrBuffer$31563[ebp]
	mov	DWORD PTR [ecx+eax*4+220], edx
; Line 594
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	mov	edx, DWORD PTR _ptrBuffer$31563[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _ptrBuffer$31563[ebp], eax
; Line 595
	jmp	SHORT $L31577
$L31578:
; Line 599
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	shl	edx, 2
	shl	edx, 4
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	DWORD PTR _ptrBuffer$31563[ebp], eax
; Line 600
	mov	DWORD PTR _i$31566[ebp], 0
	jmp	SHORT $L31581
$L31582:
	mov	eax, DWORD PTR _i$31566[ebp]
	add	eax, 1
	mov	DWORD PTR _i$31566[ebp], eax
$L31581:
	cmp	DWORD PTR _i$31566[ebp], 16		; 00000010H
	jge	SHORT $L31583
; Line 602
	mov	ecx, DWORD PTR _i$31566[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _ptrBuffer$31563[ebp]
	mov	DWORD PTR [edx+ecx*4+284], eax
; Line 603
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	mov	eax, DWORD PTR _ptrBuffer$31563[ebp]
	lea	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _ptrBuffer$31563[ebp], ecx
; Line 604
	jmp	SHORT $L31582
$L31583:
; Line 607
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	shl	eax, 2
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+348], eax
; Line 609
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	shl	eax, 2
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+352], eax
; Line 613
	push	5136					; 00001410H
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+144], eax
; Line 616
	mov	ecx, DWORD PTR _this$[ebp]
	call	?InitializeZigZagTable@ERIEncoder@@IAEXXZ ; ERIEncoder::InitializeZigZagTable
; Line 619
	lea	ecx, DWORD PTR _param$31590[ebp]
	call	??0PARAMETER@ERIEncoder@@QAE@XZ		; ERIEncoder::PARAMETER::PARAMETER
; Line 620
	lea	eax, DWORD PTR _param$31590[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SetCompressionParameter@ERIEncoder@@QAEXABUPARAMETER@1@@Z ; ERIEncoder::SetCompressionParameter
; Line 622
	jmp	SHORT $L31591
$L31537:
; Line 624
	mov	eax, 1
	jmp	SHORT $L31500
$L31591:
$L31536:
; Line 628
	xor	eax, eax
$L31500:
; Line 629
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?Initialize@ERIEncoder@@UAEHABUERI_INFO_HEADER@@@Z ENDP	; ERIEncoder::Initialize
_this$ = -36
_i$ = -4
_j$ = -12
_k$ = -16
_l$ = -20
_m$ = -24
_n$ = -32
_ptrTable$ = -8
_ptrNext$ = -28
?InitializeSamplingTable@ERIEncoder@@IAEXXZ PROC NEAR	; ERIEncoder::InitializeSamplingTable
; Line 635
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	mov	DWORD PTR _this$[ebp], ecx
; Line 640
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	shl	ecx, 2
	shl	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	DWORD PTR _ptrTable$[ebp], eax
; Line 642
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _ptrTable$[ebp]
	mov	DWORD PTR [edx+120], eax
; Line 643
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _ptrTable$[ebp]
	lea	ecx, DWORD PTR [eax+edx*4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+124], ecx
; Line 644
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	shl	ecx, 1
	mov	edx, DWORD PTR _ptrTable$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+128], eax
; Line 645
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+80]
	imul	eax, 3
	mov	ecx, DWORD PTR _ptrTable$[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+132], edx
; Line 648
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+120]
	mov	DWORD PTR _ptrNext$[ebp], edx
; Line 649
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31605
$L31606:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31605:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+80]
	jae	SHORT $L31607
; Line 651
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrNext$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx+eax*4], edx
; Line 652
	jmp	SHORT $L31606
$L31607:
; Line 655
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	mov	DWORD PTR _ptrNext$[ebp], ecx
; Line 656
	mov	DWORD PTR _l$[ebp], 0
; Line 657
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31608
$L31609:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31608:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+84]
	jae	SHORT $L31610
; Line 659
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31611
$L31612:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L31611:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+72]
	jae	SHORT $L31613
; Line 661
	mov	edx, DWORD PTR _l$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	DWORD PTR _m$[ebp], edx
; Line 662
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L31614
$L31615:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L31614:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR [ecx+72]
	jae	SHORT $L31616
; Line 664
	mov	eax, DWORD PTR _ptrNext$[ebp]
	mov	ecx, DWORD PTR _m$[ebp]
	mov	DWORD PTR [eax], ecx
	mov	edx, DWORD PTR _ptrNext$[ebp]
	add	edx, 4
	mov	DWORD PTR _ptrNext$[ebp], edx
; Line 665
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _m$[ebp]
	add	ecx, DWORD PTR [eax+72]
	mov	DWORD PTR _m$[ebp], ecx
; Line 666
	jmp	SHORT $L31615
$L31616:
; Line 667
	jmp	SHORT $L31612
$L31613:
; Line 668
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _l$[ebp]
	add	eax, DWORD PTR [edx+76]
	mov	DWORD PTR _l$[ebp], eax
; Line 669
	jmp	$L31609
$L31610:
; Line 672
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+128]
	mov	DWORD PTR _ptrNext$[ebp], edx
; Line 673
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31617
$L31618:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31617:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+84]
	jae	SHORT $L31619
; Line 675
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _k$[ebp], eax
; Line 676
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31620
$L31621:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L31620:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+76]
	jae	SHORT $L31622
; Line 678
	mov	ecx, DWORD PTR _ptrNext$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	mov	DWORD PTR [ecx], edx
	mov	eax, DWORD PTR _ptrNext$[ebp]
	add	eax, 4
	mov	DWORD PTR _ptrNext$[ebp], eax
; Line 679
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, DWORD PTR [ecx+84]
	mov	DWORD PTR _k$[ebp], edx
; Line 680
	jmp	SHORT $L31621
$L31622:
; Line 681
	jmp	SHORT $L31618
$L31619:
; Line 684
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	mov	DWORD PTR _ptrNext$[ebp], ecx
; Line 685
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+72]
	imul	ecx, DWORD PTR [eax+84]
	mov	DWORD PTR _n$[ebp], ecx
; Line 686
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31623
$L31624:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31623:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+84]
	jae	SHORT $L31625
; Line 688
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _l$[ebp], edx
; Line 689
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31626
$L31627:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L31626:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+72]
	jae	SHORT $L31628
; Line 691
	mov	eax, DWORD PTR _l$[ebp]
	mov	DWORD PTR _m$[ebp], eax
; Line 692
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _l$[ebp]
	add	edx, DWORD PTR [ecx+84]
	mov	DWORD PTR _l$[ebp], edx
; Line 693
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L31629
$L31630:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L31629:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR [ecx+72]
	jae	SHORT $L31631
; Line 695
	mov	eax, DWORD PTR _ptrNext$[ebp]
	mov	ecx, DWORD PTR _m$[ebp]
	mov	DWORD PTR [eax], ecx
	mov	edx, DWORD PTR _ptrNext$[ebp]
	add	edx, 4
	mov	DWORD PTR _ptrNext$[ebp], edx
; Line 696
	mov	eax, DWORD PTR _m$[ebp]
	add	eax, DWORD PTR _n$[ebp]
	mov	DWORD PTR _m$[ebp], eax
; Line 697
	jmp	SHORT $L31630
$L31631:
; Line 698
	jmp	SHORT $L31627
$L31628:
; Line 699
	jmp	$L31624
$L31625:
; Line 700
	mov	esp, ebp
	pop	ebp
	ret	0
?InitializeSamplingTable@ERIEncoder@@IAEXXZ ENDP	; ERIEncoder::InitializeSamplingTable
_this$ = -4
?Delete@ERIEncoder@@UAEXXZ PROC NEAR			; ERIEncoder::Delete
; Line 706
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 707
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+100], 0
	je	SHORT $L31635
; Line 709
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 710
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+100], 0
$L31635:
; Line 712
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+104], 0
	je	SHORT $L31636
; Line 714
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+104]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 715
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+104], 0
$L31636:
; Line 717
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+108], 0
	je	SHORT $L31637
; Line 719
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 720
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+108], 0
$L31637:
; Line 722
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+112], 0
	je	SHORT $L31638
; Line 724
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 725
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+112], 0
$L31638:
; Line 727
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+120], 0
	je	SHORT $L31639
; Line 729
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+120]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 730
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+120], 0
$L31639:
; Line 732
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+136], 0
	je	SHORT $L31640
; Line 734
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+136]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 735
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+136], 0
$L31640:
; Line 737
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+140], 0
	je	SHORT $L31641
; Line 739
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+140]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 740
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+140], 0
$L31641:
; Line 742
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+144], 0
	je	SHORT $L31642
; Line 744
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+144]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 745
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+144], 0
$L31642:
; Line 747
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+156], 0
	je	SHORT $L31643
; Line 749
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+156]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 750
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+156], 0
$L31643:
; Line 752
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+220], 0
	je	SHORT $L31644
; Line 754
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+220]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 755
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+220], 0
$L31644:
; Line 757
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+284], 0
	je	SHORT $L31645
; Line 759
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+284]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 760
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+284], 0
$L31645:
; Line 762
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+348], 0
	je	SHORT $L31646
; Line 764
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+348]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 765
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+348], 0
$L31646:
; Line 767
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+352], 0
	je	SHORT $L31647
; Line 769
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+352]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 770
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+352], 0
$L31647:
; Line 772
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+420], 0
	je	SHORT $L31648
; Line 774
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+420]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 775
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+420], 0
$L31648:
; Line 777
	mov	esp, ebp
	pop	ebp
	ret	0
?Delete@ERIEncoder@@UAEXXZ ENDP				; ERIEncoder::Delete
_TEXT	ENDS
PUBLIC	?EncodeTrueColorImage@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z ; ERIEncoder::EncodeTrueColorImage
PUBLIC	?EncodeTrueColorImageII@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z ; ERIEncoder::EncodeTrueColorImageII
PUBLIC	?EncodePaletteImage@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@@Z ; ERIEncoder::EncodePaletteImage
PUBLIC	?EncodeTrueColorImageDCT@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z ; ERIEncoder::EncodeTrueColorImageDCT
_TEXT	SEGMENT
_srcimginf$ = 8
_context$ = 12
_fdwFlags$ = 16
_this$ = -28
_imginf$ = -24
?EncodeImage@ERIEncoder@@UAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z PROC NEAR ; ERIEncoder::EncodeImage
; Line 785
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 788
	mov	esi, DWORD PTR _srcimginf$[ebp]
	mov	ecx, 6
	lea	edi, DWORD PTR _imginf$[ebp]
	rep movsd
; Line 789
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jge	SHORT $L31655
; Line 792
	mov	ecx, DWORD PTR _imginf$[ebp+12]
	sub	ecx, 1
	imul	ecx, DWORD PTR _imginf$[ebp+20]
	mov	edx, DWORD PTR _imginf$[ebp+4]
	add	edx, ecx
	mov	DWORD PTR _imginf$[ebp+4], edx
; Line 793
	mov	eax, DWORD PTR _imginf$[ebp+20]
	neg	eax
	mov	DWORD PTR _imginf$[ebp+20], eax
$L31655:
; Line 796
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+8], 50462720		; 03020000H
	jne	SHORT $L31656
; Line 798
	mov	edx, DWORD PTR _srcimginf$[ebp]
	mov	eax, DWORD PTR [edx]
	and	eax, 16777216				; 01000000H
	test	eax, eax
	je	SHORT $L31657
; Line 802
	mov	ecx, DWORD PTR _context$[ebp]
	push	ecx
	lea	edx, DWORD PTR _imginf$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EncodePaletteImage@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@@Z ; ERIEncoder::EncodePaletteImage
	jmp	SHORT $L31653
$L31657:
; Line 808
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4], 131584		; 00020200H
	jne	SHORT $L31659
; Line 810
	mov	ecx, DWORD PTR _fdwFlags$[ebp]
	push	ecx
	mov	edx, DWORD PTR _context$[ebp]
	push	edx
	lea	eax, DWORD PTR _imginf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EncodeTrueColorImageII@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z ; ERIEncoder::EncodeTrueColorImageII
	jmp	SHORT $L31653
$L31659:
; Line 814
	mov	ecx, DWORD PTR _fdwFlags$[ebp]
	push	ecx
	mov	edx, DWORD PTR _context$[ebp]
	push	edx
	lea	eax, DWORD PTR _imginf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EncodeTrueColorImage@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z ; ERIEncoder::EncodeTrueColorImage
	jmp	SHORT $L31653
$L31656:
; Line 818
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+8], 1
	jne	SHORT $L31662
; Line 822
	mov	edx, DWORD PTR _fdwFlags$[ebp]
	push	edx
	mov	eax, DWORD PTR _context$[ebp]
	push	eax
	lea	ecx, DWORD PTR _imginf$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EncodeTrueColorImageDCT@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z ; ERIEncoder::EncodeTrueColorImageDCT
	jmp	SHORT $L31653
$L31662:
; Line 825
	mov	eax, 1
$L31653:
; Line 826
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?EncodeImage@ERIEncoder@@UAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z ENDP ; ERIEncoder::EncodeImage
_parameter$ = 8
_this$ = -4
?SetCompressionParameter@ERIEncoder@@QAEXABUPARAMETER@1@@Z PROC NEAR ; ERIEncoder::SetCompressionParameter
; Line 833
	push	ebp
	mov	ebp, esp
	push	ecx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 834
	mov	esi, DWORD PTR _parameter$[ebp]
	mov	edi, DWORD PTR _this$[ebp]
	add	edi, 424				; 000001a8H
	mov	ecx, 8
	rep movsd
; Line 835
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?SetCompressionParameter@ERIEncoder@@QAEXABUPARAMETER@1@@Z ENDP ; ERIEncoder::SetCompressionParameter
_TEXT	ENDS
PUBLIC	?NormalizeWithDepth@ERIEncoder@@IAEXPAH0H@Z	; ERIEncoder::NormalizeWithDepth
EXTRN	?TryEncodeGammaCodes@RLHEncodeContext@@SAHPBHH@Z:NEAR ; RLHEncodeContext::TryEncodeGammaCodes
EXTRN	?DifferentialOperation@ERIEncoder@@IAEXJPAPAH@Z:NEAR ; ERIEncoder::DifferentialOperation
_TEXT	SEGMENT
_nTrySize$31755 = -100
_flgContinue$31770 = -72
_nOpCodeBits$31776 = -104
_imginf$ = 8
_context$ = 12
_fdwFlags$ = 16
_this$ = -108
_nAllBlockCount$ = -44
_nAllSampleCount$ = -12
_ptrNextOpCode$ = -24
_ptrNextDstBuf$ = -36
_pfnSampling$ = -8
_i$ = -32
_nWidthSamples$ = -4
_nPosX$ = -16
_nPosY$ = -20
_nAllBlockLines$ = -40
_nRestHeight$ = -28
_nColumnBufSamples$31701 = -56
_ptrSrcLine$31706 = -64
_nBlockHeight$31707 = -60
_nRestWidth$31710 = -48
_ptrNextLineBuf$31712 = -52
_nBlockWidth$31717 = -68
_ptrSrc$31729 = -80
_ptrDst$31730 = -76
_iBestClrOp$31740 = -88
_nBestSize$31741 = -96
_pClrOp$31742 = -84
_nClrOpCount$31743 = -92
?EncodeTrueColorImage@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z PROC NEAR ; ERIEncoder::EncodeTrueColorImage
; Line 843
	push	ebp
	mov	ebp, esp
	sub	esp, 112				; 00000070H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 849
	mov	eax, DWORD PTR _fdwFlags$[ebp]
	and	eax, 1
	test	eax, eax
	jne	SHORT $L31675
; Line 851
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [ecx+88]
	imul	eax, DWORD PTR [edx+92]
	mov	DWORD PTR _nAllBlockCount$[ebp], eax
; Line 852
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nAllBlockCount$[ebp]
	imul	edx, DWORD PTR [ecx+80]
	mov	DWORD PTR _nAllSampleCount$[ebp], edx
; Line 854
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+136], 0
	jne	SHORT $L31676
; Line 856
	mov	ecx, DWORD PTR _nAllBlockCount$[ebp]
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+136], eax
$L31676:
; Line 858
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+140], 0
	jne	SHORT $L31678
; Line 861
	mov	ecx, DWORD PTR _nAllSampleCount$[ebp]
	shl	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+140], eax
$L31678:
; Line 863
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+136]
	mov	DWORD PTR _ptrNextOpCode$[ebp], ecx
; Line 864
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+140]
	mov	DWORD PTR _ptrNextDstBuf$[ebp], eax
$L31675:
; Line 869
	mov	ecx, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	push	edx
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+116], eax
; Line 872
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx+16]
	shr	eax, 3
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+96], eax
; Line 874
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	mov	ecx, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+20]
	mov	DWORD PTR _pfnSampling$[ebp], eax
; Line 875
	cmp	DWORD PTR _pfnSampling$[ebp], 0
	jne	SHORT $L31683
; Line 876
	mov	eax, 1
	jmp	$L31670
$L31683:
; Line 881
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+88]
	mov	ecx, DWORD PTR [ecx+56]
	shl	edx, cl
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+84]
	imul	ecx, edx
	mov	DWORD PTR _nWidthSamples$[ebp], ecx
; Line 882
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31686
$L31687:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31686:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nWidthSamples$[ebp]
	jge	SHORT $L31688
; Line 884
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+104]
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR [edx+eax*4], 0
; Line 885
	jmp	SHORT $L31687
$L31688:
; Line 890
	mov	ecx, DWORD PTR _fdwFlags$[ebp]
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L31689
; Line 892
	push	32					; 00000020H
	push	16777216				; 01000000H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 893
	push	1
	push	0
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 895
	jmp	SHORT $L31690
$L31689:
; Line 897
	push	32					; 00000020H
	push	16777472				; 01000100H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
$L31690:
; Line 901
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+72]
	imul	ecx, DWORD PTR [eax+84]
	mov	DWORD PTR _nAllBlockLines$[ebp], ecx
; Line 902
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	DWORD PTR _nRestHeight$[ebp], eax
; Line 904
	mov	DWORD PTR _nPosY$[ebp], 0
	jmp	SHORT $L31698
$L31699:
	mov	ecx, DWORD PTR _nPosY$[ebp]
	add	ecx, 1
	mov	DWORD PTR _nPosY$[ebp], ecx
$L31698:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nPosY$[ebp]
	cmp	eax, DWORD PTR [edx+92]
	jge	$L31700
; Line 908
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [ecx+72]
	imul	eax, DWORD PTR [edx+84]
	mov	DWORD PTR _nColumnBufSamples$31701[ebp], eax
; Line 909
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31703
$L31704:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L31703:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nColumnBufSamples$31701[ebp]
	jge	SHORT $L31705
; Line 911
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx+edx*4], 0
; Line 912
	jmp	SHORT $L31704
$L31705:
; Line 916
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR _nPosY$[ebp]
	imul	edx, DWORD PTR [eax+20]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	shl	edx, cl
	mov	ecx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [ecx+4]
	add	eax, edx
	mov	DWORD PTR _ptrSrcLine$31706[ebp], eax
; Line 917
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR _nBlockHeight$31707[ebp], edx
; Line 918
	mov	eax, DWORD PTR _nBlockHeight$31707[ebp]
	cmp	eax, DWORD PTR _nRestHeight$[ebp]
	jle	SHORT $L31709
; Line 919
	mov	ecx, DWORD PTR _nRestHeight$[ebp]
	mov	DWORD PTR _nBlockHeight$31707[ebp], ecx
$L31709:
; Line 921
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR _nRestWidth$31710[ebp], eax
; Line 922
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+104]
	mov	DWORD PTR _ptrNextLineBuf$31712[ebp], edx
; Line 924
	mov	DWORD PTR _nPosX$[ebp], 0
	jmp	SHORT $L31714
$L31715:
	mov	eax, DWORD PTR _nPosX$[ebp]
	add	eax, 1
	mov	DWORD PTR _nPosX$[ebp], eax
$L31714:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nPosX$[ebp]
	cmp	edx, DWORD PTR [ecx+88]
	jge	$L31716
; Line 928
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	mov	DWORD PTR _nBlockWidth$31717[ebp], ecx
; Line 929
	mov	edx, DWORD PTR _nBlockWidth$31717[ebp]
	cmp	edx, DWORD PTR _nRestWidth$31710[ebp]
	jle	SHORT $L31719
; Line 930
	mov	eax, DWORD PTR _nRestWidth$31710[ebp]
	mov	DWORD PTR _nBlockWidth$31717[ebp], eax
$L31719:
; Line 932
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nBlockHeight$31707[ebp]
	cmp	edx, DWORD PTR [ecx+72]
	jl	SHORT $L31723
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nBlockWidth$31717[ebp]
	cmp	ecx, DWORD PTR [eax+72]
	jge	SHORT $L31722
$L31723:
; Line 934
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31725
$L31726:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31725:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+80]
	jge	SHORT $L31727
; Line 936
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+108]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [eax+ecx*4], 0
; Line 937
	jmp	SHORT $L31726
$L31727:
$L31722:
; Line 940
	mov	edx, DWORD PTR _nBlockHeight$31707[ebp]
	push	edx
	mov	eax, DWORD PTR _nBlockWidth$31717[ebp]
	push	eax
	mov	ecx, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	push	edx
	mov	eax, DWORD PTR _ptrSrcLine$31706[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR _pfnSampling$[ebp]
; Line 943
	lea	ecx, DWORD PTR _ptrNextLineBuf$31712[ebp]
	push	ecx
	mov	edx, DWORD PTR _nAllBlockLines$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DifferentialOperation@ERIEncoder@@IAEXJPAPAH@Z ; ERIEncoder::DifferentialOperation
; Line 946
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+84], 4
	jb	SHORT $L31728
; Line 948
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	imul	edx, 3
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	lea	edx, DWORD PTR [ecx+edx*4]
	mov	DWORD PTR _ptrSrc$31729[ebp], edx
; Line 949
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	imul	ecx, 3
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+112]
	lea	ecx, DWORD PTR [eax+ecx*4]
	mov	DWORD PTR _ptrDst$31730[ebp], ecx
; Line 950
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31732
$L31733:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31732:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+76]
	jge	SHORT $L31734
; Line 952
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrDst$31730[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _ptrSrc$31729[ebp]
	mov	ecx, DWORD PTR [esi+ecx*4]
	mov	DWORD PTR [eax+edx*4], ecx
; Line 953
	jmp	SHORT $L31733
$L31734:
$L31728:
; Line 957
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+84], 3
	jb	$L31735
; Line 969
	mov	DWORD PTR _iBestClrOp$31740[ebp], 0
; Line 972
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+108]
	push	eax
	call	?TryEncodeGammaCodes@RLHEncodeContext@@SAHPBHH@Z ; RLHEncodeContext::TryEncodeGammaCodes
	add	esp, 8
	mov	DWORD PTR _nBestSize$31741[ebp], eax
; Line 976
	mov	ecx, DWORD PTR _fdwFlags$[ebp]
	and	ecx, 48					; 00000030H
	shr	ecx, 4
	mov	DWORD PTR -112+[ebp], ecx
	cmp	DWORD PTR -112+[ebp], 0
	jb	SHORT $L31750
	cmp	DWORD PTR -112+[ebp], 1
	jbe	SHORT $L31748
	cmp	DWORD PTR -112+[ebp], 2
	je	SHORT $L31749
	jmp	SHORT $L31750
$L31748:
; Line 980
	mov	DWORD PTR _pClrOp$31742[ebp], OFFSET FLAT:_?iClrOpFull@?CL@??EncodeTrueColorImage@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z@4PBHB$S31737
; Line 981
	mov	DWORD PTR _nClrOpCount$31743[ebp], 9
; Line 982
	jmp	SHORT $L31745
$L31749:
; Line 984
	mov	DWORD PTR _pClrOp$31742[ebp], OFFSET FLAT:_?iClrOpHalf@?CL@??EncodeTrueColorImage@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z@4PBHB$S31739
; Line 985
	mov	DWORD PTR _nClrOpCount$31743[ebp], 3
; Line 986
	jmp	SHORT $L31745
$L31750:
; Line 989
	mov	DWORD PTR _nClrOpCount$31743[ebp], 0
$L31745:
; Line 992
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31752
$L31753:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31752:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nClrOpCount$31743[ebp]
	jae	SHORT $L31754
; Line 994
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _pClrOp$31742[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR ?m_pfnColorOperation@ERIEncoder@@1PAP81@AEXXZA[eax*4]
; Line 998
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	push	ecx
	call	?TryEncodeGammaCodes@RLHEncodeContext@@SAHPBHH@Z ; RLHEncodeContext::TryEncodeGammaCodes
	add	esp, 8
	mov	DWORD PTR _nTrySize$31755[ebp], eax
; Line 999
	mov	edx, DWORD PTR _nTrySize$31755[ebp]
	cmp	edx, DWORD PTR _nBestSize$31741[ebp]
	jge	SHORT $L31756
; Line 1001
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pClrOp$31742[ebp]
	mov	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _iBestClrOp$31740[ebp], edx
; Line 1002
	mov	eax, DWORD PTR _nTrySize$31755[ebp]
	mov	DWORD PTR _nBestSize$31741[ebp], eax
$L31756:
; Line 1004
	jmp	SHORT $L31753
$L31754:
; Line 1007
	mov	ecx, DWORD PTR _fdwFlags$[ebp]
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L31757
; Line 1008
	push	4
	mov	edx, DWORD PTR _iBestClrOp$31740[ebp]
	shl	edx, 28					; 0000001cH
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1009
	jmp	SHORT $L31759
$L31757:
; Line 1010
	mov	eax, DWORD PTR _iBestClrOp$31740[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _ptrNextOpCode$[ebp]
	mov	BYTE PTR [ecx], al
	mov	edx, DWORD PTR _ptrNextOpCode$[ebp]
	add	edx, 1
	mov	DWORD PTR _ptrNextOpCode$[ebp], edx
$L31759:
; Line 1013
	mov	ecx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _iBestClrOp$31740[ebp]
	call	DWORD PTR ?m_pfnColorOperation@ERIEncoder@@1PAP81@AEXXZA[eax*4]
; Line 1015
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+112]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?NormalizeWithDepth@ERIEncoder@@IAEXPAH0H@Z ; ERIEncoder::NormalizeWithDepth
; Line 1017
	jmp	SHORT $L31761
$L31735:
; Line 1022
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+112]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?NormalizeWithDepth@ERIEncoder@@IAEXPAH0H@Z ; ERIEncoder::NormalizeWithDepth
$L31761:
; Line 1024
	mov	ecx, DWORD PTR _fdwFlags$[ebp]
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L31762
; Line 1029
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+80]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?EncodeGammaCodes@RLHEncodeContext@@QAEHPBHH@Z ; RLHEncodeContext::EncodeGammaCodes
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	eax, DWORD PTR [ecx+80]
	jge	SHORT $L31764
; Line 1031
	mov	eax, 1
	jmp	$L31670
$L31764:
; Line 1034
	jmp	SHORT $L31765
$L31762:
; Line 1038
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31767
$L31768:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31767:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+80]
	jae	SHORT $L31769
; Line 1040
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+112]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _ptrNextDstBuf$[ebp]
	mov	esi, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+esi*4]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1041
	jmp	SHORT $L31768
$L31769:
; Line 1042
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _ptrNextDstBuf$[ebp]
	lea	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _ptrNextDstBuf$[ebp], ecx
$L31765:
; Line 1046
	mov	edx, DWORD PTR _nPosX$[ebp]
	push	edx
	mov	eax, DWORD PTR _nPosY$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+28]
	mov	DWORD PTR _flgContinue$31770[ebp], eax
; Line 1047
	cmp	DWORD PTR _flgContinue$31770[ebp], 0
	je	SHORT $L31771
; Line 1048
	mov	eax, DWORD PTR _flgContinue$31770[ebp]
	jmp	$L31670
$L31771:
; Line 1051
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+96]
	mov	ecx, DWORD PTR [ecx+56]
	shl	edx, cl
	mov	eax, DWORD PTR _ptrSrcLine$31706[ebp]
	add	eax, edx
	mov	DWORD PTR _ptrSrcLine$31706[ebp], eax
; Line 1052
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nRestWidth$31710[ebp]
	sub	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR _nRestWidth$31710[ebp], edx
; Line 1053
	jmp	$L31715
$L31716:
; Line 1055
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nRestHeight$[ebp]
	sub	ecx, DWORD PTR [eax+72]
	mov	DWORD PTR _nRestHeight$[ebp], ecx
; Line 1056
	jmp	$L31699
$L31700:
; Line 1059
	mov	edx, DWORD PTR _fdwFlags$[ebp]
	and	edx, 1
	test	edx, edx
	jne	$L31774
; Line 1061
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+84], 3
	jb	SHORT $L31775
; Line 1066
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+4], 131328		; 00020100H
	jne	SHORT $L31777
; Line 1067
	mov	DWORD PTR _nOpCodeBits$31776[ebp], 4
; Line 1068
	jmp	SHORT $L31778
$L31777:
; Line 1069
	mov	DWORD PTR _nOpCodeBits$31776[ebp], 6
$L31778:
; Line 1071
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31780
$L31781:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31780:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nAllBlockCount$[ebp]
	jge	SHORT $L31782
; Line 1074
	mov	ecx, DWORD PTR _nOpCodeBits$31776[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+136]
	mov	ecx, DWORD PTR _i$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [eax+ecx]
	shl	edx, 24					; 00000018H
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1075
	jmp	SHORT $L31781
$L31782:
$L31775:
; Line 1077
	push	1
	push	0
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1081
	mov	eax, DWORD PTR _nAllSampleCount$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+140]
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?EncodeGammaCodes@RLHEncodeContext@@QAEHPBHH@Z ; RLHEncodeContext::EncodeGammaCodes
	cmp	eax, DWORD PTR _nAllSampleCount$[ebp]
	jge	SHORT $L31785
; Line 1083
	mov	eax, 1
	jmp	SHORT $L31670
$L31785:
$L31774:
; Line 1087
	mov	ecx, DWORD PTR _context$[ebp]
	call	?Flushout@RLHEncodeContext@@QAEHXZ	; RLHEncodeContext::Flushout
	test	eax, eax
	je	SHORT $L31786
; Line 1088
	mov	eax, 1
	jmp	SHORT $L31670
$L31786:
; Line 1090
	xor	eax, eax
$L31670:
; Line 1091
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?EncodeTrueColorImage@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z ENDP ; ERIEncoder::EncodeTrueColorImage
_TEXT	ENDS
EXTRN	?OutAHuffmanCode@RLHEncodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@H@Z:NEAR ; RLHEncodeContext::OutAHuffmanCode
EXTRN	?EncodeERINACodes@RLHEncodeContext@@QAEHPBHH@Z:NEAR ; RLHEncodeContext::EncodeERINACodes
EXTRN	?EncodeERINACodesSBZL@RLHEncodeContext@@QAEHPBCH@Z:NEAR ; RLHEncodeContext::EncodeERINACodesSBZL
EXTRN	?DecideOperationCode@ERIEncoder@@IAEKHJPAPAH@Z:NEAR ; ERIEncoder::DecideOperationCode
_TEXT	SEGMENT
_imginf$ = 8
_context$ = 12
_fdwFlags$ = 16
_this$ = -80
_nAllBlockCount$ = -44
_nAllSampleCount$ = -12
_ptrNextOpCode$ = -24
_ptrNextDstBuf$ = -36
_pfnSampling$ = -8
_i$ = -32
_nWidthSamples$ = -4
_nPosX$ = -16
_nPosY$ = -20
_nAllBlockLines$ = -40
_nRestHeight$ = -28
_nColumnBufSamples$31823 = -56
_ptrSrcLine$31828 = -64
_nBlockHeight$31829 = -60
_nRestWidth$31832 = -48
_ptrNextLineBuf$31834 = -52
_nBlockWidth$31839 = -68
_dwOpCode$31850 = -72
_flgContinue$31861 = -76
?EncodeTrueColorImageII@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z PROC NEAR ; ERIEncoder::EncodeTrueColorImageII
; Line 1099
	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1105
	mov	eax, DWORD PTR _fdwFlags$[ebp]
	and	eax, 1
	test	eax, eax
	jne	SHORT $L31796
; Line 1107
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [ecx+88]
	imul	eax, DWORD PTR [edx+92]
	mov	DWORD PTR _nAllBlockCount$[ebp], eax
; Line 1108
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nAllBlockCount$[ebp]
	imul	edx, DWORD PTR [ecx+80]
	mov	DWORD PTR _nAllSampleCount$[ebp], edx
; Line 1110
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+136], 0
	jne	SHORT $L31797
; Line 1112
	mov	ecx, DWORD PTR _nAllBlockCount$[ebp]
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+136], eax
$L31797:
; Line 1114
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+140], 0
	jne	SHORT $L31799
; Line 1117
	mov	ecx, DWORD PTR _nAllSampleCount$[ebp]
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+140], eax
$L31799:
; Line 1119
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+136]
	mov	DWORD PTR _ptrNextOpCode$[ebp], ecx
; Line 1120
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+140]
	mov	DWORD PTR _ptrNextDstBuf$[ebp], eax
$L31796:
; Line 1124
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+144]
	call	?Initialize@ERINA_HUFFMAN_TREE@@QAEXXZ	; ERINA_HUFFMAN_TREE::Initialize
; Line 1125
	mov	ecx, DWORD PTR _context$[ebp]
	call	?PrepareToEncodeERINACode@RLHEncodeContext@@QAEXXZ ; RLHEncodeContext::PrepareToEncodeERINACode
; Line 1129
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	mov	ecx, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+16]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+116], eax
; Line 1132
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx+16]
	shr	eax, 3
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+96], eax
; Line 1134
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	mov	ecx, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+20]
	mov	DWORD PTR _pfnSampling$[ebp], eax
; Line 1135
	cmp	DWORD PTR _pfnSampling$[ebp], 0
	jne	SHORT $L31805
; Line 1136
	mov	eax, 1
	jmp	$L31791
$L31805:
; Line 1141
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+88]
	mov	ecx, DWORD PTR [ecx+56]
	shl	edx, cl
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+84]
	imul	ecx, edx
	mov	DWORD PTR _nWidthSamples$[ebp], ecx
; Line 1142
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31808
$L31809:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31808:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nWidthSamples$[ebp]
	jge	SHORT $L31810
; Line 1144
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+104]
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR [edx+eax*4], 0
; Line 1145
	jmp	SHORT $L31809
$L31810:
; Line 1150
	mov	ecx, DWORD PTR _fdwFlags$[ebp]
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L31811
; Line 1152
	push	32					; 00000020H
	push	134217736				; 08000008H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1153
	push	1
	push	0
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1155
	jmp	SHORT $L31812
$L31811:
; Line 1157
	push	32					; 00000020H
	push	134217992				; 08000108H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
$L31812:
; Line 1161
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+72]
	imul	ecx, DWORD PTR [eax+84]
	mov	DWORD PTR _nAllBlockLines$[ebp], ecx
; Line 1162
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	DWORD PTR _nRestHeight$[ebp], eax
; Line 1164
	mov	DWORD PTR _nPosY$[ebp], 0
	jmp	SHORT $L31820
$L31821:
	mov	ecx, DWORD PTR _nPosY$[ebp]
	add	ecx, 1
	mov	DWORD PTR _nPosY$[ebp], ecx
$L31820:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nPosY$[ebp]
	cmp	eax, DWORD PTR [edx+92]
	jge	$L31822
; Line 1168
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [ecx+72]
	imul	eax, DWORD PTR [edx+84]
	mov	DWORD PTR _nColumnBufSamples$31823[ebp], eax
; Line 1169
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31825
$L31826:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L31825:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nColumnBufSamples$31823[ebp]
	jge	SHORT $L31827
; Line 1171
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx+edx*4], 0
; Line 1172
	jmp	SHORT $L31826
$L31827:
; Line 1176
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR _nPosY$[ebp]
	imul	edx, DWORD PTR [eax+20]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	shl	edx, cl
	mov	ecx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [ecx+4]
	add	eax, edx
	mov	DWORD PTR _ptrSrcLine$31828[ebp], eax
; Line 1177
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR _nBlockHeight$31829[ebp], edx
; Line 1178
	mov	eax, DWORD PTR _nBlockHeight$31829[ebp]
	cmp	eax, DWORD PTR _nRestHeight$[ebp]
	jle	SHORT $L31831
; Line 1179
	mov	ecx, DWORD PTR _nRestHeight$[ebp]
	mov	DWORD PTR _nBlockHeight$31829[ebp], ecx
$L31831:
; Line 1181
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR _nRestWidth$31832[ebp], eax
; Line 1182
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+104]
	mov	DWORD PTR _ptrNextLineBuf$31834[ebp], edx
; Line 1184
	mov	DWORD PTR _nPosX$[ebp], 0
	jmp	SHORT $L31836
$L31837:
	mov	eax, DWORD PTR _nPosX$[ebp]
	add	eax, 1
	mov	DWORD PTR _nPosX$[ebp], eax
$L31836:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nPosX$[ebp]
	cmp	edx, DWORD PTR [ecx+88]
	jge	$L31838
; Line 1188
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	mov	DWORD PTR _nBlockWidth$31839[ebp], ecx
; Line 1189
	mov	edx, DWORD PTR _nBlockWidth$31839[ebp]
	cmp	edx, DWORD PTR _nRestWidth$31832[ebp]
	jle	SHORT $L31841
; Line 1190
	mov	eax, DWORD PTR _nRestWidth$31832[ebp]
	mov	DWORD PTR _nBlockWidth$31839[ebp], eax
$L31841:
; Line 1192
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nBlockHeight$31829[ebp]
	cmp	edx, DWORD PTR [ecx+72]
	jl	SHORT $L31845
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nBlockWidth$31839[ebp]
	cmp	ecx, DWORD PTR [eax+72]
	jge	SHORT $L31844
$L31845:
; Line 1194
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31847
$L31848:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31847:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+80]
	jge	SHORT $L31849
; Line 1196
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+108]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [eax+ecx*4], 0
; Line 1197
	jmp	SHORT $L31848
$L31849:
$L31844:
; Line 1200
	mov	edx, DWORD PTR _nBlockHeight$31829[ebp]
	push	edx
	mov	eax, DWORD PTR _nBlockWidth$31839[ebp]
	push	eax
	mov	ecx, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	push	edx
	mov	eax, DWORD PTR _ptrSrcLine$31828[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR _pfnSampling$[ebp]
; Line 1206
	lea	ecx, DWORD PTR _ptrNextLineBuf$31834[ebp]
	push	ecx
	mov	edx, DWORD PTR _nAllBlockLines$[ebp]
	push	edx
	mov	eax, DWORD PTR _fdwFlags$[ebp]
	and	eax, 48					; 00000030H
	shr	eax, 4
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DecideOperationCode@ERIEncoder@@IAEKHJPAPAH@Z ; ERIEncoder::DecideOperationCode
	mov	DWORD PTR _dwOpCode$31850[ebp], eax
; Line 1209
	mov	ecx, DWORD PTR _fdwFlags$[ebp]
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L31851
; Line 1211
	mov	edx, DWORD PTR _dwOpCode$31850[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+144]
	push	ecx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutAHuffmanCode@RLHEncodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@H@Z ; RLHEncodeContext::OutAHuffmanCode
; Line 1215
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+80]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?EncodeERINACodes@RLHEncodeContext@@QAEHPBHH@Z ; RLHEncodeContext::EncodeERINACodes
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	eax, DWORD PTR [ecx+80]
	jge	SHORT $L31853
; Line 1217
	mov	eax, 1
	jmp	$L31791
$L31853:
; Line 1220
	jmp	SHORT $L31854
$L31851:
; Line 1222
	mov	edx, DWORD PTR _ptrNextOpCode$[ebp]
	mov	al, BYTE PTR _dwOpCode$31850[ebp]
	mov	BYTE PTR [edx], al
	mov	ecx, DWORD PTR _ptrNextOpCode$[ebp]
	add	ecx, 1
	mov	DWORD PTR _ptrNextOpCode$[ebp], ecx
; Line 1225
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31857
$L31858:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31857:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+80]
	jae	SHORT $L31859
; Line 1227
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+108]
	mov	ecx, DWORD PTR _ptrNextDstBuf$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [eax+edx*4]
	mov	BYTE PTR [ecx], al
; Line 1228
	jmp	SHORT $L31858
$L31859:
; Line 1229
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _ptrNextDstBuf$[ebp]
	add	edx, DWORD PTR [ecx+80]
	mov	DWORD PTR _ptrNextDstBuf$[ebp], edx
$L31854:
; Line 1233
	mov	eax, DWORD PTR _nPosX$[ebp]
	push	eax
	mov	ecx, DWORD PTR _nPosY$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [eax+28]
	mov	DWORD PTR _flgContinue$31861[ebp], eax
; Line 1234
	cmp	DWORD PTR _flgContinue$31861[ebp], 0
	je	SHORT $L31862
; Line 1235
	mov	eax, DWORD PTR _flgContinue$31861[ebp]
	jmp	$L31791
$L31862:
; Line 1238
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [ecx+96]
	mov	ecx, DWORD PTR [edx+56]
	shl	eax, cl
	mov	ecx, DWORD PTR _ptrSrcLine$31828[ebp]
	add	ecx, eax
	mov	DWORD PTR _ptrSrcLine$31828[ebp], ecx
; Line 1239
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nRestWidth$31832[ebp]
	sub	eax, DWORD PTR [edx+72]
	mov	DWORD PTR _nRestWidth$31832[ebp], eax
; Line 1240
	jmp	$L31837
$L31838:
; Line 1242
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nRestHeight$[ebp]
	sub	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR _nRestHeight$[ebp], edx
; Line 1243
	jmp	$L31821
$L31822:
; Line 1246
	mov	eax, DWORD PTR _fdwFlags$[ebp]
	and	eax, 1
	test	eax, eax
	jne	SHORT $L31865
; Line 1250
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31867
$L31868:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L31867:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nAllBlockCount$[ebp]
	jge	SHORT $L31869
; Line 1252
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+136]
	mov	edx, DWORD PTR _i$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [ecx+edx]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+144]
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutAHuffmanCode@RLHEncodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@H@Z ; RLHEncodeContext::OutAHuffmanCode
; Line 1253
	jmp	SHORT $L31868
$L31869:
; Line 1254
	push	1
	push	0
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1258
	mov	eax, DWORD PTR _nAllSampleCount$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+140]
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?EncodeERINACodesSBZL@RLHEncodeContext@@QAEHPBCH@Z ; RLHEncodeContext::EncodeERINACodesSBZL
	cmp	eax, DWORD PTR _nAllSampleCount$[ebp]
	jge	SHORT $L31872
; Line 1260
	mov	eax, 1
	jmp	SHORT $L31791
$L31872:
$L31865:
; Line 1264
	mov	ecx, DWORD PTR _context$[ebp]
	call	?Flushout@RLHEncodeContext@@QAEHXZ	; RLHEncodeContext::Flushout
	test	eax, eax
	je	SHORT $L31873
; Line 1265
	mov	eax, 1
	jmp	SHORT $L31791
$L31873:
; Line 1267
	xor	eax, eax
$L31791:
; Line 1268
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?EncodeTrueColorImageII@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z ENDP ; ERIEncoder::EncodeTrueColorImageII
_TEXT	ENDS
EXTRN	?EncodeERINACodes256@RLHEncodeContext@@QAEHPBEH@Z:NEAR ; RLHEncodeContext::EncodeERINACodes256
_TEXT	SEGMENT
_imginf$ = 8
_context$ = 12
_this$ = -28
_nLine$ = -4
_nHeight$ = -16
_ptrSrcLine$ = -20
_nImageWidth$ = -12
_nBytesPerLine$ = -8
_flgContinue$31898 = -24
?EncodePaletteImage@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@@Z PROC NEAR ; ERIEncoder::EncodePaletteImage
; Line 1275
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1278
	mov	eax, DWORD PTR _imginf$[ebp]
	cmp	DWORD PTR [eax+16], 8
	je	SHORT $L31878
; Line 1279
	mov	eax, 1
	jmp	$L31877
$L31878:
; Line 1282
	push	32					; 00000020H
	push	33554432				; 02000000H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1285
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+12], -4			; fffffffcH
	jne	SHORT $L31879
; Line 1286
	mov	ecx, DWORD PTR _context$[ebp]
	call	?PrepareToEncodeERINACode@RLHEncodeContext@@QAEXXZ ; RLHEncodeContext::PrepareToEncodeERINACode
; Line 1287
	jmp	SHORT $L31880
$L31879:
; Line 1288
	mov	ecx, DWORD PTR _context$[ebp]
	call	?PrepareToEncodeRLMTFGCode@RLHEncodeContext@@QAEXXZ ; RLHEncodeContext::PrepareToEncodeRLMTFGCode
$L31880:
; Line 1292
	mov	edx, DWORD PTR _imginf$[ebp]
	cmp	DWORD PTR [edx+12], 0
	jge	SHORT $L31883
; Line 1293
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	neg	ecx
	mov	DWORD PTR _nHeight$[ebp], ecx
; Line 1294
	jmp	SHORT $L31884
$L31883:
; Line 1295
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	DWORD PTR _nHeight$[ebp], eax
$L31884:
; Line 1297
	mov	ecx, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR _ptrSrcLine$[ebp], edx
; Line 1298
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR _nImageWidth$[ebp], ecx
; Line 1299
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	DWORD PTR _nBytesPerLine$[ebp], eax
; Line 1301
	mov	DWORD PTR _nLine$[ebp], 0
	jmp	SHORT $L31889
$L31890:
	mov	ecx, DWORD PTR _nLine$[ebp]
	add	ecx, 1
	mov	DWORD PTR _nLine$[ebp], ecx
$L31889:
	mov	edx, DWORD PTR _nLine$[ebp]
	cmp	edx, DWORD PTR _nHeight$[ebp]
	jge	SHORT $L31891
; Line 1303
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+12], -4			; fffffffcH
	jne	SHORT $L31892
; Line 1308
	mov	ecx, DWORD PTR _nImageWidth$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrSrcLine$[ebp]
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?EncodeERINACodes256@RLHEncodeContext@@QAEHPBEH@Z ; RLHEncodeContext::EncodeERINACodes256
	cmp	eax, DWORD PTR _nImageWidth$[ebp]
	jge	SHORT $L31894
; Line 1310
	mov	eax, 1
	jmp	SHORT $L31877
$L31894:
; Line 1313
	jmp	SHORT $L31895
$L31892:
; Line 1318
	mov	eax, DWORD PTR _nImageWidth$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrSrcLine$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?EncodeRLMTFGCodes@RLHEncodeContext@@QAEHPAEH@Z ; RLHEncodeContext::EncodeRLMTFGCodes
	cmp	eax, DWORD PTR _nImageWidth$[ebp]
	jge	SHORT $L31897
; Line 1320
	mov	eax, 1
	jmp	SHORT $L31877
$L31897:
$L31895:
; Line 1325
	mov	edx, DWORD PTR _nLine$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+32]
	mov	DWORD PTR _flgContinue$31898[ebp], eax
; Line 1326
	cmp	DWORD PTR _flgContinue$31898[ebp], 0
	je	SHORT $L31899
; Line 1327
	mov	eax, DWORD PTR _flgContinue$31898[ebp]
	jmp	SHORT $L31877
$L31899:
; Line 1329
	mov	eax, DWORD PTR _ptrSrcLine$[ebp]
	add	eax, DWORD PTR _nBytesPerLine$[ebp]
	mov	DWORD PTR _ptrSrcLine$[ebp], eax
; Line 1330
	jmp	SHORT $L31890
$L31891:
; Line 1332
	mov	ecx, DWORD PTR _context$[ebp]
	call	?Flushout@RLHEncodeContext@@QAEHXZ	; RLHEncodeContext::Flushout
	test	eax, eax
	je	SHORT $L31900
; Line 1333
	mov	eax, 1
	jmp	SHORT $L31877
$L31900:
; Line 1335
	xor	eax, eax
$L31877:
; Line 1336
	mov	esp, ebp
	pop	ebp
	ret	8
?EncodePaletteImage@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@@Z ENDP ; ERIEncoder::EncodePaletteImage
_dwBitsPerPixel$ = 12
_this$ = -4
?GetChannelDepth@ERIEncoder@@MAEHKK@Z PROC NEAR		; ERIEncoder::GetChannelDepth
; Line 1343
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1344
	cmp	DWORD PTR _dwBitsPerPixel$[ebp], 16	; 00000010H
	jne	SHORT $L31905
; Line 1345
	mov	eax, 5
	jmp	SHORT $L31904
$L31905:
; Line 1347
	mov	eax, 8
$L31904:
; Line 1348
	mov	esp, ebp
	pop	ebp
	ret	8
?GetChannelDepth@ERIEncoder@@MAEHKK@Z ENDP		; ERIEncoder::GetChannelDepth
_ptrDst$ = 8
_ptrSrc$ = 12
_nCount$ = 16
_this$ = -16
_i$31913 = -4
_sc$31922 = -8
_i$31924 = -12
?NormalizeWithDepth@ERIEncoder@@IAEXPAH0H@Z PROC NEAR	; ERIEncoder::NormalizeWithDepth
; Line 1354
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1355
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+116], 8
	jne	SHORT $L31912
; Line 1357
	mov	DWORD PTR _i$31913[ebp], 0
$L31915:
; Line 1358
	cmp	DWORD PTR _nCount$[ebp], 2
	jl	SHORT $L31916
; Line 1360
	mov	ecx, DWORD PTR _nCount$[ebp]
	sub	ecx, 2
	mov	DWORD PTR _nCount$[ebp], ecx
; Line 1361
	mov	edx, DWORD PTR _i$31913[ebp]
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	movsx	ecx, BYTE PTR [eax+edx*4]
	mov	edx, DWORD PTR _i$31913[ebp]
	mov	eax, DWORD PTR _ptrDst$[ebp]
	mov	DWORD PTR [eax+edx*4], ecx
; Line 1362
	mov	ecx, DWORD PTR _i$31913[ebp]
	mov	edx, DWORD PTR _ptrSrc$[ebp]
	movsx	eax, BYTE PTR [edx+ecx*4+4]
	mov	ecx, DWORD PTR _i$31913[ebp]
	mov	edx, DWORD PTR _ptrDst$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 1363
	mov	eax, DWORD PTR _i$31913[ebp]
	add	eax, 2
	mov	DWORD PTR _i$31913[ebp], eax
; Line 1364
	jmp	SHORT $L31915
$L31916:
; Line 1365
	cmp	DWORD PTR _nCount$[ebp], 0
	jle	SHORT $L31919
; Line 1367
	mov	ecx, DWORD PTR _i$31913[ebp]
	mov	edx, DWORD PTR _ptrSrc$[ebp]
	movsx	eax, BYTE PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _i$31913[ebp]
	mov	edx, DWORD PTR _ptrDst$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
$L31919:
; Line 1370
	jmp	SHORT $L31921
$L31912:
; Line 1372
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, 32					; 00000020H
	sub	ecx, DWORD PTR [eax+116]
	mov	DWORD PTR _sc$31922[ebp], ecx
; Line 1373
	mov	DWORD PTR _i$31924[ebp], 0
	jmp	SHORT $L31925
$L31926:
	mov	edx, DWORD PTR _i$31924[ebp]
	add	edx, 1
	mov	DWORD PTR _i$31924[ebp], edx
$L31925:
	mov	eax, DWORD PTR _i$31924[ebp]
	cmp	eax, DWORD PTR _nCount$[ebp]
	jge	SHORT $L31927
; Line 1375
	mov	ecx, DWORD PTR _i$31924[ebp]
	mov	edx, DWORD PTR _ptrSrc$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _sc$31922[ebp]
	shl	eax, cl
	mov	ecx, DWORD PTR _sc$31922[ebp]
	sar	eax, cl
	mov	ecx, DWORD PTR _i$31924[ebp]
	mov	edx, DWORD PTR _ptrDst$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1376
	jmp	SHORT $L31926
$L31927:
$L31921:
; Line 1378
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?NormalizeWithDepth@ERIEncoder@@IAEXPAH0H@Z ENDP	; ERIEncoder::NormalizeWithDepth
_TEXT	ENDS
PUBLIC	?SamplingGray8@ERIEncoder@@IAEXPAEJHH@Z		; ERIEncoder::SamplingGray8
PUBLIC	?SamplingRGB16@ERIEncoder@@IAEXPAEJHH@Z		; ERIEncoder::SamplingRGB16
PUBLIC	?SamplingRGB24@ERIEncoder@@IAEXPAEJHH@Z		; ERIEncoder::SamplingRGB24
PUBLIC	?SamplingRGBA32@ERIEncoder@@IAEXPAEJHH@Z	; ERIEncoder::SamplingRGBA32
_TEXT	SEGMENT
_dwBitsPerPixel$ = 12
_this$ = -4
?GetSamplingFunc@ERIEncoder@@MAEP81@AEXPAEJHH@ZKK@Z PROC NEAR ; ERIEncoder::GetSamplingFunc
; Line 1385
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1386
	mov	eax, DWORD PTR _dwBitsPerPixel$[ebp]
	shr	eax, 3
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+96], eax
; Line 1388
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	DWORD PTR -8+[ebp], eax
	cmp	DWORD PTR -8+[ebp], 1
	je	SHORT $L31937
	cmp	DWORD PTR -8+[ebp], 2
	je	SHORT $L31944
	cmp	DWORD PTR -8+[ebp], 67108865		; 04000001H
	je	SHORT $L31942
	jmp	SHORT $L31934
$L31937:
; Line 1391
	cmp	DWORD PTR _dwBitsPerPixel$[ebp], 16	; 00000010H
	jne	SHORT $L31938
; Line 1393
	mov	eax, OFFSET FLAT:?SamplingRGB16@ERIEncoder@@IAEXPAEJHH@Z ; ERIEncoder::SamplingRGB16
	jmp	SHORT $L31931
$L31938:
; Line 1396
	cmp	DWORD PTR _dwBitsPerPixel$[ebp], 24	; 00000018H
	je	SHORT $L31941
	cmp	DWORD PTR _dwBitsPerPixel$[ebp], 32	; 00000020H
	jne	SHORT $L31940
$L31941:
; Line 1398
	mov	eax, OFFSET FLAT:?SamplingRGB24@ERIEncoder@@IAEXPAEJHH@Z ; ERIEncoder::SamplingRGB24
	jmp	SHORT $L31931
$L31940:
; Line 1400
	jmp	SHORT $L31934
$L31942:
; Line 1403
	cmp	DWORD PTR _dwBitsPerPixel$[ebp], 32	; 00000020H
	jne	SHORT $L31943
; Line 1404
	mov	eax, OFFSET FLAT:?SamplingRGBA32@ERIEncoder@@IAEXPAEJHH@Z ; ERIEncoder::SamplingRGBA32
	jmp	SHORT $L31931
$L31943:
; Line 1405
	jmp	SHORT $L31934
$L31944:
; Line 1408
	cmp	DWORD PTR _dwBitsPerPixel$[ebp], 8
	jne	SHORT $L31945
; Line 1409
	mov	eax, OFFSET FLAT:?SamplingGray8@ERIEncoder@@IAEXPAEJHH@Z ; ERIEncoder::SamplingGray8
	jmp	SHORT $L31931
$L31945:
$L31934:
; Line 1412
	xor	eax, eax
$L31931:
; Line 1413
	mov	esp, ebp
	pop	ebp
	ret	8
?GetSamplingFunc@ERIEncoder@@MAEP81@AEXPAEJHH@ZKK@Z ENDP ; ERIEncoder::GetSamplingFunc
_ptrSrc$ = 8
_nLineBytes$ = 12
_nWidth$ = 16
_nHeight$ = 20
_this$ = -12
_ptrNextBuf$ = -4
_x$31956 = -8
?SamplingGray8@ERIEncoder@@IAEXPAEJHH@Z PROC NEAR	; ERIEncoder::SamplingGray8
; Line 1420
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1421
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	mov	DWORD PTR _ptrNextBuf$[ebp], ecx
$L31954:
; Line 1423
	mov	edx, DWORD PTR _nHeight$[ebp]
	mov	eax, DWORD PTR _nHeight$[ebp]
	sub	eax, 1
	mov	DWORD PTR _nHeight$[ebp], eax
	test	edx, edx
	je	SHORT $L31955
; Line 1425
	mov	DWORD PTR _x$31956[ebp], 0
	jmp	SHORT $L31957
$L31958:
	mov	ecx, DWORD PTR _x$31956[ebp]
	add	ecx, 1
	mov	DWORD PTR _x$31956[ebp], ecx
$L31957:
	mov	edx, DWORD PTR _x$31956[ebp]
	cmp	edx, DWORD PTR _nWidth$[ebp]
	jge	SHORT $L31959
; Line 1427
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	add	eax, DWORD PTR _x$31956[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	mov	edx, DWORD PTR _x$31956[ebp]
	mov	eax, DWORD PTR _ptrNextBuf$[ebp]
	mov	DWORD PTR [eax+edx*4], ecx
; Line 1428
	jmp	SHORT $L31958
$L31959:
; Line 1429
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	mov	eax, DWORD PTR _ptrNextBuf$[ebp]
	lea	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _ptrNextBuf$[ebp], ecx
; Line 1430
	mov	edx, DWORD PTR _ptrSrc$[ebp]
	add	edx, DWORD PTR _nLineBytes$[ebp]
	mov	DWORD PTR _ptrSrc$[ebp], edx
; Line 1431
	jmp	SHORT $L31954
$L31955:
; Line 1432
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?SamplingGray8@ERIEncoder@@IAEXPAEJHH@Z ENDP		; ERIEncoder::SamplingGray8
_ptrSrc$ = 8
_nLineBytes$ = 12
_nWidth$ = 16
_nHeight$ = 20
_this$ = -32
_ptrSrcLine$ = -12
_ptrBufLine$ = -4
_nBlockSamples$ = -8
_ptrNextBuf$31973 = -20
_pwSrc$31974 = -24
_i$31976 = -16
_p$31980 = -28
?SamplingRGB16@ERIEncoder@@IAEXPAEJHH@Z PROC NEAR	; ERIEncoder::SamplingRGB16
; Line 1439
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1440
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	mov	DWORD PTR _ptrSrcLine$[ebp], eax
; Line 1441
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	DWORD PTR _ptrBufLine$[ebp], edx
; Line 1442
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	mov	DWORD PTR _nBlockSamples$[ebp], ecx
$L31971:
; Line 1444
	mov	edx, DWORD PTR _nHeight$[ebp]
	mov	eax, DWORD PTR _nHeight$[ebp]
	sub	eax, 1
	mov	DWORD PTR _nHeight$[ebp], eax
	test	edx, edx
	je	$L31972
; Line 1446
	mov	ecx, DWORD PTR _ptrBufLine$[ebp]
	mov	DWORD PTR _ptrNextBuf$31973[ebp], ecx
; Line 1447
	mov	edx, DWORD PTR _ptrSrcLine$[ebp]
	mov	DWORD PTR _pwSrc$31974[ebp], edx
; Line 1449
	mov	eax, DWORD PTR _nWidth$[ebp]
	mov	DWORD PTR _i$31976[ebp], eax
$L31978:
; Line 1450
	mov	ecx, DWORD PTR _i$31976[ebp]
	mov	edx, DWORD PTR _i$31976[ebp]
	sub	edx, 1
	mov	DWORD PTR _i$31976[ebp], edx
	test	ecx, ecx
	je	SHORT $L31979
; Line 1452
	mov	eax, DWORD PTR _pwSrc$31974[ebp]
	mov	cx, WORD PTR [eax]
	mov	WORD PTR _p$31980[ebp], cx
	mov	edx, DWORD PTR _pwSrc$31974[ebp]
	add	edx, 2
	mov	DWORD PTR _pwSrc$31974[ebp], edx
; Line 1453
	mov	eax, DWORD PTR _p$31980[ebp]
	and	eax, 65535				; 0000ffffH
	and	eax, 31					; 0000001fH
	mov	ecx, DWORD PTR _ptrNextBuf$31973[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1454
	mov	edx, DWORD PTR _p$31980[ebp]
	and	edx, 65535				; 0000ffffH
	sar	edx, 5
	and	edx, 31					; 0000001fH
	mov	eax, DWORD PTR _nBlockSamples$[ebp]
	mov	ecx, DWORD PTR _ptrNextBuf$31973[ebp]
	mov	DWORD PTR [ecx+eax*4], edx
; Line 1455
	mov	edx, DWORD PTR _p$31980[ebp]
	and	edx, 65535				; 0000ffffH
	sar	edx, 10					; 0000000aH
	and	edx, 31					; 0000001fH
	mov	eax, DWORD PTR _nBlockSamples$[ebp]
	shl	eax, 1
	mov	ecx, DWORD PTR _ptrNextBuf$31973[ebp]
	mov	DWORD PTR [ecx+eax*4], edx
; Line 1456
	mov	edx, DWORD PTR _ptrNextBuf$31973[ebp]
	add	edx, 4
	mov	DWORD PTR _ptrNextBuf$31973[ebp], edx
; Line 1457
	jmp	SHORT $L31978
$L31979:
; Line 1458
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	mov	edx, DWORD PTR _ptrBufLine$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _ptrBufLine$[ebp], eax
; Line 1459
	mov	ecx, DWORD PTR _ptrSrcLine$[ebp]
	add	ecx, DWORD PTR _nLineBytes$[ebp]
	mov	DWORD PTR _ptrSrcLine$[ebp], ecx
; Line 1460
	jmp	$L31971
$L31972:
; Line 1461
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?SamplingRGB16@ERIEncoder@@IAEXPAEJHH@Z ENDP		; ERIEncoder::SamplingRGB16
_ptrSrc$ = 8
_nLineBytes$ = 12
_nWidth$ = 16
_nHeight$ = 20
_this$ = -28
_ptrSrcLine$ = -16
_ptrBufLine$ = -4
_nBytesPerPixel$ = -12
_nBlockSamples$ = -8
_ptrNextBuf$31996 = -24
_i$31997 = -20
?SamplingRGB24@ERIEncoder@@IAEXPAEJHH@Z PROC NEAR	; ERIEncoder::SamplingRGB24
; Line 1468
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1469
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	mov	DWORD PTR _ptrSrcLine$[ebp], eax
; Line 1470
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	DWORD PTR _ptrBufLine$[ebp], edx
; Line 1471
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+96]
	mov	DWORD PTR _nBytesPerPixel$[ebp], ecx
; Line 1472
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	mov	DWORD PTR _nBlockSamples$[ebp], eax
$L31994:
; Line 1474
	mov	ecx, DWORD PTR _nHeight$[ebp]
	mov	edx, DWORD PTR _nHeight$[ebp]
	sub	edx, 1
	mov	DWORD PTR _nHeight$[ebp], edx
	test	ecx, ecx
	je	$L31995
; Line 1476
	mov	eax, DWORD PTR _ptrBufLine$[ebp]
	mov	DWORD PTR _ptrNextBuf$31996[ebp], eax
; Line 1477
	mov	ecx, DWORD PTR _ptrSrcLine$[ebp]
	mov	DWORD PTR _ptrSrc$[ebp], ecx
; Line 1479
	mov	edx, DWORD PTR _nWidth$[ebp]
	mov	DWORD PTR _i$31997[ebp], edx
$L31999:
; Line 1480
	mov	eax, DWORD PTR _i$31997[ebp]
	mov	ecx, DWORD PTR _i$31997[ebp]
	sub	ecx, 1
	mov	DWORD PTR _i$31997[ebp], ecx
	test	eax, eax
	je	SHORT $L32000
; Line 1482
	mov	edx, DWORD PTR _ptrSrc$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx]
	mov	ecx, DWORD PTR _ptrNextBuf$31996[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1483
	mov	edx, DWORD PTR _ptrSrc$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+1]
	mov	ecx, DWORD PTR _nBlockSamples$[ebp]
	mov	edx, DWORD PTR _ptrNextBuf$31996[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1484
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+2]
	mov	edx, DWORD PTR _nBlockSamples$[ebp]
	shl	edx, 1
	mov	eax, DWORD PTR _ptrNextBuf$31996[ebp]
	mov	DWORD PTR [eax+edx*4], ecx
; Line 1485
	mov	ecx, DWORD PTR _ptrSrc$[ebp]
	add	ecx, DWORD PTR _nBytesPerPixel$[ebp]
	mov	DWORD PTR _ptrSrc$[ebp], ecx
; Line 1486
	mov	edx, DWORD PTR _ptrNextBuf$31996[ebp]
	add	edx, 4
	mov	DWORD PTR _ptrNextBuf$31996[ebp], edx
; Line 1487
	jmp	SHORT $L31999
$L32000:
; Line 1488
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	mov	edx, DWORD PTR _ptrBufLine$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _ptrBufLine$[ebp], eax
; Line 1489
	mov	ecx, DWORD PTR _ptrSrcLine$[ebp]
	add	ecx, DWORD PTR _nLineBytes$[ebp]
	mov	DWORD PTR _ptrSrcLine$[ebp], ecx
; Line 1490
	jmp	$L31994
$L31995:
; Line 1491
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?SamplingRGB24@ERIEncoder@@IAEXPAEJHH@Z ENDP		; ERIEncoder::SamplingRGB24
_ptrSrc$ = 8
_nLineBytes$ = 12
_nWidth$ = 16
_nHeight$ = 20
_this$ = -32
_ptrSrcLine$ = -20
_ptrBufLine$ = -8
_nBytesPerPixel$ = -16
_nBlockSamples$ = -12
_nBlockSamplesX3$ = -4
_ptrNextBuf$32017 = -28
_i$32018 = -24
?SamplingRGBA32@ERIEncoder@@IAEXPAEJHH@Z PROC NEAR	; ERIEncoder::SamplingRGBA32
; Line 1498
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1499
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	mov	DWORD PTR _ptrSrcLine$[ebp], eax
; Line 1500
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	DWORD PTR _ptrBufLine$[ebp], edx
; Line 1501
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+96]
	mov	DWORD PTR _nBytesPerPixel$[ebp], ecx
; Line 1502
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	mov	DWORD PTR _nBlockSamples$[ebp], eax
; Line 1503
	mov	ecx, DWORD PTR _nBlockSamples$[ebp]
	imul	ecx, 3
	mov	DWORD PTR _nBlockSamplesX3$[ebp], ecx
$L32015:
; Line 1505
	mov	edx, DWORD PTR _nHeight$[ebp]
	mov	eax, DWORD PTR _nHeight$[ebp]
	sub	eax, 1
	mov	DWORD PTR _nHeight$[ebp], eax
	test	edx, edx
	je	$L32016
; Line 1507
	mov	ecx, DWORD PTR _ptrBufLine$[ebp]
	mov	DWORD PTR _ptrNextBuf$32017[ebp], ecx
; Line 1508
	mov	edx, DWORD PTR _ptrSrcLine$[ebp]
	mov	DWORD PTR _ptrSrc$[ebp], edx
; Line 1510
	mov	eax, DWORD PTR _nWidth$[ebp]
	mov	DWORD PTR _i$32018[ebp], eax
$L32020:
; Line 1511
	mov	ecx, DWORD PTR _i$32018[ebp]
	mov	edx, DWORD PTR _i$32018[ebp]
	sub	edx, 1
	mov	DWORD PTR _i$32018[ebp], edx
	test	ecx, ecx
	je	SHORT $L32021
; Line 1513
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	mov	edx, DWORD PTR _ptrNextBuf$32017[ebp]
	mov	DWORD PTR [edx], ecx
; Line 1514
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+1]
	mov	edx, DWORD PTR _nBlockSamples$[ebp]
	mov	eax, DWORD PTR _ptrNextBuf$32017[ebp]
	mov	DWORD PTR [eax+edx*4], ecx
; Line 1515
	mov	ecx, DWORD PTR _ptrSrc$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx+2]
	mov	eax, DWORD PTR _nBlockSamples$[ebp]
	shl	eax, 1
	mov	ecx, DWORD PTR _ptrNextBuf$32017[ebp]
	mov	DWORD PTR [ecx+eax*4], edx
; Line 1516
	mov	edx, DWORD PTR _ptrSrc$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+3]
	mov	ecx, DWORD PTR _nBlockSamplesX3$[ebp]
	mov	edx, DWORD PTR _ptrNextBuf$32017[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1517
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	add	eax, 4
	mov	DWORD PTR _ptrSrc$[ebp], eax
; Line 1518
	mov	ecx, DWORD PTR _ptrNextBuf$32017[ebp]
	add	ecx, 4
	mov	DWORD PTR _ptrNextBuf$32017[ebp], ecx
; Line 1519
	jmp	SHORT $L32020
$L32021:
; Line 1520
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	mov	ecx, DWORD PTR _ptrBufLine$[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _ptrBufLine$[ebp], edx
; Line 1521
	mov	eax, DWORD PTR _ptrSrcLine$[ebp]
	add	eax, DWORD PTR _nLineBytes$[ebp]
	mov	DWORD PTR _ptrSrcLine$[ebp], eax
; Line 1522
	jmp	$L32015
$L32016:
; Line 1523
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?SamplingRGBA32@ERIEncoder@@IAEXPAEJHH@Z ENDP		; ERIEncoder::SamplingRGBA32
_this$ = -20
_ptrArrange$ = -16
_i$ = -12
_x$ = -4
_y$ = -8
?InitializeZigZagTable@ERIEncoder@@IAEXXZ PROC NEAR	; ERIEncoder::InitializeZigZagTable
; Line 1529
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1531
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	shl	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	DWORD PTR _ptrArrange$[ebp], eax
; Line 1532
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _ptrArrange$[ebp]
	mov	DWORD PTR [edx+120], eax
; Line 1534
	mov	DWORD PTR _i$[ebp], 0
; Line 1535
	mov	DWORD PTR _x$[ebp], 0
	mov	DWORD PTR _y$[ebp], 0
$L32032:
$L32035:
; Line 1540
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _y$[ebp]
	imul	edx, DWORD PTR [ecx+72]
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, edx
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _ptrArrange$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
; Line 1541
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+76]
	jb	SHORT $L32037
; Line 1542
	jmp	$L32024
$L32037:
; Line 1543
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 1
	mov	DWORD PTR _x$[ebp], eax
; Line 1544
	mov	ecx, DWORD PTR _y$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _y$[ebp], ecx
; Line 1545
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _x$[ebp]
	cmp	eax, DWORD PTR [edx+72]
	jl	SHORT $L32039
; Line 1547
	mov	ecx, DWORD PTR _x$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _x$[ebp], ecx
; Line 1548
	mov	edx, DWORD PTR _y$[ebp]
	add	edx, 2
	mov	DWORD PTR _y$[ebp], edx
; Line 1549
	jmp	SHORT $L32036
$L32039:
; Line 1551
	cmp	DWORD PTR _y$[ebp], 0
	jge	SHORT $L32041
; Line 1553
	mov	DWORD PTR _y$[ebp], 0
; Line 1554
	jmp	SHORT $L32036
$L32041:
; Line 1556
	jmp	SHORT $L32035
$L32036:
$L32043:
; Line 1559
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	imul	ecx, DWORD PTR [eax+72]
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, ecx
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrArrange$[ebp]
	mov	DWORD PTR [ecx+eax*4], edx
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 1560
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+76]
	jb	SHORT $L32045
; Line 1561
	jmp	SHORT $L32024
$L32045:
; Line 1562
	mov	edx, DWORD PTR _y$[ebp]
	add	edx, 1
	mov	DWORD PTR _y$[ebp], edx
; Line 1563
	mov	eax, DWORD PTR _x$[ebp]
	sub	eax, 1
	mov	DWORD PTR _x$[ebp], eax
; Line 1564
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _y$[ebp]
	cmp	edx, DWORD PTR [ecx+72]
	jl	SHORT $L32047
; Line 1566
	mov	eax, DWORD PTR _y$[ebp]
	sub	eax, 1
	mov	DWORD PTR _y$[ebp], eax
; Line 1567
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 2
	mov	DWORD PTR _x$[ebp], ecx
; Line 1568
	jmp	SHORT $L32044
$L32047:
; Line 1570
	cmp	DWORD PTR _x$[ebp], 0
	jge	SHORT $L32049
; Line 1572
	mov	DWORD PTR _x$[ebp], 0
; Line 1573
	jmp	SHORT $L32044
$L32049:
; Line 1575
	jmp	SHORT $L32043
$L32044:
; Line 1576
	jmp	$L32032
$L32024:
; Line 1577
	mov	esp, ebp
	pop	ebp
	ret	0
?InitializeZigZagTable@ERIEncoder@@IAEXXZ ENDP		; ERIEncoder::InitializeZigZagTable
_TEXT	ENDS
PUBLIC	?ConvertRGBtoYUV@ERIEncoder@@IAEXXZ		; ERIEncoder::ConvertRGBtoYUV
PUBLIC	?PerformDCT@ERIEncoder@@IAEXXZ			; ERIEncoder::PerformDCT
PUBLIC	?ArrangeAndQuantumize@ERIEncoder@@IAEXQAE@Z	; ERIEncoder::ArrangeAndQuantumize
EXTRN	_eriRoundR32ToInt:NEAR
CONST	SEGMENT
$T32583	DD	043800000r			; 256
CONST	ENDS
_TEXT	SEGMENT
_imginf$ = 8
_context$ = 12
_fdwFlags$ = 16
_this$ = -180
_bytScaleCode$ = -8
_nAllBlockCount$ = -52
_nAllSampleCount$ = -16
_ptrNextScaleCode$ = -32
_ptrNextDCCode$ = -24
_ptrNextDstBuf$ = -48
_nBytes$32068 = -56
_pfnSampling$ = -4
_nScaleDC$ = -12
_i$ = -40
_j$ = -44
_nPosX$ = -20
_nPosY$ = -28
_nRestHeight$ = -36
_ptrSrcLine$32098 = -72
_nBlockHeightA$32099 = -68
_nBlockHeightB$32100 = -64
_nRestWidth$32106 = -60
_nBlockWidthL$32116 = -76
_nBlockWidthR$32117 = -96
_widthBlock$32123 = -112
_heightBlock$32124 = -128
_dwOffsetAddr$32125 = -92
_ptrBuf$32129 = -148
_nLastVal$32137 = -152
_ptrBuf$32142 = -160
_nACSamples$32143 = -156
_ptrBuf$32153 = -168
_nACSamples$32154 = -164
_ptrNextDst$32161 = -172
_flgContinue$32168 = -132
_nDCSampleCount$32173 = -176
?EncodeTrueColorImageDCT@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z PROC NEAR ; ERIEncoder::EncodeTrueColorImageDCT
; Line 1585
	push	ebp
	mov	ebp, esp
	sub	esp, 196				; 000000c4H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1590
	lea	eax, DWORD PTR _bytScaleCode$[ebp]
	mov	DWORD PTR _ptrNextScaleCode$[ebp], eax
; Line 1593
	mov	ecx, DWORD PTR _fdwFlags$[ebp]
	and	ecx, 1
	test	ecx, ecx
	jne	$L32061
; Line 1595
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+88]
	imul	ecx, DWORD PTR [eax+92]
	mov	DWORD PTR _nAllBlockCount$[ebp], ecx
; Line 1597
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	sub	eax, 1
	mov	ecx, DWORD PTR _nAllBlockCount$[ebp]
	imul	ecx, eax
	mov	edx, DWORD PTR _this$[ebp]
	imul	ecx, DWORD PTR [edx+148]
	mov	DWORD PTR _nAllSampleCount$[ebp], ecx
; Line 1599
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+136], 0
	jne	SHORT $L32062
; Line 1602
	mov	ecx, DWORD PTR _nAllBlockCount$[ebp]
	shl	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+136], eax
$L32062:
; Line 1604
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+420], 0
	jne	SHORT $L32064
; Line 1607
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nAllBlockCount$[ebp]
	imul	edx, DWORD PTR [ecx+148]
	shl	edx, 2
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+420], eax
$L32064:
; Line 1609
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+140], 0
	jne	SHORT $L32067
; Line 1611
	mov	eax, DWORD PTR _nAllSampleCount$[ebp]
	mov	DWORD PTR _nBytes$32068[ebp], eax
; Line 1612
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+12], -4			; fffffffcH
	je	SHORT $L32070
; Line 1614
	mov	edx, DWORD PTR _nBytes$32068[ebp]
	shl	edx, 2
	mov	DWORD PTR _nBytes$32068[ebp], edx
$L32070:
; Line 1616
	mov	eax, DWORD PTR _nBytes$32068[ebp]
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+140], eax
$L32067:
; Line 1618
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+136]
	mov	DWORD PTR _ptrNextScaleCode$[ebp], eax
; Line 1619
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+420]
	mov	DWORD PTR _ptrNextDCCode$[ebp], edx
; Line 1620
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	mov	DWORD PTR _ptrNextDstBuf$[ebp], ecx
$L32061:
; Line 1624
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+144]
	call	?Initialize@ERINA_HUFFMAN_TREE@@QAEXXZ	; ERINA_HUFFMAN_TREE::Initialize
; Line 1625
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+12], -4			; fffffffcH
	jne	SHORT $L32074
; Line 1627
	mov	ecx, DWORD PTR _context$[ebp]
	call	?PrepareToEncodeERINACode@RLHEncodeContext@@QAEXXZ ; RLHEncodeContext::PrepareToEncodeERINACode
$L32074:
; Line 1631
	mov	ecx, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	shr	edx, 3
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+96], edx
; Line 1633
	mov	ecx, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	push	edx
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [eax+24]
	mov	DWORD PTR _pfnSampling$[ebp], eax
; Line 1634
	cmp	DWORD PTR _pfnSampling$[ebp], 0
	jne	SHORT $L32076
; Line 1635
	mov	eax, 1
	jmp	$L32054
$L32076:
; Line 1640
	mov	ecx, DWORD PTR _fdwFlags$[ebp]
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L32077
; Line 1642
	push	32					; 00000020H
	push	150994952				; 09000008H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1644
	jmp	SHORT $L32078
$L32077:
; Line 1646
	push	32					; 00000020H
	push	150995208				; 09000108H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
$L32078:
; Line 1648
	push	1
	push	0
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1652
	mov	edx, DWORD PTR _this$[ebp]
	fld	DWORD PTR [edx+424]
	fmul	DWORD PTR $T32583
	push	ecx
	fstp	DWORD PTR [esp]
	call	_eriRoundR32ToInt
	add	esp, 4
	sub	eax, 1
	mov	DWORD PTR _nScaleDC$[ebp], eax
; Line 1653
	cmp	DWORD PTR _nScaleDC$[ebp], 0
	jge	SHORT $L32080
; Line 1655
	mov	DWORD PTR _nScaleDC$[ebp], 0
; Line 1657
	jmp	SHORT $L32081
$L32080:
	cmp	DWORD PTR _nScaleDC$[ebp], 255		; 000000ffH
	jle	SHORT $L32082
; Line 1659
	mov	DWORD PTR _nScaleDC$[ebp], 255		; 000000ffH
$L32082:
$L32081:
; Line 1661
	mov	eax, DWORD PTR _nScaleDC$[ebp]
	add	eax, 1
	mov	DWORD PTR -184+[ebp], eax
	fild	DWORD PTR -184+[ebp]
	fstp	DWORD PTR -188+[ebp]
	fld	DWORD PTR -188+[ebp]
	fdiv	DWORD PTR $T32583
	mov	ecx, DWORD PTR _this$[ebp]
	fstp	DWORD PTR [ecx+424]
; Line 1662
	push	8
	mov	edx, DWORD PTR _nScaleDC$[ebp]
	shl	edx, 24					; 00000018H
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1665
	mov	eax, DWORD PTR _this$[ebp]
	fld	DWORD PTR [eax+428]
	fmul	DWORD PTR $T32583
	push	ecx
	fstp	DWORD PTR [esp]
	call	_eriRoundR32ToInt
	add	esp, 4
	sub	eax, 1
	mov	DWORD PTR _nScaleDC$[ebp], eax
; Line 1666
	cmp	DWORD PTR _nScaleDC$[ebp], 0
	jge	SHORT $L32084
; Line 1668
	mov	DWORD PTR _nScaleDC$[ebp], 0
; Line 1670
	jmp	SHORT $L32085
$L32084:
	cmp	DWORD PTR _nScaleDC$[ebp], 255		; 000000ffH
	jle	SHORT $L32086
; Line 1672
	mov	DWORD PTR _nScaleDC$[ebp], 255		; 000000ffH
$L32086:
$L32085:
; Line 1674
	mov	ecx, DWORD PTR _nScaleDC$[ebp]
	add	ecx, 1
	mov	DWORD PTR -192+[ebp], ecx
	fild	DWORD PTR -192+[ebp]
	fstp	DWORD PTR -196+[ebp]
	fld	DWORD PTR -196+[ebp]
	fdiv	DWORD PTR $T32583
	mov	edx, DWORD PTR _this$[ebp]
	fstp	DWORD PTR [edx+428]
; Line 1675
	push	8
	mov	eax, DWORD PTR _nScaleDC$[ebp]
	shl	eax, 24					; 00000018H
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1679
	mov	ecx, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR _nRestHeight$[ebp], edx
; Line 1681
	mov	DWORD PTR _nPosY$[ebp], 0
	jmp	SHORT $L32095
$L32096:
	mov	eax, DWORD PTR _nPosY$[ebp]
	add	eax, 1
	mov	DWORD PTR _nPosY$[ebp], eax
$L32095:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nPosY$[ebp]
	cmp	edx, DWORD PTR [ecx+92]
	jge	$L32097
; Line 1688
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR _nPosY$[ebp]
	imul	edx, DWORD PTR [eax+20]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	add	ecx, 1
	shl	edx, cl
	mov	ecx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [ecx+4]
	add	eax, edx
	mov	DWORD PTR _ptrSrcLine$32098[ebp], eax
; Line 1690
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR _nBlockHeightA$32099[ebp], edx
; Line 1691
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	mov	DWORD PTR _nBlockHeightB$32100[ebp], ecx
; Line 1692
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nRestHeight$[ebp]
	cmp	eax, DWORD PTR [edx+72]
	jge	SHORT $L32102
; Line 1694
	mov	ecx, DWORD PTR _nRestHeight$[ebp]
	mov	DWORD PTR _nBlockHeightA$32099[ebp], ecx
; Line 1695
	mov	DWORD PTR _nBlockHeightB$32100[ebp], 0
; Line 1697
	jmp	SHORT $L32103
$L32102:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	shl	eax, 1
	cmp	DWORD PTR _nRestHeight$[ebp], eax
	jge	SHORT $L32105
; Line 1699
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nRestHeight$[ebp]
	sub	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR _nBlockHeightB$32100[ebp], edx
$L32105:
$L32103:
; Line 1702
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR _nRestWidth$32106[ebp], ecx
; Line 1705
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32109
$L32110:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32109:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+148]
	jge	SHORT $L32111
; Line 1707
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+edx*4+356], 0
; Line 1708
	jmp	SHORT $L32110
$L32111:
; Line 1710
	mov	DWORD PTR _nPosX$[ebp], 0
	jmp	SHORT $L32113
$L32114:
	mov	ecx, DWORD PTR _nPosX$[ebp]
	add	ecx, 1
	mov	DWORD PTR _nPosX$[ebp], ecx
$L32113:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nPosX$[ebp]
	cmp	eax, DWORD PTR [edx+88]
	jge	$L32115
; Line 1714
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR _nBlockWidthL$32116[ebp], edx
; Line 1715
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	mov	DWORD PTR _nBlockWidthR$32117[ebp], ecx
; Line 1716
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nRestWidth$32106[ebp]
	cmp	eax, DWORD PTR [edx+72]
	jge	SHORT $L32119
; Line 1718
	mov	ecx, DWORD PTR _nRestWidth$32106[ebp]
	mov	DWORD PTR _nBlockWidthL$32116[ebp], ecx
; Line 1719
	mov	DWORD PTR _nBlockWidthR$32117[ebp], 0
; Line 1721
	jmp	SHORT $L32120
$L32119:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	shl	eax, 1
	cmp	DWORD PTR _nRestWidth$32106[ebp], eax
	jge	SHORT $L32122
; Line 1723
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nRestWidth$32106[ebp]
	sub	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR _nBlockWidthR$32117[ebp], edx
$L32122:
$L32120:
; Line 1728
	mov	eax, DWORD PTR _nBlockWidthL$32116[ebp]
	mov	DWORD PTR _widthBlock$32123[ebp], eax
	mov	ecx, DWORD PTR _nBlockWidthR$32117[ebp]
	mov	DWORD PTR _widthBlock$32123[ebp+4], ecx
; Line 1729
	mov	edx, DWORD PTR _nBlockWidthL$32116[ebp]
	mov	DWORD PTR _widthBlock$32123[ebp+8], edx
; Line 1730
	mov	eax, DWORD PTR _nBlockWidthR$32117[ebp]
	mov	DWORD PTR _widthBlock$32123[ebp+12], eax
; Line 1733
	mov	ecx, DWORD PTR _nBlockHeightA$32099[ebp]
	mov	DWORD PTR _heightBlock$32124[ebp], ecx
	mov	edx, DWORD PTR _nBlockHeightA$32099[ebp]
	mov	DWORD PTR _heightBlock$32124[ebp+4], edx
; Line 1734
	mov	eax, DWORD PTR _nBlockHeightB$32100[ebp]
	mov	DWORD PTR _heightBlock$32124[ebp+8], eax
; Line 1735
	mov	ecx, DWORD PTR _nBlockHeightB$32100[ebp]
	mov	DWORD PTR _heightBlock$32124[ebp+12], ecx
; Line 1738
	mov	DWORD PTR _dwOffsetAddr$32125[ebp], 0
; Line 1739
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+72]
	imul	ecx, DWORD PTR [eax+96]
	mov	DWORD PTR _dwOffsetAddr$32125[ebp+4], ecx
; Line 1740
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	ecx, DWORD PTR [edx+72]
	imul	ecx, DWORD PTR [eax+20]
	mov	DWORD PTR _dwOffsetAddr$32125[ebp+8], ecx
; Line 1743
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+72]
	imul	ecx, DWORD PTR [eax+96]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR [edx+72]
	imul	edx, DWORD PTR [eax+20]
	add	ecx, edx
	mov	DWORD PTR _dwOffsetAddr$32125[ebp+12], ecx
; Line 1746
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32126
$L32127:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32126:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L32128
; Line 1749
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32130
$L32131:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L32130:
	cmp	DWORD PTR _j$[ebp], 4
	jge	SHORT $L32132
; Line 1751
	mov	edx, DWORD PTR _j$[ebp]
	shl	edx, 4
	mov	eax, DWORD PTR _this$[ebp]
	lea	ecx, DWORD PTR [eax+edx+156]
	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _ptrBuf$32129[ebp+edx*4], ecx
; Line 1752
	jmp	SHORT $L32131
$L32132:
; Line 1755
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _heightBlock$32124[ebp+edx*4]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _widthBlock$32123[ebp+ecx*4]
	push	edx
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrSrcLine$32098[ebp]
	add	eax, DWORD PTR _dwOffsetAddr$32125[ebp+edx*4]
	push	eax
	lea	ecx, DWORD PTR _ptrBuf$32129[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR _pfnSampling$[ebp]
; Line 1756
	jmp	SHORT $L32127
$L32128:
; Line 1759
	mov	ecx, DWORD PTR _this$[ebp]
	call	?ConvertRGBtoYUV@ERIEncoder@@IAEXXZ	; ERIEncoder::ConvertRGBtoYUV
; Line 1762
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+152]
; Line 1765
	mov	ecx, DWORD PTR _this$[ebp]
	call	?PerformDCT@ERIEncoder@@IAEXXZ		; ERIEncoder::PerformDCT
; Line 1768
	mov	eax, DWORD PTR _ptrNextScaleCode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?ArrangeAndQuantumize@ERIEncoder@@IAEXQAE@Z ; ERIEncoder::ArrangeAndQuantumize
; Line 1771
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32134
$L32135:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32134:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+148]
	jge	SHORT $L32136
; Line 1773
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR [edx+eax*4]
	mov	DWORD PTR _nLastVal$32137[ebp], ecx
; Line 1774
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+108]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4]
	sub	eax, DWORD PTR [esi+edx*4+356]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1775
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nLastVal$32137[ebp]
	mov	DWORD PTR [eax+edx*4+356], ecx
; Line 1776
	jmp	SHORT $L32135
$L32136:
; Line 1779
	mov	edx, DWORD PTR _fdwFlags$[ebp]
	and	edx, 1
	test	edx, edx
	je	$L32138
; Line 1785
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+148]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+108]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	call	?EncodeGammaCodes@RLHEncodeContext@@QAEHPBHH@Z ; RLHEncodeContext::EncodeGammaCodes
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	eax, DWORD PTR [ecx+148]
	jge	SHORT $L32141
; Line 1787
	mov	eax, 1
	jmp	$L32054
$L32141:
; Line 1792
	mov	edx, DWORD PTR _ptrNextScaleCode$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+144]
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutAHuffmanCode@RLHEncodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@H@Z ; RLHEncodeContext::OutAHuffmanCode
; Line 1794
	mov	eax, DWORD PTR _ptrNextScaleCode$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+1]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+144]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutAHuffmanCode@RLHEncodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@H@Z ; RLHEncodeContext::OutAHuffmanCode
; Line 1796
	mov	ecx, DWORD PTR _ptrNextScaleCode$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx+2]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+144]
	push	ecx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutAHuffmanCode@RLHEncodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@H@Z ; RLHEncodeContext::OutAHuffmanCode
; Line 1798
	mov	edx, DWORD PTR _ptrNextScaleCode$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+3]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+144]
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutAHuffmanCode@RLHEncodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@H@Z ; RLHEncodeContext::OutAHuffmanCode
; Line 1801
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+148]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+108]
	lea	ecx, DWORD PTR [eax+ecx*4]
	mov	DWORD PTR _ptrBuf$32142[ebp], ecx
; Line 1802
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	sub	eax, 1
	mov	ecx, DWORD PTR _this$[ebp]
	imul	eax, DWORD PTR [ecx+148]
	mov	DWORD PTR _nACSamples$32143[ebp], eax
; Line 1803
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+12], -4			; fffffffcH
	jne	SHORT $L32144
; Line 1806
	mov	eax, DWORD PTR _nACSamples$32143[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrBuf$32142[ebp]
	push	ecx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?EncodeERINACodes@RLHEncodeContext@@QAEHPBHH@Z ; RLHEncodeContext::EncodeERINACodes
	cmp	eax, DWORD PTR _nACSamples$32143[ebp]
	jge	SHORT $L32145
; Line 1808
	mov	eax, 1
	jmp	$L32054
$L32145:
; Line 1811
	jmp	SHORT $L32146
$L32144:
; Line 1814
	mov	edx, DWORD PTR _nACSamples$32143[ebp]
	push	edx
	mov	eax, DWORD PTR _ptrBuf$32142[ebp]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	call	?EncodeGammaCodes@RLHEncodeContext@@QAEHPBHH@Z ; RLHEncodeContext::EncodeGammaCodes
	cmp	eax, DWORD PTR _nACSamples$32143[ebp]
	jge	SHORT $L32147
; Line 1816
	mov	eax, 1
	jmp	$L32054
$L32147:
$L32146:
; Line 1820
	jmp	$L32148
$L32138:
; Line 1824
	mov	ecx, DWORD PTR _ptrNextScaleCode$[ebp]
	add	ecx, 4
	mov	DWORD PTR _ptrNextScaleCode$[ebp], ecx
; Line 1827
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32150
$L32151:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32150:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+148]
	jge	SHORT $L32152
; Line 1829
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+108]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _ptrNextDCCode$[ebp]
	mov	esi, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+esi*4]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1830
	jmp	SHORT $L32151
$L32152:
; Line 1831
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+148]
	mov	eax, DWORD PTR _ptrNextDCCode$[ebp]
	lea	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _ptrNextDCCode$[ebp], ecx
; Line 1834
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+148]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	lea	eax, DWORD PTR [edx+eax*4]
	mov	DWORD PTR _ptrBuf$32153[ebp], eax
; Line 1835
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	sub	edx, 1
	mov	eax, DWORD PTR _this$[ebp]
	imul	edx, DWORD PTR [eax+148]
	mov	DWORD PTR _nACSamples$32154[ebp], edx
; Line 1836
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+12], -4			; fffffffcH
	jne	SHORT $L32155
; Line 1838
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32156
$L32157:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32156:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nACSamples$32154[ebp]
	jge	SHORT $L32158
; Line 1840
	mov	ecx, DWORD PTR _ptrNextDstBuf$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrBuf$32153[ebp]
	mov	dl, BYTE PTR [eax+edx*4]
	mov	BYTE PTR [ecx], dl
; Line 1841
	jmp	SHORT $L32157
$L32158:
; Line 1842
	mov	eax, DWORD PTR _ptrNextDstBuf$[ebp]
	add	eax, DWORD PTR _nACSamples$32154[ebp]
	mov	DWORD PTR _ptrNextDstBuf$[ebp], eax
; Line 1844
	jmp	SHORT $L32160
$L32155:
; Line 1846
	mov	ecx, DWORD PTR _ptrNextDstBuf$[ebp]
	mov	DWORD PTR _ptrNextDst$32161[ebp], ecx
; Line 1847
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32163
$L32164:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32163:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nACSamples$32154[ebp]
	jge	SHORT $L32165
; Line 1849
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _ptrBuf$32153[ebp]
	movsx	eax, BYTE PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _ptrNextDst$32161[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1850
	jmp	SHORT $L32164
$L32165:
; Line 1851
	mov	eax, DWORD PTR _nACSamples$32154[ebp]
	mov	ecx, DWORD PTR _ptrNextDstBuf$[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _ptrNextDstBuf$[ebp], edx
$L32160:
$L32148:
; Line 1856
	mov	eax, DWORD PTR _nPosX$[ebp]
	push	eax
	mov	ecx, DWORD PTR _nPosY$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [eax+28]
	mov	DWORD PTR _flgContinue$32168[ebp], eax
; Line 1857
	cmp	DWORD PTR _flgContinue$32168[ebp], 0
	je	SHORT $L32169
; Line 1858
	mov	eax, DWORD PTR _flgContinue$32168[ebp]
	jmp	$L32054
$L32169:
; Line 1861
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+56]
	add	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+96]
	shl	eax, cl
	mov	ecx, DWORD PTR _ptrSrcLine$32098[ebp]
	add	ecx, eax
	mov	DWORD PTR _ptrSrcLine$32098[ebp], ecx
; Line 1862
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	shl	eax, 1
	mov	ecx, DWORD PTR _nRestWidth$32106[ebp]
	sub	ecx, eax
	mov	DWORD PTR _nRestWidth$32106[ebp], ecx
; Line 1863
	jmp	$L32114
$L32115:
; Line 1865
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	shl	eax, 1
	mov	ecx, DWORD PTR _nRestHeight$[ebp]
	sub	ecx, eax
	mov	DWORD PTR _nRestHeight$[ebp], ecx
; Line 1866
	jmp	$L32096
$L32097:
; Line 1869
	mov	edx, DWORD PTR _fdwFlags$[ebp]
	and	edx, 1
	test	edx, edx
	jne	$L32172
; Line 1873
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nAllBlockCount$[ebp]
	imul	ecx, DWORD PTR [eax+148]
	mov	DWORD PTR _nDCSampleCount$32173[ebp], ecx
; Line 1875
	mov	edx, DWORD PTR _nDCSampleCount$32173[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+420]
	push	ecx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?EncodeGammaCodes@RLHEncodeContext@@QAEHPBHH@Z ; RLHEncodeContext::EncodeGammaCodes
	cmp	eax, DWORD PTR _nDCSampleCount$32173[ebp]
	jge	SHORT $L32174
; Line 1877
	mov	eax, 1
	jmp	$L32054
$L32174:
; Line 1881
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32176
$L32177:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32176:
	mov	eax, DWORD PTR _nAllBlockCount$[ebp]
	shl	eax, 2
	cmp	DWORD PTR _i$[ebp], eax
	jge	SHORT $L32178
; Line 1884
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+136]
	mov	eax, DWORD PTR _i$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [edx+eax]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+144]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutAHuffmanCode@RLHEncodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@H@Z ; RLHEncodeContext::OutAHuffmanCode
; Line 1885
	jmp	SHORT $L32177
$L32178:
; Line 1888
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+12], -4			; fffffffcH
	jne	SHORT $L32179
; Line 1891
	mov	edx, DWORD PTR _nAllSampleCount$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	push	ecx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?EncodeERINACodesSBZL@RLHEncodeContext@@QAEHPBCH@Z ; RLHEncodeContext::EncodeERINACodesSBZL
	cmp	eax, DWORD PTR _nAllSampleCount$[ebp]
	jge	SHORT $L32182
; Line 1893
	mov	eax, 1
	jmp	SHORT $L32054
$L32182:
; Line 1896
	jmp	SHORT $L32183
$L32179:
; Line 1899
	mov	edx, DWORD PTR _nAllSampleCount$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	push	ecx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?EncodeGammaCodes@RLHEncodeContext@@QAEHPBHH@Z ; RLHEncodeContext::EncodeGammaCodes
	cmp	eax, DWORD PTR _nAllSampleCount$[ebp]
	jge	SHORT $L32185
; Line 1901
	mov	eax, 1
	jmp	SHORT $L32054
$L32185:
$L32183:
$L32172:
; Line 1906
	mov	ecx, DWORD PTR _context$[ebp]
	call	?Flushout@RLHEncodeContext@@QAEHXZ	; RLHEncodeContext::Flushout
	test	eax, eax
	je	SHORT $L32186
; Line 1907
	mov	eax, 1
	jmp	SHORT $L32054
$L32186:
; Line 1909
	xor	eax, eax
$L32054:
; Line 1910
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?EncodeTrueColorImageDCT@ERIEncoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z ENDP ; ERIEncoder::EncodeTrueColorImageDCT
_TEXT	ENDS
PUBLIC	?SamplingRGB24II@ERIEncoder@@IAEXQAPAMPAEJHH@Z	; ERIEncoder::SamplingRGB24II
PUBLIC	?SamplingRGBA32II@ERIEncoder@@IAEXQAPAMPAEJHH@Z	; ERIEncoder::SamplingRGBA32II
_TEXT	SEGMENT
_fdwFormatType$ = 8
_dwBitsPerPixel$ = 12
_this$ = -4
?GetSamplingFuncII@ERIEncoder@@MAEP81@AEXQAPAMPAEJHH@ZKK@Z PROC NEAR ; ERIEncoder::GetSamplingFuncII
; Line 1917
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1918
	cmp	DWORD PTR _dwBitsPerPixel$[ebp], 24	; 00000018H
	je	SHORT $L32191
	cmp	DWORD PTR _dwBitsPerPixel$[ebp], 32	; 00000020H
	je	SHORT $L32191
; Line 1920
	xor	eax, eax
	jmp	SHORT $L32190
$L32191:
; Line 1923
	mov	eax, DWORD PTR _fdwFormatType$[ebp]
	and	eax, 67108864				; 04000000H
	test	eax, eax
	je	SHORT $L32192
; Line 1925
	mov	eax, OFFSET FLAT:?SamplingRGBA32II@ERIEncoder@@IAEXQAPAMPAEJHH@Z ; ERIEncoder::SamplingRGBA32II
	jmp	SHORT $L32190
$L32192:
; Line 1929
	mov	eax, OFFSET FLAT:?SamplingRGB24II@ERIEncoder@@IAEXQAPAMPAEJHH@Z ; ERIEncoder::SamplingRGB24II
$L32190:
; Line 1931
	mov	esp, ebp
	pop	ebp
	ret	8
?GetSamplingFuncII@ERIEncoder@@MAEP81@AEXQAPAMPAEJHH@ZKK@Z ENDP ; ERIEncoder::GetSamplingFuncII
_TEXT	ENDS
PUBLIC	?FillOddArea@ERIEncoder@@IAEXPAMHHM@Z		; ERIEncoder::FillOddArea
CONST	SEGMENT
$T32584	DD	03f800000r			; 1
CONST	ENDS
_TEXT	SEGMENT
_ptrBuffer$ = 8
_ptrSrc$ = 12
_nLineBytes$ = 16
_nWidth$ = 20
_nHeight$ = 24
_this$ = -60
_rSum$ = -16
_nLineOffset$ = -28
_nBytesPerPixel$ = -20
_ptrSrcLine$ = -24
_y$ = -4
_nOffsetPos$32209 = -36
_ptrNextSrc$32210 = -32
_x$32211 = -40
_rValue$32215 = -52
_rDiv$32224 = -56
?SamplingRGB24II@ERIEncoder@@IAEXQAPAMPAEJHH@Z PROC NEAR ; ERIEncoder::SamplingRGB24II
; Line 1939
	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1942
	mov	DWORD PTR _rSum$[ebp], 0
	mov	DWORD PTR _rSum$[ebp+4], 0
; Line 1943
	mov	DWORD PTR _rSum$[ebp+8], 0
; Line 1944
	mov	DWORD PTR _nLineOffset$[ebp], 0
; Line 1945
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+96]
	mov	DWORD PTR _nBytesPerPixel$[ebp], ecx
; Line 1946
	mov	edx, DWORD PTR _ptrSrc$[ebp]
	mov	DWORD PTR _ptrSrcLine$[ebp], edx
; Line 1948
	mov	DWORD PTR _y$[ebp], 0
	jmp	SHORT $L32206
$L32207:
	mov	eax, DWORD PTR _y$[ebp]
	add	eax, 1
	mov	DWORD PTR _y$[ebp], eax
$L32206:
	mov	ecx, DWORD PTR _y$[ebp]
	cmp	ecx, DWORD PTR _nHeight$[ebp]
	jge	$L32208
; Line 1950
	mov	edx, DWORD PTR _nLineOffset$[ebp]
	mov	DWORD PTR _nOffsetPos$32209[ebp], edx
; Line 1951
	mov	eax, DWORD PTR _ptrSrcLine$[ebp]
	mov	DWORD PTR _ptrNextSrc$32210[ebp], eax
; Line 1953
	mov	DWORD PTR _x$32211[ebp], 0
	jmp	SHORT $L32212
$L32213:
	mov	ecx, DWORD PTR _x$32211[ebp]
	add	ecx, 1
	mov	DWORD PTR _x$32211[ebp], ecx
$L32212:
	mov	edx, DWORD PTR _x$32211[ebp]
	cmp	edx, DWORD PTR _nWidth$[ebp]
	jge	$L32214
; Line 1956
	mov	eax, DWORD PTR _ptrNextSrc$32210[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	mov	DWORD PTR -64+[ebp], ecx
	fild	DWORD PTR -64+[ebp]
	fstp	DWORD PTR _rValue$32215[ebp]
; Line 1957
	mov	edx, DWORD PTR _ptrNextSrc$32210[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+1]
	mov	DWORD PTR -68+[ebp], eax
	fild	DWORD PTR -68+[ebp]
	fstp	DWORD PTR _rValue$32215[ebp+4]
; Line 1958
	mov	ecx, DWORD PTR _ptrNextSrc$32210[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx+2]
	mov	DWORD PTR -72+[ebp], edx
	fild	DWORD PTR -72+[ebp]
	fstp	DWORD PTR _rValue$32215[ebp+8]
; Line 1959
	mov	eax, DWORD PTR _ptrNextSrc$32210[ebp]
	add	eax, DWORD PTR _nBytesPerPixel$[ebp]
	mov	DWORD PTR _ptrNextSrc$32210[ebp], eax
; Line 1960
	fld	DWORD PTR _rSum$[ebp]
	fadd	DWORD PTR _rValue$32215[ebp]
	fstp	DWORD PTR _rSum$[ebp]
; Line 1961
	fld	DWORD PTR _rSum$[ebp+4]
	fadd	DWORD PTR _rValue$32215[ebp+4]
	fstp	DWORD PTR _rSum$[ebp+4]
; Line 1962
	fld	DWORD PTR _rSum$[ebp+8]
	fadd	DWORD PTR _rValue$32215[ebp+8]
	fstp	DWORD PTR _rSum$[ebp+8]
; Line 1963
	mov	ecx, DWORD PTR _ptrBuffer$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _nOffsetPos$32209[ebp]
	mov	ecx, DWORD PTR _rValue$32215[ebp]
	mov	DWORD PTR [edx+eax*4], ecx
; Line 1964
	mov	edx, DWORD PTR _ptrBuffer$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	ecx, DWORD PTR _nOffsetPos$32209[ebp]
	mov	edx, DWORD PTR _rValue$32215[ebp+4]
	mov	DWORD PTR [eax+ecx*4], edx
; Line 1965
	mov	eax, DWORD PTR _ptrBuffer$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	edx, DWORD PTR _nOffsetPos$32209[ebp]
	mov	eax, DWORD PTR _rValue$32215[ebp+8]
	mov	DWORD PTR [ecx+edx*4], eax
; Line 1966
	mov	ecx, DWORD PTR _nOffsetPos$32209[ebp]
	add	ecx, 1
	mov	DWORD PTR _nOffsetPos$32209[ebp], ecx
; Line 1967
	jmp	$L32213
$L32214:
; Line 1969
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nLineOffset$[ebp]
	add	eax, DWORD PTR [edx+72]
	mov	DWORD PTR _nLineOffset$[ebp], eax
; Line 1970
	mov	ecx, DWORD PTR _ptrSrcLine$[ebp]
	add	ecx, DWORD PTR _nLineBytes$[ebp]
	mov	DWORD PTR _ptrSrcLine$[ebp], ecx
; Line 1971
	jmp	$L32207
$L32208:
; Line 1974
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nWidth$[ebp]
	cmp	eax, DWORD PTR [edx+72]
	jne	SHORT $L32222
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nHeight$[ebp]
	cmp	edx, DWORD PTR [ecx+72]
	je	$L32221
$L32222:
; Line 1976
	mov	eax, DWORD PTR _nWidth$[ebp]
	imul	eax, DWORD PTR _nHeight$[ebp]
	test	eax, eax
	je	SHORT $L32223
; Line 1978
	mov	ecx, DWORD PTR _nWidth$[ebp]
	imul	ecx, DWORD PTR _nHeight$[ebp]
	mov	DWORD PTR -76+[ebp], ecx
	fild	DWORD PTR -76+[ebp]
	fstp	DWORD PTR -80+[ebp]
	fld	DWORD PTR $T32584
	fdiv	DWORD PTR -80+[ebp]
	fstp	DWORD PTR _rDiv$32224[ebp]
; Line 1979
	fld	DWORD PTR _rSum$[ebp]
	fmul	DWORD PTR _rDiv$32224[ebp]
	fstp	DWORD PTR _rSum$[ebp]
; Line 1980
	fld	DWORD PTR _rSum$[ebp+4]
	fmul	DWORD PTR _rDiv$32224[ebp]
	fstp	DWORD PTR _rSum$[ebp+4]
; Line 1981
	fld	DWORD PTR _rSum$[ebp+8]
	fmul	DWORD PTR _rDiv$32224[ebp]
	fstp	DWORD PTR _rSum$[ebp+8]
$L32223:
; Line 1983
	mov	edx, DWORD PTR _rSum$[ebp]
	push	edx
	mov	eax, DWORD PTR _nHeight$[ebp]
	push	eax
	mov	ecx, DWORD PTR _nWidth$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrBuffer$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FillOddArea@ERIEncoder@@IAEXPAMHHM@Z	; ERIEncoder::FillOddArea
; Line 1984
	mov	ecx, DWORD PTR _rSum$[ebp+4]
	push	ecx
	mov	edx, DWORD PTR _nHeight$[ebp]
	push	edx
	mov	eax, DWORD PTR _nWidth$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrBuffer$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FillOddArea@ERIEncoder@@IAEXPAMHHM@Z	; ERIEncoder::FillOddArea
; Line 1985
	mov	eax, DWORD PTR _rSum$[ebp+8]
	push	eax
	mov	ecx, DWORD PTR _nHeight$[ebp]
	push	ecx
	mov	edx, DWORD PTR _nWidth$[ebp]
	push	edx
	mov	eax, DWORD PTR _ptrBuffer$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FillOddArea@ERIEncoder@@IAEXPAMHHM@Z	; ERIEncoder::FillOddArea
$L32221:
; Line 1987
	mov	esp, ebp
	pop	ebp
	ret	20					; 00000014H
?SamplingRGB24II@ERIEncoder@@IAEXQAPAMPAEJHH@Z ENDP	; ERIEncoder::SamplingRGB24II
_ptrBuffer$ = 8
_ptrSrc$ = 12
_nLineBytes$ = 16
_nWidth$ = 20
_nHeight$ = 24
_this$ = -64
_rSum$ = -20
_nLineOffset$ = -28
_ptrSrcLine$ = -24
_y$ = -4
_nOffsetPos$32239 = -36
_ptrNextSrc$32240 = -32
_x$32241 = -40
_rValue$32245 = -56
_rDiv$32255 = -60
?SamplingRGBA32II@ERIEncoder@@IAEXQAPAMPAEJHH@Z PROC NEAR ; ERIEncoder::SamplingRGBA32II
; Line 1995
	push	ebp
	mov	ebp, esp
	sub	esp, 88					; 00000058H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1998
	mov	DWORD PTR _rSum$[ebp], 0
	mov	DWORD PTR _rSum$[ebp+4], 0
	mov	DWORD PTR _rSum$[ebp+8], 0
; Line 1999
	mov	DWORD PTR _rSum$[ebp+12], 0
; Line 2000
	mov	DWORD PTR _nLineOffset$[ebp], 0
; Line 2001
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	mov	DWORD PTR _ptrSrcLine$[ebp], eax
; Line 2003
	mov	DWORD PTR _y$[ebp], 0
	jmp	SHORT $L32236
$L32237:
	mov	ecx, DWORD PTR _y$[ebp]
	add	ecx, 1
	mov	DWORD PTR _y$[ebp], ecx
$L32236:
	mov	edx, DWORD PTR _y$[ebp]
	cmp	edx, DWORD PTR _nHeight$[ebp]
	jge	$L32238
; Line 2005
	mov	eax, DWORD PTR _nLineOffset$[ebp]
	mov	DWORD PTR _nOffsetPos$32239[ebp], eax
; Line 2006
	mov	ecx, DWORD PTR _ptrSrcLine$[ebp]
	mov	DWORD PTR _ptrNextSrc$32240[ebp], ecx
; Line 2008
	mov	DWORD PTR _x$32241[ebp], 0
	jmp	SHORT $L32242
$L32243:
	mov	edx, DWORD PTR _x$32241[ebp]
	add	edx, 1
	mov	DWORD PTR _x$32241[ebp], edx
$L32242:
	mov	eax, DWORD PTR _x$32241[ebp]
	cmp	eax, DWORD PTR _nWidth$[ebp]
	jge	$L32244
; Line 2011
	mov	ecx, DWORD PTR _ptrNextSrc$32240[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx]
	mov	DWORD PTR -68+[ebp], edx
	fild	DWORD PTR -68+[ebp]
	fstp	DWORD PTR _rValue$32245[ebp]
; Line 2012
	mov	eax, DWORD PTR _ptrNextSrc$32240[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+1]
	mov	DWORD PTR -72+[ebp], ecx
	fild	DWORD PTR -72+[ebp]
	fstp	DWORD PTR _rValue$32245[ebp+4]
; Line 2013
	mov	edx, DWORD PTR _ptrNextSrc$32240[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+2]
	mov	DWORD PTR -76+[ebp], eax
	fild	DWORD PTR -76+[ebp]
	fstp	DWORD PTR _rValue$32245[ebp+8]
; Line 2014
	mov	ecx, DWORD PTR _ptrNextSrc$32240[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx+3]
	mov	DWORD PTR -80+[ebp], edx
	fild	DWORD PTR -80+[ebp]
	fstp	DWORD PTR _rValue$32245[ebp+12]
; Line 2015
	mov	eax, DWORD PTR _ptrNextSrc$32240[ebp]
	add	eax, 4
	mov	DWORD PTR _ptrNextSrc$32240[ebp], eax
; Line 2016
	fld	DWORD PTR _rSum$[ebp]
	fadd	DWORD PTR _rValue$32245[ebp]
	fstp	DWORD PTR _rSum$[ebp]
; Line 2017
	fld	DWORD PTR _rSum$[ebp+4]
	fadd	DWORD PTR _rValue$32245[ebp+4]
	fstp	DWORD PTR _rSum$[ebp+4]
; Line 2018
	fld	DWORD PTR _rSum$[ebp+8]
	fadd	DWORD PTR _rValue$32245[ebp+8]
	fstp	DWORD PTR _rSum$[ebp+8]
; Line 2019
	fld	DWORD PTR _rSum$[ebp+12]
	fadd	DWORD PTR _rValue$32245[ebp+12]
	fstp	DWORD PTR _rSum$[ebp+12]
; Line 2020
	mov	ecx, DWORD PTR _ptrBuffer$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _nOffsetPos$32239[ebp]
	mov	ecx, DWORD PTR _rValue$32245[ebp]
	mov	DWORD PTR [edx+eax*4], ecx
; Line 2021
	mov	edx, DWORD PTR _ptrBuffer$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	ecx, DWORD PTR _nOffsetPos$32239[ebp]
	mov	edx, DWORD PTR _rValue$32245[ebp+4]
	mov	DWORD PTR [eax+ecx*4], edx
; Line 2022
	mov	eax, DWORD PTR _ptrBuffer$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	edx, DWORD PTR _nOffsetPos$32239[ebp]
	mov	eax, DWORD PTR _rValue$32245[ebp+8]
	mov	DWORD PTR [ecx+edx*4], eax
; Line 2023
	mov	ecx, DWORD PTR _ptrBuffer$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	eax, DWORD PTR _nOffsetPos$32239[ebp]
	mov	ecx, DWORD PTR _rValue$32245[ebp+12]
	mov	DWORD PTR [edx+eax*4], ecx
; Line 2024
	mov	edx, DWORD PTR _nOffsetPos$32239[ebp]
	add	edx, 1
	mov	DWORD PTR _nOffsetPos$32239[ebp], edx
; Line 2025
	jmp	$L32243
$L32244:
; Line 2027
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nLineOffset$[ebp]
	add	ecx, DWORD PTR [eax+72]
	mov	DWORD PTR _nLineOffset$[ebp], ecx
; Line 2028
	mov	edx, DWORD PTR _ptrSrcLine$[ebp]
	add	edx, DWORD PTR _nLineBytes$[ebp]
	mov	DWORD PTR _ptrSrcLine$[ebp], edx
; Line 2029
	jmp	$L32237
$L32238:
; Line 2032
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nWidth$[ebp]
	cmp	ecx, DWORD PTR [eax+72]
	jne	SHORT $L32253
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nHeight$[ebp]
	cmp	eax, DWORD PTR [edx+72]
	je	$L32252
$L32253:
; Line 2034
	mov	ecx, DWORD PTR _nWidth$[ebp]
	imul	ecx, DWORD PTR _nHeight$[ebp]
	test	ecx, ecx
	je	SHORT $L32254
; Line 2036
	mov	edx, DWORD PTR _nWidth$[ebp]
	imul	edx, DWORD PTR _nHeight$[ebp]
	mov	DWORD PTR -84+[ebp], edx
	fild	DWORD PTR -84+[ebp]
	fstp	DWORD PTR -88+[ebp]
	fld	DWORD PTR $T32584
	fdiv	DWORD PTR -88+[ebp]
	fstp	DWORD PTR _rDiv$32255[ebp]
; Line 2037
	fld	DWORD PTR _rSum$[ebp]
	fmul	DWORD PTR _rDiv$32255[ebp]
	fstp	DWORD PTR _rSum$[ebp]
; Line 2038
	fld	DWORD PTR _rSum$[ebp+4]
	fmul	DWORD PTR _rDiv$32255[ebp]
	fstp	DWORD PTR _rSum$[ebp+4]
; Line 2039
	fld	DWORD PTR _rSum$[ebp+8]
	fmul	DWORD PTR _rDiv$32255[ebp]
	fstp	DWORD PTR _rSum$[ebp+8]
; Line 2040
	fld	DWORD PTR _rSum$[ebp+12]
	fmul	DWORD PTR _rDiv$32255[ebp]
	fstp	DWORD PTR _rSum$[ebp+12]
$L32254:
; Line 2042
	mov	eax, DWORD PTR _rSum$[ebp]
	push	eax
	mov	ecx, DWORD PTR _nHeight$[ebp]
	push	ecx
	mov	edx, DWORD PTR _nWidth$[ebp]
	push	edx
	mov	eax, DWORD PTR _ptrBuffer$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FillOddArea@ERIEncoder@@IAEXPAMHHM@Z	; ERIEncoder::FillOddArea
; Line 2043
	mov	edx, DWORD PTR _rSum$[ebp+4]
	push	edx
	mov	eax, DWORD PTR _nHeight$[ebp]
	push	eax
	mov	ecx, DWORD PTR _nWidth$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrBuffer$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FillOddArea@ERIEncoder@@IAEXPAMHHM@Z	; ERIEncoder::FillOddArea
; Line 2044
	mov	ecx, DWORD PTR _rSum$[ebp+8]
	push	ecx
	mov	edx, DWORD PTR _nHeight$[ebp]
	push	edx
	mov	eax, DWORD PTR _nWidth$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrBuffer$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FillOddArea@ERIEncoder@@IAEXPAMHHM@Z	; ERIEncoder::FillOddArea
; Line 2045
	mov	eax, DWORD PTR _rSum$[ebp+12]
	push	eax
	mov	ecx, DWORD PTR _nHeight$[ebp]
	push	ecx
	mov	edx, DWORD PTR _nWidth$[ebp]
	push	edx
	mov	eax, DWORD PTR _ptrBuffer$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FillOddArea@ERIEncoder@@IAEXPAMHHM@Z	; ERIEncoder::FillOddArea
$L32252:
; Line 2047
	mov	esp, ebp
	pop	ebp
	ret	20					; 00000014H
?SamplingRGBA32II@ERIEncoder@@IAEXQAPAMPAEJHH@Z ENDP	; ERIEncoder::SamplingRGBA32II
_ptrBuffer$ = 8
_nWidth$ = 12
_nHeight$ = 16
_rFill$ = 20
_this$ = -16
_ptrLineBuf$ = -4
_x$ = -8
_y$ = -12
?FillOddArea@ERIEncoder@@IAEXPAMHHM@Z PROC NEAR		; ERIEncoder::FillOddArea
; Line 2054
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2055
	mov	eax, DWORD PTR _ptrBuffer$[ebp]
	mov	DWORD PTR _ptrLineBuf$[ebp], eax
; Line 2057
	mov	DWORD PTR _y$[ebp], 0
	jmp	SHORT $L32265
$L32266:
	mov	ecx, DWORD PTR _y$[ebp]
	add	ecx, 1
	mov	DWORD PTR _y$[ebp], ecx
$L32265:
	mov	edx, DWORD PTR _y$[ebp]
	cmp	edx, DWORD PTR _nHeight$[ebp]
	jge	SHORT $L32267
; Line 2059
	mov	eax, DWORD PTR _nWidth$[ebp]
	mov	DWORD PTR _x$[ebp], eax
	jmp	SHORT $L32269
$L32270:
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 1
	mov	DWORD PTR _x$[ebp], ecx
$L32269:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _x$[ebp]
	cmp	eax, DWORD PTR [edx+72]
	jge	SHORT $L32271
; Line 2061
	mov	ecx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR _ptrLineBuf$[ebp]
	mov	eax, DWORD PTR _rFill$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2062
	jmp	SHORT $L32270
$L32271:
; Line 2063
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	mov	eax, DWORD PTR _ptrLineBuf$[ebp]
	lea	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _ptrLineBuf$[ebp], ecx
; Line 2064
	jmp	SHORT $L32266
$L32267:
; Line 2065
	mov	edx, DWORD PTR _nHeight$[ebp]
	mov	DWORD PTR _y$[ebp], edx
	jmp	SHORT $L32273
$L32274:
	mov	eax, DWORD PTR _y$[ebp]
	add	eax, 1
	mov	DWORD PTR _y$[ebp], eax
$L32273:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _y$[ebp]
	cmp	edx, DWORD PTR [ecx+72]
	jge	SHORT $L32275
; Line 2067
	mov	DWORD PTR _x$[ebp], 0
	jmp	SHORT $L32277
$L32278:
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 1
	mov	DWORD PTR _x$[ebp], eax
$L32277:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	cmp	edx, DWORD PTR [ecx+72]
	jge	SHORT $L32279
; Line 2069
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _ptrLineBuf$[ebp]
	mov	edx, DWORD PTR _rFill$[ebp]
	mov	DWORD PTR [ecx+eax*4], edx
; Line 2070
	jmp	SHORT $L32278
$L32279:
; Line 2071
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	mov	edx, DWORD PTR _ptrLineBuf$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _ptrLineBuf$[ebp], eax
; Line 2072
	jmp	SHORT $L32274
$L32275:
; Line 2073
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?FillOddArea@ERIEncoder@@IAEXPAMHHM@Z ENDP		; ERIEncoder::FillOddArea
_this$ = -24
_i$ = -4
_j$32289 = -8
_rSample$32294 = -20
?ConvertRGBtoYUV@ERIEncoder@@IAEXXZ PROC NEAR		; ERIEncoder::ConvertRGBtoYUV
; Line 2079
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2092
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32286
$L32287:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32286:
	cmp	DWORD PTR _i$[ebp], 4
	jge	$L32288
; Line 2094
	mov	DWORD PTR _j$32289[ebp], 0
	jmp	SHORT $L32291
$L32292:
	mov	ecx, DWORD PTR _j$32289[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$32289[ebp], ecx
$L32291:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _j$32289[ebp]
	cmp	eax, DWORD PTR [edx+76]
	jge	$L32293
; Line 2097
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4+156]
	mov	ecx, DWORD PTR _j$32289[ebp]
	mov	edx, DWORD PTR [eax+ecx*4]
	mov	DWORD PTR _rSample$32294[ebp], edx
; Line 2098
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4+172]
	mov	eax, DWORD PTR _j$32289[ebp]
	mov	ecx, DWORD PTR [edx+eax*4]
	mov	DWORD PTR _rSample$32294[ebp+4], ecx
; Line 2099
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+edx*4+188]
	mov	edx, DWORD PTR _j$32289[ebp]
	mov	eax, DWORD PTR [ecx+edx*4]
	mov	DWORD PTR _rSample$32294[ebp+8], eax
; Line 2103
	fld	DWORD PTR _rSample$32294[ebp]
	fmul	QWORD PTR _?rMatrixRGB2YUV@?1??ConvertRGBtoYUV@ERIEncoder@@IAEXXZ@4PAY02$$CBNA$S32284
	fld	DWORD PTR _rSample$32294[ebp+4]
	fmul	QWORD PTR _?rMatrixRGB2YUV@?1??ConvertRGBtoYUV@ERIEncoder@@IAEXXZ@4PAY02$$CBNA$S32284+8
	faddp	ST(1), ST(0)
	fld	DWORD PTR _rSample$32294[ebp+8]
	fmul	QWORD PTR _?rMatrixRGB2YUV@?1??ConvertRGBtoYUV@ERIEncoder@@IAEXXZ@4PAY02$$CBNA$S32284+16
	faddp	ST(1), ST(0)
	fstp	DWORD PTR -28+[ebp]
	fld	DWORD PTR -28+[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4+156]
	mov	ecx, DWORD PTR _j$32289[ebp]
	fstp	DWORD PTR [eax+ecx*4]
; Line 2107
	fld	DWORD PTR _rSample$32294[ebp]
	fmul	QWORD PTR _?rMatrixRGB2YUV@?1??ConvertRGBtoYUV@ERIEncoder@@IAEXXZ@4PAY02$$CBNA$S32284+24
	fld	DWORD PTR _rSample$32294[ebp+4]
	fmul	QWORD PTR _?rMatrixRGB2YUV@?1??ConvertRGBtoYUV@ERIEncoder@@IAEXXZ@4PAY02$$CBNA$S32284+32
	faddp	ST(1), ST(0)
	fld	DWORD PTR _rSample$32294[ebp+8]
	fmul	QWORD PTR _?rMatrixRGB2YUV@?1??ConvertRGBtoYUV@ERIEncoder@@IAEXXZ@4PAY02$$CBNA$S32284+40
	faddp	ST(1), ST(0)
	fstp	DWORD PTR -32+[ebp]
	fld	DWORD PTR -32+[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+edx*4+172]
	mov	edx, DWORD PTR _j$32289[ebp]
	fstp	DWORD PTR [ecx+edx*4]
; Line 2111
	fld	DWORD PTR _rSample$32294[ebp]
	fmul	QWORD PTR _?rMatrixRGB2YUV@?1??ConvertRGBtoYUV@ERIEncoder@@IAEXXZ@4PAY02$$CBNA$S32284+48
	fld	DWORD PTR _rSample$32294[ebp+4]
	fmul	QWORD PTR _?rMatrixRGB2YUV@?1??ConvertRGBtoYUV@ERIEncoder@@IAEXXZ@4PAY02$$CBNA$S32284+56
	faddp	ST(1), ST(0)
	fld	DWORD PTR _rSample$32294[ebp+8]
	fmul	QWORD PTR _?rMatrixRGB2YUV@?1??ConvertRGBtoYUV@ERIEncoder@@IAEXXZ@4PAY02$$CBNA$S32284+64
	faddp	ST(1), ST(0)
	fstp	DWORD PTR -36+[ebp]
	fld	DWORD PTR -36+[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4+188]
	mov	eax, DWORD PTR _j$32289[ebp]
	fstp	DWORD PTR [edx+eax*4]
; Line 2112
	jmp	$L32292
$L32293:
; Line 2113
	jmp	$L32287
$L32288:
; Line 2114
	mov	esp, ebp
	pop	ebp
	ret	0
?ConvertRGBtoYUV@ERIEncoder@@IAEXXZ ENDP		; ERIEncoder::ConvertRGBtoYUV
_this$ = -24
_i$ = -4
_j$32306 = -8
_ptrSrc$32310 = -20
_ptrDst$32311 = -16
_k$32312 = -12
?BlockScaling444@ERIEncoder@@IAEXXZ PROC NEAR		; ERIEncoder::BlockScaling444
; Line 2120
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2123
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32303
$L32304:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32303:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+84]
	jge	SHORT $L32305
; Line 2125
	mov	DWORD PTR _j$32306[ebp], 0
	jmp	SHORT $L32307
$L32308:
	mov	eax, DWORD PTR _j$32306[ebp]
	add	eax, 1
	mov	DWORD PTR _j$32306[ebp], eax
$L32307:
	cmp	DWORD PTR _j$32306[ebp], 4
	jge	SHORT $L32309
; Line 2127
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	lea	eax, DWORD PTR [edx+ecx+156]
	mov	ecx, DWORD PTR _j$32306[ebp]
	mov	edx, DWORD PTR [eax+ecx*4]
	mov	DWORD PTR _ptrSrc$32310[ebp], edx
; Line 2128
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _j$32306[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+edx*4+220]
	mov	DWORD PTR _ptrDst$32311[ebp], ecx
; Line 2130
	mov	DWORD PTR _k$32312[ebp], 0
	jmp	SHORT $L32314
$L32315:
	mov	edx, DWORD PTR _k$32312[ebp]
	add	edx, 1
	mov	DWORD PTR _k$32312[ebp], edx
$L32314:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _k$32312[ebp]
	cmp	ecx, DWORD PTR [eax+76]
	jge	SHORT $L32316
; Line 2132
	mov	edx, DWORD PTR _k$32312[ebp]
	mov	eax, DWORD PTR _ptrDst$32311[ebp]
	mov	ecx, DWORD PTR _k$32312[ebp]
	mov	esi, DWORD PTR _ptrSrc$32310[ebp]
	mov	ecx, DWORD PTR [esi+ecx*4]
	mov	DWORD PTR [eax+edx*4], ecx
; Line 2133
	jmp	SHORT $L32315
$L32316:
; Line 2134
	jmp	SHORT $L32308
$L32309:
; Line 2135
	jmp	$L32304
$L32305:
; Line 2136
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
?BlockScaling444@ERIEncoder@@IAEXXZ ENDP		; ERIEncoder::BlockScaling444
_TEXT	ENDS
CONST	SEGMENT
$T32585	DQ	03fe0000000000000r		; 0.5
CONST	ENDS
_TEXT	SEGMENT
_this$ = -40
_i$ = -4
_j$ = -8
_k$ = -12
_l$ = -20
_m$ = -24
_ptrSrc$ = -28
_ptrDst$ = -16
_nHalfHeight$32343 = -32
_ptrUnderSrc$32348 = -36
?BlockScaling422@ERIEncoder@@IAEXXZ PROC NEAR		; ERIEncoder::BlockScaling422
; Line 2142
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2148
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32327
$L32328:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32327:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L32329
; Line 2150
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4+156]
	mov	DWORD PTR _ptrSrc$[ebp], eax
; Line 2151
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4+220]
	mov	DWORD PTR _ptrDst$[ebp], eax
; Line 2153
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32331
$L32332:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L32331:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+76]
	jge	SHORT $L32333
; Line 2155
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _ptrDst$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	mov	esi, DWORD PTR _ptrSrc$[ebp]
	mov	eax, DWORD PTR [esi+eax*4]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2156
	jmp	SHORT $L32332
$L32333:
; Line 2157
	jmp	SHORT $L32328
$L32329:
; Line 2160
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32334
$L32335:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32334:
	cmp	DWORD PTR _i$[ebp], 2
	jge	$L32336
; Line 2162
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32337
$L32338:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L32337:
	cmp	DWORD PTR _j$[ebp], 2
	jge	$L32339
; Line 2164
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	lea	edx, DWORD PTR [ecx+eax*2+4]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+edx*4+220]
	mov	DWORD PTR _ptrDst$[ebp], ecx
; Line 2166
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L32340
$L32341:
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
$L32340:
	cmp	DWORD PTR _k$[ebp], 2
	jge	$L32342
; Line 2168
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	shl	eax, 4
	mov	ecx, DWORD PTR _this$[ebp]
	lea	edx, DWORD PTR [ecx+eax+156]
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _k$[ebp]
	lea	eax, DWORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR [edx+eax*4]
	mov	DWORD PTR _ptrSrc$[ebp], ecx
; Line 2170
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	sar	eax, 1
	mov	DWORD PTR _nHalfHeight$32343[ebp], eax
; Line 2171
	mov	DWORD PTR _l$[ebp], 0
	jmp	SHORT $L32345
$L32346:
	mov	ecx, DWORD PTR _l$[ebp]
	add	ecx, 1
	mov	DWORD PTR _l$[ebp], ecx
$L32345:
	mov	edx, DWORD PTR _l$[ebp]
	cmp	edx, DWORD PTR _nHalfHeight$32343[ebp]
	jge	SHORT $L32347
; Line 2173
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	mov	edx, DWORD PTR _ptrSrc$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _ptrUnderSrc$32348[ebp], eax
; Line 2174
	mov	DWORD PTR _m$[ebp], 0
	jmp	SHORT $L32350
$L32351:
	mov	ecx, DWORD PTR _m$[ebp]
	add	ecx, 1
	mov	DWORD PTR _m$[ebp], ecx
$L32350:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _m$[ebp]
	cmp	eax, DWORD PTR [edx+72]
	jge	SHORT $L32352
; Line 2177
	mov	ecx, DWORD PTR _m$[ebp]
	mov	edx, DWORD PTR _ptrSrc$[ebp]
	mov	eax, DWORD PTR _m$[ebp]
	mov	esi, DWORD PTR _ptrUnderSrc$32348[ebp]
	fld	DWORD PTR [edx+ecx*4]
	fadd	DWORD PTR [esi+eax*4]
	fmul	QWORD PTR $T32585
	mov	ecx, DWORD PTR _m$[ebp]
	mov	edx, DWORD PTR _ptrDst$[ebp]
	fstp	DWORD PTR [edx+ecx*4]
; Line 2178
	jmp	SHORT $L32351
$L32352:
; Line 2179
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	mov	edx, DWORD PTR _ptrDst$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _ptrDst$[ebp], eax
; Line 2180
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	mov	eax, DWORD PTR _ptrUnderSrc$32348[ebp]
	lea	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _ptrSrc$[ebp], ecx
; Line 2181
	jmp	SHORT $L32346
$L32347:
; Line 2182
	jmp	$L32341
$L32342:
; Line 2183
	jmp	$L32338
$L32339:
; Line 2184
	jmp	$L32335
$L32336:
; Line 2187
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+84], 4
	jne	SHORT $L32354
; Line 2189
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32355
$L32356:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32355:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L32357
; Line 2191
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4+204]
	mov	DWORD PTR _ptrSrc$[ebp], eax
; Line 2192
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4+252]
	mov	DWORD PTR _ptrDst$[ebp], eax
; Line 2194
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32359
$L32360:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L32359:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+76]
	jge	SHORT $L32361
; Line 2196
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _ptrDst$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	mov	esi, DWORD PTR _ptrSrc$[ebp]
	mov	eax, DWORD PTR [esi+eax*4]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2197
	jmp	SHORT $L32360
$L32361:
; Line 2198
	jmp	SHORT $L32356
$L32357:
$L32354:
; Line 2200
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
?BlockScaling422@ERIEncoder@@IAEXXZ ENDP		; ERIEncoder::BlockScaling422
_TEXT	ENDS
CONST	SEGMENT
$T32586	DQ	03fd0000000000000r		; 0.25
CONST	ENDS
_TEXT	SEGMENT
_this$ = -52
_i$ = -20
_j$ = -24
_k$ = -28
_l$ = -36
_ptrSrc$ = -40
_ptrDst$ = -32
_dwOffset$ = -16
_nHalfWidth$32385 = -44
_ptrUnderSrc$32390 = -48
?BlockScaling411@ERIEncoder@@IAEXXZ PROC NEAR		; ERIEncoder::BlockScaling411
; Line 2206
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2212
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32371
$L32372:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32371:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L32373
; Line 2214
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4+156]
	mov	DWORD PTR _ptrSrc$[ebp], eax
; Line 2215
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4+220]
	mov	DWORD PTR _ptrDst$[ebp], eax
; Line 2217
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32375
$L32376:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L32375:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+76]
	jge	SHORT $L32377
; Line 2219
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _ptrDst$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	mov	esi, DWORD PTR _ptrSrc$[ebp]
	mov	eax, DWORD PTR [esi+eax*4]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2220
	jmp	SHORT $L32376
$L32377:
; Line 2221
	jmp	SHORT $L32372
$L32373:
; Line 2226
	mov	DWORD PTR _dwOffset$[ebp], 0
; Line 2227
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	shr	edx, 1
	mov	DWORD PTR _dwOffset$[ebp+4], edx
; Line 2228
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	shr	ecx, 1
	mov	DWORD PTR _dwOffset$[ebp+8], ecx
; Line 2230
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	mov	ecx, DWORD PTR _this$[ebp]
	add	eax, DWORD PTR [ecx+72]
	shr	eax, 1
	mov	DWORD PTR _dwOffset$[ebp+12], eax
; Line 2231
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32379
$L32380:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32379:
	cmp	DWORD PTR _i$[ebp], 2
	jge	$L32381
; Line 2233
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32382
$L32383:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L32382:
	cmp	DWORD PTR _j$[ebp], 4
	jge	$L32384
; Line 2235
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _dwOffset$[ebp+ecx*4]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+236]
	lea	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _ptrDst$[ebp], ecx
; Line 2236
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	shl	edx, 4
	mov	eax, DWORD PTR _this$[ebp]
	lea	ecx, DWORD PTR [eax+edx+156]
	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR [ecx+edx*4]
	mov	DWORD PTR _ptrSrc$[ebp], eax
; Line 2238
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	sar	edx, 1
	mov	DWORD PTR _nHalfWidth$32385[ebp], edx
; Line 2239
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L32387
$L32388:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L32387:
	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR _nHalfWidth$32385[ebp]
	jge	$L32389
; Line 2241
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	mov	ecx, DWORD PTR _ptrSrc$[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _ptrUnderSrc$32390[ebp], edx
; Line 2242
	mov	DWORD PTR _l$[ebp], 0
	jmp	SHORT $L32391
$L32392:
	mov	eax, DWORD PTR _l$[ebp]
	add	eax, 1
	mov	DWORD PTR _l$[ebp], eax
$L32391:
	mov	ecx, DWORD PTR _l$[ebp]
	cmp	ecx, DWORD PTR _nHalfWidth$32385[ebp]
	jge	SHORT $L32393
; Line 2248
	mov	edx, DWORD PTR _l$[ebp]
	shl	edx, 1
	mov	eax, DWORD PTR _l$[ebp]
	shl	eax, 1
	mov	ecx, DWORD PTR _ptrSrc$[ebp]
	mov	esi, DWORD PTR _ptrSrc$[ebp]
	fld	DWORD PTR [ecx+edx*4]
	fadd	DWORD PTR [esi+eax*4+4]
	mov	edx, DWORD PTR _l$[ebp]
	shl	edx, 1
	mov	eax, DWORD PTR _ptrUnderSrc$32390[ebp]
	fadd	DWORD PTR [eax+edx*4]
	mov	ecx, DWORD PTR _l$[ebp]
	shl	ecx, 1
	mov	edx, DWORD PTR _ptrUnderSrc$32390[ebp]
	fadd	DWORD PTR [edx+ecx*4+4]
	fmul	QWORD PTR $T32586
	mov	eax, DWORD PTR _l$[ebp]
	mov	ecx, DWORD PTR _ptrDst$[ebp]
	fstp	DWORD PTR [ecx+eax*4]
; Line 2249
	jmp	SHORT $L32392
$L32393:
; Line 2250
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	mov	ecx, DWORD PTR _ptrDst$[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _ptrDst$[ebp], edx
; Line 2251
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	mov	edx, DWORD PTR _ptrUnderSrc$32390[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _ptrSrc$[ebp], eax
; Line 2252
	jmp	$L32388
$L32389:
; Line 2253
	jmp	$L32383
$L32384:
; Line 2254
	jmp	$L32380
$L32381:
; Line 2257
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+84], 4
	jne	SHORT $L32395
; Line 2259
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32396
$L32397:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32396:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L32398
; Line 2261
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4+204]
	mov	DWORD PTR _ptrSrc$[ebp], edx
; Line 2262
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4+244]
	mov	DWORD PTR _ptrDst$[ebp], edx
; Line 2264
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32400
$L32401:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L32400:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+76]
	jge	SHORT $L32402
; Line 2266
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _ptrDst$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	mov	esi, DWORD PTR _ptrSrc$[ebp]
	mov	edx, DWORD PTR [esi+edx*4]
	mov	DWORD PTR [ecx+eax*4], edx
; Line 2267
	jmp	SHORT $L32401
$L32402:
; Line 2268
	jmp	SHORT $L32397
$L32398:
$L32395:
; Line 2270
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
?BlockScaling411@ERIEncoder@@IAEXXZ ENDP		; ERIEncoder::BlockScaling411
_TEXT	ENDS
EXTRN	_eriSquareDCT:NEAR
CONST	SEGMENT
$T32587	DQ	04000000000000000r		; 2
CONST	ENDS
_TEXT	SEGMENT
_this$ = -16
_i$ = -8
_j$ = -12
_rMatrixScale$ = -4
?PerformDCT@ERIEncoder@@IAEXXZ PROC NEAR		; ERIEncoder::PerformDCT
; Line 2276
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2278
	mov	eax, DWORD PTR _this$[ebp]
	fild	DWORD PTR [eax+72]
	fstp	QWORD PTR -24+[ebp]
	fld	QWORD PTR $T32587
	fdiv	QWORD PTR -24+[ebp]
	fstp	DWORD PTR _rMatrixScale$[ebp]
; Line 2280
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32412
$L32413:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32412:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+148]
	jge	$L32414
; Line 2285
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+352]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+348]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+56]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4+220]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4+284]
	push	eax
	call	_eriSquareDCT
	add	esp, 20					; 00000014H
; Line 2287
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32416
$L32417:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L32416:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+76]
	jge	SHORT $L32418
; Line 2289
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4+284]
	mov	ecx, DWORD PTR _j$[ebp]
	fld	DWORD PTR [eax+ecx*4]
	fmul	DWORD PTR _rMatrixScale$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+edx*4+284]
	mov	edx, DWORD PTR _j$[ebp]
	fstp	DWORD PTR [ecx+edx*4]
; Line 2290
	jmp	SHORT $L32417
$L32418:
; Line 2291
	jmp	$L32413
$L32414:
; Line 2292
	mov	esp, ebp
	pop	ebp
	ret	0
?PerformDCT@ERIEncoder@@IAEXXZ ENDP			; ERIEncoder::PerformDCT
_TEXT	ENDS
CONST	SEGMENT
$T32588	DQ	00000000000000000r		; 0
$T32589	DQ	0405fc00000000000r		; 127
$T32590	DD	042fe0000r			; 127
	ORG $+4
$T32591	DQ	04070000000000000r		; 256
CONST	ENDS
_TEXT	SEGMENT
_bytCoefficient$ = 8
_this$ = -132
_i$ = -88
_j$ = -92
_scale$ = -68
_pArrange$ = -100
_ptrDst$ = -96
_iOffset$32431 = -120
_c_count$ = -80
_ptrSrc$ = -112
_ptrQuantumized$ = -84
_count$ = -76
_rMax$ = -116
_rAbsSource$32459 = -124
_rYScale$ = -72
_nFixedScale$ = -104
_rCScale$ = -108
_nQuantumized$ = -4
_rAbsSource$32500 = -128
?ArrangeAndQuantumize@ERIEncoder@@IAEXQAE@Z PROC NEAR	; ERIEncoder::ArrangeAndQuantumize
; Line 2298
	push	ebp
	mov	ebp, esp
	sub	esp, 192				; 000000c0H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2301
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+120]
	mov	DWORD PTR _pArrange$[ebp], ecx
; Line 2304
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+220]
	mov	DWORD PTR _ptrDst$[ebp], eax
; Line 2305
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32428
$L32429:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32428:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+76]
	jge	SHORT $L32430
; Line 2307
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _pArrange$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _iOffset$32431[ebp], eax
; Line 2309
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32433
$L32434:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L32433:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+148]
	jge	SHORT $L32435
; Line 2311
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4+284]
	mov	ecx, DWORD PTR _ptrDst$[ebp]
	mov	edx, DWORD PTR _iOffset$32431[ebp]
	mov	eax, DWORD PTR [eax+edx*4]
	mov	DWORD PTR [ecx], eax
	mov	ecx, DWORD PTR _ptrDst$[ebp]
	add	ecx, 4
	mov	DWORD PTR _ptrDst$[ebp], ecx
; Line 2312
	jmp	SHORT $L32434
$L32435:
; Line 2313
	jmp	SHORT $L32429
$L32430:
; Line 2316
	mov	DWORD PTR _c_count$[ebp], 12		; 0000000cH
; Line 2317
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+36], 262658		; 00040202H
	jne	SHORT $L32437
; Line 2319
	mov	DWORD PTR _c_count$[ebp], 8
; Line 2321
	jmp	SHORT $L32438
$L32437:
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+36], 262401		; 00040101H
	jne	SHORT $L32439
; Line 2323
	mov	DWORD PTR _c_count$[ebp], 6
$L32439:
$L32438:
; Line 2325
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+424]
	mov	DWORD PTR _scale$[ebp+12], edx
	mov	eax, DWORD PTR _scale$[ebp+12]
	mov	DWORD PTR _scale$[ebp+8], eax
	mov	ecx, DWORD PTR _scale$[ebp+8]
	mov	DWORD PTR _scale$[ebp+4], ecx
	mov	edx, DWORD PTR _scale$[ebp+4]
	mov	DWORD PTR _scale$[ebp], edx
; Line 2326
	mov	DWORD PTR _i$[ebp], 4
	jmp	SHORT $L32440
$L32441:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32440:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _c_count$[ebp]
	jge	SHORT $L32442
; Line 2328
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+428]
	mov	DWORD PTR _scale$[ebp+edx*4], ecx
; Line 2329
	jmp	SHORT $L32441
$L32442:
; Line 2330
	jmp	SHORT $L32444
$L32445:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32444:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+148]
	jge	SHORT $L32446
; Line 2332
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+424]
	mov	DWORD PTR _scale$[ebp+edx*4], ecx
; Line 2333
	jmp	SHORT $L32445
$L32446:
; Line 2336
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+220]
	mov	DWORD PTR _ptrSrc$[ebp], eax
; Line 2337
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	DWORD PTR _ptrQuantumized$[ebp], edx
; Line 2338
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+148]
	mov	DWORD PTR _count$[ebp], ecx
; Line 2339
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32451
$L32452:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32451:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _count$[ebp]
	jge	SHORT $L32453
; Line 2342
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _ptrSrc$[ebp]
	fld	DWORD PTR _scale$[ebp+ecx*4]
	fmul	DWORD PTR [edx]
	fstp	DWORD PTR -136+[ebp]
	mov	eax, DWORD PTR -136+[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrSrc$[ebp]
	add	ecx, 4
	mov	DWORD PTR _ptrSrc$[ebp], ecx
	call	_eriRoundR32ToInt
	add	esp, 4
	mov	edx, DWORD PTR _ptrQuantumized$[ebp]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR _ptrQuantumized$[ebp]
	add	eax, 4
	mov	DWORD PTR _ptrQuantumized$[ebp], eax
; Line 2343
	jmp	SHORT $L32452
$L32453:
; Line 2348
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	sub	edx, 1
	mov	eax, DWORD PTR _this$[ebp]
	imul	edx, DWORD PTR [eax+72]
	shr	edx, 1
	sub	edx, 1
	mov	ecx, DWORD PTR _this$[ebp]
	imul	edx, DWORD PTR [ecx+148]
	mov	DWORD PTR _count$[ebp], edx
; Line 2349
	mov	DWORD PTR _rMax$[ebp], 0
; Line 2350
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32456
$L32457:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32456:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _count$[ebp]
	jge	SHORT $L32458
; Line 2352
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _ptrSrc$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _rAbsSource$32459[ebp], eax
; Line 2353
	fld	DWORD PTR _rAbsSource$32459[ebp]
	fcomp	QWORD PTR $T32588
	fnstsw	ax
	test	ah, 1
	je	SHORT $L32460
; Line 2355
	fld	DWORD PTR _rAbsSource$32459[ebp]
	fchs
	fstp	DWORD PTR _rAbsSource$32459[ebp]
$L32460:
; Line 2357
	fld	DWORD PTR _rAbsSource$32459[ebp]
	fcomp	DWORD PTR _rMax$[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L32461
; Line 2359
	mov	ecx, DWORD PTR _rAbsSource$32459[ebp]
	mov	DWORD PTR _rMax$[ebp], ecx
$L32461:
; Line 2361
	jmp	SHORT $L32457
$L32458:
; Line 2363
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+432]
	mov	DWORD PTR _rYScale$[ebp], eax
; Line 2364
	fld	DWORD PTR _rYScale$[ebp]
	fmul	DWORD PTR _rMax$[ebp]
	fcomp	QWORD PTR $T32589
	fnstsw	ax
	test	ah, 1
	jne	SHORT $L32463
; Line 2366
	fld	DWORD PTR $T32590
	fdiv	DWORD PTR _rMax$[ebp]
	fstp	DWORD PTR _rYScale$[ebp]
$L32463:
; Line 2368
	fld	DWORD PTR _rYScale$[ebp]
	fmul	DWORD PTR $T32583
	push	ecx
	fstp	DWORD PTR [esp]
	call	_eriRoundR32ToInt
	add	esp, 4
	sub	eax, 1
	mov	DWORD PTR _nFixedScale$[ebp], eax
; Line 2369
	cmp	DWORD PTR _nFixedScale$[ebp], 0
	jge	SHORT $L32465
; Line 2371
	mov	DWORD PTR _nFixedScale$[ebp], 0
; Line 2373
	jmp	SHORT $L32466
$L32465:
	cmp	DWORD PTR _nFixedScale$[ebp], 256	; 00000100H
	jl	SHORT $L32467
; Line 2375
	mov	DWORD PTR _nFixedScale$[ebp], 255	; 000000ffH
$L32467:
$L32466:
; Line 2377
	mov	ecx, DWORD PTR _bytCoefficient$[ebp]
	mov	dl, BYTE PTR _nFixedScale$[ebp]
	mov	BYTE PTR [ecx], dl
; Line 2378
	mov	eax, DWORD PTR _nFixedScale$[ebp]
	add	eax, 1
	mov	DWORD PTR -140+[ebp], eax
	fild	DWORD PTR -140+[ebp]
	fstp	QWORD PTR -148+[ebp]
	fld	QWORD PTR -148+[ebp]
	fdiv	QWORD PTR $T32591
	fstp	DWORD PTR _rYScale$[ebp]
; Line 2380
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+436]
	mov	DWORD PTR _rCScale$[ebp], edx
; Line 2381
	fld	DWORD PTR _rCScale$[ebp]
	fmul	DWORD PTR _rMax$[ebp]
	fcomp	QWORD PTR $T32589
	fnstsw	ax
	test	ah, 1
	jne	SHORT $L32471
; Line 2383
	fld	DWORD PTR $T32590
	fdiv	DWORD PTR _rMax$[ebp]
	fstp	DWORD PTR _rCScale$[ebp]
$L32471:
; Line 2385
	fld	DWORD PTR _rCScale$[ebp]
	fmul	DWORD PTR $T32583
	push	ecx
	fstp	DWORD PTR [esp]
	call	_eriRoundR32ToInt
	add	esp, 4
	sub	eax, 1
	mov	DWORD PTR _nFixedScale$[ebp], eax
; Line 2386
	cmp	DWORD PTR _nFixedScale$[ebp], 0
	jge	SHORT $L32472
; Line 2388
	mov	DWORD PTR _nFixedScale$[ebp], 0
; Line 2390
	jmp	SHORT $L32473
$L32472:
	cmp	DWORD PTR _nFixedScale$[ebp], 256	; 00000100H
	jl	SHORT $L32474
; Line 2392
	mov	DWORD PTR _nFixedScale$[ebp], 255	; 000000ffH
$L32474:
$L32473:
; Line 2394
	mov	eax, DWORD PTR _bytCoefficient$[ebp]
	mov	cl, BYTE PTR _nFixedScale$[ebp]
	mov	BYTE PTR [eax+1], cl
; Line 2395
	mov	edx, DWORD PTR _nFixedScale$[ebp]
	add	edx, 1
	mov	DWORD PTR -152+[ebp], edx
	fild	DWORD PTR -152+[ebp]
	fstp	QWORD PTR -160+[ebp]
	fld	QWORD PTR -160+[ebp]
	fdiv	QWORD PTR $T32591
	fstp	DWORD PTR _rCScale$[ebp]
; Line 2397
	mov	eax, DWORD PTR _rYScale$[ebp]
	mov	DWORD PTR _scale$[ebp+12], eax
	mov	ecx, DWORD PTR _scale$[ebp+12]
	mov	DWORD PTR _scale$[ebp+8], ecx
	mov	edx, DWORD PTR _scale$[ebp+8]
	mov	DWORD PTR _scale$[ebp+4], edx
	mov	eax, DWORD PTR _scale$[ebp+4]
	mov	DWORD PTR _scale$[ebp], eax
; Line 2398
	mov	DWORD PTR _i$[ebp], 4
	jmp	SHORT $L32477
$L32478:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32477:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _c_count$[ebp]
	jge	SHORT $L32479
; Line 2400
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _rCScale$[ebp]
	mov	DWORD PTR _scale$[ebp+eax*4], ecx
; Line 2401
	jmp	SHORT $L32478
$L32479:
; Line 2402
	jmp	SHORT $L32481
$L32482:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32481:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+148]
	jge	SHORT $L32483
; Line 2404
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _rYScale$[ebp]
	mov	DWORD PTR _scale$[ebp+edx*4], eax
; Line 2405
	jmp	SHORT $L32482
$L32483:
; Line 2409
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	sub	edx, 1
	mov	eax, DWORD PTR _this$[ebp]
	imul	edx, DWORD PTR [eax+72]
	shr	edx, 1
	sub	edx, 1
	mov	DWORD PTR _count$[ebp], edx
; Line 2410
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32485
$L32486:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32485:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _count$[ebp]
	jge	$L32487
; Line 2412
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32489
$L32490:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L32489:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+148]
	jge	SHORT $L32491
; Line 2414
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _ptrSrc$[ebp]
	fld	DWORD PTR _scale$[ebp+eax*4]
	fmul	DWORD PTR [ecx]
	fstp	DWORD PTR -164+[ebp]
	mov	edx, DWORD PTR -164+[ebp]
	push	edx
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	add	eax, 4
	mov	DWORD PTR _ptrSrc$[ebp], eax
	call	_eriRoundR32ToInt
	add	esp, 4
	mov	DWORD PTR _nQuantumized$[ebp], eax
; Line 2415
	cmp	DWORD PTR _nQuantumized$[ebp], -128	; ffffff80H
	jge	SHORT $L32492
; Line 2417
	mov	DWORD PTR _nQuantumized$[ebp], -128	; ffffff80H
; Line 2419
	jmp	SHORT $L32493
$L32492:
	cmp	DWORD PTR _nQuantumized$[ebp], 127	; 0000007fH
	jle	SHORT $L32494
; Line 2421
	mov	DWORD PTR _nQuantumized$[ebp], 127	; 0000007fH
$L32494:
$L32493:
; Line 2423
	mov	eax, DWORD PTR _nQuantumized$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	eax, DWORD PTR [ecx+448]
	jg	SHORT $L32495
; Line 2425
	mov	DWORD PTR _nQuantumized$[ebp], 0
$L32495:
; Line 2427
	mov	edx, DWORD PTR _ptrQuantumized$[ebp]
	mov	eax, DWORD PTR _nQuantumized$[ebp]
	mov	DWORD PTR [edx], eax
	mov	ecx, DWORD PTR _ptrQuantumized$[ebp]
	add	ecx, 4
	mov	DWORD PTR _ptrQuantumized$[ebp], ecx
; Line 2428
	jmp	$L32490
$L32491:
; Line 2429
	jmp	$L32486
$L32487:
; Line 2433
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	add	eax, 1
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	imul	edx, eax
	shr	edx, 1
	mov	eax, DWORD PTR _this$[ebp]
	imul	edx, DWORD PTR [eax+148]
	mov	DWORD PTR _count$[ebp], edx
; Line 2434
	mov	DWORD PTR _rMax$[ebp], 0
; Line 2435
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32497
$L32498:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32497:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _count$[ebp]
	jge	SHORT $L32499
; Line 2437
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrSrc$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _rAbsSource$32500[ebp], edx
; Line 2438
	fld	DWORD PTR _rAbsSource$32500[ebp]
	fcomp	QWORD PTR $T32588
	fnstsw	ax
	test	ah, 1
	je	SHORT $L32501
; Line 2440
	fld	DWORD PTR _rAbsSource$32500[ebp]
	fchs
	fstp	DWORD PTR _rAbsSource$32500[ebp]
$L32501:
; Line 2442
	fld	DWORD PTR _rAbsSource$32500[ebp]
	fcomp	DWORD PTR _rMax$[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L32502
; Line 2444
	mov	eax, DWORD PTR _rAbsSource$32500[ebp]
	mov	DWORD PTR _rMax$[ebp], eax
$L32502:
; Line 2446
	jmp	SHORT $L32498
$L32499:
; Line 2448
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+440]
	mov	DWORD PTR _rYScale$[ebp], edx
; Line 2449
	fld	DWORD PTR _rYScale$[ebp]
	fmul	DWORD PTR _rMax$[ebp]
	fcomp	QWORD PTR $T32589
	fnstsw	ax
	test	ah, 1
	jne	SHORT $L32503
; Line 2451
	fld	DWORD PTR $T32590
	fdiv	DWORD PTR _rMax$[ebp]
	fstp	DWORD PTR _rYScale$[ebp]
$L32503:
; Line 2453
	fld	DWORD PTR _rYScale$[ebp]
	fmul	DWORD PTR $T32583
	push	ecx
	fstp	DWORD PTR [esp]
	call	_eriRoundR32ToInt
	add	esp, 4
	sub	eax, 1
	mov	DWORD PTR _nFixedScale$[ebp], eax
; Line 2454
	cmp	DWORD PTR _nFixedScale$[ebp], 0
	jge	SHORT $L32504
; Line 2456
	mov	DWORD PTR _nFixedScale$[ebp], 0
; Line 2458
	jmp	SHORT $L32505
$L32504:
	cmp	DWORD PTR _nFixedScale$[ebp], 256	; 00000100H
	jl	SHORT $L32506
; Line 2460
	mov	DWORD PTR _nFixedScale$[ebp], 255	; 000000ffH
$L32506:
$L32505:
; Line 2462
	mov	eax, DWORD PTR _bytCoefficient$[ebp]
	mov	cl, BYTE PTR _nFixedScale$[ebp]
	mov	BYTE PTR [eax+2], cl
; Line 2463
	mov	edx, DWORD PTR _nFixedScale$[ebp]
	add	edx, 1
	mov	DWORD PTR -168+[ebp], edx
	fild	DWORD PTR -168+[ebp]
	fstp	QWORD PTR -176+[ebp]
	fld	QWORD PTR -176+[ebp]
	fdiv	QWORD PTR $T32591
	fstp	DWORD PTR _rYScale$[ebp]
; Line 2465
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+444]
	mov	DWORD PTR _rCScale$[ebp], ecx
; Line 2466
	fld	DWORD PTR _rCScale$[ebp]
	fmul	DWORD PTR _rMax$[ebp]
	fcomp	QWORD PTR $T32589
	fnstsw	ax
	test	ah, 1
	jne	SHORT $L32509
; Line 2468
	fld	DWORD PTR $T32590
	fdiv	DWORD PTR _rMax$[ebp]
	fstp	DWORD PTR _rCScale$[ebp]
$L32509:
; Line 2470
	fld	DWORD PTR _rCScale$[ebp]
	fmul	DWORD PTR $T32583
	push	ecx
	fstp	DWORD PTR [esp]
	call	_eriRoundR32ToInt
	add	esp, 4
	sub	eax, 1
	mov	DWORD PTR _nFixedScale$[ebp], eax
; Line 2471
	cmp	DWORD PTR _nFixedScale$[ebp], 0
	jge	SHORT $L32510
; Line 2473
	mov	DWORD PTR _nFixedScale$[ebp], 0
; Line 2475
	jmp	SHORT $L32511
$L32510:
	cmp	DWORD PTR _nFixedScale$[ebp], 256	; 00000100H
	jl	SHORT $L32512
; Line 2477
	mov	DWORD PTR _nFixedScale$[ebp], 255	; 000000ffH
$L32512:
$L32511:
; Line 2479
	mov	edx, DWORD PTR _bytCoefficient$[ebp]
	mov	al, BYTE PTR _nFixedScale$[ebp]
	mov	BYTE PTR [edx+3], al
; Line 2480
	mov	ecx, DWORD PTR _nFixedScale$[ebp]
	add	ecx, 1
	mov	DWORD PTR -180+[ebp], ecx
	fild	DWORD PTR -180+[ebp]
	fstp	QWORD PTR -188+[ebp]
	fld	QWORD PTR -188+[ebp]
	fdiv	QWORD PTR $T32591
	fstp	DWORD PTR _rCScale$[ebp]
; Line 2482
	mov	edx, DWORD PTR _rYScale$[ebp]
	mov	DWORD PTR _scale$[ebp+12], edx
	mov	eax, DWORD PTR _scale$[ebp+12]
	mov	DWORD PTR _scale$[ebp+8], eax
	mov	ecx, DWORD PTR _scale$[ebp+8]
	mov	DWORD PTR _scale$[ebp+4], ecx
	mov	edx, DWORD PTR _scale$[ebp+4]
	mov	DWORD PTR _scale$[ebp], edx
; Line 2483
	mov	DWORD PTR _i$[ebp], 4
	jmp	SHORT $L32515
$L32516:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32515:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _c_count$[ebp]
	jge	SHORT $L32517
; Line 2485
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _rCScale$[ebp]
	mov	DWORD PTR _scale$[ebp+edx*4], eax
; Line 2486
	jmp	SHORT $L32516
$L32517:
; Line 2487
	jmp	SHORT $L32519
$L32520:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32519:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+148]
	jge	SHORT $L32521
; Line 2489
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _rYScale$[ebp]
	mov	DWORD PTR _scale$[ebp+ecx*4], edx
; Line 2490
	jmp	SHORT $L32520
$L32521:
; Line 2493
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	add	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	imul	eax, ecx
	shr	eax, 1
	mov	DWORD PTR _count$[ebp], eax
; Line 2494
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32522
$L32523:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32522:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _count$[ebp]
	jge	$L32524
; Line 2496
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32526
$L32527:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L32526:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+148]
	jge	SHORT $L32528
; Line 2498
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _ptrSrc$[ebp]
	fld	DWORD PTR _scale$[ebp+eax*4]
	fmul	DWORD PTR [ecx]
	fstp	DWORD PTR -192+[ebp]
	mov	edx, DWORD PTR -192+[ebp]
	push	edx
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	add	eax, 4
	mov	DWORD PTR _ptrSrc$[ebp], eax
	call	_eriRoundR32ToInt
	add	esp, 4
	mov	DWORD PTR _nQuantumized$[ebp], eax
; Line 2499
	cmp	DWORD PTR _nQuantumized$[ebp], -128	; ffffff80H
	jge	SHORT $L32529
; Line 2501
	mov	DWORD PTR _nQuantumized$[ebp], -128	; ffffff80H
; Line 2503
	jmp	SHORT $L32530
$L32529:
	cmp	DWORD PTR _nQuantumized$[ebp], 127	; 0000007fH
	jle	SHORT $L32531
; Line 2505
	mov	DWORD PTR _nQuantumized$[ebp], 127	; 0000007fH
$L32531:
$L32530:
; Line 2507
	mov	eax, DWORD PTR _nQuantumized$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	eax, DWORD PTR [ecx+452]
	jg	SHORT $L32532
; Line 2509
	mov	DWORD PTR _nQuantumized$[ebp], 0
$L32532:
; Line 2511
	mov	edx, DWORD PTR _ptrQuantumized$[ebp]
	mov	eax, DWORD PTR _nQuantumized$[ebp]
	mov	DWORD PTR [edx], eax
	mov	ecx, DWORD PTR _ptrQuantumized$[ebp]
	add	ecx, 4
	mov	DWORD PTR _ptrQuantumized$[ebp], ecx
; Line 2512
	jmp	$L32527
$L32528:
; Line 2513
	jmp	$L32523
$L32524:
; Line 2514
	mov	esp, ebp
	pop	ebp
	ret	4
?ArrangeAndQuantumize@ERIEncoder@@IAEXQAE@Z ENDP	; ERIEncoder::ArrangeAndQuantumize
_this$ = -4
?OnEncodedBlock@ERIEncoder@@MAEHJJ@Z PROC NEAR		; ERIEncoder::OnEncodedBlock
; Line 2520
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 2521
	xor	eax, eax
; Line 2522
	mov	esp, ebp
	pop	ebp
	ret	8
?OnEncodedBlock@ERIEncoder@@MAEHJJ@Z ENDP		; ERIEncoder::OnEncodedBlock
_this$ = -4
?OnEncodedLine@ERIEncoder@@MAEHJ@Z PROC NEAR		; ERIEncoder::OnEncodedLine
; Line 2525
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 2526
	xor	eax, eax
; Line 2527
	mov	esp, ebp
	pop	ebp
	ret	4
?OnEncodedLine@ERIEncoder@@MAEHJ@Z ENDP			; ERIEncoder::OnEncodedLine
_TEXT	ENDS
PUBLIC	??0EFileEncodeContext@@QAE@PAVEWriteFileObj@@K@Z ; EFileEncodeContext::EFileEncodeContext
PUBLIC	?WriteNextData@EFileEncodeContext@@UAEKPBEK@Z	; EFileEncodeContext::WriteNextData
PUBLIC	??_7EFileEncodeContext@@6B@			; EFileEncodeContext::`vftable'
PUBLIC	??_GEFileEncodeContext@@UAEPAXI@Z		; EFileEncodeContext::`scalar deleting destructor'
;PUBLIC	??_EEFileEncodeContext@@UAEPAXI@Z		; EFileEncodeContext::`vector deleting destructor'
;	COMDAT ??_7EFileEncodeContext@@6B@
; File I:\EntisGLS\eri-chan\experi\cmperi.cpp
CONST	SEGMENT
??_7EFileEncodeContext@@6B@	LABEL	DWORD
;DD FLAT:??_EEFileEncodeContext@@UAEPAXI@Z ; EFileEncodeContext::`vftable'
	DD	FLAT:??_GEFileEncodeContext@@UAEPAXI@Z
	DD	FLAT:?WriteNextData@EFileEncodeContext@@UAEKPBEK@Z
CONST	ENDS
_TEXT	SEGMENT
_pFileObj$ = 8
_nBufferingSize$ = 12
_this$ = -4
??0EFileEncodeContext@@QAE@PAVEWriteFileObj@@K@Z PROC NEAR ; EFileEncodeContext::EFileEncodeContext
; File I:\EntisGLS\eri-chan\experi\cmperi.cpp
; Line 2540
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _nBufferingSize$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0RLHEncodeContext@@QAE@K@Z		; RLHEncodeContext::RLHEncodeContext
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _pFileObj$[ebp]
	mov	DWORD PTR [ecx+2084], edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EFileEncodeContext@@6B@ ; EFileEncodeContext::`vftable'
; Line 2541
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	8
??0EFileEncodeContext@@QAE@PAVEWriteFileObj@@K@Z ENDP	; EFileEncodeContext::EFileEncodeContext
_TEXT	ENDS
PUBLIC	??1EFileEncodeContext@@UAE@XZ			; EFileEncodeContext::~EFileEncodeContext
;	COMDAT ??_GEFileEncodeContext@@UAEPAXI@Z
_TEXT	SEGMENT
___flags$ = 8
_this$ = -4
??_GEFileEncodeContext@@UAEPAXI@Z PROC NEAR		; EFileEncodeContext::`scalar deleting destructor', COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1EFileEncodeContext@@UAE@XZ		; EFileEncodeContext::~EFileEncodeContext
	mov	eax, DWORD PTR ___flags$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L32547
	mov	ecx, DWORD PTR _this$[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L32547:
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??_GEFileEncodeContext@@UAEPAXI@Z ENDP			; EFileEncodeContext::`scalar deleting destructor'
_TEXT	ENDS
_TEXT	SEGMENT
_this$ = -4
??1EFileEncodeContext@@UAE@XZ PROC NEAR			; EFileEncodeContext::~EFileEncodeContext
; Line 2547
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EFileEncodeContext@@6B@ ; EFileEncodeContext::`vftable'
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1RLHEncodeContext@@UAE@XZ		; RLHEncodeContext::~RLHEncodeContext
; Line 2548
	mov	esp, ebp
	pop	ebp
	ret	0
??1EFileEncodeContext@@UAE@XZ ENDP			; EFileEncodeContext::~EFileEncodeContext
_ptrBuffer$ = 8
_nBytes$ = 12
_this$ = -4
?WriteNextData@EFileEncodeContext@@UAEKPBEK@Z PROC NEAR	; EFileEncodeContext::WriteNextData
; Line 2555
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 2556
	mov	eax, DWORD PTR _nBytes$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrBuffer$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+2084]
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+2084]
	mov	eax, DWORD PTR [edx]
	call	DWORD PTR [eax+4]
; Line 2557
	mov	esp, ebp
	pop	ebp
	ret	8
?WriteNextData@EFileEncodeContext@@UAEKPBEK@Z ENDP	; EFileEncodeContext::WriteNextData
_TEXT	ENDS
PUBLIC	?AttachFileObject@EFileEncodeContext@@QAEXPAVEWriteFileObj@@@Z ; EFileEncodeContext::AttachFileObject
_TEXT	SEGMENT
_pFileObj$ = 8
_this$ = -4
?AttachFileObject@EFileEncodeContext@@QAEXPAVEWriteFileObj@@@Z PROC NEAR ; EFileEncodeContext::AttachFileObject
; Line 2563
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 2564
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _pFileObj$[ebp]
	mov	DWORD PTR [eax+2084], ecx
; Line 2565
	mov	esp, ebp
	pop	ebp
	ret	4
?AttachFileObject@EFileEncodeContext@@QAEXPAVEWriteFileObj@@@Z ENDP ; EFileEncodeContext::AttachFileObject
_TEXT	ENDS
END
