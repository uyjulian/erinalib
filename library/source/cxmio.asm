	TITLE	I:\EntisGLS\eri-chan\experi\cxmio.cpp
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
;	COMDAT ??_GMIOEncoder@@UAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_GMIODecoder@@UAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_7MIODecoder@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
;	COMDAT ??_7MIOEncoder@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
_DATA	SEGMENT
_ERI_PI$S31670 DQ 0400921fb5444261er		; 3.14159
_DATA	ENDS
CONST	SEGMENT
_?freq_width@?4??InitializeWithDegree@MIOEncoder@@IAEXI@Z@4PBHB$S31838 DD 0fffffffaH
	DD	0fffffffaH
	DD	0fffffffbH
	DD	0fffffffcH
	DD	0fffffffdH
	DD	0fffffffeH
	DD	0ffffffffH
	ORG $+4
_?freq_width@?4??InitializeWithDegree@MIODecoder@@IAEXI@Z@4PBHB$S32568 DD 0fffffffaH
	DD	0fffffffaH
	DD	0fffffffbH
	DD	0fffffffcH
	DD	0fffffffdH
	DD	0fffffffeH
	DD	0ffffffffH
CONST	ENDS
PUBLIC	??0PARAMETER@MIOEncoder@@QAE@XZ			; MIOEncoder::PARAMETER::PARAMETER
EXTRN	__fltused:NEAR
_TEXT	SEGMENT
_this$ = -4
??0PARAMETER@MIOEncoder@@QAE@XZ PROC NEAR		; MIOEncoder::PARAMETER::PARAMETER
; File I:\EntisGLS\eri-chan\experi\cxmio.cpp
; Line 41
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 42
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], 0
	mov	DWORD PTR [eax+4], 1074790400		; 40100000H
; Line 43
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+8], 0
	mov	DWORD PTR [ecx+12], 1074266112		; 40080000H
; Line 44
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+16], 0
	mov	DWORD PTR [edx+20], 1071644672		; 3fe00000H
; Line 45
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+24], 1
; Line 46
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+28], 2
; Line 47
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0PARAMETER@MIOEncoder@@QAE@XZ ENDP			; MIOEncoder::PARAMETER::PARAMETER
_TEXT	ENDS
PUBLIC	??0MIOEncoder@@QAE@XZ				; MIOEncoder::MIOEncoder
PUBLIC	?Initialize@MIOEncoder@@UAEHABUMIO_INFO_HEADER@@@Z ; MIOEncoder::Initialize
PUBLIC	?Delete@MIOEncoder@@UAEXXZ			; MIOEncoder::Delete
PUBLIC	?EncodeSound@MIOEncoder@@UAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z ; MIOEncoder::EncodeSound
PUBLIC	??_7MIOEncoder@@6B@				; MIOEncoder::`vftable'
PUBLIC	??_GMIOEncoder@@UAEPAXI@Z			; MIOEncoder::`scalar deleting destructor'
;PUBLIC	??_EMIOEncoder@@UAEPAXI@Z			; MIOEncoder::`vector deleting destructor'
;	COMDAT ??_7MIOEncoder@@6B@
; File I:\EntisGLS\eri-chan\experi\cxmio.cpp
CONST	SEGMENT
??_7MIOEncoder@@6B@	LABEL	DWORD
;DD FLAT:??_EMIOEncoder@@UAEPAXI@Z	; MIOEncoder::`vftable'
	DD	FLAT:??_GMIOEncoder@@UAEPAXI@Z
	DD	FLAT:?Initialize@MIOEncoder@@UAEHABUMIO_INFO_HEADER@@@Z
	DD	FLAT:?Delete@MIOEncoder@@UAEXXZ
	DD	FLAT:?EncodeSound@MIOEncoder@@UAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z
CONST	ENDS
_TEXT	SEGMENT
_this$ = -4
??0MIOEncoder@@QAE@XZ PROC NEAR				; MIOEncoder::MIOEncoder
; File I:\EntisGLS\eri-chan\experi\cxmio.cpp
; Line 53
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 88					; 00000058H
	call	??0PARAMETER@MIOEncoder@@QAE@XZ		; MIOEncoder::PARAMETER::PARAMETER
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7MIOEncoder@@6B@ ; MIOEncoder::`vftable'
; Line 54
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+48], 0
; Line 55
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+52], 0
; Line 56
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+56], 0
; Line 57
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+60], 0
; Line 58
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+64], 0
; Line 59
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+68], 0
; Line 60
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+72], 0
; Line 61
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+76], 0
; Line 62
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+80], 0
; Line 63
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+84], 0
; Line 64
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+192], 0
; Line 65
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0MIOEncoder@@QAE@XZ ENDP				; MIOEncoder::MIOEncoder
_TEXT	ENDS
PUBLIC	??1MIOEncoder@@UAE@XZ				; MIOEncoder::~MIOEncoder
EXTRN	??3@YAXPAX@Z:NEAR				; operator delete
;	COMDAT ??_GMIOEncoder@@UAEPAXI@Z
_TEXT	SEGMENT
___flags$ = 8
_this$ = -4
??_GMIOEncoder@@UAEPAXI@Z PROC NEAR			; MIOEncoder::`scalar deleting destructor', COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1MIOEncoder@@UAE@XZ			; MIOEncoder::~MIOEncoder
	mov	eax, DWORD PTR ___flags$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L31680
	mov	ecx, DWORD PTR _this$[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L31680:
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??_GMIOEncoder@@UAEPAXI@Z ENDP				; MIOEncoder::`scalar deleting destructor'
_TEXT	ENDS
_TEXT	SEGMENT
_this$ = -4
??1MIOEncoder@@UAE@XZ PROC NEAR				; MIOEncoder::~MIOEncoder
; Line 71
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7MIOEncoder@@6B@ ; MIOEncoder::`vftable'
; Line 72
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Delete@MIOEncoder@@UAEXXZ		; MIOEncoder::Delete
; Line 73
	mov	esp, ebp
	pop	ebp
	ret	0
??1MIOEncoder@@UAE@XZ ENDP				; MIOEncoder::~MIOEncoder
_TEXT	ENDS
PUBLIC	?SetCompressionParameter@MIOEncoder@@QAEXABUPARAMETER@1@@Z ; MIOEncoder::SetCompressionParameter
PUBLIC	?InitializeWithDegree@MIOEncoder@@IAEXI@Z	; MIOEncoder::InitializeWithDegree
EXTRN	?eriAllocateMemory@@YAPAXK@Z:NEAR		; eriAllocateMemory
_TEXT	SEGMENT
_infhdr$ = 8
_this$ = -48
_parameter$31700 = -40
_i$31712 = -8
_nBlocksetSamples$31713 = -4
_nLappedSamples$31714 = -44
?Initialize@MIOEncoder@@UAEHABUMIO_INFO_HEADER@@@Z PROC NEAR ; MIOEncoder::Initialize
; Line 79
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 82
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+8]
; Line 85
	mov	esi, DWORD PTR _infhdr$[ebp]
	mov	edi, DWORD PTR _this$[ebp]
	add	edi, 8
	mov	ecx, 10					; 0000000aH
	rep movsd
; Line 88
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+12], 50462720		; 03020000H
	jne	SHORT $L31687
; Line 90
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+16], -4			; fffffffcH
	je	SHORT $L31688
; Line 92
	mov	eax, 1
	jmp	$L31686
$L31688:
; Line 94
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+20], 1
	je	SHORT $L31689
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+20], 2
	je	SHORT $L31689
; Line 96
	mov	eax, 1
	jmp	$L31686
$L31689:
; Line 98
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+44], 8
	je	SHORT $L31690
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+44], 16			; 00000010H
	je	SHORT $L31690
; Line 100
	mov	eax, 1
	jmp	$L31686
$L31690:
; Line 103
	jmp	$L31691
$L31687:
; Line 104
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+12], 5
	je	SHORT $L31693
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+12], 261			; 00000105H
	jne	$L31692
$L31693:
; Line 106
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+16], -1
	je	SHORT $L31694
; Line 108
	mov	eax, 1
	jmp	$L31686
$L31694:
; Line 110
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+20], 1
	je	SHORT $L31695
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+20], 2
	je	SHORT $L31695
; Line 112
	mov	eax, 1
	jmp	$L31686
$L31695:
; Line 114
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+44], 16			; 00000010H
	je	SHORT $L31696
; Line 116
	mov	eax, 1
	jmp	$L31686
$L31696:
; Line 119
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+32], 8
	jb	SHORT $L31698
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+32], 12			; 0000000cH
	jbe	SHORT $L31697
$L31698:
; Line 121
	mov	eax, 1
	jmp	$L31686
$L31697:
; Line 123
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+40], 1
	je	SHORT $L31699
; Line 125
	mov	eax, 1
	jmp	$L31686
$L31699:
; Line 129
	lea	ecx, DWORD PTR _parameter$31700[ebp]
	call	??0PARAMETER@MIOEncoder@@QAE@XZ		; MIOEncoder::PARAMETER::PARAMETER
; Line 130
	lea	eax, DWORD PTR _parameter$31700[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SetCompressionParameter@MIOEncoder@@QAEXABUPARAMETER@1@@Z ; MIOEncoder::SetCompressionParameter
; Line 136
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, 4
	mov	ecx, DWORD PTR [ecx+32]
	shl	edx, cl
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	imul	ecx, edx
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+52], eax
; Line 140
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, 4
	mov	ecx, DWORD PTR [eax+32]
	shl	edx, cl
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	imul	ecx, edx
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+64], eax
; Line 143
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, 4
	mov	ecx, DWORD PTR [eax+32]
	shl	edx, cl
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+68], eax
; Line 147
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, 4
	mov	ecx, DWORD PTR [edx+32]
	shl	eax, cl
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	imul	edx, eax
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+72], eax
; Line 150
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, 4
	mov	ecx, DWORD PTR [edx+32]
	shl	eax, cl
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+76], eax
; Line 155
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, 4
	mov	ecx, DWORD PTR [edx+32]
	shl	eax, cl
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+80], eax
; Line 159
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [edx+20]
	mov	ecx, DWORD PTR [eax+32]
	shl	edx, cl
	mov	DWORD PTR _nBlocksetSamples$31713[ebp], edx
; Line 160
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nBlocksetSamples$31713[ebp]
	imul	ecx, DWORD PTR [eax+40]
	mov	DWORD PTR _nLappedSamples$31714[ebp], ecx
; Line 161
	cmp	DWORD PTR _nLappedSamples$31714[ebp], 0
	jbe	SHORT $L31715
; Line 165
	mov	edx, DWORD PTR _nLappedSamples$31714[ebp]
	shl	edx, 2
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+84], eax
; Line 166
	mov	DWORD PTR _i$31712[ebp], 0
	jmp	SHORT $L31718
$L31719:
	mov	edx, DWORD PTR _i$31712[ebp]
	add	edx, 1
	mov	DWORD PTR _i$31712[ebp], edx
$L31718:
	mov	eax, DWORD PTR _i$31712[ebp]
	cmp	eax, DWORD PTR _nLappedSamples$31714[ebp]
	jae	SHORT $L31720
; Line 168
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+84]
	mov	eax, DWORD PTR _i$31712[ebp]
	mov	DWORD PTR [edx+eax*4], 0
; Line 169
	jmp	SHORT $L31719
$L31720:
$L31715:
; Line 173
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?InitializeWithDegree@MIOEncoder@@IAEXI@Z ; MIOEncoder::InitializeWithDegree
; Line 175
	jmp	SHORT $L31721
$L31692:
; Line 177
	mov	eax, 1
	jmp	SHORT $L31686
$L31721:
$L31691:
; Line 181
	xor	eax, eax
$L31686:
; Line 182
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?Initialize@MIOEncoder@@UAEHABUMIO_INFO_HEADER@@@Z ENDP	; MIOEncoder::Initialize
_TEXT	ENDS
EXTRN	?eriFreeMemory@@YAXPAX@Z:NEAR			; eriFreeMemory
_TEXT	SEGMENT
_this$ = -4
?Delete@MIOEncoder@@UAEXXZ PROC NEAR			; MIOEncoder::Delete
; Line 188
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 189
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+52], 0
	je	SHORT $L31725
; Line 191
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+52]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 192
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+52], 0
$L31725:
; Line 194
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+56], 0
	je	SHORT $L31726
; Line 196
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+56]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 197
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+56], 0
$L31726:
; Line 199
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+60], 0
	je	SHORT $L31727
; Line 201
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+60]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 202
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+60], 0
$L31727:
; Line 204
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	SHORT $L31728
; Line 206
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 207
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+64], 0
$L31728:
; Line 209
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+68], 0
	je	SHORT $L31729
; Line 211
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+68]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 212
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+68], 0
$L31729:
; Line 214
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+72], 0
	je	SHORT $L31730
; Line 216
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 217
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+72], 0
$L31730:
; Line 219
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+76], 0
	je	SHORT $L31731
; Line 221
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 222
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+76], 0
$L31731:
; Line 224
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	je	SHORT $L31732
; Line 226
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+80]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 227
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+80], 0
$L31732:
; Line 229
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+84], 0
	je	SHORT $L31733
; Line 231
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+84]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 232
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+84], 0
$L31733:
; Line 234
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+192], 0
	je	SHORT $L31734
; Line 236
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+192]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 237
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+192], 0
$L31734:
; Line 239
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+48], 0
; Line 240
	mov	esp, ebp
	pop	ebp
	ret	0
?Delete@MIOEncoder@@UAEXXZ ENDP				; MIOEncoder::Delete
_TEXT	ENDS
PUBLIC	?EncodeSoundPCM8@MIOEncoder@@IAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z ; MIOEncoder::EncodeSoundPCM8
PUBLIC	?EncodeSoundPCM16@MIOEncoder@@IAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z ; MIOEncoder::EncodeSoundPCM16
PUBLIC	?EncodeSoundDCT@MIOEncoder@@IAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z ; MIOEncoder::EncodeSoundDCT
PUBLIC	?EncodeSoundDCT_MSS@MIOEncoder@@IAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z ; MIOEncoder::EncodeSoundDCT_MSS
_TEXT	SEGMENT
_context$ = 8
_datahdr$ = 12
_ptrWaveBuf$ = 16
_this$ = -4
?EncodeSound@MIOEncoder@@UAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z PROC NEAR ; MIOEncoder::EncodeSound
; Line 248
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 249
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+12], 50462720		; 03020000H
	jne	SHORT $L31740
; Line 251
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+44], 8
	jne	SHORT $L31741
; Line 253
	mov	edx, DWORD PTR _ptrWaveBuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _datahdr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EncodeSoundPCM8@MIOEncoder@@IAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z ; MIOEncoder::EncodeSoundPCM8
	jmp	$L31739
$L31741:
; Line 255
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+44], 16			; 00000010H
	jne	SHORT $L31743
; Line 257
	mov	eax, DWORD PTR _ptrWaveBuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _datahdr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _context$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EncodeSoundPCM16@MIOEncoder@@IAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z ; MIOEncoder::EncodeSoundPCM16
	jmp	SHORT $L31739
$L31743:
; Line 260
	jmp	SHORT $L31744
$L31740:
; Line 261
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+12], 5
	je	SHORT $L31746
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+12], 261			; 00000105H
	jne	SHORT $L31745
$L31746:
; Line 263
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+44], 16			; 00000010H
	jne	SHORT $L31747
; Line 266
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+20], 2
	jne	SHORT $L31749
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+12], 5
	jne	SHORT $L31748
$L31749:
; Line 268
	mov	edx, DWORD PTR _ptrWaveBuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _datahdr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EncodeSoundDCT@MIOEncoder@@IAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z ; MIOEncoder::EncodeSoundDCT
	jmp	SHORT $L31739
$L31748:
; Line 272
	mov	edx, DWORD PTR _ptrWaveBuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _datahdr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EncodeSoundDCT_MSS@MIOEncoder@@IAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z ; MIOEncoder::EncodeSoundDCT_MSS
	jmp	SHORT $L31739
$L31747:
$L31745:
$L31744:
; Line 277
	mov	eax, 1
$L31739:
; Line 278
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?EncodeSound@MIOEncoder@@UAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z ENDP ; MIOEncoder::EncodeSound
_parameter$ = 8
_this$ = -4
?SetCompressionParameter@MIOEncoder@@QAEXABUPARAMETER@1@@Z PROC NEAR ; MIOEncoder::SetCompressionParameter
; Line 285
	push	ebp
	mov	ebp, esp
	push	ecx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 286
	mov	esi, DWORD PTR _parameter$[ebp]
	mov	edi, DWORD PTR _this$[ebp]
	add	edi, 88					; 00000058H
	mov	ecx, 8
	rep movsd
; Line 287
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?SetCompressionParameter@MIOEncoder@@QAEXABUPARAMETER@1@@Z ENDP ; MIOEncoder::SetCompressionParameter
_TEXT	ENDS
EXTRN	?Flushout@RLHEncodeContext@@QAEHXZ:NEAR		; RLHEncodeContext::Flushout
EXTRN	?PrepareToEncodeERINACode@RLHEncodeContext@@QAEXXZ:NEAR ; RLHEncodeContext::PrepareToEncodeERINACode
EXTRN	?EncodeERINACodesSBZL@RLHEncodeContext@@QAEHPBCH@Z:NEAR ; RLHEncodeContext::EncodeERINACodesSBZL
_TEXT	SEGMENT
_context$ = 8
_datahdr$ = 12
_ptrWaveBuf$ = 16
_this$ = -40
_nSampleCount$ = -8
_ptrDstBuf$ = -24
_ptrSrcBuf$ = -4
_nStep$ = -28
_i$ = -16
_j$ = -20
_bytLeftVal$31772 = -32
_bytCurVal$31776 = -36
_nBytes$ = -12
?EncodeSoundPCM8@MIOEncoder@@IAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z PROC NEAR ; MIOEncoder::EncodeSoundPCM8
; Line 295
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	mov	DWORD PTR _this$[ebp], ecx
; Line 298
	mov	eax, DWORD PTR _datahdr$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _nSampleCount$[ebp], ecx
; Line 299
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	cmp	eax, DWORD PTR [edx+48]
	jbe	SHORT $L31760
; Line 301
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+52], 0
	je	SHORT $L31761
; Line 303
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+52]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31761:
; Line 306
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nSampleCount$[ebp]
	imul	edx, DWORD PTR [ecx+20]
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+52], eax
; Line 307
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	mov	DWORD PTR [edx+48], eax
$L31760:
; Line 311
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+52]
	mov	DWORD PTR _ptrDstBuf$[ebp], edx
; Line 313
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	mov	DWORD PTR _nStep$[ebp], ecx
; Line 315
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31768
$L31769:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31768:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+20]
	jae	SHORT $L31770
; Line 317
	mov	edx, DWORD PTR _ptrWaveBuf$[ebp]
	mov	DWORD PTR _ptrSrcBuf$[ebp], edx
; Line 318
	mov	eax, DWORD PTR _ptrSrcBuf$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _ptrSrcBuf$[ebp], eax
; Line 320
	mov	BYTE PTR _bytLeftVal$31772[ebp], 0
; Line 321
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31773
$L31774:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L31773:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _nSampleCount$[ebp]
	jae	SHORT $L31775
; Line 323
	mov	eax, DWORD PTR _ptrSrcBuf$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR _bytCurVal$31776[ebp], cl
; Line 324
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	add	edx, DWORD PTR _nStep$[ebp]
	mov	DWORD PTR _ptrSrcBuf$[ebp], edx
; Line 325
	mov	eax, DWORD PTR _bytCurVal$31776[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _bytLeftVal$31772[ebp]
	and	ecx, 255				; 000000ffH
	sub	eax, ecx
	mov	edx, DWORD PTR _ptrDstBuf$[ebp]
	mov	BYTE PTR [edx], al
	mov	eax, DWORD PTR _ptrDstBuf$[ebp]
	add	eax, 1
	mov	DWORD PTR _ptrDstBuf$[ebp], eax
; Line 326
	mov	cl, BYTE PTR _bytCurVal$31776[ebp]
	mov	BYTE PTR _bytLeftVal$31772[ebp], cl
; Line 327
	jmp	SHORT $L31774
$L31775:
; Line 328
	jmp	SHORT $L31769
$L31770:
; Line 331
	mov	edx, DWORD PTR _datahdr$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+1]
	and	eax, 1
	test	eax, eax
	je	SHORT $L31777
; Line 333
	mov	ecx, DWORD PTR _context$[ebp]
	call	?PrepareToEncodeERINACode@RLHEncodeContext@@QAEXXZ ; RLHEncodeContext::PrepareToEncodeERINACode
$L31777:
; Line 335
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nSampleCount$[ebp]
	imul	edx, DWORD PTR [ecx+20]
	mov	DWORD PTR _nBytes$[ebp], edx
; Line 337
	mov	eax, DWORD PTR _nBytes$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+52]
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?EncodeERINACodesSBZL@RLHEncodeContext@@QAEHPBCH@Z ; RLHEncodeContext::EncodeERINACodesSBZL
	cmp	eax, DWORD PTR _nBytes$[ebp]
	jge	SHORT $L31780
; Line 339
	mov	eax, 1
	jmp	SHORT $L31758
$L31780:
; Line 341
	mov	ecx, DWORD PTR _context$[ebp]
	call	?Flushout@RLHEncodeContext@@QAEHXZ	; RLHEncodeContext::Flushout
; Line 342
	xor	eax, eax
$L31758:
; Line 343
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?EncodeSoundPCM8@MIOEncoder@@IAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z ENDP ; MIOEncoder::EncodeSoundPCM8
_context$ = 8
_datahdr$ = 12
_ptrWaveBuf$ = 16
_this$ = -80
_i$ = -28
_j$ = -32
_nSampleCount$ = -12
_nChannelCount$ = -40
_nAllSampleCount$ = -24
_ptrDstBuf$ = -36
_ptrSrcBuf$ = -8
_nStep$ = -44
_wLeftVal$31804 = -56
_wLastDelta$31805 = -52
_wCurVal$31809 = -60
_wCurDelta$31810 = -64
_pbytDstBuf1$ = -20
_pbytDstBuf2$ = -4
_pbytSrcBuf$ = -48
_nOffset$31817 = -68
_bytLow$31824 = -72
_bytHigh$31826 = -76
_nBytes$ = -16
?EncodeSoundPCM16@MIOEncoder@@IAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z PROC NEAR ; MIOEncoder::EncodeSoundPCM16
; Line 351
	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H
	mov	DWORD PTR _this$[ebp], ecx
; Line 356
	mov	eax, DWORD PTR _datahdr$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _nSampleCount$[ebp], ecx
; Line 357
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	DWORD PTR _nChannelCount$[ebp], eax
; Line 358
	mov	ecx, DWORD PTR _nSampleCount$[ebp]
	imul	ecx, DWORD PTR _nChannelCount$[ebp]
	mov	DWORD PTR _nAllSampleCount$[ebp], ecx
; Line 360
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	cmp	eax, DWORD PTR [edx+48]
	jbe	SHORT $L31791
; Line 362
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+52], 0
	je	SHORT $L31792
; Line 364
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+52]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31792:
; Line 366
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+56], 0
	je	SHORT $L31793
; Line 368
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+56]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31793:
; Line 371
	mov	ecx, DWORD PTR _nAllSampleCount$[ebp]
	shl	ecx, 1
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+52], eax
; Line 373
	mov	eax, DWORD PTR _nAllSampleCount$[ebp]
	shl	eax, 1
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+56], eax
; Line 375
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	mov	DWORD PTR [edx+48], eax
$L31791:
; Line 380
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+52]
	mov	DWORD PTR _ptrDstBuf$[ebp], edx
; Line 382
	mov	eax, DWORD PTR _nChannelCount$[ebp]
	mov	DWORD PTR _nStep$[ebp], eax
; Line 383
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31800
$L31801:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L31800:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nChannelCount$[ebp]
	jae	$L31802
; Line 385
	mov	eax, DWORD PTR _ptrWaveBuf$[ebp]
	mov	DWORD PTR _ptrSrcBuf$[ebp], eax
; Line 386
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	lea	eax, DWORD PTR [edx+ecx*2]
	mov	DWORD PTR _ptrSrcBuf$[ebp], eax
; Line 388
	mov	WORD PTR _wLeftVal$31804[ebp], 0
; Line 389
	mov	WORD PTR _wLastDelta$31805[ebp], 0
; Line 390
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31806
$L31807:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L31806:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _nSampleCount$[ebp]
	jae	SHORT $L31808
; Line 392
	mov	eax, DWORD PTR _ptrSrcBuf$[ebp]
	mov	cx, WORD PTR [eax]
	mov	WORD PTR _wCurVal$31809[ebp], cx
; Line 393
	mov	edx, DWORD PTR _nStep$[ebp]
	mov	eax, DWORD PTR _ptrSrcBuf$[ebp]
	lea	ecx, DWORD PTR [eax+edx*2]
	mov	DWORD PTR _ptrSrcBuf$[ebp], ecx
; Line 394
	movsx	edx, WORD PTR _wCurVal$31809[ebp]
	movsx	eax, WORD PTR _wLeftVal$31804[ebp]
	sub	edx, eax
	mov	WORD PTR _wCurDelta$31810[ebp], dx
; Line 395
	movsx	ecx, WORD PTR _wCurDelta$31810[ebp]
	movsx	edx, WORD PTR _wLastDelta$31805[ebp]
	sub	ecx, edx
	mov	eax, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _ptrDstBuf$[ebp]
	mov	WORD PTR [edx+eax*2], cx
; Line 396
	mov	ax, WORD PTR _wCurVal$31809[ebp]
	mov	WORD PTR _wLeftVal$31804[ebp], ax
; Line 397
	mov	cx, WORD PTR _wCurDelta$31810[ebp]
	mov	WORD PTR _wLastDelta$31805[ebp], cx
; Line 398
	jmp	SHORT $L31807
$L31808:
; Line 399
	mov	edx, DWORD PTR _nSampleCount$[ebp]
	mov	eax, DWORD PTR _ptrDstBuf$[ebp]
	lea	ecx, DWORD PTR [eax+edx*2]
	mov	DWORD PTR _ptrDstBuf$[ebp], ecx
; Line 400
	jmp	$L31801
$L31802:
; Line 405
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31814
$L31815:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31814:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nChannelCount$[ebp]
	jae	$L31816
; Line 407
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, DWORD PTR _nSampleCount$[ebp]
	shl	ecx, 1
	mov	DWORD PTR _nOffset$31817[ebp], ecx
; Line 408
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+56]
	add	eax, DWORD PTR _nOffset$31817[ebp]
	mov	DWORD PTR _pbytDstBuf1$[ebp], eax
; Line 409
	mov	ecx, DWORD PTR _pbytDstBuf1$[ebp]
	add	ecx, DWORD PTR _nSampleCount$[ebp]
	mov	DWORD PTR _pbytDstBuf2$[ebp], ecx
; Line 410
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+52]
	add	eax, DWORD PTR _nOffset$31817[ebp]
	mov	DWORD PTR _pbytSrcBuf$[ebp], eax
; Line 412
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31821
$L31822:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L31821:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _nSampleCount$[ebp]
	jae	SHORT $L31823
; Line 414
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _pbytSrcBuf$[ebp]
	mov	dl, BYTE PTR [ecx+eax*2]
	mov	BYTE PTR _bytLow$31824[ebp], dl
; Line 415
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _pbytSrcBuf$[ebp]
	mov	dl, BYTE PTR [ecx+eax*2+1]
	mov	BYTE PTR _bytHigh$31826[ebp], dl
; Line 416
	mov	eax, DWORD PTR _pbytDstBuf2$[ebp]
	add	eax, DWORD PTR _j$[ebp]
	mov	cl, BYTE PTR _bytLow$31824[ebp]
	mov	BYTE PTR [eax], cl
; Line 417
	movsx	edx, BYTE PTR _bytHigh$31826[ebp]
	movsx	eax, BYTE PTR _bytLow$31824[ebp]
	sar	eax, 7
	xor	edx, eax
	mov	ecx, DWORD PTR _pbytDstBuf1$[ebp]
	add	ecx, DWORD PTR _j$[ebp]
	mov	BYTE PTR [ecx], dl
; Line 418
	jmp	SHORT $L31822
$L31823:
; Line 419
	jmp	$L31815
$L31816:
; Line 422
	mov	edx, DWORD PTR _datahdr$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+1]
	and	eax, 1
	test	eax, eax
	je	SHORT $L31828
; Line 424
	mov	ecx, DWORD PTR _context$[ebp]
	call	?PrepareToEncodeERINACode@RLHEncodeContext@@QAEXXZ ; RLHEncodeContext::PrepareToEncodeERINACode
$L31828:
; Line 426
	mov	ecx, DWORD PTR _nSampleCount$[ebp]
	imul	ecx, DWORD PTR _nChannelCount$[ebp]
	shl	ecx, 1
	mov	DWORD PTR _nBytes$[ebp], ecx
; Line 428
	mov	edx, DWORD PTR _nBytes$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	push	ecx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?EncodeERINACodesSBZL@RLHEncodeContext@@QAEHPBCH@Z ; RLHEncodeContext::EncodeERINACodesSBZL
	cmp	eax, DWORD PTR _nBytes$[ebp]
	jge	SHORT $L31832
; Line 430
	mov	eax, 1
	jmp	SHORT $L31785
$L31832:
; Line 432
	mov	ecx, DWORD PTR _context$[ebp]
	call	?Flushout@RLHEncodeContext@@QAEHXZ	; RLHEncodeContext::Flushout
; Line 433
	xor	eax, eax
$L31785:
; Line 434
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?EncodeSoundPCM16@MIOEncoder@@IAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z ENDP ; MIOEncoder::EncodeSoundPCM16
_TEXT	ENDS
EXTRN	_eriCreateRevolveParameter:NEAR
_TEXT	SEGMENT
_nSubbandDegree$ = 8
_this$ = -12
_i$ = -4
_j$ = -8
?InitializeWithDegree@MIOEncoder@@IAEXI@Z PROC NEAR	; MIOEncoder::InitializeWithDegree
; Line 440
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 443
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+192], 0
	je	SHORT $L31836
; Line 445
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+192]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31836:
; Line 448
	mov	eax, DWORD PTR _nSubbandDegree$[ebp]
	push	eax
	call	_eriCreateRevolveParameter
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+192], eax
; Line 455
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31841
$L31842:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31841:
	cmp	DWORD PTR _i$[ebp], 7
	jge	SHORT $L31843
; Line 457
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _nSubbandDegree$[ebp]
	add	ecx, DWORD PTR _?freq_width@?4??InitializeWithDegree@MIOEncoder@@IAEXI@Z@4PBHB$S31838[eax*4]
	mov	edx, 1
	shl	edx, cl
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+eax*4+136], edx
; Line 458
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+edx*4+136]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, eax
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+edx*4+164], ecx
; Line 459
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR [edx+ecx*4+136]
	mov	DWORD PTR _j$[ebp], eax
; Line 460
	jmp	SHORT $L31842
$L31843:
; Line 463
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nSubbandDegree$[ebp]
	mov	DWORD PTR [ecx+128], edx
; Line 464
	mov	eax, 1
	mov	ecx, DWORD PTR _nSubbandDegree$[ebp]
	shl	eax, cl
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+132], eax
; Line 465
	mov	esp, ebp
	pop	ebp
	ret	4
?InitializeWithDegree@MIOEncoder@@IAEXI@Z ENDP		; MIOEncoder::InitializeWithDegree
_TEXT	ENDS
PUBLIC	?EvaluateVolume@MIOEncoder@@IAENPBMH@Z		; MIOEncoder::EvaluateVolume
EXTRN	_fabs:NEAR
_TEXT	SEGMENT
_ptrWave$ = 8
_nCount$ = 12
_this$ = -16
_rVolume$ = -12
_i$ = -4
?EvaluateVolume@MIOEncoder@@IAENPBMH@Z PROC NEAR	; MIOEncoder::EvaluateVolume
; Line 471
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 472
	mov	DWORD PTR _rVolume$[ebp], 0
	mov	DWORD PTR _rVolume$[ebp+4], 0
; Line 473
	mov	DWORD PTR _i$[ebp], 1
	jmp	SHORT $L31850
$L31851:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31850:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _nCount$[ebp]
	jge	SHORT $L31852
; Line 475
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrWave$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _ptrWave$[ebp]
	fld	DWORD PTR [eax+edx*4]
	fsub	DWORD PTR [esi+ecx*4-4]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_fabs
	add	esp, 8
	fadd	QWORD PTR _rVolume$[ebp]
	fstp	QWORD PTR _rVolume$[ebp]
; Line 476
	jmp	SHORT $L31851
$L31852:
; Line 477
	mov	edx, DWORD PTR _nCount$[ebp]
	sub	edx, 1
	mov	DWORD PTR -20+[ebp], edx
	fild	DWORD PTR -20+[ebp]
	fstp	QWORD PTR -28+[ebp]
	fld	QWORD PTR _rVolume$[ebp]
	fdiv	QWORD PTR -28+[ebp]
	fstp	QWORD PTR _rVolume$[ebp]
; Line 478
	fld	QWORD PTR _rVolume$[ebp]
; Line 479
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
?EvaluateVolume@MIOEncoder@@IAENPBMH@Z ENDP		; MIOEncoder::EvaluateVolume
_TEXT	ENDS
PUBLIC	?GetDivisionCode@MIOEncoder@@IAEHPBM@Z		; MIOEncoder::GetDivisionCode
_TEXT	SEGMENT
_ptrSamples$ = 8
_this$ = -40
_rSum$ = -28
_rAvg$ = -8
_nDegreeWidth$ = -12
_nCount$ = -20
_i$ = -16
_rVol$31864 = -36
?GetDivisionCode@MIOEncoder@@IAEHPBM@Z PROC NEAR	; MIOEncoder::GetDivisionCode
; Line 485
	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 486
	mov	DWORD PTR _rSum$[ebp], 0
	mov	DWORD PTR _rSum$[ebp+4], 0
; Line 487
	mov	DWORD PTR _rAvg$[ebp], 0
	mov	DWORD PTR _rAvg$[ebp+4], 0
; Line 488
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, 1
	mov	ecx, DWORD PTR [eax+32]
	shl	edx, cl
	mov	DWORD PTR _nDegreeWidth$[ebp], edx
; Line 489
	mov	eax, DWORD PTR _nDegreeWidth$[ebp]
	cdq
	and	edx, 63					; 0000003fH
	add	eax, edx
	sar	eax, 6
	mov	DWORD PTR _nCount$[ebp], eax
; Line 491
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31861
$L31862:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31861:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _nCount$[ebp]
	jge	SHORT $L31863
; Line 493
	push	64					; 00000040H
	mov	edx, DWORD PTR _ptrSamples$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EvaluateVolume@MIOEncoder@@IAENPBMH@Z	; MIOEncoder::EvaluateVolume
	fstp	QWORD PTR _rVol$31864[ebp]
; Line 494
	cmp	DWORD PTR _i$[ebp], 1
	jl	SHORT $L31865
	mov	eax, DWORD PTR _this$[ebp]
	fild	DWORD PTR [eax+116]
	fstp	QWORD PTR -48+[ebp]
	fld	QWORD PTR _rAvg$[ebp]
	fmul	QWORD PTR -48+[ebp]
	fcomp	QWORD PTR _rVol$31864[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	je	SHORT $L31865
; Line 496
	mov	eax, 2
	jmp	SHORT $L31855
$L31865:
; Line 498
	mov	ecx, DWORD PTR _ptrSamples$[ebp]
	add	ecx, 256				; 00000100H
	mov	DWORD PTR _ptrSamples$[ebp], ecx
; Line 499
	fld	QWORD PTR _rSum$[ebp]
	fadd	QWORD PTR _rVol$31864[ebp]
	fstp	QWORD PTR _rSum$[ebp]
; Line 500
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR -52+[ebp], edx
	fild	DWORD PTR -52+[ebp]
	fstp	QWORD PTR -60+[ebp]
	fld	QWORD PTR _rSum$[ebp]
	fdiv	QWORD PTR -60+[ebp]
	fstp	QWORD PTR _rAvg$[ebp]
; Line 501
	jmp	SHORT $L31862
$L31863:
; Line 503
	xor	eax, eax
$L31855:
; Line 504
	mov	esp, ebp
	pop	ebp
	ret	4
?GetDivisionCode@MIOEncoder@@IAEHPBM@Z ENDP		; MIOEncoder::GetDivisionCode
_TEXT	ENDS
PUBLIC	?EncodeInternalBlock@MIOEncoder@@IAEHAAVRLHEncodeContext@@PAMM@Z ; MIOEncoder::EncodeInternalBlock
PUBLIC	?EncodeLeadBlock@MIOEncoder@@IAEHAAVRLHEncodeContext@@PAMM@Z ; MIOEncoder::EncodeLeadBlock
PUBLIC	?EncodePostBlock@MIOEncoder@@IAEHAAVRLHEncodeContext@@M@Z ; MIOEncoder::EncodePostBlock
EXTRN	?OutNBits@RLHEncodeContext@@QAEHKH@Z:NEAR	; RLHEncodeContext::OutNBits
EXTRN	??2@YAPAXI@Z:NEAR				; operator new
CONST	SEGMENT
$T32976	DD	03f880000r			; 1.0625
CONST	ENDS
_TEXT	SEGMENT
_context$ = 8
_datahdr$ = 12
_ptrWaveBuf$ = 16
_this$ = -116
_nDegreeWidth$ = -32
_nSampleCount$ = -12
_nSubbandCount$ = -8
_nChannelCount$ = -52
_nAllSampleCount$ = -20
_i$ = -36
_j$ = -40
_k$ = -48
_ptrSrcBuf$ = -4
_pLastDivision$ = -44
_nCurrentDivision$ = -16
_ptrSubbandHead$31898 = -64
_nCopySamples$31899 = -60
_ptrSrcHead$31904 = -80
_nChannelStep$31912 = -92
_rPowerScale$31913 = -76
_nDivisionCode$31915 = -88
_nDivisionCount$31916 = -84
_fLeadBlock$31921 = -72
_ptrNextSamples$31928 = -68
_nChannelStep$31940 = -96
_ptrHBuf$ = -24
_ptrLBuf$ = -56
_nAllSubbandCount$ = -28
$T32975 = -112
_nValue$31955 = -104
_nLow$31956 = -108
_nHigh$31958 = -100
?EncodeSoundDCT@MIOEncoder@@IAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z PROC NEAR ; MIOEncoder::EncodeSoundDCT
; Line 512
	push	ebp
	mov	ebp, esp
	sub	esp, 128				; 00000080H
	mov	DWORD PTR _this$[ebp], ecx
; Line 516
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, 1
	mov	ecx, DWORD PTR [eax+32]
	shl	edx, cl
	mov	DWORD PTR _nDegreeWidth$[ebp], edx
; Line 518
	mov	eax, DWORD PTR _datahdr$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	edx, DWORD PTR _nDegreeWidth$[ebp]
	lea	eax, DWORD PTR [ecx+edx-1]
	mov	ecx, DWORD PTR _nDegreeWidth$[ebp]
	sub	ecx, 1
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _nSampleCount$[ebp], eax
; Line 520
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	mov	ecx, DWORD PTR [edx+32]
	shr	eax, cl
	mov	DWORD PTR _nSubbandCount$[ebp], eax
; Line 521
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	mov	DWORD PTR _nChannelCount$[ebp], edx
; Line 522
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	imul	eax, DWORD PTR _nChannelCount$[ebp]
	mov	DWORD PTR _nAllSampleCount$[ebp], eax
; Line 524
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nSampleCount$[ebp]
	cmp	edx, DWORD PTR [ecx+48]
	jbe	SHORT $L31876
; Line 526
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+56], 0
	je	SHORT $L31877
; Line 528
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+56]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31877:
; Line 530
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+60], 0
	je	SHORT $L31878
; Line 532
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31878:
; Line 535
	mov	eax, DWORD PTR _nAllSampleCount$[ebp]
	shl	eax, 1
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+56], eax
; Line 537
	mov	edx, DWORD PTR _nAllSampleCount$[ebp]
	shl	edx, 1
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+60], eax
; Line 538
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	mov	DWORD PTR [edx+48], eax
$L31876:
; Line 541
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+56]
	mov	DWORD PTR [ecx+120], eax
; Line 545
	mov	ecx, DWORD PTR _datahdr$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx+1]
	and	edx, 1
	test	edx, edx
	je	SHORT $L31883
; Line 547
	mov	ecx, DWORD PTR _context$[ebp]
	call	?PrepareToEncodeERINACode@RLHEncodeContext@@QAEXXZ ; RLHEncodeContext::PrepareToEncodeERINACode
$L31883:
; Line 549
	push	1
	push	0
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 554
	mov	eax, DWORD PTR _ptrWaveBuf$[ebp]
	mov	DWORD PTR _ptrSrcBuf$[ebp], eax
; Line 555
	mov	ecx, DWORD PTR _nChannelCount$[ebp]
	shl	ecx, 2
	push	ecx
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR _pLastDivision$[ebp], eax
; Line 556
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31891
$L31892:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31891:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nChannelCount$[ebp]
	jae	SHORT $L31893
; Line 558
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _pLastDivision$[ebp]
	mov	DWORD PTR [edx+ecx*4], -1
; Line 559
	jmp	SHORT $L31892
$L31893:
; Line 560
	mov	DWORD PTR _nCurrentDivision$[ebp], -1
; Line 562
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31895
$L31896:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31895:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _nSubbandCount$[ebp]
	jae	$L31897
; Line 565
	mov	edx, DWORD PTR _nDegreeWidth$[ebp]
	imul	edx, DWORD PTR _nChannelCount$[ebp]
	imul	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrSrcBuf$[ebp]
	lea	ecx, DWORD PTR [eax+edx*2]
	mov	DWORD PTR _ptrSubbandHead$31898[ebp], ecx
; Line 568
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, DWORD PTR _nDegreeWidth$[ebp]
	mov	eax, DWORD PTR _datahdr$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	sub	ecx, edx
	mov	DWORD PTR _nCopySamples$31899[ebp], ecx
; Line 569
	mov	edx, DWORD PTR _nCopySamples$31899[ebp]
	cmp	edx, DWORD PTR _nDegreeWidth$[ebp]
	jbe	SHORT $L31900
; Line 571
	mov	eax, DWORD PTR _nDegreeWidth$[ebp]
	mov	DWORD PTR _nCopySamples$31899[ebp], eax
$L31900:
; Line 574
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31901
$L31902:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L31901:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _nChannelCount$[ebp]
	jae	$L31903
; Line 579
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _ptrSubbandHead$31898[ebp]
	lea	edx, DWORD PTR [ecx+eax*2]
	mov	DWORD PTR _ptrSrcHead$31904[ebp], edx
; Line 581
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L31905
$L31906:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L31905:
	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR _nCopySamples$31899[ebp]
	jae	SHORT $L31907
; Line 583
	mov	edx, DWORD PTR _ptrSrcHead$31904[ebp]
	movsx	eax, WORD PTR [edx]
	mov	DWORD PTR -120+[ebp], eax
	fild	DWORD PTR -120+[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	mov	eax, DWORD PTR _k$[ebp]
	fstp	DWORD PTR [edx+eax*4]
; Line 584
	mov	ecx, DWORD PTR _nChannelCount$[ebp]
	mov	edx, DWORD PTR _ptrSrcHead$31904[ebp]
	lea	eax, DWORD PTR [edx+ecx*2]
	mov	DWORD PTR _ptrSrcHead$31904[ebp], eax
; Line 585
	jmp	SHORT $L31906
$L31907:
$L31910:
; Line 586
	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR _nDegreeWidth$[ebp]
	jae	SHORT $L31911
; Line 588
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+64]
	mov	ecx, DWORD PTR _k$[ebp]
	mov	DWORD PTR [eax+ecx*4], 0
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
; Line 589
	jmp	SHORT $L31910
$L31911:
; Line 593
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nDegreeWidth$[ebp]
	imul	ecx, DWORD PTR [eax+40]
	imul	ecx, DWORD PTR _j$[ebp]
	mov	DWORD PTR _nChannelStep$31912[ebp], ecx
; Line 594
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+84]
	mov	ecx, DWORD PTR _nChannelStep$31912[ebp]
	lea	edx, DWORD PTR [eax+ecx*4]
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+124], edx
; Line 598
	mov	ecx, DWORD PTR _this$[ebp]
	fld	QWORD PTR [ecx+104]
	fstp	DWORD PTR _rPowerScale$31913[ebp]
; Line 599
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+64]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetDivisionCode@MIOEncoder@@IAEHPBM@Z	; MIOEncoder::GetDivisionCode
	mov	DWORD PTR _nDivisionCode$31915[ebp], eax
; Line 600
	mov	edx, 1
	mov	ecx, DWORD PTR _nDivisionCode$31915[ebp]
	shl	edx, cl
	mov	DWORD PTR _nDivisionCount$31916[ebp], edx
; Line 602
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L31917
$L31918:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L31917:
	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR _nDivisionCode$31915[ebp]
	jae	SHORT $L31919
; Line 604
	fld	DWORD PTR _rPowerScale$31913[ebp]
	fmul	DWORD PTR $T32976
	fstp	DWORD PTR _rPowerScale$31913[ebp]
; Line 605
	jmp	SHORT $L31918
$L31919:
; Line 607
	push	2
	mov	edx, DWORD PTR _nDivisionCode$31915[ebp]
	shl	edx, 30					; 0000001eH
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 611
	mov	BYTE PTR _fLeadBlock$31921[ebp], 0
; Line 613
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _pLastDivision$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4]
	cmp	edx, DWORD PTR _nDivisionCode$31915[ebp]
	je	SHORT $L31922
; Line 618
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L31923
; Line 620
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _pLastDivision$[ebp]
	mov	edx, DWORD PTR _nCurrentDivision$[ebp]
	cmp	edx, DWORD PTR [ecx+eax*4]
	je	SHORT $L31924
; Line 623
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _pLastDivision$[ebp]
	mov	eax, DWORD PTR [eax+32]
	sub	eax, DWORD PTR [edx+ecx*4]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?InitializeWithDegree@MIOEncoder@@IAEXI@Z ; MIOEncoder::InitializeWithDegree
; Line 624
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _pLastDivision$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _nCurrentDivision$[ebp], eax
$L31924:
; Line 627
	mov	ecx, DWORD PTR _this$[ebp]
	fld	QWORD PTR [ecx+104]
	fstp	DWORD PTR -124+[ebp]
	fld	DWORD PTR -124+[ebp]
	push	ecx
	fstp	DWORD PTR [esp]
	mov	edx, DWORD PTR _context$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EncodePostBlock@MIOEncoder@@IAEHAAVRLHEncodeContext@@M@Z ; MIOEncoder::EncodePostBlock
	test	eax, eax
	je	SHORT $L31926
; Line 629
	mov	eax, 1
	jmp	$L31870
$L31926:
$L31923:
; Line 635
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _pLastDivision$[ebp]
	mov	edx, DWORD PTR _nDivisionCode$31915[ebp]
	mov	DWORD PTR [ecx+eax*4], edx
; Line 636
	mov	BYTE PTR _fLeadBlock$31921[ebp], 1
$L31922:
; Line 638
	mov	eax, DWORD PTR _nCurrentDivision$[ebp]
	cmp	eax, DWORD PTR _nDivisionCode$31915[ebp]
	je	SHORT $L31927
; Line 641
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	sub	edx, DWORD PTR _nDivisionCode$31915[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?InitializeWithDegree@MIOEncoder@@IAEXI@Z ; MIOEncoder::InitializeWithDegree
; Line 642
	mov	eax, DWORD PTR _nDivisionCode$31915[ebp]
	mov	DWORD PTR _nCurrentDivision$[ebp], eax
$L31927:
; Line 647
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	mov	DWORD PTR _ptrNextSamples$31928[ebp], edx
; Line 649
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L31929
$L31930:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L31929:
	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR _nDivisionCount$31916[ebp]
	jae	SHORT $L31931
; Line 651
	mov	edx, DWORD PTR _fLeadBlock$31921[ebp]
	and	edx, 255				; 000000ffH
	test	edx, edx
	je	SHORT $L31932
; Line 657
	mov	eax, DWORD PTR _rPowerScale$31913[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrNextSamples$31928[ebp]
	push	ecx
	mov	edx, DWORD PTR _context$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EncodeLeadBlock@MIOEncoder@@IAEHAAVRLHEncodeContext@@PAMM@Z ; MIOEncoder::EncodeLeadBlock
	test	eax, eax
	je	SHORT $L31933
; Line 659
	mov	eax, 1
	jmp	$L31870
$L31933:
; Line 662
	mov	BYTE PTR _fLeadBlock$31921[ebp], 0
; Line 664
	jmp	SHORT $L31934
$L31932:
; Line 670
	mov	eax, DWORD PTR _rPowerScale$31913[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrNextSamples$31928[ebp]
	push	ecx
	mov	edx, DWORD PTR _context$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EncodeInternalBlock@MIOEncoder@@IAEHAAVRLHEncodeContext@@PAMM@Z ; MIOEncoder::EncodeInternalBlock
	test	eax, eax
	je	SHORT $L31935
; Line 672
	mov	eax, 1
	jmp	$L31870
$L31935:
$L31934:
; Line 678
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	mov	edx, DWORD PTR _ptrNextSamples$31928[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _ptrNextSamples$31928[ebp], eax
; Line 679
	jmp	SHORT $L31930
$L31931:
; Line 680
	jmp	$L31902
$L31903:
; Line 681
	jmp	$L31896
$L31897:
; Line 685
	cmp	DWORD PTR _nSubbandCount$[ebp], 0
	jbe	$L31936
; Line 687
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31937
$L31938:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L31937:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nChannelCount$[ebp]
	jae	$L31939
; Line 689
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nDegreeWidth$[ebp]
	imul	ecx, DWORD PTR [eax+40]
	imul	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _nChannelStep$31940[ebp], ecx
; Line 690
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+84]
	mov	ecx, DWORD PTR _nChannelStep$31940[ebp]
	lea	edx, DWORD PTR [eax+ecx*4]
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+124], edx
; Line 692
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _pLastDivision$[ebp]
	mov	eax, DWORD PTR _nCurrentDivision$[ebp]
	cmp	eax, DWORD PTR [edx+ecx*4]
	je	SHORT $L31941
; Line 695
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _pLastDivision$[ebp]
	mov	ecx, DWORD PTR [ecx+32]
	sub	ecx, DWORD PTR [eax+edx*4]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?InitializeWithDegree@MIOEncoder@@IAEXI@Z ; MIOEncoder::InitializeWithDegree
; Line 696
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _pLastDivision$[ebp]
	mov	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _nCurrentDivision$[ebp], ecx
$L31941:
; Line 699
	mov	edx, DWORD PTR _this$[ebp]
	fld	QWORD PTR [edx+104]
	fstp	DWORD PTR -128+[ebp]
	fld	DWORD PTR -128+[ebp]
	push	ecx
	fstp	DWORD PTR [esp]
	mov	eax, DWORD PTR _context$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EncodePostBlock@MIOEncoder@@IAEHAAVRLHEncodeContext@@M@Z ; MIOEncoder::EncodePostBlock
	test	eax, eax
	je	SHORT $L31943
; Line 701
	mov	eax, 1
	jmp	$L31870
$L31943:
; Line 703
	jmp	$L31938
$L31939:
$L31936:
; Line 706
	mov	ecx, DWORD PTR _pLastDivision$[ebp]
	mov	DWORD PTR $T32975[ebp], ecx
	mov	edx, DWORD PTR $T32975[ebp]
	push	edx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
; Line 710
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+60]
	mov	DWORD PTR _ptrHBuf$[ebp], ecx
; Line 711
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+60]
	add	eax, DWORD PTR _nAllSampleCount$[ebp]
	mov	DWORD PTR _ptrLBuf$[ebp], eax
; Line 712
	mov	ecx, DWORD PTR _nSubbandCount$[ebp]
	imul	ecx, DWORD PTR _nChannelCount$[ebp]
	mov	DWORD PTR _nAllSubbandCount$[ebp], ecx
; Line 714
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31948
$L31949:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31948:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nDegreeWidth$[ebp]
	jae	$L31950
; Line 716
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+56]
	mov	eax, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [edx+eax*2]
	mov	DWORD PTR _ptrSrcBuf$[ebp], ecx
; Line 718
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31952
$L31953:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L31952:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _nAllSubbandCount$[ebp]
	jae	SHORT $L31954
; Line 720
	mov	ecx, DWORD PTR _ptrSrcBuf$[ebp]
	mov	dx, WORD PTR [ecx]
	mov	WORD PTR _nValue$31955[ebp], dx
; Line 721
	mov	eax, DWORD PTR _nDegreeWidth$[ebp]
	mov	ecx, DWORD PTR _ptrSrcBuf$[ebp]
	lea	edx, DWORD PTR [ecx+eax*2]
	mov	DWORD PTR _ptrSrcBuf$[ebp], edx
; Line 722
	movsx	eax, WORD PTR _nValue$31955[ebp]
	shl	eax, 8
	sar	eax, 8
	mov	BYTE PTR _nLow$31956[ebp], al
; Line 723
	movsx	ecx, WORD PTR _nValue$31955[ebp]
	sar	ecx, 8
	movsx	edx, BYTE PTR _nLow$31956[ebp]
	sar	edx, 7
	xor	ecx, edx
	mov	BYTE PTR _nHigh$31958[ebp], cl
; Line 724
	mov	eax, DWORD PTR _ptrHBuf$[ebp]
	mov	cl, BYTE PTR _nHigh$31958[ebp]
	mov	BYTE PTR [eax], cl
	mov	edx, DWORD PTR _ptrHBuf$[ebp]
	add	edx, 1
	mov	DWORD PTR _ptrHBuf$[ebp], edx
; Line 725
	mov	eax, DWORD PTR _ptrLBuf$[ebp]
	mov	cl, BYTE PTR _nLow$31956[ebp]
	mov	BYTE PTR [eax], cl
	mov	edx, DWORD PTR _ptrLBuf$[ebp]
	add	edx, 1
	mov	DWORD PTR _ptrLBuf$[ebp], edx
; Line 726
	jmp	SHORT $L31953
$L31954:
; Line 727
	jmp	$L31949
$L31950:
; Line 729
	push	1
	push	0
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 732
	mov	eax, DWORD PTR _nAllSampleCount$[ebp]
	shl	eax, 1
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?EncodeERINACodesSBZL@RLHEncodeContext@@QAEHPBCH@Z ; RLHEncodeContext::EncodeERINACodesSBZL
	mov	ecx, DWORD PTR _nAllSampleCount$[ebp]
	shl	ecx, 1
	cmp	eax, ecx
	jge	SHORT $L31961
; Line 734
	mov	eax, 1
	jmp	SHORT $L31870
$L31961:
; Line 737
	mov	ecx, DWORD PTR _context$[ebp]
	call	?Flushout@RLHEncodeContext@@QAEHXZ	; RLHEncodeContext::Flushout
; Line 739
	xor	eax, eax
$L31870:
; Line 740
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?EncodeSoundDCT@MIOEncoder@@IAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z ENDP ; MIOEncoder::EncodeSoundDCT
_TEXT	ENDS
PUBLIC	?PerformLOT@MIOEncoder@@IAEXAAVRLHEncodeContext@@PAMM@Z ; MIOEncoder::PerformLOT
PUBLIC	?Quantumize@MIOEncoder@@IAEXPAHPBMHMPAK0@Z	; MIOEncoder::Quantumize
EXTRN	_eriScalarMultiply:NEAR
EXTRN	_eriFastDCT:NEAR
EXTRN	_eriFastPLOT:NEAR
EXTRN	_eriFastLOT:NEAR
EXTRN	_eriOddGivensMatrix:NEAR
EXTRN	_sqrt:NEAR
CONST	SEGMENT
$T32977	DQ	04000000000000000r		; 2
CONST	ENDS
_TEXT	SEGMENT
_context$ = 8
_ptrSamples$ = 12
_rPowerScale$ = 16
_this$ = -20
_rMatrixScale$ = -4
_i$ = -12
_nWeightCode$ = -16
_nCoefficient$ = -8
?PerformLOT@MIOEncoder@@IAEXAAVRLHEncodeContext@@PAMM@Z PROC NEAR ; MIOEncoder::PerformLOT
; Line 748
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 752
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	mov	DWORD PTR -28+[ebp], ecx
	mov	DWORD PTR -28+[ebp+4], 0
	fild	QWORD PTR -28+[ebp]
	fstp	QWORD PTR -36+[ebp]
	fld	QWORD PTR $T32977
	fdiv	QWORD PTR -36+[ebp]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_sqrt
	add	esp, 8
	fstp	DWORD PTR _rMatrixScale$[ebp]
; Line 755
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+128]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	push	edx
	mov	eax, DWORD PTR _ptrSamples$[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+68]
	push	edx
	call	_eriFastDCT
	add	esp, 20					; 00000014H
; Line 757
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	push	ecx
	mov	edx, DWORD PTR _rMatrixScale$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+68]
	push	ecx
	call	_eriScalarMultiply
	add	esp, 12					; 0000000cH
; Line 762
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+128]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+68]
	push	edx
	call	_eriFastPLOT
	add	esp, 8
; Line 765
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+68]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	push	ecx
	call	_eriFastLOT
	add	esp, 16					; 00000010H
; Line 767
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+128]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+192]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	push	ecx
	call	_eriOddGivensMatrix
	add	esp, 12					; 0000000cH
; Line 769
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31970
$L31971:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31970:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+132]
	jae	SHORT $L31972
; Line 771
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+68]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+esi*4]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 772
	jmp	SHORT $L31971
$L31972:
; Line 781
	lea	ecx, DWORD PTR _nCoefficient$[ebp]
	push	ecx
	lea	edx, DWORD PTR _nWeightCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _rPowerScale$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+132]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+52]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Quantumize@MIOEncoder@@IAEXPAHPBMHMPAK0@Z ; MIOEncoder::Quantumize
; Line 785
	push	32					; 00000020H
	mov	ecx, DWORD PTR _nWeightCode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 786
	push	16					; 00000010H
	mov	edx, DWORD PTR _nCoefficient$[ebp]
	shl	edx, 16					; 00000010H
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 787
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?PerformLOT@MIOEncoder@@IAEXAAVRLHEncodeContext@@PAMM@Z ENDP ; MIOEncoder::PerformLOT
_context$ = 8
_ptrSamples$ = 12
_rPowerScale$ = 16
_this$ = -8
_i$ = -4
?EncodeInternalBlock@MIOEncoder@@IAEHAAVRLHEncodeContext@@PAMM@Z PROC NEAR ; MIOEncoder::EncodeInternalBlock
; Line 795
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 799
	mov	eax, DWORD PTR _rPowerScale$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrSamples$[ebp]
	push	ecx
	mov	edx, DWORD PTR _context$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?PerformLOT@MIOEncoder@@IAEXAAVRLHEncodeContext@@PAMM@Z ; MIOEncoder::PerformLOT
; Line 803
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31983
$L31984:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31983:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+132]
	jae	SHORT $L31985
; Line 805
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+52]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+120]
	mov	edx, DWORD PTR _i$[ebp]
	mov	cx, WORD PTR [ecx+edx*4]
	mov	WORD PTR [eax], cx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+120]
	add	eax, 2
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+120], eax
; Line 806
	jmp	SHORT $L31984
$L31985:
; Line 807
	xor	eax, eax
; Line 808
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?EncodeInternalBlock@MIOEncoder@@IAEHAAVRLHEncodeContext@@PAMM@Z ENDP ; MIOEncoder::EncodeInternalBlock
_context$ = 8
_ptrSamples$ = 12
_rPowerScale$ = 16
_this$ = -16
_i$ = -4
_ptrSrcBuffer$ = -12
_nHalfDegree$ = -8
?EncodeLeadBlock@MIOEncoder@@IAEHAAVRLHEncodeContext@@PAMM@Z PROC NEAR ; MIOEncoder::EncodeLeadBlock
; Line 816
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 821
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31994
$L31995:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31994:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+132]
	jae	SHORT $L31996
; Line 823
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx+edx*4], 0
; Line 824
	jmp	SHORT $L31995
$L31996:
; Line 828
	mov	eax, DWORD PTR _rPowerScale$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrSamples$[ebp]
	push	ecx
	mov	edx, DWORD PTR _context$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?PerformLOT@MIOEncoder@@IAEXAAVRLHEncodeContext@@PAMM@Z ; MIOEncoder::PerformLOT
; Line 832
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+52]
	mov	DWORD PTR _ptrSrcBuffer$[ebp], ecx
; Line 833
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+132]
	shr	eax, 1
	mov	DWORD PTR _nHalfDegree$[ebp], eax
; Line 834
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32000
$L32001:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32000:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nHalfDegree$[ebp]
	jae	SHORT $L32002
; Line 836
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 1
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+120]
	mov	ecx, DWORD PTR _ptrSrcBuffer$[ebp]
	mov	ax, WORD PTR [ecx+eax*4+4]
	mov	WORD PTR [edx], ax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+120]
	add	edx, 2
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+120], edx
; Line 837
	jmp	SHORT $L32001
$L32002:
; Line 838
	xor	eax, eax
; Line 839
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?EncodeLeadBlock@MIOEncoder@@IAEHAAVRLHEncodeContext@@PAMM@Z ENDP ; MIOEncoder::EncodeLeadBlock
_context$ = 8
_rPowerScale$ = 12
_this$ = -20
_i$ = -8
_ptrSamples$ = -4
_ptrSrcBuffer$ = -16
_nHalfDegree$ = -12
?EncodePostBlock@MIOEncoder@@IAEHAAVRLHEncodeContext@@M@Z PROC NEAR ; MIOEncoder::EncodePostBlock
; Line 846
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 851
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+52]
	mov	DWORD PTR _ptrSamples$[ebp], ecx
; Line 852
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32011
$L32012:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32011:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+132]
	jae	SHORT $L32013
; Line 854
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrSamples$[ebp]
	mov	DWORD PTR [eax+edx*4], 0
; Line 855
	jmp	SHORT $L32012
$L32013:
; Line 859
	mov	ecx, DWORD PTR _rPowerScale$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrSamples$[ebp]
	push	edx
	mov	eax, DWORD PTR _context$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?PerformLOT@MIOEncoder@@IAEXAAVRLHEncodeContext@@PAMM@Z ; MIOEncoder::PerformLOT
; Line 863
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+52]
	mov	DWORD PTR _ptrSrcBuffer$[ebp], edx
; Line 864
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	shr	ecx, 1
	mov	DWORD PTR _nHalfDegree$[ebp], ecx
; Line 865
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32017
$L32018:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32017:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nHalfDegree$[ebp]
	jae	SHORT $L32019
; Line 867
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+120]
	mov	edx, DWORD PTR _ptrSrcBuffer$[ebp]
	mov	cx, WORD PTR [edx+ecx*4+4]
	mov	WORD PTR [eax], cx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+120]
	add	eax, 2
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+120], eax
; Line 868
	jmp	SHORT $L32018
$L32019:
; Line 869
	xor	eax, eax
; Line 870
	mov	esp, ebp
	pop	ebp
	ret	8
?EncodePostBlock@MIOEncoder@@IAEHAAVRLHEncodeContext@@M@Z ENDP ; MIOEncoder::EncodePostBlock
_TEXT	ENDS
EXTRN	_eriRoundR32ToInt:NEAR
EXTRN	_log:NEAR
EXTRN	_pow:NEAR
CONST	SEGMENT
$T32978	DQ	0401c000000000000r		; 7
$T32979	DQ	03ff0000000000000r		; 1
$T32980	DQ	00000000000000000r		; 0
$T32981	DQ	03fe0000000000000r		; 0.5
$T32982	DD	03f000000r			; 0.5
	ORG $+4
$T32983	DQ	040de000000000000r		; 30720
CONST	ENDS
_TEXT	SEGMENT
_ptrQuantumized$ = 8
_ptrSource$ = 12
_nDegreeNum$ = 16
_rPowerScale$ = 20
_ptrWeightCode$ = 24
_ptrCoefficient$ = 28
_this$ = -228
_i$ = -92
_j$ = -108
_nHalfDegree$ = -104
_rPresetWeight$ = -76
_rAvgRatio$ = -164
_k$32040 = -184
_rBaseAvg$ = -16
_nLogRatio$32052 = -188
_rRatio$32054 = -196
_a$32066 = -204
_k$32067 = -212
_rOddWeight$ = -20
_rAvg$ = -8
_rMax$ = -180
_rSum$ = -100
_r$32088 = -220
_rCoefficient$ = -172
_rMinCoefficient$ = -84
_nCoefficient$ = -88
_nQuantumized$32103 = -224
?Quantumize@MIOEncoder@@IAEXPAHPBMHMPAK0@Z PROC NEAR	; MIOEncoder::Quantumize
; Line 879
	push	ebp
	mov	ebp, esp
	sub	esp, 344				; 00000158H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 884
	mov	eax, DWORD PTR _nDegreeNum$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	DWORD PTR _nHalfDegree$[ebp], eax
; Line 892
	mov	esi, DWORD PTR _this$[ebp]
	push	1070596096				; 3fd00000H
	push	0
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	fld	QWORD PTR [eax+96]
	fdiv	QWORD PTR [ecx+88]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_pow
	add	esp, 16					; 00000010H
	fmul	QWORD PTR [esi+88]
	fstp	QWORD PTR _rPresetWeight$[ebp+8]
	mov	edx, DWORD PTR _rPresetWeight$[ebp+8]
	mov	DWORD PTR _rPresetWeight$[ebp], edx
	mov	eax, DWORD PTR _rPresetWeight$[ebp+12]
	mov	DWORD PTR _rPresetWeight$[ebp+4], eax
; Line 896
	mov	esi, DWORD PTR _this$[ebp]
	push	1072168960				; 3fe80000H
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	fld	QWORD PTR [ecx+96]
	fdiv	QWORD PTR [edx+88]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_pow
	add	esp, 16					; 00000010H
	fmul	QWORD PTR [esi+88]
	fstp	QWORD PTR _rPresetWeight$[ebp+16]
; Line 897
	mov	DWORD PTR _i$[ebp], 3
	jmp	SHORT $L32033
$L32034:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32033:
	cmp	DWORD PTR _i$[ebp], 7
	jge	SHORT $L32035
; Line 900
	mov	ecx, 6
	sub	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 1
	mov	DWORD PTR -232+[ebp], ecx
	fild	DWORD PTR -232+[ebp]
	fstp	QWORD PTR -240+[ebp]
	fld	QWORD PTR -240+[ebp]
	fdiv	QWORD PTR $T32978
	sub	esp, 8
	fstp	QWORD PTR [esp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+100]
	push	eax
	mov	ecx, DWORD PTR [edx+96]
	push	ecx
	call	_pow
	add	esp, 16					; 00000010H
	mov	edx, DWORD PTR _i$[ebp]
	fstp	QWORD PTR _rPresetWeight$[ebp+edx*8]
; Line 901
	jmp	SHORT $L32034
$L32035:
; Line 904
	mov	DWORD PTR _i$[ebp], 0
; Line 905
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32037
$L32038:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L32037:
	cmp	DWORD PTR _j$[ebp], 7
	jge	$L32039
; Line 907
	mov	ecx, DWORD PTR _j$[ebp]
	mov	DWORD PTR _rAvgRatio$[ebp+ecx*8], 0
	mov	DWORD PTR _rAvgRatio$[ebp+ecx*8+4], 0
; Line 908
	mov	DWORD PTR _k$32040[ebp], 0
	jmp	SHORT $L32041
$L32042:
	mov	edx, DWORD PTR _k$32040[ebp]
	add	edx, 1
	mov	DWORD PTR _k$32040[ebp], edx
$L32041:
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _k$32040[ebp]
	cmp	edx, DWORD PTR [ecx+eax*4+136]
	jge	SHORT $L32043
; Line 910
	mov	esi, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrSource$[ebp]
	fld	DWORD PTR [ecx+eax*4]
	fstp	QWORD PTR -248+[ebp]
	mov	edx, DWORD PTR -248+[ebp+4]
	push	edx
	mov	eax, DWORD PTR -248+[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
	call	_fabs
	fstp	QWORD PTR [esp]
	call	_sqrt
	add	esp, 8
	fadd	QWORD PTR _rAvgRatio$[ebp+esi*8]
	mov	edx, DWORD PTR _j$[ebp]
	fstp	QWORD PTR _rAvgRatio$[ebp+edx*8]
; Line 911
	jmp	SHORT $L32042
$L32043:
; Line 912
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	fild	DWORD PTR [edx+ecx*4+136]
	fstp	QWORD PTR -256+[ebp]
	fld	QWORD PTR _rAvgRatio$[ebp+eax*8]
	fdiv	QWORD PTR -256+[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	fstp	QWORD PTR _rAvgRatio$[ebp+eax*8]
; Line 913
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	fld	QWORD PTR _rAvgRatio$[ebp+ecx*8]
	fmul	QWORD PTR _rAvgRatio$[ebp+edx*8]
	mov	eax, DWORD PTR _j$[ebp]
	fstp	QWORD PTR _rAvgRatio$[ebp+eax*8]
; Line 914
	jmp	$L32038
$L32039:
; Line 915
	mov	ecx, DWORD PTR _ptrWeightCode$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 916
	mov	DWORD PTR _rBaseAvg$[ebp], 0
	mov	DWORD PTR _rBaseAvg$[ebp+4], 0
; Line 917
	mov	DWORD PTR _i$[ebp], 6
	jmp	SHORT $L32045
$L32046:
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32045:
	cmp	DWORD PTR _i$[ebp], 0
	jl	SHORT $L32047
; Line 919
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _rAvgRatio$[ebp+eax*8]
	mov	DWORD PTR _rBaseAvg$[ebp], ecx
	mov	edx, DWORD PTR _rAvgRatio$[ebp+eax*8+4]
	mov	DWORD PTR _rBaseAvg$[ebp+4], edx
; Line 920
	fld	QWORD PTR _rBaseAvg$[ebp]
	fcomp	QWORD PTR $T32979
	fnstsw	ax
	test	ah, 1
	jne	SHORT $L32048
; Line 921
	jmp	SHORT $L32047
$L32048:
; Line 922
	jmp	SHORT $L32046
$L32047:
; Line 923
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32049
$L32050:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32049:
	cmp	DWORD PTR _i$[ebp], 6
	jge	$L32051
; Line 925
	mov	DWORD PTR _nLogRatio$32052[ebp], 0
; Line 926
	fld	QWORD PTR _rBaseAvg$[ebp]
	fcomp	QWORD PTR $T32979
	fnstsw	ax
	test	ah, 1
	jne	$L32053
; Line 929
	push	1072378675				; 3feb3333H
	push	858993459				; 33333333H
	mov	ecx, DWORD PTR _i$[ebp]
	fld	QWORD PTR _rAvgRatio$[ebp+ecx*8]
	fdiv	QWORD PTR _rBaseAvg$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	fdiv	QWORD PTR _rPresetWeight$[ebp+edx*8]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_pow
	add	esp, 16					; 00000010H
	fstp	QWORD PTR _rRatio$32054[ebp]
; Line 930
	fld	QWORD PTR _rRatio$32054[ebp]
	fcomp	QWORD PTR $T32980
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L32055
; Line 933
	mov	eax, DWORD PTR _rRatio$32054[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _rRatio$32054[ebp]
	push	ecx
	call	_log
	fstp	QWORD PTR -264+[ebp]
	add	esp, 8
	push	1073741824				; 40000000H
	push	0
	call	_log
	add	esp, 8
	fdivr	QWORD PTR -264+[ebp]
	fmul	QWORD PTR $T32977
	fstp	DWORD PTR -268+[ebp]
	fld	DWORD PTR -268+[ebp]
	push	ecx
	fstp	DWORD PTR [esp]
	call	_eriRoundR32ToInt
	add	esp, 4
	mov	DWORD PTR _nLogRatio$32052[ebp], eax
; Line 934
	cmp	DWORD PTR _nLogRatio$32052[ebp], -15	; fffffff1H
	jge	SHORT $L32057
; Line 935
	mov	DWORD PTR _nLogRatio$32052[ebp], -15	; fffffff1H
$L32057:
; Line 936
	cmp	DWORD PTR _nLogRatio$32052[ebp], 16	; 00000010H
	jle	SHORT $L32058
; Line 937
	mov	DWORD PTR _nLogRatio$32052[ebp], 16	; 00000010H
$L32058:
$L32055:
$L32053:
; Line 940
	fild	DWORD PTR _nLogRatio$32052[ebp]
	fstp	QWORD PTR -276+[ebp]
	fld	QWORD PTR -276+[ebp]
	fmul	QWORD PTR $T32981
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	1073741824				; 40000000H
	push	0
	call	_pow
	add	esp, 16					; 00000010H
	fdivr	QWORD PTR $T32979
	mov	edx, DWORD PTR _i$[ebp]
	fstp	QWORD PTR _rAvgRatio$[ebp+edx*8]
; Line 941
	mov	eax, DWORD PTR _nLogRatio$32052[ebp]
	add	eax, 15					; 0000000fH
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 5
	shl	eax, cl
	mov	ecx, DWORD PTR _ptrWeightCode$[ebp]
	mov	edx, DWORD PTR [ecx]
	or	edx, eax
	mov	eax, DWORD PTR _ptrWeightCode$[ebp]
	mov	DWORD PTR [eax], edx
; Line 942
	jmp	$L32050
$L32051:
; Line 943
	mov	DWORD PTR _rAvgRatio$[ebp+48], 0
	mov	DWORD PTR _rAvgRatio$[ebp+52], 1072693248 ; 3ff00000H
; Line 945
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32059
$L32060:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32059:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+164]
	jge	SHORT $L32061
; Line 947
	fld	QWORD PTR _rAvgRatio$[ebp]
	fstp	DWORD PTR -280+[ebp]
	fld	DWORD PTR -280+[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _i$[ebp]
	fstp	DWORD PTR [edx+eax*4]
; Line 948
	jmp	SHORT $L32060
$L32061:
; Line 949
	mov	DWORD PTR _j$[ebp], 1
	jmp	SHORT $L32063
$L32064:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L32063:
	cmp	DWORD PTR _j$[ebp], 7
	jge	$L32065
; Line 951
	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _rAvgRatio$[ebp+edx*8-8]
	mov	DWORD PTR _a$32066[ebp], eax
	mov	ecx, DWORD PTR _rAvgRatio$[ebp+edx*8-4]
	mov	DWORD PTR _a$32066[ebp+4], ecx
; Line 954
	mov	edx, DWORD PTR _j$[ebp]
	fld	QWORD PTR _rAvgRatio$[ebp+edx*8]
	fsub	QWORD PTR _a$32066[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	mov	esi, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+164]
	sub	eax, DWORD PTR [esi+edx*4+160]
	mov	DWORD PTR -284+[ebp], eax
	fild	DWORD PTR -284+[ebp]
	fstp	QWORD PTR -292+[ebp]
	fdiv	QWORD PTR -292+[ebp]
	fstp	QWORD PTR _k$32067[ebp]
$L32069:
; Line 955
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+ecx*4+164]
	jge	SHORT $L32070
; Line 958
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, DWORD PTR [edx+ecx*4+160]
	mov	DWORD PTR -296+[ebp], eax
	fild	DWORD PTR -296+[ebp]
	fstp	QWORD PTR -304+[ebp]
	fld	QWORD PTR _k$32067[ebp]
	fmul	QWORD PTR -304+[ebp]
	fadd	QWORD PTR _a$32066[ebp]
	fstp	DWORD PTR -308+[ebp]
	fld	DWORD PTR -308+[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _i$[ebp]
	fstp	DWORD PTR [edx+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
; Line 959
	jmp	SHORT $L32069
$L32070:
; Line 960
	jmp	$L32064
$L32065:
$L32073:
; Line 961
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nDegreeNum$[ebp]
	jge	SHORT $L32074
; Line 963
	fld	QWORD PTR _rAvgRatio$[ebp+48]
	fstp	DWORD PTR -312+[ebp]
	fld	DWORD PTR -312+[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i$[ebp]
	fstp	DWORD PTR [ecx+edx*4]
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
; Line 964
	jmp	SHORT $L32073
$L32074:
; Line 966
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	shl	edx, 30					; 0000001eH
	mov	eax, DWORD PTR _ptrWeightCode$[ebp]
	mov	ecx, DWORD PTR [eax]
	or	ecx, edx
	mov	edx, DWORD PTR _ptrWeightCode$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 967
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	add	ecx, 2
	mov	DWORD PTR -316+[ebp], ecx
	fild	DWORD PTR -316+[ebp]
	fstp	DWORD PTR -320+[ebp]
	fld	DWORD PTR -320+[ebp]
	fmul	DWORD PTR $T32982
	fstp	DWORD PTR _rOddWeight$[ebp]
; Line 968
	mov	DWORD PTR _i$[ebp], 15			; 0000000fH
	jmp	SHORT $L32079
$L32080:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 16					; 00000010H
	mov	DWORD PTR _i$[ebp], edx
$L32079:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nDegreeNum$[ebp]
	jge	SHORT $L32081
; Line 970
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _i$[ebp]
	fld	DWORD PTR [edx+eax*4]
	fmul	DWORD PTR _rOddWeight$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _i$[ebp]
	fstp	DWORD PTR [edx+eax*4]
; Line 971
	jmp	SHORT $L32080
$L32081:
; Line 976
	mov	DWORD PTR _rMax$[ebp], 0
	mov	DWORD PTR _rMax$[ebp+4], 0
; Line 977
	mov	DWORD PTR _rSum$[ebp], 0
	mov	DWORD PTR _rSum$[ebp+4], 0
; Line 979
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32085
$L32086:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32085:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nDegreeNum$[ebp]
	jge	$L32087
; Line 981
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrSource$[ebp]
	mov	esi, DWORD PTR _i$[ebp]
	fld	DWORD PTR [eax+edx*4]
	fmul	DWORD PTR [ecx+esi*4]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_fabs
	add	esp, 8
	fstp	QWORD PTR _r$32088[ebp]
; Line 982
	fld	QWORD PTR _r$32088[ebp]
	fcomp	QWORD PTR _rMax$[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L32089
; Line 984
	mov	ecx, DWORD PTR _r$32088[ebp]
	mov	DWORD PTR _rMax$[ebp], ecx
	mov	edx, DWORD PTR _r$32088[ebp+4]
	mov	DWORD PTR _rMax$[ebp+4], edx
$L32089:
; Line 986
	fld	QWORD PTR _r$32088[ebp]
	fcomp	QWORD PTR $T32979
	fnstsw	ax
	test	ah, 1
	jne	SHORT $L32090
; Line 988
	mov	eax, DWORD PTR _r$32088[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _r$32088[ebp]
	push	ecx
	call	_sqrt
	add	esp, 8
	fadd	QWORD PTR _rSum$[ebp]
	fstp	QWORD PTR _rSum$[ebp]
$L32090:
; Line 990
	jmp	$L32086
$L32087:
; Line 991
	fild	DWORD PTR _nDegreeNum$[ebp]
	fstp	QWORD PTR -328+[ebp]
	fld	QWORD PTR _rSum$[ebp]
	fdiv	QWORD PTR -328+[ebp]
	fstp	QWORD PTR _rAvg$[ebp]
; Line 992
	fld	QWORD PTR _rAvg$[ebp]
	fmul	QWORD PTR _rAvg$[ebp]
	fstp	QWORD PTR _rAvg$[ebp]
; Line 997
	fld	QWORD PTR _rMax$[ebp]
	fdiv	QWORD PTR $T32983
	fstp	QWORD PTR _rMinCoefficient$[ebp]
; Line 998
	fld	QWORD PTR _rMinCoefficient$[ebp]
	fcomp	QWORD PTR $T32979
	fnstsw	ax
	test	ah, 1
	je	SHORT $L32093
; Line 1000
	mov	DWORD PTR _rMinCoefficient$[ebp], 0
	mov	DWORD PTR _rMinCoefficient$[ebp+4], 1072693248 ; 3ff00000H
$L32093:
; Line 1002
	mov	edx, DWORD PTR _rMinCoefficient$[ebp]
	mov	DWORD PTR _rCoefficient$[ebp], edx
	mov	eax, DWORD PTR _rMinCoefficient$[ebp+4]
	mov	DWORD PTR _rCoefficient$[ebp+4], eax
; Line 1003
	fld	DWORD PTR _rPowerScale$[ebp]
	fcomp	QWORD PTR _rAvg$[ebp]
	fnstsw	ax
	test	ah, 1
	je	SHORT $L32094
; Line 1005
	fld	DWORD PTR _rPowerScale$[ebp]
	fdivr	QWORD PTR _rAvg$[ebp]
	fstp	QWORD PTR _rCoefficient$[ebp]
$L32094:
; Line 1007
	fld	QWORD PTR _rCoefficient$[ebp]
	fcomp	QWORD PTR _rMinCoefficient$[ebp]
	fnstsw	ax
	test	ah, 1
	je	SHORT $L32095
; Line 1009
	mov	ecx, DWORD PTR _rMinCoefficient$[ebp]
	mov	DWORD PTR _rCoefficient$[ebp], ecx
	mov	edx, DWORD PTR _rMinCoefficient$[ebp+4]
	mov	DWORD PTR _rCoefficient$[ebp+4], edx
$L32095:
; Line 1011
	fld	QWORD PTR _rCoefficient$[ebp]
	fstp	DWORD PTR -332+[ebp]
	fld	DWORD PTR -332+[ebp]
	push	ecx
	fstp	DWORD PTR [esp]
	call	_eriRoundR32ToInt
	add	esp, 4
	mov	DWORD PTR _nCoefficient$[ebp], eax
; Line 1012
	cmp	DWORD PTR _nCoefficient$[ebp], 65536	; 00010000H
	jl	SHORT $L32098
; Line 1014
	mov	DWORD PTR _nCoefficient$[ebp], 65535	; 0000ffffH
$L32098:
; Line 1016
	mov	eax, DWORD PTR _ptrCoefficient$[ebp]
	mov	ecx, DWORD PTR _nCoefficient$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 1018
	fild	DWORD PTR _nCoefficient$[ebp]
	fstp	QWORD PTR -340+[ebp]
	fld	QWORD PTR $T32979
	fdiv	QWORD PTR -340+[ebp]
	fstp	QWORD PTR _rCoefficient$[ebp]
; Line 1020
	fild	DWORD PTR _nCoefficient$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _nDegreeNum$[ebp]
	fstp	DWORD PTR [eax+ecx*4-4]
; Line 1024
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32100
$L32101:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32100:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nDegreeNum$[ebp]
	jge	SHORT $L32102
; Line 1027
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrSource$[ebp]
	mov	esi, DWORD PTR _i$[ebp]
	fld	DWORD PTR [ecx+eax*4]
	fmul	DWORD PTR [edx+esi*4]
	fmul	QWORD PTR _rCoefficient$[ebp]
	fstp	DWORD PTR -344+[ebp]
	fld	DWORD PTR -344+[ebp]
	push	ecx
	fstp	DWORD PTR [esp]
	call	_eriRoundR32ToInt
	add	esp, 4
	mov	DWORD PTR _nQuantumized$32103[ebp], eax
; Line 1028
	cmp	DWORD PTR _nQuantumized$32103[ebp], -32768 ; ffff8000H
	jge	SHORT $L32105
; Line 1030
	mov	DWORD PTR _nQuantumized$32103[ebp], -32768 ; ffff8000H
; Line 1032
	jmp	SHORT $L32106
$L32105:
	cmp	DWORD PTR _nQuantumized$32103[ebp], 32767 ; 00007fffH
	jle	SHORT $L32107
; Line 1034
	mov	DWORD PTR _nQuantumized$32103[ebp], 32767 ; 00007fffH
$L32107:
$L32106:
; Line 1036
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrQuantumized$[ebp]
	mov	ecx, DWORD PTR _nQuantumized$32103[ebp]
	mov	DWORD PTR [eax+edx*4], ecx
; Line 1037
	jmp	$L32101
$L32102:
; Line 1038
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	24					; 00000018H
?Quantumize@MIOEncoder@@IAEXPAHPBMHMPAK0@Z ENDP		; MIOEncoder::Quantumize
_TEXT	ENDS
PUBLIC	?EncodeInternalBlock_MSS@MIOEncoder@@IAEHAAVRLHEncodeContext@@PAM1M@Z ; MIOEncoder::EncodeInternalBlock_MSS
PUBLIC	?EncodeLeadBlock_MSS@MIOEncoder@@IAEHAAVRLHEncodeContext@@PAM1M@Z ; MIOEncoder::EncodeLeadBlock_MSS
PUBLIC	?EncodePostBlock_MSS@MIOEncoder@@IAEHAAVRLHEncodeContext@@M@Z ; MIOEncoder::EncodePostBlock_MSS
_TEXT	SEGMENT
_context$ = 8
_datahdr$ = 12
_ptrWaveBuf$ = 16
_this$ = -112
_nDegreeWidth$ = -28
_nSampleCount$ = -12
_nSubbandCount$ = -8
_nChannelCount$ = -48
_nAllSampleCount$ = -16
_i$ = -32
_j$ = -36
_k$ = -44
_ptrSrcBuf$ = -4
_nLastDivision$ = -40
_ptrSubbandHead$32135 = -64
_nCopySamples$32136 = -56
_nDivisionCode$32138 = -80
_ptrSrcHead$32142 = -92
_ptrSamplingBuf$32143 = -88
_nDivCode$32151 = -96
_rPowerScale$32153 = -68
_nDivisionCount$32155 = -76
_fLeadBlock$32160 = -60
_ptrNextSrc1$32165 = -72
_ptrNextSrc2$32166 = -84
_ptrHBuf$ = -20
_ptrLBuf$ = -52
_nAllSubbandCount$ = -24
_nValue$32187 = -104
_nLow$32188 = -108
_nHigh$32190 = -100
?EncodeSoundDCT_MSS@MIOEncoder@@IAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z PROC NEAR ; MIOEncoder::EncodeSoundDCT_MSS
; Line 1046
	push	ebp
	mov	ebp, esp
	sub	esp, 124				; 0000007cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1050
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, 1
	mov	ecx, DWORD PTR [eax+32]
	shl	edx, cl
	mov	DWORD PTR _nDegreeWidth$[ebp], edx
; Line 1052
	mov	eax, DWORD PTR _datahdr$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	edx, DWORD PTR _nDegreeWidth$[ebp]
	lea	eax, DWORD PTR [ecx+edx-1]
	mov	ecx, DWORD PTR _nDegreeWidth$[ebp]
	sub	ecx, 1
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _nSampleCount$[ebp], eax
; Line 1054
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	mov	ecx, DWORD PTR [edx+32]
	shr	eax, cl
	mov	DWORD PTR _nSubbandCount$[ebp], eax
; Line 1055
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	mov	DWORD PTR _nChannelCount$[ebp], edx
; Line 1056
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	imul	eax, DWORD PTR _nChannelCount$[ebp]
	mov	DWORD PTR _nAllSampleCount$[ebp], eax
; Line 1058
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nSampleCount$[ebp]
	cmp	edx, DWORD PTR [ecx+48]
	jbe	SHORT $L32118
; Line 1060
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+56], 0
	je	SHORT $L32119
; Line 1062
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+56]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L32119:
; Line 1064
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+60], 0
	je	SHORT $L32120
; Line 1066
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L32120:
; Line 1069
	mov	eax, DWORD PTR _nAllSampleCount$[ebp]
	shl	eax, 1
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+56], eax
; Line 1071
	mov	edx, DWORD PTR _nAllSampleCount$[ebp]
	shl	edx, 1
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+60], eax
; Line 1072
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	mov	DWORD PTR [edx+48], eax
$L32118:
; Line 1075
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+56]
	mov	DWORD PTR [ecx+120], eax
; Line 1079
	mov	ecx, DWORD PTR _datahdr$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx+1]
	and	edx, 1
	test	edx, edx
	je	SHORT $L32125
; Line 1081
	mov	ecx, DWORD PTR _context$[ebp]
	call	?PrepareToEncodeERINACode@RLHEncodeContext@@QAEXXZ ; RLHEncodeContext::PrepareToEncodeERINACode
$L32125:
; Line 1083
	push	1
	push	0
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1088
	mov	eax, DWORD PTR _ptrWaveBuf$[ebp]
	mov	DWORD PTR _ptrSrcBuf$[ebp], eax
; Line 1089
	mov	DWORD PTR _nLastDivision$[ebp], -1
; Line 1091
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32132
$L32133:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32132:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nSubbandCount$[ebp]
	jae	$L32134
; Line 1094
	mov	eax, DWORD PTR _nDegreeWidth$[ebp]
	imul	eax, DWORD PTR _nChannelCount$[ebp]
	imul	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrSrcBuf$[ebp]
	lea	edx, DWORD PTR [ecx+eax*2]
	mov	DWORD PTR _ptrSubbandHead$32135[ebp], edx
; Line 1097
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, DWORD PTR _nDegreeWidth$[ebp]
	mov	ecx, DWORD PTR _datahdr$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	sub	edx, eax
	mov	DWORD PTR _nCopySamples$32136[ebp], edx
; Line 1098
	mov	eax, DWORD PTR _nCopySamples$32136[ebp]
	cmp	eax, DWORD PTR _nDegreeWidth$[ebp]
	jbe	SHORT $L32137
; Line 1100
	mov	ecx, DWORD PTR _nDegreeWidth$[ebp]
	mov	DWORD PTR _nCopySamples$32136[ebp], ecx
$L32137:
; Line 1105
	mov	DWORD PTR _nDivisionCode$32138[ebp], 0
; Line 1106
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32139
$L32140:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L32139:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _nChannelCount$[ebp]
	jae	$L32141
; Line 1108
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _ptrSubbandHead$32135[ebp]
	lea	eax, DWORD PTR [edx+ecx*2]
	mov	DWORD PTR _ptrSrcHead$32142[ebp], eax
; Line 1109
	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, DWORD PTR _nDegreeWidth$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+64]
	lea	ecx, DWORD PTR [eax+ecx*4]
	mov	DWORD PTR _ptrSamplingBuf$32143[ebp], ecx
; Line 1111
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L32144
$L32145:
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
$L32144:
	mov	eax, DWORD PTR _k$[ebp]
	cmp	eax, DWORD PTR _nCopySamples$32136[ebp]
	jae	SHORT $L32146
; Line 1113
	mov	ecx, DWORD PTR _ptrSrcHead$32142[ebp]
	movsx	edx, WORD PTR [ecx]
	mov	DWORD PTR -116+[ebp], edx
	fild	DWORD PTR -116+[ebp]
	mov	eax, DWORD PTR _k$[ebp]
	mov	ecx, DWORD PTR _ptrSamplingBuf$32143[ebp]
	fstp	DWORD PTR [ecx+eax*4]
; Line 1114
	mov	edx, DWORD PTR _nChannelCount$[ebp]
	mov	eax, DWORD PTR _ptrSrcHead$32142[ebp]
	lea	ecx, DWORD PTR [eax+edx*2]
	mov	DWORD PTR _ptrSrcHead$32142[ebp], ecx
; Line 1115
	jmp	SHORT $L32145
$L32146:
$L32149:
; Line 1116
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR _nDegreeWidth$[ebp]
	jae	SHORT $L32150
; Line 1118
	mov	eax, DWORD PTR _k$[ebp]
	mov	ecx, DWORD PTR _ptrSamplingBuf$32143[ebp]
	mov	DWORD PTR [ecx+eax*4], 0
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
; Line 1119
	jmp	SHORT $L32149
$L32150:
; Line 1121
	mov	eax, DWORD PTR _ptrSamplingBuf$32143[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetDivisionCode@MIOEncoder@@IAEHPBM@Z	; MIOEncoder::GetDivisionCode
	mov	DWORD PTR _nDivCode$32151[ebp], eax
; Line 1122
	mov	ecx, DWORD PTR _nDivCode$32151[ebp]
	cmp	ecx, DWORD PTR _nDivisionCode$32138[ebp]
	jbe	SHORT $L32152
; Line 1124
	mov	edx, DWORD PTR _nDivCode$32151[ebp]
	mov	DWORD PTR _nDivisionCode$32138[ebp], edx
$L32152:
; Line 1126
	jmp	$L32140
$L32141:
; Line 1130
	mov	eax, DWORD PTR _this$[ebp]
	fld	QWORD PTR [eax+104]
	fstp	DWORD PTR _rPowerScale$32153[ebp]
; Line 1131
	mov	edx, 1
	mov	ecx, DWORD PTR _nDivisionCode$32138[ebp]
	shl	edx, cl
	mov	DWORD PTR _nDivisionCount$32155[ebp], edx
; Line 1133
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L32156
$L32157:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L32156:
	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR _nDivisionCode$32138[ebp]
	jae	SHORT $L32158
; Line 1135
	fld	DWORD PTR _rPowerScale$32153[ebp]
	fmul	DWORD PTR $T32976
	fstp	DWORD PTR _rPowerScale$32153[ebp]
; Line 1136
	jmp	SHORT $L32157
$L32158:
; Line 1138
	push	2
	mov	edx, DWORD PTR _nDivisionCode$32138[ebp]
	shl	edx, 30					; 0000001eH
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1142
	mov	BYTE PTR _fLeadBlock$32160[ebp], 0
; Line 1144
	mov	eax, DWORD PTR _nLastDivision$[ebp]
	cmp	eax, DWORD PTR _nDivisionCode$32138[ebp]
	je	SHORT $L32161
; Line 1149
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L32162
; Line 1152
	mov	ecx, DWORD PTR _this$[ebp]
	fld	QWORD PTR [ecx+104]
	fstp	DWORD PTR -120+[ebp]
	fld	DWORD PTR -120+[ebp]
	push	ecx
	fstp	DWORD PTR [esp]
	mov	edx, DWORD PTR _context$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EncodePostBlock_MSS@MIOEncoder@@IAEHAAVRLHEncodeContext@@M@Z ; MIOEncoder::EncodePostBlock_MSS
	test	eax, eax
	je	SHORT $L32164
; Line 1154
	mov	eax, 1
	jmp	$L32112
$L32164:
$L32162:
; Line 1160
	mov	eax, DWORD PTR _nDivisionCode$32138[ebp]
	mov	DWORD PTR _nLastDivision$[ebp], eax
; Line 1162
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	sub	edx, DWORD PTR _nDivisionCode$32138[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?InitializeWithDegree@MIOEncoder@@IAEXI@Z ; MIOEncoder::InitializeWithDegree
; Line 1163
	mov	BYTE PTR _fLeadBlock$32160[ebp], 1
$L32161:
; Line 1168
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	mov	DWORD PTR _ptrNextSrc1$32165[ebp], ecx
; Line 1169
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+64]
	mov	ecx, DWORD PTR _nDegreeWidth$[ebp]
	lea	edx, DWORD PTR [eax+ecx*4]
	mov	DWORD PTR _ptrNextSrc2$32166[ebp], edx
; Line 1171
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L32167
$L32168:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L32167:
	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR _nDivisionCount$32155[ebp]
	jae	$L32169
; Line 1173
	mov	edx, DWORD PTR _fLeadBlock$32160[ebp]
	and	edx, 255				; 000000ffH
	test	edx, edx
	je	SHORT $L32170
; Line 1179
	mov	eax, DWORD PTR _rPowerScale$32153[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrNextSrc2$32166[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrNextSrc1$32165[ebp]
	push	edx
	mov	eax, DWORD PTR _context$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EncodeLeadBlock_MSS@MIOEncoder@@IAEHAAVRLHEncodeContext@@PAM1M@Z ; MIOEncoder::EncodeLeadBlock_MSS
	test	eax, eax
	je	SHORT $L32171
; Line 1181
	mov	eax, 1
	jmp	$L32112
$L32171:
; Line 1184
	mov	BYTE PTR _fLeadBlock$32160[ebp], 0
; Line 1186
	jmp	SHORT $L32172
$L32170:
; Line 1192
	mov	ecx, DWORD PTR _rPowerScale$32153[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrNextSrc2$32166[ebp]
	push	edx
	mov	eax, DWORD PTR _ptrNextSrc1$32165[ebp]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EncodeInternalBlock_MSS@MIOEncoder@@IAEHAAVRLHEncodeContext@@PAM1M@Z ; MIOEncoder::EncodeInternalBlock_MSS
	test	eax, eax
	je	SHORT $L32173
; Line 1194
	mov	eax, 1
	jmp	$L32112
$L32173:
$L32172:
; Line 1200
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+132]
	mov	ecx, DWORD PTR _ptrNextSrc1$32165[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _ptrNextSrc1$32165[ebp], edx
; Line 1201
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	mov	edx, DWORD PTR _ptrNextSrc2$32166[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _ptrNextSrc2$32166[ebp], eax
; Line 1202
	jmp	$L32168
$L32169:
; Line 1203
	jmp	$L32133
$L32134:
; Line 1207
	cmp	DWORD PTR _nSubbandCount$[ebp], 0
	jbe	SHORT $L32174
; Line 1210
	mov	ecx, DWORD PTR _this$[ebp]
	fld	QWORD PTR [ecx+104]
	fstp	DWORD PTR -124+[ebp]
	fld	DWORD PTR -124+[ebp]
	push	ecx
	fstp	DWORD PTR [esp]
	mov	edx, DWORD PTR _context$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EncodePostBlock_MSS@MIOEncoder@@IAEHAAVRLHEncodeContext@@M@Z ; MIOEncoder::EncodePostBlock_MSS
	test	eax, eax
	je	SHORT $L32176
; Line 1212
	mov	eax, 1
	jmp	$L32112
$L32176:
$L32174:
; Line 1218
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+60]
	mov	DWORD PTR _ptrHBuf$[ebp], ecx
; Line 1219
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+60]
	add	eax, DWORD PTR _nAllSampleCount$[ebp]
	mov	DWORD PTR _ptrLBuf$[ebp], eax
; Line 1220
	mov	ecx, DWORD PTR _nSubbandCount$[ebp]
	mov	DWORD PTR _nAllSubbandCount$[ebp], ecx
; Line 1222
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32180
$L32181:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32180:
	mov	eax, DWORD PTR _nDegreeWidth$[ebp]
	shl	eax, 1
	cmp	DWORD PTR _i$[ebp], eax
	jae	$L32182
; Line 1224
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+56]
	mov	eax, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [edx+eax*2]
	mov	DWORD PTR _ptrSrcBuf$[ebp], ecx
; Line 1226
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32184
$L32185:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L32184:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _nAllSubbandCount$[ebp]
	jae	SHORT $L32186
; Line 1228
	mov	ecx, DWORD PTR _ptrSrcBuf$[ebp]
	mov	dx, WORD PTR [ecx]
	mov	WORD PTR _nValue$32187[ebp], dx
; Line 1229
	mov	eax, DWORD PTR _nDegreeWidth$[ebp]
	shl	eax, 1
	mov	ecx, DWORD PTR _ptrSrcBuf$[ebp]
	lea	edx, DWORD PTR [ecx+eax*2]
	mov	DWORD PTR _ptrSrcBuf$[ebp], edx
; Line 1230
	movsx	eax, WORD PTR _nValue$32187[ebp]
	shl	eax, 8
	sar	eax, 8
	mov	BYTE PTR _nLow$32188[ebp], al
; Line 1231
	movsx	ecx, WORD PTR _nValue$32187[ebp]
	sar	ecx, 8
	movsx	edx, BYTE PTR _nLow$32188[ebp]
	sar	edx, 7
	xor	ecx, edx
	mov	BYTE PTR _nHigh$32190[ebp], cl
; Line 1232
	mov	eax, DWORD PTR _ptrHBuf$[ebp]
	mov	cl, BYTE PTR _nHigh$32190[ebp]
	mov	BYTE PTR [eax], cl
	mov	edx, DWORD PTR _ptrHBuf$[ebp]
	add	edx, 1
	mov	DWORD PTR _ptrHBuf$[ebp], edx
; Line 1233
	mov	eax, DWORD PTR _ptrLBuf$[ebp]
	mov	cl, BYTE PTR _nLow$32188[ebp]
	mov	BYTE PTR [eax], cl
	mov	edx, DWORD PTR _ptrLBuf$[ebp]
	add	edx, 1
	mov	DWORD PTR _ptrLBuf$[ebp], edx
; Line 1234
	jmp	SHORT $L32185
$L32186:
; Line 1235
	jmp	$L32181
$L32182:
; Line 1237
	push	1
	push	0
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1240
	mov	eax, DWORD PTR _nAllSampleCount$[ebp]
	shl	eax, 1
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?EncodeERINACodesSBZL@RLHEncodeContext@@QAEHPBCH@Z ; RLHEncodeContext::EncodeERINACodesSBZL
	mov	ecx, DWORD PTR _nAllSampleCount$[ebp]
	shl	ecx, 1
	cmp	eax, ecx
	jge	SHORT $L32193
; Line 1242
	mov	eax, 1
	jmp	SHORT $L32112
$L32193:
; Line 1245
	mov	ecx, DWORD PTR _context$[ebp]
	call	?Flushout@RLHEncodeContext@@QAEHXZ	; RLHEncodeContext::Flushout
; Line 1247
	xor	eax, eax
$L32112:
; Line 1248
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?EncodeSoundDCT_MSS@MIOEncoder@@IAEHAAVRLHEncodeContext@@ABUMIO_DATA_HEADER@@PBX@Z ENDP ; MIOEncoder::EncodeSoundDCT_MSS
_TEXT	ENDS
PUBLIC	?GetRevolveCode@MIOEncoder@@IAEHPBM0@Z		; MIOEncoder::GetRevolveCode
EXTRN	_atan2:NEAR
CONST	SEGMENT
$T32984	DD	000000000r			; 0
	ORG $+4
$T32985	DQ	04010000000000000r		; 4
CONST	ENDS
_TEXT	SEGMENT
_ptrBuf1$ = 8
_ptrBuf2$ = 12
_this$ = -48
_r1$ = -4
_r2$ = -8
_r3$ = -20
_s1$ = -28
_s2$ = -40
_i$ = -44
_rs$ = -16
_nRevCode$ = -32
?GetRevolveCode@MIOEncoder@@IAEHPBM0@Z PROC NEAR	; MIOEncoder::GetRevolveCode
; Line 1255
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1257
	mov	DWORD PTR _s1$[ebp], 0
	mov	DWORD PTR _s1$[ebp+4], 0
	mov	DWORD PTR _s2$[ebp], 0
	mov	DWORD PTR _s2$[ebp+4], 0
; Line 1259
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32204
$L32205:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 2
	mov	DWORD PTR _i$[ebp], eax
$L32204:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+132]
	jae	$L32206
; Line 1261
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrBuf1$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _r1$[ebp], edx
; Line 1262
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrBuf2$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _r2$[ebp], edx
; Line 1264
	fld	DWORD PTR _r1$[ebp]
	fcomp	DWORD PTR $T32984
	fnstsw	ax
	test	ah, 1
	je	SHORT $L32207
; Line 1266
	fld	DWORD PTR _r2$[ebp]
	fcomp	DWORD PTR $T32984
	fnstsw	ax
	test	ah, 1
	je	SHORT $L32208
; Line 1268
	fld	DWORD PTR _r1$[ebp]
	fchs
	fstp	DWORD PTR _r1$[ebp]
; Line 1269
	fld	DWORD PTR _r2$[ebp]
	fchs
	fstp	DWORD PTR _r2$[ebp]
; Line 1271
	jmp	SHORT $L32209
$L32208:
; Line 1273
	mov	eax, DWORD PTR _r1$[ebp]
	mov	DWORD PTR _r3$[ebp], eax
; Line 1274
	mov	ecx, DWORD PTR _r2$[ebp]
	mov	DWORD PTR _r1$[ebp], ecx
; Line 1275
	fld	DWORD PTR _r3$[ebp]
	fchs
	fstp	DWORD PTR _r2$[ebp]
$L32209:
; Line 1278
	jmp	SHORT $L32210
$L32207:
; Line 1280
	fld	DWORD PTR _r2$[ebp]
	fcomp	DWORD PTR $T32984
	fnstsw	ax
	test	ah, 1
	je	SHORT $L32211
; Line 1282
	mov	edx, DWORD PTR _r1$[ebp]
	mov	DWORD PTR _r3$[ebp], edx
; Line 1283
	fld	DWORD PTR _r2$[ebp]
	fchs
	fstp	DWORD PTR _r1$[ebp]
; Line 1284
	mov	eax, DWORD PTR _r3$[ebp]
	mov	DWORD PTR _r2$[ebp], eax
$L32211:
$L32210:
; Line 1288
	fld	DWORD PTR _r1$[ebp]
	fadd	QWORD PTR _s1$[ebp]
	fstp	QWORD PTR _s1$[ebp]
; Line 1289
	fld	DWORD PTR _r2$[ebp]
	fadd	QWORD PTR _s2$[ebp]
	fstp	QWORD PTR _s2$[ebp]
; Line 1290
	jmp	$L32205
$L32206:
; Line 1292
	mov	ecx, DWORD PTR _s1$[ebp+4]
	push	ecx
	mov	edx, DWORD PTR _s1$[ebp]
	push	edx
	mov	eax, DWORD PTR _s2$[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _s2$[ebp]
	push	ecx
	call	_atan2
	add	esp, 16					; 00000010H
	fstp	QWORD PTR _rs$[ebp]
; Line 1294
	fld	QWORD PTR _rs$[ebp]
	fmul	QWORD PTR $T32985
	fld	QWORD PTR _ERI_PI$S31670
	fmul	QWORD PTR $T32981
	fdivp	ST(1), ST(0)
	fstp	DWORD PTR -52+[ebp]
	fld	DWORD PTR -52+[ebp]
	push	ecx
	fstp	DWORD PTR [esp]
	call	_eriRoundR32ToInt
	add	esp, 4
	mov	DWORD PTR _nRevCode$[ebp], eax
; Line 1296
	mov	eax, DWORD PTR _nRevCode$[ebp]
	and	eax, 3
; Line 1297
	mov	esp, ebp
	pop	ebp
	ret	8
?GetRevolveCode@MIOEncoder@@IAEHPBM0@Z ENDP		; MIOEncoder::GetRevolveCode
_TEXT	ENDS
PUBLIC	?PerformLOT_MSS@MIOEncoder@@IAEXPAM00@Z		; MIOEncoder::PerformLOT_MSS
_TEXT	SEGMENT
_ptrDst$ = 8
_ptrLapBuf$ = 12
_ptrSrc$ = 16
_this$ = -12
_rMatrixScale$ = -4
_i$ = -8
?PerformLOT_MSS@MIOEncoder@@IAEXPAM00@Z PROC NEAR	; MIOEncoder::PerformLOT_MSS
; Line 1304
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1308
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	mov	DWORD PTR -20+[ebp], ecx
	mov	DWORD PTR -20+[ebp+4], 0
	fild	QWORD PTR -20+[ebp]
	fstp	QWORD PTR -28+[ebp]
	fld	QWORD PTR $T32977
	fdiv	QWORD PTR -28+[ebp]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_sqrt
	add	esp, 8
	fstp	DWORD PTR _rMatrixScale$[ebp]
; Line 1311
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+128]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	push	edx
	mov	eax, DWORD PTR _ptrSrc$[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+68]
	push	edx
	call	_eriFastDCT
	add	esp, 20					; 00000014H
; Line 1313
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	push	ecx
	mov	edx, DWORD PTR _rMatrixScale$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+68]
	push	ecx
	call	_eriScalarMultiply
	add	esp, 12					; 0000000cH
; Line 1318
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+128]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+68]
	push	edx
	call	_eriFastPLOT
	add	esp, 8
; Line 1321
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+68]
	push	eax
	mov	ecx, DWORD PTR _ptrLapBuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrDst$[ebp]
	push	edx
	call	_eriFastLOT
	add	esp, 16					; 00000010H
; Line 1323
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+192]
	push	eax
	mov	ecx, DWORD PTR _ptrDst$[ebp]
	push	ecx
	call	_eriOddGivensMatrix
	add	esp, 12					; 0000000cH
; Line 1325
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32223
$L32224:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32223:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+132]
	jae	SHORT $L32225
; Line 1327
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+68]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _ptrLapBuf$[ebp]
	mov	esi, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+esi*4]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1328
	jmp	SHORT $L32224
$L32225:
; Line 1329
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?PerformLOT_MSS@MIOEncoder@@IAEXPAM00@Z ENDP		; MIOEncoder::PerformLOT_MSS
_TEXT	ENDS
PUBLIC	?Quantumize_MSS@MIOEncoder@@IAEXPAHPBMHMPAK0@Z	; MIOEncoder::Quantumize_MSS
EXTRN	_eriRevolve2x2:NEAR
EXTRN	_cos:NEAR
EXTRN	_sin:NEAR
CONST	SEGMENT
$T32986	DQ	04020000000000000r		; 8
CONST	ENDS
_TEXT	SEGMENT
_context$ = 8
_ptrSrc1$ = 12
_ptrSrc2$ = 16
_rPowerScale$ = 20
_this$ = -48
_ptrDstBuf2$ = -16
_ptrLapBuf2$ = -28
_nRevCode1$ = -20
_nRevCode2$ = -24
_dwRevCode$ = -12
_rSin$ = -40
_rCos$ = -8
_nWeightCode$ = -44
_nCoefficient$ = -36
_ptrSrcBuf$ = -4
_i$ = -32
?EncodeInternalBlock_MSS@MIOEncoder@@IAEHAAVRLHEncodeContext@@PAM1M@Z PROC NEAR ; MIOEncoder::EncodeInternalBlock_MSS
; Line 1337
	push	ebp
	mov	ebp, esp
	sub	esp, 96					; 00000060H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1341
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	lea	ecx, DWORD PTR [eax+ecx*4]
	mov	DWORD PTR _ptrDstBuf2$[ebp], ecx
; Line 1342
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+132]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+84]
	lea	eax, DWORD PTR [edx+eax*4]
	mov	DWORD PTR _ptrLapBuf2$[ebp], eax
; Line 1344
	mov	ecx, DWORD PTR _ptrSrc1$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+84]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?PerformLOT_MSS@MIOEncoder@@IAEXPAM00@Z	; MIOEncoder::PerformLOT_MSS
; Line 1345
	mov	eax, DWORD PTR _ptrSrc2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrLapBuf2$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrDstBuf2$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?PerformLOT_MSS@MIOEncoder@@IAEXPAM00@Z	; MIOEncoder::PerformLOT_MSS
; Line 1349
	mov	eax, DWORD PTR _ptrDstBuf2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetRevolveCode@MIOEncoder@@IAEHPBM0@Z	; MIOEncoder::GetRevolveCode
	mov	DWORD PTR _nRevCode1$[ebp], eax
; Line 1350
	mov	eax, DWORD PTR _ptrDstBuf2$[ebp]
	add	eax, 4
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	add	edx, 4
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetRevolveCode@MIOEncoder@@IAEHPBM0@Z	; MIOEncoder::GetRevolveCode
	mov	DWORD PTR _nRevCode2$[ebp], eax
; Line 1351
	mov	eax, DWORD PTR _nRevCode1$[ebp]
	shl	eax, 2
	or	eax, DWORD PTR _nRevCode2$[ebp]
	mov	DWORD PTR _dwRevCode$[ebp], eax
; Line 1357
	mov	ecx, DWORD PTR _nRevCode1$[ebp]
	neg	ecx
	mov	DWORD PTR -52+[ebp], ecx
	fild	DWORD PTR -52+[ebp]
	fstp	QWORD PTR -60+[ebp]
	fld	QWORD PTR -60+[ebp]
	fmul	QWORD PTR _ERI_PI$S31670
	fdiv	QWORD PTR $T32986
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_sin
	add	esp, 8
	fstp	DWORD PTR _rSin$[ebp]
; Line 1358
	mov	edx, DWORD PTR _nRevCode1$[ebp]
	neg	edx
	mov	DWORD PTR -64+[ebp], edx
	fild	DWORD PTR -64+[ebp]
	fstp	QWORD PTR -72+[ebp]
	fld	QWORD PTR -72+[ebp]
	fmul	QWORD PTR _ERI_PI$S31670
	fdiv	QWORD PTR $T32986
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_cos
	add	esp, 8
	fstp	DWORD PTR _rCos$[ebp]
; Line 1360
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	shr	ecx, 1
	push	ecx
	push	2
	mov	edx, DWORD PTR _rCos$[ebp]
	push	edx
	mov	eax, DWORD PTR _rSin$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrDstBuf2$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	push	eax
	call	_eriRevolve2x2
	add	esp, 24					; 00000018H
; Line 1362
	mov	ecx, DWORD PTR _nRevCode2$[ebp]
	neg	ecx
	mov	DWORD PTR -76+[ebp], ecx
	fild	DWORD PTR -76+[ebp]
	fstp	QWORD PTR -84+[ebp]
	fld	QWORD PTR -84+[ebp]
	fmul	QWORD PTR _ERI_PI$S31670
	fdiv	QWORD PTR $T32986
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_sin
	add	esp, 8
	fstp	DWORD PTR _rSin$[ebp]
; Line 1363
	mov	edx, DWORD PTR _nRevCode2$[ebp]
	neg	edx
	mov	DWORD PTR -88+[ebp], edx
	fild	DWORD PTR -88+[ebp]
	fstp	QWORD PTR -96+[ebp]
	fld	QWORD PTR -96+[ebp]
	fmul	QWORD PTR _ERI_PI$S31670
	fdiv	QWORD PTR $T32986
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_cos
	add	esp, 8
	fstp	DWORD PTR _rCos$[ebp]
; Line 1365
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	shr	ecx, 1
	push	ecx
	push	2
	mov	edx, DWORD PTR _rCos$[ebp]
	push	edx
	mov	eax, DWORD PTR _rSin$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrDstBuf2$[ebp]
	add	ecx, 4
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	add	eax, 4
	push	eax
	call	_eriRevolve2x2
	add	esp, 24					; 00000018H
; Line 1367
	push	4
	mov	ecx, DWORD PTR _dwRevCode$[ebp]
	shl	ecx, 28					; 0000001cH
	push	ecx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1376
	lea	edx, DWORD PTR _nCoefficient$[ebp]
	push	edx
	lea	eax, DWORD PTR _nWeightCode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _rPowerScale$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+132]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+52]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Quantumize_MSS@MIOEncoder@@IAEXPAHPBMHMPAK0@Z ; MIOEncoder::Quantumize_MSS
; Line 1380
	push	32					; 00000020H
	mov	edx, DWORD PTR _nWeightCode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1381
	push	16					; 00000010H
	mov	eax, DWORD PTR _nCoefficient$[ebp]
	shl	eax, 16					; 00000010H
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1385
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+52]
	mov	DWORD PTR _ptrSrcBuf$[ebp], edx
; Line 1386
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32250
$L32251:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32250:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+132]
	jae	SHORT $L32252
; Line 1388
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+120]
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	mov	ax, WORD PTR [edx]
	mov	WORD PTR [ecx], ax
; Line 1389
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+120]
	mov	eax, DWORD PTR _ptrSrcBuf$[ebp]
	mov	cx, WORD PTR [eax+4]
	mov	WORD PTR [edx+2], cx
; Line 1390
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+120]
	add	eax, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+120], eax
; Line 1391
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	add	edx, 8
	mov	DWORD PTR _ptrSrcBuf$[ebp], edx
; Line 1392
	jmp	SHORT $L32251
$L32252:
; Line 1393
	xor	eax, eax
; Line 1394
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?EncodeInternalBlock_MSS@MIOEncoder@@IAEHAAVRLHEncodeContext@@PAM1M@Z ENDP ; MIOEncoder::EncodeInternalBlock_MSS
_context$ = 8
_ptrSrc1$ = 12
_ptrSrc2$ = 16
_rPowerScale$ = 20
_this$ = -40
_i$ = -28
_ptrDstBuf2$ = -12
_ptrLapBuf2$ = -20
_nRevCode2$ = -16
_rSin$ = -32
_rCos$ = -8
_nWeightCode$ = -36
_nCoefficient$ = -24
_ptrSrcBuf$ = -4
?EncodeLeadBlock_MSS@MIOEncoder@@IAEHAAVRLHEncodeContext@@PAM1M@Z PROC NEAR ; MIOEncoder::EncodeLeadBlock_MSS
; Line 1402
	push	ebp
	mov	ebp, esp
	sub	esp, 64					; 00000040H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1407
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32262
$L32263:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32262:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+132]
	shl	edx, 1
	cmp	DWORD PTR _i$[ebp], edx
	jae	SHORT $L32264
; Line 1409
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+84]
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx+edx*4], 0
; Line 1410
	jmp	SHORT $L32263
$L32264:
; Line 1414
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	lea	ecx, DWORD PTR [eax+ecx*4]
	mov	DWORD PTR _ptrDstBuf2$[ebp], ecx
; Line 1415
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+132]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+84]
	lea	eax, DWORD PTR [edx+eax*4]
	mov	DWORD PTR _ptrLapBuf2$[ebp], eax
; Line 1417
	mov	ecx, DWORD PTR _ptrSrc1$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+84]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?PerformLOT_MSS@MIOEncoder@@IAEXPAM00@Z	; MIOEncoder::PerformLOT_MSS
; Line 1418
	mov	eax, DWORD PTR _ptrSrc2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrLapBuf2$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrDstBuf2$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?PerformLOT_MSS@MIOEncoder@@IAEXPAM00@Z	; MIOEncoder::PerformLOT_MSS
; Line 1422
	mov	eax, DWORD PTR _ptrDstBuf2$[ebp]
	add	eax, 4
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	add	edx, 4
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetRevolveCode@MIOEncoder@@IAEHPBM0@Z	; MIOEncoder::GetRevolveCode
	mov	DWORD PTR _nRevCode2$[ebp], eax
; Line 1428
	mov	eax, DWORD PTR _nRevCode2$[ebp]
	neg	eax
	mov	DWORD PTR -44+[ebp], eax
	fild	DWORD PTR -44+[ebp]
	fstp	QWORD PTR -52+[ebp]
	fld	QWORD PTR -52+[ebp]
	fmul	QWORD PTR _ERI_PI$S31670
	fdiv	QWORD PTR $T32986
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_sin
	add	esp, 8
	fstp	DWORD PTR _rSin$[ebp]
; Line 1429
	mov	ecx, DWORD PTR _nRevCode2$[ebp]
	neg	ecx
	mov	DWORD PTR -56+[ebp], ecx
	fild	DWORD PTR -56+[ebp]
	fstp	QWORD PTR -64+[ebp]
	fld	QWORD PTR -64+[ebp]
	fmul	QWORD PTR _ERI_PI$S31670
	fdiv	QWORD PTR $T32986
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_cos
	add	esp, 8
	fstp	DWORD PTR _rCos$[ebp]
; Line 1431
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+132]
	shr	eax, 1
	push	eax
	push	2
	mov	ecx, DWORD PTR _rCos$[ebp]
	push	ecx
	mov	edx, DWORD PTR _rSin$[ebp]
	push	edx
	mov	eax, DWORD PTR _ptrDstBuf2$[ebp]
	add	eax, 4
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	add	edx, 4
	push	edx
	call	_eriRevolve2x2
	add	esp, 24					; 00000018H
; Line 1433
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32272
$L32273:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 2
	mov	DWORD PTR _i$[ebp], eax
$L32272:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+132]
	jae	SHORT $L32274
; Line 1435
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	mov	edx, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR [ecx+esi*4+4]
	mov	DWORD PTR [eax+edx*4], ecx
; Line 1436
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrDstBuf2$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _ptrDstBuf2$[ebp]
	mov	ecx, DWORD PTR [esi+ecx*4+4]
	mov	DWORD PTR [eax+edx*4], ecx
; Line 1437
	jmp	SHORT $L32273
$L32274:
; Line 1439
	push	2
	mov	edx, DWORD PTR _nRevCode2$[ebp]
	shl	edx, 30					; 0000001eH
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1448
	lea	eax, DWORD PTR _nCoefficient$[ebp]
	push	eax
	lea	ecx, DWORD PTR _nWeightCode$[ebp]
	push	ecx
	mov	edx, DWORD PTR _rPowerScale$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+52]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Quantumize_MSS@MIOEncoder@@IAEXPAHPBMHMPAK0@Z ; MIOEncoder::Quantumize_MSS
; Line 1452
	push	32					; 00000020H
	mov	eax, DWORD PTR _nWeightCode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1453
	push	16					; 00000010H
	mov	ecx, DWORD PTR _nCoefficient$[ebp]
	shl	ecx, 16					; 00000010H
	push	ecx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1457
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+52]
	mov	DWORD PTR _ptrSrcBuf$[ebp], eax
; Line 1458
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32281
$L32282:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32281:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+132]
	jae	SHORT $L32283
; Line 1460
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+120]
	mov	eax, DWORD PTR _ptrSrcBuf$[ebp]
	mov	cx, WORD PTR [eax+4]
	mov	WORD PTR [edx], cx
; Line 1461
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+120]
	add	eax, 2
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+120], eax
; Line 1462
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	add	edx, 8
	mov	DWORD PTR _ptrSrcBuf$[ebp], edx
; Line 1463
	jmp	SHORT $L32282
$L32283:
; Line 1464
	xor	eax, eax
; Line 1465
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?EncodeLeadBlock_MSS@MIOEncoder@@IAEHAAVRLHEncodeContext@@PAM1M@Z ENDP ; MIOEncoder::EncodeLeadBlock_MSS
_context$ = 8
_rPowerScale$ = 12
_this$ = -48
_i$ = -36
_ptrSamples1$ = -20
_ptrDstBuf2$ = -16
_ptrLapBuf2$ = -28
_ptrSamples2$ = -12
_nRevCode2$ = -24
_rSin$ = -40
_rCos$ = -8
_nWeightCode$ = -44
_nCoefficient$ = -32
_ptrSrcBuf$ = -4
?EncodePostBlock_MSS@MIOEncoder@@IAEHAAVRLHEncodeContext@@M@Z PROC NEAR ; MIOEncoder::EncodePostBlock_MSS
; Line 1472
	push	ebp
	mov	ebp, esp
	sub	esp, 72					; 00000048H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1477
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+52]
	mov	DWORD PTR _ptrSamples1$[ebp], ecx
; Line 1478
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32292
$L32293:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32292:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+132]
	jae	SHORT $L32294
; Line 1480
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 1
	mov	eax, DWORD PTR _ptrSamples1$[ebp]
	mov	DWORD PTR [eax+edx*4], 0
; Line 1481
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 1
	mov	edx, DWORD PTR _ptrSamples1$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], 0
; Line 1482
	jmp	SHORT $L32293
$L32294:
; Line 1486
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	lea	ecx, DWORD PTR [eax+ecx*4]
	mov	DWORD PTR _ptrDstBuf2$[ebp], ecx
; Line 1487
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+132]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+84]
	lea	eax, DWORD PTR [edx+eax*4]
	mov	DWORD PTR _ptrLapBuf2$[ebp], eax
; Line 1488
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+132]
	mov	eax, DWORD PTR _ptrSamples1$[ebp]
	lea	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _ptrSamples2$[ebp], ecx
; Line 1490
	mov	edx, DWORD PTR _ptrSamples1$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+84]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?PerformLOT_MSS@MIOEncoder@@IAEXPAM00@Z	; MIOEncoder::PerformLOT_MSS
; Line 1491
	mov	ecx, DWORD PTR _ptrSamples2$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrLapBuf2$[ebp]
	push	edx
	mov	eax, DWORD PTR _ptrDstBuf2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?PerformLOT_MSS@MIOEncoder@@IAEXPAM00@Z	; MIOEncoder::PerformLOT_MSS
; Line 1495
	mov	ecx, DWORD PTR _ptrDstBuf2$[ebp]
	add	ecx, 4
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	add	eax, 4
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetRevolveCode@MIOEncoder@@IAEHPBM0@Z	; MIOEncoder::GetRevolveCode
	mov	DWORD PTR _nRevCode2$[ebp], eax
; Line 1501
	mov	ecx, DWORD PTR _nRevCode2$[ebp]
	neg	ecx
	mov	DWORD PTR -52+[ebp], ecx
	fild	DWORD PTR -52+[ebp]
	fstp	QWORD PTR -60+[ebp]
	fld	QWORD PTR -60+[ebp]
	fmul	QWORD PTR _ERI_PI$S31670
	fdiv	QWORD PTR $T32986
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_sin
	add	esp, 8
	fstp	DWORD PTR _rSin$[ebp]
; Line 1502
	mov	edx, DWORD PTR _nRevCode2$[ebp]
	neg	edx
	mov	DWORD PTR -64+[ebp], edx
	fild	DWORD PTR -64+[ebp]
	fstp	QWORD PTR -72+[ebp]
	fld	QWORD PTR -72+[ebp]
	fmul	QWORD PTR _ERI_PI$S31670
	fdiv	QWORD PTR $T32986
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_cos
	add	esp, 8
	fstp	DWORD PTR _rCos$[ebp]
; Line 1504
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	shr	ecx, 1
	push	ecx
	push	2
	mov	edx, DWORD PTR _rCos$[ebp]
	push	edx
	mov	eax, DWORD PTR _rSin$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrDstBuf2$[ebp]
	add	ecx, 4
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	add	eax, 4
	push	eax
	call	_eriRevolve2x2
	add	esp, 24					; 00000018H
; Line 1506
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32303
$L32304:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 2
	mov	DWORD PTR _i$[ebp], ecx
$L32303:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+132]
	jae	SHORT $L32305
; Line 1508
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	mov	eax, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR [edx+esi*4+4]
	mov	DWORD PTR [ecx+eax*4], edx
; Line 1509
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrDstBuf2$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _ptrDstBuf2$[ebp]
	mov	edx, DWORD PTR [esi+edx*4+4]
	mov	DWORD PTR [ecx+eax*4], edx
; Line 1510
	jmp	SHORT $L32304
$L32305:
; Line 1512
	push	2
	mov	eax, DWORD PTR _nRevCode2$[ebp]
	shl	eax, 30					; 0000001eH
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1521
	lea	ecx, DWORD PTR _nCoefficient$[ebp]
	push	ecx
	lea	edx, DWORD PTR _nWeightCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _rPowerScale$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+132]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+52]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Quantumize_MSS@MIOEncoder@@IAEXPAHPBMHMPAK0@Z ; MIOEncoder::Quantumize_MSS
; Line 1525
	push	32					; 00000020H
	mov	ecx, DWORD PTR _nWeightCode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1526
	push	16					; 00000010H
	mov	edx, DWORD PTR _nCoefficient$[ebp]
	shl	edx, 16					; 00000010H
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?OutNBits@RLHEncodeContext@@QAEHKH@Z	; RLHEncodeContext::OutNBits
; Line 1530
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+52]
	mov	DWORD PTR _ptrSrcBuf$[ebp], ecx
; Line 1531
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32312
$L32313:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32312:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+132]
	jae	SHORT $L32314
; Line 1533
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+120]
	mov	ecx, DWORD PTR _ptrSrcBuf$[ebp]
	mov	dx, WORD PTR [ecx+4]
	mov	WORD PTR [eax], dx
; Line 1534
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+120]
	add	ecx, 2
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+120], ecx
; Line 1535
	mov	eax, DWORD PTR _ptrSrcBuf$[ebp]
	add	eax, 8
	mov	DWORD PTR _ptrSrcBuf$[ebp], eax
; Line 1536
	jmp	SHORT $L32313
$L32314:
; Line 1537
	xor	eax, eax
; Line 1538
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
?EncodePostBlock_MSS@MIOEncoder@@IAEHAAVRLHEncodeContext@@M@Z ENDP ; MIOEncoder::EncodePostBlock_MSS
_ptrQuantumized$ = 8
_ptrSource$ = 12
_nDegreeNum$ = 16
_rPowerScale$ = 20
_ptrWeightCode$ = 24
_ptrCoefficient$ = 28
_this$ = -228
_i$ = -92
_j$ = -108
_nHalfDegree$ = -104
_rPresetWeight$ = -76
_rAvgRatio$ = -164
_k$32335 = -184
_rBaseAvg$ = -16
_nLogRatio$32347 = -188
_rRatio$32349 = -196
_a$32361 = -204
_k$32362 = -212
_rOddWeight$ = -20
_rAvg$ = -8
_rMax$ = -180
_rSum$ = -100
_r$32383 = -220
_rCoefficient$ = -172
_rMinCoefficient$ = -84
_nCoefficient$ = -88
_nQuantumized$32403 = -224
?Quantumize_MSS@MIOEncoder@@IAEXPAHPBMHMPAK0@Z PROC NEAR ; MIOEncoder::Quantumize_MSS
; Line 1547
	push	ebp
	mov	ebp, esp
	sub	esp, 336				; 00000150H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1552
	mov	eax, DWORD PTR _nDegreeNum$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	DWORD PTR _nHalfDegree$[ebp], eax
; Line 1560
	mov	esi, DWORD PTR _this$[ebp]
	push	1070596096				; 3fd00000H
	push	0
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	fld	QWORD PTR [eax+96]
	fdiv	QWORD PTR [ecx+88]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_pow
	add	esp, 16					; 00000010H
	fmul	QWORD PTR [esi+88]
	fstp	QWORD PTR _rPresetWeight$[ebp+8]
	mov	edx, DWORD PTR _rPresetWeight$[ebp+8]
	mov	DWORD PTR _rPresetWeight$[ebp], edx
	mov	eax, DWORD PTR _rPresetWeight$[ebp+12]
	mov	DWORD PTR _rPresetWeight$[ebp+4], eax
; Line 1564
	mov	esi, DWORD PTR _this$[ebp]
	push	1072168960				; 3fe80000H
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	fld	QWORD PTR [ecx+96]
	fdiv	QWORD PTR [edx+88]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_pow
	add	esp, 16					; 00000010H
	fmul	QWORD PTR [esi+88]
	fstp	QWORD PTR _rPresetWeight$[ebp+16]
; Line 1565
	mov	DWORD PTR _i$[ebp], 3
	jmp	SHORT $L32328
$L32329:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32328:
	cmp	DWORD PTR _i$[ebp], 7
	jge	SHORT $L32330
; Line 1568
	mov	ecx, 6
	sub	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 1
	mov	DWORD PTR -232+[ebp], ecx
	fild	DWORD PTR -232+[ebp]
	fstp	QWORD PTR -240+[ebp]
	fld	QWORD PTR -240+[ebp]
	fdiv	QWORD PTR $T32978
	sub	esp, 8
	fstp	QWORD PTR [esp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+100]
	push	eax
	mov	ecx, DWORD PTR [edx+96]
	push	ecx
	call	_pow
	add	esp, 16					; 00000010H
	mov	edx, DWORD PTR _i$[ebp]
	fstp	QWORD PTR _rPresetWeight$[ebp+edx*8]
; Line 1569
	jmp	SHORT $L32329
$L32330:
; Line 1572
	mov	DWORD PTR _i$[ebp], 0
; Line 1573
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32332
$L32333:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L32332:
	cmp	DWORD PTR _j$[ebp], 7
	jge	$L32334
; Line 1575
	mov	ecx, DWORD PTR _j$[ebp]
	mov	DWORD PTR _rAvgRatio$[ebp+ecx*8], 0
	mov	DWORD PTR _rAvgRatio$[ebp+ecx*8+4], 0
; Line 1576
	mov	DWORD PTR _k$32335[ebp], 0
	jmp	SHORT $L32336
$L32337:
	mov	edx, DWORD PTR _k$32335[ebp]
	add	edx, 1
	mov	DWORD PTR _k$32335[ebp], edx
$L32336:
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _k$32335[ebp]
	cmp	edx, DWORD PTR [ecx+eax*4+136]
	jge	$L32338
; Line 1578
	mov	esi, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrSource$[ebp]
	fld	DWORD PTR [ecx+eax*4]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_fabs
	fstp	QWORD PTR [esp]
	call	_sqrt
	add	esp, 8
	fadd	QWORD PTR _rAvgRatio$[ebp+esi*8]
	mov	edx, DWORD PTR _j$[ebp]
	fstp	QWORD PTR _rAvgRatio$[ebp+edx*8]
; Line 1579
	mov	esi, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _ptrSource$[ebp]
	fld	DWORD PTR [edx+ecx*4]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_fabs
	fstp	QWORD PTR [esp]
	call	_sqrt
	add	esp, 8
	fadd	QWORD PTR _rAvgRatio$[ebp+esi*8]
	mov	eax, DWORD PTR _j$[ebp]
	fstp	QWORD PTR _rAvgRatio$[ebp+eax*8]
; Line 1580
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
; Line 1581
	jmp	$L32337
$L32338:
; Line 1582
	mov	edx, DWORD PTR _j$[ebp]
	fld	QWORD PTR _rAvgRatio$[ebp+edx*8]
	fmul	QWORD PTR $T32981
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	fild	DWORD PTR [ecx+eax*4+136]
	fstp	QWORD PTR -248+[ebp]
	fdiv	QWORD PTR -248+[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	fstp	QWORD PTR _rAvgRatio$[ebp+edx*8]
; Line 1583
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	fld	QWORD PTR _rAvgRatio$[ebp+eax*8]
	fmul	QWORD PTR _rAvgRatio$[ebp+ecx*8]
	mov	edx, DWORD PTR _j$[ebp]
	fstp	QWORD PTR _rAvgRatio$[ebp+edx*8]
; Line 1584
	jmp	$L32333
$L32334:
; Line 1585
	mov	eax, DWORD PTR _ptrWeightCode$[ebp]
	mov	DWORD PTR [eax], 0
; Line 1586
	mov	DWORD PTR _rBaseAvg$[ebp], 0
	mov	DWORD PTR _rBaseAvg$[ebp+4], 0
; Line 1587
	mov	DWORD PTR _i$[ebp], 6
	jmp	SHORT $L32340
$L32341:
	mov	ecx, DWORD PTR _i$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32340:
	cmp	DWORD PTR _i$[ebp], 0
	jl	SHORT $L32342
; Line 1589
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _rAvgRatio$[ebp+edx*8]
	mov	DWORD PTR _rBaseAvg$[ebp], eax
	mov	ecx, DWORD PTR _rAvgRatio$[ebp+edx*8+4]
	mov	DWORD PTR _rBaseAvg$[ebp+4], ecx
; Line 1590
	fld	QWORD PTR _rBaseAvg$[ebp]
	fcomp	QWORD PTR $T32979
	fnstsw	ax
	test	ah, 1
	jne	SHORT $L32343
; Line 1591
	jmp	SHORT $L32342
$L32343:
; Line 1592
	jmp	SHORT $L32341
$L32342:
; Line 1593
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32344
$L32345:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32344:
	cmp	DWORD PTR _i$[ebp], 6
	jge	$L32346
; Line 1595
	mov	DWORD PTR _nLogRatio$32347[ebp], 0
; Line 1596
	fld	QWORD PTR _rBaseAvg$[ebp]
	fcomp	QWORD PTR $T32979
	fnstsw	ax
	test	ah, 1
	jne	$L32348
; Line 1599
	push	1072378675				; 3feb3333H
	push	858993459				; 33333333H
	mov	eax, DWORD PTR _i$[ebp]
	fld	QWORD PTR _rAvgRatio$[ebp+eax*8]
	fdiv	QWORD PTR _rBaseAvg$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	fdiv	QWORD PTR _rPresetWeight$[ebp+ecx*8]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_pow
	add	esp, 16					; 00000010H
	fstp	QWORD PTR _rRatio$32349[ebp]
; Line 1600
	fld	QWORD PTR _rRatio$32349[ebp]
	fcomp	QWORD PTR $T32980
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L32350
; Line 1603
	mov	edx, DWORD PTR _rRatio$32349[ebp+4]
	push	edx
	mov	eax, DWORD PTR _rRatio$32349[ebp]
	push	eax
	call	_log
	fstp	QWORD PTR -256+[ebp]
	add	esp, 8
	push	1073741824				; 40000000H
	push	0
	call	_log
	add	esp, 8
	fdivr	QWORD PTR -256+[ebp]
	fmul	QWORD PTR $T32977
	fstp	DWORD PTR -260+[ebp]
	fld	DWORD PTR -260+[ebp]
	push	ecx
	fstp	DWORD PTR [esp]
	call	_eriRoundR32ToInt
	add	esp, 4
	mov	DWORD PTR _nLogRatio$32347[ebp], eax
; Line 1604
	cmp	DWORD PTR _nLogRatio$32347[ebp], -15	; fffffff1H
	jge	SHORT $L32352
; Line 1605
	mov	DWORD PTR _nLogRatio$32347[ebp], -15	; fffffff1H
$L32352:
; Line 1606
	cmp	DWORD PTR _nLogRatio$32347[ebp], 16	; 00000010H
	jle	SHORT $L32353
; Line 1607
	mov	DWORD PTR _nLogRatio$32347[ebp], 16	; 00000010H
$L32353:
$L32350:
$L32348:
; Line 1610
	fild	DWORD PTR _nLogRatio$32347[ebp]
	fstp	QWORD PTR -268+[ebp]
	fld	QWORD PTR -268+[ebp]
	fmul	QWORD PTR $T32981
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	1073741824				; 40000000H
	push	0
	call	_pow
	add	esp, 16					; 00000010H
	fdivr	QWORD PTR $T32979
	mov	ecx, DWORD PTR _i$[ebp]
	fstp	QWORD PTR _rAvgRatio$[ebp+ecx*8]
; Line 1611
	mov	edx, DWORD PTR _nLogRatio$32347[ebp]
	add	edx, 15					; 0000000fH
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 5
	shl	edx, cl
	mov	eax, DWORD PTR _ptrWeightCode$[ebp]
	mov	ecx, DWORD PTR [eax]
	or	ecx, edx
	mov	edx, DWORD PTR _ptrWeightCode$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 1612
	jmp	$L32345
$L32346:
; Line 1613
	mov	DWORD PTR _rAvgRatio$[ebp+48], 0
	mov	DWORD PTR _rAvgRatio$[ebp+52], 1072693248 ; 3ff00000H
; Line 1615
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32354
$L32355:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32354:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+164]
	jge	SHORT $L32356
; Line 1617
	fld	QWORD PTR _rAvgRatio$[ebp]
	fstp	DWORD PTR -272+[ebp]
	fld	DWORD PTR -272+[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i$[ebp]
	fstp	DWORD PTR [ecx+edx*4]
; Line 1618
	jmp	SHORT $L32355
$L32356:
; Line 1619
	mov	DWORD PTR _j$[ebp], 1
	jmp	SHORT $L32358
$L32359:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L32358:
	cmp	DWORD PTR _j$[ebp], 7
	jge	$L32360
; Line 1621
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _rAvgRatio$[ebp+ecx*8-8]
	mov	DWORD PTR _a$32361[ebp], edx
	mov	eax, DWORD PTR _rAvgRatio$[ebp+ecx*8-4]
	mov	DWORD PTR _a$32361[ebp+4], eax
; Line 1624
	mov	ecx, DWORD PTR _j$[ebp]
	fld	QWORD PTR _rAvgRatio$[ebp+ecx*8]
	fsub	QWORD PTR _a$32361[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	esi, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+edx*4+164]
	sub	edx, DWORD PTR [esi+ecx*4+160]
	mov	DWORD PTR -276+[ebp], edx
	fild	DWORD PTR -276+[ebp]
	fstp	QWORD PTR -284+[ebp]
	fdiv	QWORD PTR -284+[ebp]
	fstp	QWORD PTR _k$32362[ebp]
$L32364:
; Line 1625
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+eax*4+164]
	jge	SHORT $L32365
; Line 1628
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, DWORD PTR [ecx+eax*4+160]
	mov	DWORD PTR -288+[ebp], edx
	fild	DWORD PTR -288+[ebp]
	fstp	QWORD PTR -296+[ebp]
	fld	QWORD PTR _k$32362[ebp]
	fmul	QWORD PTR -296+[ebp]
	fadd	QWORD PTR _a$32361[ebp]
	fstp	DWORD PTR -300+[ebp]
	fld	DWORD PTR -300+[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i$[ebp]
	fstp	DWORD PTR [ecx+edx*4]
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
; Line 1629
	jmp	SHORT $L32364
$L32365:
; Line 1630
	jmp	$L32359
$L32360:
$L32368:
; Line 1631
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _nDegreeNum$[ebp]
	jge	SHORT $L32369
; Line 1633
	fld	QWORD PTR _rAvgRatio$[ebp+48]
	fstp	DWORD PTR -304+[ebp]
	fld	DWORD PTR -304+[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _i$[ebp]
	fstp	DWORD PTR [eax+ecx*4]
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 1634
	jmp	SHORT $L32368
$L32369:
; Line 1636
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	shl	ecx, 30					; 0000001eH
	mov	edx, DWORD PTR _ptrWeightCode$[ebp]
	mov	eax, DWORD PTR [edx]
	or	eax, ecx
	mov	ecx, DWORD PTR _ptrWeightCode$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1637
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+112]
	add	eax, 2
	mov	DWORD PTR -308+[ebp], eax
	fild	DWORD PTR -308+[ebp]
	fstp	DWORD PTR -312+[ebp]
	fld	DWORD PTR -312+[ebp]
	fmul	DWORD PTR $T32982
	fstp	DWORD PTR _rOddWeight$[ebp]
; Line 1638
	mov	DWORD PTR _i$[ebp], 15			; 0000000fH
	jmp	SHORT $L32374
$L32375:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 16					; 00000010H
	mov	DWORD PTR _i$[ebp], ecx
$L32374:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nDegreeNum$[ebp]
	jge	SHORT $L32376
; Line 1640
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i$[ebp]
	fld	DWORD PTR [ecx+edx*4]
	fmul	DWORD PTR _rOddWeight$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	edx, DWORD PTR _i$[ebp]
	fstp	DWORD PTR [ecx+edx*4]
; Line 1641
	jmp	SHORT $L32375
$L32376:
; Line 1646
	mov	DWORD PTR _rMax$[ebp], 0
	mov	DWORD PTR _rMax$[ebp+4], 0
; Line 1647
	mov	DWORD PTR _rSum$[ebp], 0
	mov	DWORD PTR _rSum$[ebp+4], 0
; Line 1649
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32380
$L32381:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32380:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _nDegreeNum$[ebp]
	jge	$L32382
; Line 1652
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _ptrSource$[ebp]
	mov	esi, DWORD PTR _i$[ebp]
	fld	DWORD PTR [edx+ecx*4]
	fmul	DWORD PTR [eax+esi*4]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_fabs
	add	esp, 8
	fstp	QWORD PTR _r$32383[ebp]
; Line 1653
	fld	QWORD PTR _r$32383[ebp]
	fcomp	QWORD PTR _rMax$[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L32384
; Line 1655
	mov	eax, DWORD PTR _r$32383[ebp]
	mov	DWORD PTR _rMax$[ebp], eax
	mov	ecx, DWORD PTR _r$32383[ebp+4]
	mov	DWORD PTR _rMax$[ebp+4], ecx
$L32384:
; Line 1657
	fld	QWORD PTR _r$32383[ebp]
	fcomp	QWORD PTR $T32979
	fnstsw	ax
	test	ah, 1
	jne	SHORT $L32385
; Line 1659
	mov	edx, DWORD PTR _r$32383[ebp+4]
	push	edx
	mov	eax, DWORD PTR _r$32383[ebp]
	push	eax
	call	_sqrt
	add	esp, 8
	fadd	QWORD PTR _rSum$[ebp]
	fstp	QWORD PTR _rSum$[ebp]
$L32385:
; Line 1662
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+132]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	eax, DWORD PTR _ptrSource$[ebp]
	mov	esi, DWORD PTR _i$[ebp]
	fld	DWORD PTR [eax+edx*4]
	fmul	DWORD PTR [ecx+esi*4]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_fabs
	add	esp, 8
	fstp	QWORD PTR _r$32383[ebp]
; Line 1663
	fld	QWORD PTR _r$32383[ebp]
	fcomp	QWORD PTR _rMax$[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $L32386
; Line 1665
	mov	ecx, DWORD PTR _r$32383[ebp]
	mov	DWORD PTR _rMax$[ebp], ecx
	mov	edx, DWORD PTR _r$32383[ebp+4]
	mov	DWORD PTR _rMax$[ebp+4], edx
$L32386:
; Line 1667
	fld	QWORD PTR _r$32383[ebp]
	fcomp	QWORD PTR $T32979
	fnstsw	ax
	test	ah, 1
	jne	SHORT $L32387
; Line 1669
	mov	eax, DWORD PTR _r$32383[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _r$32383[ebp]
	push	ecx
	call	_sqrt
	add	esp, 8
	fadd	QWORD PTR _rSum$[ebp]
	fstp	QWORD PTR _rSum$[ebp]
$L32387:
; Line 1671
	jmp	$L32381
$L32382:
; Line 1672
	fild	DWORD PTR _nDegreeNum$[ebp]
	fstp	QWORD PTR -320+[ebp]
	fld	QWORD PTR _rSum$[ebp]
	fdiv	QWORD PTR -320+[ebp]
	fdiv	QWORD PTR $T32977
	fstp	QWORD PTR _rAvg$[ebp]
; Line 1673
	fld	QWORD PTR _rAvg$[ebp]
	fmul	QWORD PTR _rAvg$[ebp]
	fstp	QWORD PTR _rAvg$[ebp]
; Line 1678
	fld	QWORD PTR _rMax$[ebp]
	fdiv	QWORD PTR $T32983
	fstp	QWORD PTR _rMinCoefficient$[ebp]
; Line 1679
	fld	QWORD PTR _rMinCoefficient$[ebp]
	fcomp	QWORD PTR $T32979
	fnstsw	ax
	test	ah, 1
	je	SHORT $L32390
; Line 1681
	mov	DWORD PTR _rMinCoefficient$[ebp], 0
	mov	DWORD PTR _rMinCoefficient$[ebp+4], 1072693248 ; 3ff00000H
$L32390:
; Line 1683
	mov	edx, DWORD PTR _rMinCoefficient$[ebp]
	mov	DWORD PTR _rCoefficient$[ebp], edx
	mov	eax, DWORD PTR _rMinCoefficient$[ebp+4]
	mov	DWORD PTR _rCoefficient$[ebp+4], eax
; Line 1684
	fld	DWORD PTR _rPowerScale$[ebp]
	fcomp	QWORD PTR _rAvg$[ebp]
	fnstsw	ax
	test	ah, 1
	je	SHORT $L32391
; Line 1686
	fld	DWORD PTR _rPowerScale$[ebp]
	fdivr	QWORD PTR _rAvg$[ebp]
	fstp	QWORD PTR _rCoefficient$[ebp]
$L32391:
; Line 1688
	fld	QWORD PTR _rCoefficient$[ebp]
	fcomp	QWORD PTR _rMinCoefficient$[ebp]
	fnstsw	ax
	test	ah, 1
	je	SHORT $L32392
; Line 1690
	mov	ecx, DWORD PTR _rMinCoefficient$[ebp]
	mov	DWORD PTR _rCoefficient$[ebp], ecx
	mov	edx, DWORD PTR _rMinCoefficient$[ebp+4]
	mov	DWORD PTR _rCoefficient$[ebp+4], edx
$L32392:
; Line 1692
	fld	QWORD PTR _rCoefficient$[ebp]
	fstp	DWORD PTR -324+[ebp]
	fld	DWORD PTR -324+[ebp]
	push	ecx
	fstp	DWORD PTR [esp]
	call	_eriRoundR32ToInt
	add	esp, 4
	mov	DWORD PTR _nCoefficient$[ebp], eax
; Line 1693
	cmp	DWORD PTR _nCoefficient$[ebp], 65536	; 00010000H
	jl	SHORT $L32395
; Line 1695
	mov	DWORD PTR _nCoefficient$[ebp], 65535	; 0000ffffH
$L32395:
; Line 1697
	mov	eax, DWORD PTR _ptrCoefficient$[ebp]
	mov	ecx, DWORD PTR _nCoefficient$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 1699
	fild	DWORD PTR _nCoefficient$[ebp]
	fstp	QWORD PTR -332+[ebp]
	fld	QWORD PTR $T32979
	fdiv	QWORD PTR -332+[ebp]
	fstp	QWORD PTR _rCoefficient$[ebp]
; Line 1701
	fild	DWORD PTR _nCoefficient$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _nDegreeNum$[ebp]
	fstp	DWORD PTR [eax+ecx*4-4]
; Line 1705
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32397
$L32398:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L32397:
	cmp	DWORD PTR _j$[ebp], 2
	jge	$L32399
; Line 1707
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32400
$L32401:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32400:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _nDegreeNum$[ebp]
	jge	$L32402
; Line 1710
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	ecx, DWORD PTR _ptrSource$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	fld	DWORD PTR [ecx]
	fmul	DWORD PTR [eax+edx*4]
	fmul	QWORD PTR _rCoefficient$[ebp]
	fstp	DWORD PTR -336+[ebp]
	mov	eax, DWORD PTR -336+[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrSource$[ebp]
	add	ecx, 4
	mov	DWORD PTR _ptrSource$[ebp], ecx
	call	_eriRoundR32ToInt
	add	esp, 4
	mov	DWORD PTR _nQuantumized$32403[ebp], eax
; Line 1711
	cmp	DWORD PTR _nQuantumized$32403[ebp], -32768 ; ffff8000H
	jge	SHORT $L32405
; Line 1713
	mov	DWORD PTR _nQuantumized$32403[ebp], -32768 ; ffff8000H
; Line 1715
	jmp	SHORT $L32406
$L32405:
	cmp	DWORD PTR _nQuantumized$32403[ebp], 32767 ; 00007fffH
	jle	SHORT $L32407
; Line 1717
	mov	DWORD PTR _nQuantumized$32403[ebp], 32767 ; 00007fffH
$L32407:
$L32406:
; Line 1719
	mov	edx, DWORD PTR _ptrQuantumized$[ebp]
	mov	eax, DWORD PTR _nQuantumized$32403[ebp]
	mov	DWORD PTR [edx], eax
	mov	ecx, DWORD PTR _ptrQuantumized$[ebp]
	add	ecx, 4
	mov	DWORD PTR _ptrQuantumized$[ebp], ecx
; Line 1720
	jmp	$L32401
$L32402:
; Line 1721
	jmp	$L32398
$L32399:
; Line 1722
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	24					; 00000018H
?Quantumize_MSS@MIOEncoder@@IAEXPAHPBMHMPAK0@Z ENDP	; MIOEncoder::Quantumize_MSS
_TEXT	ENDS
PUBLIC	??0MIODecoder@@QAE@XZ				; MIODecoder::MIODecoder
PUBLIC	?Initialize@MIODecoder@@UAEHABUMIO_INFO_HEADER@@@Z ; MIODecoder::Initialize
PUBLIC	?Delete@MIODecoder@@UAEXXZ			; MIODecoder::Delete
PUBLIC	?DecodeSound@MIODecoder@@UAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z ; MIODecoder::DecodeSound
PUBLIC	??_7MIODecoder@@6B@				; MIODecoder::`vftable'
PUBLIC	??_GMIODecoder@@UAEPAXI@Z			; MIODecoder::`scalar deleting destructor'
;PUBLIC	??_EMIODecoder@@UAEPAXI@Z			; MIODecoder::`vector deleting destructor'
;	COMDAT ??_7MIODecoder@@6B@
; File I:\EntisGLS\eri-chan\experi\cxmio.cpp
CONST	SEGMENT
??_7MIODecoder@@6B@	LABEL	DWORD
;DD FLAT:??_EMIODecoder@@UAEPAXI@Z	; MIODecoder::`vftable'
	DD	FLAT:??_GMIODecoder@@UAEPAXI@Z
	DD	FLAT:?Initialize@MIODecoder@@UAEHABUMIO_INFO_HEADER@@@Z
	DD	FLAT:?Delete@MIODecoder@@UAEXXZ
	DD	FLAT:?DecodeSound@MIODecoder@@UAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z
CONST	ENDS
_TEXT	SEGMENT
_this$ = -4
??0MIODecoder@@QAE@XZ PROC NEAR				; MIODecoder::MIODecoder
; File I:\EntisGLS\eri-chan\experi\cxmio.cpp
; Line 1733
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7MIODecoder@@6B@ ; MIODecoder::`vftable'
; Line 1734
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+44], 0
; Line 1735
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+48], 0
; Line 1736
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+52], 0
; Line 1737
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+56], 0
; Line 1738
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+60], 0
; Line 1739
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+64], 0
; Line 1740
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+68], 0
; Line 1741
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+72], 0
; Line 1742
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+76], 0
; Line 1743
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+80], 0
; Line 1744
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+84], 0
; Line 1745
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+88], 0
; Line 1746
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+92], 0
; Line 1747
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+96], 0
; Line 1748
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+132], 0
; Line 1749
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0MIODecoder@@QAE@XZ ENDP				; MIODecoder::MIODecoder
_TEXT	ENDS
PUBLIC	??1MIODecoder@@UAE@XZ				; MIODecoder::~MIODecoder
;	COMDAT ??_GMIODecoder@@UAEPAXI@Z
_TEXT	SEGMENT
___flags$ = 8
_this$ = -4
??_GMIODecoder@@UAEPAXI@Z PROC NEAR			; MIODecoder::`scalar deleting destructor', COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1MIODecoder@@UAE@XZ			; MIODecoder::~MIODecoder
	mov	eax, DWORD PTR ___flags$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L32414
	mov	ecx, DWORD PTR _this$[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L32414:
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??_GMIODecoder@@UAEPAXI@Z ENDP				; MIODecoder::`scalar deleting destructor'
_TEXT	ENDS
_TEXT	SEGMENT
_this$ = -4
??1MIODecoder@@UAE@XZ PROC NEAR				; MIODecoder::~MIODecoder
; Line 1755
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7MIODecoder@@6B@ ; MIODecoder::`vftable'
; Line 1756
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Delete@MIODecoder@@UAEXXZ		; MIODecoder::Delete
; Line 1757
	mov	esp, ebp
	pop	ebp
	ret	0
??1MIODecoder@@UAE@XZ ENDP				; MIODecoder::~MIODecoder
_TEXT	ENDS
PUBLIC	?InitializeWithDegree@MIODecoder@@IAEXI@Z	; MIODecoder::InitializeWithDegree
_TEXT	SEGMENT
_infhdr$ = 8
_this$ = -16
_i$32445 = -8
_nBlocksetSamples$32446 = -4
_nLappedSamples$32447 = -12
?Initialize@MIODecoder@@UAEHABUMIO_INFO_HEADER@@@Z PROC NEAR ; MIODecoder::Initialize
; Line 1763
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1766
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+8]
; Line 1769
	mov	esi, DWORD PTR _infhdr$[ebp]
	mov	edi, DWORD PTR _this$[ebp]
	add	edi, 4
	mov	ecx, 10					; 0000000aH
	rep movsd
; Line 1772
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 50462720		; 03020000H
	jne	SHORT $L32421
; Line 1774
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+12], -4			; fffffffcH
	je	SHORT $L32422
; Line 1776
	mov	eax, 1
	jmp	$L32420
$L32422:
; Line 1778
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+16], 1
	je	SHORT $L32423
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+16], 2
	je	SHORT $L32423
; Line 1780
	mov	eax, 1
	jmp	$L32420
$L32423:
; Line 1782
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+40], 8
	je	SHORT $L32424
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+40], 16			; 00000010H
	je	SHORT $L32424
; Line 1784
	mov	eax, 1
	jmp	$L32420
$L32424:
; Line 1787
	jmp	$L32425
$L32421:
; Line 1788
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 5
	je	SHORT $L32427
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+8], 261			; 00000105H
	jne	$L32426
$L32427:
; Line 1790
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+12], -1
	je	SHORT $L32428
; Line 1792
	mov	eax, 1
	jmp	$L32420
$L32428:
; Line 1794
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+16], 1
	je	SHORT $L32429
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+16], 2
	je	SHORT $L32429
; Line 1796
	mov	eax, 1
	jmp	$L32420
$L32429:
; Line 1798
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+40], 16			; 00000010H
	je	SHORT $L32430
; Line 1800
	mov	eax, 1
	jmp	$L32420
$L32430:
; Line 1803
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+28], 8
	jb	SHORT $L32432
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+28], 12			; 0000000cH
	jbe	SHORT $L32431
$L32432:
; Line 1805
	mov	eax, 1
	jmp	$L32420
$L32431:
; Line 1807
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+36], 1
	je	SHORT $L32433
; Line 1809
	mov	eax, 1
	jmp	$L32420
$L32433:
; Line 1816
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, 4
	mov	ecx, DWORD PTR [eax+28]
	shl	edx, cl
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	imul	ecx, edx
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+48], eax
; Line 1820
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, 4
	mov	ecx, DWORD PTR [eax+28]
	shl	edx, cl
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	imul	ecx, edx
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+76], eax
; Line 1824
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, 4
	mov	ecx, DWORD PTR [eax+28]
	shl	edx, cl
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	imul	ecx, edx
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+80], eax
; Line 1827
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, 4
	mov	ecx, DWORD PTR [eax+28]
	shl	edx, cl
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+84], eax
; Line 1830
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, 4
	mov	ecx, DWORD PTR [edx+28]
	shl	eax, cl
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+88], eax
; Line 1835
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, 4
	mov	ecx, DWORD PTR [edx+28]
	shl	eax, cl
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+92], eax
; Line 1839
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [edx+16]
	mov	ecx, DWORD PTR [eax+28]
	shl	edx, cl
	mov	DWORD PTR _nBlocksetSamples$32446[ebp], edx
; Line 1840
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nBlocksetSamples$32446[ebp]
	imul	ecx, DWORD PTR [eax+36]
	mov	DWORD PTR _nLappedSamples$32447[ebp], ecx
; Line 1841
	cmp	DWORD PTR _nLappedSamples$32447[ebp], 0
	jbe	SHORT $L32448
; Line 1845
	mov	edx, DWORD PTR _nLappedSamples$32447[ebp]
	shl	edx, 2
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+96], eax
; Line 1846
	mov	DWORD PTR _i$32445[ebp], 0
	jmp	SHORT $L32451
$L32452:
	mov	edx, DWORD PTR _i$32445[ebp]
	add	edx, 1
	mov	DWORD PTR _i$32445[ebp], edx
$L32451:
	mov	eax, DWORD PTR _i$32445[ebp]
	cmp	eax, DWORD PTR _nLappedSamples$32447[ebp]
	jae	SHORT $L32453
; Line 1848
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+96]
	mov	eax, DWORD PTR _i$32445[ebp]
	mov	DWORD PTR [edx+eax*4], 0
; Line 1849
	jmp	SHORT $L32452
$L32453:
$L32448:
; Line 1853
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?InitializeWithDegree@MIODecoder@@IAEXI@Z ; MIODecoder::InitializeWithDegree
; Line 1855
	jmp	SHORT $L32454
$L32426:
; Line 1857
	mov	eax, 1
	jmp	SHORT $L32420
$L32454:
$L32425:
; Line 1861
	xor	eax, eax
$L32420:
; Line 1862
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?Initialize@MIODecoder@@UAEHABUMIO_INFO_HEADER@@@Z ENDP	; MIODecoder::Initialize
_this$ = -4
?Delete@MIODecoder@@UAEXXZ PROC NEAR			; MIODecoder::Delete
; Line 1868
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1869
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+48], 0
	je	SHORT $L32458
; Line 1871
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+48]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 1872
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+48], 0
$L32458:
; Line 1874
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+52], 0
	je	SHORT $L32459
; Line 1876
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+52]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 1877
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+52], 0
$L32459:
; Line 1879
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+56], 0
	je	SHORT $L32460
; Line 1881
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 1882
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+56], 0
$L32460:
; Line 1884
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+60], 0
	je	SHORT $L32461
; Line 1886
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 1887
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+60], 0
$L32461:
; Line 1889
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	je	SHORT $L32462
; Line 1891
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+64]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 1892
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+64], 0
$L32462:
; Line 1894
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+68], 0
	je	SHORT $L32463
; Line 1896
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+68]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 1897
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+68], 0
$L32463:
; Line 1899
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+72], 0
	je	SHORT $L32464
; Line 1901
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 1902
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+72], 0
$L32464:
; Line 1904
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+76], 0
	je	SHORT $L32465
; Line 1906
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 1907
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+76], 0
$L32465:
; Line 1909
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+80], 0
	je	SHORT $L32466
; Line 1911
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 1912
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+80], 0
$L32466:
; Line 1914
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+84], 0
	je	SHORT $L32467
; Line 1916
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+84]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 1917
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+84], 0
$L32467:
; Line 1919
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+88], 0
	je	SHORT $L32468
; Line 1921
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+88]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 1922
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+88], 0
$L32468:
; Line 1924
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+92], 0
	je	SHORT $L32469
; Line 1926
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+92]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 1927
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+92], 0
$L32469:
; Line 1929
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+96], 0
	je	SHORT $L32470
; Line 1931
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+96]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 1932
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+96], 0
$L32470:
; Line 1934
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+132], 0
	je	SHORT $L32471
; Line 1936
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+132]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 1937
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+132], 0
$L32471:
; Line 1939
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+44], 0
; Line 1940
	mov	esp, ebp
	pop	ebp
	ret	0
?Delete@MIODecoder@@UAEXXZ ENDP				; MIODecoder::Delete
_TEXT	ENDS
PUBLIC	?DecodeSoundPCM8@MIODecoder@@IAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z ; MIODecoder::DecodeSoundPCM8
PUBLIC	?DecodeSoundPCM16@MIODecoder@@IAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z ; MIODecoder::DecodeSoundPCM16
PUBLIC	?DecodeSoundDCT@MIODecoder@@IAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z ; MIODecoder::DecodeSoundDCT
PUBLIC	?DecodeSoundDCT_MSS@MIODecoder@@IAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z ; MIODecoder::DecodeSoundDCT_MSS
EXTRN	?FlushBuffer@RLHDecodeContext@@QAEXXZ:NEAR	; RLHDecodeContext::FlushBuffer
_TEXT	SEGMENT
_context$ = 8
_datahdr$ = 12
_ptrWaveBuf$ = 16
_this$ = -4
?DecodeSound@MIODecoder@@UAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z PROC NEAR ; MIODecoder::DecodeSound
; Line 1948
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1949
	mov	ecx, DWORD PTR _context$[ebp]
	call	?FlushBuffer@RLHDecodeContext@@QAEXXZ	; RLHDecodeContext::FlushBuffer
; Line 1951
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 50462720		; 03020000H
	jne	SHORT $L32477
; Line 1953
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+40], 8
	jne	SHORT $L32478
; Line 1955
	mov	edx, DWORD PTR _ptrWaveBuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _datahdr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DecodeSoundPCM8@MIODecoder@@IAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z ; MIODecoder::DecodeSoundPCM8
	jmp	SHORT $L32476
$L32478:
; Line 1957
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+40], 16			; 00000010H
	jne	SHORT $L32480
; Line 1959
	mov	eax, DWORD PTR _ptrWaveBuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _datahdr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _context$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DecodeSoundPCM16@MIODecoder@@IAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z ; MIODecoder::DecodeSoundPCM16
	jmp	SHORT $L32476
$L32480:
; Line 1962
	jmp	SHORT $L32481
$L32477:
; Line 1963
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 5
	je	SHORT $L32483
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+8], 261			; 00000105H
	jne	SHORT $L32482
$L32483:
; Line 1966
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+16], 2
	jne	SHORT $L32485
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 5
	jne	SHORT $L32484
$L32485:
; Line 1968
	mov	ecx, DWORD PTR _ptrWaveBuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _datahdr$[ebp]
	push	edx
	mov	eax, DWORD PTR _context$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DecodeSoundDCT@MIODecoder@@IAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z ; MIODecoder::DecodeSoundDCT
	jmp	SHORT $L32476
$L32484:
; Line 1972
	mov	ecx, DWORD PTR _ptrWaveBuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _datahdr$[ebp]
	push	edx
	mov	eax, DWORD PTR _context$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DecodeSoundDCT_MSS@MIODecoder@@IAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z ; MIODecoder::DecodeSoundDCT_MSS
	jmp	SHORT $L32476
$L32482:
$L32481:
; Line 1976
	mov	eax, 1
$L32476:
; Line 1977
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?DecodeSound@MIODecoder@@UAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z ENDP ; MIODecoder::DecodeSound
_TEXT	ENDS
EXTRN	?PrepareToDecodeERINACode@RLHDecodeContext@@QAEXXZ:NEAR ; RLHDecodeContext::PrepareToDecodeERINACode
EXTRN	?DecodeERINACodesSBZL@RLHDecodeContext@@QAEKPACK@Z:NEAR ; RLHDecodeContext::DecodeERINACodesSBZL
_TEXT	SEGMENT
_context$ = 8
_datahdr$ = 12
_ptrWaveBuf$ = 16
_this$ = -36
_nSampleCount$ = -8
_nBytes$ = -12
_ptrSrcBuf$ = -4
_ptrDstBuf$ = -24
_nStep$ = -28
_i$ = -16
_j$ = -20
_bytValue$32509 = -32
?DecodeSoundPCM8@MIODecoder@@IAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z PROC NEAR ; MIODecoder::DecodeSoundPCM8
; Line 1985
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1988
	mov	eax, DWORD PTR _datahdr$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _nSampleCount$[ebp], ecx
; Line 1989
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	cmp	eax, DWORD PTR [edx+44]
	jbe	SHORT $L32493
; Line 1991
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+48], 0
	je	SHORT $L32494
; Line 1993
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+48]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L32494:
; Line 1996
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nSampleCount$[ebp]
	imul	edx, DWORD PTR [ecx+16]
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+48], eax
; Line 1997
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	mov	DWORD PTR [edx+44], eax
$L32493:
; Line 2001
	mov	ecx, DWORD PTR _datahdr$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx+1]
	and	edx, 1
	test	edx, edx
	je	SHORT $L32495
; Line 2003
	mov	ecx, DWORD PTR _context$[ebp]
	call	?PrepareToDecodeERINACode@RLHDecodeContext@@QAEXXZ ; RLHDecodeContext::PrepareToDecodeERINACode
$L32495:
; Line 2005
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nSampleCount$[ebp]
	imul	ecx, DWORD PTR [eax+16]
	mov	DWORD PTR _nBytes$[ebp], ecx
; Line 2007
	mov	edx, DWORD PTR _nBytes$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+48]
	push	ecx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?DecodeERINACodesSBZL@RLHDecodeContext@@QAEKPACK@Z ; RLHDecodeContext::DecodeERINACodesSBZL
	cmp	eax, DWORD PTR _nBytes$[ebp]
	jae	SHORT $L32498
; Line 2009
	mov	eax, 1
	jmp	$L32491
$L32498:
; Line 2013
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+48]
	mov	DWORD PTR _ptrSrcBuf$[ebp], eax
; Line 2015
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	DWORD PTR _nStep$[ebp], edx
; Line 2017
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32505
$L32506:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32505:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+16]
	jae	SHORT $L32507
; Line 2019
	mov	eax, DWORD PTR _ptrWaveBuf$[ebp]
	mov	DWORD PTR _ptrDstBuf$[ebp], eax
; Line 2020
	mov	ecx, DWORD PTR _ptrDstBuf$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _ptrDstBuf$[ebp], ecx
; Line 2022
	mov	BYTE PTR _bytValue$32509[ebp], 0
; Line 2023
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32510
$L32511:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L32510:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _nSampleCount$[ebp]
	jae	SHORT $L32512
; Line 2025
	mov	ecx, DWORD PTR _ptrSrcBuf$[ebp]
	mov	dl, BYTE PTR _bytValue$32509[ebp]
	add	dl, BYTE PTR [ecx]
	mov	BYTE PTR _bytValue$32509[ebp], dl
	mov	eax, DWORD PTR _ptrSrcBuf$[ebp]
	add	eax, 1
	mov	DWORD PTR _ptrSrcBuf$[ebp], eax
; Line 2026
	mov	ecx, DWORD PTR _ptrDstBuf$[ebp]
	mov	dl, BYTE PTR _bytValue$32509[ebp]
	mov	BYTE PTR [ecx], dl
; Line 2027
	mov	eax, DWORD PTR _ptrDstBuf$[ebp]
	add	eax, DWORD PTR _nStep$[ebp]
	mov	DWORD PTR _ptrDstBuf$[ebp], eax
; Line 2028
	jmp	SHORT $L32511
$L32512:
; Line 2029
	jmp	SHORT $L32506
$L32507:
; Line 2031
	xor	eax, eax
$L32491:
; Line 2032
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?DecodeSoundPCM8@MIODecoder@@IAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z ENDP ; MIODecoder::DecodeSoundPCM8
_context$ = 8
_datahdr$ = 12
_ptrWaveBuf$ = 16
_this$ = -72
_i$ = -32
_j$ = -36
_nSampleCount$ = -8
_nChannelCount$ = -44
_nAllSampleCount$ = -24
_nBytes$ = -16
_pbytSrcBuf1$ = -20
_pbytSrcBuf2$ = -12
_pbytDstBuf$ = -28
_nOffset$32539 = -52
_bytLow$32546 = -56
_bytHigh$32547 = -60
_ptrSrcBuf$ = -4
_ptrDstBuf$ = -40
_nStep$ = -48
_wValue$32558 = -68
_wDelta$32559 = -64
?DecodeSoundPCM16@MIODecoder@@IAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z PROC NEAR ; MIODecoder::DecodeSoundPCM16
; Line 2040
	push	ebp
	mov	ebp, esp
	sub	esp, 72					; 00000048H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2045
	mov	eax, DWORD PTR _datahdr$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _nSampleCount$[ebp], ecx
; Line 2046
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	DWORD PTR _nChannelCount$[ebp], eax
; Line 2047
	mov	ecx, DWORD PTR _nSampleCount$[ebp]
	imul	ecx, DWORD PTR _nChannelCount$[ebp]
	mov	DWORD PTR _nAllSampleCount$[ebp], ecx
; Line 2049
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	cmp	eax, DWORD PTR [edx+44]
	jbe	SHORT $L32523
; Line 2051
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+48], 0
	je	SHORT $L32524
; Line 2053
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+48]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L32524:
; Line 2055
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+52], 0
	je	SHORT $L32525
; Line 2057
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+52]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L32525:
; Line 2060
	mov	ecx, DWORD PTR _nAllSampleCount$[ebp]
	shl	ecx, 1
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+48], eax
; Line 2062
	mov	eax, DWORD PTR _nAllSampleCount$[ebp]
	shl	eax, 1
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+52], eax
; Line 2064
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	mov	DWORD PTR [edx+44], eax
$L32523:
; Line 2068
	mov	ecx, DWORD PTR _datahdr$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx+1]
	and	edx, 1
	test	edx, edx
	je	SHORT $L32528
; Line 2070
	mov	ecx, DWORD PTR _context$[ebp]
	call	?PrepareToDecodeERINACode@RLHDecodeContext@@QAEXXZ ; RLHDecodeContext::PrepareToDecodeERINACode
$L32528:
; Line 2072
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	imul	eax, DWORD PTR _nChannelCount$[ebp]
	shl	eax, 1
	mov	DWORD PTR _nBytes$[ebp], eax
; Line 2074
	mov	ecx, DWORD PTR _nBytes$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+48]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	call	?DecodeERINACodesSBZL@RLHDecodeContext@@QAEKPACK@Z ; RLHDecodeContext::DecodeERINACodesSBZL
	cmp	eax, DWORD PTR _nBytes$[ebp]
	jae	SHORT $L32532
; Line 2076
	mov	eax, 1
	jmp	$L32517
$L32532:
; Line 2081
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32536
$L32537:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32536:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+16]
	jae	$L32538
; Line 2083
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, DWORD PTR _nSampleCount$[ebp]
	shl	ecx, 1
	mov	DWORD PTR _nOffset$32539[ebp], ecx
; Line 2084
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+48]
	add	eax, DWORD PTR _nOffset$32539[ebp]
	mov	DWORD PTR _pbytSrcBuf1$[ebp], eax
; Line 2085
	mov	ecx, DWORD PTR _pbytSrcBuf1$[ebp]
	add	ecx, DWORD PTR _nSampleCount$[ebp]
	mov	DWORD PTR _pbytSrcBuf2$[ebp], ecx
; Line 2086
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+52]
	add	eax, DWORD PTR _nOffset$32539[ebp]
	mov	DWORD PTR _pbytDstBuf$[ebp], eax
; Line 2088
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32543
$L32544:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L32543:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _nSampleCount$[ebp]
	jae	SHORT $L32545
; Line 2090
	mov	eax, DWORD PTR _pbytSrcBuf2$[ebp]
	add	eax, DWORD PTR _j$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR _bytLow$32546[ebp], cl
; Line 2091
	mov	edx, DWORD PTR _pbytSrcBuf1$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR _bytHigh$32547[ebp], al
; Line 2092
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _pbytDstBuf$[ebp]
	mov	al, BYTE PTR _bytLow$32546[ebp]
	mov	BYTE PTR [edx+ecx*2], al
; Line 2093
	movsx	ecx, BYTE PTR _bytHigh$32547[ebp]
	movsx	edx, BYTE PTR _bytLow$32546[ebp]
	sar	edx, 7
	xor	ecx, edx
	mov	eax, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _pbytDstBuf$[ebp]
	mov	BYTE PTR [edx+eax*2+1], cl
; Line 2094
	jmp	SHORT $L32544
$L32545:
; Line 2095
	jmp	$L32537
$L32538:
; Line 2098
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+52]
	mov	DWORD PTR _ptrSrcBuf$[ebp], ecx
; Line 2100
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	DWORD PTR _nStep$[ebp], eax
; Line 2101
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32554
$L32555:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32554:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+16]
	jae	SHORT $L32556
; Line 2103
	mov	ecx, DWORD PTR _ptrWaveBuf$[ebp]
	mov	DWORD PTR _ptrDstBuf$[ebp], ecx
; Line 2104
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrDstBuf$[ebp]
	lea	ecx, DWORD PTR [eax+edx*2]
	mov	DWORD PTR _ptrDstBuf$[ebp], ecx
; Line 2106
	mov	WORD PTR _wValue$32558[ebp], 0
; Line 2107
	mov	WORD PTR _wDelta$32559[ebp], 0
; Line 2108
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32560
$L32561:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L32560:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _nSampleCount$[ebp]
	jae	SHORT $L32562
; Line 2110
	mov	ecx, DWORD PTR _ptrSrcBuf$[ebp]
	mov	dx, WORD PTR _wDelta$32559[ebp]
	add	dx, WORD PTR [ecx]
	mov	WORD PTR _wDelta$32559[ebp], dx
	mov	eax, DWORD PTR _ptrSrcBuf$[ebp]
	add	eax, 2
	mov	DWORD PTR _ptrSrcBuf$[ebp], eax
; Line 2111
	mov	cx, WORD PTR _wValue$32558[ebp]
	add	cx, WORD PTR _wDelta$32559[ebp]
	mov	WORD PTR _wValue$32558[ebp], cx
; Line 2112
	mov	edx, DWORD PTR _ptrDstBuf$[ebp]
	mov	ax, WORD PTR _wValue$32558[ebp]
	mov	WORD PTR [edx], ax
; Line 2113
	mov	ecx, DWORD PTR _nStep$[ebp]
	mov	edx, DWORD PTR _ptrDstBuf$[ebp]
	lea	eax, DWORD PTR [edx+ecx*2]
	mov	DWORD PTR _ptrDstBuf$[ebp], eax
; Line 2114
	jmp	SHORT $L32561
$L32562:
; Line 2115
	jmp	$L32555
$L32556:
; Line 2117
	xor	eax, eax
$L32517:
; Line 2118
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?DecodeSoundPCM16@MIODecoder@@IAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z ENDP ; MIODecoder::DecodeSoundPCM16
_nSubbandDegree$ = 8
_this$ = -16
_i$ = -4
_j$ = -8
_nFrequencyWidth$32574 = -12
?InitializeWithDegree@MIODecoder@@IAEXI@Z PROC NEAR	; MIODecoder::InitializeWithDegree
; Line 2124
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2127
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+132], 0
	je	SHORT $L32566
; Line 2129
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+132]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L32566:
; Line 2131
	mov	eax, DWORD PTR _nSubbandDegree$[ebp]
	push	eax
	call	_eriCreateRevolveParameter
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+132], eax
; Line 2138
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32571
$L32572:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32571:
	cmp	DWORD PTR _i$[ebp], 7
	jge	SHORT $L32573
; Line 2140
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _nSubbandDegree$[ebp]
	add	ecx, DWORD PTR _?freq_width@?4??InitializeWithDegree@MIODecoder@@IAEXI@Z@4PBHB$S32568[eax*4]
	mov	edx, 1
	shl	edx, cl
	mov	DWORD PTR _nFrequencyWidth$32574[ebp], edx
; Line 2141
	mov	eax, DWORD PTR _nFrequencyWidth$32574[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, eax
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+edx*4+136], ecx
; Line 2142
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, DWORD PTR _nFrequencyWidth$32574[ebp]
	mov	DWORD PTR _j$[ebp], ecx
; Line 2143
	jmp	SHORT $L32572
$L32573:
; Line 2146
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSubbandDegree$[ebp]
	mov	DWORD PTR [edx+124], eax
; Line 2147
	mov	edx, 1
	mov	ecx, DWORD PTR _nSubbandDegree$[ebp]
	shl	edx, cl
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+128], edx
; Line 2148
	mov	esp, ebp
	pop	ebp
	ret	4
?InitializeWithDegree@MIODecoder@@IAEXI@Z ENDP		; MIODecoder::InitializeWithDegree
_TEXT	ENDS
PUBLIC	?DecodeInternalBlock@MIODecoder@@IAEHPAFI@Z	; MIODecoder::DecodeInternalBlock
PUBLIC	?DecodeLeadBlock@MIODecoder@@IAEHXZ		; MIODecoder::DecodeLeadBlock
PUBLIC	?DecodePostBlock@MIODecoder@@IAEHPAFI@Z		; MIODecoder::DecodePostBlock
EXTRN	?GetABit@RLHDecodeContext@@QAEHXZ:NEAR		; RLHDecodeContext::GetABit
EXTRN	?GetNBits@RLHDecodeContext@@QAEIH@Z:NEAR	; RLHDecodeContext::GetNBits
_TEXT	SEGMENT
$T32987 = -108
$T32988 = -112
$T32989 = -116
_context$ = 8
_datahdr$ = 12
_ptrWaveBuf$ = 16
_this$ = -120
_i$ = -36
_j$ = -40
_k$ = -56
_nDegreeWidth$ = -32
_nSampleCount$ = -12
_nSubbandCount$ = -8
_nChannelCount$ = -60
_nAllSampleCount$ = -20
_nAllSubbandCount$ = -28
_pLastDivision$ = -52
_nDivisionCode$32617 = -72
_nDivisionCount$32621 = -68
_ptrHBuf$ = -24
_ptrLBuf$ = -64
_ptrQuantumized$32636 = -76
_nLow$32641 = -84
_nHigh$32642 = -80
_nSamples$ = -4
_pRestSamples$ = -48
_ptrDstBuf$ = -44
_nCurrentDivision$ = -16
_nDivisionCode$32660 = -100
_nDivisionCount$32661 = -92
_nChannelStep$32662 = -96
_fLeadBlock$32663 = -88
_nChannelStep$32682 = -104
?DecodeSoundDCT@MIODecoder@@IAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z PROC NEAR ; MIODecoder::DecodeSoundDCT
; Line 2156
	push	ebp
	mov	ebp, esp
	sub	esp, 120				; 00000078H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2161
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, 1
	mov	ecx, DWORD PTR [eax+28]
	shl	edx, cl
	mov	DWORD PTR _nDegreeWidth$[ebp], edx
; Line 2163
	mov	eax, DWORD PTR _datahdr$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	edx, DWORD PTR _nDegreeWidth$[ebp]
	lea	eax, DWORD PTR [ecx+edx-1]
	mov	ecx, DWORD PTR _nDegreeWidth$[ebp]
	sub	ecx, 1
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _nSampleCount$[ebp], eax
; Line 2165
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	mov	ecx, DWORD PTR [edx+28]
	shr	eax, cl
	mov	DWORD PTR _nSubbandCount$[ebp], eax
; Line 2166
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	DWORD PTR _nChannelCount$[ebp], edx
; Line 2167
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	imul	eax, DWORD PTR _nChannelCount$[ebp]
	mov	DWORD PTR _nAllSampleCount$[ebp], eax
; Line 2168
	mov	ecx, DWORD PTR _nSubbandCount$[ebp]
	imul	ecx, DWORD PTR _nChannelCount$[ebp]
	mov	DWORD PTR _nAllSubbandCount$[ebp], ecx
; Line 2170
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	cmp	eax, DWORD PTR [edx+44]
	jbe	$L32589
; Line 2172
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+52], 0
	je	SHORT $L32590
; Line 2174
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+52]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L32590:
; Line 2176
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+56], 0
	je	SHORT $L32591
; Line 2178
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+56]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L32591:
; Line 2180
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+60], 0
	je	SHORT $L32592
; Line 2182
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+60]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L32592:
; Line 2184
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+68], 0
	je	SHORT $L32593
; Line 2186
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+68]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L32593:
; Line 2188
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+72], 0
	je	SHORT $L32594
; Line 2190
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L32594:
; Line 2193
	mov	ecx, DWORD PTR _nAllSampleCount$[ebp]
	shl	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+52], eax
; Line 2195
	mov	eax, DWORD PTR _nAllSampleCount$[ebp]
	shl	eax, 1
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+56], eax
; Line 2197
	mov	edx, DWORD PTR _nAllSubbandCount$[ebp]
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+60], eax
; Line 2199
	mov	edx, DWORD PTR _nAllSubbandCount$[ebp]
	imul	edx, 5
	shl	edx, 2
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+68], eax
; Line 2201
	mov	edx, DWORD PTR _nAllSubbandCount$[ebp]
	imul	edx, 5
	shl	edx, 2
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+72], eax
; Line 2203
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	mov	DWORD PTR [edx+44], eax
$L32589:
; Line 2208
	mov	ecx, DWORD PTR _datahdr$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx+1]
	and	edx, 1
	test	edx, edx
	je	SHORT $L32604
; Line 2210
	mov	ecx, DWORD PTR _context$[ebp]
	call	?PrepareToDecodeERINACode@RLHDecodeContext@@QAEXXZ ; RLHDecodeContext::PrepareToDecodeERINACode
$L32604:
; Line 2212
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetABit@RLHDecodeContext@@QAEHXZ	; RLHDecodeContext::GetABit
	test	eax, eax
	je	SHORT $L32605
; Line 2214
	mov	eax, 1
	jmp	$L32579
$L32605:
; Line 2217
	mov	eax, DWORD PTR _nChannelCount$[ebp]
	shl	eax, 2
	push	eax
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR _pLastDivision$[ebp], eax
; Line 2218
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+60]
	mov	DWORD PTR [ecx+100], eax
; Line 2219
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+68]
	mov	DWORD PTR [ecx+108], eax
; Line 2220
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	mov	DWORD PTR [ecx+112], eax
; Line 2222
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32608
$L32609:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32608:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nChannelCount$[ebp]
	jae	SHORT $L32610
; Line 2224
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pLastDivision$[ebp]
	mov	DWORD PTR [ecx+eax*4], -1
; Line 2225
	jmp	SHORT $L32609
$L32610:
; Line 2226
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32611
$L32612:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32611:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nSubbandCount$[ebp]
	jae	$L32613
; Line 2228
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32614
$L32615:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L32614:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _nChannelCount$[ebp]
	jae	$L32616
; Line 2230
	push	2
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	DWORD PTR _nDivisionCode$32617[ebp], eax
; Line 2231
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	mov	dl, BYTE PTR _nDivisionCode$32617[ebp]
	mov	BYTE PTR [ecx], dl
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	add	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+100], ecx
; Line 2233
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _pLastDivision$[ebp]
	mov	edx, DWORD PTR _nDivisionCode$32617[ebp]
	cmp	edx, DWORD PTR [ecx+eax*4]
	je	SHORT $L32619
; Line 2235
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L32620
; Line 2237
	push	32					; 00000020H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+108], ecx
; Line 2238
	push	16					; 00000010H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+112], ecx
$L32620:
; Line 2240
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _pLastDivision$[ebp]
	mov	edx, DWORD PTR _nDivisionCode$32617[ebp]
	mov	DWORD PTR [ecx+eax*4], edx
$L32619:
; Line 2243
	mov	eax, 1
	mov	ecx, DWORD PTR _nDivisionCode$32617[ebp]
	shl	eax, cl
	mov	DWORD PTR _nDivisionCount$32621[ebp], eax
; Line 2244
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L32622
$L32623:
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
$L32622:
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR _nDivisionCount$32621[ebp]
	jae	SHORT $L32624
; Line 2246
	push	32					; 00000020H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+108], ecx
; Line 2247
	push	16					; 00000010H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+112], ecx
; Line 2248
	jmp	SHORT $L32623
$L32624:
; Line 2249
	jmp	$L32615
$L32616:
; Line 2250
	jmp	$L32612
$L32613:
; Line 2251
	cmp	DWORD PTR _nSubbandCount$[ebp], 0
	jbe	SHORT $L32625
; Line 2253
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32626
$L32627:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32626:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _nChannelCount$[ebp]
	jae	SHORT $L32628
; Line 2255
	push	32					; 00000020H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+108]
	mov	DWORD PTR [ecx], eax
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+108]
	add	eax, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+108], eax
; Line 2256
	push	16					; 00000010H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+112]
	mov	DWORD PTR [ecx], eax
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+112]
	add	eax, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+112], eax
; Line 2257
	jmp	SHORT $L32627
$L32628:
$L32625:
; Line 2260
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetABit@RLHDecodeContext@@QAEHXZ	; RLHDecodeContext::GetABit
	test	eax, eax
	je	SHORT $L32629
; Line 2262
	mov	eax, 1
	jmp	$L32579
$L32629:
; Line 2268
	mov	edx, DWORD PTR _nAllSampleCount$[ebp]
	shl	edx, 1
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	push	ecx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?DecodeERINACodesSBZL@RLHDecodeContext@@QAEKPACK@Z ; RLHDecodeContext::DecodeERINACodesSBZL
	mov	edx, DWORD PTR _nAllSampleCount$[ebp]
	shl	edx, 1
	cmp	eax, edx
	jae	SHORT $L32630
; Line 2270
	mov	eax, 1
	jmp	$L32579
$L32630:
; Line 2273
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	mov	DWORD PTR _ptrHBuf$[ebp], ecx
; Line 2274
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+56]
	add	eax, DWORD PTR _nAllSampleCount$[ebp]
	mov	DWORD PTR _ptrLBuf$[ebp], eax
; Line 2276
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32633
$L32634:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32633:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nDegreeWidth$[ebp]
	jae	SHORT $L32635
; Line 2278
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+52]
	mov	edx, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [ecx+edx*4]
	mov	DWORD PTR _ptrQuantumized$32636[ebp], eax
; Line 2280
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32638
$L32639:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L32638:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _nAllSubbandCount$[ebp]
	jae	SHORT $L32640
; Line 2282
	mov	eax, DWORD PTR _ptrLBuf$[ebp]
	movsx	ecx, BYTE PTR [eax]
	mov	DWORD PTR _nLow$32641[ebp], ecx
	mov	edx, DWORD PTR _ptrLBuf$[ebp]
	add	edx, 1
	mov	DWORD PTR _ptrLBuf$[ebp], edx
; Line 2283
	mov	eax, DWORD PTR _ptrHBuf$[ebp]
	movsx	ecx, BYTE PTR [eax]
	mov	edx, DWORD PTR _nLow$32641[ebp]
	sar	edx, 8
	xor	ecx, edx
	mov	DWORD PTR _nHigh$32642[ebp], ecx
	mov	eax, DWORD PTR _ptrHBuf$[ebp]
	add	eax, 1
	mov	DWORD PTR _ptrHBuf$[ebp], eax
; Line 2284
	mov	ecx, DWORD PTR _nLow$32641[ebp]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _nHigh$32642[ebp]
	shl	edx, 8
	or	ecx, edx
	mov	eax, DWORD PTR _ptrQuantumized$32636[ebp]
	mov	DWORD PTR [eax], ecx
; Line 2285
	mov	ecx, DWORD PTR _nDegreeWidth$[ebp]
	mov	edx, DWORD PTR _ptrQuantumized$32636[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _ptrQuantumized$32636[ebp], eax
; Line 2286
	jmp	SHORT $L32639
$L32640:
; Line 2287
	jmp	$L32634
$L32635:
; Line 2292
	mov	ecx, DWORD PTR _nChannelCount$[ebp]
	shl	ecx, 2
	push	ecx
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR _pRestSamples$[ebp], eax
; Line 2293
	mov	edx, DWORD PTR _nChannelCount$[ebp]
	shl	edx, 2
	push	edx
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR _ptrDstBuf$[ebp], eax
; Line 2295
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	mov	DWORD PTR [eax+100], edx
; Line 2296
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+68]
	mov	DWORD PTR [eax+108], edx
; Line 2297
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR [eax+112], edx
; Line 2298
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+52]
	mov	DWORD PTR [eax+116], edx
; Line 2300
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32649
$L32650:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32649:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _nChannelCount$[ebp]
	jae	SHORT $L32651
; Line 2302
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _pLastDivision$[ebp]
	mov	DWORD PTR [eax+edx*4], -1
; Line 2303
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _pRestSamples$[ebp]
	mov	eax, DWORD PTR _datahdr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2304
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _ptrWaveBuf$[ebp]
	lea	eax, DWORD PTR [edx+ecx*2]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _ptrDstBuf$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2305
	jmp	SHORT $L32650
$L32651:
; Line 2306
	mov	DWORD PTR _nCurrentDivision$[ebp], -1
; Line 2308
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32654
$L32655:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32654:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _nSubbandCount$[ebp]
	jae	$L32656
; Line 2310
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32657
$L32658:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L32657:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _nChannelCount$[ebp]
	jae	$L32659
; Line 2315
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	xor	eax, eax
	mov	al, BYTE PTR [edx]
	mov	DWORD PTR _nDivisionCode$32660[ebp], eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	add	edx, 1
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+100], edx
; Line 2316
	mov	edx, 1
	mov	ecx, DWORD PTR _nDivisionCode$32660[ebp]
	shl	edx, cl
	mov	DWORD PTR _nDivisionCount$32661[ebp], edx
; Line 2320
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nDegreeWidth$[ebp]
	imul	ecx, DWORD PTR [eax+36]
	imul	ecx, DWORD PTR _j$[ebp]
	mov	DWORD PTR _nChannelStep$32662[ebp], ecx
; Line 2321
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+96]
	mov	ecx, DWORD PTR _nChannelStep$32662[ebp]
	lea	edx, DWORD PTR [eax+ecx*4]
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+120], edx
; Line 2325
	mov	BYTE PTR _fLeadBlock$32663[ebp], 0
; Line 2327
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _pLastDivision$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
	cmp	eax, DWORD PTR _nDivisionCode$32660[ebp]
	je	$L32664
; Line 2332
	cmp	DWORD PTR _i$[ebp], 0
	je	$L32665
; Line 2334
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _pLastDivision$[ebp]
	mov	eax, DWORD PTR _nCurrentDivision$[ebp]
	cmp	eax, DWORD PTR [edx+ecx*4]
	je	SHORT $L32666
; Line 2337
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _pLastDivision$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	sub	ecx, DWORD PTR [eax+edx*4]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?InitializeWithDegree@MIODecoder@@IAEXI@Z ; MIODecoder::InitializeWithDegree
; Line 2338
	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _pLastDivision$[ebp]
	mov	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _nCurrentDivision$[ebp], ecx
$L32666:
; Line 2340
	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _pRestSamples$[ebp]
	mov	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _nSamples$[ebp], ecx
; Line 2341
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSamples$[ebp]
	cmp	eax, DWORD PTR [edx+128]
	jbe	SHORT $L32667
; Line 2343
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+128]
	mov	DWORD PTR _nSamples$[ebp], edx
$L32667:
; Line 2345
	mov	eax, DWORD PTR _nSamples$[ebp]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _ptrDstBuf$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DecodePostBlock@MIODecoder@@IAEHPAFI@Z	; MIODecoder::DecodePostBlock
	test	eax, eax
	je	SHORT $L32668
; Line 2347
	mov	eax, 1
	jmp	$L32579
$L32668:
; Line 2349
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _pRestSamples$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
	sub	eax, DWORD PTR _nSamples$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _pRestSamples$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2350
	mov	eax, DWORD PTR _nSamples$[ebp]
	imul	eax, DWORD PTR _nChannelCount$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _ptrDstBuf$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4]
	lea	edx, DWORD PTR [ecx+eax*2]
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _ptrDstBuf$[ebp]
	mov	DWORD PTR [ecx+eax*4], edx
$L32665:
; Line 2355
	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _pLastDivision$[ebp]
	mov	ecx, DWORD PTR _nDivisionCode$32660[ebp]
	mov	DWORD PTR [eax+edx*4], ecx
; Line 2356
	mov	BYTE PTR _fLeadBlock$32663[ebp], 1
$L32664:
; Line 2358
	mov	edx, DWORD PTR _nCurrentDivision$[ebp]
	cmp	edx, DWORD PTR _nDivisionCode$32660[ebp]
	je	SHORT $L32669
; Line 2361
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	sub	ecx, DWORD PTR _nDivisionCode$32660[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?InitializeWithDegree@MIODecoder@@IAEXI@Z ; MIODecoder::InitializeWithDegree
; Line 2362
	mov	edx, DWORD PTR _nDivisionCode$32660[ebp]
	mov	DWORD PTR _nCurrentDivision$[ebp], edx
$L32669:
; Line 2367
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L32670
$L32671:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L32670:
	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR _nDivisionCount$32661[ebp]
	jae	$L32672
; Line 2369
	mov	edx, DWORD PTR _fLeadBlock$32663[ebp]
	and	edx, 255				; 000000ffH
	test	edx, edx
	je	SHORT $L32673
; Line 2374
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DecodeLeadBlock@MIODecoder@@IAEHXZ	; MIODecoder::DecodeLeadBlock
	test	eax, eax
	je	SHORT $L32674
; Line 2376
	mov	eax, 1
	jmp	$L32579
$L32674:
; Line 2379
	mov	BYTE PTR _fLeadBlock$32663[ebp], 0
; Line 2381
	jmp	SHORT $L32675
$L32673:
; Line 2386
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _pRestSamples$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _nSamples$[ebp], edx
; Line 2387
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nSamples$[ebp]
	cmp	ecx, DWORD PTR [eax+128]
	jbe	SHORT $L32676
; Line 2389
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+128]
	mov	DWORD PTR _nSamples$[ebp], eax
$L32676:
; Line 2392
	mov	ecx, DWORD PTR _nSamples$[ebp]
	push	ecx
	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _ptrDstBuf$[ebp]
	mov	ecx, DWORD PTR [eax+edx*4]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DecodeInternalBlock@MIODecoder@@IAEHPAFI@Z ; MIODecoder::DecodeInternalBlock
	test	eax, eax
	je	SHORT $L32677
; Line 2394
	mov	eax, 1
	jmp	$L32579
$L32677:
; Line 2396
	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _pRestSamples$[ebp]
	mov	ecx, DWORD PTR [eax+edx*4]
	sub	ecx, DWORD PTR _nSamples$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _pRestSamples$[ebp]
	mov	DWORD PTR [eax+edx*4], ecx
; Line 2397
	mov	ecx, DWORD PTR _nSamples$[ebp]
	imul	ecx, DWORD PTR _nChannelCount$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _ptrDstBuf$[ebp]
	mov	edx, DWORD PTR [eax+edx*4]
	lea	eax, DWORD PTR [edx+ecx*2]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _ptrDstBuf$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
$L32675:
; Line 2399
	jmp	$L32671
$L32672:
; Line 2400
	jmp	$L32658
$L32659:
; Line 2401
	jmp	$L32655
$L32656:
; Line 2405
	cmp	DWORD PTR _nSubbandCount$[ebp], 0
	jbe	$L32678
; Line 2407
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32679
$L32680:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32679:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _nChannelCount$[ebp]
	jae	$L32681
; Line 2409
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nDegreeWidth$[ebp]
	imul	eax, DWORD PTR [edx+36]
	imul	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _nChannelStep$32682[ebp], eax
; Line 2410
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+96]
	mov	eax, DWORD PTR _nChannelStep$32682[ebp]
	lea	ecx, DWORD PTR [edx+eax*4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+120], ecx
; Line 2412
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pLastDivision$[ebp]
	mov	edx, DWORD PTR _nCurrentDivision$[ebp]
	cmp	edx, DWORD PTR [ecx+eax*4]
	je	SHORT $L32683
; Line 2415
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _pLastDivision$[ebp]
	mov	eax, DWORD PTR [eax+28]
	sub	eax, DWORD PTR [edx+ecx*4]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?InitializeWithDegree@MIODecoder@@IAEXI@Z ; MIODecoder::InitializeWithDegree
; Line 2416
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _pLastDivision$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _nCurrentDivision$[ebp], eax
$L32683:
; Line 2418
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _pRestSamples$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _nSamples$[ebp], eax
; Line 2419
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nSamples$[ebp]
	cmp	edx, DWORD PTR [ecx+128]
	jbe	SHORT $L32684
; Line 2421
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	mov	DWORD PTR _nSamples$[ebp], ecx
$L32684:
; Line 2423
	mov	edx, DWORD PTR _nSamples$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrDstBuf$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DecodePostBlock@MIODecoder@@IAEHPAFI@Z	; MIODecoder::DecodePostBlock
	test	eax, eax
	je	SHORT $L32685
; Line 2425
	mov	eax, 1
	jmp	SHORT $L32579
$L32685:
; Line 2427
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pRestSamples$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4]
	sub	edx, DWORD PTR _nSamples$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pRestSamples$[ebp]
	mov	DWORD PTR [ecx+eax*4], edx
; Line 2428
	mov	edx, DWORD PTR _nSamples$[ebp]
	imul	edx, DWORD PTR _nChannelCount$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrDstBuf$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	lea	ecx, DWORD PTR [eax+edx*2]
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrDstBuf$[ebp]
	mov	DWORD PTR [eax+edx*4], ecx
; Line 2429
	jmp	$L32680
$L32681:
$L32678:
; Line 2432
	mov	ecx, DWORD PTR _pLastDivision$[ebp]
	mov	DWORD PTR $T32987[ebp], ecx
	mov	edx, DWORD PTR $T32987[ebp]
	push	edx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
; Line 2433
	mov	eax, DWORD PTR _pRestSamples$[ebp]
	mov	DWORD PTR $T32988[ebp], eax
	mov	ecx, DWORD PTR $T32988[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
; Line 2434
	mov	edx, DWORD PTR _ptrDstBuf$[ebp]
	mov	DWORD PTR $T32989[ebp], edx
	mov	eax, DWORD PTR $T32989[ebp]
	push	eax
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
; Line 2436
	xor	eax, eax
$L32579:
; Line 2437
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?DecodeSoundDCT@MIODecoder@@IAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z ENDP ; MIODecoder::DecodeSoundDCT
_TEXT	ENDS
PUBLIC	?IQuantumize@MIODecoder@@IAEXPAMPBHHJH@Z	; MIODecoder::IQuantumize
EXTRN	_eriRoundR32ToWordArray:NEAR
EXTRN	_eriFastIDCT:NEAR
EXTRN	_eriOddGivensInverseMatrix:NEAR
EXTRN	_eriFastIPLOT:NEAR
EXTRN	_eriFastILOT:NEAR
_TEXT	SEGMENT
_ptrDst$ = 8
_nSamples$ = 12
_this$ = -16
_nWeightCode$ = -12
_nCoefficient$ = -8
_i$ = -4
?DecodeInternalBlock@MIODecoder@@IAEHPAFI@Z PROC NEAR	; MIODecoder::DecodeInternalBlock
; Line 2444
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2448
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _nWeightCode$[ebp], edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+108], ecx
; Line 2449
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _nCoefficient$[ebp], edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+112], ecx
; Line 2452
	mov	eax, DWORD PTR _nCoefficient$[ebp]
	push	eax
	mov	ecx, DWORD PTR _nWeightCode$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+128]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+116]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?IQuantumize@MIODecoder@@IAEXPAMPBHHJH@Z ; MIODecoder::IQuantumize
; Line 2453
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+128]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+116]
	lea	eax, DWORD PTR [edx+eax*4]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+116], eax
; Line 2458
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+132]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	push	ecx
	call	_eriOddGivensInverseMatrix
	add	esp, 12					; 0000000cH
; Line 2460
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	push	edx
	call	_eriFastIPLOT
	add	esp, 8
; Line 2463
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+120]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+84]
	push	ecx
	call	_eriFastILOT
	add	esp, 16					; 00000010H
; Line 2465
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32696
$L32697:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32696:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+128]
	jae	SHORT $L32698
; Line 2467
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+120]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+esi*4]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2468
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+84]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	mov	eax, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR [edx+esi*4]
	mov	DWORD PTR [ecx+eax*4], edx
; Line 2469
	jmp	SHORT $L32697
$L32698:
; Line 2475
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+84]
	push	eax
	push	1
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	push	ecx
	call	_eriFastIDCT
	add	esp, 20					; 00000014H
; Line 2479
	cmp	DWORD PTR _nSamples$[ebp], 0
	je	SHORT $L32699
; Line 2483
	mov	edx, DWORD PTR _nSamples$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	mov	ecx, DWORD PTR _ptrDst$[ebp]
	push	ecx
	call	_eriRoundR32ToWordArray
	add	esp, 16					; 00000010H
$L32699:
; Line 2486
	xor	eax, eax
; Line 2487
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
?DecodeInternalBlock@MIODecoder@@IAEHPAFI@Z ENDP	; MIODecoder::DecodeInternalBlock
_this$ = -24
_nWeightCode$ = -20
_nCoefficient$ = -12
_i$ = -8
_nHalfDegree$ = -16
_ptrSrcBuf$ = -4
?DecodeLeadBlock@MIODecoder@@IAEHXZ PROC NEAR		; MIODecoder::DecodeLeadBlock
; Line 2493
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2497
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _nWeightCode$[ebp], edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+108], ecx
; Line 2498
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _nCoefficient$[ebp], edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+112], ecx
; Line 2500
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	shr	ecx, 1
	mov	DWORD PTR _nHalfDegree$[ebp], ecx
; Line 2501
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+48]
	mov	DWORD PTR _ptrSrcBuf$[ebp], eax
; Line 2502
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32709
$L32710:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32709:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nHalfDegree$[ebp]
	jae	SHORT $L32711
; Line 2504
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 1
	mov	ecx, DWORD PTR _ptrSrcBuf$[ebp]
	mov	DWORD PTR [ecx+eax*4], 0
; Line 2505
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+116]
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 1
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR [edx+ecx*4+4], eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+116]
	add	edx, 4
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+116], edx
; Line 2506
	jmp	SHORT $L32710
$L32711:
; Line 2509
	mov	ecx, DWORD PTR _nCoefficient$[ebp]
	push	ecx
	mov	edx, DWORD PTR _nWeightCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	push	ecx
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+120]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?IQuantumize@MIODecoder@@IAEXPAMPBHHJH@Z ; MIODecoder::IQuantumize
; Line 2514
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+132]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+120]
	push	ecx
	call	_eriOddGivensInverseMatrix
	add	esp, 12					; 0000000cH
; Line 2516
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32712
$L32713:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 2
	mov	DWORD PTR _i$[ebp], edx
$L32712:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+128]
	jae	SHORT $L32714
; Line 2518
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+120]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+120]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+esi*4+4]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2519
	jmp	SHORT $L32713
$L32714:
; Line 2522
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+120]
	push	ecx
	call	_eriFastIPLOT
	add	esp, 8
; Line 2524
	xor	eax, eax
; Line 2525
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
?DecodeLeadBlock@MIODecoder@@IAEHXZ ENDP		; MIODecoder::DecodeLeadBlock
_ptrDst$ = 8
_nSamples$ = 12
_this$ = -24
_nWeightCode$ = -20
_nCoefficient$ = -12
_i$ = -8
_nHalfDegree$ = -16
_ptrSrcBuf$ = -4
?DecodePostBlock@MIODecoder@@IAEHPAFI@Z PROC NEAR	; MIODecoder::DecodePostBlock
; Line 2532
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2536
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _nWeightCode$[ebp], edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+108], ecx
; Line 2537
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _nCoefficient$[ebp], edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+112], ecx
; Line 2539
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	shr	ecx, 1
	mov	DWORD PTR _nHalfDegree$[ebp], ecx
; Line 2540
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+48]
	mov	DWORD PTR _ptrSrcBuf$[ebp], eax
; Line 2541
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32725
$L32726:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32725:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nHalfDegree$[ebp]
	jae	SHORT $L32727
; Line 2543
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 1
	mov	ecx, DWORD PTR _ptrSrcBuf$[ebp]
	mov	DWORD PTR [ecx+eax*4], 0
; Line 2544
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+116]
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 1
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR [edx+ecx*4+4], eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+116]
	add	edx, 4
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+116], edx
; Line 2545
	jmp	SHORT $L32726
$L32727:
; Line 2548
	mov	ecx, DWORD PTR _nCoefficient$[ebp]
	push	ecx
	mov	edx, DWORD PTR _nWeightCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	push	ecx
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?IQuantumize@MIODecoder@@IAEXPAMPBHHJH@Z ; MIODecoder::IQuantumize
; Line 2553
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+132]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	push	ecx
	call	_eriOddGivensInverseMatrix
	add	esp, 12					; 0000000cH
; Line 2555
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32728
$L32729:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 2
	mov	DWORD PTR _i$[ebp], edx
$L32728:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+128]
	jae	SHORT $L32730
; Line 2557
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	mov	ecx, DWORD PTR _i$[ebp]
	fld	DWORD PTR [eax+ecx*4+4]
	fchs
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	mov	ecx, DWORD PTR _i$[ebp]
	fstp	DWORD PTR [eax+ecx*4]
; Line 2558
	jmp	SHORT $L32729
$L32730:
; Line 2561
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	push	edx
	call	_eriFastIPLOT
	add	esp, 8
; Line 2564
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+120]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+84]
	push	ecx
	call	_eriFastILOT
	add	esp, 16					; 00000010H
; Line 2566
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32731
$L32732:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32731:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+128]
	jae	SHORT $L32733
; Line 2568
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+84]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+esi*4]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2569
	jmp	SHORT $L32732
$L32733:
; Line 2575
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+84]
	push	ecx
	push	1
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	push	edx
	call	_eriFastIDCT
	add	esp, 20					; 00000014H
; Line 2579
	cmp	DWORD PTR _nSamples$[ebp], 0
	je	SHORT $L32734
; Line 2583
	mov	eax, DWORD PTR _nSamples$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
	mov	edx, DWORD PTR _ptrDst$[ebp]
	push	edx
	call	_eriRoundR32ToWordArray
	add	esp, 16					; 00000010H
$L32734:
; Line 2586
	xor	eax, eax
; Line 2587
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
?DecodePostBlock@MIODecoder@@IAEHPAFI@Z ENDP		; MIODecoder::DecodePostBlock
_TEXT	ENDS
CONST	SEGMENT
$T32990	DD	03f800000r			; 1
CONST	ENDS
_TEXT	SEGMENT
_ptrDestination$ = 8
_ptrQuantumized$ = 12
_nDegreeNum$ = 16
_nWeightCode$ = 20
_nCoefficient$ = 24
_this$ = -104
_i$ = -16
_j$ = -20
_rMatrixScale$ = -8
_rCoefficient$ = -84
_rAvgRatio$ = -76
_a$32757 = -92
_k$32758 = -100
_rOddWeight$ = -12
?IQuantumize@MIODecoder@@IAEXPAMPBHHJH@Z PROC NEAR	; MIODecoder::IQuantumize
; Line 2596
	push	ebp
	mov	ebp, esp
	sub	esp, 188				; 000000bcH
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2604
	fild	DWORD PTR _nDegreeNum$[ebp]
	fstp	QWORD PTR -112+[ebp]
	fld	QWORD PTR $T32977
	fdiv	QWORD PTR -112+[ebp]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_sqrt
	add	esp, 8
	fstp	QWORD PTR _rMatrixScale$[ebp]
; Line 2605
	fild	DWORD PTR _nCoefficient$[ebp]
	fstp	QWORD PTR -120+[ebp]
	fld	QWORD PTR _rMatrixScale$[ebp]
	fmul	QWORD PTR -120+[ebp]
	fstp	QWORD PTR _rCoefficient$[ebp]
; Line 2610
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32747
$L32748:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32747:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L32749
; Line 2613
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 5
	mov	edx, DWORD PTR _nWeightCode$[ebp]
	sar	edx, cl
	and	edx, 31					; 0000001fH
	sub	edx, 15					; 0000000fH
	mov	DWORD PTR -124+[ebp], edx
	fild	DWORD PTR -124+[ebp]
	fstp	QWORD PTR -132+[ebp]
	fld	QWORD PTR -132+[ebp]
	fmul	QWORD PTR $T32981
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	1073741824				; 40000000H
	push	0
	call	_pow
	add	esp, 16					; 00000010H
	fdivr	QWORD PTR $T32979
	mov	eax, DWORD PTR _i$[ebp]
	fstp	QWORD PTR _rAvgRatio$[ebp+eax*8]
; Line 2614
	jmp	SHORT $L32748
$L32749:
; Line 2615
	mov	DWORD PTR _rAvgRatio$[ebp+48], 0
	mov	DWORD PTR _rAvgRatio$[ebp+52], 1072693248 ; 3ff00000H
; Line 2617
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32750
$L32751:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32750:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+136]
	jge	SHORT $L32752
; Line 2619
	fld	QWORD PTR _rAvgRatio$[ebp]
	fstp	DWORD PTR -136+[ebp]
	fld	DWORD PTR -136+[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+92]
	mov	eax, DWORD PTR _i$[ebp]
	fstp	DWORD PTR [edx+eax*4]
; Line 2620
	jmp	SHORT $L32751
$L32752:
; Line 2621
	mov	DWORD PTR _j$[ebp], 1
	jmp	SHORT $L32754
$L32755:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L32754:
	cmp	DWORD PTR _j$[ebp], 7
	jge	$L32756
; Line 2623
	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _rAvgRatio$[ebp+edx*8-8]
	mov	DWORD PTR _a$32757[ebp], eax
	mov	ecx, DWORD PTR _rAvgRatio$[ebp+edx*8-4]
	mov	DWORD PTR _a$32757[ebp+4], ecx
; Line 2625
	mov	edx, DWORD PTR _j$[ebp]
	fld	QWORD PTR _rAvgRatio$[ebp+edx*8]
	fsub	QWORD PTR _a$32757[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	mov	esi, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+136]
	sub	eax, DWORD PTR [esi+edx*4+132]
	mov	DWORD PTR -140+[ebp], eax
	fild	DWORD PTR -140+[ebp]
	fstp	QWORD PTR -148+[ebp]
	fdiv	QWORD PTR -148+[ebp]
	fstp	QWORD PTR _k$32758[ebp]
$L32760:
; Line 2626
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+ecx*4+136]
	jge	SHORT $L32761
; Line 2629
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, DWORD PTR [edx+ecx*4+132]
	mov	DWORD PTR -152+[ebp], eax
	fild	DWORD PTR -152+[ebp]
	fstp	QWORD PTR -160+[ebp]
	fld	QWORD PTR _k$32758[ebp]
	fmul	QWORD PTR -160+[ebp]
	fadd	QWORD PTR _a$32757[ebp]
	fstp	DWORD PTR -164+[ebp]
	fld	DWORD PTR -164+[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+92]
	mov	eax, DWORD PTR _i$[ebp]
	fstp	DWORD PTR [edx+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
; Line 2630
	jmp	SHORT $L32760
$L32761:
; Line 2631
	jmp	$L32755
$L32756:
$L32764:
; Line 2632
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nDegreeNum$[ebp]
	jge	SHORT $L32765
; Line 2634
	fld	QWORD PTR _rAvgRatio$[ebp+48]
	fstp	DWORD PTR -168+[ebp]
	fld	DWORD PTR -168+[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+92]
	mov	edx, DWORD PTR _i$[ebp]
	fstp	DWORD PTR [ecx+edx*4]
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
; Line 2635
	jmp	SHORT $L32764
$L32765:
; Line 2638
	mov	ecx, DWORD PTR _nWeightCode$[ebp]
	sar	ecx, 30					; 0000001eH
	and	ecx, 3
	add	ecx, 2
	mov	DWORD PTR -172+[ebp], ecx
	fild	DWORD PTR -172+[ebp]
	fstp	QWORD PTR -180+[ebp]
	fld	QWORD PTR -180+[ebp]
	fdiv	QWORD PTR $T32977
	fstp	DWORD PTR _rOddWeight$[ebp]
; Line 2639
	mov	DWORD PTR _i$[ebp], 15			; 0000000fH
	jmp	SHORT $L32769
$L32770:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 16					; 00000010H
	mov	DWORD PTR _i$[ebp], edx
$L32769:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nDegreeNum$[ebp]
	jge	SHORT $L32771
; Line 2641
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+92]
	mov	eax, DWORD PTR _i$[ebp]
	fld	DWORD PTR [edx+eax*4]
	fmul	DWORD PTR _rOddWeight$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+92]
	mov	eax, DWORD PTR _i$[ebp]
	fstp	DWORD PTR [edx+eax*4]
; Line 2642
	jmp	SHORT $L32770
$L32771:
; Line 2643
	fild	DWORD PTR _nCoefficient$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+92]
	mov	eax, DWORD PTR _nDegreeNum$[ebp]
	fstp	DWORD PTR [edx+eax*4-4]
; Line 2645
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32773
$L32774:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32773:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nDegreeNum$[ebp]
	jge	SHORT $L32775
; Line 2647
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+92]
	mov	edx, DWORD PTR _i$[ebp]
	fld	DWORD PTR $T32990
	fdiv	DWORD PTR [ecx+edx*4]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+92]
	mov	edx, DWORD PTR _i$[ebp]
	fstp	DWORD PTR [ecx+edx*4]
; Line 2648
	jmp	SHORT $L32774
$L32775:
; Line 2652
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32776
$L32777:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32776:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _nDegreeNum$[ebp]
	jge	SHORT $L32778
; Line 2655
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+92]
	mov	ecx, DWORD PTR _i$[ebp]
	fld	DWORD PTR [eax+ecx*4]
	fmul	QWORD PTR _rCoefficient$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrQuantumized$[ebp]
	fild	DWORD PTR [eax+edx*4]
	fstp	QWORD PTR -188+[ebp]
	fmul	QWORD PTR -188+[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _ptrDestination$[ebp]
	fstp	DWORD PTR [edx+ecx*4]
; Line 2656
	jmp	SHORT $L32777
$L32778:
; Line 2657
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	20					; 00000014H
?IQuantumize@MIODecoder@@IAEXPAMPBHHJH@Z ENDP		; MIODecoder::IQuantumize
_TEXT	ENDS
PUBLIC	?DecodeInternalBlock_MSS@MIODecoder@@IAEHPAFI@Z	; MIODecoder::DecodeInternalBlock_MSS
PUBLIC	?DecodeLeadBlock_MSS@MIODecoder@@IAEHXZ		; MIODecoder::DecodeLeadBlock_MSS
PUBLIC	?DecodePostBlock_MSS@MIODecoder@@IAEHPAFI@Z	; MIODecoder::DecodePostBlock_MSS
_TEXT	SEGMENT
_context$ = 8
_datahdr$ = 12
_ptrWaveBuf$ = 16
_this$ = -100
_i$ = -32
_j$ = -36
_k$ = -48
_nDegreeWidth$ = -28
_nSampleCount$ = -12
_nSubbandCount$ = -8
_nChannelCount$ = -56
_nAllSampleCount$ = -16
_nAllSubbandCount$ = -24
_nLastDivision$ = -44
_nDivisionCode$32818 = -72
_fLeadBlock$32820 = -64
_nDivisionCount$32823 = -68
_ptrHBuf$ = -20
_ptrLBuf$ = -60
_ptrQuantumized$32837 = -76
_nLow$32842 = -84
_nHigh$32843 = -80
_nSamples$ = -4
_nRestSamples$ = -52
_ptrDstBuf$ = -40
_nDivisionCode$32852 = -96
_nDivisionCount$32853 = -92
_fLeadBlock$32854 = -88
?DecodeSoundDCT_MSS@MIODecoder@@IAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z PROC NEAR ; MIODecoder::DecodeSoundDCT_MSS
; Line 2665
	push	ebp
	mov	ebp, esp
	sub	esp, 100				; 00000064H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2670
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, 1
	mov	ecx, DWORD PTR [eax+28]
	shl	edx, cl
	mov	DWORD PTR _nDegreeWidth$[ebp], edx
; Line 2672
	mov	eax, DWORD PTR _datahdr$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	edx, DWORD PTR _nDegreeWidth$[ebp]
	lea	eax, DWORD PTR [ecx+edx-1]
	mov	ecx, DWORD PTR _nDegreeWidth$[ebp]
	sub	ecx, 1
	not	ecx
	and	eax, ecx
	mov	DWORD PTR _nSampleCount$[ebp], eax
; Line 2674
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	mov	ecx, DWORD PTR [edx+28]
	shr	eax, cl
	mov	DWORD PTR _nSubbandCount$[ebp], eax
; Line 2675
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	DWORD PTR _nChannelCount$[ebp], edx
; Line 2676
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	imul	eax, DWORD PTR _nChannelCount$[ebp]
	mov	DWORD PTR _nAllSampleCount$[ebp], eax
; Line 2677
	mov	ecx, DWORD PTR _nSubbandCount$[ebp]
	mov	DWORD PTR _nAllSubbandCount$[ebp], ecx
; Line 2679
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	cmp	eax, DWORD PTR [edx+44]
	jbe	$L32794
; Line 2681
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+52], 0
	je	SHORT $L32795
; Line 2683
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+52]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L32795:
; Line 2685
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+56], 0
	je	SHORT $L32796
; Line 2687
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+56]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L32796:
; Line 2689
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+60], 0
	je	SHORT $L32797
; Line 2691
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+60]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L32797:
; Line 2693
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	je	SHORT $L32798
; Line 2695
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+64]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L32798:
; Line 2697
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+68], 0
	je	SHORT $L32799
; Line 2699
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+68]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L32799:
; Line 2701
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+72], 0
	je	SHORT $L32800
; Line 2703
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L32800:
; Line 2706
	mov	ecx, DWORD PTR _nAllSampleCount$[ebp]
	shl	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+52], eax
; Line 2708
	mov	eax, DWORD PTR _nAllSampleCount$[ebp]
	shl	eax, 1
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+56], eax
; Line 2710
	mov	edx, DWORD PTR _nAllSubbandCount$[ebp]
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+60], eax
; Line 2712
	mov	edx, DWORD PTR _nAllSubbandCount$[ebp]
	imul	edx, 10					; 0000000aH
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+64], eax
; Line 2714
	mov	edx, DWORD PTR _nAllSubbandCount$[ebp]
	imul	edx, 10					; 0000000aH
	shl	edx, 2
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+68], eax
; Line 2716
	mov	edx, DWORD PTR _nAllSubbandCount$[ebp]
	imul	edx, 10					; 0000000aH
	shl	edx, 2
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+72], eax
; Line 2718
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSampleCount$[ebp]
	mov	DWORD PTR [edx+44], eax
$L32794:
; Line 2723
	mov	ecx, DWORD PTR _datahdr$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx+1]
	and	edx, 1
	test	edx, edx
	je	SHORT $L32812
; Line 2725
	mov	ecx, DWORD PTR _context$[ebp]
	call	?PrepareToDecodeERINACode@RLHDecodeContext@@QAEXXZ ; RLHDecodeContext::PrepareToDecodeERINACode
$L32812:
; Line 2727
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetABit@RLHDecodeContext@@QAEHXZ	; RLHDecodeContext::GetABit
	test	eax, eax
	je	SHORT $L32813
; Line 2729
	mov	eax, 1
	jmp	$L32784
$L32813:
; Line 2732
	mov	DWORD PTR _nLastDivision$[ebp], -1
; Line 2733
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	mov	DWORD PTR [eax+100], edx
; Line 2734
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	mov	DWORD PTR [eax+104], edx
; Line 2735
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+68]
	mov	DWORD PTR [eax+108], edx
; Line 2736
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR [eax+112], edx
; Line 2738
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32815
$L32816:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32815:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _nSubbandCount$[ebp]
	jae	$L32817
; Line 2740
	push	2
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	DWORD PTR _nDivisionCode$32818[ebp], eax
; Line 2741
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+100]
	mov	cl, BYTE PTR _nDivisionCode$32818[ebp]
	mov	BYTE PTR [eax], cl
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+100]
	add	eax, 1
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+100], eax
; Line 2743
	mov	BYTE PTR _fLeadBlock$32820[ebp], 0
; Line 2744
	mov	edx, DWORD PTR _nDivisionCode$32818[ebp]
	cmp	edx, DWORD PTR _nLastDivision$[ebp]
	je	SHORT $L32821
; Line 2746
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L32822
; Line 2748
	push	2
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+104]
	mov	BYTE PTR [edx], al
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+104]
	add	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+104], ecx
; Line 2749
	push	32					; 00000020H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+108], ecx
; Line 2750
	push	16					; 00000010H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+112], ecx
$L32822:
; Line 2752
	mov	BYTE PTR _fLeadBlock$32820[ebp], 1
; Line 2753
	mov	eax, DWORD PTR _nDivisionCode$32818[ebp]
	mov	DWORD PTR _nLastDivision$[ebp], eax
$L32821:
; Line 2756
	mov	edx, 1
	mov	ecx, DWORD PTR _nDivisionCode$32818[ebp]
	shl	edx, cl
	mov	DWORD PTR _nDivisionCount$32823[ebp], edx
; Line 2757
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L32824
$L32825:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L32824:
	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR _nDivisionCount$32823[ebp]
	jae	$L32826
; Line 2759
	mov	edx, DWORD PTR _fLeadBlock$32820[ebp]
	and	edx, 255				; 000000ffH
	test	edx, edx
	je	SHORT $L32827
; Line 2761
	push	2
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+104]
	mov	BYTE PTR [edx], al
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+104]
	add	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+104], ecx
; Line 2762
	mov	BYTE PTR _fLeadBlock$32820[ebp], 0
; Line 2764
	jmp	SHORT $L32828
$L32827:
; Line 2766
	push	4
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+104]
	mov	BYTE PTR [edx], al
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+104]
	add	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+104], ecx
$L32828:
; Line 2768
	push	32					; 00000020H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+108], ecx
; Line 2769
	push	16					; 00000010H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+112], ecx
; Line 2770
	jmp	$L32825
$L32826:
; Line 2771
	jmp	$L32816
$L32817:
; Line 2772
	cmp	DWORD PTR _nSubbandCount$[ebp], 0
	jbe	SHORT $L32829
; Line 2774
	push	2
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+104]
	mov	BYTE PTR [edx], al
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+104]
	add	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+104], ecx
; Line 2775
	push	32					; 00000020H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+108], ecx
; Line 2776
	push	16					; 00000010H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+112], ecx
$L32829:
; Line 2779
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetABit@RLHDecodeContext@@QAEHXZ	; RLHDecodeContext::GetABit
	test	eax, eax
	je	SHORT $L32830
; Line 2781
	mov	eax, 1
	jmp	$L32784
$L32830:
; Line 2787
	mov	eax, DWORD PTR _nAllSampleCount$[ebp]
	shl	eax, 1
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+56]
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?DecodeERINACodesSBZL@RLHDecodeContext@@QAEKPACK@Z ; RLHDecodeContext::DecodeERINACodesSBZL
	mov	ecx, DWORD PTR _nAllSampleCount$[ebp]
	shl	ecx, 1
	cmp	eax, ecx
	jae	SHORT $L32831
; Line 2789
	mov	eax, 1
	jmp	$L32784
$L32831:
; Line 2792
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+56]
	mov	DWORD PTR _ptrHBuf$[ebp], eax
; Line 2793
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+56]
	add	edx, DWORD PTR _nAllSampleCount$[ebp]
	mov	DWORD PTR _ptrLBuf$[ebp], edx
; Line 2795
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32834
$L32835:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32834:
	mov	ecx, DWORD PTR _nDegreeWidth$[ebp]
	shl	ecx, 1
	cmp	DWORD PTR _i$[ebp], ecx
	jae	SHORT $L32836
; Line 2797
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+52]
	mov	ecx, DWORD PTR _i$[ebp]
	lea	edx, DWORD PTR [eax+ecx*4]
	mov	DWORD PTR _ptrQuantumized$32837[ebp], edx
; Line 2799
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32839
$L32840:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L32839:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _nAllSubbandCount$[ebp]
	jae	SHORT $L32841
; Line 2801
	mov	edx, DWORD PTR _ptrLBuf$[ebp]
	movsx	eax, BYTE PTR [edx]
	mov	DWORD PTR _nLow$32842[ebp], eax
	mov	ecx, DWORD PTR _ptrLBuf$[ebp]
	add	ecx, 1
	mov	DWORD PTR _ptrLBuf$[ebp], ecx
; Line 2802
	mov	edx, DWORD PTR _ptrHBuf$[ebp]
	movsx	eax, BYTE PTR [edx]
	mov	ecx, DWORD PTR _nLow$32842[ebp]
	sar	ecx, 8
	xor	eax, ecx
	mov	DWORD PTR _nHigh$32843[ebp], eax
	mov	edx, DWORD PTR _ptrHBuf$[ebp]
	add	edx, 1
	mov	DWORD PTR _ptrHBuf$[ebp], edx
; Line 2803
	mov	eax, DWORD PTR _nLow$32842[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _nHigh$32843[ebp]
	shl	ecx, 8
	or	eax, ecx
	mov	edx, DWORD PTR _ptrQuantumized$32837[ebp]
	mov	DWORD PTR [edx], eax
; Line 2804
	mov	eax, DWORD PTR _nDegreeWidth$[ebp]
	shl	eax, 1
	mov	ecx, DWORD PTR _ptrQuantumized$32837[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _ptrQuantumized$32837[ebp], edx
; Line 2805
	jmp	SHORT $L32840
$L32841:
; Line 2806
	jmp	$L32835
$L32836:
; Line 2811
	mov	eax, DWORD PTR _datahdr$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _nRestSamples$[ebp], ecx
; Line 2812
	mov	edx, DWORD PTR _ptrWaveBuf$[ebp]
	mov	DWORD PTR _ptrDstBuf$[ebp], edx
; Line 2814
	mov	DWORD PTR _nLastDivision$[ebp], -1
; Line 2815
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	mov	DWORD PTR [eax+100], edx
; Line 2816
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	mov	DWORD PTR [eax+104], edx
; Line 2817
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+68]
	mov	DWORD PTR [eax+108], edx
; Line 2818
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR [eax+112], edx
; Line 2819
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+52]
	mov	DWORD PTR [eax+116], edx
; Line 2821
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32849
$L32850:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32849:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _nSubbandCount$[ebp]
	jae	$L32851
; Line 2826
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+100]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	mov	DWORD PTR _nDivisionCode$32852[ebp], ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+100]
	add	eax, 1
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+100], eax
; Line 2827
	mov	edx, 1
	mov	ecx, DWORD PTR _nDivisionCode$32852[ebp]
	shl	edx, cl
	mov	DWORD PTR _nDivisionCount$32853[ebp], edx
; Line 2831
	mov	BYTE PTR _fLeadBlock$32854[ebp], 0
; Line 2833
	mov	eax, DWORD PTR _nLastDivision$[ebp]
	cmp	eax, DWORD PTR _nDivisionCode$32852[ebp]
	je	SHORT $L32855
; Line 2838
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L32856
; Line 2840
	mov	ecx, DWORD PTR _nRestSamples$[ebp]
	mov	DWORD PTR _nSamples$[ebp], ecx
; Line 2841
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nSamples$[ebp]
	cmp	eax, DWORD PTR [edx+128]
	jbe	SHORT $L32857
; Line 2843
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+128]
	mov	DWORD PTR _nSamples$[ebp], edx
$L32857:
; Line 2845
	mov	eax, DWORD PTR _nSamples$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrDstBuf$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DecodePostBlock_MSS@MIODecoder@@IAEHPAFI@Z ; MIODecoder::DecodePostBlock_MSS
	test	eax, eax
	je	SHORT $L32858
; Line 2847
	mov	eax, 1
	jmp	$L32784
$L32858:
; Line 2849
	mov	edx, DWORD PTR _nRestSamples$[ebp]
	sub	edx, DWORD PTR _nSamples$[ebp]
	mov	DWORD PTR _nRestSamples$[ebp], edx
; Line 2850
	mov	eax, DWORD PTR _nSamples$[ebp]
	imul	eax, DWORD PTR _nChannelCount$[ebp]
	mov	ecx, DWORD PTR _ptrDstBuf$[ebp]
	lea	edx, DWORD PTR [ecx+eax*2]
	mov	DWORD PTR _ptrDstBuf$[ebp], edx
$L32856:
; Line 2856
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	sub	ecx, DWORD PTR _nDivisionCode$32852[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?InitializeWithDegree@MIODecoder@@IAEXI@Z ; MIODecoder::InitializeWithDegree
; Line 2857
	mov	edx, DWORD PTR _nDivisionCode$32852[ebp]
	mov	DWORD PTR _nLastDivision$[ebp], edx
; Line 2858
	mov	BYTE PTR _fLeadBlock$32854[ebp], 1
$L32855:
; Line 2863
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L32859
$L32860:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L32859:
	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR _nDivisionCount$32853[ebp]
	jae	$L32861
; Line 2865
	mov	edx, DWORD PTR _fLeadBlock$32854[ebp]
	and	edx, 255				; 000000ffH
	test	edx, edx
	je	SHORT $L32862
; Line 2870
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DecodeLeadBlock_MSS@MIODecoder@@IAEHXZ	; MIODecoder::DecodeLeadBlock_MSS
	test	eax, eax
	je	SHORT $L32863
; Line 2872
	mov	eax, 1
	jmp	$L32784
$L32863:
; Line 2875
	mov	BYTE PTR _fLeadBlock$32854[ebp], 0
; Line 2877
	jmp	SHORT $L32864
$L32862:
; Line 2882
	mov	eax, DWORD PTR _nRestSamples$[ebp]
	mov	DWORD PTR _nSamples$[ebp], eax
; Line 2883
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nSamples$[ebp]
	cmp	edx, DWORD PTR [ecx+128]
	jbe	SHORT $L32865
; Line 2885
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	mov	DWORD PTR _nSamples$[ebp], ecx
$L32865:
; Line 2887
	mov	edx, DWORD PTR _nSamples$[ebp]
	push	edx
	mov	eax, DWORD PTR _ptrDstBuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DecodeInternalBlock_MSS@MIODecoder@@IAEHPAFI@Z ; MIODecoder::DecodeInternalBlock_MSS
	test	eax, eax
	je	SHORT $L32866
; Line 2889
	mov	eax, 1
	jmp	SHORT $L32784
$L32866:
; Line 2891
	mov	ecx, DWORD PTR _nRestSamples$[ebp]
	sub	ecx, DWORD PTR _nSamples$[ebp]
	mov	DWORD PTR _nRestSamples$[ebp], ecx
; Line 2892
	mov	edx, DWORD PTR _nSamples$[ebp]
	imul	edx, DWORD PTR _nChannelCount$[ebp]
	mov	eax, DWORD PTR _ptrDstBuf$[ebp]
	lea	ecx, DWORD PTR [eax+edx*2]
	mov	DWORD PTR _ptrDstBuf$[ebp], ecx
$L32864:
; Line 2894
	jmp	$L32860
$L32861:
; Line 2895
	jmp	$L32850
$L32851:
; Line 2899
	cmp	DWORD PTR _nSubbandCount$[ebp], 0
	jbe	SHORT $L32867
; Line 2901
	mov	edx, DWORD PTR _nRestSamples$[ebp]
	mov	DWORD PTR _nSamples$[ebp], edx
; Line 2902
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nSamples$[ebp]
	cmp	ecx, DWORD PTR [eax+128]
	jbe	SHORT $L32868
; Line 2904
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+128]
	mov	DWORD PTR _nSamples$[ebp], eax
$L32868:
; Line 2906
	mov	ecx, DWORD PTR _nSamples$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrDstBuf$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DecodePostBlock_MSS@MIODecoder@@IAEHPAFI@Z ; MIODecoder::DecodePostBlock_MSS
	test	eax, eax
	je	SHORT $L32869
; Line 2908
	mov	eax, 1
	jmp	SHORT $L32784
$L32869:
; Line 2910
	mov	eax, DWORD PTR _nRestSamples$[ebp]
	sub	eax, DWORD PTR _nSamples$[ebp]
	mov	DWORD PTR _nRestSamples$[ebp], eax
; Line 2911
	mov	ecx, DWORD PTR _nSamples$[ebp]
	imul	ecx, DWORD PTR _nChannelCount$[ebp]
	mov	edx, DWORD PTR _ptrDstBuf$[ebp]
	lea	eax, DWORD PTR [edx+ecx*2]
	mov	DWORD PTR _ptrDstBuf$[ebp], eax
$L32867:
; Line 2914
	xor	eax, eax
$L32784:
; Line 2915
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?DecodeSoundDCT_MSS@MIODecoder@@IAEHAAVRLHDecodeContext@@ABUMIO_DATA_HEADER@@PAX@Z ENDP ; MIODecoder::DecodeSoundDCT_MSS
_ptrDst$ = 8
_nSamples$ = 12
_this$ = -56
_i$ = -32
_j$ = -36
_ptrSrcBuf$ = -8
_ptrLapBuf$ = -12
_nWeightCode$ = -48
_nCoefficient$ = -28
_rSin$ = -40
_rCos$ = -4
_nRevCode$ = -20
_nRevCode1$ = -16
_nRevCode2$ = -24
_ptrSrcBuf1$ = -52
_ptrSrcBuf2$ = -44
?DecodeInternalBlock_MSS@MIODecoder@@IAEHPAFI@Z PROC NEAR ; MIODecoder::DecodeInternalBlock_MSS
; Line 2922
	push	ebp
	mov	ebp, esp
	sub	esp, 88					; 00000058H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2924
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	mov	DWORD PTR _ptrSrcBuf$[ebp], ecx
; Line 2925
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+96]
	mov	DWORD PTR _ptrLapBuf$[ebp], eax
; Line 2927
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _nWeightCode$[ebp], eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	add	edx, 4
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+108], edx
; Line 2928
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _nCoefficient$[ebp], eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	add	edx, 4
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+112], edx
; Line 2930
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32880
$L32881:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32880:
	cmp	DWORD PTR _i$[ebp], 2
	jae	SHORT $L32882
; Line 2937
	mov	edx, DWORD PTR _nCoefficient$[ebp]
	push	edx
	mov	eax, DWORD PTR _nWeightCode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+128]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+116]
	push	ecx
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?IQuantumize@MIODecoder@@IAEXPAMPBHHJH@Z ; MIODecoder::IQuantumize
; Line 2938
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+116]
	lea	ecx, DWORD PTR [eax+ecx*4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+116], ecx
; Line 2939
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _ptrSrcBuf$[ebp], eax
; Line 2940
	jmp	SHORT $L32881
$L32882:
; Line 2945
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+104]
	xor	eax, eax
	mov	al, BYTE PTR [edx]
	mov	DWORD PTR _nRevCode$[ebp], eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+104]
	add	edx, 1
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+104], edx
; Line 2946
	mov	ecx, DWORD PTR _nRevCode$[ebp]
	sar	ecx, 2
	and	ecx, 3
	mov	DWORD PTR _nRevCode1$[ebp], ecx
; Line 2947
	mov	edx, DWORD PTR _nRevCode$[ebp]
	and	edx, 3
	mov	DWORD PTR _nRevCode2$[ebp], edx
; Line 2949
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	mov	DWORD PTR _ptrSrcBuf1$[ebp], ecx
; Line 2950
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+128]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	lea	eax, DWORD PTR [edx+eax*4]
	mov	DWORD PTR _ptrSrcBuf2$[ebp], eax
; Line 2952
	fild	DWORD PTR _nRevCode1$[ebp]
	fstp	QWORD PTR -64+[ebp]
	fld	QWORD PTR -64+[ebp]
	fmul	QWORD PTR _ERI_PI$S31670
	fdiv	QWORD PTR $T32986
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_sin
	add	esp, 8
	fstp	DWORD PTR _rSin$[ebp]
; Line 2953
	fild	DWORD PTR _nRevCode1$[ebp]
	fstp	QWORD PTR -72+[ebp]
	fld	QWORD PTR -72+[ebp]
	fmul	QWORD PTR _ERI_PI$S31670
	fdiv	QWORD PTR $T32986
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_cos
	add	esp, 8
	fstp	DWORD PTR _rCos$[ebp]
; Line 2955
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+128]
	shr	edx, 1
	push	edx
	push	2
	mov	eax, DWORD PTR _rCos$[ebp]
	push	eax
	mov	ecx, DWORD PTR _rSin$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrSrcBuf2$[ebp]
	push	edx
	mov	eax, DWORD PTR _ptrSrcBuf1$[ebp]
	push	eax
	call	_eriRevolve2x2
	add	esp, 24					; 00000018H
; Line 2957
	fild	DWORD PTR _nRevCode2$[ebp]
	fstp	QWORD PTR -80+[ebp]
	fld	QWORD PTR -80+[ebp]
	fmul	QWORD PTR _ERI_PI$S31670
	fdiv	QWORD PTR $T32986
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_sin
	add	esp, 8
	fstp	DWORD PTR _rSin$[ebp]
; Line 2958
	fild	DWORD PTR _nRevCode2$[ebp]
	fstp	QWORD PTR -88+[ebp]
	fld	QWORD PTR -88+[ebp]
	fmul	QWORD PTR _ERI_PI$S31670
	fdiv	QWORD PTR $T32986
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_cos
	add	esp, 8
	fstp	DWORD PTR _rCos$[ebp]
; Line 2960
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+128]
	shr	edx, 1
	push	edx
	push	2
	mov	eax, DWORD PTR _rCos$[ebp]
	push	eax
	mov	ecx, DWORD PTR _rSin$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrSrcBuf2$[ebp]
	add	edx, 4
	push	edx
	mov	eax, DWORD PTR _ptrSrcBuf1$[ebp]
	add	eax, 4
	push	eax
	call	_eriRevolve2x2
	add	esp, 24					; 00000018H
; Line 2962
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	mov	DWORD PTR _ptrSrcBuf$[ebp], edx
; Line 2964
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32894
$L32895:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32894:
	cmp	DWORD PTR _i$[ebp], 2
	jae	$L32896
; Line 2970
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	push	ecx
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	push	edx
	call	_eriOddGivensInverseMatrix
	add	esp, 12					; 0000000cH
; Line 2972
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	push	edx
	call	_eriFastIPLOT
	add	esp, 8
; Line 2974
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _ptrLapBuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+84]
	push	edx
	call	_eriFastILOT
	add	esp, 16					; 00000010H
; Line 2976
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32897
$L32898:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L32897:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+128]
	jae	SHORT $L32899
; Line 2978
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _ptrLapBuf$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	mov	esi, DWORD PTR _ptrSrcBuf$[ebp]
	mov	edx, DWORD PTR [esi+edx*4]
	mov	DWORD PTR [ecx+eax*4], edx
; Line 2979
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+84]
	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _ptrSrcBuf$[ebp]
	mov	esi, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR [ecx+esi*4]
	mov	DWORD PTR [eax+edx*4], ecx
; Line 2980
	jmp	SHORT $L32898
$L32899:
; Line 2986
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+84]
	push	edx
	push	1
	mov	eax, DWORD PTR _ptrSrcBuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	push	edx
	call	_eriFastIDCT
	add	esp, 20					; 00000014H
; Line 2990
	cmp	DWORD PTR _nSamples$[ebp], 0
	je	SHORT $L32900
; Line 2993
	mov	eax, DWORD PTR _nSamples$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	push	edx
	push	2
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrDst$[ebp]
	lea	edx, DWORD PTR [ecx+eax*2]
	push	edx
	call	_eriRoundR32ToWordArray
	add	esp, 16					; 00000010H
$L32900:
; Line 2996
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _ptrSrcBuf$[ebp], eax
; Line 2997
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+128]
	mov	eax, DWORD PTR _ptrLapBuf$[ebp]
	lea	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _ptrLapBuf$[ebp], ecx
; Line 2998
	jmp	$L32895
$L32896:
; Line 3000
	xor	eax, eax
; Line 3001
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
?DecodeInternalBlock_MSS@MIODecoder@@IAEHPAFI@Z ENDP	; MIODecoder::DecodeInternalBlock_MSS
_this$ = -52
_i$ = -28
_j$ = -36
_nHalfDegree$ = -32
_nWeightCode$ = -44
_nCoefficient$ = -24
_ptrLapBuf$ = -12
_ptrSrcBuf$32913 = -48
_rSin$ = -40
_rCos$ = -4
_nRevCode$ = -16
_ptrLapBuf1$ = -8
_ptrLapBuf2$ = -20
?DecodeLeadBlock_MSS@MIODecoder@@IAEHXZ PROC NEAR	; MIODecoder::DecodeLeadBlock_MSS
; Line 3007
	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 3009
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	shr	ecx, 1
	mov	DWORD PTR _nHalfDegree$[ebp], ecx
; Line 3010
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+108]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _nWeightCode$[ebp], ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+108]
	add	eax, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+108], eax
; Line 3011
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+112]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _nCoefficient$[ebp], ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+112]
	add	eax, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+112], eax
; Line 3012
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+96]
	mov	DWORD PTR _ptrLapBuf$[ebp], eax
; Line 3014
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32910
$L32911:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32910:
	cmp	DWORD PTR _i$[ebp], 2
	jae	$L32912
; Line 3019
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+48]
	mov	DWORD PTR _ptrSrcBuf$32913[ebp], eax
; Line 3020
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32915
$L32916:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L32915:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _nHalfDegree$[ebp]
	jae	SHORT $L32917
; Line 3022
	mov	eax, DWORD PTR _j$[ebp]
	shl	eax, 1
	mov	ecx, DWORD PTR _ptrSrcBuf$32913[ebp]
	mov	DWORD PTR [ecx+eax*4], 0
; Line 3023
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+116]
	mov	ecx, DWORD PTR _j$[ebp]
	shl	ecx, 1
	mov	edx, DWORD PTR _ptrSrcBuf$32913[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR [edx+ecx*4+4], eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+116]
	add	edx, 4
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+116], edx
; Line 3024
	jmp	SHORT $L32916
$L32917:
; Line 3027
	mov	ecx, DWORD PTR _nCoefficient$[ebp]
	push	ecx
	mov	edx, DWORD PTR _nWeightCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	push	ecx
	mov	edx, DWORD PTR _ptrSrcBuf$32913[ebp]
	push	edx
	mov	eax, DWORD PTR _ptrLapBuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?IQuantumize@MIODecoder@@IAEXPAMPBHHJH@Z ; MIODecoder::IQuantumize
; Line 3029
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+128]
	mov	eax, DWORD PTR _ptrLapBuf$[ebp]
	lea	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _ptrLapBuf$[ebp], ecx
; Line 3030
	jmp	$L32911
$L32912:
; Line 3035
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+104]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	mov	DWORD PTR _nRevCode$[ebp], ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+104]
	add	eax, 1
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+104], eax
; Line 3037
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+96]
	mov	DWORD PTR _ptrLapBuf1$[ebp], eax
; Line 3038
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+128]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+96]
	lea	edx, DWORD PTR [ecx+edx*4]
	mov	DWORD PTR _ptrLapBuf2$[ebp], edx
; Line 3040
	fild	DWORD PTR _nRevCode$[ebp]
	fstp	QWORD PTR -60+[ebp]
	fld	QWORD PTR -60+[ebp]
	fmul	QWORD PTR _ERI_PI$S31670
	fdiv	QWORD PTR $T32986
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_sin
	add	esp, 8
	fstp	DWORD PTR _rSin$[ebp]
; Line 3041
	fild	DWORD PTR _nRevCode$[ebp]
	fstp	QWORD PTR -68+[ebp]
	fld	QWORD PTR -68+[ebp]
	fmul	QWORD PTR _ERI_PI$S31670
	fdiv	QWORD PTR $T32986
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_cos
	add	esp, 8
	fstp	DWORD PTR _rCos$[ebp]
; Line 3043
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	push	ecx
	push	1
	mov	edx, DWORD PTR _rCos$[ebp]
	push	edx
	mov	eax, DWORD PTR _rSin$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrLapBuf2$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrLapBuf1$[ebp]
	push	edx
	call	_eriRevolve2x2
	add	esp, 24					; 00000018H
; Line 3045
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+96]
	mov	DWORD PTR _ptrLapBuf$[ebp], ecx
; Line 3047
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32925
$L32926:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32925:
	cmp	DWORD PTR _i$[ebp], 2
	jae	SHORT $L32927
; Line 3053
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+132]
	push	eax
	mov	ecx, DWORD PTR _ptrLapBuf$[ebp]
	push	ecx
	call	_eriOddGivensInverseMatrix
	add	esp, 12					; 0000000cH
; Line 3055
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32928
$L32929:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 2
	mov	DWORD PTR _j$[ebp], edx
$L32928:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+128]
	jae	SHORT $L32930
; Line 3057
	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _ptrLapBuf$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	esi, DWORD PTR _ptrLapBuf$[ebp]
	mov	ecx, DWORD PTR [esi+ecx*4+4]
	mov	DWORD PTR [eax+edx*4], ecx
; Line 3058
	jmp	SHORT $L32929
$L32930:
; Line 3060
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _ptrLapBuf$[ebp]
	push	ecx
	call	_eriFastIPLOT
	add	esp, 8
; Line 3062
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+128]
	mov	ecx, DWORD PTR _ptrLapBuf$[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _ptrLapBuf$[ebp], edx
; Line 3063
	jmp	$L32926
$L32927:
; Line 3065
	xor	eax, eax
; Line 3066
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
?DecodeLeadBlock_MSS@MIODecoder@@IAEHXZ ENDP		; MIODecoder::DecodeLeadBlock_MSS
_ptrDst$ = 8
_nSamples$ = 12
_this$ = -56
_ptrLapBuf$ = -12
_ptrSrcBuf$ = -8
_i$ = -24
_j$ = -32
_nHalfDegree$ = -28
_nWeightCode$ = -44
_nCoefficient$ = -20
_ptrTempBuf$32945 = -52
_rSin$ = -36
_rCos$ = -4
_nRevCode$ = -16
_ptrSrcBuf1$ = -48
_ptrSrcBuf2$ = -40
?DecodePostBlock_MSS@MIODecoder@@IAEHPAFI@Z PROC NEAR	; MIODecoder::DecodePostBlock_MSS
; Line 3073
	push	ebp
	mov	ebp, esp
	sub	esp, 72					; 00000048H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 3074
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+96]
	mov	DWORD PTR _ptrLapBuf$[ebp], ecx
; Line 3075
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	mov	DWORD PTR _ptrSrcBuf$[ebp], eax
; Line 3078
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+128]
	shr	edx, 1
	mov	DWORD PTR _nHalfDegree$[ebp], edx
; Line 3079
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _nWeightCode$[ebp], edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+108], ecx
; Line 3080
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _nCoefficient$[ebp], edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+112], ecx
; Line 3082
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32942
$L32943:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L32942:
	cmp	DWORD PTR _i$[ebp], 2
	jae	$L32944
; Line 3087
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+48]
	mov	DWORD PTR _ptrTempBuf$32945[ebp], edx
; Line 3088
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32947
$L32948:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L32947:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _nHalfDegree$[ebp]
	jae	SHORT $L32949
; Line 3090
	mov	edx, DWORD PTR _j$[ebp]
	shl	edx, 1
	mov	eax, DWORD PTR _ptrTempBuf$32945[ebp]
	mov	DWORD PTR [eax+edx*4], 0
; Line 3091
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+116]
	mov	eax, DWORD PTR _j$[ebp]
	shl	eax, 1
	mov	ecx, DWORD PTR _ptrTempBuf$32945[ebp]
	mov	edx, DWORD PTR [edx]
	mov	DWORD PTR [ecx+eax*4+4], edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+116]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+116], ecx
; Line 3092
	jmp	SHORT $L32948
$L32949:
; Line 3095
	mov	eax, DWORD PTR _nCoefficient$[ebp]
	push	eax
	mov	ecx, DWORD PTR _nWeightCode$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+128]
	push	eax
	mov	ecx, DWORD PTR _ptrTempBuf$32945[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?IQuantumize@MIODecoder@@IAEXPAMPBHHJH@Z ; MIODecoder::IQuantumize
; Line 3097
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _ptrSrcBuf$[ebp], eax
; Line 3098
	jmp	$L32943
$L32944:
; Line 3103
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+104]
	xor	eax, eax
	mov	al, BYTE PTR [edx]
	mov	DWORD PTR _nRevCode$[ebp], eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+104]
	add	edx, 1
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+104], edx
; Line 3105
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	mov	DWORD PTR _ptrSrcBuf1$[ebp], edx
; Line 3106
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	lea	ecx, DWORD PTR [eax+ecx*4]
	mov	DWORD PTR _ptrSrcBuf2$[ebp], ecx
; Line 3108
	fild	DWORD PTR _nRevCode$[ebp]
	fstp	QWORD PTR -64+[ebp]
	fld	QWORD PTR -64+[ebp]
	fmul	QWORD PTR _ERI_PI$S31670
	fdiv	QWORD PTR $T32986
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_sin
	add	esp, 8
	fstp	DWORD PTR _rSin$[ebp]
; Line 3109
	fild	DWORD PTR _nRevCode$[ebp]
	fstp	QWORD PTR -72+[ebp]
	fld	QWORD PTR -72+[ebp]
	fmul	QWORD PTR _ERI_PI$S31670
	fdiv	QWORD PTR $T32986
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_cos
	add	esp, 8
	fstp	DWORD PTR _rCos$[ebp]
; Line 3111
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+128]
	push	eax
	push	1
	mov	ecx, DWORD PTR _rCos$[ebp]
	push	ecx
	mov	edx, DWORD PTR _rSin$[ebp]
	push	edx
	mov	eax, DWORD PTR _ptrSrcBuf2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrSrcBuf1$[ebp]
	push	ecx
	call	_eriRevolve2x2
	add	esp, 24					; 00000018H
; Line 3113
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	mov	DWORD PTR _ptrSrcBuf$[ebp], eax
; Line 3115
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32957
$L32958:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32957:
	cmp	DWORD PTR _i$[ebp], 2
	jae	$L32959
; Line 3121
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+132]
	push	edx
	mov	eax, DWORD PTR _ptrSrcBuf$[ebp]
	push	eax
	call	_eriOddGivensInverseMatrix
	add	esp, 12					; 0000000cH
; Line 3123
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32960
$L32961:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 2
	mov	DWORD PTR _j$[ebp], ecx
$L32960:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+128]
	jae	SHORT $L32962
; Line 3125
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	fld	DWORD PTR [edx+ecx*4+4]
	fchs
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _ptrSrcBuf$[ebp]
	fstp	DWORD PTR [ecx+eax*4]
; Line 3126
	jmp	SHORT $L32961
$L32962:
; Line 3129
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _ptrSrcBuf$[ebp]
	push	ecx
	call	_eriFastIPLOT
	add	esp, 8
; Line 3131
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _ptrSrcBuf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrLapBuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+84]
	push	ecx
	call	_eriFastILOT
	add	esp, 16					; 00000010H
; Line 3133
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32963
$L32964:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L32963:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+128]
	jae	SHORT $L32965
; Line 3135
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+84]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	mov	esi, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR [eax+esi*4]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 3136
	jmp	SHORT $L32964
$L32965:
; Line 3142
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+84]
	push	ecx
	push	1
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	push	ecx
	call	_eriFastIDCT
	add	esp, 20					; 00000014H
; Line 3146
	cmp	DWORD PTR _nSamples$[ebp], 0
	je	SHORT $L32966
; Line 3149
	mov	edx, DWORD PTR _nSamples$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	push	ecx
	push	2
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _ptrDst$[ebp]
	lea	ecx, DWORD PTR [eax+edx*2]
	push	ecx
	call	_eriRoundR32ToWordArray
	add	esp, 16					; 00000010H
$L32966:
; Line 3152
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+128]
	mov	ecx, DWORD PTR _ptrLapBuf$[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _ptrLapBuf$[ebp], edx
; Line 3153
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	mov	edx, DWORD PTR _ptrSrcBuf$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _ptrSrcBuf$[ebp], eax
; Line 3154
	jmp	$L32958
$L32959:
; Line 3156
	xor	eax, eax
; Line 3157
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
?DecodePostBlock_MSS@MIODecoder@@IAEHPAFI@Z ENDP	; MIODecoder::DecodePostBlock_MSS
_TEXT	ENDS
END
