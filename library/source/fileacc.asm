	TITLE	I:\EntisGLS\eri-chan\experi\fileacc.cpp
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
;	COMDAT ?GetLength@EStringObj@ERIFile@@QBEHXZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_GEFileObject@@UAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_GEReadFile@@UAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_GEMemFile@@UAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_GETagObject@ERIFile@@QAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_GERIFile@@UAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_7ERIFile@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
;	COMDAT ??_7EFileObject@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
;	COMDAT ??_7EMemFile@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
;	COMDAT ??_7EReadFile@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	?m_pszTagName@ERIFile@@2PAPBDA			; ERIFile::m_pszTagName
_DATA	SEGMENT
?m_pszTagName@ERIFile@@2PAPBDA DD FLAT:$SG31291		; ERIFile::m_pszTagName
	DD	FLAT:$SG31292
	DD	FLAT:$SG31293
	DD	FLAT:$SG31294
	DD	FLAT:$SG31295
	DD	FLAT:$SG31296
	DD	FLAT:$SG31297
	DD	FLAT:$SG31298
	DD	FLAT:$SG31299
	DD	FLAT:$SG31300
	DD	FLAT:$SG31301
$SG31291 DB	'title', 00H
	ORG $+2
$SG31292 DB	'vocal-player', 00H
	ORG $+3
$SG31293 DB	'composer', 00H
	ORG $+3
$SG31294 DB	'arranger', 00H
	ORG $+3
$SG31295 DB	'source', 00H
	ORG $+1
$SG31296 DB	'track', 00H
	ORG $+2
$SG31297 DB	'release-date', 00H
	ORG $+3
$SG31298 DB	'genre', 00H
	ORG $+2
$SG31299 DB	'rewind-point', 00H
	ORG $+3
$SG31300 DB	'comment', 00H
$SG31301 DB	'words', 00H
_DATA	ENDS
PUBLIC	??0EFileObject@@QAE@XZ				; EFileObject::EFileObject
PUBLIC	??_7EFileObject@@6B@				; EFileObject::`vftable'
PUBLIC	??_GEFileObject@@UAEPAXI@Z			; EFileObject::`scalar deleting destructor'
;PUBLIC	??_EEFileObject@@UAEPAXI@Z			; EFileObject::`vector deleting destructor'
EXTRN	__purecall:NEAR
;	COMDAT ??_7EFileObject@@6B@
; File I:\EntisGLS\eri-chan\experi\fileacc.cpp
CONST	SEGMENT
??_7EFileObject@@6B@	LABEL	DWORD
;DD FLAT:??_EEFileObject@@UAEPAXI@Z	; EFileObject::`vftable'
	DD	FLAT:??_GEFileObject@@UAEPAXI@Z
	DD	FLAT:__purecall
	DD	FLAT:__purecall
	DD	FLAT:__purecall
	DD	FLAT:__purecall
CONST	ENDS
_TEXT	SEGMENT
_this$ = -4
??0EFileObject@@QAE@XZ PROC NEAR			; EFileObject::EFileObject
; File I:\EntisGLS\eri-chan\experi\fileacc.cpp
; Line 27
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EFileObject@@6B@ ; EFileObject::`vftable'
; Line 28
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0EFileObject@@QAE@XZ ENDP				; EFileObject::EFileObject
_TEXT	ENDS
PUBLIC	??1EFileObject@@UAE@XZ				; EFileObject::~EFileObject
EXTRN	??3@YAXPAX@Z:NEAR				; operator delete
;	COMDAT ??_GEFileObject@@UAEPAXI@Z
_TEXT	SEGMENT
___flags$ = 8
_this$ = -4
??_GEFileObject@@UAEPAXI@Z PROC NEAR			; EFileObject::`scalar deleting destructor', COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1EFileObject@@UAE@XZ			; EFileObject::~EFileObject
	mov	eax, DWORD PTR ___flags$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L31045
	mov	ecx, DWORD PTR _this$[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L31045:
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??_GEFileObject@@UAEPAXI@Z ENDP				; EFileObject::`scalar deleting destructor'
_TEXT	ENDS
_TEXT	SEGMENT
_this$ = -4
??1EFileObject@@UAE@XZ PROC NEAR			; EFileObject::~EFileObject
; Line 31
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EFileObject@@6B@ ; EFileObject::`vftable'
; Line 32
	mov	esp, ebp
	pop	ebp
	ret	0
??1EFileObject@@UAE@XZ ENDP				; EFileObject::~EFileObject
_TEXT	ENDS
PUBLIC	??0EReadFile@@QAE@XZ				; EReadFile::EReadFile
PUBLIC	?Read@EReadFile@@UAEKPAXK@Z			; EReadFile::Read
PUBLIC	?GetLength@EReadFile@@UAEKXZ			; EReadFile::GetLength
PUBLIC	?GetPointer@EReadFile@@UAEKXZ			; EReadFile::GetPointer
PUBLIC	?Seek@EReadFile@@UAEXK@Z			; EReadFile::Seek
PUBLIC	??_7EReadFile@@6B@				; EReadFile::`vftable'
PUBLIC	??_GEReadFile@@UAEPAXI@Z			; EReadFile::`scalar deleting destructor'
;PUBLIC	??_EEReadFile@@UAEPAXI@Z			; EReadFile::`vector deleting destructor'
;	COMDAT ??_7EReadFile@@6B@
; File I:\EntisGLS\eri-chan\experi\fileacc.cpp
CONST	SEGMENT
??_7EReadFile@@6B@	LABEL	DWORD
;DD FLAT:??_EEReadFile@@UAEPAXI@Z	; EReadFile::`vftable'
	DD	FLAT:??_GEReadFile@@UAEPAXI@Z
	DD	FLAT:?Read@EReadFile@@UAEKPAXK@Z
	DD	FLAT:?GetLength@EReadFile@@UAEKXZ
	DD	FLAT:?GetPointer@EReadFile@@UAEKXZ
	DD	FLAT:?Seek@EReadFile@@UAEXK@Z
CONST	ENDS
_TEXT	SEGMENT
_this$ = -4
??0EReadFile@@QAE@XZ PROC NEAR				; EReadFile::EReadFile
; File I:\EntisGLS\eri-chan\experi\fileacc.cpp
; Line 43
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0EFileObject@@QAE@XZ			; EFileObject::EFileObject
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EReadFile@@6B@ ; EReadFile::`vftable'
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
??0EReadFile@@QAE@XZ ENDP				; EReadFile::EReadFile
_TEXT	ENDS
PUBLIC	??1EReadFile@@UAE@XZ				; EReadFile::~EReadFile
;	COMDAT ??_GEReadFile@@UAEPAXI@Z
_TEXT	SEGMENT
___flags$ = 8
_this$ = -4
??_GEReadFile@@UAEPAXI@Z PROC NEAR			; EReadFile::`scalar deleting destructor', COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1EReadFile@@UAE@XZ			; EReadFile::~EReadFile
	mov	eax, DWORD PTR ___flags$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L31056
	mov	ecx, DWORD PTR _this$[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L31056:
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??_GEReadFile@@UAEPAXI@Z ENDP				; EReadFile::`scalar deleting destructor'
_TEXT	ENDS
PUBLIC	??0EReadFile@@QAE@PAX@Z				; EReadFile::EReadFile
_TEXT	SEGMENT
_hFile$ = 8
_this$ = -4
??0EReadFile@@QAE@PAX@Z PROC NEAR			; EReadFile::EReadFile
; Line 49
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0EFileObject@@QAE@XZ			; EFileObject::EFileObject
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EReadFile@@6B@ ; EReadFile::`vftable'
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
??0EReadFile@@QAE@PAX@Z ENDP				; EReadFile::EReadFile
_TEXT	ENDS
PUBLIC	?Close@EReadFile@@QAEXXZ			; EReadFile::Close
_TEXT	SEGMENT
_this$ = -4
??1EReadFile@@UAE@XZ PROC NEAR				; EReadFile::~EReadFile
; Line 58
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EReadFile@@6B@ ; EReadFile::`vftable'
; Line 59
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Close@EReadFile@@QAEXXZ		; EReadFile::Close
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1EFileObject@@UAE@XZ			; EFileObject::~EFileObject
; Line 60
	mov	esp, ebp
	pop	ebp
	ret	0
??1EReadFile@@UAE@XZ ENDP				; EReadFile::~EReadFile
_TEXT	ENDS
PUBLIC	?Open@EReadFile@@QAE_NPBD@Z			; EReadFile::Open
EXTRN	__imp__CreateFileA@28:NEAR
_TEXT	SEGMENT
_pszFile$ = 8
_this$ = -4
?Open@EReadFile@@QAE_NPBD@Z PROC NEAR			; EReadFile::Open
; Line 66
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 67
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Close@EReadFile@@QAEXXZ		; EReadFile::Close
; Line 78
	push	0
	push	128					; 00000080H
	push	3
	push	0
	push	1
	push	-2147483648				; 80000000H
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
?Open@EReadFile@@QAE_NPBD@Z ENDP			; EReadFile::Open
_TEXT	ENDS
PUBLIC	?Attach@EReadFile@@QAEXPAX@Z			; EReadFile::Attach
_TEXT	SEGMENT
_hFile$ = 8
_this$ = -4
?Attach@EReadFile@@QAEXPAX@Z PROC NEAR			; EReadFile::Attach
; Line 86
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 87
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Close@EReadFile@@QAEXXZ		; EReadFile::Close
; Line 89
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _hFile$[ebp]
	mov	DWORD PTR [eax+4], ecx
; Line 90
	mov	esp, ebp
	pop	ebp
	ret	4
?Attach@EReadFile@@QAEXPAX@Z ENDP			; EReadFile::Attach
_TEXT	ENDS
EXTRN	__imp__CloseHandle@4:NEAR
_TEXT	SEGMENT
_this$ = -4
?Close@EReadFile@@QAEXXZ PROC NEAR			; EReadFile::Close
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
	je	SHORT $L31073
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
$L31073:
; Line 104
	mov	esp, ebp
	pop	ebp
	ret	0
?Close@EReadFile@@QAEXXZ ENDP				; EReadFile::Close
_TEXT	ENDS
EXTRN	__imp__ReadFile@20:NEAR
_TEXT	SEGMENT
_ptrBuf$ = 8
_dwByte$ = 12
_this$ = -8
_dwReadBytes$ = -4
?Read@EReadFile@@UAEKPAXK@Z PROC NEAR			; EReadFile::Read
; Line 110
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 112
	push	0
	lea	eax, DWORD PTR _dwReadBytes$[ebp]
	push	eax
	mov	ecx, DWORD PTR _dwByte$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrBuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	call	DWORD PTR __imp__ReadFile@20
	test	eax, eax
	je	SHORT $L31080
; Line 113
	mov	eax, DWORD PTR _dwReadBytes$[ebp]
	jmp	SHORT $L31078
$L31080:
; Line 114
	xor	eax, eax
$L31078:
; Line 115
	mov	esp, ebp
	pop	ebp
	ret	8
?Read@EReadFile@@UAEKPAXK@Z ENDP			; EReadFile::Read
_TEXT	ENDS
EXTRN	__imp__GetFileSize@8:NEAR
_TEXT	SEGMENT
_this$ = -4
?GetLength@EReadFile@@UAEKXZ PROC NEAR			; EReadFile::GetLength
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
?GetLength@EReadFile@@UAEKXZ ENDP			; EReadFile::GetLength
_TEXT	ENDS
EXTRN	__imp__SetFilePointer@16:NEAR
_TEXT	SEGMENT
_this$ = -4
?GetPointer@EReadFile@@UAEKXZ PROC NEAR			; EReadFile::GetPointer
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
?GetPointer@EReadFile@@UAEKXZ ENDP			; EReadFile::GetPointer
_dwPointer$ = 8
_this$ = -4
?Seek@EReadFile@@UAEXK@Z PROC NEAR			; EReadFile::Seek
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
?Seek@EReadFile@@UAEXK@Z ENDP				; EReadFile::Seek
_TEXT	ENDS
PUBLIC	??0EMemFile@@QAE@PBEK@Z				; EMemFile::EMemFile
PUBLIC	?Read@EMemFile@@UAEKPAXK@Z			; EMemFile::Read
PUBLIC	?GetLength@EMemFile@@UAEKXZ			; EMemFile::GetLength
PUBLIC	?GetPointer@EMemFile@@UAEKXZ			; EMemFile::GetPointer
PUBLIC	?Seek@EMemFile@@UAEXK@Z				; EMemFile::Seek
PUBLIC	??_7EMemFile@@6B@				; EMemFile::`vftable'
PUBLIC	??_GEMemFile@@UAEPAXI@Z				; EMemFile::`scalar deleting destructor'
;PUBLIC	??_EEMemFile@@UAEPAXI@Z				; EMemFile::`vector deleting destructor'
;	COMDAT ??_7EMemFile@@6B@
; File I:\EntisGLS\eri-chan\experi\fileacc.cpp
CONST	SEGMENT
??_7EMemFile@@6B@	LABEL	DWORD
;DD FLAT:??_EEMemFile@@UAEPAXI@Z	; EMemFile::`vftable'
	DD	FLAT:??_GEMemFile@@UAEPAXI@Z
	DD	FLAT:?Read@EMemFile@@UAEKPAXK@Z
	DD	FLAT:?GetLength@EMemFile@@UAEKXZ
	DD	FLAT:?GetPointer@EMemFile@@UAEKXZ
	DD	FLAT:?Seek@EMemFile@@UAEXK@Z
CONST	ENDS
_TEXT	SEGMENT
_ptrMem$ = 8
_dwLength$ = 12
_this$ = -4
??0EMemFile@@QAE@PBEK@Z PROC NEAR			; EMemFile::EMemFile
; File I:\EntisGLS\eri-chan\experi\fileacc.cpp
; Line 150
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0EFileObject@@QAE@XZ			; EFileObject::EFileObject
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EMemFile@@6B@ ; EMemFile::`vftable'
; Line 151
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _ptrMem$[ebp]
	mov	DWORD PTR [ecx+4], edx
; Line 152
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _dwLength$[ebp]
	mov	DWORD PTR [eax+8], ecx
; Line 153
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+12], 0
; Line 154
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	8
??0EMemFile@@QAE@PBEK@Z ENDP				; EMemFile::EMemFile
_TEXT	ENDS
PUBLIC	??1EMemFile@@UAE@XZ				; EMemFile::~EMemFile
;	COMDAT ??_GEMemFile@@UAEPAXI@Z
_TEXT	SEGMENT
___flags$ = 8
_this$ = -4
??_GEMemFile@@UAEPAXI@Z PROC NEAR			; EMemFile::`scalar deleting destructor', COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1EMemFile@@UAE@XZ			; EMemFile::~EMemFile
	mov	eax, DWORD PTR ___flags$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L31097
	mov	ecx, DWORD PTR _this$[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L31097:
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??_GEMemFile@@UAEPAXI@Z ENDP				; EMemFile::`scalar deleting destructor'
_TEXT	ENDS
_TEXT	SEGMENT
_this$ = -4
??1EMemFile@@UAE@XZ PROC NEAR				; EMemFile::~EMemFile
; Line 160
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EMemFile@@6B@ ; EMemFile::`vftable'
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1EFileObject@@UAE@XZ			; EFileObject::~EFileObject
; Line 161
	mov	esp, ebp
	pop	ebp
	ret	0
??1EMemFile@@UAE@XZ ENDP				; EMemFile::~EMemFile
_ptrBuf$ = 8
_dwByte$ = 12
_this$ = -8
_dwReadBytes$ = -4
?Read@EMemFile@@UAEKPAXK@Z PROC NEAR			; EMemFile::Read
; Line 167
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 168
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+8]
	sub	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR _dwReadBytes$[ebp], edx
; Line 169
	mov	eax, DWORD PTR _dwReadBytes$[ebp]
	cmp	eax, DWORD PTR _dwByte$[ebp]
	jbe	SHORT $L31106
; Line 170
	mov	ecx, DWORD PTR _dwByte$[ebp]
	mov	DWORD PTR _dwReadBytes$[ebp], ecx
$L31106:
; Line 171
	mov	ecx, DWORD PTR _dwReadBytes$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	esi, DWORD PTR [edx+4]
	mov	eax, DWORD PTR _this$[ebp]
	add	esi, DWORD PTR [eax+12]
	mov	edi, DWORD PTR _ptrBuf$[ebp]
	mov	edx, ecx
	shr	ecx, 2
	rep movsd
	mov	ecx, edx
	and	ecx, 3
	rep movsb
; Line 172
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	add	ecx, DWORD PTR _dwReadBytes$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+12], ecx
; Line 173
	mov	eax, DWORD PTR _dwReadBytes$[ebp]
; Line 174
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
?Read@EMemFile@@UAEKPAXK@Z ENDP				; EMemFile::Read
_this$ = -4
?GetLength@EMemFile@@UAEKXZ PROC NEAR			; EMemFile::GetLength
; Line 180
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 181
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+8]
; Line 182
	mov	esp, ebp
	pop	ebp
	ret	0
?GetLength@EMemFile@@UAEKXZ ENDP			; EMemFile::GetLength
_this$ = -4
?GetPointer@EMemFile@@UAEKXZ PROC NEAR			; EMemFile::GetPointer
; Line 188
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 189
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+12]
; Line 190
	mov	esp, ebp
	pop	ebp
	ret	0
?GetPointer@EMemFile@@UAEKXZ ENDP			; EMemFile::GetPointer
_dwPointer$ = 8
_this$ = -4
?Seek@EMemFile@@UAEXK@Z PROC NEAR			; EMemFile::Seek
; Line 196
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 197
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _dwPointer$[ebp]
	mov	DWORD PTR [eax+12], ecx
; Line 198
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+12]
	cmp	ecx, DWORD PTR [eax+8]
	jbe	SHORT $L31116
; Line 199
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR [edx+12], ecx
$L31116:
; Line 200
	mov	esp, ebp
	pop	ebp
	ret	4
?Seek@EMemFile@@UAEXK@Z ENDP				; EMemFile::Seek
_TEXT	ENDS
PUBLIC	??0EStringObj@ERIFile@@QAE@XZ			; ERIFile::EStringObj::EStringObj
_TEXT	SEGMENT
_this$ = -4
??0EStringObj@ERIFile@@QAE@XZ PROC NEAR			; ERIFile::EStringObj::EStringObj
; Line 211
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 212
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], 0
; Line 213
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], 0
; Line 214
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0EStringObj@ERIFile@@QAE@XZ ENDP			; ERIFile::EStringObj::EStringObj
_TEXT	ENDS
PUBLIC	??0EStringObj@ERIFile@@QAE@PBDH@Z		; ERIFile::EStringObj::EStringObj
EXTRN	?eriAllocateMemory@@YAPAXK@Z:NEAR		; eriAllocateMemory
_TEXT	SEGMENT
_pszString$ = 8
_nLength$ = 12
_this$ = -8
_i$ = -4
??0EStringObj@ERIFile@@QAE@PBDH@Z PROC NEAR		; ERIFile::EStringObj::EStringObj
; Line 218
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 219
	cmp	DWORD PTR _nLength$[ebp], -1
	jne	SHORT $L31124
; Line 221
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+4], 0
	jmp	SHORT $L31125
$L31126:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	add	edx, 1
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+4], edx
$L31125:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	eax, DWORD PTR _pszString$[ebp]
	movsx	ecx, BYTE PTR [eax+edx]
	test	ecx, ecx
	je	SHORT $L31127
; Line 222
	jmp	SHORT $L31126
$L31127:
; Line 224
	jmp	SHORT $L31128
$L31124:
; Line 226
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nLength$[ebp]
	mov	DWORD PTR [edx+4], eax
$L31128:
; Line 228
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	add	edx, 1
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 229
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31131
$L31132:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31131:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+4]
	jge	SHORT $L31133
; Line 231
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _pszString$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [ecx]
	mov	BYTE PTR [eax+edx], cl
; Line 232
	jmp	SHORT $L31132
$L31133:
; Line 233
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	BYTE PTR [eax+edx], 0
; Line 234
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	8
??0EStringObj@ERIFile@@QAE@PBDH@Z ENDP			; ERIFile::EStringObj::EStringObj
_TEXT	ENDS
PUBLIC	??0EStringObj@ERIFile@@QAE@PBGH@Z		; ERIFile::EStringObj::EStringObj
EXTRN	__imp__WideCharToMultiByte@32:NEAR
_TEXT	SEGMENT
_pwszString$ = 8
_nLength$ = 12
_this$ = -4
??0EStringObj@ERIFile@@QAE@PBGH@Z PROC NEAR		; ERIFile::EStringObj::EStringObj
; Line 238
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 240
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _nLength$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pwszString$[ebp]
	push	ecx
	push	0
	push	0
	call	DWORD PTR __imp__WideCharToMultiByte@32
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+4], eax
; Line 241
	cmp	DWORD PTR _nLength$[ebp], -1
	jne	SHORT $L31138
; Line 243
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	sub	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+4], ecx
$L31138:
; Line 245
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	add	ecx, 1
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx], eax
; Line 247
	push	0
	push	0
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	add	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _nLength$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pwszString$[ebp]
	push	edx
	push	0
	push	0
	call	DWORD PTR __imp__WideCharToMultiByte@32
; Line 248
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	BYTE PTR [ecx+eax], 0
; Line 249
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	8
??0EStringObj@ERIFile@@QAE@PBGH@Z ENDP			; ERIFile::EStringObj::EStringObj
_TEXT	ENDS
PUBLIC	??1EStringObj@ERIFile@@QAE@XZ			; ERIFile::EStringObj::~EStringObj
EXTRN	?eriFreeMemory@@YAXPAX@Z:NEAR			; eriFreeMemory
_TEXT	SEGMENT
_this$ = -4
??1EStringObj@ERIFile@@QAE@XZ PROC NEAR			; ERIFile::EStringObj::~EStringObj
; Line 255
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 256
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L31143
; Line 258
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31143:
; Line 260
	mov	esp, ebp
	pop	ebp
	ret	0
??1EStringObj@ERIFile@@QAE@XZ ENDP			; ERIFile::EStringObj::~EStringObj
_TEXT	ENDS
PUBLIC	?AddString@EStringObj@ERIFile@@QAEXABV12@@Z	; ERIFile::EStringObj::AddString
_TEXT	SEGMENT
_string$ = 8
_this$ = -16
_i$31148 = -12
_pszOrgString$31149 = -8
_nOrgLength$31150 = -4
?AddString@EStringObj@ERIFile@@QAEXABV12@@Z PROC NEAR	; ERIFile::EStringObj::AddString
; Line 266
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 267
	mov	eax, DWORD PTR _string$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jle	$L31147
; Line 270
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _pszOrgString$31149[ebp], edx
; Line 271
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _nOrgLength$31150[ebp], ecx
; Line 272
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	ecx, DWORD PTR _string$[ebp]
	add	eax, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+4], eax
; Line 273
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	add	ecx, 1
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx], eax
; Line 274
	mov	DWORD PTR _i$31148[ebp], 0
	jmp	SHORT $L31152
$L31153:
	mov	eax, DWORD PTR _i$31148[ebp]
	add	eax, 1
	mov	DWORD PTR _i$31148[ebp], eax
$L31152:
	mov	ecx, DWORD PTR _i$31148[ebp]
	cmp	ecx, DWORD PTR _nOrgLength$31150[ebp]
	jge	SHORT $L31154
; Line 276
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _pszOrgString$31149[ebp]
	add	ecx, DWORD PTR _i$31148[ebp]
	mov	edx, DWORD PTR _i$31148[ebp]
	mov	cl, BYTE PTR [ecx]
	mov	BYTE PTR [eax+edx], cl
; Line 277
	jmp	SHORT $L31153
$L31154:
; Line 278
	mov	DWORD PTR _i$31148[ebp], 0
	jmp	SHORT $L31155
$L31156:
	mov	edx, DWORD PTR _i$31148[ebp]
	add	edx, 1
	mov	DWORD PTR _i$31148[ebp], edx
$L31155:
	mov	eax, DWORD PTR _string$[ebp]
	mov	ecx, DWORD PTR _i$31148[ebp]
	cmp	ecx, DWORD PTR [eax+4]
	jg	SHORT $L31157
; Line 280
	mov	edx, DWORD PTR _string$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _nOrgLength$31150[ebp]
	add	ecx, DWORD PTR _i$31148[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [edx]
	mov	esi, DWORD PTR _i$31148[ebp]
	mov	al, BYTE PTR [eax+esi]
	mov	BYTE PTR [edx+ecx], al
; Line 281
	jmp	SHORT $L31156
$L31157:
; Line 282
	cmp	DWORD PTR _pszOrgString$31149[ebp], 0
	je	SHORT $L31158
; Line 284
	mov	ecx, DWORD PTR _pszOrgString$31149[ebp]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31158:
$L31147:
; Line 287
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?AddString@EStringObj@ERIFile@@QAEXABV12@@Z ENDP	; ERIFile::EStringObj::AddString
_TEXT	ENDS
PUBLIC	??4EStringObj@ERIFile@@QAEABV01@ABV01@@Z	; ERIFile::EStringObj::operator=
_TEXT	SEGMENT
_string$ = 8
_this$ = -8
_i$ = -4
??4EStringObj@ERIFile@@QAEABV01@ABV01@@Z PROC NEAR	; ERIFile::EStringObj::operator=
; Line 294
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 295
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L31162
; Line 297
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31162:
; Line 299
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _string$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR [eax+4], edx
; Line 300
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	add	ecx, 1
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx], eax
; Line 301
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31165
$L31166:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31165:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jge	SHORT $L31167
; Line 303
	mov	eax, DWORD PTR _string$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	edx, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [ecx+esi]
	mov	BYTE PTR [eax+edx], cl
; Line 304
	jmp	SHORT $L31166
$L31167:
; Line 305
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	BYTE PTR [eax+edx], 0
; Line 307
	mov	eax, DWORD PTR _this$[ebp]
; Line 308
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
??4EStringObj@ERIFile@@QAEABV01@ABV01@@Z ENDP		; ERIFile::EStringObj::operator=
_TEXT	ENDS
PUBLIC	??0ETagObject@ERIFile@@QAE@XZ			; ERIFile::ETagObject::ETagObject
_TEXT	SEGMENT
_this$ = -4
??0ETagObject@ERIFile@@QAE@XZ PROC NEAR			; ERIFile::ETagObject::ETagObject
; Line 319
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	call	??0EStringObj@ERIFile@@QAE@XZ		; ERIFile::EStringObj::EStringObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	??0EStringObj@ERIFile@@QAE@XZ		; ERIFile::EStringObj::EStringObj
; Line 320
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], 0
; Line 321
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0ETagObject@ERIFile@@QAE@XZ ENDP			; ERIFile::ETagObject::ETagObject
_TEXT	ENDS
PUBLIC	??1ETagObject@ERIFile@@QAE@XZ			; ERIFile::ETagObject::~ETagObject
_TEXT	SEGMENT
_this$ = -4
??1ETagObject@ERIFile@@QAE@XZ PROC NEAR			; ERIFile::ETagObject::~ETagObject
; Line 327
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 328
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	??1EStringObj@ERIFile@@QAE@XZ		; ERIFile::EStringObj::~EStringObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	call	??1EStringObj@ERIFile@@QAE@XZ		; ERIFile::EStringObj::~EStringObj
	mov	esp, ebp
	pop	ebp
	ret	0
??1ETagObject@ERIFile@@QAE@XZ ENDP			; ERIFile::ETagObject::~ETagObject
_TEXT	ENDS
PUBLIC	??0ETagInfo@ERIFile@@QAE@XZ			; ERIFile::ETagInfo::ETagInfo
_TEXT	SEGMENT
_this$ = -4
??0ETagInfo@ERIFile@@QAE@XZ PROC NEAR			; ERIFile::ETagInfo::ETagInfo
; Line 334
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 335
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], 0
; Line 336
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0ETagInfo@ERIFile@@QAE@XZ ENDP			; ERIFile::ETagInfo::ETagInfo
_TEXT	ENDS
PUBLIC	??1ETagInfo@ERIFile@@QAE@XZ			; ERIFile::ETagInfo::~ETagInfo
PUBLIC	?DeleteContents@ETagInfo@ERIFile@@QAEXXZ	; ERIFile::ETagInfo::DeleteContents
_TEXT	SEGMENT
_this$ = -4
??1ETagInfo@ERIFile@@QAE@XZ PROC NEAR			; ERIFile::ETagInfo::~ETagInfo
; Line 342
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 343
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteContents@ETagInfo@ERIFile@@QAEXXZ ; ERIFile::ETagInfo::DeleteContents
; Line 344
	mov	esp, ebp
	pop	ebp
	ret	0
??1ETagInfo@ERIFile@@QAE@XZ ENDP			; ERIFile::ETagInfo::~ETagInfo
_TEXT	ENDS
PUBLIC	?CreateTagInfo@ETagInfo@ERIFile@@QAEXPBD@Z	; ERIFile::ETagInfo::CreateTagInfo
EXTRN	??2@YAPAXI@Z:NEAR				; operator new
_DATA	SEGMENT
	ORG $+2
$SG31188 DB	'comment', 00H
_DATA	ENDS
_TEXT	SEGMENT
_pszDesc$ = 8
_this$ = -84
_pLastTag$ = -4
_c$31194 = -12
_pTag$31195 = -28
_i$31198 = -16
_iBegin$31203 = -8
_pszTag$31223 = -20
_nLen$31224 = -24
_contents$31232 = -36
$T31489 = -40
$T31492 = -48
$T31493 = -56
$T31494 = -60
$T31497 = -68
$T31498 = -76
$T31502 = -80
?CreateTagInfo@ETagInfo@ERIFile@@QAEXPBD@Z PROC NEAR	; ERIFile::ETagInfo::CreateTagInfo
; Line 350
	push	ebp
	mov	ebp, esp
	sub	esp, 92					; 0000005cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 354
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteContents@ETagInfo@ERIFile@@QAEXXZ ; ERIFile::ETagInfo::DeleteContents
; Line 358
	cmp	DWORD PTR _pszDesc$[ebp], 0
	jne	SHORT $L31183
; Line 360
	jmp	$L31182
$L31183:
; Line 362
	mov	eax, DWORD PTR _pszDesc$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 35					; 00000023H
	je	SHORT $L31184
; Line 364
	push	20					; 00000014H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR $T31489[ebp], eax
	cmp	DWORD PTR $T31489[ebp], 0
	je	SHORT $L31490
	mov	ecx, DWORD PTR $T31489[ebp]
	call	??0ETagObject@ERIFile@@QAE@XZ		; ERIFile::ETagObject::ETagObject
	mov	DWORD PTR -88+[ebp], eax
	jmp	SHORT $L31491
$L31490:
	mov	DWORD PTR -88+[ebp], 0
$L31491:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR -88+[ebp]
	mov	DWORD PTR [edx], eax
; Line 365
	push	-1
	push	OFFSET FLAT:$SG31188
	lea	ecx, DWORD PTR $T31492[ebp]
	call	??0EStringObj@ERIFile@@QAE@PBDH@Z	; ERIFile::EStringObj::EStringObj
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx]
	add	ecx, 4
	call	??4EStringObj@ERIFile@@QAEABV01@ABV01@@Z ; ERIFile::EStringObj::operator=
	lea	ecx, DWORD PTR $T31492[ebp]
	call	??1EStringObj@ERIFile@@QAE@XZ		; ERIFile::EStringObj::~EStringObj
; Line 366
	push	-1
	mov	edx, DWORD PTR _pszDesc$[ebp]
	push	edx
	lea	ecx, DWORD PTR $T31493[ebp]
	call	??0EStringObj@ERIFile@@QAE@PBDH@Z	; ERIFile::EStringObj::EStringObj
	push	eax
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, 12					; 0000000cH
	call	??4EStringObj@ERIFile@@QAEABV01@ABV01@@Z ; ERIFile::EStringObj::operator=
	lea	ecx, DWORD PTR $T31493[ebp]
	call	??1EStringObj@ERIFile@@QAE@XZ		; ERIFile::EStringObj::~EStringObj
; Line 367
	jmp	$L31182
$L31184:
; Line 370
	mov	DWORD PTR _pLastTag$[ebp], 0
$L31192:
; Line 372
	mov	ecx, DWORD PTR _pszDesc$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L31193
; Line 378
	push	20					; 00000014H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR $T31494[ebp], eax
	cmp	DWORD PTR $T31494[ebp], 0
	je	SHORT $L31495
	mov	ecx, DWORD PTR $T31494[ebp]
	call	??0ETagObject@ERIFile@@QAE@XZ		; ERIFile::ETagObject::ETagObject
	mov	DWORD PTR -92+[ebp], eax
	jmp	SHORT $L31496
$L31495:
	mov	DWORD PTR -92+[ebp], 0
$L31496:
	mov	eax, DWORD PTR -92+[ebp]
	mov	DWORD PTR _pTag$31195[ebp], eax
; Line 379
	mov	DWORD PTR _i$31198[ebp], 1
$L31200:
; Line 380
	mov	ecx, DWORD PTR _pszDesc$[ebp]
	add	ecx, DWORD PTR _i$31198[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L31201
; Line 382
	mov	eax, DWORD PTR _pszDesc$[ebp]
	add	eax, DWORD PTR _i$31198[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR _c$31194[ebp], cl
; Line 383
	mov	edx, DWORD PTR _c$31194[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 32					; 00000020H
	jle	SHORT $L31202
; Line 384
	jmp	SHORT $L31201
$L31202:
; Line 385
	mov	eax, DWORD PTR _i$31198[ebp]
	add	eax, 1
	mov	DWORD PTR _i$31198[ebp], eax
; Line 386
	jmp	SHORT $L31200
$L31201:
; Line 388
	mov	ecx, DWORD PTR _i$31198[ebp]
	mov	DWORD PTR _iBegin$31203[ebp], ecx
$L31205:
; Line 389
	mov	edx, DWORD PTR _pszDesc$[ebp]
	add	edx, DWORD PTR _i$31198[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L31206
; Line 391
	mov	ecx, DWORD PTR _pszDesc$[ebp]
	add	ecx, DWORD PTR _i$31198[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR _c$31194[ebp], dl
; Line 392
	mov	eax, DWORD PTR _c$31194[ebp]
	and	eax, 255				; 000000ffH
	cmp	eax, 32					; 00000020H
	jg	SHORT $L31207
; Line 393
	jmp	SHORT $L31206
$L31207:
; Line 394
	mov	ecx, DWORD PTR _i$31198[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$31198[ebp], ecx
; Line 395
	jmp	SHORT $L31205
$L31206:
; Line 397
	mov	edx, DWORD PTR _i$31198[ebp]
	sub	edx, DWORD PTR _iBegin$31203[ebp]
	push	edx
	mov	eax, DWORD PTR _pszDesc$[ebp]
	add	eax, DWORD PTR _iBegin$31203[ebp]
	push	eax
	lea	ecx, DWORD PTR $T31497[ebp]
	call	??0EStringObj@ERIFile@@QAE@PBDH@Z	; ERIFile::EStringObj::EStringObj
	push	eax
	mov	ecx, DWORD PTR _pTag$31195[ebp]
	add	ecx, 4
	call	??4EStringObj@ERIFile@@QAEABV01@ABV01@@Z ; ERIFile::EStringObj::operator=
	lea	ecx, DWORD PTR $T31497[ebp]
	call	??1EStringObj@ERIFile@@QAE@XZ		; ERIFile::EStringObj::~EStringObj
$L31210:
; Line 401
	mov	ecx, DWORD PTR _pszDesc$[ebp]
	add	ecx, DWORD PTR _i$31198[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L31211
; Line 403
	mov	eax, DWORD PTR _pszDesc$[ebp]
	add	eax, DWORD PTR _i$31198[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR _c$31194[ebp], cl
	mov	edx, DWORD PTR _i$31198[ebp]
	add	edx, 1
	mov	DWORD PTR _i$31198[ebp], edx
; Line 404
	mov	eax, DWORD PTR _c$31194[ebp]
	and	eax, 255				; 000000ffH
	cmp	eax, 13					; 0000000dH
	jne	SHORT $L31212
	mov	ecx, DWORD PTR _pszDesc$[ebp]
	add	ecx, DWORD PTR _i$31198[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 10					; 0000000aH
	jne	SHORT $L31212
; Line 406
	mov	eax, DWORD PTR _i$31198[ebp]
	add	eax, 1
	mov	DWORD PTR _i$31198[ebp], eax
; Line 407
	jmp	SHORT $L31211
$L31212:
; Line 409
	jmp	SHORT $L31210
$L31211:
; Line 410
	mov	ecx, DWORD PTR _pszDesc$[ebp]
	add	ecx, DWORD PTR _i$31198[ebp]
	mov	DWORD PTR _pszDesc$[ebp], ecx
$L31214:
; Line 414
	mov	edx, DWORD PTR _pszDesc$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L31215
; Line 419
	mov	DWORD PTR _iBegin$31203[ebp], 0
; Line 420
	mov	ecx, DWORD PTR _pszDesc$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 35					; 00000023H
	jne	SHORT $L31216
; Line 422
	mov	eax, DWORD PTR _pszDesc$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 35					; 00000023H
	je	SHORT $L31217
; Line 423
	jmp	$L31215
$L31217:
; Line 424
	mov	DWORD PTR _iBegin$31203[ebp], 1
$L31216:
; Line 426
	mov	edx, DWORD PTR _iBegin$31203[ebp]
	mov	DWORD PTR _i$31198[ebp], edx
$L31219:
; Line 427
	mov	eax, DWORD PTR _pszDesc$[ebp]
	add	eax, DWORD PTR _i$31198[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L31220
; Line 429
	mov	edx, DWORD PTR _pszDesc$[ebp]
	add	edx, DWORD PTR _i$31198[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR _c$31194[ebp], al
	mov	ecx, DWORD PTR _i$31198[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$31198[ebp], ecx
; Line 430
	mov	edx, DWORD PTR _c$31194[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 13					; 0000000dH
	jne	SHORT $L31221
	mov	eax, DWORD PTR _pszDesc$[ebp]
	add	eax, DWORD PTR _i$31198[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 10					; 0000000aH
	jne	SHORT $L31221
; Line 432
	mov	edx, DWORD PTR _i$31198[ebp]
	add	edx, 1
	mov	DWORD PTR _i$31198[ebp], edx
; Line 433
	jmp	SHORT $L31220
$L31221:
; Line 435
	jmp	SHORT $L31219
$L31220:
; Line 440
	mov	eax, DWORD PTR _i$31198[ebp]
	sub	eax, DWORD PTR _iBegin$31203[ebp]
	push	eax
	mov	ecx, DWORD PTR _pszDesc$[ebp]
	add	ecx, DWORD PTR _iBegin$31203[ebp]
	push	ecx
	lea	ecx, DWORD PTR $T31498[ebp]
	call	??0EStringObj@ERIFile@@QAE@PBDH@Z	; ERIFile::EStringObj::EStringObj
	push	eax
	mov	ecx, DWORD PTR _pTag$31195[ebp]
	add	ecx, 12					; 0000000cH
	call	?AddString@EStringObj@ERIFile@@QAEXABV12@@Z ; ERIFile::EStringObj::AddString
	lea	ecx, DWORD PTR $T31498[ebp]
	call	??1EStringObj@ERIFile@@QAE@XZ		; ERIFile::EStringObj::~EStringObj
; Line 442
	mov	edx, DWORD PTR _pszDesc$[ebp]
	add	edx, DWORD PTR _i$31198[ebp]
	mov	DWORD PTR _pszDesc$[ebp], edx
; Line 443
	jmp	$L31214
$L31215:
; Line 445
	mov	eax, DWORD PTR _pTag$31195[ebp]
	mov	ecx, DWORD PTR [eax+12]
	mov	DWORD PTR _pszTag$31223[ebp], ecx
; Line 446
	mov	edx, DWORD PTR _pTag$31195[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	DWORD PTR _nLen$31224[ebp], eax
$L31226:
; Line 447
	cmp	DWORD PTR _nLen$31224[ebp], 0
	jle	SHORT $L31227
; Line 449
	mov	ecx, DWORD PTR _nLen$31224[ebp]
	sub	ecx, 1
	mov	DWORD PTR _nLen$31224[ebp], ecx
	mov	edx, DWORD PTR _pszTag$31223[ebp]
	add	edx, DWORD PTR _nLen$31224[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx]
	cmp	eax, 32					; 00000020H
	jle	SHORT $L31230
; Line 451
	mov	ecx, DWORD PTR _nLen$31224[ebp]
	add	ecx, 1
	mov	DWORD PTR _nLen$31224[ebp], ecx
; Line 452
	jmp	SHORT $L31227
$L31230:
; Line 454
	jmp	SHORT $L31226
$L31227:
; Line 455
	mov	edx, DWORD PTR _pTag$31195[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	DWORD PTR $T31502[ebp], eax
	mov	ecx, DWORD PTR _nLen$31224[ebp]
	cmp	ecx, DWORD PTR $T31502[ebp]
	je	SHORT $L31231
; Line 457
	mov	edx, DWORD PTR _nLen$31224[ebp]
	push	edx
	mov	eax, DWORD PTR _pszTag$31223[ebp]
	push	eax
	lea	ecx, DWORD PTR _contents$31232[ebp]
	call	??0EStringObj@ERIFile@@QAE@PBDH@Z	; ERIFile::EStringObj::EStringObj
; Line 458
	lea	ecx, DWORD PTR _contents$31232[ebp]
	push	ecx
	mov	ecx, DWORD PTR _pTag$31195[ebp]
	add	ecx, 12					; 0000000cH
	call	??4EStringObj@ERIFile@@QAEABV01@ABV01@@Z ; ERIFile::EStringObj::operator=
	lea	ecx, DWORD PTR _contents$31232[ebp]
	call	??1EStringObj@ERIFile@@QAE@XZ		; ERIFile::EStringObj::~EStringObj
$L31231:
; Line 463
	cmp	DWORD PTR _pLastTag$[ebp], 0
	jne	SHORT $L31233
; Line 465
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _pTag$31195[ebp]
	mov	DWORD PTR [edx], eax
; Line 467
	jmp	SHORT $L31234
$L31233:
; Line 469
	mov	ecx, DWORD PTR _pLastTag$[ebp]
	mov	edx, DWORD PTR _pTag$31195[ebp]
	mov	DWORD PTR [ecx], edx
$L31234:
; Line 471
	mov	eax, DWORD PTR _pTag$31195[ebp]
	mov	DWORD PTR _pLastTag$[ebp], eax
; Line 472
	jmp	$L31192
$L31193:
$L31182:
; Line 473
	mov	esp, ebp
	pop	ebp
	ret	4
?CreateTagInfo@ETagInfo@ERIFile@@QAEXPBD@Z ENDP		; ERIFile::ETagInfo::CreateTagInfo
_this$ = -20
_pTag$ = -4
_pNext$31242 = -8
$T31503 = -12
$T31504 = -16
?DeleteContents@ETagInfo@ERIFile@@QAEXXZ PROC NEAR	; ERIFile::ETagInfo::DeleteContents
; Line 479
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 480
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _pTag$[ebp], ecx
$L31240:
; Line 481
	cmp	DWORD PTR _pTag$[ebp], 0
	je	SHORT $L31241
; Line 483
	mov	edx, DWORD PTR _pTag$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _pNext$31242[ebp], eax
; Line 484
	mov	ecx, DWORD PTR _pTag$[ebp]
	mov	DWORD PTR $T31504[ebp], ecx
	mov	edx, DWORD PTR $T31504[ebp]
	mov	DWORD PTR $T31503[ebp], edx
	cmp	DWORD PTR $T31503[ebp], 0
	je	SHORT $L31505
	mov	ecx, DWORD PTR $T31503[ebp]
	call	??1ETagObject@ERIFile@@QAE@XZ		; ERIFile::ETagObject::~ETagObject
	mov	eax, 1
	and	eax, 1
	test	eax, eax
	je	SHORT $L31508
	mov	ecx, DWORD PTR $T31503[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L31508:
	mov	edx, DWORD PTR $T31503[ebp]
	mov	DWORD PTR -24+[ebp], edx
	jmp	SHORT $L31506
$L31505:
	mov	DWORD PTR -24+[ebp], 0
$L31506:
; Line 485
	mov	eax, DWORD PTR _pNext$31242[ebp]
	mov	DWORD PTR _pTag$[ebp], eax
; Line 486
	jmp	SHORT $L31240
$L31241:
; Line 487
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 488
	mov	esp, ebp
	pop	ebp
	ret	0
?DeleteContents@ETagInfo@ERIFile@@QAEXXZ ENDP		; ERIFile::ETagInfo::DeleteContents
_TEXT	ENDS
PUBLIC	?GetTagContents@ETagInfo@ERIFile@@QAEPBDPBD@Z	; ERIFile::ETagInfo::GetTagContents
_TEXT	SEGMENT
_pszTag$ = 8
_this$ = -16
_pTag$ = -4
$T31510 = -8
$T31512 = -12
?GetTagContents@ETagInfo@ERIFile@@QAEPBDPBD@Z PROC NEAR	; ERIFile::ETagInfo::GetTagContents
; Line 494
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	mov	DWORD PTR _this$[ebp], ecx
; Line 495
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _pTag$[ebp], ecx
$L31254:
; Line 496
	cmp	DWORD PTR _pTag$[ebp], 0
	je	$L31255
; Line 498
	mov	edx, DWORD PTR _pTag$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR $T31510[ebp], eax
	mov	ecx, DWORD PTR _pszTag$[ebp]
	mov	DWORD PTR -20+[ebp], ecx
	mov	edx, DWORD PTR $T31510[ebp]
	mov	DWORD PTR -24+[ebp], edx
$L31513:
	mov	eax, DWORD PTR -24+[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR -25+[ebp], cl
	mov	edx, DWORD PTR -20+[ebp]
	cmp	cl, BYTE PTR [edx]
	jne	SHORT $L31514
	cmp	BYTE PTR -25+[ebp], 0
	je	SHORT $L31515
	mov	eax, DWORD PTR -24+[ebp]
	mov	cl, BYTE PTR [eax+1]
	mov	BYTE PTR -26+[ebp], cl
	mov	edx, DWORD PTR -20+[ebp]
	cmp	cl, BYTE PTR [edx+1]
	jne	SHORT $L31514
	add	DWORD PTR -24+[ebp], 2
	add	DWORD PTR -20+[ebp], 2
	cmp	BYTE PTR -26+[ebp], 0
	jne	SHORT $L31513
$L31515:
	mov	DWORD PTR -32+[ebp], 0
	jmp	SHORT $L31516
$L31514:
	sbb	eax, eax
	sbb	eax, -1
	mov	DWORD PTR -32+[ebp], eax
$L31516:
	mov	ecx, DWORD PTR -32+[ebp]
	mov	DWORD PTR -36+[ebp], ecx
	cmp	DWORD PTR -36+[ebp], 0
	jne	SHORT $L31256
; Line 500
	mov	edx, DWORD PTR _pTag$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	DWORD PTR $T31512[ebp], eax
	mov	eax, DWORD PTR $T31512[ebp]
	jmp	SHORT $L31251
$L31256:
; Line 502
	mov	ecx, DWORD PTR _pTag$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _pTag$[ebp], edx
; Line 503
	jmp	$L31254
$L31255:
; Line 504
	xor	eax, eax
$L31251:
; Line 505
	mov	esp, ebp
	pop	ebp
	ret	4
?GetTagContents@ETagInfo@ERIFile@@QAEPBDPBD@Z ENDP	; ERIFile::ETagInfo::GetTagContents
_TEXT	ENDS
PUBLIC	?GetTrackNumber@ETagInfo@ERIFile@@QAEHXZ	; ERIFile::ETagInfo::GetTrackNumber
PUBLIC	?StringToInt@ETagInfo@ERIFile@@AAEHAAPBD@Z	; ERIFile::ETagInfo::StringToInt
_DATA	SEGMENT
$SG31261 DB	'track', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -8
_pszTrack$ = -4
?GetTrackNumber@ETagInfo@ERIFile@@QAEHXZ PROC NEAR	; ERIFile::ETagInfo::GetTrackNumber
; Line 511
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 512
	push	OFFSET FLAT:$SG31261
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetTagContents@ETagInfo@ERIFile@@QAEPBDPBD@Z ; ERIFile::ETagInfo::GetTagContents
	mov	DWORD PTR _pszTrack$[ebp], eax
; Line 513
	cmp	DWORD PTR _pszTrack$[ebp], 0
	je	SHORT $L31262
; Line 515
	lea	eax, DWORD PTR _pszTrack$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?StringToInt@ETagInfo@ERIFile@@AAEHAAPBD@Z ; ERIFile::ETagInfo::StringToInt
	jmp	SHORT $L31259
$L31262:
; Line 517
	xor	eax, eax
$L31259:
; Line 518
	mov	esp, ebp
	pop	ebp
	ret	0
?GetTrackNumber@ETagInfo@ERIFile@@QAEHXZ ENDP		; ERIFile::ETagInfo::GetTrackNumber
_TEXT	ENDS
PUBLIC	?GetRewindPoint@ETagInfo@ERIFile@@QAEHXZ	; ERIFile::ETagInfo::GetRewindPoint
_DATA	SEGMENT
	ORG $+2
$SG31267 DB	'rewind-point', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -8
_pszRewindPoint$ = -4
?GetRewindPoint@ETagInfo@ERIFile@@QAEHXZ PROC NEAR	; ERIFile::ETagInfo::GetRewindPoint
; Line 524
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 525
	push	OFFSET FLAT:$SG31267
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetTagContents@ETagInfo@ERIFile@@QAEPBDPBD@Z ; ERIFile::ETagInfo::GetTagContents
	mov	DWORD PTR _pszRewindPoint$[ebp], eax
; Line 526
	cmp	DWORD PTR _pszRewindPoint$[ebp], 0
	je	SHORT $L31268
; Line 528
	lea	eax, DWORD PTR _pszRewindPoint$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?StringToInt@ETagInfo@ERIFile@@AAEHAAPBD@Z ; ERIFile::ETagInfo::StringToInt
	jmp	SHORT $L31265
$L31268:
; Line 530
	xor	eax, eax
$L31265:
; Line 531
	mov	esp, ebp
	pop	ebp
	ret	0
?GetRewindPoint@ETagInfo@ERIFile@@QAEHXZ ENDP		; ERIFile::ETagInfo::GetRewindPoint
_TEXT	ENDS
PUBLIC	?GetReleaseDate@ETagInfo@ERIFile@@QAE_NAAH00@Z	; ERIFile::ETagInfo::GetReleaseDate
_DATA	SEGMENT
	ORG $+3
$SG31275 DB	'release-date', 00H
_DATA	ENDS
_TEXT	SEGMENT
_year$ = 8
_month$ = 12
_day$ = 16
_this$ = -8
_pszDate$ = -4
?GetReleaseDate@ETagInfo@ERIFile@@QAE_NAAH00@Z PROC NEAR ; ERIFile::ETagInfo::GetReleaseDate
; Line 537
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 538
	mov	eax, DWORD PTR _year$[ebp]
	mov	DWORD PTR [eax], 0
; Line 539
	mov	ecx, DWORD PTR _month$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 540
	mov	edx, DWORD PTR _day$[ebp]
	mov	DWORD PTR [edx], 0
; Line 542
	push	OFFSET FLAT:$SG31275
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetTagContents@ETagInfo@ERIFile@@QAEPBDPBD@Z ; ERIFile::ETagInfo::GetTagContents
	mov	DWORD PTR _pszDate$[ebp], eax
; Line 543
	cmp	DWORD PTR _pszDate$[ebp], 0
	jne	SHORT $L31276
; Line 544
	xor	al, al
	jmp	SHORT $L31273
$L31276:
; Line 546
	lea	eax, DWORD PTR _pszDate$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?StringToInt@ETagInfo@ERIFile@@AAEHAAPBD@Z ; ERIFile::ETagInfo::StringToInt
	mov	ecx, DWORD PTR _year$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 547
	mov	edx, DWORD PTR _pszDate$[ebp]
	movsx	eax, BYTE PTR [edx]
	mov	ecx, DWORD PTR _pszDate$[ebp]
	add	ecx, 1
	mov	DWORD PTR _pszDate$[ebp], ecx
	cmp	eax, 47					; 0000002fH
	je	SHORT $L31277
; Line 548
	xor	al, al
	jmp	SHORT $L31273
$L31277:
; Line 550
	lea	edx, DWORD PTR _pszDate$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?StringToInt@ETagInfo@ERIFile@@AAEHAAPBD@Z ; ERIFile::ETagInfo::StringToInt
	mov	ecx, DWORD PTR _month$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 551
	mov	edx, DWORD PTR _pszDate$[ebp]
	movsx	eax, BYTE PTR [edx]
	mov	ecx, DWORD PTR _pszDate$[ebp]
	add	ecx, 1
	mov	DWORD PTR _pszDate$[ebp], ecx
	cmp	eax, 47					; 0000002fH
	je	SHORT $L31278
; Line 552
	xor	al, al
	jmp	SHORT $L31273
$L31278:
; Line 554
	lea	edx, DWORD PTR _pszDate$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?StringToInt@ETagInfo@ERIFile@@AAEHAAPBD@Z ; ERIFile::ETagInfo::StringToInt
	mov	ecx, DWORD PTR _day$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 556
	mov	al, 1
$L31273:
; Line 557
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?GetReleaseDate@ETagInfo@ERIFile@@QAE_NAAH00@Z ENDP	; ERIFile::ETagInfo::GetReleaseDate
_pszValue$ = 8
_this$ = -16
_pszNext$ = -8
_nValue$ = -4
_c$31287 = -12
?StringToInt@ETagInfo@ERIFile@@AAEHAAPBD@Z PROC NEAR	; ERIFile::ETagInfo::StringToInt
; Line 563
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 564
	mov	eax, DWORD PTR _pszValue$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _pszNext$[ebp], ecx
; Line 565
	mov	DWORD PTR _nValue$[ebp], 0
$L31285:
; Line 567
	mov	edx, DWORD PTR _pszNext$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L31286
; Line 569
	mov	ecx, DWORD PTR _pszNext$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR _c$31287[ebp], dl
; Line 570
	movsx	eax, BYTE PTR _c$31287[ebp]
	cmp	eax, 32					; 00000020H
	je	SHORT $L31288
	movsx	ecx, BYTE PTR _c$31287[ebp]
	cmp	ecx, 48					; 00000030H
	jl	SHORT $L31289
	movsx	edx, BYTE PTR _c$31287[ebp]
	cmp	edx, 57					; 00000039H
	jle	SHORT $L31288
$L31289:
; Line 572
	jmp	SHORT $L31286
$L31288:
; Line 574
	mov	eax, DWORD PTR _pszNext$[ebp]
	add	eax, 1
	mov	DWORD PTR _pszNext$[ebp], eax
; Line 575
	movsx	ecx, BYTE PTR _c$31287[ebp]
	cmp	ecx, 32					; 00000020H
	je	SHORT $L31290
; Line 577
	mov	edx, DWORD PTR _nValue$[ebp]
	imul	edx, 10					; 0000000aH
	movsx	eax, BYTE PTR _c$31287[ebp]
	lea	ecx, DWORD PTR [edx+eax-48]
	mov	DWORD PTR _nValue$[ebp], ecx
$L31290:
; Line 579
	jmp	SHORT $L31285
$L31286:
; Line 581
	mov	edx, DWORD PTR _pszValue$[ebp]
	mov	eax, DWORD PTR _pszNext$[ebp]
	mov	DWORD PTR [edx], eax
; Line 582
	mov	eax, DWORD PTR _nValue$[ebp]
; Line 583
	mov	esp, ebp
	pop	ebp
	ret	4
?StringToInt@ETagInfo@ERIFile@@AAEHAAPBD@Z ENDP		; ERIFile::ETagInfo::StringToInt
_TEXT	ENDS
PUBLIC	??0ERIFile@@QAE@XZ				; ERIFile::ERIFile
PUBLIC	?Read@ERIFile@@UAEKPAXK@Z			; ERIFile::Read
PUBLIC	?GetLength@ERIFile@@UAEKXZ			; ERIFile::GetLength
PUBLIC	?GetPointer@ERIFile@@UAEKXZ			; ERIFile::GetPointer
PUBLIC	?Seek@ERIFile@@UAEXK@Z				; ERIFile::Seek
PUBLIC	??_7ERIFile@@6B@				; ERIFile::`vftable'
PUBLIC	??_GERIFile@@UAEPAXI@Z				; ERIFile::`scalar deleting destructor'
;PUBLIC	??_EERIFile@@UAEPAXI@Z				; ERIFile::`vector deleting destructor'
;	COMDAT ??_7ERIFile@@6B@
; File I:\EntisGLS\eri-chan\experi\fileacc.cpp
CONST	SEGMENT
??_7ERIFile@@6B@	LABEL	DWORD
;DD FLAT:??_EERIFile@@UAEPAXI@Z		; ERIFile::`vftable'
	DD	FLAT:??_GERIFile@@UAEPAXI@Z
	DD	FLAT:?Read@ERIFile@@UAEKPAXK@Z
	DD	FLAT:?GetLength@ERIFile@@UAEKXZ
	DD	FLAT:?GetPointer@ERIFile@@UAEKXZ
	DD	FLAT:?Seek@ERIFile@@UAEXK@Z
CONST	ENDS
_TEXT	SEGMENT
_this$ = -4
??0ERIFile@@QAE@XZ PROC NEAR				; ERIFile::ERIFile
; File I:\EntisGLS\eri-chan\experi\fileacc.cpp
; Line 604
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0EFileObject@@QAE@XZ			; EFileObject::EFileObject
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1236				; 000004d4H
	call	??0EStringObj@ERIFile@@QAE@XZ		; ERIFile::EStringObj::EStringObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1244				; 000004dcH
	call	??0EStringObj@ERIFile@@QAE@XZ		; ERIFile::EStringObj::EStringObj
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7ERIFile@@6B@ ; ERIFile::`vftable'
; Line 605
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], 0
; Line 606
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], 0
; Line 607
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0ERIFile@@QAE@XZ ENDP					; ERIFile::ERIFile
_TEXT	ENDS
PUBLIC	??1ERIFile@@UAE@XZ				; ERIFile::~ERIFile
;	COMDAT ??_GERIFile@@UAEPAXI@Z
_TEXT	SEGMENT
___flags$ = 8
_this$ = -4
??_GERIFile@@UAEPAXI@Z PROC NEAR			; ERIFile::`scalar deleting destructor', COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1ERIFile@@UAE@XZ			; ERIFile::~ERIFile
	mov	eax, DWORD PTR ___flags$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L31308
	mov	ecx, DWORD PTR _this$[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L31308:
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??_GERIFile@@UAEPAXI@Z ENDP				; ERIFile::`scalar deleting destructor'
_TEXT	ENDS
PUBLIC	?Close@ERIFile@@QAEXXZ				; ERIFile::Close
_TEXT	SEGMENT
_this$ = -4
??1ERIFile@@UAE@XZ PROC NEAR				; ERIFile::~ERIFile
; Line 613
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7ERIFile@@6B@ ; ERIFile::`vftable'
; Line 614
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Close@ERIFile@@QAEXXZ			; ERIFile::Close
; Line 615
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1244				; 000004dcH
	call	??1EStringObj@ERIFile@@QAE@XZ		; ERIFile::EStringObj::~EStringObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1236				; 000004d4H
	call	??1EStringObj@ERIFile@@QAE@XZ		; ERIFile::EStringObj::~EStringObj
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1EFileObject@@UAE@XZ			; EFileObject::~EFileObject
	mov	esp, ebp
	pop	ebp
	ret	0
??1ERIFile@@UAE@XZ ENDP					; ERIFile::~ERIFile
_TEXT	ENDS
PUBLIC	?Open@ERIFile@@QAE_NPAVEFileObject@@W4OpenType@1@@Z ; ERIFile::Open
PUBLIC	?DescendRecord@ERIFile@@QAE_NPB_K@Z		; ERIFile::DescendRecord
PUBLIC	?AscendRecord@ERIFile@@QAEXXZ			; ERIFile::AscendRecord
_DATA	SEGMENT
	ORG $+3
$SG31331 DB	'Entis', 01aH, 00H, 00H, 00H
	ORG $+3
$SG31337 DB	'Header  ', 00H
	ORG $+3
$SG31340 DB	'FileHdr ', 00H
	ORG $+3
$SG31352 DB	'PrevwInf', 00H
	ORG $+3
$SG31359 DB	'ImageInf', 00H
	ORG $+3
$SG31366 DB	'SoundInf', 00H
	ORG $+3
$SG31374 DB	'cpyright', 00H
	ORG $+3
$SG31378 DB	'descript', 00H
	ORG $+3
$SG31401 DB	'Stream  ', 00H
	ORG $+3
$SG31409 DB	'ImageFrm', 00H
	ORG $+3
$SG31412 DB	'Palette ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_pFile$ = 8
_type$ = 12
_this$ = -128
_emc_header$ = -64
_ui64RecID$31349 = -72
_nType$31371 = -76
_nLength$31380 = -80
_pszBuf$31382 = -84
_pwszBuf$31385 = -92
_nWideLen$31387 = -88
$T31517 = -100
$T31518 = -108
$T31519 = -116
$T31520 = -124
?Open@ERIFile@@QAE_NPAVEFileObject@@W4OpenType@1@@Z PROC NEAR ; ERIFile::Open
; Line 621
	push	ebp
	mov	ebp, esp
	sub	esp, 136				; 00000088H
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 625
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 637
	push	64					; 00000040H
	lea	ecx, DWORD PTR _emc_header$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pFile$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _pFile$[ebp]
	call	DWORD PTR [eax+4]
	cmp	eax, 64					; 00000040H
	jae	SHORT $L31326
; Line 638
	xor	al, al
	jmp	$L31315
$L31326:
; Line 642
	mov	ecx, DWORD PTR _emc_header$[ebp]
	cmp	ecx, DWORD PTR $SG31331
	jne	SHORT $L31330
	mov	edx, DWORD PTR _emc_header$[ebp+4]
	cmp	edx, DWORD PTR $SG31331+4
	jne	SHORT $L31330
	cmp	DWORD PTR _emc_header$[ebp+8], 50331904	; 03000100H
	je	SHORT $L31329
$L31330:
; Line 643
	xor	al, al
	jmp	$L31315
$L31329:
; Line 646
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _pFile$[ebp]
	mov	DWORD PTR [eax+4], ecx
; Line 647
	push	32					; 00000020H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], eax
; Line 648
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+16], 0
; Line 649
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+4]
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [edx]
	call	DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR [edx+20], eax
; Line 650
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+8]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR [edx+24], eax
; Line 652
	cmp	DWORD PTR _type$[ebp], 0
	jne	SHORT $L31333
; Line 653
	mov	al, 1
	jmp	$L31315
$L31333:
; Line 658
	push	OFFSET FLAT:$SG31337
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DescendRecord@ERIFile@@QAE_NPB_K@Z	; ERIFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31336
; Line 659
	xor	al, al
	jmp	$L31315
$L31336:
; Line 662
	push	OFFSET FLAT:$SG31340
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DescendRecord@ERIFile@@QAE_NPB_K@Z	; ERIFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31339
; Line 663
	xor	al, al
	jmp	$L31315
$L31339:
; Line 665
	push	20					; 00000014H
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 16					; 00000010H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+4]
	cmp	eax, 20					; 00000014H
	jae	SHORT $L31343
; Line 666
	xor	al, al
	jmp	$L31315
$L31343:
; Line 667
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AscendRecord@ERIFile@@QAEXXZ		; ERIFile::AscendRecord
; Line 669
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	or	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+12], ecx
; Line 672
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+16], 131328		; 00020100H
	jbe	SHORT $L31344
; Line 673
	xor	al, al
	jmp	$L31315
$L31344:
$L31346:
; Line 678
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DescendRecord@ERIFile@@QAE_NPB_K@Z	; ERIFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31348
; Line 679
	jmp	$L31347
$L31348:
; Line 681
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _ui64RecID$31349[ebp], eax
	mov	ecx, DWORD PTR [edx+4]
	mov	DWORD PTR _ui64RecID$31349[ebp+4], ecx
; Line 682
	mov	edx, DWORD PTR _ui64RecID$31349[ebp]
	cmp	edx, DWORD PTR $SG31352
	jne	SHORT $L31351
	mov	eax, DWORD PTR _ui64RecID$31349[ebp+4]
	cmp	eax, DWORD PTR $SG31352+4
	jne	SHORT $L31351
; Line 687
	push	68					; 00000044H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 36					; 00000024H
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [eax+4]
	cmp	eax, 68					; 00000044H
	jne	SHORT $L31355
; Line 689
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	or	edx, 2
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+12], edx
$L31355:
; Line 692
	jmp	$L31356
$L31351:
	mov	ecx, DWORD PTR _ui64RecID$31349[ebp]
	cmp	ecx, DWORD PTR $SG31359
	jne	SHORT $L31358
	mov	edx, DWORD PTR _ui64RecID$31349[ebp+4]
	cmp	edx, DWORD PTR $SG31359+4
	jne	SHORT $L31358
; Line 697
	push	68					; 00000044H
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+4]
	cmp	eax, 68					; 00000044H
	jne	SHORT $L31362
; Line 699
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	or	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+12], ecx
$L31362:
; Line 702
	jmp	$L31363
$L31358:
	mov	eax, DWORD PTR _ui64RecID$31349[ebp]
	cmp	eax, DWORD PTR $SG31366
	jne	SHORT $L31365
	mov	ecx, DWORD PTR _ui64RecID$31349[ebp+4]
	cmp	ecx, DWORD PTR $SG31366+4
	jne	SHORT $L31365
; Line 707
	push	40					; 00000028H
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 172				; 000000acH
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+4]
	cmp	eax, 40					; 00000028H
	jne	SHORT $L31369
; Line 709
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	or	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+12], ecx
$L31369:
; Line 712
	jmp	$L31370
$L31365:
; Line 716
	mov	DWORD PTR _nType$31371[ebp], -1
; Line 717
	mov	eax, DWORD PTR _ui64RecID$31349[ebp]
	cmp	eax, DWORD PTR $SG31374
	jne	SHORT $L31373
	mov	ecx, DWORD PTR _ui64RecID$31349[ebp+4]
	cmp	ecx, DWORD PTR $SG31374+4
	jne	SHORT $L31373
; Line 719
	mov	DWORD PTR _nType$31371[ebp], 0
; Line 720
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+12]
	or	al, 16					; 00000010H
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 722
	jmp	SHORT $L31375
$L31373:
	mov	edx, DWORD PTR _ui64RecID$31349[ebp]
	cmp	edx, DWORD PTR $SG31378
	jne	SHORT $L31377
	mov	eax, DWORD PTR _ui64RecID$31349[ebp+4]
	cmp	eax, DWORD PTR $SG31378+4
	jne	SHORT $L31377
; Line 724
	mov	DWORD PTR _nType$31371[ebp], 1
; Line 725
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	or	edx, 32					; 00000020H
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+12], edx
$L31377:
$L31375:
; Line 727
	cmp	DWORD PTR _nType$31371[ebp], 0
	jl	$L31379
; Line 729
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR _nLength$31380[ebp], eax
; Line 730
	mov	ecx, DWORD PTR _nLength$31380[ebp]
	add	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	DWORD PTR _pszBuf$31382[ebp], eax
; Line 731
	mov	edx, DWORD PTR _nLength$31380[ebp]
	push	edx
	mov	eax, DWORD PTR _pszBuf$31382[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+4]
; Line 733
	cmp	DWORD PTR _nLength$31380[ebp], 2
	jl	$L31384
	mov	eax, DWORD PTR _pszBuf$31382[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, -1
	jne	$L31384
	mov	edx, DWORD PTR _pszBuf$31382[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, -2					; fffffffeH
	jne	SHORT $L31384
; Line 735
	mov	ecx, DWORD PTR _pszBuf$31382[ebp]
	add	ecx, 2
	mov	DWORD PTR _pwszBuf$31385[ebp], ecx
; Line 736
	mov	eax, DWORD PTR _nLength$31380[ebp]
	sub	eax, 2
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	DWORD PTR _nWideLen$31387[ebp], eax
; Line 737
	mov	edx, DWORD PTR _nWideLen$31387[ebp]
	mov	eax, DWORD PTR _pwszBuf$31385[ebp]
	mov	WORD PTR [eax+edx*2], 0
; Line 738
	cmp	DWORD PTR _nType$31371[ebp], 0
	jne	SHORT $L31388
; Line 739
	push	-1
	mov	ecx, DWORD PTR _pwszBuf$31385[ebp]
	push	ecx
	lea	ecx, DWORD PTR $T31517[ebp]
	call	??0EStringObj@ERIFile@@QAE@PBGH@Z	; ERIFile::EStringObj::EStringObj
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1236				; 000004d4H
	call	??4EStringObj@ERIFile@@QAEABV01@ABV01@@Z ; ERIFile::EStringObj::operator=
	lea	ecx, DWORD PTR $T31517[ebp]
	call	??1EStringObj@ERIFile@@QAE@XZ		; ERIFile::EStringObj::~EStringObj
; Line 740
	jmp	SHORT $L31390
$L31388:
; Line 741
	push	-1
	mov	edx, DWORD PTR _pwszBuf$31385[ebp]
	push	edx
	lea	ecx, DWORD PTR $T31518[ebp]
	call	??0EStringObj@ERIFile@@QAE@PBGH@Z	; ERIFile::EStringObj::EStringObj
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1244				; 000004dcH
	call	??4EStringObj@ERIFile@@QAEABV01@ABV01@@Z ; ERIFile::EStringObj::operator=
	lea	ecx, DWORD PTR $T31518[ebp]
	call	??1EStringObj@ERIFile@@QAE@XZ		; ERIFile::EStringObj::~EStringObj
$L31390:
; Line 743
	jmp	SHORT $L31392
$L31384:
; Line 745
	mov	eax, DWORD PTR _pszBuf$31382[ebp]
	add	eax, DWORD PTR _nLength$31380[ebp]
	mov	BYTE PTR [eax], 0
; Line 746
	cmp	DWORD PTR _nType$31371[ebp], 0
	jne	SHORT $L31393
; Line 747
	push	-1
	mov	ecx, DWORD PTR _pszBuf$31382[ebp]
	push	ecx
	lea	ecx, DWORD PTR $T31519[ebp]
	call	??0EStringObj@ERIFile@@QAE@PBDH@Z	; ERIFile::EStringObj::EStringObj
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1236				; 000004d4H
	call	??4EStringObj@ERIFile@@QAEABV01@ABV01@@Z ; ERIFile::EStringObj::operator=
	lea	ecx, DWORD PTR $T31519[ebp]
	call	??1EStringObj@ERIFile@@QAE@XZ		; ERIFile::EStringObj::~EStringObj
; Line 748
	jmp	SHORT $L31395
$L31393:
; Line 749
	push	-1
	mov	edx, DWORD PTR _pszBuf$31382[ebp]
	push	edx
	lea	ecx, DWORD PTR $T31520[ebp]
	call	??0EStringObj@ERIFile@@QAE@PBDH@Z	; ERIFile::EStringObj::EStringObj
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1244				; 000004dcH
	call	??4EStringObj@ERIFile@@QAEABV01@ABV01@@Z ; ERIFile::EStringObj::operator=
	lea	ecx, DWORD PTR $T31520[ebp]
	call	??1EStringObj@ERIFile@@QAE@XZ		; ERIFile::EStringObj::~EStringObj
$L31395:
$L31392:
; Line 751
	mov	eax, DWORD PTR _pszBuf$31382[ebp]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31379:
$L31370:
$L31363:
$L31356:
; Line 756
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AscendRecord@ERIFile@@QAEXXZ		; ERIFile::AscendRecord
; Line 757
	jmp	$L31346
$L31347:
; Line 759
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AscendRecord@ERIFile@@QAEXXZ		; ERIFile::AscendRecord
; Line 762
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	and	edx, 4
	test	edx, edx
	jne	SHORT $L31397
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	and	ecx, 8
	test	ecx, ecx
	jne	SHORT $L31397
; Line 763
	xor	al, al
	jmp	$L31315
$L31397:
; Line 764
	cmp	DWORD PTR _type$[ebp], 1
	jne	SHORT $L31398
; Line 765
	mov	al, 1
	jmp	$L31315
$L31398:
; Line 769
	push	OFFSET FLAT:$SG31401
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DescendRecord@ERIFile@@QAE_NPB_K@Z	; ERIFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31400
; Line 770
	xor	al, al
	jmp	$L31315
$L31400:
; Line 771
	cmp	DWORD PTR _type$[ebp], 2
	jne	SHORT $L31402
; Line 772
	mov	al, 1
	jmp	$L31315
$L31402:
$L31404:
; Line 777
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DescendRecord@ERIFile@@QAE_NPB_K@Z	; ERIFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31406
; Line 778
	xor	al, al
	jmp	$L31315
$L31406:
; Line 779
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR -132+[ebp], eax
	mov	ecx, DWORD PTR -132+[ebp]
	mov	edx, DWORD PTR [ecx]
	cmp	edx, DWORD PTR $SG31409
	jne	SHORT $L31408
	mov	eax, DWORD PTR -132+[ebp]
	mov	ecx, DWORD PTR [eax+4]
	cmp	ecx, DWORD PTR $SG31409+4
	jne	SHORT $L31408
; Line 780
	jmp	SHORT $L31405
$L31408:
; Line 781
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR -136+[ebp], eax
	mov	ecx, DWORD PTR -136+[ebp]
	mov	edx, DWORD PTR [ecx]
	cmp	edx, DWORD PTR $SG31412
	jne	SHORT $L31411
	mov	eax, DWORD PTR -136+[ebp]
	mov	ecx, DWORD PTR [eax+4]
	cmp	ecx, DWORD PTR $SG31412+4
	jne	SHORT $L31411
; Line 785
	mov	ecx, 256				; 00000100H
	xor	eax, eax
	mov	edi, DWORD PTR _this$[ebp]
	add	edi, 212				; 000000d4H
	rep stosd
; Line 786
	push	1024					; 00000400H
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 212				; 000000d4H
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+4]
; Line 788
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	or	ecx, 64					; 00000040H
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+12], ecx
$L31411:
; Line 790
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AscendRecord@ERIFile@@QAEXXZ		; ERIFile::AscendRecord
; Line 791
	jmp	$L31404
$L31405:
; Line 793
	mov	al, 1
$L31315:
; Line 794
	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	8
?Open@ERIFile@@QAE_NPAVEFileObject@@W4OpenType@1@@Z ENDP ; ERIFile::Open
_this$ = -12
_pRecInf$31419 = -4
$T31521 = -8
?Close@ERIFile@@QAEXXZ PROC NEAR			; ERIFile::Close
; Line 800
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
$L31417:
; Line 801
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	SHORT $L31418
; Line 803
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	eax, DWORD PTR [edx+16]
	mov	DWORD PTR _pRecInf$31419[ebp], eax
; Line 804
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR $T31521[ebp], edx
	mov	eax, DWORD PTR $T31521[ebp]
	push	eax
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
; Line 805
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _pRecInf$31419[ebp]
	mov	DWORD PTR [ecx+8], edx
; Line 806
	jmp	SHORT $L31417
$L31418:
; Line 807
	mov	esp, ebp
	pop	ebp
	ret	0
?Close@ERIFile@@QAEXXZ ENDP				; ERIFile::Close
_pRecID$ = 8
_this$ = -12
_pRecInf$31427 = -4
$T31522 = -8
?DescendRecord@ERIFile@@QAE_NPB_K@Z PROC NEAR		; ERIFile::DescendRecord
; Line 813
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
$L31425:
; Line 816
	push	32					; 00000020H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR _pRecInf$31427[ebp], eax
; Line 818
	push	16					; 00000010H
	mov	eax, DWORD PTR _pRecInf$31427[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+4]
	cmp	eax, 16					; 00000010H
	jae	SHORT $L31431
; Line 820
	mov	eax, DWORD PTR _pRecInf$31427[ebp]
	mov	DWORD PTR $T31522[ebp], eax
	mov	ecx, DWORD PTR $T31522[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
; Line 821
	xor	al, al
	jmp	$L31423
$L31431:
; Line 823
	mov	edx, DWORD PTR _pRecInf$31427[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR [edx+16], ecx
; Line 824
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+4]
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [edx]
	call	DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _pRecInf$31427[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 825
	mov	edx, DWORD PTR _pRecInf$31427[ebp]
	add	edx, 8
	mov	DWORD PTR -16+[ebp], edx
	mov	eax, DWORD PTR -16+[ebp]
	mov	ecx, DWORD PTR -16+[ebp]
	mov	edx, DWORD PTR [eax]
	and	edx, DWORD PTR [ecx+4]
	cmp	edx, -1
	jne	SHORT $L31433
; Line 827
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	edx, DWORD PTR _pRecInf$31427[ebp]
	mov	eax, DWORD PTR [ecx+24]
	mov	DWORD PTR [edx+24], eax
; Line 829
	jmp	SHORT $L31434
$L31433:
; Line 832
	mov	ecx, DWORD PTR _pRecInf$31427[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	eax, DWORD PTR _pRecInf$31427[ebp]
	mov	ecx, DWORD PTR [eax+20]
	add	ecx, edx
	mov	edx, DWORD PTR _pRecInf$31427[ebp]
	mov	DWORD PTR [edx+24], ecx
; Line 833
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	edx, DWORD PTR _pRecInf$31427[ebp]
	mov	eax, DWORD PTR [edx+24]
	cmp	eax, DWORD PTR [ecx+24]
	jbe	SHORT $L31436
; Line 834
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	eax, DWORD PTR _pRecInf$31427[ebp]
	mov	ecx, DWORD PTR [edx+24]
	mov	DWORD PTR [eax+24], ecx
$L31436:
$L31434:
; Line 836
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _pRecInf$31427[ebp]
	mov	DWORD PTR [edx+8], eax
; Line 837
	cmp	DWORD PTR _pRecID$[ebp], 0
	jne	SHORT $L31437
; Line 838
	jmp	SHORT $L31426
$L31437:
; Line 839
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	eax, DWORD PTR _pRecID$[ebp]
	mov	DWORD PTR -20+[ebp], edx
	mov	DWORD PTR -24+[ebp], eax
	mov	ecx, DWORD PTR -20+[ebp]
	mov	edx, DWORD PTR -24+[ebp]
	mov	eax, DWORD PTR [ecx]
	cmp	eax, DWORD PTR [edx]
	jne	SHORT $L31438
	mov	ecx, DWORD PTR -20+[ebp]
	mov	edx, DWORD PTR -24+[ebp]
	mov	eax, DWORD PTR [ecx+4]
	cmp	eax, DWORD PTR [edx+4]
	jne	SHORT $L31438
; Line 840
	jmp	SHORT $L31426
$L31438:
; Line 841
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AscendRecord@ERIFile@@QAEXXZ		; ERIFile::AscendRecord
; Line 842
	jmp	$L31425
$L31426:
; Line 843
	mov	al, 1
$L31423:
; Line 844
	mov	esp, ebp
	pop	ebp
	ret	4
?DescendRecord@ERIFile@@QAE_NPB_K@Z ENDP		; ERIFile::DescendRecord
_this$ = -12
_pRecInf$31443 = -4
$T31523 = -8
?AscendRecord@ERIFile@@QAEXXZ PROC NEAR			; ERIFile::AscendRecord
; Line 850
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 851
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	SHORT $L31442
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [edx+16], 0
	je	SHORT $L31442
; Line 853
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	edx, DWORD PTR [ecx+16]
	mov	DWORD PTR _pRecInf$31443[ebp], edx
; Line 854
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	SHORT $L31444
; Line 855
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+16]
$L31444:
; Line 856
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR $T31523[ebp], ecx
	mov	edx, DWORD PTR $T31523[ebp]
	push	edx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
; Line 857
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _pRecInf$31443[ebp]
	mov	DWORD PTR [eax+8], ecx
$L31442:
; Line 859
	mov	esp, ebp
	pop	ebp
	ret	0
?AscendRecord@ERIFile@@QAEXXZ ENDP			; ERIFile::AscendRecord
_TEXT	ENDS
PUBLIC	?GetRecordID@ERIFile@@QBE_KXZ			; ERIFile::GetRecordID
_TEXT	SEGMENT
_this$ = -4
?GetRecordID@ERIFile@@QBE_KXZ PROC NEAR			; ERIFile::GetRecordID
; Line 865
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 866
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	SHORT $L31524
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR -12+[ebp], eax
	mov	ecx, DWORD PTR [edx+4]
	mov	DWORD PTR -12+[ebp+4], ecx
	jmp	SHORT $L31525
$L31524:
	mov	DWORD PTR -12+[ebp], 0
	mov	DWORD PTR -12+[ebp+4], 0
$L31525:
	mov	eax, DWORD PTR -12+[ebp]
	mov	edx, DWORD PTR -12+[ebp+4]
; Line 867
	mov	esp, ebp
	pop	ebp
	ret	0
?GetRecordID@ERIFile@@QBE_KXZ ENDP			; ERIFile::GetRecordID
_ptrBuf$ = 8
_dwByte$ = 12
_this$ = -8
_dwReadBytes$ = -4
?Read@ERIFile@@UAEKPAXK@Z PROC NEAR			; ERIFile::Read
; Line 873
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 874
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L31453
; Line 875
	xor	eax, eax
	jmp	SHORT $L31452
$L31453:
; Line 876
	mov	ecx, DWORD PTR _this$[ebp]
	mov	esi, DWORD PTR [ecx+8]
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+4]
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [edx]
	call	DWORD PTR [eax+12]
	mov	ecx, DWORD PTR [esi+24]
	sub	ecx, eax
	mov	DWORD PTR _dwReadBytes$[ebp], ecx
; Line 877
	mov	edx, DWORD PTR _dwReadBytes$[ebp]
	cmp	edx, DWORD PTR _dwByte$[ebp]
	jbe	SHORT $L31455
; Line 878
	mov	eax, DWORD PTR _dwByte$[ebp]
	mov	DWORD PTR _dwReadBytes$[ebp], eax
$L31455:
; Line 879
	mov	ecx, DWORD PTR _dwReadBytes$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrBuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+4]
$L31452:
; Line 880
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
?Read@ERIFile@@UAEKPAXK@Z ENDP				; ERIFile::Read
_this$ = -4
?GetLength@ERIFile@@UAEKXZ PROC NEAR			; ERIFile::GetLength
; Line 886
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 887
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L31459
; Line 888
	xor	eax, eax
	jmp	SHORT $L31458
$L31459:
; Line 889
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [edx+24]
	sub	eax, DWORD PTR [ecx+20]
$L31458:
; Line 890
	mov	esp, ebp
	pop	ebp
	ret	0
?GetLength@ERIFile@@UAEKXZ ENDP				; ERIFile::GetLength
_this$ = -4
?GetPointer@ERIFile@@UAEKXZ PROC NEAR			; ERIFile::GetPointer
; Line 896
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 897
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L31463
; Line 898
	xor	eax, eax
	jmp	SHORT $L31462
$L31463:
; Line 899
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+12]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	sub	eax, DWORD PTR [edx+20]
$L31462:
; Line 900
	mov	esp, ebp
	pop	ebp
	ret	0
?GetPointer@ERIFile@@UAEKXZ ENDP			; ERIFile::GetPointer
_dwPointer$ = 8
_this$ = -4
?Seek@ERIFile@@UAEXK@Z PROC NEAR			; ERIFile::Seek
; Line 906
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 907
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	SHORT $L31467
; Line 908
	jmp	SHORT $L31466
$L31467:
; Line 909
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	eax, DWORD PTR _dwPointer$[ebp]
	add	eax, DWORD PTR [edx+20]
	mov	DWORD PTR _dwPointer$[ebp], eax
; Line 910
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	eax, DWORD PTR _dwPointer$[ebp]
	cmp	eax, DWORD PTR [edx+24]
	jbe	SHORT $L31468
; Line 911
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR _dwPointer$[ebp], eax
$L31468:
; Line 912
	mov	ecx, DWORD PTR _dwPointer$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+4]
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [edx]
	call	DWORD PTR [eax+16]
$L31466:
; Line 913
	mov	esp, ebp
	pop	ebp
	ret	4
?Seek@ERIFile@@UAEXK@Z ENDP				; ERIFile::Seek
_TEXT	ENDS
END
