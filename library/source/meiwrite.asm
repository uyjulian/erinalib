	TITLE	I:\EntisGLS\eri-chan\experi\meiwrite.cpp
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
;	COMDAT ??_GEEncodeContext@ERIAnimationWriter@@UAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_GEOutputBuffer@ERIAnimationWriter@@QAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_7ERIAnimationWriter@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
;	COMDAT ??_7EEncodeContext@ERIAnimationWriter@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	??0EOutputBuffer@ERIAnimationWriter@@QAE@PBEK@Z	; ERIAnimationWriter::EOutputBuffer::EOutputBuffer
EXTRN	?eriAllocateMemory@@YAPAXK@Z:NEAR		; eriAllocateMemory
_TEXT	SEGMENT
_ptrBuffer$ = 8
_nBytes$ = 12
_this$ = -4
??0EOutputBuffer@ERIAnimationWriter@@QAE@PBEK@Z PROC NEAR ; ERIAnimationWriter::EOutputBuffer::EOutputBuffer
; File I:\EntisGLS\eri-chan\experi\meiwrite.cpp
; Line 32
	push	ebp
	mov	ebp, esp
	push	ecx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 33
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], 0
; Line 34
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nBytes$[ebp]
	mov	DWORD PTR [ecx+4], edx
; Line 35
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], eax
; Line 36
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	esi, DWORD PTR _ptrBuffer$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	edi, DWORD PTR [edx+8]
	mov	eax, ecx
	shr	ecx, 2
	rep movsd
	mov	ecx, eax
	and	ecx, 3
	rep movsb
; Line 37
	mov	eax, DWORD PTR _this$[ebp]
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
??0EOutputBuffer@ERIAnimationWriter@@QAE@PBEK@Z ENDP	; ERIAnimationWriter::EOutputBuffer::EOutputBuffer
_TEXT	ENDS
PUBLIC	??1EOutputBuffer@ERIAnimationWriter@@QAE@XZ	; ERIAnimationWriter::EOutputBuffer::~EOutputBuffer
EXTRN	?eriFreeMemory@@YAXPAX@Z:NEAR			; eriFreeMemory
_TEXT	SEGMENT
_this$ = -4
??1EOutputBuffer@ERIAnimationWriter@@QAE@XZ PROC NEAR	; ERIAnimationWriter::EOutputBuffer::~EOutputBuffer
; Line 43
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 44
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 45
	mov	esp, ebp
	pop	ebp
	ret	0
??1EOutputBuffer@ERIAnimationWriter@@QAE@XZ ENDP	; ERIAnimationWriter::EOutputBuffer::~EOutputBuffer
_TEXT	ENDS
PUBLIC	??0EEncodeContext@ERIAnimationWriter@@QAE@XZ	; ERIAnimationWriter::EEncodeContext::EEncodeContext
PUBLIC	?WriteNextData@EEncodeContext@ERIAnimationWriter@@UAEKPBEK@Z ; ERIAnimationWriter::EEncodeContext::WriteNextData
PUBLIC	??_7EEncodeContext@ERIAnimationWriter@@6B@	; ERIAnimationWriter::EEncodeContext::`vftable'
PUBLIC	??_GEEncodeContext@ERIAnimationWriter@@UAEPAXI@Z ; ERIAnimationWriter::EEncodeContext::`scalar deleting destructor'
;PUBLIC	??_EEEncodeContext@ERIAnimationWriter@@UAEPAXI@Z ; ERIAnimationWriter::EEncodeContext::`vector deleting destructor'
EXTRN	??0RLHEncodeContext@@QAE@K@Z:NEAR		; RLHEncodeContext::RLHEncodeContext
;	COMDAT ??_7EEncodeContext@ERIAnimationWriter@@6B@
; File I:\EntisGLS\eri-chan\experi\meiwrite.cpp
CONST	SEGMENT
??_7EEncodeContext@ERIAnimationWriter@@6B@	LABEL	DWORD
; DD FLAT:??_EEEncodeContext@ERIAnimationWriter@@UAEPAXI@Z ; ERIAnimationWriter::EEncodeContext::`vftable'
	DD	FLAT:??_GEEncodeContext@ERIAnimationWriter@@UAEPAXI@Z
	DD	FLAT:?WriteNextData@EEncodeContext@ERIAnimationWriter@@UAEKPBEK@Z
CONST	ENDS
_TEXT	SEGMENT
_this$ = -4
??0EEncodeContext@ERIAnimationWriter@@QAE@XZ PROC NEAR	; ERIAnimationWriter::EEncodeContext::EEncodeContext
; File I:\EntisGLS\eri-chan\experi\meiwrite.cpp
; Line 52
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	push	65536					; 00010000H
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0RLHEncodeContext@@QAE@K@Z		; RLHEncodeContext::RLHEncodeContext
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EEncodeContext@ERIAnimationWriter@@6B@ ; ERIAnimationWriter::EEncodeContext::`vftable'
; Line 53
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+2084], 0
; Line 54
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+2088], 0
; Line 55
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+2092], 0
; Line 56
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0EEncodeContext@ERIAnimationWriter@@QAE@XZ ENDP	; ERIAnimationWriter::EEncodeContext::EEncodeContext
_TEXT	ENDS
PUBLIC	??1EEncodeContext@ERIAnimationWriter@@UAE@XZ	; ERIAnimationWriter::EEncodeContext::~EEncodeContext
EXTRN	??3@YAXPAX@Z:NEAR				; operator delete
;	COMDAT ??_GEEncodeContext@ERIAnimationWriter@@UAEPAXI@Z
_TEXT	SEGMENT
___flags$ = 8
_this$ = -4
??_GEEncodeContext@ERIAnimationWriter@@UAEPAXI@Z PROC NEAR ; ERIAnimationWriter::EEncodeContext::`scalar deleting destructor', COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1EEncodeContext@ERIAnimationWriter@@UAE@XZ ; ERIAnimationWriter::EEncodeContext::~EEncodeContext
	mov	eax, DWORD PTR ___flags$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L31054
	mov	ecx, DWORD PTR _this$[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L31054:
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??_GEEncodeContext@ERIAnimationWriter@@UAEPAXI@Z ENDP	; ERIAnimationWriter::EEncodeContext::`scalar deleting destructor'
_TEXT	ENDS
PUBLIC	?Delete@EEncodeContext@ERIAnimationWriter@@QAEXXZ ; ERIAnimationWriter::EEncodeContext::Delete
EXTRN	??1RLHEncodeContext@@UAE@XZ:NEAR		; RLHEncodeContext::~RLHEncodeContext
_TEXT	SEGMENT
_this$ = -4
??1EEncodeContext@ERIAnimationWriter@@UAE@XZ PROC NEAR	; ERIAnimationWriter::EEncodeContext::~EEncodeContext
; Line 62
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EEncodeContext@ERIAnimationWriter@@6B@ ; ERIAnimationWriter::EEncodeContext::`vftable'
; Line 63
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Delete@EEncodeContext@ERIAnimationWriter@@QAEXXZ ; ERIAnimationWriter::EEncodeContext::Delete
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1RLHEncodeContext@@UAE@XZ		; RLHEncodeContext::~RLHEncodeContext
; Line 64
	mov	esp, ebp
	pop	ebp
	ret	0
??1EEncodeContext@ERIAnimationWriter@@UAE@XZ ENDP	; ERIAnimationWriter::EEncodeContext::~EEncodeContext
_this$ = -20
_pCurBuf$ = -4
_pNextBuf$31065 = -8
$T31355 = -12
$T31356 = -16
?Delete@EEncodeContext@ERIAnimationWriter@@QAEXXZ PROC NEAR ; ERIAnimationWriter::EEncodeContext::Delete
; Line 70
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 71
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+2084]
	mov	DWORD PTR _pCurBuf$[ebp], ecx
$L31063:
; Line 72
	cmp	DWORD PTR _pCurBuf$[ebp], 0
	je	SHORT $L31064
; Line 74
	mov	edx, DWORD PTR _pCurBuf$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _pNextBuf$31065[ebp], eax
; Line 75
	mov	ecx, DWORD PTR _pCurBuf$[ebp]
	mov	DWORD PTR $T31356[ebp], ecx
	mov	edx, DWORD PTR $T31356[ebp]
	mov	DWORD PTR $T31355[ebp], edx
	cmp	DWORD PTR $T31355[ebp], 0
	je	SHORT $L31357
	mov	ecx, DWORD PTR $T31355[ebp]
	call	??1EOutputBuffer@ERIAnimationWriter@@QAE@XZ ; ERIAnimationWriter::EOutputBuffer::~EOutputBuffer
	mov	eax, 1
	and	eax, 1
	test	eax, eax
	je	SHORT $L31360
	mov	ecx, DWORD PTR $T31355[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L31360:
	mov	edx, DWORD PTR $T31355[ebp]
	mov	DWORD PTR -24+[ebp], edx
	jmp	SHORT $L31358
$L31357:
	mov	DWORD PTR -24+[ebp], 0
$L31358:
; Line 76
	mov	eax, DWORD PTR _pNextBuf$31065[ebp]
	mov	DWORD PTR _pCurBuf$[ebp], eax
; Line 77
	jmp	SHORT $L31063
$L31064:
; Line 78
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+2084], 0
; Line 79
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+2088], 0
; Line 80
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+2092], 0
; Line 81
	mov	esp, ebp
	pop	ebp
	ret	0
?Delete@EEncodeContext@ERIAnimationWriter@@QAEXXZ ENDP	; ERIAnimationWriter::EEncodeContext::Delete
_TEXT	ENDS
EXTRN	??2@YAPAXI@Z:NEAR				; operator new
_TEXT	SEGMENT
_ptrBuffer$ = 8
_nBytes$ = 12
_this$ = -12
_pBuffer$ = -4
$T31361 = -8
?WriteNextData@EEncodeContext@ERIAnimationWriter@@UAEKPBEK@Z PROC NEAR ; ERIAnimationWriter::EEncodeContext::WriteNextData
; Line 88
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 89
	push	12					; 0000000cH
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR $T31361[ebp], eax
	cmp	DWORD PTR $T31361[ebp], 0
	je	SHORT $L31362
	mov	eax, DWORD PTR _nBytes$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrBuffer$[ebp]
	push	ecx
	mov	ecx, DWORD PTR $T31361[ebp]
	call	??0EOutputBuffer@ERIAnimationWriter@@QAE@PBEK@Z ; ERIAnimationWriter::EOutputBuffer::EOutputBuffer
	mov	DWORD PTR -16+[ebp], eax
	jmp	SHORT $L31363
$L31362:
	mov	DWORD PTR -16+[ebp], 0
$L31363:
	mov	edx, DWORD PTR -16+[ebp]
	mov	DWORD PTR _pBuffer$[ebp], edx
; Line 90
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+2088], 0
	je	SHORT $L31079
; Line 92
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+2088]
	mov	eax, DWORD PTR _pBuffer$[ebp]
	mov	DWORD PTR [edx], eax
; Line 93
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _pBuffer$[ebp]
	mov	DWORD PTR [ecx+2088], edx
; Line 95
	jmp	SHORT $L31080
$L31079:
; Line 97
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _pBuffer$[ebp]
	mov	DWORD PTR [eax+2084], ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _pBuffer$[ebp]
	mov	DWORD PTR [edx+2088], eax
$L31080:
; Line 99
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+2092]
	add	edx, DWORD PTR _nBytes$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+2092], edx
; Line 101
	mov	eax, DWORD PTR _nBytes$[ebp]
; Line 102
	mov	esp, ebp
	pop	ebp
	ret	8
?WriteNextData@EEncodeContext@ERIAnimationWriter@@UAEKPBEK@Z ENDP ; ERIAnimationWriter::EEncodeContext::WriteNextData
_TEXT	ENDS
PUBLIC	??0ERIAnimationWriter@@QAE@XZ			; ERIAnimationWriter::ERIAnimationWriter
PUBLIC	?CreateERIEncoder@ERIAnimationWriter@@MAEPAVERIEncoder@@XZ ; ERIAnimationWriter::CreateERIEncoder
PUBLIC	?CreateMIOEncoder@ERIAnimationWriter@@MAEPAVMIOEncoder@@XZ ; ERIAnimationWriter::CreateMIOEncoder
PUBLIC	??_7ERIAnimationWriter@@6B@			; ERIAnimationWriter::`vftable'
EXTRN	??0ERIWriteFile@@QAE@XZ:NEAR			; ERIWriteFile::ERIWriteFile
EXTRN	??0PARAMETER@ERIEncoder@@QAE@XZ:NEAR		; ERIEncoder::PARAMETER::PARAMETER
EXTRN	??0PARAMETER@MIOEncoder@@QAE@XZ:NEAR		; MIOEncoder::PARAMETER::PARAMETER
;	COMDAT ??_7ERIAnimationWriter@@6B@
; File I:\EntisGLS\eri-chan\experi\meiwrite.cpp
CONST	SEGMENT
??_7ERIAnimationWriter@@6B@ DD FLAT:?CreateERIEncoder@ERIAnimationWriter@@MAEPAVERIEncoder@@XZ ; ERIAnimationWriter::`vftable'
	DD	FLAT:?CreateMIOEncoder@ERIAnimationWriter@@MAEPAVMIOEncoder@@XZ
CONST	ENDS
_TEXT	SEGMENT
_this$ = -4
??0ERIAnimationWriter@@QAE@XZ PROC NEAR			; ERIAnimationWriter::ERIAnimationWriter
; File I:\EntisGLS\eri-chan\experi\meiwrite.cpp
; Line 108
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	??0ERIWriteFile@@QAE@XZ			; ERIWriteFile::ERIWriteFile
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 248				; 000000f8H
	call	??0EEncodeContext@ERIAnimationWriter@@QAE@XZ ; ERIAnimationWriter::EEncodeContext::EEncodeContext
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 2344				; 00000928H
	call	??0EEncodeContext@ERIAnimationWriter@@QAE@XZ ; ERIAnimationWriter::EEncodeContext::EEncodeContext
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4480				; 00001180H
	call	??0PARAMETER@ERIEncoder@@QAE@XZ		; ERIEncoder::PARAMETER::PARAMETER
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4512				; 000011a0H
	call	??0PARAMETER@MIOEncoder@@QAE@XZ		; MIOEncoder::PARAMETER::PARAMETER
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7ERIAnimationWriter@@6B@ ; ERIAnimationWriter::`vftable'
; Line 109
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+8], 0
; Line 110
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+4440], 0
; Line 111
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+4444], 0
; Line 112
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4448], 0
; Line 113
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+4452], 0
; Line 114
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+4456], 0
; Line 115
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4460], 0
; Line 116
	mov	edx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [edx+4464], 0
; Line 117
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+4468], 0
; Line 118
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4472], 0
; Line 119
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0ERIAnimationWriter@@QAE@XZ ENDP			; ERIAnimationWriter::ERIAnimationWriter
_TEXT	ENDS
PUBLIC	??1ERIAnimationWriter@@QAE@XZ			; ERIAnimationWriter::~ERIAnimationWriter
PUBLIC	?Close@ERIAnimationWriter@@QAEXXZ		; ERIAnimationWriter::Close
EXTRN	??1ERIWriteFile@@UAE@XZ:NEAR			; ERIWriteFile::~ERIWriteFile
_TEXT	SEGMENT
_this$ = -4
??1ERIAnimationWriter@@QAE@XZ PROC NEAR			; ERIAnimationWriter::~ERIAnimationWriter
; Line 125
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7ERIAnimationWriter@@6B@ ; ERIAnimationWriter::`vftable'
; Line 126
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Close@ERIAnimationWriter@@QAEXXZ	; ERIAnimationWriter::Close
; Line 127
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 2344				; 00000928H
	call	??1EEncodeContext@ERIAnimationWriter@@UAE@XZ ; ERIAnimationWriter::EEncodeContext::~EEncodeContext
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 248				; 000000f8H
	call	??1EEncodeContext@ERIAnimationWriter@@UAE@XZ ; ERIAnimationWriter::EEncodeContext::~EEncodeContext
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	??1ERIWriteFile@@UAE@XZ			; ERIWriteFile::~ERIWriteFile
	mov	esp, ebp
	pop	ebp
	ret	0
??1ERIAnimationWriter@@QAE@XZ ENDP			; ERIAnimationWriter::~ERIAnimationWriter
_TEXT	ENDS
PUBLIC	?Open@ERIAnimationWriter@@QAE_NPAVEWriteFileObj@@W4FileID@ERIWriteFile@@@Z ; ERIAnimationWriter::Open
EXTRN	?Open@ERIWriteFile@@QAE_NPAVEWriteFileObj@@W4FileID@1@@Z:NEAR ; ERIWriteFile::Open
_TEXT	SEGMENT
_pFile$ = 8
_fidType$ = 12
_this$ = -4
?Open@ERIAnimationWriter@@QAE_NPAVEWriteFileObj@@W4FileID@ERIWriteFile@@@Z PROC NEAR ; ERIAnimationWriter::Open
; Line 134
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 137
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Close@ERIAnimationWriter@@QAEXXZ	; ERIAnimationWriter::Close
; Line 140
	mov	eax, DWORD PTR _fidType$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pFile$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?Open@ERIWriteFile@@QAE_NPAVEWriteFileObj@@W4FileID@1@@Z ; ERIWriteFile::Open
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31091
; Line 142
	xor	al, al
	jmp	SHORT $L31090
$L31091:
; Line 146
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], 1
; Line 148
	mov	al, 1
$L31090:
; Line 149
	mov	esp, ebp
	pop	ebp
	ret	8
?Open@ERIAnimationWriter@@QAE_NPAVEWriteFileObj@@W4FileID@ERIWriteFile@@@Z ENDP ; ERIAnimationWriter::Open
_TEXT	ENDS
PUBLIC	?EndFileHeader@ERIAnimationWriter@@QAEXXZ	; ERIAnimationWriter::EndFileHeader
PUBLIC	?EndStream@ERIAnimationWriter@@QAE_NK@Z		; ERIAnimationWriter::EndStream
PUBLIC	?DeleteImageBuffer@ERIAnimationWriter@@IAEXPAURASTER_IMAGE_INFO@@@Z ; ERIAnimationWriter::DeleteImageBuffer
EXTRN	__imp__PostThreadMessageA@16:NEAR
EXTRN	?Close@ERIWriteFile@@QAEXXZ:NEAR		; ERIWriteFile::Close
EXTRN	__imp__WaitForSingleObject@8:NEAR
EXTRN	__imp__CloseHandle@4:NEAR
_TEXT	SEGMENT
_this$ = -36
$T31364 = -4
$T31365 = -8
$T31368 = -12
$T31369 = -16
$T31372 = -20
$T31373 = -24
$T31376 = -28
$T31377 = -32
?Close@ERIAnimationWriter@@QAEXXZ PROC NEAR		; ERIAnimationWriter::Close
; Line 155
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	mov	DWORD PTR _this$[ebp], ecx
; Line 158
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 3
	jne	SHORT $L31095
; Line 160
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EndFileHeader@ERIAnimationWriter@@QAEXXZ ; ERIAnimationWriter::EndFileHeader
; Line 162
	jmp	SHORT $L31096
$L31095:
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+8], 2
	jne	SHORT $L31097
; Line 164
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EndStream@ERIAnimationWriter@@QAE_NK@Z	; ERIAnimationWriter::EndStream
$L31097:
$L31096:
; Line 168
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+4472], 0
	je	SHORT $L31098
; Line 170
	push	0
	push	0
	push	1025					; 00000401H
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4476]
	push	ecx
	call	DWORD PTR __imp__PostThreadMessageA@16
; Line 171
	push	-1
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4472]
	push	eax
	call	DWORD PTR __imp__WaitForSingleObject@8
; Line 172
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4472]
	push	edx
	call	DWORD PTR __imp__CloseHandle@4
; Line 173
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+4472], 0
$L31098:
; Line 175
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+4468], 0
	je	SHORT $L31099
; Line 177
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4468]
	push	eax
	call	DWORD PTR __imp__CloseHandle@4
; Line 178
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4468], 0
$L31099:
; Line 180
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+4440], 0
	je	SHORT $L31100
; Line 182
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4440]
	mov	DWORD PTR $T31365[ebp], ecx
	mov	edx, DWORD PTR $T31365[ebp]
	mov	DWORD PTR $T31364[ebp], edx
	cmp	DWORD PTR $T31364[ebp], 0
	je	SHORT $L31366
	push	1
	mov	eax, DWORD PTR $T31364[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR $T31364[ebp]
	call	DWORD PTR [edx]
	mov	DWORD PTR -40+[ebp], eax
	jmp	SHORT $L31367
$L31366:
	mov	DWORD PTR -40+[ebp], 0
$L31367:
; Line 183
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4440]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4440]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+8]
; Line 184
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+4440], 0
$L31100:
; Line 186
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+4444], 0
	je	SHORT $L31103
; Line 188
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4444]
	mov	DWORD PTR $T31369[ebp], eax
	mov	ecx, DWORD PTR $T31369[ebp]
	mov	DWORD PTR $T31368[ebp], ecx
	cmp	DWORD PTR $T31368[ebp], 0
	je	SHORT $L31370
	push	1
	mov	edx, DWORD PTR $T31368[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR $T31368[ebp]
	call	DWORD PTR [eax]
	mov	DWORD PTR -44+[ebp], eax
	jmp	SHORT $L31371
$L31370:
	mov	DWORD PTR -44+[ebp], 0
$L31371:
; Line 189
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+4444]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4444]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+8]
; Line 190
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+4444], 0
$L31103:
; Line 192
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+4448], 0
	je	SHORT $L31106
; Line 194
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4448]
	mov	DWORD PTR $T31373[ebp], eax
	mov	ecx, DWORD PTR $T31373[ebp]
	mov	DWORD PTR $T31372[ebp], ecx
	cmp	DWORD PTR $T31372[ebp], 0
	je	SHORT $L31374
	push	1
	mov	edx, DWORD PTR $T31372[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR $T31372[ebp]
	call	DWORD PTR [eax]
	mov	DWORD PTR -48+[ebp], eax
	jmp	SHORT $L31375
$L31374:
	mov	DWORD PTR -48+[ebp], 0
$L31375:
; Line 195
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4448], 0
$L31106:
; Line 197
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+4452], 0
	je	SHORT $L31109
; Line 199
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4452]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4452]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+8]
; Line 200
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4452]
	mov	DWORD PTR $T31377[ebp], ecx
	mov	edx, DWORD PTR $T31377[ebp]
	mov	DWORD PTR $T31376[ebp], edx
	cmp	DWORD PTR $T31376[ebp], 0
	je	SHORT $L31378
	push	1
	mov	eax, DWORD PTR $T31376[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR $T31376[ebp]
	call	DWORD PTR [edx]
	mov	DWORD PTR -52+[ebp], eax
	jmp	SHORT $L31379
$L31378:
	mov	DWORD PTR -52+[ebp], 0
$L31379:
; Line 201
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+4452], 0
$L31109:
; Line 203
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+4456], 0
	je	SHORT $L31112
; Line 205
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4456]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteImageBuffer@ERIAnimationWriter@@IAEXPAURASTER_IMAGE_INFO@@@Z ; ERIAnimationWriter::DeleteImageBuffer
; Line 206
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4456], 0
$L31112:
; Line 208
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+4460], 0
	je	SHORT $L31113
; Line 210
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4460]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteImageBuffer@ERIAnimationWriter@@IAEXPAURASTER_IMAGE_INFO@@@Z ; ERIAnimationWriter::DeleteImageBuffer
; Line 211
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+4460], 0
$L31113:
; Line 215
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	SHORT $L31114
; Line 217
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?Close@ERIWriteFile@@QAEXXZ		; ERIWriteFile::Close
; Line 218
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+8], 0
$L31114:
; Line 220
	mov	esp, ebp
	pop	ebp
	ret	0
?Close@ERIAnimationWriter@@QAEXXZ ENDP			; ERIAnimationWriter::Close
_TEXT	ENDS
PUBLIC	?BeginFileHeader@ERIAnimationWriter@@QAE_NKK@Z	; ERIAnimationWriter::BeginFileHeader
EXTRN	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z:NEAR	; ERIWriteFile::DescendRecord
EXTRN	?AscendRecord@ERIWriteFile@@QAEXXZ:NEAR		; ERIWriteFile::AscendRecord
_DATA	SEGMENT
$SG31122 DB	'Header  ', 00H
	ORG $+3
$SG31125 DB	'FileHdr ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_dwKeyFrame$ = 8
_dwKeyWave$ = 12
_this$ = -4
?BeginFileHeader@ERIAnimationWriter@@QAE_NKK@Z PROC NEAR ; ERIAnimationWriter::BeginFileHeader
; Line 226
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 229
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 1
	je	SHORT $L31119
; Line 231
	xor	al, al
	jmp	$L31118
$L31119:
; Line 233
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _dwKeyFrame$[ebp]
	mov	DWORD PTR [ecx+224], edx
; Line 234
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _dwKeyWave$[ebp]
	mov	DWORD PTR [eax+228], ecx
; Line 237
	push	OFFSET FLAT:$SG31122
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z ; ERIWriteFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31121
; Line 239
	xor	al, al
	jmp	$L31118
$L31121:
; Line 243
	push	OFFSET FLAT:$SG31125
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z ; ERIWriteFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31124
; Line 245
	xor	al, al
	jmp	SHORT $L31118
$L31124:
; Line 247
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+28], 131328		; 00020100H
; Line 248
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+32], 0
; Line 249
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _dwKeyFrame$[ebp]
	mov	DWORD PTR [ecx+36], edx
; Line 250
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+40], 0
; Line 251
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+44], 0
; Line 252
	push	20					; 00000014H
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 28					; 0000001cH
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+12]
	call	DWORD PTR [edx+4]
; Line 253
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AscendRecord@ERIWriteFile@@QAEXXZ	; ERIWriteFile::AscendRecord
; Line 255
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+240], 0
; Line 256
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+244], 0
; Line 259
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], 2
; Line 261
	mov	al, 1
$L31118:
; Line 262
	mov	esp, ebp
	pop	ebp
	ret	8
?BeginFileHeader@ERIAnimationWriter@@QAE_NKK@Z ENDP	; ERIAnimationWriter::BeginFileHeader
_TEXT	ENDS
PUBLIC	?WritePreviewInfo@ERIAnimationWriter@@QAE_NABUERI_INFO_HEADER@@@Z ; ERIAnimationWriter::WritePreviewInfo
_DATA	SEGMENT
	ORG $+3
$SG31132 DB	'PrevwInf', 00H
_DATA	ENDS
_TEXT	SEGMENT
_eih$ = 8
_this$ = -4
?WritePreviewInfo@ERIAnimationWriter@@QAE_NABUERI_INFO_HEADER@@@Z PROC NEAR ; ERIAnimationWriter::WritePreviewInfo
; Line 268
	push	ebp
	mov	ebp, esp
	push	ecx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 269
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 2
	je	SHORT $L31129
; Line 271
	xor	al, al
	jmp	SHORT $L31128
$L31129:
; Line 273
	push	OFFSET FLAT:$SG31132
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z ; ERIWriteFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31131
; Line 275
	xor	al, al
	jmp	SHORT $L31128
$L31131:
; Line 277
	mov	esi, DWORD PTR _eih$[ebp]
	mov	edi, DWORD PTR _this$[ebp]
	add	edi, 48					; 00000030H
	mov	ecx, 17					; 00000011H
	rep movsd
; Line 278
	push	68					; 00000044H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 48					; 00000030H
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+12]
	call	DWORD PTR [eax+4]
; Line 279
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AscendRecord@ERIWriteFile@@QAEXXZ	; ERIWriteFile::AscendRecord
; Line 281
	mov	al, 1
$L31128:
; Line 282
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?WritePreviewInfo@ERIAnimationWriter@@QAE_NABUERI_INFO_HEADER@@@Z ENDP ; ERIAnimationWriter::WritePreviewInfo
_TEXT	ENDS
PUBLIC	?WriteEriInfoHeader@ERIAnimationWriter@@QAE_NABUERI_INFO_HEADER@@@Z ; ERIAnimationWriter::WriteEriInfoHeader
_DATA	SEGMENT
	ORG $+3
$SG31139 DB	'ImageInf', 00H
_DATA	ENDS
_TEXT	SEGMENT
_eih$ = 8
_this$ = -4
?WriteEriInfoHeader@ERIAnimationWriter@@QAE_NABUERI_INFO_HEADER@@@Z PROC NEAR ; ERIAnimationWriter::WriteEriInfoHeader
; Line 288
	push	ebp
	mov	ebp, esp
	push	ecx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 289
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 2
	je	SHORT $L31136
; Line 291
	xor	al, al
	jmp	SHORT $L31135
$L31136:
; Line 293
	push	OFFSET FLAT:$SG31139
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z ; ERIWriteFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31138
; Line 295
	xor	al, al
	jmp	SHORT $L31135
$L31138:
; Line 297
	mov	esi, DWORD PTR _eih$[ebp]
	mov	edi, DWORD PTR _this$[ebp]
	add	edi, 116				; 00000074H
	mov	ecx, 17					; 00000011H
	rep movsd
; Line 298
	push	68					; 00000044H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 116				; 00000074H
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+12]
	call	DWORD PTR [eax+4]
; Line 299
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AscendRecord@ERIWriteFile@@QAEXXZ	; ERIWriteFile::AscendRecord
; Line 301
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	or	edx, 1
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+32], edx
; Line 303
	mov	al, 1
$L31135:
; Line 304
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?WriteEriInfoHeader@ERIAnimationWriter@@QAE_NABUERI_INFO_HEADER@@@Z ENDP ; ERIAnimationWriter::WriteEriInfoHeader
_TEXT	ENDS
PUBLIC	?WriteMioInfoHeader@ERIAnimationWriter@@QAE_NABUMIO_INFO_HEADER@@@Z ; ERIAnimationWriter::WriteMioInfoHeader
_DATA	SEGMENT
	ORG $+3
$SG31146 DB	'SoundInf', 00H
_DATA	ENDS
_TEXT	SEGMENT
_mih$ = 8
_this$ = -4
?WriteMioInfoHeader@ERIAnimationWriter@@QAE_NABUMIO_INFO_HEADER@@@Z PROC NEAR ; ERIAnimationWriter::WriteMioInfoHeader
; Line 310
	push	ebp
	mov	ebp, esp
	push	ecx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 311
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 2
	je	SHORT $L31143
; Line 313
	xor	al, al
	jmp	SHORT $L31142
$L31143:
; Line 315
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+12]
	call	DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+240], eax
; Line 317
	push	OFFSET FLAT:$SG31146
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z ; ERIWriteFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31145
; Line 319
	xor	al, al
	jmp	SHORT $L31142
$L31145:
; Line 321
	mov	esi, DWORD PTR _mih$[ebp]
	mov	edi, DWORD PTR _this$[ebp]
	add	edi, 184				; 000000b8H
	mov	ecx, 10					; 0000000aH
	rep movsd
; Line 322
	push	40					; 00000028H
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 184				; 000000b8H
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+12]
	call	DWORD PTR [edx+4]
; Line 323
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AscendRecord@ERIWriteFile@@QAEXXZ	; ERIWriteFile::AscendRecord
; Line 325
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	or	ch, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+32], ecx
; Line 327
	mov	al, 1
$L31142:
; Line 328
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?WriteMioInfoHeader@ERIAnimationWriter@@QAE_NABUMIO_INFO_HEADER@@@Z ENDP ; ERIAnimationWriter::WriteMioInfoHeader
_TEXT	ENDS
PUBLIC	?WriteCopyright@ERIAnimationWriter@@QAE_NPBXK@Z	; ERIAnimationWriter::WriteCopyright
_DATA	SEGMENT
	ORG $+3
$SG31154 DB	'cpyright', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ptrCopyright$ = 8
_dwBytes$ = 12
_this$ = -4
?WriteCopyright@ERIAnimationWriter@@QAE_NPBXK@Z PROC NEAR ; ERIAnimationWriter::WriteCopyright
; Line 335
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 336
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 2
	je	SHORT $L31151
; Line 338
	xor	al, al
	jmp	SHORT $L31150
$L31151:
; Line 340
	push	OFFSET FLAT:$SG31154
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z ; ERIWriteFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31153
; Line 342
	xor	al, al
	jmp	SHORT $L31150
$L31153:
; Line 344
	mov	ecx, DWORD PTR _dwBytes$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrCopyright$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+12]
	call	DWORD PTR [edx+4]
; Line 345
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AscendRecord@ERIWriteFile@@QAEXXZ	; ERIWriteFile::AscendRecord
; Line 347
	mov	al, 1
$L31150:
; Line 348
	mov	esp, ebp
	pop	ebp
	ret	8
?WriteCopyright@ERIAnimationWriter@@QAE_NPBXK@Z ENDP	; ERIAnimationWriter::WriteCopyright
_TEXT	ENDS
PUBLIC	?WriteDescription@ERIAnimationWriter@@QAE_NPBXK@Z ; ERIAnimationWriter::WriteDescription
_DATA	SEGMENT
	ORG $+3
$SG31162 DB	'descript', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ptrDescription$ = 8
_dwBytes$ = 12
_this$ = -4
?WriteDescription@ERIAnimationWriter@@QAE_NPBXK@Z PROC NEAR ; ERIAnimationWriter::WriteDescription
; Line 355
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 356
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 2
	je	SHORT $L31159
; Line 358
	xor	al, al
	jmp	SHORT $L31158
$L31159:
; Line 360
	push	OFFSET FLAT:$SG31162
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z ; ERIWriteFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31161
; Line 362
	xor	al, al
	jmp	SHORT $L31158
$L31161:
; Line 364
	mov	ecx, DWORD PTR _dwBytes$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrDescription$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+12]
	call	DWORD PTR [edx+4]
; Line 365
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AscendRecord@ERIWriteFile@@QAEXXZ	; ERIWriteFile::AscendRecord
; Line 367
	mov	al, 1
$L31158:
; Line 368
	mov	esp, ebp
	pop	ebp
	ret	8
?WriteDescription@ERIAnimationWriter@@QAE_NPBXK@Z ENDP	; ERIAnimationWriter::WriteDescription
_this$ = -4
?EndFileHeader@ERIAnimationWriter@@QAEXXZ PROC NEAR	; ERIAnimationWriter::EndFileHeader
; Line 374
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 375
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 2
	jne	SHORT $L31166
; Line 377
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+12]
	call	DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 378
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AscendRecord@ERIWriteFile@@QAEXXZ	; ERIWriteFile::AscendRecord
; Line 379
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], 1
$L31166:
; Line 381
	mov	esp, ebp
	pop	ebp
	ret	0
?EndFileHeader@ERIAnimationWriter@@QAEXXZ ENDP		; ERIAnimationWriter::EndFileHeader
_TEXT	ENDS
PUBLIC	?BeginStream@ERIAnimationWriter@@QAE_NXZ	; ERIAnimationWriter::BeginStream
PUBLIC	?CreateImageBuffer@ERIAnimationWriter@@IAEPAURASTER_IMAGE_INFO@@ABUERI_INFO_HEADER@@@Z ; ERIAnimationWriter::CreateImageBuffer
PUBLIC	?ThreadProc@ERIAnimationWriter@@KGKPAX@Z	; ERIAnimationWriter::ThreadProc
EXTRN	__imp__CreateEventA@16:NEAR
EXTRN	__imp__CreateThread@24:NEAR
EXTRN	?SetCompressionParameter@ERIEncoder@@QAEXABUPARAMETER@1@@Z:NEAR ; ERIEncoder::SetCompressionParameter
EXTRN	__imp__WaitForMultipleObjects@16:NEAR
EXTRN	??0EFileEncodeContext@@QAE@PAVEWriteFileObj@@K@Z:NEAR ; EFileEncodeContext::EFileEncodeContext
EXTRN	?SetCompressionParameter@MIOEncoder@@QAEXABUPARAMETER@1@@Z:NEAR ; MIOEncoder::SetCompressionParameter
_DATA	SEGMENT
	ORG $+3
$SG31187 DB	'Stream  ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -20
_hEventList$ = -8
_dwWaitResult$ = -12
$T31380 = -16
?BeginStream@ERIAnimationWriter@@QAE_NXZ PROC NEAR	; ERIAnimationWriter::BeginStream
; Line 387
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 390
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 1
	je	SHORT $L31170
; Line 392
	xor	al, al
	jmp	$L31169
$L31170:
; Line 396
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+232], 0
; Line 397
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+236], 0
; Line 400
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	and	ecx, 1
	test	ecx, ecx
	je	$L31171
; Line 402
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4440], eax
; Line 403
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4444], eax
; Line 404
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 116				; 00000074H
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4440]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4440]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+4]
	test	eax, eax
	jne	SHORT $L31173
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 116				; 00000074H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+4444]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4444]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+4]
	test	eax, eax
	je	SHORT $L31172
$L31173:
; Line 406
	xor	al, al
	jmp	$L31169
$L31172:
; Line 408
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 4480				; 00001180H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+4440]
	call	?SetCompressionParameter@ERIEncoder@@QAEXABUPARAMETER@1@@Z ; ERIEncoder::SetCompressionParameter
; Line 409
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 4480				; 00001180H
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4444]
	call	?SetCompressionParameter@ERIEncoder@@QAEXABUPARAMETER@1@@Z ; ERIEncoder::SetCompressionParameter
$L31171:
; Line 411
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 256				; 00000100H
	test	edx, edx
	je	$L31174
; Line 413
	push	2088					; 00000828H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR $T31380[ebp], eax
	cmp	DWORD PTR $T31380[ebp], 0
	je	SHORT $L31381
	push	65536					; 00010000H
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR $T31380[ebp]
	call	??0EFileEncodeContext@@QAE@PAVEWriteFileObj@@K@Z ; EFileEncodeContext::EFileEncodeContext
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L31382
$L31381:
	mov	DWORD PTR -24+[ebp], 0
$L31382:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR -24+[ebp]
	mov	DWORD PTR [ecx+4448], edx
; Line 414
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+4]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4452], eax
; Line 415
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 184				; 000000b8H
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4452]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4452]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+4]
	test	eax, eax
	je	SHORT $L31177
; Line 417
	xor	al, al
	jmp	$L31169
$L31177:
; Line 419
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 4512				; 000011a0H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+4452]
	call	?SetCompressionParameter@MIOEncoder@@QAEXABUPARAMETER@1@@Z ; MIOEncoder::SetCompressionParameter
$L31174:
; Line 423
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 1
	test	eax, eax
	je	SHORT $L31178
; Line 425
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 116				; 00000074H
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?CreateImageBuffer@ERIAnimationWriter@@IAEPAURASTER_IMAGE_INFO@@ABUERI_INFO_HEADER@@@Z ; ERIAnimationWriter::CreateImageBuffer
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+4456], eax
; Line 426
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 116				; 00000074H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?CreateImageBuffer@ERIAnimationWriter@@IAEPAURASTER_IMAGE_INFO@@ABUERI_INFO_HEADER@@@Z ; ERIAnimationWriter::CreateImageBuffer
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4460], eax
$L31178:
; Line 430
	push	0
	push	0
	push	1
	push	0
	call	DWORD PTR __imp__CreateEventA@16
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+4468], eax
; Line 431
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4468], 0
	jne	SHORT $L31179
; Line 433
	xor	al, al
	jmp	$L31169
$L31179:
; Line 436
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4476				; 0000117cH
	push	ecx
	push	0
	mov	edx, DWORD PTR _this$[ebp]
	push	edx
	push	OFFSET FLAT:?ThreadProc@ERIAnimationWriter@@KGKPAX@Z ; ERIAnimationWriter::ThreadProc
	push	0
	push	0
	call	DWORD PTR __imp__CreateThread@24
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4472], eax
; Line 437
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+4472], 0
	jne	SHORT $L31180
; Line 439
	xor	al, al
	jmp	$L31169
$L31180:
; Line 442
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4472]
	mov	DWORD PTR _hEventList$[ebp], ecx
; Line 443
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4468]
	mov	DWORD PTR _hEventList$[ebp+4], eax
; Line 445
	push	-1
	push	0
	lea	ecx, DWORD PTR _hEventList$[ebp]
	push	ecx
	push	2
	call	DWORD PTR __imp__WaitForMultipleObjects@16
	mov	DWORD PTR _dwWaitResult$[ebp], eax
; Line 446
	cmp	DWORD PTR _dwWaitResult$[ebp], 0
	jne	SHORT $L31184
; Line 448
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4468]
	push	eax
	call	DWORD PTR __imp__CloseHandle@4
; Line 449
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4472], 0
; Line 450
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+4468], 0
; Line 451
	xor	al, al
	jmp	SHORT $L31169
$L31184:
; Line 453
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+8], 3
; Line 456
	push	OFFSET FLAT:$SG31187
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z ; ERIWriteFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31186
; Line 458
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?EndStream@ERIAnimationWriter@@QAE_NK@Z	; ERIAnimationWriter::EndStream
; Line 459
	xor	al, al
	jmp	SHORT $L31169
$L31186:
; Line 462
	mov	al, 1
$L31169:
; Line 463
	mov	esp, ebp
	pop	ebp
	ret	0
?BeginStream@ERIAnimationWriter@@QAE_NXZ ENDP		; ERIAnimationWriter::BeginStream
_TEXT	ENDS
PUBLIC	?SetImageCompressionParameter@ERIAnimationWriter@@QAEXABUPARAMETER@ERIEncoder@@@Z ; ERIAnimationWriter::SetImageCompressionParameter
_TEXT	SEGMENT
_eriep$ = 8
_this$ = -4
?SetImageCompressionParameter@ERIAnimationWriter@@QAEXABUPARAMETER@ERIEncoder@@@Z PROC NEAR ; ERIAnimationWriter::SetImageCompressionParameter
; Line 470
	push	ebp
	mov	ebp, esp
	push	ecx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 471
	mov	esi, DWORD PTR _eriep$[ebp]
	mov	edi, DWORD PTR _this$[ebp]
	add	edi, 4480				; 00001180H
	mov	ecx, 8
	rep movsd
; Line 473
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4440], 0
	je	SHORT $L31191
; Line 474
	mov	ecx, DWORD PTR _eriep$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+4440]
	call	?SetCompressionParameter@ERIEncoder@@QAEXABUPARAMETER@1@@Z ; ERIEncoder::SetCompressionParameter
$L31191:
; Line 475
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4444], 0
	je	SHORT $L31192
; Line 476
	mov	ecx, DWORD PTR _eriep$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+4444]
	call	?SetCompressionParameter@ERIEncoder@@QAEXABUPARAMETER@1@@Z ; ERIEncoder::SetCompressionParameter
$L31192:
; Line 477
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?SetImageCompressionParameter@ERIAnimationWriter@@QAEXABUPARAMETER@ERIEncoder@@@Z ENDP ; ERIAnimationWriter::SetImageCompressionParameter
_TEXT	ENDS
PUBLIC	?SetSoundCompressionParameter@ERIAnimationWriter@@QAEXABUPARAMETER@MIOEncoder@@@Z ; ERIAnimationWriter::SetSoundCompressionParameter
_TEXT	SEGMENT
_mioep$ = 8
_this$ = -4
?SetSoundCompressionParameter@ERIAnimationWriter@@QAEXABUPARAMETER@MIOEncoder@@@Z PROC NEAR ; ERIAnimationWriter::SetSoundCompressionParameter
; Line 484
	push	ebp
	mov	ebp, esp
	push	ecx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 485
	mov	esi, DWORD PTR _mioep$[ebp]
	mov	edi, DWORD PTR _this$[ebp]
	add	edi, 4512				; 000011a0H
	mov	ecx, 8
	rep movsd
; Line 487
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4452], 0
	je	SHORT $L31196
; Line 488
	mov	ecx, DWORD PTR _mioep$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+4452]
	call	?SetCompressionParameter@MIOEncoder@@QAEXABUPARAMETER@1@@Z ; MIOEncoder::SetCompressionParameter
$L31196:
; Line 489
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?SetSoundCompressionParameter@ERIAnimationWriter@@QAEXABUPARAMETER@MIOEncoder@@@Z ENDP ; ERIAnimationWriter::SetSoundCompressionParameter
_TEXT	ENDS
PUBLIC	?WritePaletteTable@ERIAnimationWriter@@QAE_NPBTENTIS_PALETTE@@I@Z ; ERIAnimationWriter::WritePaletteTable
_DATA	SEGMENT
	ORG $+3
$SG31204 DB	'Palette ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_paltbl$ = 8
_nLength$ = 12
_this$ = -4
?WritePaletteTable@ERIAnimationWriter@@QAE_NPBTENTIS_PALETTE@@I@Z PROC NEAR ; ERIAnimationWriter::WritePaletteTable
; Line 496
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 497
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 3
	je	SHORT $L31201
; Line 499
	xor	al, al
	jmp	SHORT $L31200
$L31201:
; Line 501
	push	OFFSET FLAT:$SG31204
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z ; ERIWriteFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31203
; Line 503
	xor	al, al
	jmp	SHORT $L31200
$L31203:
; Line 505
	mov	ecx, DWORD PTR _nLength$[ebp]
	shl	ecx, 2
	push	ecx
	mov	edx, DWORD PTR _paltbl$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+12]
	call	DWORD PTR [edx+4]
; Line 506
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AscendRecord@ERIWriteFile@@QAEXXZ	; ERIWriteFile::AscendRecord
; Line 508
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	or	ecx, 16					; 00000010H
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+32], ecx
; Line 510
	mov	al, 1
$L31200:
; Line 511
	mov	esp, ebp
	pop	ebp
	ret	8
?WritePaletteTable@ERIAnimationWriter@@QAE_NPBTENTIS_PALETTE@@I@Z ENDP ; ERIAnimationWriter::WritePaletteTable
_TEXT	ENDS
PUBLIC	?WritePreviewData@ERIAnimationWriter@@QAE_NABURASTER_IMAGE_INFO@@K@Z ; ERIAnimationWriter::WritePreviewData
EXTRN	??0ERIEncoder@@QAE@XZ:NEAR			; ERIEncoder::ERIEncoder
EXTRN	??1ERIEncoder@@UAE@XZ:NEAR			; ERIEncoder::~ERIEncoder
EXTRN	?Initialize@ERIEncoder@@UAEHABUERI_INFO_HEADER@@@Z:NEAR ; ERIEncoder::Initialize
EXTRN	?EncodeImage@ERIEncoder@@UAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z:NEAR ; ERIEncoder::EncodeImage
EXTRN	??1EFileEncodeContext@@UAE@XZ:NEAR		; EFileEncodeContext::~EFileEncodeContext
_DATA	SEGMENT
	ORG $+3
$SG31213 DB	'Preview ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_rii$ = 8
_fdwFlags$ = 12
_this$ = -2552
_fSuccessed$ = -4
_context$31218 = -2092
_encoder$31219 = -2548
?WritePreviewData@ERIAnimationWriter@@QAE_NABURASTER_IMAGE_INFO@@K@Z PROC NEAR ; ERIAnimationWriter::WritePreviewData
; Line 518
	push	ebp
	mov	ebp, esp
	sub	esp, 2552				; 000009f8H
	mov	DWORD PTR _this$[ebp], ecx
; Line 519
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 3
	je	SHORT $L31210
; Line 521
	xor	al, al
	jmp	$L31209
$L31210:
; Line 523
	push	OFFSET FLAT:$SG31213
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z ; ERIWriteFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31212
; Line 525
	xor	al, al
	jmp	$L31209
$L31212:
; Line 530
	mov	BYTE PTR _fSuccessed$[ebp], 0
$L31215:
; Line 533
	push	65536					; 00010000H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	lea	ecx, DWORD PTR _context$31218[ebp]
	call	??0EFileEncodeContext@@QAE@PAVEWriteFileObj@@K@Z ; EFileEncodeContext::EFileEncodeContext
; Line 534
	lea	ecx, DWORD PTR _encoder$31219[ebp]
	call	??0ERIEncoder@@QAE@XZ			; ERIEncoder::ERIEncoder
; Line 536
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 48					; 00000030H
	push	edx
	lea	ecx, DWORD PTR _encoder$31219[ebp]
	call	?Initialize@ERIEncoder@@UAEHABUERI_INFO_HEADER@@@Z ; ERIEncoder::Initialize
	test	eax, eax
	je	SHORT $L31220
	lea	ecx, DWORD PTR _encoder$31219[ebp]
	call	??1ERIEncoder@@UAE@XZ			; ERIEncoder::~ERIEncoder
	lea	ecx, DWORD PTR _context$31218[ebp]
	call	??1EFileEncodeContext@@UAE@XZ		; EFileEncodeContext::~EFileEncodeContext
; Line 538
	jmp	SHORT $L31217
$L31220:
; Line 540
	mov	eax, DWORD PTR _fdwFlags$[ebp]
	push	eax
	lea	ecx, DWORD PTR _context$31218[ebp]
	push	ecx
	mov	edx, DWORD PTR _rii$[ebp]
	push	edx
	lea	ecx, DWORD PTR _encoder$31219[ebp]
	call	?EncodeImage@ERIEncoder@@UAEHABURASTER_IMAGE_INFO@@AAVRLHEncodeContext@@K@Z ; ERIEncoder::EncodeImage
	test	eax, eax
	je	SHORT $L31221
	lea	ecx, DWORD PTR _encoder$31219[ebp]
	call	??1ERIEncoder@@UAE@XZ			; ERIEncoder::~ERIEncoder
	lea	ecx, DWORD PTR _context$31218[ebp]
	call	??1EFileEncodeContext@@UAE@XZ		; EFileEncodeContext::~EFileEncodeContext
; Line 542
	jmp	SHORT $L31217
$L31221:
; Line 545
	mov	BYTE PTR _fSuccessed$[ebp], 1
	lea	ecx, DWORD PTR _encoder$31219[ebp]
	call	??1ERIEncoder@@UAE@XZ			; ERIEncoder::~ERIEncoder
	lea	ecx, DWORD PTR _context$31218[ebp]
	call	??1EFileEncodeContext@@UAE@XZ		; EFileEncodeContext::~EFileEncodeContext
; Line 547
	xor	eax, eax
	test	eax, eax
	jne	$L31215
$L31217:
; Line 549
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AscendRecord@ERIWriteFile@@QAEXXZ	; ERIWriteFile::AscendRecord
; Line 551
	mov	al, BYTE PTR _fSuccessed$[ebp]
$L31209:
; Line 552
	mov	esp, ebp
	pop	ebp
	ret	8
?WritePreviewData@ERIAnimationWriter@@QAE_NABURASTER_IMAGE_INFO@@K@Z ENDP ; ERIAnimationWriter::WritePreviewData
_TEXT	ENDS
PUBLIC	?WriteWaveData@ERIAnimationWriter@@QAE_NPBXK@Z	; ERIAnimationWriter::WriteWaveData
_DATA	SEGMENT
	ORG $+3
$SG31229 DB	'SoundStm', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ptrWaveBuf$ = 8
_dwSampleCount$ = 12
_this$ = -16
_fSuccessed$ = -4
_miodh$ = -12
?WriteWaveData@ERIAnimationWriter@@QAE_NPBXK@Z PROC NEAR ; ERIAnimationWriter::WriteWaveData
; Line 559
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 560
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 3
	je	SHORT $L31226
; Line 562
	xor	al, al
	jmp	$L31225
$L31226:
; Line 564
	push	OFFSET FLAT:$SG31229
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z ; ERIWriteFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31228
; Line 566
	xor	al, al
	jmp	$L31225
$L31228:
; Line 571
	mov	BYTE PTR _fSuccessed$[ebp], 0
; Line 573
	mov	BYTE PTR _miodh$[ebp], 1
; Line 574
	mov	BYTE PTR _miodh$[ebp+1], 0
; Line 575
	mov	BYTE PTR _miodh$[ebp+2], 0
; Line 576
	mov	BYTE PTR _miodh$[ebp+3], 0
; Line 577
	mov	ecx, DWORD PTR _dwSampleCount$[ebp]
	mov	DWORD PTR _miodh$[ebp+4], ecx
; Line 579
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+228], 0
	jne	SHORT $L31234
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+236], 0
	je	SHORT $L31233
$L31234:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	esi, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [ecx+236]
	xor	edx, edx
	div	DWORD PTR [esi+228]
	test	edx, edx
	jne	SHORT $L31232
$L31233:
; Line 581
	mov	BYTE PTR _miodh$[ebp+1], 1
$L31232:
; Line 583
	push	8
	lea	edx, DWORD PTR _miodh$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+12]
	call	DWORD PTR [edx+4]
	cmp	eax, 8
	jne	SHORT $L31235
; Line 585
	mov	eax, DWORD PTR _ptrWaveBuf$[ebp]
	push	eax
	lea	ecx, DWORD PTR _miodh$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4448]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+4452]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4452]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+12]
	test	eax, eax
	jne	SHORT $L31236
; Line 587
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+236]
	add	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+236], ecx
; Line 588
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+244]
	add	ecx, DWORD PTR _dwSampleCount$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+244], ecx
; Line 589
	mov	BYTE PTR _fSuccessed$[ebp], 1
$L31236:
$L31235:
; Line 593
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AscendRecord@ERIWriteFile@@QAEXXZ	; ERIWriteFile::AscendRecord
; Line 595
	mov	al, BYTE PTR _fSuccessed$[ebp]
$L31225:
; Line 596
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
?WriteWaveData@ERIAnimationWriter@@QAE_NPBXK@Z ENDP	; ERIAnimationWriter::WriteWaveData
_TEXT	ENDS
PUBLIC	?WriteImageData@ERIAnimationWriter@@QAE_NABURASTER_IMAGE_INFO@@K@Z ; ERIAnimationWriter::WriteImageData
EXTRN	__imp__ResetEvent@4:NEAR
EXTRN	_eriSubtractionOfFrame:NEAR
EXTRN	_eriCopyImage:NEAR
_DATA	SEGMENT
	ORG $+3
$SG31260 DB	'ImageFrm', 00H
	ORG $+3
$SG31264 DB	'ImageFrm', 00H
	ORG $+3
$SG31267 DB	'DiffeFrm', 00H
_DATA	ENDS
_TEXT	SEGMENT
_rii$ = 8
_fdwFlags$ = 12
_this$ = -36
_fKeyFrame$ = -8
_fSuccessed$ = -4
_hEventList$31250 = -28
_dwWaitResult$31251 = -32
_pEncodedData$ = -12
_pRecID$ = -16
_pNextBuf$ = -20
?WriteImageData@ERIAnimationWriter@@QAE_NABURASTER_IMAGE_INFO@@K@Z PROC NEAR ; ERIAnimationWriter::WriteImageData
; Line 603
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	mov	DWORD PTR _this$[ebp], ecx
; Line 604
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 3
	je	SHORT $L31241
; Line 606
	xor	al, al
	jmp	$L31240
$L31241:
; Line 612
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+224], 0
	jne	SHORT $L31383
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+232], 0
	je	SHORT $L31384
$L31383:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+232]
	xor	edx, edx
	div	DWORD PTR [ecx+224]
	test	edx, edx
	je	SHORT $L31384
	mov	DWORD PTR -40+[ebp], 0
	jmp	SHORT $L31385
$L31384:
	mov	DWORD PTR -40+[ebp], 1
$L31385:
	mov	dl, BYTE PTR -40+[ebp]
	mov	BYTE PTR _fKeyFrame$[ebp], dl
; Line 615
	mov	eax, DWORD PTR _fKeyFrame$[ebp]
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	$L31243
; Line 619
	mov	ecx, DWORD PTR _rii$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4460]
	push	eax
	call	_eriCopyImage
	add	esp, 8
; Line 620
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4456]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4460]
	push	ecx
	call	_eriSubtractionOfFrame
	add	esp, 8
; Line 623
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 2344				; 00000928H
	call	?Delete@EEncodeContext@ERIAnimationWriter@@QAEXXZ ; ERIAnimationWriter::EEncodeContext::Delete
; Line 624
	mov	edx, DWORD PTR _this$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+4464]
	test	eax, eax
	je	SHORT $L31244
; Line 626
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4468]
	push	edx
	call	DWORD PTR __imp__ResetEvent@4
; Line 628
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4460]
	push	ecx
	mov	edx, DWORD PTR _fdwFlags$[ebp]
	push	edx
	push	1024					; 00000400H
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4476]
	push	ecx
	call	DWORD PTR __imp__PostThreadMessageA@16
; Line 630
	jmp	SHORT $L31246
$L31244:
; Line 634
	mov	edx, DWORD PTR _fdwFlags$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 2344				; 00000928H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4460]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4444]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4444]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+12]
	test	eax, eax
	je	SHORT $L31247
; Line 636
	xor	al, al
	jmp	$L31240
$L31247:
$L31246:
$L31243:
; Line 642
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 248				; 000000f8H
	call	?Delete@EEncodeContext@ERIAnimationWriter@@QAEXXZ ; ERIAnimationWriter::EEncodeContext::Delete
; Line 644
	mov	eax, DWORD PTR _fdwFlags$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 248				; 000000f8H
	push	ecx
	mov	edx, DWORD PTR _rii$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4440]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4440]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+12]
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	BYTE PTR _fSuccessed$[ebp], al
; Line 647
	mov	eax, DWORD PTR _this$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+4464]
	test	ecx, ecx
	je	SHORT $L31249
	mov	edx, DWORD PTR _fKeyFrame$[ebp]
	and	edx, 255				; 000000ffH
	test	edx, edx
	jne	SHORT $L31249
; Line 650
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4472]
	mov	DWORD PTR _hEventList$31250[ebp], ecx
; Line 651
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4468]
	mov	DWORD PTR _hEventList$31250[ebp+4], eax
; Line 653
	push	-1
	push	0
	lea	ecx, DWORD PTR _hEventList$31250[ebp]
	push	ecx
	push	2
	call	DWORD PTR __imp__WaitForMultipleObjects@16
	mov	DWORD PTR _dwWaitResult$31251[ebp], eax
; Line 655
	cmp	DWORD PTR _dwWaitResult$31251[ebp], 0
	je	SHORT $L31254
	mov	edx, DWORD PTR _this$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+4465]
	test	eax, eax
	jne	SHORT $L31253
$L31254:
; Line 657
	mov	BYTE PTR _fSuccessed$[ebp], 0
$L31253:
$L31249:
; Line 660
	mov	ecx, DWORD PTR _fSuccessed$[ebp]
	and	ecx, 255				; 000000ffH
	test	ecx, ecx
	jne	SHORT $L31255
; Line 662
	xor	al, al
	jmp	$L31240
$L31255:
; Line 666
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+232]
	add	eax, 1
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+232], eax
; Line 667
	mov	edx, DWORD PTR _rii$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4456]
	push	ecx
	call	_eriCopyImage
	add	esp, 8
; Line 673
	mov	edx, DWORD PTR _fKeyFrame$[ebp]
	and	edx, 255				; 000000ffH
	test	edx, edx
	je	SHORT $L31258
; Line 675
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 248				; 000000f8H
	mov	DWORD PTR _pEncodedData$[ebp], eax
; Line 676
	mov	DWORD PTR _pRecID$[ebp], OFFSET FLAT:$SG31260
; Line 678
	jmp	SHORT $L31261
$L31258:
; Line 680
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [ecx+2340]
	cmp	eax, DWORD PTR [edx+4436]
	jae	SHORT $L31262
; Line 682
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 248				; 000000f8H
	mov	DWORD PTR _pEncodedData$[ebp], ecx
; Line 683
	mov	DWORD PTR _pRecID$[ebp], OFFSET FLAT:$SG31264
; Line 685
	jmp	SHORT $L31265
$L31262:
; Line 687
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 2344				; 00000928H
	mov	DWORD PTR _pEncodedData$[ebp], edx
; Line 688
	mov	DWORD PTR _pRecID$[ebp], OFFSET FLAT:$SG31267
$L31265:
$L31261:
; Line 693
	mov	eax, DWORD PTR _pRecID$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z ; ERIWriteFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31268
; Line 695
	xor	al, al
	jmp	SHORT $L31240
$L31268:
; Line 698
	mov	ecx, DWORD PTR _pEncodedData$[ebp]
	mov	edx, DWORD PTR [ecx+2084]
	mov	DWORD PTR _pNextBuf$[ebp], edx
$L31271:
; Line 699
	cmp	DWORD PTR _pNextBuf$[ebp], 0
	je	SHORT $L31272
; Line 701
	mov	eax, DWORD PTR _pNextBuf$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _pNextBuf$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+12]
	call	DWORD PTR [eax+4]
; Line 702
	mov	ecx, DWORD PTR _pNextBuf$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _pNextBuf$[ebp], edx
; Line 703
	jmp	SHORT $L31271
$L31272:
; Line 705
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AscendRecord@ERIWriteFile@@QAEXXZ	; ERIWriteFile::AscendRecord
; Line 708
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 248				; 000000f8H
	call	?Delete@EEncodeContext@ERIAnimationWriter@@QAEXXZ ; ERIAnimationWriter::EEncodeContext::Delete
; Line 710
	mov	eax, DWORD PTR _fKeyFrame$[ebp]
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31273
; Line 712
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 2344				; 00000928H
	call	?Delete@EEncodeContext@ERIAnimationWriter@@QAEXXZ ; ERIAnimationWriter::EEncodeContext::Delete
$L31273:
; Line 715
	mov	al, BYTE PTR _fSuccessed$[ebp]
$L31240:
; Line 716
	mov	esp, ebp
	pop	ebp
	ret	8
?WriteImageData@ERIAnimationWriter@@QAE_NABURASTER_IMAGE_INFO@@K@Z ENDP ; ERIAnimationWriter::WriteImageData
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG31290 DB	'Header  ', 00H
	ORG $+3
$SG31291 DB	'FileHdr ', 00H
	ORG $+3
$SG31294 DB	'SoundInf', 00H
_DATA	ENDS
_TEXT	SEGMENT
_dwTotalTime$ = 8
_this$ = -12
$T31386 = -4
$T31387 = -8
?EndStream@ERIAnimationWriter@@QAE_NK@Z PROC NEAR	; ERIAnimationWriter::EndStream
; Line 722
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 723
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 3
	je	SHORT $L31277
; Line 725
	xor	al, al
	jmp	$L31276
$L31277:
; Line 729
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+4472], 0
	je	SHORT $L31278
; Line 731
	push	0
	push	0
	push	1025					; 00000401H
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4476]
	push	eax
	call	DWORD PTR __imp__PostThreadMessageA@16
; Line 732
	push	-1
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4472]
	push	edx
	call	DWORD PTR __imp__WaitForSingleObject@8
; Line 733
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4472]
	push	ecx
	call	DWORD PTR __imp__CloseHandle@4
; Line 734
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+4472], 0
$L31278:
; Line 736
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4468], 0
	je	SHORT $L31279
; Line 738
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4468]
	push	edx
	call	DWORD PTR __imp__CloseHandle@4
; Line 739
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+4468], 0
$L31279:
; Line 743
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 1
	test	edx, edx
	je	SHORT $L31280
; Line 745
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 248				; 000000f8H
	call	?Delete@EEncodeContext@ERIAnimationWriter@@QAEXXZ ; ERIAnimationWriter::EEncodeContext::Delete
; Line 746
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 2344				; 00000928H
	call	?Delete@EEncodeContext@ERIAnimationWriter@@QAEXXZ ; ERIAnimationWriter::EEncodeContext::Delete
; Line 747
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4440]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4440]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+8]
; Line 748
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4444]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4444]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+8]
$L31280:
; Line 750
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4448], 0
	je	SHORT $L31281
; Line 752
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4448]
	mov	DWORD PTR $T31387[ebp], edx
	mov	eax, DWORD PTR $T31387[ebp]
	mov	DWORD PTR $T31386[ebp], eax
	cmp	DWORD PTR $T31386[ebp], 0
	je	SHORT $L31388
	push	1
	mov	ecx, DWORD PTR $T31386[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR $T31386[ebp]
	call	DWORD PTR [edx]
	mov	DWORD PTR -16+[ebp], eax
	jmp	SHORT $L31389
$L31388:
	mov	DWORD PTR -16+[ebp], 0
$L31389:
; Line 753
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+4448], 0
$L31281:
; Line 757
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+4456], 0
	je	SHORT $L31284
; Line 759
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4456]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteImageBuffer@ERIAnimationWriter@@IAEXPAURASTER_IMAGE_INFO@@@Z ; ERIAnimationWriter::DeleteImageBuffer
; Line 760
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4456], 0
$L31284:
; Line 762
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+4460], 0
	je	SHORT $L31285
; Line 764
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4460]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteImageBuffer@ERIAnimationWriter@@IAEXPAURASTER_IMAGE_INFO@@@Z ; ERIAnimationWriter::DeleteImageBuffer
; Line 765
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+4460], 0
$L31285:
; Line 769
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AscendRecord@ERIWriteFile@@QAEXXZ	; ERIWriteFile::AscendRecord
; Line 770
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+8], 1
; Line 773
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+12]
	call	DWORD PTR [eax+16]
; Line 776
	push	OFFSET FLAT:$SG31290
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z ; ERIWriteFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L31289
	push	OFFSET FLAT:$SG31291
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z ; ERIWriteFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31288
$L31289:
; Line 778
	xor	al, al
	jmp	$L31276
$L31288:
; Line 780
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+232]
	mov	DWORD PTR [ecx+40], eax
; Line 781
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _dwTotalTime$[ebp]
	mov	DWORD PTR [ecx+44], edx
; Line 782
	push	20					; 00000014H
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 28					; 0000001cH
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+12]
	call	DWORD PTR [eax+4]
; Line 783
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AscendRecord@ERIWriteFile@@QAEXXZ	; ERIWriteFile::AscendRecord
; Line 786
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	and	edx, 256				; 00000100H
	test	edx, edx
	je	SHORT $L31292
; Line 788
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+240]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+12]
	call	DWORD PTR [eax+16]
; Line 789
	push	OFFSET FLAT:$SG31294
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z ; ERIWriteFile::DescendRecord
; Line 790
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+244]
	mov	DWORD PTR [ecx+212], eax
; Line 791
	push	40					; 00000028H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 184				; 000000b8H
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+12]
	call	DWORD PTR [eax+4]
; Line 792
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AscendRecord@ERIWriteFile@@QAEXXZ	; ERIWriteFile::AscendRecord
$L31292:
; Line 795
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+12]
	call	DWORD PTR [edx+16]
; Line 796
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AscendRecord@ERIWriteFile@@QAEXXZ	; ERIWriteFile::AscendRecord
; Line 798
	mov	al, 1
$L31276:
; Line 799
	mov	esp, ebp
	pop	ebp
	ret	4
?EndStream@ERIAnimationWriter@@QAE_NK@Z ENDP		; ERIAnimationWriter::EndStream
_eih$ = 8
_this$ = -8
_prii$ = -4
?CreateImageBuffer@ERIAnimationWriter@@IAEPAURASTER_IMAGE_INFO@@ABUERI_INFO_HEADER@@@Z PROC NEAR ; ERIAnimationWriter::CreateImageBuffer
; Line 806
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 809
	push	24					; 00000018H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR _prii$[ebp], eax
; Line 812
	mov	eax, DWORD PTR _prii$[ebp]
	mov	ecx, DWORD PTR _eih$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [eax], edx
; Line 813
	mov	eax, DWORD PTR _prii$[ebp]
	mov	ecx, DWORD PTR _eih$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	DWORD PTR [eax+8], edx
; Line 815
	mov	eax, DWORD PTR _eih$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jge	SHORT $L31390
	mov	ecx, DWORD PTR _eih$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	neg	edx
	mov	DWORD PTR -12+[ebp], edx
	jmp	SHORT $L31391
$L31390:
	mov	eax, DWORD PTR _eih$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	mov	DWORD PTR -12+[ebp], ecx
$L31391:
	mov	edx, DWORD PTR _prii$[ebp]
	mov	eax, DWORD PTR -12+[ebp]
	mov	DWORD PTR [edx+12], eax
; Line 816
	mov	ecx, DWORD PTR _prii$[ebp]
	mov	edx, DWORD PTR _eih$[ebp]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR [ecx+16], eax
; Line 818
	mov	ecx, DWORD PTR _prii$[ebp]
	mov	edx, DWORD PTR _prii$[ebp]
	mov	eax, DWORD PTR [ecx+8]
	imul	eax, DWORD PTR [edx+16]
	shr	eax, 3
	add	eax, 3
	and	al, -4					; fffffffcH
	mov	ecx, DWORD PTR _prii$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 822
	mov	edx, DWORD PTR _prii$[ebp]
	mov	eax, DWORD PTR _prii$[ebp]
	mov	ecx, DWORD PTR [edx+20]
	imul	ecx, DWORD PTR [eax+12]
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _prii$[ebp]
	mov	DWORD PTR [edx+4], eax
; Line 824
	mov	eax, DWORD PTR _prii$[ebp]
; Line 825
	mov	esp, ebp
	pop	ebp
	ret	4
?CreateImageBuffer@ERIAnimationWriter@@IAEPAURASTER_IMAGE_INFO@@ABUERI_INFO_HEADER@@@Z ENDP ; ERIAnimationWriter::CreateImageBuffer
_prii$ = 8
_this$ = -8
$T31392 = -4
?DeleteImageBuffer@ERIAnimationWriter@@IAEXPAURASTER_IMAGE_INFO@@@Z PROC NEAR ; ERIAnimationWriter::DeleteImageBuffer
; Line 831
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 832
	cmp	DWORD PTR _prii$[ebp], 0
	je	SHORT $L31304
; Line 834
	mov	eax, DWORD PTR _prii$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 835
	mov	edx, DWORD PTR _prii$[ebp]
	mov	DWORD PTR $T31392[ebp], edx
	mov	eax, DWORD PTR $T31392[ebp]
	push	eax
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L31304:
; Line 837
	mov	esp, ebp
	pop	ebp
	ret	4
?DeleteImageBuffer@ERIAnimationWriter@@IAEXPAURASTER_IMAGE_INFO@@@Z ENDP ; ERIAnimationWriter::DeleteImageBuffer
_this$ = -8
$T31393 = -4
?CreateERIEncoder@ERIAnimationWriter@@MAEPAVERIEncoder@@XZ PROC NEAR ; ERIAnimationWriter::CreateERIEncoder
; Line 843
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 844
	push	456					; 000001c8H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR $T31393[ebp], eax
	cmp	DWORD PTR $T31393[ebp], 0
	je	SHORT $L31394
	mov	ecx, DWORD PTR $T31393[ebp]
	call	??0ERIEncoder@@QAE@XZ			; ERIEncoder::ERIEncoder
	mov	DWORD PTR -12+[ebp], eax
	jmp	SHORT $L31395
$L31394:
	mov	DWORD PTR -12+[ebp], 0
$L31395:
	mov	eax, DWORD PTR -12+[ebp]
; Line 845
	mov	esp, ebp
	pop	ebp
	ret	0
?CreateERIEncoder@ERIAnimationWriter@@MAEPAVERIEncoder@@XZ ENDP ; ERIAnimationWriter::CreateERIEncoder
_TEXT	ENDS
EXTRN	??0MIOEncoder@@QAE@XZ:NEAR			; MIOEncoder::MIOEncoder
_TEXT	SEGMENT
_this$ = -8
$T31396 = -4
?CreateMIOEncoder@ERIAnimationWriter@@MAEPAVMIOEncoder@@XZ PROC NEAR ; ERIAnimationWriter::CreateMIOEncoder
; Line 851
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 852
	push	200					; 000000c8H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR $T31396[ebp], eax
	cmp	DWORD PTR $T31396[ebp], 0
	je	SHORT $L31397
	mov	ecx, DWORD PTR $T31396[ebp]
	call	??0MIOEncoder@@QAE@XZ			; MIOEncoder::MIOEncoder
	mov	DWORD PTR -12+[ebp], eax
	jmp	SHORT $L31398
$L31397:
	mov	DWORD PTR -12+[ebp], 0
$L31398:
	mov	eax, DWORD PTR -12+[ebp]
; Line 853
	mov	esp, ebp
	pop	ebp
	ret	0
?CreateMIOEncoder@ERIAnimationWriter@@MAEPAVMIOEncoder@@XZ ENDP ; ERIAnimationWriter::CreateMIOEncoder
_TEXT	ENDS
PUBLIC	?GetWrittenFrameCount@ERIAnimationWriter@@QBEKXZ ; ERIAnimationWriter::GetWrittenFrameCount
_TEXT	SEGMENT
_this$ = -4
?GetWrittenFrameCount@ERIAnimationWriter@@QBEKXZ PROC NEAR ; ERIAnimationWriter::GetWrittenFrameCount
; Line 859
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 860
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+232]
; Line 861
	mov	esp, ebp
	pop	ebp
	ret	0
?GetWrittenFrameCount@ERIAnimationWriter@@QBEKXZ ENDP	; ERIAnimationWriter::GetWrittenFrameCount
_TEXT	ENDS
PUBLIC	?EnableDualEncoding@ERIAnimationWriter@@QAEX_N@Z ; ERIAnimationWriter::EnableDualEncoding
_TEXT	SEGMENT
_fDualEncoding$ = 8
_this$ = -4
?EnableDualEncoding@ERIAnimationWriter@@QAEX_N@Z PROC NEAR ; ERIAnimationWriter::EnableDualEncoding
; Line 867
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 868
	mov	eax, DWORD PTR _this$[ebp]
	mov	cl, BYTE PTR _fDualEncoding$[ebp]
	mov	BYTE PTR [eax+4464], cl
; Line 869
	mov	esp, ebp
	pop	ebp
	ret	4
?EnableDualEncoding@ERIAnimationWriter@@QAEX_N@Z ENDP	; ERIAnimationWriter::EnableDualEncoding
_TEXT	ENDS
PUBLIC	?EncodingThreadProc@ERIAnimationWriter@@IAEKXZ	; ERIAnimationWriter::EncodingThreadProc
_TEXT	SEGMENT
_parameter$ = 8
?ThreadProc@ERIAnimationWriter@@KGKPAX@Z PROC NEAR	; ERIAnimationWriter::ThreadProc
; Line 875
	push	ebp
	mov	ebp, esp
; Line 876
	mov	ecx, DWORD PTR _parameter$[ebp]
	call	?EncodingThreadProc@ERIAnimationWriter@@IAEKXZ ; ERIAnimationWriter::EncodingThreadProc
; Line 877
	pop	ebp
	ret	4
?ThreadProc@ERIAnimationWriter@@KGKPAX@Z ENDP		; ERIAnimationWriter::ThreadProc
_TEXT	ENDS
EXTRN	__imp__GetMessageA@16:NEAR
EXTRN	__imp__PeekMessageA@20:NEAR
EXTRN	__imp__SetEvent@4:NEAR
EXTRN	_eriInitializeTask:NEAR
EXTRN	_eriCloseTask:NEAR
_TEXT	SEGMENT
_this$ = -40
_msg$ = -28
_prii$31333 = -32
_fdwFlags$31335 = -36
?EncodingThreadProc@ERIAnimationWriter@@IAEKXZ PROC NEAR ; ERIAnimationWriter::EncodingThreadProc
; Line 880
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	mov	DWORD PTR _this$[ebp], ecx
; Line 881
	call	_eriInitializeTask
; Line 886
	push	0
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _msg$[ebp]
	push	eax
	call	DWORD PTR __imp__PeekMessageA@20
; Line 887
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+4465], 0
; Line 888
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4468]
	push	eax
	call	DWORD PTR __imp__SetEvent@4
$L31330:
; Line 890
	push	0
	push	0
	push	0
	lea	ecx, DWORD PTR _msg$[ebp]
	push	ecx
	call	DWORD PTR __imp__GetMessageA@16
	test	eax, eax
	je	SHORT $L31331
; Line 892
	cmp	DWORD PTR _msg$[ebp+4], 1024		; 00000400H
	jne	SHORT $L31332
; Line 897
	mov	edx, DWORD PTR _msg$[ebp+12]
	mov	DWORD PTR _prii$31333[ebp], edx
; Line 898
	mov	eax, DWORD PTR _msg$[ebp+8]
	mov	DWORD PTR _fdwFlags$31335[ebp], eax
; Line 901
	mov	ecx, DWORD PTR _fdwFlags$31335[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 2344				; 00000928H
	push	edx
	mov	eax, DWORD PTR _prii$31333[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+4444]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4444]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+12]
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+4465], al
; Line 903
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4468]
	push	eax
	call	DWORD PTR __imp__SetEvent@4
; Line 905
	jmp	SHORT $L31336
$L31332:
	cmp	DWORD PTR _msg$[ebp+4], 1025		; 00000401H
	jne	SHORT $L31337
; Line 907
	jmp	SHORT $L31331
$L31337:
$L31336:
; Line 909
	jmp	SHORT $L31330
$L31331:
; Line 911
	call	_eriCloseTask
; Line 913
	xor	eax, eax
; Line 914
	mov	esp, ebp
	pop	ebp
	ret	0
?EncodingThreadProc@ERIAnimationWriter@@IAEKXZ ENDP	; ERIAnimationWriter::EncodingThreadProc
_TEXT	ENDS
END
