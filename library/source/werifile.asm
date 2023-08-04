	TITLE	I:\EntisGLS\eri-chan\experi\werifile.cpp
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
;	COMDAT ??BEStringObj@ERIFile@@QBEPBDXZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ?CharPtr@EStringObj@ERIFile@@QBEPBDXZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??BEWStringObj@ERIWriteFile@@QBEPBGXZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ?GetLength@EWStringObj@ERIWriteFile@@QBEHXZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_GEWriteFileObj@@UAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_GEWriteFile@@UAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_GERIWriteFile@@UAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_7EWriteFileObj@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
;	COMDAT ??_7ERIWriteFile@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
;	COMDAT ??_7EWriteFile@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
CONST	SEGMENT
;_?szFileDetails@?1??Open@ERIWriteFile@@QAE_NPAVEWriteFileObj@@W4FileID@2@@Z@4PAY0DA@$$CBDA$S31224 DB 
_?szFileDetails@?1??Open@ERIWriteFile@@QAE_NPAVEWriteFileObj@@W4FileID@2@@Z@4PAY0DA@$$CBDA$S31224	LABEL	BYTE
	DB	'Entis Rasterized Image', 00H
	ORG $+25
	DB	'Music Interleaved and Orthogonal transformed', 00H
	ORG $+3
	DB	'Moving Entis Image', 00H
	ORG $+29
CONST	ENDS
PUBLIC	??0EWriteFileObj@@QAE@XZ			; EWriteFileObj::EWriteFileObj
PUBLIC	??_7EWriteFileObj@@6B@				; EWriteFileObj::`vftable'
PUBLIC	??_GEWriteFileObj@@UAEPAXI@Z			; EWriteFileObj::`scalar deleting destructor'
;PUBLIC	??_EEWriteFileObj@@UAEPAXI@Z			; EWriteFileObj::`vector deleting destructor'
EXTRN	__purecall:NEAR
;	COMDAT ??_7EWriteFileObj@@6B@
; File I:\EntisGLS\eri-chan\experi\werifile.cpp
CONST	SEGMENT
??_7EWriteFileObj@@6B@	LABEL	DWORD
; DD FLAT:??_EEWriteFileObj@@UAEPAXI@Z ; EWriteFileObj::`vftable'
	DD	FLAT:??_GEWriteFileObj@@UAEPAXI@Z
	DD	FLAT:__purecall
	DD	FLAT:__purecall
	DD	FLAT:__purecall
	DD	FLAT:__purecall
CONST	ENDS
_TEXT	SEGMENT
_this$ = -4
??0EWriteFileObj@@QAE@XZ PROC NEAR			; EWriteFileObj::EWriteFileObj
; File I:\EntisGLS\eri-chan\experi\werifile.cpp
; Line 27
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EWriteFileObj@@6B@ ; EWriteFileObj::`vftable'
; Line 28
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0EWriteFileObj@@QAE@XZ ENDP				; EWriteFileObj::EWriteFileObj
_TEXT	ENDS
PUBLIC	??1EWriteFileObj@@UAE@XZ			; EWriteFileObj::~EWriteFileObj
EXTRN	??3@YAXPAX@Z:NEAR				; operator delete
;	COMDAT ??_GEWriteFileObj@@UAEPAXI@Z
_TEXT	SEGMENT
___flags$ = 8
_this$ = -4
??_GEWriteFileObj@@UAEPAXI@Z PROC NEAR			; EWriteFileObj::`scalar deleting destructor', COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1EWriteFileObj@@UAE@XZ		; EWriteFileObj::~EWriteFileObj
	mov	eax, DWORD PTR ___flags$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L31046
	mov	ecx, DWORD PTR _this$[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L31046:
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??_GEWriteFileObj@@UAEPAXI@Z ENDP			; EWriteFileObj::`scalar deleting destructor'
_TEXT	ENDS
_TEXT	SEGMENT
_this$ = -4
??1EWriteFileObj@@UAE@XZ PROC NEAR			; EWriteFileObj::~EWriteFileObj
; Line 31
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EWriteFileObj@@6B@ ; EWriteFileObj::`vftable'
; Line 32
	mov	esp, ebp
	pop	ebp
	ret	0
??1EWriteFileObj@@UAE@XZ ENDP				; EWriteFileObj::~EWriteFileObj
_TEXT	ENDS
PUBLIC	??0EWriteFile@@QAE@XZ				; EWriteFile::EWriteFile
PUBLIC	?Write@EWriteFile@@UAEKPBXK@Z			; EWriteFile::Write
PUBLIC	?GetLength@EWriteFile@@UAEKXZ			; EWriteFile::GetLength
PUBLIC	?GetPointer@EWriteFile@@UAEKXZ			; EWriteFile::GetPointer
PUBLIC	?Seek@EWriteFile@@UAEXK@Z			; EWriteFile::Seek
PUBLIC	??_7EWriteFile@@6B@				; EWriteFile::`vftable'
PUBLIC	??_GEWriteFile@@UAEPAXI@Z			; EWriteFile::`scalar deleting destructor'
;PUBLIC	??_EEWriteFile@@UAEPAXI@Z			; EWriteFile::`vector deleting destructor'
;	COMDAT ??_7EWriteFile@@6B@
; File I:\EntisGLS\eri-chan\experi\werifile.cpp
CONST	SEGMENT
??_7EWriteFile@@6B@	LABEL	DWORD
;DD FLAT:??_EEWriteFile@@UAEPAXI@Z	; EWriteFile::`vftable'
	DD	FLAT:??_GEWriteFile@@UAEPAXI@Z
	DD	FLAT:?Write@EWriteFile@@UAEKPBXK@Z
	DD	FLAT:?GetLength@EWriteFile@@UAEKXZ
	DD	FLAT:?GetPointer@EWriteFile@@UAEKXZ
	DD	FLAT:?Seek@EWriteFile@@UAEXK@Z
CONST	ENDS
_TEXT	SEGMENT
_this$ = -4
??0EWriteFile@@QAE@XZ PROC NEAR				; EWriteFile::EWriteFile
; File I:\EntisGLS\eri-chan\experi\werifile.cpp
; Line 43
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0EWriteFileObj@@QAE@XZ		; EWriteFileObj::EWriteFileObj
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EWriteFile@@6B@ ; EWriteFile::`vftable'
; Line 44
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], -1
; Line 45
	mov	edx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [edx+8], 0
; Line 46
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0EWriteFile@@QAE@XZ ENDP				; EWriteFile::EWriteFile
_TEXT	ENDS
PUBLIC	??1EWriteFile@@UAE@XZ				; EWriteFile::~EWriteFile
;	COMDAT ??_GEWriteFile@@UAEPAXI@Z
_TEXT	SEGMENT
___flags$ = 8
_this$ = -4
??_GEWriteFile@@UAEPAXI@Z PROC NEAR			; EWriteFile::`scalar deleting destructor', COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1EWriteFile@@UAE@XZ			; EWriteFile::~EWriteFile
	mov	eax, DWORD PTR ___flags$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L31057
	mov	ecx, DWORD PTR _this$[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L31057:
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??_GEWriteFile@@UAEPAXI@Z ENDP				; EWriteFile::`scalar deleting destructor'
_TEXT	ENDS
PUBLIC	??0EWriteFile@@QAE@PAX@Z			; EWriteFile::EWriteFile
_TEXT	SEGMENT
_hFile$ = 8
_this$ = -4
??0EWriteFile@@QAE@PAX@Z PROC NEAR			; EWriteFile::EWriteFile
; Line 49
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0EWriteFileObj@@QAE@XZ		; EWriteFileObj::EWriteFileObj
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EWriteFile@@6B@ ; EWriteFile::`vftable'
; Line 50
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _hFile$[ebp]
	mov	DWORD PTR [ecx+4], edx
; Line 51
	mov	eax, DWORD PTR _this$[ebp]
	mov	BYTE PTR [eax+8], 0
; Line 52
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??0EWriteFile@@QAE@PAX@Z ENDP				; EWriteFile::EWriteFile
_TEXT	ENDS
PUBLIC	?Close@EWriteFile@@QAEXXZ			; EWriteFile::Close
_TEXT	SEGMENT
_this$ = -4
??1EWriteFile@@UAE@XZ PROC NEAR				; EWriteFile::~EWriteFile
; Line 58
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EWriteFile@@6B@ ; EWriteFile::`vftable'
; Line 59
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Close@EWriteFile@@QAEXXZ		; EWriteFile::Close
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1EWriteFileObj@@UAE@XZ		; EWriteFileObj::~EWriteFileObj
; Line 60
	mov	esp, ebp
	pop	ebp
	ret	0
??1EWriteFile@@UAE@XZ ENDP				; EWriteFile::~EWriteFile
_TEXT	ENDS
PUBLIC	?Open@EWriteFile@@QAE_NPBD@Z			; EWriteFile::Open
EXTRN	__imp__CreateFileA@28:NEAR
_TEXT	SEGMENT
_pszFile$ = 8
_this$ = -4
?Open@EWriteFile@@QAE_NPBD@Z PROC NEAR			; EWriteFile::Open
; Line 66
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 67
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Close@EWriteFile@@QAEXXZ		; EWriteFile::Close
; Line 78
	push	0
	push	128					; 00000080H
	push	2
	push	0
	push	0
	push	1073741824				; 40000000H
	mov	eax, DWORD PTR _pszFile$[ebp]
	push	eax
	call	DWORD PTR __imp__CreateFileA@28
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 79
	mov	edx, DWORD PTR _this$[ebp]
	xor	eax, eax
	cmp	DWORD PTR [edx+4], -1
	setne	al
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
	mov	edx, DWORD PTR _this$[ebp]
	mov	al, BYTE PTR [edx+8]
; Line 80
	mov	esp, ebp
	pop	ebp
	ret	4
?Open@EWriteFile@@QAE_NPBD@Z ENDP			; EWriteFile::Open
_TEXT	ENDS
PUBLIC	?Attach@EWriteFile@@QAEXPAX@Z			; EWriteFile::Attach
_TEXT	SEGMENT
_hFile$ = 8
_this$ = -4
?Attach@EWriteFile@@QAEXPAX@Z PROC NEAR			; EWriteFile::Attach
; Line 86
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 87
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Close@EWriteFile@@QAEXXZ		; EWriteFile::Close
; Line 89
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _hFile$[ebp]
	mov	DWORD PTR [eax+4], ecx
; Line 90
	mov	esp, ebp
	pop	ebp
	ret	4
?Attach@EWriteFile@@QAEXPAX@Z ENDP			; EWriteFile::Attach
_TEXT	ENDS
EXTRN	__imp__CloseHandle@4:NEAR
_TEXT	SEGMENT
_this$ = -4
?Close@EWriteFile@@QAEXXZ PROC NEAR			; EWriteFile::Close
; Line 96
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 97
	mov	eax, DWORD PTR _this$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+8]
	test	ecx, ecx
	je	SHORT $L31074
; Line 99
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	call	DWORD PTR __imp__CloseHandle@4
; Line 101
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], -1
; Line 102
	mov	edx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [edx+8], 0
$L31074:
; Line 104
	mov	esp, ebp
	pop	ebp
	ret	0
?Close@EWriteFile@@QAEXXZ ENDP				; EWriteFile::Close
_TEXT	ENDS
EXTRN	__imp__WriteFile@20:NEAR
_TEXT	SEGMENT
_ptrBuf$ = 8
_dwByte$ = 12
_this$ = -8
_dwWrittenBytes$ = -4
?Write@EWriteFile@@UAEKPBXK@Z PROC NEAR			; EWriteFile::Write
; Line 110
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 112
	push	0
	lea	eax, DWORD PTR _dwWrittenBytes$[ebp]
	push	eax
	mov	ecx, DWORD PTR _dwByte$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrBuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	call	DWORD PTR __imp__WriteFile@20
	test	eax, eax
	je	SHORT $L31081
; Line 113
	mov	eax, DWORD PTR _dwWrittenBytes$[ebp]
	jmp	SHORT $L31079
$L31081:
; Line 114
	xor	eax, eax
$L31079:
; Line 115
	mov	esp, ebp
	pop	ebp
	ret	8
?Write@EWriteFile@@UAEKPBXK@Z ENDP			; EWriteFile::Write
_TEXT	ENDS
EXTRN	__imp__GetFileSize@8:NEAR
_TEXT	SEGMENT
_this$ = -4
?GetLength@EWriteFile@@UAEKXZ PROC NEAR			; EWriteFile::GetLength
; Line 121
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 122
	push	0
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	call	DWORD PTR __imp__GetFileSize@8
; Line 123
	mov	esp, ebp
	pop	ebp
	ret	0
?GetLength@EWriteFile@@UAEKXZ ENDP			; EWriteFile::GetLength
_TEXT	ENDS
EXTRN	__imp__SetFilePointer@16:NEAR
_TEXT	SEGMENT
_this$ = -4
?GetPointer@EWriteFile@@UAEKXZ PROC NEAR		; EWriteFile::GetPointer
; Line 129
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 130
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	call	DWORD PTR __imp__SetFilePointer@16
; Line 131
	mov	esp, ebp
	pop	ebp
	ret	0
?GetPointer@EWriteFile@@UAEKXZ ENDP			; EWriteFile::GetPointer
_dwPointer$ = 8
_this$ = -4
?Seek@EWriteFile@@UAEXK@Z PROC NEAR			; EWriteFile::Seek
; Line 137
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 138
	push	0
	push	0
	mov	eax, DWORD PTR _dwPointer$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	call	DWORD PTR __imp__SetFilePointer@16
; Line 139
	mov	esp, ebp
	pop	ebp
	ret	4
?Seek@EWriteFile@@UAEXK@Z ENDP				; EWriteFile::Seek
_TEXT	ENDS
PUBLIC	??0EWStringObj@ERIWriteFile@@QAE@XZ		; ERIWriteFile::EWStringObj::EWStringObj
_TEXT	SEGMENT
_this$ = -4
??0EWStringObj@ERIWriteFile@@QAE@XZ PROC NEAR		; ERIWriteFile::EWStringObj::EWStringObj
; Line 150
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 151
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], 0
; Line 152
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], 0
; Line 153
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], 0
; Line 154
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0EWStringObj@ERIWriteFile@@QAE@XZ ENDP		; ERIWriteFile::EWStringObj::EWStringObj
_TEXT	ENDS
PUBLIC	??0EWStringObj@ERIWriteFile@@QAE@PBDH@Z		; ERIWriteFile::EWStringObj::EWStringObj
EXTRN	__imp__MultiByteToWideChar@24:NEAR
EXTRN	?eriAllocateMemory@@YAPAXK@Z:NEAR		; eriAllocateMemory
_TEXT	SEGMENT
_pszString$ = 8
_nLength$ = 12
_this$ = -4
??0EWStringObj@ERIWriteFile@@QAE@PBDH@Z PROC NEAR	; ERIWriteFile::EWStringObj::EWStringObj
; Line 158
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 160
	push	0
	push	0
	mov	eax, DWORD PTR _nLength$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pszString$[ebp]
	push	ecx
	push	1
	push	0
	call	DWORD PTR __imp__MultiByteToWideChar@24
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+4], eax
; Line 161
	cmp	DWORD PTR _nLength$[ebp], -1
	jne	SHORT $L31098
; Line 163
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	sub	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+4], ecx
$L31098:
; Line 166
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	sar	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	lea	ecx, DWORD PTR [eax+ecx+1]
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], ecx
; Line 168
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	shl	ecx, 1
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx], eax
; Line 172
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _nLength$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pszString$[ebp]
	push	edx
	push	1
	push	0
	call	DWORD PTR __imp__MultiByteToWideChar@24
; Line 173
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	WORD PTR [eax+ecx*2], 0
; Line 174
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	8
??0EWStringObj@ERIWriteFile@@QAE@PBDH@Z ENDP		; ERIWriteFile::EWStringObj::EWStringObj
_TEXT	ENDS
PUBLIC	??0EWStringObj@ERIWriteFile@@QAE@PBGH@Z		; ERIWriteFile::EWStringObj::EWStringObj
_TEXT	SEGMENT
_pwszString$ = 8
_nLength$ = 12
_this$ = -8
_i$ = -4
??0EWStringObj@ERIWriteFile@@QAE@PBGH@Z PROC NEAR	; ERIWriteFile::EWStringObj::EWStringObj
; Line 178
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 179
	cmp	DWORD PTR _nLength$[ebp], -1
	jne	SHORT $L31105
; Line 181
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+4], 0
	jmp	SHORT $L31106
$L31107:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	add	edx, 1
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+4], edx
$L31106:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	eax, DWORD PTR _pwszString$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+edx*2]
	test	ecx, ecx
	je	SHORT $L31108
; Line 182
	jmp	SHORT $L31107
$L31108:
; Line 184
	jmp	SHORT $L31109
$L31105:
; Line 186
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nLength$[ebp]
	mov	DWORD PTR [edx+4], eax
$L31109:
; Line 189
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	sar	edx, 1
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	lea	edx, DWORD PTR [ecx+edx+1]
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+8], edx
; Line 191
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	shl	edx, 1
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 193
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31113
$L31114:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31113:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+4]
	jge	SHORT $L31115
; Line 195
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _pwszString$[ebp]
	mov	dx, WORD PTR [esi+edx*2]
	mov	WORD PTR [eax+ecx*2], dx
; Line 196
	jmp	SHORT $L31114
$L31115:
; Line 197
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	WORD PTR [eax+ecx*2], 0
; Line 198
	mov	eax, DWORD PTR _this$[ebp]
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
??0EWStringObj@ERIWriteFile@@QAE@PBGH@Z ENDP		; ERIWriteFile::EWStringObj::EWStringObj
_TEXT	ENDS
PUBLIC	??1EWStringObj@ERIWriteFile@@QAE@XZ		; ERIWriteFile::EWStringObj::~EWStringObj
EXTRN	?eriFreeMemory@@YAXPAX@Z:NEAR			; eriFreeMemory
_TEXT	SEGMENT
_this$ = -4
??1EWStringObj@ERIWriteFile@@QAE@XZ PROC NEAR		; ERIWriteFile::EWStringObj::~EWStringObj
; Line 204
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 205
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L31119
; Line 207
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31119:
; Line 209
	mov	esp, ebp
	pop	ebp
	ret	0
??1EWStringObj@ERIWriteFile@@QAE@XZ ENDP		; ERIWriteFile::EWStringObj::~EWStringObj
_TEXT	ENDS
PUBLIC	?AddString@EWStringObj@ERIWriteFile@@QAEXABV12@@Z ; ERIWriteFile::EWStringObj::AddString
_TEXT	SEGMENT
_string$ = 8
_this$ = -20
_pwszOrgString$ = -4
_nOrgLength$ = -8
_i$31129 = -16
_i$ = -12
?AddString@EWStringObj@ERIWriteFile@@QAEXABV12@@Z PROC NEAR ; ERIWriteFile::EWStringObj::AddString
; Line 216
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 217
	mov	eax, DWORD PTR _string$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L31123
; Line 218
	jmp	$L31122
$L31123:
; Line 220
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _pwszOrgString$[ebp], edx
; Line 221
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _nOrgLength$[ebp], ecx
; Line 222
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	ecx, DWORD PTR _string$[ebp]
	add	eax, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+4], eax
; Line 224
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+4]
	cmp	edx, DWORD PTR [ecx+8]
	jl	SHORT $L31126
; Line 226
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	sar	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	lea	ecx, DWORD PTR [eax+ecx+1]
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], ecx
; Line 228
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	shl	ecx, 1
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx], eax
; Line 229
	mov	DWORD PTR _i$31129[ebp], 0
	jmp	SHORT $L31130
$L31131:
	mov	eax, DWORD PTR _i$31129[ebp]
	add	eax, 1
	mov	DWORD PTR _i$31129[ebp], eax
$L31130:
	mov	ecx, DWORD PTR _i$31129[ebp]
	cmp	ecx, DWORD PTR _nOrgLength$[ebp]
	jge	SHORT $L31132
; Line 231
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _i$31129[ebp]
	mov	edx, DWORD PTR _i$31129[ebp]
	mov	esi, DWORD PTR _pwszOrgString$[ebp]
	mov	dx, WORD PTR [esi+edx*2]
	mov	WORD PTR [eax+ecx*2], dx
; Line 232
	jmp	SHORT $L31131
$L31132:
; Line 233
	cmp	DWORD PTR _pwszOrgString$[ebp], 0
	je	SHORT $L31133
; Line 235
	mov	eax, DWORD PTR _pwszOrgString$[ebp]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31133:
$L31126:
; Line 239
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31135
$L31136:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L31135:
	mov	edx, DWORD PTR _string$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+4]
	jge	SHORT $L31137
; Line 241
	mov	ecx, DWORD PTR _string$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _nOrgLength$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	esi, DWORD PTR _i$[ebp]
	mov	dx, WORD PTR [edx+esi*2]
	mov	WORD PTR [ecx+eax*2], dx
; Line 242
	jmp	SHORT $L31136
$L31137:
; Line 243
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	WORD PTR [eax+ecx*2], 0
$L31122:
; Line 244
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?AddString@EWStringObj@ERIWriteFile@@QAEXABV12@@Z ENDP	; ERIWriteFile::EWStringObj::AddString
_TEXT	ENDS
PUBLIC	??4EWStringObj@ERIWriteFile@@QAEABV01@ABV01@@Z	; ERIWriteFile::EWStringObj::operator=
_TEXT	SEGMENT
_string$ = 8
_this$ = -8
_i$ = -4
??4EWStringObj@ERIWriteFile@@QAEABV01@ABV01@@Z PROC NEAR ; ERIWriteFile::EWStringObj::operator=
; Line 252
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 253
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L31141
; Line 255
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31141:
; Line 258
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _string$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR [eax+4], edx
; Line 259
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	sar	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	lea	ecx, DWORD PTR [eax+ecx+1]
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], ecx
; Line 261
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	shl	ecx, 1
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx], eax
; Line 263
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31145
$L31146:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31145:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jge	SHORT $L31147
; Line 265
	mov	eax, DWORD PTR _string$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	edx, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _i$[ebp]
	mov	cx, WORD PTR [ecx+esi*2]
	mov	WORD PTR [eax+edx*2], cx
; Line 266
	jmp	SHORT $L31146
$L31147:
; Line 267
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	WORD PTR [edx+eax*2], 0
; Line 269
	mov	eax, DWORD PTR _this$[ebp]
; Line 270
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
??4EWStringObj@ERIWriteFile@@QAEABV01@ABV01@@Z ENDP	; ERIWriteFile::EWStringObj::operator=
_TEXT	ENDS
PUBLIC	??0ETagInfo@ERIWriteFile@@QAE@XZ		; ERIWriteFile::ETagInfo::ETagInfo
_TEXT	SEGMENT
_this$ = -4
??0ETagInfo@ERIWriteFile@@QAE@XZ PROC NEAR		; ERIWriteFile::ETagInfo::ETagInfo
; Line 276
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 277
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], 0
; Line 278
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], 0
; Line 279
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0ETagInfo@ERIWriteFile@@QAE@XZ ENDP			; ERIWriteFile::ETagInfo::ETagInfo
_TEXT	ENDS
PUBLIC	??1ETagInfo@ERIWriteFile@@QAE@XZ		; ERIWriteFile::ETagInfo::~ETagInfo
_TEXT	SEGMENT
_this$ = -4
??1ETagInfo@ERIWriteFile@@QAE@XZ PROC NEAR		; ERIWriteFile::ETagInfo::~ETagInfo
; Line 285
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 286
	mov	esp, ebp
	pop	ebp
	ret	0
??1ETagInfo@ERIWriteFile@@QAE@XZ ENDP			; ERIWriteFile::ETagInfo::~ETagInfo
_TEXT	ENDS
PUBLIC	?CreatePlaneText@ETagInfo@ERIWriteFile@@QAEXABVEWStringObj@2@H@Z ; ERIWriteFile::ETagInfo::CreatePlaneText
PUBLIC	?DeleteContents@ETagInfo@ERIWriteFile@@QAEXXZ	; ERIWriteFile::ETagInfo::DeleteContents
_TEXT	SEGMENT
_string$ = 8
_nAlign$ = 12
_this$ = -16
_pwszString$ = -8
_nLength$ = -4
_i$ = -12
?CreatePlaneText@ETagInfo@ERIWriteFile@@QAEXABVEWStringObj@2@H@Z PROC NEAR ; ERIWriteFile::ETagInfo::CreatePlaneText
; Line 293
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 294
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteContents@ETagInfo@ERIWriteFile@@QAEXXZ ; ERIWriteFile::ETagInfo::DeleteContents
; Line 296
	mov	eax, DWORD PTR _string$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _pwszString$[ebp], ecx
; Line 297
	mov	edx, DWORD PTR _string$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR _nLength$[ebp], eax
; Line 298
	mov	ecx, DWORD PTR _nAlign$[ebp]
	mov	edx, DWORD PTR _nLength$[ebp]
	lea	eax, DWORD PTR [edx+ecx+1]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 299
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	cdq
	idiv	DWORD PTR _nAlign$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	sub	ecx, edx
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+4], ecx
; Line 302
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	shl	ecx, 1
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx], eax
; Line 303
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	shl	ecx, 1
	xor	eax, eax
	mov	edx, DWORD PTR _this$[ebp]
	mov	edi, DWORD PTR [edx]
	mov	edx, ecx
	shr	ecx, 2
	rep stosd
	mov	ecx, edx
	and	ecx, 3
	rep stosb
; Line 305
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	WORD PTR [ecx], 65279			; 0000feffH
; Line 307
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31164
$L31165:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31164:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nLength$[ebp]
	jge	SHORT $L31166
; Line 309
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _pwszString$[ebp]
	mov	cx, WORD PTR [esi+ecx*2]
	mov	WORD PTR [edx+eax*2+2], cx
; Line 310
	jmp	SHORT $L31165
$L31166:
; Line 311
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
?CreatePlaneText@ETagInfo@ERIWriteFile@@QAEXABVEWStringObj@2@H@Z ENDP ; ERIWriteFile::ETagInfo::CreatePlaneText
_TEXT	ENDS
PUBLIC	?CreateTagInfo@ETagInfo@ERIWriteFile@@QAEXPAVETagObject@ERIFile@@H@Z ; ERIWriteFile::ETagInfo::CreateTagInfo
_DATA	SEGMENT
$SG31173 DB	'#', 00H, 00H, 00H
$SG31175 DB	0dH, 00H, 0aH, 00H, 00H, 00H
_DATA	ENDS
_TEXT	SEGMENT
_pTags$ = 8
_nAlign$ = 12
_this$ = -80
_string$ = -24
_strSharp$ = -36
_strReturn$ = -12
_pszLine$31180 = -40
_nLength$31184 = -44
_fReturn$31185 = -48
$T31328 = -60
$T31329 = -72
$T31331 = -76
?CreateTagInfo@ETagInfo@ERIWriteFile@@QAEXPAVETagObject@ERIFile@@H@Z PROC NEAR ; ERIWriteFile::ETagInfo::CreateTagInfo
; Line 318
	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H
	mov	DWORD PTR _this$[ebp], ecx
; Line 319
	lea	ecx, DWORD PTR _string$[ebp]
	call	??0EWStringObj@ERIWriteFile@@QAE@XZ	; ERIWriteFile::EWStringObj::EWStringObj
; Line 320
	push	-1
	push	OFFSET FLAT:$SG31173
	lea	ecx, DWORD PTR _strSharp$[ebp]
	call	??0EWStringObj@ERIWriteFile@@QAE@PBGH@Z	; ERIWriteFile::EWStringObj::EWStringObj
; Line 321
	push	-1
	push	OFFSET FLAT:$SG31175
	lea	ecx, DWORD PTR _strReturn$[ebp]
	call	??0EWStringObj@ERIWriteFile@@QAE@PBGH@Z	; ERIWriteFile::EWStringObj::EWStringObj
$L31177:
; Line 323
	cmp	DWORD PTR _pTags$[ebp], 0
	je	$L31178
; Line 328
	lea	eax, DWORD PTR _strSharp$[ebp]
	push	eax
	lea	ecx, DWORD PTR _string$[ebp]
	call	?AddString@EWStringObj@ERIWriteFile@@QAEXABV12@@Z ; ERIWriteFile::EWStringObj::AddString
; Line 329
	mov	ecx, DWORD PTR _pTags$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR $T31331[ebp], edx
	push	-1
	mov	eax, DWORD PTR $T31331[ebp]
	push	eax
	lea	ecx, DWORD PTR $T31328[ebp]
	call	??0EWStringObj@ERIWriteFile@@QAE@PBDH@Z	; ERIWriteFile::EWStringObj::EWStringObj
	push	eax
	lea	ecx, DWORD PTR _string$[ebp]
	call	?AddString@EWStringObj@ERIWriteFile@@QAEXABV12@@Z ; ERIWriteFile::EWStringObj::AddString
	lea	ecx, DWORD PTR $T31328[ebp]
	call	??1EWStringObj@ERIWriteFile@@QAE@XZ	; ERIWriteFile::EWStringObj::~EWStringObj
; Line 330
	lea	ecx, DWORD PTR _strReturn$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _string$[ebp]
	call	?AddString@EWStringObj@ERIWriteFile@@QAEXABV12@@Z ; ERIWriteFile::EWStringObj::AddString
; Line 334
	mov	edx, DWORD PTR _pTags$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	DWORD PTR _pszLine$31180[ebp], eax
$L31182:
; Line 335
	mov	ecx, DWORD PTR _pszLine$31180[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L31183
; Line 337
	mov	DWORD PTR _nLength$31184[ebp], 0
; Line 338
	mov	BYTE PTR _fReturn$31185[ebp], 0
$L31187:
; Line 339
	mov	eax, DWORD PTR _pszLine$31180[ebp]
	add	eax, DWORD PTR _nLength$31184[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L31188
; Line 341
	mov	edx, DWORD PTR _pszLine$31180[ebp]
	add	edx, DWORD PTR _nLength$31184[ebp]
	movsx	eax, BYTE PTR [edx]
	mov	ecx, DWORD PTR _nLength$31184[ebp]
	add	ecx, 1
	mov	DWORD PTR _nLength$31184[ebp], ecx
	cmp	eax, 13					; 0000000dH
	jne	SHORT $L31189
; Line 343
	mov	edx, DWORD PTR _pszLine$31180[ebp]
	add	edx, DWORD PTR _nLength$31184[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 10					; 0000000aH
	jne	SHORT $L31190
; Line 345
	mov	BYTE PTR _fReturn$31185[ebp], 1
; Line 346
	mov	ecx, DWORD PTR _nLength$31184[ebp]
	add	ecx, 1
	mov	DWORD PTR _nLength$31184[ebp], ecx
; Line 347
	jmp	SHORT $L31188
$L31190:
$L31189:
; Line 350
	jmp	SHORT $L31187
$L31188:
; Line 352
	mov	edx, DWORD PTR _pszLine$31180[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 35					; 00000023H
	jne	SHORT $L31191
; Line 354
	lea	ecx, DWORD PTR _strSharp$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _string$[ebp]
	call	?AddString@EWStringObj@ERIWriteFile@@QAEXABV12@@Z ; ERIWriteFile::EWStringObj::AddString
$L31191:
; Line 356
	mov	edx, DWORD PTR _nLength$31184[ebp]
	push	edx
	mov	eax, DWORD PTR _pszLine$31180[ebp]
	push	eax
	lea	ecx, DWORD PTR $T31329[ebp]
	call	??0EWStringObj@ERIWriteFile@@QAE@PBDH@Z	; ERIWriteFile::EWStringObj::EWStringObj
	push	eax
	lea	ecx, DWORD PTR _string$[ebp]
	call	?AddString@EWStringObj@ERIWriteFile@@QAEXABV12@@Z ; ERIWriteFile::EWStringObj::AddString
	lea	ecx, DWORD PTR $T31329[ebp]
	call	??1EWStringObj@ERIWriteFile@@QAE@XZ	; ERIWriteFile::EWStringObj::~EWStringObj
; Line 358
	mov	ecx, DWORD PTR _fReturn$31185[ebp]
	and	ecx, 255				; 000000ffH
	test	ecx, ecx
	jne	SHORT $L31193
; Line 360
	lea	edx, DWORD PTR _strReturn$[ebp]
	push	edx
	lea	ecx, DWORD PTR _string$[ebp]
	call	?AddString@EWStringObj@ERIWriteFile@@QAEXABV12@@Z ; ERIWriteFile::EWStringObj::AddString
$L31193:
; Line 362
	mov	eax, DWORD PTR _pszLine$31180[ebp]
	add	eax, DWORD PTR _nLength$31184[ebp]
	mov	DWORD PTR _pszLine$31180[ebp], eax
; Line 363
	jmp	$L31182
$L31183:
; Line 365
	mov	ecx, DWORD PTR _pTags$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _pTags$[ebp], edx
; Line 366
	jmp	$L31177
$L31178:
; Line 368
	mov	eax, DWORD PTR _nAlign$[ebp]
	push	eax
	lea	ecx, DWORD PTR _string$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?CreatePlaneText@ETagInfo@ERIWriteFile@@QAEXABVEWStringObj@2@H@Z ; ERIWriteFile::ETagInfo::CreatePlaneText
	lea	ecx, DWORD PTR _strReturn$[ebp]
	call	??1EWStringObj@ERIWriteFile@@QAE@XZ	; ERIWriteFile::EWStringObj::~EWStringObj
	lea	ecx, DWORD PTR _strSharp$[ebp]
	call	??1EWStringObj@ERIWriteFile@@QAE@XZ	; ERIWriteFile::EWStringObj::~EWStringObj
	lea	ecx, DWORD PTR _string$[ebp]
	call	??1EWStringObj@ERIWriteFile@@QAE@XZ	; ERIWriteFile::EWStringObj::~EWStringObj
; Line 369
	mov	esp, ebp
	pop	ebp
	ret	8
?CreateTagInfo@ETagInfo@ERIWriteFile@@QAEXPAVETagObject@ERIFile@@H@Z ENDP ; ERIWriteFile::ETagInfo::CreateTagInfo
_this$ = -4
?DeleteContents@ETagInfo@ERIWriteFile@@QAEXXZ PROC NEAR	; ERIWriteFile::ETagInfo::DeleteContents
; Line 375
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 376
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L31197
; Line 378
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31197:
; Line 380
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], 0
; Line 381
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], 0
; Line 382
	mov	esp, ebp
	pop	ebp
	ret	0
?DeleteContents@ETagInfo@ERIWriteFile@@QAEXXZ ENDP	; ERIWriteFile::ETagInfo::DeleteContents
_TEXT	ENDS
PUBLIC	??0ERIWriteFile@@QAE@XZ				; ERIWriteFile::ERIWriteFile
PUBLIC	?Write@ERIWriteFile@@UAEKPBXK@Z			; ERIWriteFile::Write
PUBLIC	?GetLength@ERIWriteFile@@UAEKXZ			; ERIWriteFile::GetLength
PUBLIC	?GetPointer@ERIWriteFile@@UAEKXZ		; ERIWriteFile::GetPointer
PUBLIC	?Seek@ERIWriteFile@@UAEXK@Z			; ERIWriteFile::Seek
PUBLIC	??_7ERIWriteFile@@6B@				; ERIWriteFile::`vftable'
PUBLIC	??_GERIWriteFile@@UAEPAXI@Z			; ERIWriteFile::`scalar deleting destructor'
;PUBLIC	??_EERIWriteFile@@UAEPAXI@Z			; ERIWriteFile::`vector deleting destructor'
;	COMDAT ??_7ERIWriteFile@@6B@
; File I:\EntisGLS\eri-chan\experi\werifile.cpp
CONST	SEGMENT
??_7ERIWriteFile@@6B@	LABEL	DWORD
; DD FLAT:??_EERIWriteFile@@UAEPAXI@Z ; ERIWriteFile::`vftable'
	DD	FLAT:??_GERIWriteFile@@UAEPAXI@Z
	DD	FLAT:?Write@ERIWriteFile@@UAEKPBXK@Z
	DD	FLAT:?GetLength@ERIWriteFile@@UAEKXZ
	DD	FLAT:?GetPointer@ERIWriteFile@@UAEKXZ
	DD	FLAT:?Seek@ERIWriteFile@@UAEXK@Z
CONST	ENDS
_TEXT	SEGMENT
_this$ = -4
??0ERIWriteFile@@QAE@XZ PROC NEAR			; ERIWriteFile::ERIWriteFile
; File I:\EntisGLS\eri-chan\experi\werifile.cpp
; Line 388
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0EWriteFileObj@@QAE@XZ		; EWriteFileObj::EWriteFileObj
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7ERIWriteFile@@6B@ ; ERIWriteFile::`vftable'
; Line 389
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], 0
; Line 390
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], 0
; Line 391
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0ERIWriteFile@@QAE@XZ ENDP				; ERIWriteFile::ERIWriteFile
_TEXT	ENDS
PUBLIC	??1ERIWriteFile@@UAE@XZ				; ERIWriteFile::~ERIWriteFile
;	COMDAT ??_GERIWriteFile@@UAEPAXI@Z
_TEXT	SEGMENT
___flags$ = 8
_this$ = -4
??_GERIWriteFile@@UAEPAXI@Z PROC NEAR			; ERIWriteFile::`scalar deleting destructor', COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1ERIWriteFile@@UAE@XZ			; ERIWriteFile::~ERIWriteFile
	mov	eax, DWORD PTR ___flags$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L31204
	mov	ecx, DWORD PTR _this$[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L31204:
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??_GERIWriteFile@@UAEPAXI@Z ENDP			; ERIWriteFile::`scalar deleting destructor'
_TEXT	ENDS
PUBLIC	?Close@ERIWriteFile@@QAEXXZ			; ERIWriteFile::Close
_TEXT	SEGMENT
_this$ = -4
??1ERIWriteFile@@UAE@XZ PROC NEAR			; ERIWriteFile::~ERIWriteFile
; Line 397
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7ERIWriteFile@@6B@ ; ERIWriteFile::`vftable'
; Line 398
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Close@ERIWriteFile@@QAEXXZ		; ERIWriteFile::Close
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1EWriteFileObj@@UAE@XZ		; EWriteFileObj::~EWriteFileObj
; Line 399
	mov	esp, ebp
	pop	ebp
	ret	0
??1ERIWriteFile@@UAE@XZ ENDP				; ERIWriteFile::~ERIWriteFile
_TEXT	ENDS
PUBLIC	?Open@ERIWriteFile@@QAE_NPAVEWriteFileObj@@W4FileID@1@@Z ; ERIWriteFile::Open
EXTRN	??2@YAPAXI@Z:NEAR				; operator new
_DATA	SEGMENT
	ORG $+2
$SG31222 DB	'Entis', 01aH, 00H, 00H, 00H
_DATA	ENDS
_TEXT	SEGMENT
_pFile$ = 8
_fidType$ = 12
_this$ = -72
_emc_header$ = -68
_i$ = -4
?Open@ERIWriteFile@@QAE_NPAVEWriteFileObj@@W4FileID@1@@Z PROC NEAR ; ERIWriteFile::Open
; Line 405
	push	ebp
	mov	ebp, esp
	sub	esp, 72					; 00000048H
	mov	DWORD PTR _this$[ebp], ecx
; Line 409
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Close@ERIWriteFile@@QAEXXZ		; ERIWriteFile::Close
; Line 420
	mov	eax, DWORD PTR $SG31222
	mov	DWORD PTR _emc_header$[ebp], eax
	mov	ecx, DWORD PTR $SG31222+4
	mov	DWORD PTR _emc_header$[ebp+4], ecx
; Line 421
	mov	DWORD PTR _emc_header$[ebp+8], 50331904	; 03000100H
; Line 422
	mov	DWORD PTR _emc_header$[ebp+12], 0
; Line 429
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31226
$L31227:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31226:
	cmp	DWORD PTR _i$[ebp], 48			; 00000030H
	jge	SHORT $L31228
; Line 431
	mov	eax, DWORD PTR _fidType$[ebp]
	imul	eax, 48					; 00000030H
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR _?szFileDetails@?1??Open@ERIWriteFile@@QAE_NPAVEWriteFileObj@@W4FileID@2@@Z@4PAY0DA@$$CBDA$S31224[eax+edx]
	mov	BYTE PTR _emc_header$[ebp+ecx+16], al
; Line 432
	jmp	SHORT $L31227
$L31228:
; Line 435
	push	64					; 00000040H
	lea	ecx, DWORD PTR _emc_header$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pFile$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _pFile$[ebp]
	call	DWORD PTR [eax+4]
	cmp	eax, 64					; 00000040H
	jae	SHORT $L31231
; Line 436
	xor	al, al
	jmp	SHORT $L31211
$L31231:
; Line 440
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _pFile$[ebp]
	mov	DWORD PTR [ecx+4], edx
; Line 441
	push	12					; 0000000cH
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 442
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR [eax], 0
; Line 443
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+12]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR [edx+4], eax
; Line 444
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	ecx, DWORD PTR [ecx+4]
	mov	DWORD PTR [eax+8], ecx
; Line 446
	mov	al, 1
$L31211:
; Line 447
	mov	esp, ebp
	pop	ebp
	ret	8
?Open@ERIWriteFile@@QAE_NPAVEWriteFileObj@@W4FileID@1@@Z ENDP ; ERIWriteFile::Open
_TEXT	ENDS
PUBLIC	?AscendRecord@ERIWriteFile@@QAEXXZ		; ERIWriteFile::AscendRecord
_TEXT	SEGMENT
_this$ = -8
$T31333 = -4
?Close@ERIWriteFile@@QAEXXZ PROC NEAR			; ERIWriteFile::Close
; Line 453
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 454
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L31236
; Line 456
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+8], 0
	je	SHORT $L31237
$L31239:
; Line 458
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L31240
; Line 459
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AscendRecord@ERIWriteFile@@QAEXXZ	; ERIWriteFile::AscendRecord
	jmp	SHORT $L31239
$L31240:
; Line 461
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR $T31333[ebp], edx
	mov	eax, DWORD PTR $T31333[ebp]
	push	eax
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
; Line 462
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+8], 0
$L31237:
; Line 464
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+4], 0
$L31236:
; Line 466
	mov	esp, ebp
	pop	ebp
	ret	0
?Close@ERIWriteFile@@QAEXXZ ENDP			; ERIWriteFile::Close
_TEXT	ENDS
PUBLIC	?WriteHeader@ERIWriteFile@@QAE_NABUERI_FILE_HEADER@@ABUERI_INFO_HEADER@@@Z ; ERIWriteFile::WriteHeader
PUBLIC	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z	; ERIWriteFile::DescendRecord
_DATA	SEGMENT
	ORG $+3
$SG31249 DB	'Header  ', 00H
	ORG $+3
$SG31252 DB	'FileHdr ', 00H
	ORG $+3
$SG31258 DB	'ImageInf', 00H
_DATA	ENDS
_TEXT	SEGMENT
_efh$ = 8
_eih$ = 12
_this$ = -4
?WriteHeader@ERIWriteFile@@QAE_NABUERI_FILE_HEADER@@ABUERI_INFO_HEADER@@@Z PROC NEAR ; ERIWriteFile::WriteHeader
; Line 473
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 478
	push	OFFSET FLAT:$SG31249
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z ; ERIWriteFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31248
; Line 479
	xor	al, al
	jmp	$L31245
$L31248:
; Line 482
	push	OFFSET FLAT:$SG31252
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z ; ERIWriteFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31251
; Line 483
	xor	al, al
	jmp	SHORT $L31245
$L31251:
; Line 484
	push	20					; 00000014H
	mov	eax, DWORD PTR _efh$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+4]
	cmp	eax, 20					; 00000014H
	jae	SHORT $L31255
; Line 485
	xor	al, al
	jmp	SHORT $L31245
$L31255:
; Line 486
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AscendRecord@ERIWriteFile@@QAEXXZ	; ERIWriteFile::AscendRecord
; Line 489
	push	OFFSET FLAT:$SG31258
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z ; ERIWriteFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31257
; Line 490
	xor	al, al
	jmp	SHORT $L31245
$L31257:
; Line 491
	push	68					; 00000044H
	mov	eax, DWORD PTR _eih$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+4]
	cmp	eax, 68					; 00000044H
	jae	SHORT $L31261
; Line 492
	xor	al, al
	jmp	SHORT $L31245
$L31261:
; Line 493
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AscendRecord@ERIWriteFile@@QAEXXZ	; ERIWriteFile::AscendRecord
; Line 495
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AscendRecord@ERIWriteFile@@QAEXXZ	; ERIWriteFile::AscendRecord
; Line 497
	mov	al, 1
$L31245:
; Line 498
	mov	esp, ebp
	pop	ebp
	ret	8
?WriteHeader@ERIWriteFile@@QAE_NABUERI_FILE_HEADER@@ABUERI_INFO_HEADER@@@Z ENDP ; ERIWriteFile::WriteHeader
_pRecID$ = 8
_this$ = -16
_length$ = -8
_pRecInf$ = -12
?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z PROC NEAR	; ERIWriteFile::DescendRecord
; Line 504
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 507
	push	8
	mov	eax, DWORD PTR _pRecID$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+4]
	cmp	eax, 8
	jae	SHORT $L31267
; Line 508
	xor	al, al
	jmp	SHORT $L31264
$L31267:
; Line 509
	mov	DWORD PTR _length$[ebp], 0
	mov	DWORD PTR _length$[ebp+4], 0
; Line 510
	push	8
	lea	eax, DWORD PTR _length$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+4]
	cmp	eax, 8
	jae	SHORT $L31271
; Line 511
	xor	al, al
	jmp	SHORT $L31264
$L31271:
; Line 514
	push	12					; 0000000cH
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR _pRecInf$[ebp], eax
; Line 515
	mov	eax, DWORD PTR _pRecInf$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR [eax], edx
; Line 516
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+12]
	mov	ecx, DWORD PTR _pRecInf$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 517
	mov	edx, DWORD PTR _pRecInf$[ebp]
	mov	eax, DWORD PTR _pRecInf$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR [edx+8], ecx
; Line 518
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _pRecInf$[ebp]
	mov	DWORD PTR [edx+8], eax
; Line 520
	mov	al, 1
$L31264:
; Line 521
	mov	esp, ebp
	pop	ebp
	ret	4
?DescendRecord@ERIWriteFile@@QAE_NPB_K@Z ENDP		; ERIWriteFile::DescendRecord
_this$ = -24
_dwLimit$ = -16
_nRecLen$ = -8
_pRecInf$ = -12
$T31334 = -20
?AscendRecord@ERIWriteFile@@QAEXXZ PROC NEAR		; ERIWriteFile::AscendRecord
; Line 527
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 528
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L31277
; Line 529
	jmp	$L31276
$L31277:
; Line 530
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+12]
	mov	DWORD PTR _dwLimit$[ebp], eax
; Line 531
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	edx, DWORD PTR _dwLimit$[ebp]
	cmp	edx, DWORD PTR [ecx+8]
	jae	SHORT $L31279
; Line 532
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR _dwLimit$[ebp], edx
$L31279:
; Line 533
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	edx, DWORD PTR _dwLimit$[ebp]
	sub	edx, DWORD PTR [ecx+4]
	xor	eax, eax
	mov	DWORD PTR _nRecLen$[ebp], edx
	mov	DWORD PTR _nRecLen$[ebp+4], eax
; Line 535
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	eax, DWORD PTR [edx+4]
	sub	eax, 8
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+16]
; Line 536
	push	8
	lea	eax, DWORD PTR _nRecLen$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+4]
; Line 537
	mov	eax, DWORD PTR _dwLimit$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+16]
; Line 539
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _pRecInf$[ebp], edx
; Line 540
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR $T31334[ebp], ecx
	mov	edx, DWORD PTR $T31334[ebp]
	push	edx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
; Line 541
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _pRecInf$[ebp]
	mov	DWORD PTR [eax+8], ecx
$L31276:
; Line 542
	mov	esp, ebp
	pop	ebp
	ret	0
?AscendRecord@ERIWriteFile@@QAEXXZ ENDP			; ERIWriteFile::AscendRecord
_ptrBuf$ = 8
_dwByte$ = 12
_this$ = -4
?Write@ERIWriteFile@@UAEKPBXK@Z PROC NEAR		; ERIWriteFile::Write
; Line 548
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 549
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L31289
; Line 550
	xor	eax, eax
	jmp	SHORT $L31288
$L31289:
; Line 551
	mov	ecx, DWORD PTR _dwByte$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrBuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+4]
$L31288:
; Line 552
	mov	esp, ebp
	pop	ebp
	ret	8
?Write@ERIWriteFile@@UAEKPBXK@Z ENDP			; ERIWriteFile::Write
_this$ = -8
_dwLimit$ = -4
?GetLength@ERIWriteFile@@UAEKXZ PROC NEAR		; ERIWriteFile::GetLength
; Line 558
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 559
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L31293
; Line 560
	xor	eax, eax
	jmp	SHORT $L31292
$L31293:
; Line 561
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+12]
	mov	DWORD PTR _dwLimit$[ebp], eax
; Line 562
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	edx, DWORD PTR _dwLimit$[ebp]
	cmp	edx, DWORD PTR [ecx+8]
	jae	SHORT $L31295
; Line 563
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR _dwLimit$[ebp], edx
; Line 564
	jmp	SHORT $L31296
$L31295:
; Line 565
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	edx, DWORD PTR _dwLimit$[ebp]
	mov	DWORD PTR [ecx+8], edx
$L31296:
; Line 567
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	eax, DWORD PTR _dwLimit$[ebp]
	sub	eax, DWORD PTR [ecx+4]
$L31292:
; Line 568
	mov	esp, ebp
	pop	ebp
	ret	0
?GetLength@ERIWriteFile@@UAEKXZ ENDP			; ERIWriteFile::GetLength
_this$ = -4
?GetPointer@ERIWriteFile@@UAEKXZ PROC NEAR		; ERIWriteFile::GetPointer
; Line 574
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 575
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L31300
; Line 576
	xor	eax, eax
	jmp	SHORT $L31299
$L31300:
; Line 577
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+12]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	sub	eax, DWORD PTR [edx+4]
$L31299:
; Line 578
	mov	esp, ebp
	pop	ebp
	ret	0
?GetPointer@ERIWriteFile@@UAEKXZ ENDP			; ERIWriteFile::GetPointer
_dwPointer$ = 8
_this$ = -8
_dwLimit$ = -4
?Seek@ERIWriteFile@@UAEXK@Z PROC NEAR			; ERIWriteFile::Seek
; Line 584
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 585
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L31304
; Line 586
	jmp	SHORT $L31303
$L31304:
; Line 587
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+12]
	mov	DWORD PTR _dwLimit$[ebp], eax
; Line 588
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	edx, DWORD PTR _dwPointer$[ebp]
	add	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR _dwPointer$[ebp], edx
; Line 589
	mov	eax, DWORD PTR _dwPointer$[ebp]
	cmp	eax, DWORD PTR _dwLimit$[ebp]
	jae	SHORT $L31306
; Line 590
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	eax, DWORD PTR _dwLimit$[ebp]
	mov	DWORD PTR [edx+8], eax
$L31306:
; Line 592
	mov	ecx, DWORD PTR _dwPointer$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+4]
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [edx]
	call	DWORD PTR [eax+16]
$L31303:
; Line 593
	mov	esp, ebp
	pop	ebp
	ret	4
?Seek@ERIWriteFile@@UAEXK@Z ENDP			; ERIWriteFile::Seek
_TEXT	ENDS
END
