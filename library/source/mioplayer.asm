	TITLE	I:\EntisGLS\eri-chan\experi\mioplayer.cpp
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
;	COMDAT ??_GEPreloadBuffer@MIODynamicPlayer@@UAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_7EPreloadBuffer@MIODynamicPlayer@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
;	COMDAT ??_7MIODynamicPlayer@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	??0EPreloadBuffer@MIODynamicPlayer@@QAE@K@Z	; MIODynamicPlayer::EPreloadBuffer::EPreloadBuffer
PUBLIC	??_7EPreloadBuffer@MIODynamicPlayer@@6B@	; MIODynamicPlayer::EPreloadBuffer::`vftable'
PUBLIC	??_GEPreloadBuffer@MIODynamicPlayer@@UAEPAXI@Z	; MIODynamicPlayer::EPreloadBuffer::`scalar deleting destructor'
;PUBLIC	??_EEPreloadBuffer@MIODynamicPlayer@@UAEPAXI@Z	; MIODynamicPlayer::EPreloadBuffer::`vector deleting destructor'
EXTRN	?eriAllocateMemory@@YAPAXK@Z:NEAR		; eriAllocateMemory
EXTRN	??0EMemFile@@QAE@PBEK@Z:NEAR			; EMemFile::EMemFile
EXTRN	?Read@EMemFile@@UAEKPAXK@Z:NEAR			; EMemFile::Read
EXTRN	?GetLength@EMemFile@@UAEKXZ:NEAR		; EMemFile::GetLength
EXTRN	?GetPointer@EMemFile@@UAEKXZ:NEAR		; EMemFile::GetPointer
EXTRN	?Seek@EMemFile@@UAEXK@Z:NEAR			; EMemFile::Seek
;	COMDAT ??_7EPreloadBuffer@MIODynamicPlayer@@6B@
; File I:\EntisGLS\eri-chan\experi\mioplayer.cpp
CONST	SEGMENT
??_7EPreloadBuffer@MIODynamicPlayer@@6B@	LABEL	DWORD
; DD FLAT:??_EEPreloadBuffer@MIODynamicPlayer@@UAEPAXI@Z ; MIODynamicPlayer::EPreloadBuffer::`vftable'
	DD	FLAT:??_GEPreloadBuffer@MIODynamicPlayer@@UAEPAXI@Z
	DD	FLAT:?Read@EMemFile@@UAEKPAXK@Z
	DD	FLAT:?GetLength@EMemFile@@UAEKXZ
	DD	FLAT:?GetPointer@EMemFile@@UAEKXZ
	DD	FLAT:?Seek@EMemFile@@UAEXK@Z
CONST	ENDS
_TEXT	SEGMENT
_dwLength$ = 8
_this$ = -4
??0EPreloadBuffer@MIODynamicPlayer@@QAE@K@Z PROC NEAR	; MIODynamicPlayer::EPreloadBuffer::EPreloadBuffer
; File I:\EntisGLS\eri-chan\experi\mioplayer.cpp
; Line 31
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _dwLength$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0EMemFile@@QAE@PBEK@Z			; EMemFile::EMemFile
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx], OFFSET FLAT:??_7EPreloadBuffer@MIODynamicPlayer@@6B@ ; MIODynamicPlayer::EPreloadBuffer::`vftable'
; Line 32
	mov	edx, DWORD PTR _dwLength$[ebp]
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 33
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	mov	DWORD PTR [edx+4], ecx
; Line 34
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+20], 0
; Line 35
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??0EPreloadBuffer@MIODynamicPlayer@@QAE@K@Z ENDP	; MIODynamicPlayer::EPreloadBuffer::EPreloadBuffer
_TEXT	ENDS
PUBLIC	??1EPreloadBuffer@MIODynamicPlayer@@UAE@XZ	; MIODynamicPlayer::EPreloadBuffer::~EPreloadBuffer
EXTRN	??3@YAXPAX@Z:NEAR				; operator delete
;	COMDAT ??_GEPreloadBuffer@MIODynamicPlayer@@UAEPAXI@Z
_TEXT	SEGMENT
___flags$ = 8
_this$ = -4
??_GEPreloadBuffer@MIODynamicPlayer@@UAEPAXI@Z PROC NEAR ; MIODynamicPlayer::EPreloadBuffer::`scalar deleting destructor', COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1EPreloadBuffer@MIODynamicPlayer@@UAE@XZ ; MIODynamicPlayer::EPreloadBuffer::~EPreloadBuffer
	mov	eax, DWORD PTR ___flags$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L31047
	mov	ecx, DWORD PTR _this$[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L31047:
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??_GEPreloadBuffer@MIODynamicPlayer@@UAEPAXI@Z ENDP	; MIODynamicPlayer::EPreloadBuffer::`scalar deleting destructor'
_TEXT	ENDS
EXTRN	?eriFreeMemory@@YAXPAX@Z:NEAR			; eriFreeMemory
EXTRN	??1EMemFile@@UAE@XZ:NEAR			; EMemFile::~EMemFile
_TEXT	SEGMENT
_this$ = -4
??1EPreloadBuffer@MIODynamicPlayer@@UAE@XZ PROC NEAR	; MIODynamicPlayer::EPreloadBuffer::~EPreloadBuffer
; Line 41
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EPreloadBuffer@MIODynamicPlayer@@6B@ ; MIODynamicPlayer::EPreloadBuffer::`vftable'
; Line 42
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1EMemFile@@UAE@XZ			; EMemFile::~EMemFile
; Line 43
	mov	esp, ebp
	pop	ebp
	ret	0
??1EPreloadBuffer@MIODynamicPlayer@@UAE@XZ ENDP		; MIODynamicPlayer::EPreloadBuffer::~EPreloadBuffer
_TEXT	ENDS
PUBLIC	??0EPreloadQueue@MIODynamicPlayer@@QAE@XZ	; MIODynamicPlayer::EPreloadQueue::EPreloadQueue
_TEXT	SEGMENT
_this$ = -4
??0EPreloadQueue@MIODynamicPlayer@@QAE@XZ PROC NEAR	; MIODynamicPlayer::EPreloadQueue::EPreloadQueue
; Line 49
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 50
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], 0
; Line 51
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], 0
; Line 52
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], 0
; Line 53
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0EPreloadQueue@MIODynamicPlayer@@QAE@XZ ENDP		; MIODynamicPlayer::EPreloadQueue::EPreloadQueue
_TEXT	ENDS
PUBLIC	??1EPreloadQueue@MIODynamicPlayer@@QAE@XZ	; MIODynamicPlayer::EPreloadQueue::~EPreloadQueue
PUBLIC	?RemoveAll@EPreloadQueue@MIODynamicPlayer@@QAEXXZ ; MIODynamicPlayer::EPreloadQueue::RemoveAll
_TEXT	SEGMENT
_this$ = -4
??1EPreloadQueue@MIODynamicPlayer@@QAE@XZ PROC NEAR	; MIODynamicPlayer::EPreloadQueue::~EPreloadQueue
; Line 59
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 60
	mov	ecx, DWORD PTR _this$[ebp]
	call	?RemoveAll@EPreloadQueue@MIODynamicPlayer@@QAEXXZ ; MIODynamicPlayer::EPreloadQueue::RemoveAll
; Line 61
	mov	esp, ebp
	pop	ebp
	ret	0
??1EPreloadQueue@MIODynamicPlayer@@QAE@XZ ENDP		; MIODynamicPlayer::EPreloadQueue::~EPreloadQueue
_TEXT	ENDS
PUBLIC	?SetLimit@EPreloadQueue@MIODynamicPlayer@@QAEXI@Z ; MIODynamicPlayer::EPreloadQueue::SetLimit
_TEXT	SEGMENT
_nLimit$ = 8
_this$ = -4
?SetLimit@EPreloadQueue@MIODynamicPlayer@@QAEXI@Z PROC NEAR ; MIODynamicPlayer::EPreloadQueue::SetLimit
; Line 67
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 68
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nLimit$[ebp]
	mov	DWORD PTR [eax+8], ecx
; Line 70
	mov	edx, DWORD PTR _nLimit$[ebp]
	shl	edx, 2
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 71
	mov	esp, ebp
	pop	ebp
	ret	4
?SetLimit@EPreloadQueue@MIODynamicPlayer@@QAEXI@Z ENDP	; MIODynamicPlayer::EPreloadQueue::SetLimit
_this$ = -16
_i$31066 = -4
$T31402 = -8
$T31403 = -12
?RemoveAll@EPreloadQueue@MIODynamicPlayer@@QAEXXZ PROC NEAR ; MIODynamicPlayer::EPreloadQueue::RemoveAll
; Line 77
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 78
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L31065
; Line 80
	mov	DWORD PTR _i$31066[ebp], 0
	jmp	SHORT $L31067
$L31068:
	mov	ecx, DWORD PTR _i$31066[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$31066[ebp], ecx
$L31067:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$31066[ebp]
	cmp	eax, DWORD PTR [edx+4]
	jae	SHORT $L31069
; Line 82
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _i$31066[ebp]
	mov	ecx, DWORD PTR [edx+eax*4]
	mov	DWORD PTR $T31403[ebp], ecx
	mov	edx, DWORD PTR $T31403[ebp]
	mov	DWORD PTR $T31402[ebp], edx
	cmp	DWORD PTR $T31402[ebp], 0
	je	SHORT $L31404
	push	1
	mov	eax, DWORD PTR $T31402[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR $T31402[ebp]
	call	DWORD PTR [edx]
	mov	DWORD PTR -20+[ebp], eax
	jmp	SHORT $L31405
$L31404:
	mov	DWORD PTR -20+[ebp], 0
$L31405:
; Line 83
	jmp	SHORT $L31068
$L31069:
; Line 84
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 85
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx], 0
; Line 86
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 87
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+8], 0
$L31065:
; Line 89
	mov	esp, ebp
	pop	ebp
	ret	0
?RemoveAll@EPreloadQueue@MIODynamicPlayer@@QAEXXZ ENDP	; MIODynamicPlayer::EPreloadQueue::RemoveAll
_TEXT	ENDS
PUBLIC	??0EKeyPointList@MIODynamicPlayer@@QAE@XZ	; MIODynamicPlayer::EKeyPointList::EKeyPointList
_TEXT	SEGMENT
_this$ = -4
??0EKeyPointList@MIODynamicPlayer@@QAE@XZ PROC NEAR	; MIODynamicPlayer::EKeyPointList::EKeyPointList
; Line 95
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 96
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], 0
; Line 97
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], 0
; Line 98
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], 0
; Line 99
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0EKeyPointList@MIODynamicPlayer@@QAE@XZ ENDP		; MIODynamicPlayer::EKeyPointList::EKeyPointList
_TEXT	ENDS
PUBLIC	??1EKeyPointList@MIODynamicPlayer@@QAE@XZ	; MIODynamicPlayer::EKeyPointList::~EKeyPointList
PUBLIC	?RemoveAll@EKeyPointList@MIODynamicPlayer@@QAEXXZ ; MIODynamicPlayer::EKeyPointList::RemoveAll
_TEXT	SEGMENT
_this$ = -4
??1EKeyPointList@MIODynamicPlayer@@QAE@XZ PROC NEAR	; MIODynamicPlayer::EKeyPointList::~EKeyPointList
; Line 105
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 106
	mov	ecx, DWORD PTR _this$[ebp]
	call	?RemoveAll@EKeyPointList@MIODynamicPlayer@@QAEXXZ ; MIODynamicPlayer::EKeyPointList::RemoveAll
; Line 107
	mov	esp, ebp
	pop	ebp
	ret	0
??1EKeyPointList@MIODynamicPlayer@@QAE@XZ ENDP		; MIODynamicPlayer::EKeyPointList::~EKeyPointList
_TEXT	ENDS
PUBLIC	?SetLimit@EKeyPointList@MIODynamicPlayer@@QAEXI@Z ; MIODynamicPlayer::EKeyPointList::SetLimit
_TEXT	SEGMENT
_nLimit$ = 8
_this$ = -12
_pLastList$ = -4
_i$ = -8
?SetLimit@EKeyPointList@MIODynamicPlayer@@QAEXI@Z PROC NEAR ; MIODynamicPlayer::EKeyPointList::SetLimit
; Line 113
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 114
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _pLastList$[ebp], ecx
; Line 116
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nLimit$[ebp]
	mov	DWORD PTR [edx+8], eax
; Line 118
	mov	ecx, DWORD PTR _nLimit$[ebp]
	shl	ecx, 3
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx], eax
; Line 120
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31085
$L31086:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31085:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jae	SHORT $L31087
; Line 122
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pLastList$[ebp]
	mov	edx, DWORD PTR [ecx+eax*8]
	mov	eax, DWORD PTR [ecx+eax*8+4]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	esi, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx+esi*8], edx
	mov	DWORD PTR [ecx+esi*8+4], eax
; Line 123
	jmp	SHORT $L31086
$L31087:
; Line 125
	cmp	DWORD PTR _pLastList$[ebp], 0
	je	SHORT $L31088
; Line 127
	mov	edx, DWORD PTR _pLastList$[ebp]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31088:
; Line 129
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?SetLimit@EKeyPointList@MIODynamicPlayer@@QAEXI@Z ENDP	; MIODynamicPlayer::EKeyPointList::SetLimit
_this$ = -4
?RemoveAll@EKeyPointList@MIODynamicPlayer@@QAEXXZ PROC NEAR ; MIODynamicPlayer::EKeyPointList::RemoveAll
; Line 135
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 136
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L31092
; Line 138
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 139
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], 0
; Line 140
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], 0
; Line 141
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], 0
$L31092:
; Line 143
	mov	esp, ebp
	pop	ebp
	ret	0
?RemoveAll@EKeyPointList@MIODynamicPlayer@@QAEXXZ ENDP	; MIODynamicPlayer::EKeyPointList::RemoveAll
_TEXT	ENDS
PUBLIC	?AllocateWaveBuffer@MIODynamicPlayer@@UAEPAXK@Z	; MIODynamicPlayer::AllocateWaveBuffer
PUBLIC	?DeleteWaveBuffer@MIODynamicPlayer@@UAEXPAX@Z	; MIODynamicPlayer::DeleteWaveBuffer
PUBLIC	?CreateMIODecoder@MIODynamicPlayer@@UAEPAVMIODecoder@@XZ ; MIODynamicPlayer::CreateMIODecoder
PUBLIC	??_7MIODynamicPlayer@@6B@			; MIODynamicPlayer::`vftable'
PUBLIC	??0MIODynamicPlayer@@QAE@XZ			; MIODynamicPlayer::MIODynamicPlayer
PUBLIC	?GetWaveBufferFrom@MIODynamicPlayer@@UAEPAXKAAK0@Z ; MIODynamicPlayer::GetWaveBufferFrom
PUBLIC	?IsNextDataRewound@MIODynamicPlayer@@UAE_NXZ	; MIODynamicPlayer::IsNextDataRewound
PUBLIC	?GetNextWaveBuffer@MIODynamicPlayer@@UAEPAXAAK@Z ; MIODynamicPlayer::GetNextWaveBuffer
EXTRN	__imp__InitializeCriticalSection@4:NEAR
EXTRN	??0ERIFile@@QAE@XZ:NEAR				; ERIFile::ERIFile
;	COMDAT ??_7MIODynamicPlayer@@6B@
; File I:\EntisGLS\eri-chan\experi\mioplayer.cpp
CONST	SEGMENT
??_7MIODynamicPlayer@@6B@ DD FLAT:?GetWaveBufferFrom@MIODynamicPlayer@@UAEPAXKAAK0@Z ; MIODynamicPlayer::`vftable'
	DD	FLAT:?IsNextDataRewound@MIODynamicPlayer@@UAE_NXZ
	DD	FLAT:?GetNextWaveBuffer@MIODynamicPlayer@@UAEPAXAAK@Z
	DD	FLAT:?AllocateWaveBuffer@MIODynamicPlayer@@UAEPAXK@Z
	DD	FLAT:?DeleteWaveBuffer@MIODynamicPlayer@@UAEXPAX@Z
	DD	FLAT:?CreateMIODecoder@MIODynamicPlayer@@UAEPAVMIODecoder@@XZ
CONST	ENDS
_TEXT	SEGMENT
_this$ = -4
??0MIODynamicPlayer@@QAE@XZ PROC NEAR			; MIODynamicPlayer::MIODynamicPlayer
; File I:\EntisGLS\eri-chan\experi\mioplayer.cpp
; Line 149
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	call	??0ERIFile@@QAE@XZ			; ERIFile::ERIFile
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1272				; 000004f8H
	call	??0EPreloadQueue@MIODynamicPlayer@@QAE@XZ ; MIODynamicPlayer::EPreloadQueue::EPreloadQueue
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1296				; 00000510H
	call	??0EKeyPointList@MIODynamicPlayer@@QAE@XZ ; MIODynamicPlayer::EKeyPointList::EKeyPointList
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7MIODynamicPlayer@@6B@ ; MIODynamicPlayer::`vftable'
; Line 150
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1256], 0
; Line 151
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+1260], 0
; Line 152
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+1264], 0
; Line 153
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1284], 0
; Line 154
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+1288], 0
; Line 155
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+1292], 0
; Line 156
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1308				; 0000051cH
	push	ecx
	call	DWORD PTR __imp__InitializeCriticalSection@4
; Line 157
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0MIODynamicPlayer@@QAE@XZ ENDP			; MIODynamicPlayer::MIODynamicPlayer
_TEXT	ENDS
PUBLIC	??1MIODynamicPlayer@@QAE@XZ			; MIODynamicPlayer::~MIODynamicPlayer
PUBLIC	?Close@MIODynamicPlayer@@QAEXXZ			; MIODynamicPlayer::Close
EXTRN	__imp__DeleteCriticalSection@4:NEAR
EXTRN	??1ERIFile@@UAE@XZ:NEAR				; ERIFile::~ERIFile
_TEXT	SEGMENT
_this$ = -4
??1MIODynamicPlayer@@QAE@XZ PROC NEAR			; MIODynamicPlayer::~MIODynamicPlayer
; Line 163
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7MIODynamicPlayer@@6B@ ; MIODynamicPlayer::`vftable'
; Line 164
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Close@MIODynamicPlayer@@QAEXXZ		; MIODynamicPlayer::Close
; Line 165
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1308				; 0000051cH
	push	ecx
	call	DWORD PTR __imp__DeleteCriticalSection@4
; Line 166
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1296				; 00000510H
	call	??1EKeyPointList@MIODynamicPlayer@@QAE@XZ ; MIODynamicPlayer::EKeyPointList::~EKeyPointList
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1272				; 000004f8H
	call	??1EPreloadQueue@MIODynamicPlayer@@QAE@XZ ; MIODynamicPlayer::EPreloadQueue::~EPreloadQueue
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	call	??1ERIFile@@UAE@XZ			; ERIFile::~ERIFile
	mov	esp, ebp
	pop	ebp
	ret	0
??1MIODynamicPlayer@@QAE@XZ ENDP			; MIODynamicPlayer::~MIODynamicPlayer
_TEXT	ENDS
PUBLIC	?ThreadProc@MIODynamicPlayer@@KGKPAX@Z		; MIODynamicPlayer::ThreadProc
PUBLIC	?Open@MIODynamicPlayer@@QAE_NPAVEFileObject@@I@Z ; MIODynamicPlayer::Open
EXTRN	??2@YAPAXI@Z:NEAR				; operator new
EXTRN	__imp__CreateEventA@16:NEAR
EXTRN	??0EFileDecodeContext@@QAE@PAVEFileObject@@K@Z:NEAR ; EFileDecodeContext::EFileDecodeContext
EXTRN	__imp__CreateThread@24:NEAR
EXTRN	__imp__WaitForMultipleObjects@16:NEAR
EXTRN	?Open@ERIFile@@QAE_NPAVEFileObject@@W4OpenType@1@@Z:NEAR ; ERIFile::Open
_TEXT	SEGMENT
_pFile$ = 8
_nPreloadSize$ = 12
_this$ = -20
_hEventList$ = -8
_dwWaitResult$ = -12
$T31406 = -16
?Open@MIODynamicPlayer@@QAE_NPAVEFileObject@@I@Z PROC NEAR ; MIODynamicPlayer::Open
; Line 173
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 174
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Close@MIODynamicPlayer@@QAEXXZ		; MIODynamicPlayer::Close
; Line 178
	push	2
	mov	eax, DWORD PTR _pFile$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	call	?Open@ERIFile@@QAE_NPAVEFileObject@@W4OpenType@1@@Z ; ERIFile::Open
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31103
; Line 180
	xor	al, al
	jmp	$L31102
$L31103:
; Line 185
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	and	edx, 8
	test	edx, edx
	jne	SHORT $L31104
; Line 187
	xor	al, al
	jmp	$L31102
$L31104:
; Line 189
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+20]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1260], eax
; Line 190
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 176				; 000000b0H
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1260]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1260]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+4]
	test	eax, eax
	je	SHORT $L31105
; Line 192
	xor	al, al
	jmp	$L31102
$L31105:
; Line 194
	push	3160					; 00000c58H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR $T31406[ebp], eax
	cmp	DWORD PTR $T31406[ebp], 0
	je	SHORT $L31407
	push	65536					; 00010000H
	push	0
	mov	ecx, DWORD PTR $T31406[ebp]
	call	??0EFileDecodeContext@@QAE@PAVEFileObject@@K@Z ; EFileDecodeContext::EFileDecodeContext
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L31408
$L31407:
	mov	DWORD PTR -24+[ebp], 0
$L31408:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR -24+[ebp]
	mov	DWORD PTR [eax+1256], ecx
; Line 198
	cmp	DWORD PTR _nPreloadSize$[ebp], 0
	jne	SHORT $L31108
; Line 200
	mov	DWORD PTR _nPreloadSize$[ebp], 8
$L31108:
; Line 202
	mov	edx, DWORD PTR _nPreloadSize$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1272				; 000004f8H
	call	?SetLimit@EPreloadQueue@MIODynamicPlayer@@QAEXI@Z ; MIODynamicPlayer::EPreloadQueue::SetLimit
; Line 206
	push	0
	push	0
	push	1
	push	0
	call	DWORD PTR __imp__CreateEventA@16
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1284], eax
; Line 207
	push	0
	push	0
	push	1
	push	0
	call	DWORD PTR __imp__CreateEventA@16
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+1288], eax
; Line 208
	push	0
	push	1
	push	1
	push	0
	call	DWORD PTR __imp__CreateEventA@16
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1292], eax
; Line 210
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 1268				; 000004f4H
	push	edx
	push	0
	mov	eax, DWORD PTR _this$[ebp]
	push	eax
	push	OFFSET FLAT:?ThreadProc@MIODynamicPlayer@@KGKPAX@Z ; MIODynamicPlayer::ThreadProc
	push	0
	push	0
	call	DWORD PTR __imp__CreateThread@24
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1264], eax
; Line 211
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+1288], 0
	je	SHORT $L31110
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1292], 0
	je	SHORT $L31110
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+1264], 0
	jne	SHORT $L31109
$L31110:
; Line 213
	xor	al, al
	jmp	SHORT $L31102
$L31109:
; Line 217
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1284]
	mov	DWORD PTR _hEventList$[ebp], eax
; Line 218
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1264]
	mov	DWORD PTR _hEventList$[ebp+4], edx
; Line 220
	push	-1
	push	0
	lea	eax, DWORD PTR _hEventList$[ebp]
	push	eax
	push	2
	call	DWORD PTR __imp__WaitForMultipleObjects@16
	mov	DWORD PTR _dwWaitResult$[ebp], eax
; Line 221
	cmp	DWORD PTR _dwWaitResult$[ebp], 0
	je	SHORT $L31114
; Line 223
	xor	al, al
	jmp	SHORT $L31102
$L31114:
; Line 226
	mov	al, 1
$L31102:
; Line 227
	mov	esp, ebp
	pop	ebp
	ret	8
?Open@MIODynamicPlayer@@QAE_NPAVEFileObject@@I@Z ENDP	; MIODynamicPlayer::Open
_TEXT	ENDS
EXTRN	__imp__PostThreadMessageA@16:NEAR
EXTRN	__imp__WaitForSingleObject@8:NEAR
EXTRN	__imp__CloseHandle@4:NEAR
EXTRN	?Close@ERIFile@@QAEXXZ:NEAR			; ERIFile::Close
_TEXT	SEGMENT
_this$ = -20
$T31409 = -4
$T31410 = -8
$T31413 = -12
$T31414 = -16
?Close@MIODynamicPlayer@@QAEXXZ PROC NEAR		; MIODynamicPlayer::Close
; Line 233
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 236
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1264], 0
	je	SHORT $L31118
; Line 238
	push	0
	push	0
	push	1025					; 00000401H
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1268]
	push	edx
	call	DWORD PTR __imp__PostThreadMessageA@16
; Line 239
	push	-1
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1264]
	push	ecx
	call	DWORD PTR __imp__WaitForSingleObject@8
; Line 240
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1264]
	push	eax
	call	DWORD PTR __imp__CloseHandle@4
; Line 241
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1264], 0
$L31118:
; Line 245
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+1284], 0
	je	SHORT $L31119
; Line 247
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1284]
	push	ecx
	call	DWORD PTR __imp__CloseHandle@4
; Line 248
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+1284], 0
$L31119:
; Line 250
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1288], 0
	je	SHORT $L31120
; Line 252
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1288]
	push	edx
	call	DWORD PTR __imp__CloseHandle@4
; Line 253
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+1288], 0
$L31120:
; Line 255
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+1292], 0
	je	SHORT $L31121
; Line 257
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1292]
	push	eax
	call	DWORD PTR __imp__CloseHandle@4
; Line 258
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1292], 0
$L31121:
; Line 260
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1272				; 000004f8H
	call	?RemoveAll@EPreloadQueue@MIODynamicPlayer@@QAEXXZ ; MIODynamicPlayer::EPreloadQueue::RemoveAll
; Line 263
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1296				; 00000510H
	call	?RemoveAll@EKeyPointList@MIODynamicPlayer@@QAEXXZ ; MIODynamicPlayer::EKeyPointList::RemoveAll
; Line 266
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+1260], 0
	je	SHORT $L31122
; Line 268
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1260]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1260]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+8]
; Line 269
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1260]
	mov	DWORD PTR $T31410[ebp], ecx
	mov	edx, DWORD PTR $T31410[ebp]
	mov	DWORD PTR $T31409[ebp], edx
	cmp	DWORD PTR $T31409[ebp], 0
	je	SHORT $L31411
	push	1
	mov	eax, DWORD PTR $T31409[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR $T31409[ebp]
	call	DWORD PTR [edx]
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L31412
$L31411:
	mov	DWORD PTR -24+[ebp], 0
$L31412:
; Line 270
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+1260], 0
$L31122:
; Line 272
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+1256], 0
	je	SHORT $L31125
; Line 274
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1256]
	mov	DWORD PTR $T31414[ebp], eax
	mov	ecx, DWORD PTR $T31414[ebp]
	mov	DWORD PTR $T31413[ebp], ecx
	cmp	DWORD PTR $T31413[ebp], 0
	je	SHORT $L31415
	push	1
	mov	edx, DWORD PTR $T31413[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR $T31413[ebp]
	call	DWORD PTR [eax]
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L31416
$L31415:
	mov	DWORD PTR -28+[ebp], 0
$L31416:
; Line 275
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1256], 0
$L31125:
; Line 279
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	call	?Close@ERIFile@@QAEXXZ			; ERIFile::Close
; Line 280
	mov	esp, ebp
	pop	ebp
	ret	0
?Close@MIODynamicPlayer@@QAEXXZ ENDP			; MIODynamicPlayer::Close
_TEXT	ENDS
PUBLIC	?GetChannelCount@MIODynamicPlayer@@QBEKXZ	; MIODynamicPlayer::GetChannelCount
PUBLIC	?GetBitsPerSample@MIODynamicPlayer@@QBEKXZ	; MIODynamicPlayer::GetBitsPerSample
PUBLIC	?GetPreloadBuffer@MIODynamicPlayer@@IAEPAVEPreloadBuffer@1@XZ ; MIODynamicPlayer::GetPreloadBuffer
EXTRN	?AttachFileObject@EFileDecodeContext@@QAEXPAVEFileObject@@@Z:NEAR ; EFileDecodeContext::AttachFileObject
_TEXT	SEGMENT
_nSample$ = 8
_dwBytes$ = 12
_dwOffsetBytes$ = 16
_this$ = -44
_hEventList$ = -20
_dwWaitResult$ = -24
_pBuffer$ = -8
_dwSampleBytes$ = -12
_ptrWaveBuf$ = -4
$T31417 = -28
$T31418 = -32
$T31421 = -36
$T31422 = -40
?GetWaveBufferFrom@MIODynamicPlayer@@UAEPAXKAAK0@Z PROC NEAR ; MIODynamicPlayer::GetWaveBufferFrom
; Line 287
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 291
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1264], 0
	jne	SHORT $L31133
; Line 293
	xor	eax, eax
	jmp	$L31132
$L31133:
; Line 296
	push	0
	push	0
	push	1
	push	0
	call	DWORD PTR __imp__CreateEventA@16
	mov	DWORD PTR _hEventList$[ebp], eax
; Line 297
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1264]
	mov	DWORD PTR _hEventList$[ebp+4], edx
; Line 299
	mov	eax, DWORD PTR _hEventList$[ebp]
	push	eax
	mov	ecx, DWORD PTR _nSample$[ebp]
	push	ecx
	push	1024					; 00000400H
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1268]
	push	eax
	call	DWORD PTR __imp__PostThreadMessageA@16
; Line 301
	push	-1
	push	0
	lea	ecx, DWORD PTR _hEventList$[ebp]
	push	ecx
	push	2
	call	DWORD PTR __imp__WaitForMultipleObjects@16
	mov	DWORD PTR _dwWaitResult$[ebp], eax
; Line 302
	mov	edx, DWORD PTR _hEventList$[ebp]
	push	edx
	call	DWORD PTR __imp__CloseHandle@4
; Line 303
	cmp	DWORD PTR _dwWaitResult$[ebp], 0
	je	SHORT $L31139
; Line 305
	xor	eax, eax
	jmp	$L31132
$L31139:
; Line 310
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetPreloadBuffer@MIODynamicPlayer@@IAEPAVEPreloadBuffer@1@XZ ; MIODynamicPlayer::GetPreloadBuffer
	mov	DWORD PTR _pBuffer$[ebp], eax
; Line 311
	cmp	DWORD PTR _pBuffer$[ebp], 0
	jne	SHORT $L31141
; Line 313
	xor	eax, eax
	jmp	$L31132
$L31141:
; Line 315
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetChannelCount@MIODynamicPlayer@@QBEKXZ ; MIODynamicPlayer::GetChannelCount
	mov	esi, eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetBitsPerSample@MIODynamicPlayer@@QBEKXZ ; MIODynamicPlayer::GetBitsPerSample
	imul	esi, eax
	shr	esi, 3
	mov	DWORD PTR _dwSampleBytes$[ebp], esi
; Line 316
	mov	eax, DWORD PTR _pBuffer$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	imul	ecx, DWORD PTR _dwSampleBytes$[ebp]
	mov	edx, DWORD PTR _dwBytes$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 317
	mov	eax, DWORD PTR _pBuffer$[ebp]
	mov	ecx, DWORD PTR _nSample$[ebp]
	sub	ecx, DWORD PTR [eax+20]
	imul	ecx, DWORD PTR _dwSampleBytes$[ebp]
	mov	edx, DWORD PTR _dwOffsetBytes$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 319
	mov	eax, DWORD PTR _dwBytes$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [eax+12]
	mov	DWORD PTR _ptrWaveBuf$[ebp], eax
; Line 321
	mov	ecx, DWORD PTR _pBuffer$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+1256]
	call	?AttachFileObject@EFileDecodeContext@@QAEXPAVEFileObject@@@Z ; EFileDecodeContext::AttachFileObject
; Line 323
	mov	eax, DWORD PTR _ptrWaveBuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pBuffer$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1256]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+1260]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1260]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+12]
	test	eax, eax
	je	SHORT $L31144
; Line 325
	mov	eax, DWORD PTR _ptrWaveBuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+16]
; Line 326
	mov	eax, DWORD PTR _pBuffer$[ebp]
	mov	DWORD PTR $T31418[ebp], eax
	mov	ecx, DWORD PTR $T31418[ebp]
	mov	DWORD PTR $T31417[ebp], ecx
	cmp	DWORD PTR $T31417[ebp], 0
	je	SHORT $L31419
	push	1
	mov	edx, DWORD PTR $T31417[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR $T31417[ebp]
	call	DWORD PTR [eax]
	mov	DWORD PTR -48+[ebp], eax
	jmp	SHORT $L31420
$L31419:
	mov	DWORD PTR -48+[ebp], 0
$L31420:
; Line 327
	xor	eax, eax
	jmp	SHORT $L31132
$L31144:
; Line 329
	mov	ecx, DWORD PTR _pBuffer$[ebp]
	mov	DWORD PTR $T31422[ebp], ecx
	mov	edx, DWORD PTR $T31422[ebp]
	mov	DWORD PTR $T31421[ebp], edx
	cmp	DWORD PTR $T31421[ebp], 0
	je	SHORT $L31423
	push	1
	mov	eax, DWORD PTR $T31421[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR $T31421[ebp]
	call	DWORD PTR [edx]
	mov	DWORD PTR -52+[ebp], eax
	jmp	SHORT $L31424
$L31423:
	mov	DWORD PTR -52+[ebp], 0
$L31424:
; Line 331
	mov	eax, DWORD PTR _ptrWaveBuf$[ebp]
$L31132:
; Line 332
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?GetWaveBufferFrom@MIODynamicPlayer@@UAEPAXKAAK0@Z ENDP	; MIODynamicPlayer::GetWaveBufferFrom
_TEXT	ENDS
PUBLIC	?Lock@MIODynamicPlayer@@QAEXXZ			; MIODynamicPlayer::Lock
PUBLIC	?Unlock@MIODynamicPlayer@@QAEXXZ		; MIODynamicPlayer::Unlock
_TEXT	SEGMENT
_this$ = -24
_hEventList$ = -8
_dwWaitResult$ = -12
_fRewound$ = -16
_pBuffer$31159 = -20
?IsNextDataRewound@MIODynamicPlayer@@UAE_NXZ PROC NEAR	; MIODynamicPlayer::IsNextDataRewound
; Line 338
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 339
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1264], 0
	jne	SHORT $L31152
; Line 341
	xor	al, al
	jmp	SHORT $L31151
$L31152:
; Line 344
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1288]
	mov	DWORD PTR _hEventList$[ebp], edx
; Line 345
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1264]
	mov	DWORD PTR _hEventList$[ebp+4], ecx
; Line 347
	push	-1
	push	0
	lea	edx, DWORD PTR _hEventList$[ebp]
	push	edx
	push	2
	call	DWORD PTR __imp__WaitForMultipleObjects@16
	mov	DWORD PTR _dwWaitResult$[ebp], eax
; Line 348
	cmp	DWORD PTR _dwWaitResult$[ebp], 0
	je	SHORT $L31156
; Line 350
	xor	al, al
	jmp	SHORT $L31151
$L31156:
; Line 353
	mov	BYTE PTR _fRewound$[ebp], 0
; Line 354
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Lock@MIODynamicPlayer@@QAEXXZ		; MIODynamicPlayer::Lock
; Line 355
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1276], 0
	je	SHORT $L31158
; Line 357
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1272]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _pBuffer$31159[ebp], eax
; Line 358
	cmp	DWORD PTR _pBuffer$31159[ebp], 0
	je	SHORT $L31160
	mov	ecx, DWORD PTR _pBuffer$31159[ebp]
	cmp	DWORD PTR [ecx+20], 0
	jne	SHORT $L31160
; Line 360
	mov	BYTE PTR _fRewound$[ebp], 1
$L31160:
$L31158:
; Line 363
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Unlock@MIODynamicPlayer@@QAEXXZ	; MIODynamicPlayer::Unlock
; Line 365
	mov	al, BYTE PTR _fRewound$[ebp]
$L31151:
; Line 366
	mov	esp, ebp
	pop	ebp
	ret	0
?IsNextDataRewound@MIODynamicPlayer@@UAE_NXZ ENDP	; MIODynamicPlayer::IsNextDataRewound
_dwBytes$ = 8
_this$ = -32
_pBuffer$ = -8
_dwSampleBytes$ = -12
_ptrWaveBuf$ = -4
$T31425 = -16
$T31426 = -20
$T31429 = -24
$T31430 = -28
?GetNextWaveBuffer@MIODynamicPlayer@@UAEPAXAAK@Z PROC NEAR ; MIODynamicPlayer::GetNextWaveBuffer
; Line 372
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 373
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetPreloadBuffer@MIODynamicPlayer@@IAEPAVEPreloadBuffer@1@XZ ; MIODynamicPlayer::GetPreloadBuffer
	mov	DWORD PTR _pBuffer$[ebp], eax
; Line 374
	cmp	DWORD PTR _pBuffer$[ebp], 0
	jne	SHORT $L31165
; Line 376
	xor	eax, eax
	jmp	$L31163
$L31165:
; Line 378
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetChannelCount@MIODynamicPlayer@@QBEKXZ ; MIODynamicPlayer::GetChannelCount
	mov	esi, eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetBitsPerSample@MIODynamicPlayer@@QBEKXZ ; MIODynamicPlayer::GetBitsPerSample
	imul	esi, eax
	shr	esi, 3
	mov	DWORD PTR _dwSampleBytes$[ebp], esi
; Line 379
	mov	eax, DWORD PTR _pBuffer$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	imul	ecx, DWORD PTR _dwSampleBytes$[ebp]
	mov	edx, DWORD PTR _dwBytes$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 381
	mov	eax, DWORD PTR _dwBytes$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [eax+12]
	mov	DWORD PTR _ptrWaveBuf$[ebp], eax
; Line 383
	mov	ecx, DWORD PTR _pBuffer$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+1256]
	call	?AttachFileObject@EFileDecodeContext@@QAEXPAVEFileObject@@@Z ; EFileDecodeContext::AttachFileObject
; Line 385
	mov	eax, DWORD PTR _ptrWaveBuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pBuffer$[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1256]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+1260]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1260]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+12]
	test	eax, eax
	je	SHORT $L31168
; Line 387
	mov	eax, DWORD PTR _ptrWaveBuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+16]
; Line 388
	mov	eax, DWORD PTR _pBuffer$[ebp]
	mov	DWORD PTR $T31426[ebp], eax
	mov	ecx, DWORD PTR $T31426[ebp]
	mov	DWORD PTR $T31425[ebp], ecx
	cmp	DWORD PTR $T31425[ebp], 0
	je	SHORT $L31427
	push	1
	mov	edx, DWORD PTR $T31425[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR $T31425[ebp]
	call	DWORD PTR [eax]
	mov	DWORD PTR -36+[ebp], eax
	jmp	SHORT $L31428
$L31427:
	mov	DWORD PTR -36+[ebp], 0
$L31428:
; Line 389
	xor	eax, eax
	jmp	SHORT $L31163
$L31168:
; Line 391
	mov	ecx, DWORD PTR _pBuffer$[ebp]
	mov	DWORD PTR $T31430[ebp], ecx
	mov	edx, DWORD PTR $T31430[ebp]
	mov	DWORD PTR $T31429[ebp], edx
	cmp	DWORD PTR $T31429[ebp], 0
	je	SHORT $L31431
	push	1
	mov	eax, DWORD PTR $T31429[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR $T31429[ebp]
	call	DWORD PTR [edx]
	mov	DWORD PTR -40+[ebp], eax
	jmp	SHORT $L31432
$L31431:
	mov	DWORD PTR -40+[ebp], 0
$L31432:
; Line 393
	mov	eax, DWORD PTR _ptrWaveBuf$[ebp]
$L31163:
; Line 394
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?GetNextWaveBuffer@MIODynamicPlayer@@UAEPAXAAK@Z ENDP	; MIODynamicPlayer::GetNextWaveBuffer
_dwBytes$ = 8
_this$ = -4
?AllocateWaveBuffer@MIODynamicPlayer@@UAEPAXK@Z PROC NEAR ; MIODynamicPlayer::AllocateWaveBuffer
; Line 400
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 401
	mov	eax, DWORD PTR _dwBytes$[ebp]
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
; Line 402
	mov	esp, ebp
	pop	ebp
	ret	4
?AllocateWaveBuffer@MIODynamicPlayer@@UAEPAXK@Z ENDP	; MIODynamicPlayer::AllocateWaveBuffer
_ptrWaveBuf$ = 8
_this$ = -4
?DeleteWaveBuffer@MIODynamicPlayer@@UAEXPAX@Z PROC NEAR	; MIODynamicPlayer::DeleteWaveBuffer
; Line 408
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 409
	mov	eax, DWORD PTR _ptrWaveBuf$[ebp]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 410
	mov	esp, ebp
	pop	ebp
	ret	4
?DeleteWaveBuffer@MIODynamicPlayer@@UAEXPAX@Z ENDP	; MIODynamicPlayer::DeleteWaveBuffer
_TEXT	ENDS
EXTRN	??0MIODecoder@@QAE@XZ:NEAR			; MIODecoder::MIODecoder
_TEXT	SEGMENT
_this$ = -8
$T31433 = -4
?CreateMIODecoder@MIODynamicPlayer@@UAEPAVMIODecoder@@XZ PROC NEAR ; MIODynamicPlayer::CreateMIODecoder
; Line 415
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 416
	push	164					; 000000a4H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR $T31433[ebp], eax
	cmp	DWORD PTR $T31433[ebp], 0
	je	SHORT $L31434
	mov	ecx, DWORD PTR $T31433[ebp]
	call	??0MIODecoder@@QAE@XZ			; MIODecoder::MIODecoder
	mov	DWORD PTR -12+[ebp], eax
	jmp	SHORT $L31435
$L31434:
	mov	DWORD PTR -12+[ebp], 0
$L31435:
	mov	eax, DWORD PTR -12+[ebp]
; Line 417
	mov	esp, ebp
	pop	ebp
	ret	0
?CreateMIODecoder@MIODynamicPlayer@@UAEPAVMIODecoder@@XZ ENDP ; MIODynamicPlayer::CreateMIODecoder
_TEXT	ENDS
PUBLIC	?GetERIFile@MIODynamicPlayer@@QBEABVERIFile@@XZ	; MIODynamicPlayer::GetERIFile
_TEXT	SEGMENT
_this$ = -4
?GetERIFile@MIODynamicPlayer@@QBEABVERIFile@@XZ PROC NEAR ; MIODynamicPlayer::GetERIFile
; Line 423
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 424
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 4
; Line 425
	mov	esp, ebp
	pop	ebp
	ret	0
?GetERIFile@MIODynamicPlayer@@QBEABVERIFile@@XZ ENDP	; MIODynamicPlayer::GetERIFile
_this$ = -4
?GetChannelCount@MIODynamicPlayer@@QBEKXZ PROC NEAR	; MIODynamicPlayer::GetChannelCount
; Line 431
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 432
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+188]
; Line 433
	mov	esp, ebp
	pop	ebp
	ret	0
?GetChannelCount@MIODynamicPlayer@@QBEKXZ ENDP		; MIODynamicPlayer::GetChannelCount
_TEXT	ENDS
PUBLIC	?GetFrequency@MIODynamicPlayer@@QBEKXZ		; MIODynamicPlayer::GetFrequency
_TEXT	SEGMENT
_this$ = -4
?GetFrequency@MIODynamicPlayer@@QBEKXZ PROC NEAR	; MIODynamicPlayer::GetFrequency
; Line 439
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 440
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+192]
; Line 441
	mov	esp, ebp
	pop	ebp
	ret	0
?GetFrequency@MIODynamicPlayer@@QBEKXZ ENDP		; MIODynamicPlayer::GetFrequency
_this$ = -4
?GetBitsPerSample@MIODynamicPlayer@@QBEKXZ PROC NEAR	; MIODynamicPlayer::GetBitsPerSample
; Line 447
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 448
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+212]
; Line 449
	mov	esp, ebp
	pop	ebp
	ret	0
?GetBitsPerSample@MIODynamicPlayer@@QBEKXZ ENDP		; MIODynamicPlayer::GetBitsPerSample
_TEXT	ENDS
PUBLIC	?GetTotalSampleCount@MIODynamicPlayer@@QBEKXZ	; MIODynamicPlayer::GetTotalSampleCount
_TEXT	SEGMENT
_this$ = -4
?GetTotalSampleCount@MIODynamicPlayer@@QBEKXZ PROC NEAR	; MIODynamicPlayer::GetTotalSampleCount
; Line 455
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 456
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+204]
; Line 457
	mov	esp, ebp
	pop	ebp
	ret	0
?GetTotalSampleCount@MIODynamicPlayer@@QBEKXZ ENDP	; MIODynamicPlayer::GetTotalSampleCount
_TEXT	ENDS
EXTRN	__imp__SetEvent@4:NEAR
EXTRN	__imp__ResetEvent@4:NEAR
_TEXT	SEGMENT
_this$ = -24
_hEventList$ = -12
_dwWaitResult$ = -16
_pBuffer$ = -4
_i$31209 = -20
?GetPreloadBuffer@MIODynamicPlayer@@IAEPAVEPreloadBuffer@1@XZ PROC NEAR ; MIODynamicPlayer::GetPreloadBuffer
; Line 464
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 465
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1264], 0
	jne	SHORT $L31202
; Line 467
	xor	eax, eax
	jmp	$L31201
$L31202:
; Line 470
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1288]
	mov	DWORD PTR _hEventList$[ebp], edx
; Line 471
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1264]
	mov	DWORD PTR _hEventList$[ebp+4], ecx
; Line 473
	push	-1
	push	0
	lea	edx, DWORD PTR _hEventList$[ebp]
	push	edx
	push	2
	call	DWORD PTR __imp__WaitForMultipleObjects@16
	mov	DWORD PTR _dwWaitResult$[ebp], eax
; Line 474
	cmp	DWORD PTR _dwWaitResult$[ebp], 0
	je	SHORT $L31206
; Line 476
	xor	eax, eax
	jmp	$L31201
$L31206:
; Line 479
	mov	DWORD PTR _pBuffer$[ebp], 0
; Line 480
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Lock@MIODynamicPlayer@@QAEXXZ		; MIODynamicPlayer::Lock
; Line 481
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1276], 0
	je	$L31208
; Line 483
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1272]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _pBuffer$[ebp], eax
; Line 484
	mov	DWORD PTR _i$31209[ebp], 1
	jmp	SHORT $L31210
$L31211:
	mov	ecx, DWORD PTR _i$31209[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$31209[ebp], ecx
$L31210:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$31209[ebp]
	cmp	eax, DWORD PTR [edx+1276]
	jae	SHORT $L31212
; Line 486
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1272]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1272]
	mov	eax, DWORD PTR _i$31209[ebp]
	mov	esi, DWORD PTR _i$31209[ebp]
	mov	edx, DWORD PTR [edx+esi*4]
	mov	DWORD PTR [ecx+eax*4-4], edx
; Line 487
	jmp	SHORT $L31211
$L31212:
; Line 488
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1276]
	sub	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+1276], ecx
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1276], 0
	jne	SHORT $L31213
; Line 490
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1288]
	push	edx
	call	DWORD PTR __imp__ResetEvent@4
$L31213:
; Line 492
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+1276]
	cmp	edx, DWORD PTR [ecx+1280]
	jae	SHORT $L31214
; Line 494
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1292]
	push	ecx
	call	DWORD PTR __imp__SetEvent@4
; Line 495
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1284]
	push	eax
	call	DWORD PTR __imp__ResetEvent@4
$L31214:
$L31208:
; Line 498
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Unlock@MIODynamicPlayer@@QAEXXZ	; MIODynamicPlayer::Unlock
; Line 499
	mov	eax, DWORD PTR _pBuffer$[ebp]
$L31201:
; Line 500
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
?GetPreloadBuffer@MIODynamicPlayer@@IAEPAVEPreloadBuffer@1@XZ ENDP ; MIODynamicPlayer::GetPreloadBuffer
_TEXT	ENDS
PUBLIC	?AddPreloadBuffer@MIODynamicPlayer@@IAEXPAVEPreloadBuffer@1@@Z ; MIODynamicPlayer::AddPreloadBuffer
_TEXT	SEGMENT
_pBuffer$ = 8
_this$ = -4
?AddPreloadBuffer@MIODynamicPlayer@@IAEXPAVEPreloadBuffer@1@@Z PROC NEAR ; MIODynamicPlayer::AddPreloadBuffer
; Line 506
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 507
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Lock@MIODynamicPlayer@@QAEXXZ		; MIODynamicPlayer::Lock
; Line 508
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+1276]
	cmp	edx, DWORD PTR [ecx+1280]
	jae	SHORT $L31218
; Line 510
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1276]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1272]
	mov	edx, DWORD PTR _pBuffer$[ebp]
	mov	DWORD PTR [eax+ecx*4], edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1276]
	add	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+1276], ecx
; Line 511
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1276], 0
	je	SHORT $L31219
; Line 513
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1288]
	push	edx
	call	DWORD PTR __imp__SetEvent@4
$L31219:
; Line 515
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+1276]
	cmp	edx, DWORD PTR [ecx+1280]
	jb	SHORT $L31220
; Line 517
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1292]
	push	ecx
	call	DWORD PTR __imp__ResetEvent@4
; Line 518
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1284]
	push	eax
	call	DWORD PTR __imp__SetEvent@4
$L31220:
$L31218:
; Line 521
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Unlock@MIODynamicPlayer@@QAEXXZ	; MIODynamicPlayer::Unlock
; Line 522
	mov	esp, ebp
	pop	ebp
	ret	4
?AddPreloadBuffer@MIODynamicPlayer@@IAEXPAVEPreloadBuffer@1@@Z ENDP ; MIODynamicPlayer::AddPreloadBuffer
_TEXT	ENDS
PUBLIC	?LoadingThreadProc@MIODynamicPlayer@@IAEKXZ	; MIODynamicPlayer::LoadingThreadProc
EXTRN	_eriInitializeTask:NEAR
EXTRN	_eriCloseTask:NEAR
_TEXT	SEGMENT
_parameter$ = 8
_dwResult$ = -4
?ThreadProc@MIODynamicPlayer@@KGKPAX@Z PROC NEAR	; MIODynamicPlayer::ThreadProc
; Line 528
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 529
	call	_eriInitializeTask
; Line 531
	mov	ecx, DWORD PTR _parameter$[ebp]
	call	?LoadingThreadProc@MIODynamicPlayer@@IAEKXZ ; MIODynamicPlayer::LoadingThreadProc
	mov	DWORD PTR _dwResult$[ebp], eax
; Line 532
	call	_eriCloseTask
; Line 533
	mov	eax, DWORD PTR _dwResult$[ebp]
; Line 534
	mov	esp, ebp
	pop	ebp
	ret	4
?ThreadProc@MIODynamicPlayer@@KGKPAX@Z ENDP		; MIODynamicPlayer::ThreadProc
_TEXT	ENDS
PUBLIC	?AddKeySample@MIODynamicPlayer@@IAEXUKEY_POINT@1@@Z ; MIODynamicPlayer::AddKeySample
PUBLIC	?SearchKeySample@MIODynamicPlayer@@IAEPAUKEY_POINT@1@I@Z ; MIODynamicPlayer::SearchKeySample
PUBLIC	?SeekKeySample@MIODynamicPlayer@@IAEXKAAI@Z	; MIODynamicPlayer::SeekKeySample
EXTRN	__imp__PeekMessageA@20:NEAR
EXTRN	__imp__MsgWaitForMultipleObjects@20:NEAR
EXTRN	?DescendRecord@ERIFile@@QAE_NPB_K@Z:NEAR	; ERIFile::DescendRecord
EXTRN	?AscendRecord@ERIFile@@QAEXXZ:NEAR		; ERIFile::AscendRecord
_DATA	SEGMENT
$SG31237 DB	'SoundStm', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -92
_msg$ = -40
_keypoint$ = -8
_nCurrentSample$ = -12
_dwRecPosition$31234 = -48
_pKeyPoint$31239 = -60
_dwDataBytes$31241 = -52
_pBuffer$31242 = -44
_pKeyPoint$31249 = -64
_fQuit$31251 = -56
_dwWaitResult$31255 = -68
$T31436 = -72
$T31439 = -76
$T31440 = -80
$T31443 = -84
$T31444 = -88
?LoadingThreadProc@MIODynamicPlayer@@IAEKXZ PROC NEAR	; MIODynamicPlayer::LoadingThreadProc
; Line 537
	push	ebp
	mov	ebp, esp
	sub	esp, 104				; 00000068H
	mov	DWORD PTR _this$[ebp], ecx
; Line 542
	push	0
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _msg$[ebp]
	push	eax
	call	DWORD PTR __imp__PeekMessageA@20
; Line 547
	mov	DWORD PTR _nCurrentSample$[ebp], 0
$L31232:
; Line 556
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	call	DWORD PTR [eax+12]
	mov	DWORD PTR _dwRecPosition$31234[ebp], eax
; Line 557
	push	OFFSET FLAT:$SG31237
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	call	?DescendRecord@ERIFile@@QAE_NPB_K@Z	; ERIFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31236
; Line 559
	cmp	DWORD PTR _nCurrentSample$[ebp], 0
	jne	SHORT $L31238
; Line 562
	jmp	$L31233
$L31238:
; Line 567
	mov	ecx, DWORD PTR _nCurrentSample$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchKeySample@MIODynamicPlayer@@IAEPAUKEY_POINT@1@I@Z ; MIODynamicPlayer::SearchKeySample
	mov	DWORD PTR _pKeyPoint$31239[ebp], eax
; Line 568
	cmp	DWORD PTR _pKeyPoint$31239[ebp], 0
	jne	SHORT $L31240
; Line 570
	mov	edx, DWORD PTR _nCurrentSample$[ebp]
	mov	DWORD PTR _keypoint$[ebp], edx
; Line 571
	mov	eax, DWORD PTR _dwRecPosition$31234[ebp]
	mov	DWORD PTR _keypoint$[ebp+4], eax
; Line 572
	mov	ecx, DWORD PTR _keypoint$[ebp+4]
	push	ecx
	mov	edx, DWORD PTR _keypoint$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AddKeySample@MIODynamicPlayer@@IAEXUKEY_POINT@1@@Z ; MIODynamicPlayer::AddKeySample
$L31240:
; Line 575
	mov	DWORD PTR _nCurrentSample$[ebp], 0
; Line 576
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+4]
	call	DWORD PTR [edx+16]
; Line 577
	jmp	$L31232
$L31236:
; Line 581
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+4]
	call	DWORD PTR [edx+8]
	mov	DWORD PTR _dwDataBytes$31241[ebp], eax
; Line 583
	push	32					; 00000020H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR $T31436[ebp], eax
	cmp	DWORD PTR $T31436[ebp], 0
	je	SHORT $L31437
	mov	eax, DWORD PTR _dwDataBytes$31241[ebp]
	sub	eax, 8
	push	eax
	mov	ecx, DWORD PTR $T31436[ebp]
	call	??0EPreloadBuffer@MIODynamicPlayer@@QAE@K@Z ; MIODynamicPlayer::EPreloadBuffer::EPreloadBuffer
	mov	DWORD PTR -96+[ebp], eax
	jmp	SHORT $L31438
$L31437:
	mov	DWORD PTR -96+[ebp], 0
$L31438:
	mov	ecx, DWORD PTR -96+[ebp]
	mov	DWORD PTR _pBuffer$31242[ebp], ecx
; Line 585
	mov	edx, DWORD PTR _pBuffer$31242[ebp]
	mov	eax, DWORD PTR _nCurrentSample$[ebp]
	mov	DWORD PTR [edx+20], eax
; Line 586
	push	8
	mov	ecx, DWORD PTR _pBuffer$31242[ebp]
	add	ecx, 24					; 00000018H
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	call	DWORD PTR [eax+4]
; Line 588
	mov	ecx, DWORD PTR _dwDataBytes$31241[ebp]
	sub	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _pBuffer$31242[ebp]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	call	DWORD PTR [eax+4]
; Line 590
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	call	?AscendRecord@ERIFile@@QAEXXZ		; ERIFile::AscendRecord
; Line 593
	mov	ecx, DWORD PTR _pBuffer$31242[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx+25]
	and	edx, 1
	test	edx, edx
	je	SHORT $L31248
; Line 595
	mov	eax, DWORD PTR _nCurrentSample$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchKeySample@MIODynamicPlayer@@IAEPAUKEY_POINT@1@I@Z ; MIODynamicPlayer::SearchKeySample
	mov	DWORD PTR _pKeyPoint$31249[ebp], eax
; Line 596
	cmp	DWORD PTR _pKeyPoint$31249[ebp], 0
	jne	SHORT $L31250
; Line 598
	mov	ecx, DWORD PTR _nCurrentSample$[ebp]
	mov	DWORD PTR _keypoint$[ebp], ecx
; Line 599
	mov	edx, DWORD PTR _dwRecPosition$31234[ebp]
	mov	DWORD PTR _keypoint$[ebp+4], edx
; Line 600
	mov	eax, DWORD PTR _keypoint$[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _keypoint$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AddKeySample@MIODynamicPlayer@@IAEXUKEY_POINT@1@@Z ; MIODynamicPlayer::AddKeySample
$L31250:
$L31248:
; Line 606
	mov	BYTE PTR _fQuit$31251[ebp], 0
$L31252:
; Line 613
	push	255					; 000000ffH
	push	-1
	push	0
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 1292				; 0000050cH
	push	edx
	push	1
	call	DWORD PTR __imp__MsgWaitForMultipleObjects@20
	mov	DWORD PTR _dwWaitResult$31255[ebp], eax
; Line 614
	cmp	DWORD PTR _pBuffer$31242[ebp], 0
	je	SHORT $L31257
	cmp	DWORD PTR _dwWaitResult$31255[ebp], 0
	jne	SHORT $L31257
; Line 616
	mov	eax, DWORD PTR _pBuffer$31242[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AddPreloadBuffer@MIODynamicPlayer@@IAEXPAVEPreloadBuffer@1@@Z ; MIODynamicPlayer::AddPreloadBuffer
; Line 617
	mov	ecx, DWORD PTR _pBuffer$31242[ebp]
	mov	edx, DWORD PTR _nCurrentSample$[ebp]
	add	edx, DWORD PTR [ecx+28]
	mov	DWORD PTR _nCurrentSample$[ebp], edx
; Line 618
	mov	DWORD PTR _pBuffer$31242[ebp], 0
$L31257:
; Line 621
	push	1
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _msg$[ebp]
	push	eax
	call	DWORD PTR __imp__PeekMessageA@20
	test	eax, eax
	je	SHORT $L31258
; Line 623
	cmp	DWORD PTR _msg$[ebp+4], 1024		; 00000400H
	jne	SHORT $L31259
; Line 628
	cmp	DWORD PTR _pBuffer$31242[ebp], 0
	je	SHORT $L31260
; Line 630
	mov	ecx, DWORD PTR _dwRecPosition$31234[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	call	DWORD PTR [eax+16]
; Line 631
	mov	ecx, DWORD PTR _pBuffer$31242[ebp]
	mov	DWORD PTR $T31440[ebp], ecx
	mov	edx, DWORD PTR $T31440[ebp]
	mov	DWORD PTR $T31439[ebp], edx
	cmp	DWORD PTR $T31439[ebp], 0
	je	SHORT $L31441
	push	1
	mov	eax, DWORD PTR $T31439[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR $T31439[ebp]
	call	DWORD PTR [edx]
	mov	DWORD PTR -100+[ebp], eax
	jmp	SHORT $L31442
$L31441:
	mov	DWORD PTR -100+[ebp], 0
$L31442:
; Line 632
	mov	DWORD PTR _pBuffer$31242[ebp], 0
$L31260:
; Line 635
	lea	eax, DWORD PTR _nCurrentSample$[ebp]
	push	eax
	mov	ecx, DWORD PTR _msg$[ebp+8]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SeekKeySample@MIODynamicPlayer@@IAEXKAAI@Z ; MIODynamicPlayer::SeekKeySample
; Line 637
	mov	edx, DWORD PTR _msg$[ebp+12]
	push	edx
	call	DWORD PTR __imp__SetEvent@4
; Line 639
	jmp	SHORT $L31265
$L31259:
	cmp	DWORD PTR _msg$[ebp+4], 1025		; 00000401H
	jne	SHORT $L31266
; Line 644
	mov	BYTE PTR _fQuit$31251[ebp], 1
; Line 645
	jmp	SHORT $L31254
$L31266:
$L31265:
$L31258:
; Line 649
	cmp	DWORD PTR _pBuffer$31242[ebp], 0
	jne	$L31252
$L31254:
; Line 651
	mov	eax, DWORD PTR _fQuit$31251[ebp]
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L31267
; Line 653
	mov	ecx, DWORD PTR _pBuffer$31242[ebp]
	mov	DWORD PTR $T31444[ebp], ecx
	mov	edx, DWORD PTR $T31444[ebp]
	mov	DWORD PTR $T31443[ebp], edx
	cmp	DWORD PTR $T31443[ebp], 0
	je	SHORT $L31445
	push	1
	mov	eax, DWORD PTR $T31443[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR $T31443[ebp]
	call	DWORD PTR [edx]
	mov	DWORD PTR -104+[ebp], eax
	jmp	SHORT $L31446
$L31445:
	mov	DWORD PTR -104+[ebp], 0
$L31446:
; Line 654
	jmp	SHORT $L31233
$L31267:
; Line 656
	jmp	$L31232
$L31233:
; Line 658
	xor	eax, eax
; Line 659
	mov	esp, ebp
	pop	ebp
	ret	0
?LoadingThreadProc@MIODynamicPlayer@@IAEKXZ ENDP	; MIODynamicPlayer::LoadingThreadProc
_key$ = 8
_this$ = -4
?AddKeySample@MIODynamicPlayer@@IAEXUKEY_POINT@1@@Z PROC NEAR ; MIODynamicPlayer::AddKeySample
; Line 665
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 666
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Lock@MIODynamicPlayer@@QAEXXZ		; MIODynamicPlayer::Lock
; Line 667
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+1300]
	cmp	edx, DWORD PTR [ecx+1304]
	jb	SHORT $L31273
; Line 669
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1304], 0
	jne	SHORT $L31274
; Line 671
	push	256					; 00000100H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1296				; 00000510H
	call	?SetLimit@EKeyPointList@MIODynamicPlayer@@QAEXI@Z ; MIODynamicPlayer::EKeyPointList::SetLimit
; Line 673
	jmp	SHORT $L31275
$L31274:
; Line 675
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1304]
	shl	edx, 1
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1296				; 00000510H
	call	?SetLimit@EKeyPointList@MIODynamicPlayer@@QAEXI@Z ; MIODynamicPlayer::EKeyPointList::SetLimit
$L31275:
$L31273:
; Line 678
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+1300]
	cmp	edx, DWORD PTR [ecx+1304]
	jae	SHORT $L31276
; Line 680
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1300]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1296]
	mov	edx, DWORD PTR _key$[ebp]
	mov	DWORD PTR [eax+ecx*8], edx
	mov	edx, DWORD PTR _key$[ebp+4]
	mov	DWORD PTR [eax+ecx*8+4], edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1300]
	add	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+1300], ecx
$L31276:
; Line 682
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Unlock@MIODynamicPlayer@@QAEXXZ	; MIODynamicPlayer::Unlock
; Line 683
	mov	esp, ebp
	pop	ebp
	ret	8
?AddKeySample@MIODynamicPlayer@@IAEXUKEY_POINT@1@@Z ENDP ; MIODynamicPlayer::AddKeySample
_nKeySample$ = 8
_this$ = -20
_iFirst$ = -4
_iMiddle$ = -16
_iEnd$ = -12
_pFoundKey$ = -8
?SearchKeySample@MIODynamicPlayer@@IAEPAUKEY_POINT@1@I@Z PROC NEAR ; MIODynamicPlayer::SearchKeySample
; Line 690
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 692
	mov	DWORD PTR _pFoundKey$[ebp], 0
; Line 694
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Lock@MIODynamicPlayer@@QAEXXZ		; MIODynamicPlayer::Lock
; Line 696
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1300], 0
	jne	SHORT $L31284
; Line 698
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Unlock@MIODynamicPlayer@@QAEXXZ	; MIODynamicPlayer::Unlock
; Line 699
	xor	eax, eax
	jmp	$L31279
$L31284:
; Line 702
	mov	DWORD PTR _iFirst$[ebp], 0
; Line 703
	mov	DWORD PTR _iMiddle$[ebp], 0
; Line 704
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1300]
	sub	edx, 1
	mov	DWORD PTR _iEnd$[ebp], edx
$L31286:
; Line 708
	mov	eax, DWORD PTR _iFirst$[ebp]
	cmp	eax, DWORD PTR _iEnd$[ebp]
	jl	$L31288
; Line 710
	mov	DWORD PTR _pFoundKey$[ebp], 0
; Line 711
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1296]
	mov	eax, DWORD PTR _iMiddle$[ebp]
	mov	ecx, DWORD PTR [edx+eax*8]
	cmp	ecx, DWORD PTR _nKeySample$[ebp]
	jne	SHORT $L31289
; Line 713
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1296]
	mov	ecx, DWORD PTR _iMiddle$[ebp]
	lea	edx, DWORD PTR [eax+ecx*8]
	mov	DWORD PTR _pFoundKey$[ebp], edx
; Line 715
	jmp	$L31290
$L31289:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1296]
	mov	edx, DWORD PTR _iMiddle$[ebp]
	mov	eax, DWORD PTR [ecx+edx*8]
	cmp	eax, DWORD PTR _nKeySample$[ebp]
	jbe	SHORT $L31291
$L31293:
; Line 717
	cmp	DWORD PTR _iMiddle$[ebp], 0
	jle	SHORT $L31294
; Line 720
	mov	ecx, DWORD PTR _iMiddle$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _iMiddle$[ebp], ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1296]
	mov	ecx, DWORD PTR _iMiddle$[ebp]
	mov	edx, DWORD PTR [eax+ecx*8]
	cmp	edx, DWORD PTR _nKeySample$[ebp]
	ja	SHORT $L31295
; Line 722
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1296]
	mov	edx, DWORD PTR _iMiddle$[ebp]
	lea	eax, DWORD PTR [ecx+edx*8]
	mov	DWORD PTR _pFoundKey$[ebp], eax
; Line 723
	jmp	SHORT $L31294
$L31295:
; Line 725
	jmp	SHORT $L31293
$L31294:
; Line 727
	jmp	SHORT $L31296
$L31291:
$L31299:
; Line 729
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1300]
	sub	edx, 1
	cmp	DWORD PTR _iMiddle$[ebp], edx
	jge	SHORT $L31300
; Line 732
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1296]
	mov	edx, DWORD PTR _iMiddle$[ebp]
	mov	eax, DWORD PTR [ecx+edx*8+8]
	cmp	eax, DWORD PTR _nKeySample$[ebp]
	jne	SHORT $L31301
; Line 734
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1296]
	mov	eax, DWORD PTR _iMiddle$[ebp]
	lea	ecx, DWORD PTR [edx+eax*8+8]
	mov	DWORD PTR _pFoundKey$[ebp], ecx
; Line 735
	jmp	SHORT $L31300
$L31301:
; Line 738
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1296]
	mov	ecx, DWORD PTR _iMiddle$[ebp]
	mov	edx, DWORD PTR [eax+ecx*8+8]
	cmp	edx, DWORD PTR _nKeySample$[ebp]
	jbe	SHORT $L31303
; Line 740
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1296]
	mov	edx, DWORD PTR _iMiddle$[ebp]
	lea	eax, DWORD PTR [ecx+edx*8]
	mov	DWORD PTR _pFoundKey$[ebp], eax
; Line 741
	jmp	SHORT $L31300
$L31303:
; Line 743
	mov	ecx, DWORD PTR _iMiddle$[ebp]
	add	ecx, 1
	mov	DWORD PTR _iMiddle$[ebp], ecx
; Line 744
	jmp	SHORT $L31299
$L31300:
$L31296:
$L31290:
; Line 746
	jmp	SHORT $L31287
$L31288:
; Line 749
	mov	eax, DWORD PTR _iFirst$[ebp]
	add	eax, DWORD PTR _iEnd$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	DWORD PTR _iMiddle$[ebp], eax
; Line 750
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1296]
	mov	ecx, DWORD PTR _iMiddle$[ebp]
	lea	edx, DWORD PTR [eax+ecx*8]
	mov	DWORD PTR _pFoundKey$[ebp], edx
; Line 752
	mov	eax, DWORD PTR _pFoundKey$[ebp]
	mov	ecx, DWORD PTR [eax]
	cmp	ecx, DWORD PTR _nKeySample$[ebp]
	jne	SHORT $L31304
; Line 754
	jmp	SHORT $L31287
$L31304:
; Line 756
	mov	edx, DWORD PTR _pFoundKey$[ebp]
	mov	eax, DWORD PTR [edx]
	cmp	eax, DWORD PTR _nKeySample$[ebp]
	jbe	SHORT $L31305
; Line 758
	mov	ecx, DWORD PTR _iMiddle$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _iEnd$[ebp], ecx
; Line 760
	jmp	SHORT $L31306
$L31305:
; Line 762
	mov	edx, DWORD PTR _iMiddle$[ebp]
	add	edx, 1
	mov	DWORD PTR _iFirst$[ebp], edx
$L31306:
; Line 764
	jmp	$L31286
$L31287:
; Line 766
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Unlock@MIODynamicPlayer@@QAEXXZ	; MIODynamicPlayer::Unlock
; Line 768
	mov	eax, DWORD PTR _pFoundKey$[ebp]
$L31279:
; Line 769
	mov	esp, ebp
	pop	ebp
	ret	4
?SearchKeySample@MIODynamicPlayer@@IAEPAUKEY_POINT@1@I@Z ENDP ; MIODynamicPlayer::SearchKeySample
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG31350 DB	'SoundStm', 00H
	ORG $+3
$SG31362 DB	'SoundStm', 00H
_DATA	ENDS
_TEXT	SEGMENT
_nSample$ = 8
_nCurrentSample$ = 12
_this$ = -112
_pBuffer$ = -4
_iLoaded$ = -8
_iLeadBlock$ = -12
_i$31321 = -20
_dwSampleBytes$31331 = -28
_dwBytes$31332 = -32
_ptrWaveBuf$31333 = -24
_pKeyPoint$ = -16
_dwRecPosition$31347 = -44
_miodh$31351 = -40
_keypoint$31354 = -52
_dwDataBytes$31363 = -68
_pBuffer$31364 = -60
_dwSampleBytes$31371 = -64
_dwBytes$31372 = -72
_ptrWaveBuf$31373 = -56
$T31447 = -76
$T31448 = -80
$T31451 = -84
$T31452 = -88
$T31455 = -92
$T31456 = -96
$T31459 = -100
$T31462 = -104
$T31463 = -108
?SeekKeySample@MIODynamicPlayer@@IAEXKAAI@Z PROC NEAR	; MIODynamicPlayer::SeekKeySample
; Line 776
	push	ebp
	mov	ebp, esp
	sub	esp, 132				; 00000084H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 781
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Lock@MIODynamicPlayer@@QAEXXZ		; MIODynamicPlayer::Lock
; Line 783
	mov	DWORD PTR _iLoaded$[ebp], 0
; Line 784
	mov	DWORD PTR _iLeadBlock$[ebp], 0
$L31315:
; Line 785
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _iLoaded$[ebp]
	cmp	ecx, DWORD PTR [eax+1276]
	jae	SHORT $L31316
; Line 787
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1272]
	mov	ecx, DWORD PTR _iLoaded$[ebp]
	mov	edx, DWORD PTR [eax+ecx*4]
	mov	DWORD PTR _pBuffer$[ebp], edx
; Line 788
	cmp	DWORD PTR _pBuffer$[ebp], 0
	je	SHORT $L31317
; Line 790
	mov	eax, DWORD PTR _pBuffer$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+25]
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L31318
; Line 792
	mov	edx, DWORD PTR _iLoaded$[ebp]
	mov	DWORD PTR _iLeadBlock$[ebp], edx
$L31318:
; Line 796
	mov	eax, DWORD PTR _pBuffer$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	cmp	ecx, DWORD PTR _nSample$[ebp]
	ja	SHORT $L31319
	mov	edx, DWORD PTR _pBuffer$[ebp]
	mov	eax, DWORD PTR _nSample$[ebp]
	sub	eax, DWORD PTR [edx+20]
	mov	ecx, DWORD PTR _pBuffer$[ebp]
	cmp	eax, DWORD PTR [ecx+28]
	jae	SHORT $L31319
; Line 798
	jmp	SHORT $L31316
$L31319:
$L31317:
; Line 801
	mov	edx, DWORD PTR _iLoaded$[ebp]
	add	edx, 1
	mov	DWORD PTR _iLoaded$[ebp], edx
; Line 802
	jmp	SHORT $L31315
$L31316:
; Line 806
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _iLoaded$[ebp]
	cmp	ecx, DWORD PTR [eax+1276]
	jae	$L31320
; Line 811
	mov	DWORD PTR _i$31321[ebp], 0
	jmp	SHORT $L31322
$L31323:
	mov	edx, DWORD PTR _i$31321[ebp]
	add	edx, 1
	mov	DWORD PTR _i$31321[ebp], edx
$L31322:
	mov	eax, DWORD PTR _i$31321[ebp]
	cmp	eax, DWORD PTR _iLeadBlock$[ebp]
	jae	SHORT $L31324
; Line 813
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetPreloadBuffer@MIODynamicPlayer@@IAEPAVEPreloadBuffer@1@XZ ; MIODynamicPlayer::GetPreloadBuffer
	mov	DWORD PTR $T31448[ebp], eax
	mov	ecx, DWORD PTR $T31448[ebp]
	mov	DWORD PTR $T31447[ebp], ecx
	cmp	DWORD PTR $T31447[ebp], 0
	je	SHORT $L31449
	push	1
	mov	edx, DWORD PTR $T31447[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR $T31447[ebp]
	call	DWORD PTR [eax]
	mov	DWORD PTR -116+[ebp], eax
	jmp	SHORT $L31450
$L31449:
	mov	DWORD PTR -116+[ebp], 0
$L31450:
; Line 814
	jmp	SHORT $L31323
$L31324:
; Line 817
	mov	ecx, DWORD PTR _iLeadBlock$[ebp]
	mov	DWORD PTR _i$31321[ebp], ecx
	jmp	SHORT $L31327
$L31328:
	mov	edx, DWORD PTR _i$31321[ebp]
	add	edx, 1
	mov	DWORD PTR _i$31321[ebp], edx
$L31327:
	mov	eax, DWORD PTR _i$31321[ebp]
	cmp	eax, DWORD PTR _iLoaded$[ebp]
	jae	$L31329
; Line 819
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetPreloadBuffer@MIODynamicPlayer@@IAEPAVEPreloadBuffer@1@XZ ; MIODynamicPlayer::GetPreloadBuffer
	mov	DWORD PTR _pBuffer$[ebp], eax
; Line 820
	cmp	DWORD PTR _pBuffer$[ebp], 0
	jne	SHORT $L31330
; Line 821
	jmp	$L31329
$L31330:
; Line 824
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetChannelCount@MIODynamicPlayer@@QBEKXZ ; MIODynamicPlayer::GetChannelCount
	mov	esi, eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetBitsPerSample@MIODynamicPlayer@@QBEKXZ ; MIODynamicPlayer::GetBitsPerSample
	imul	esi, eax
	shr	esi, 3
	mov	DWORD PTR _dwSampleBytes$31331[ebp], esi
; Line 826
	mov	ecx, DWORD PTR _pBuffer$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	imul	edx, DWORD PTR _dwSampleBytes$31331[ebp]
	mov	DWORD PTR _dwBytes$31332[ebp], edx
; Line 828
	mov	eax, DWORD PTR _dwBytes$31332[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+12]
	mov	DWORD PTR _ptrWaveBuf$31333[ebp], eax
; Line 830
	mov	eax, DWORD PTR _pBuffer$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+1256]
	call	?AttachFileObject@EFileDecodeContext@@QAEXPAVEFileObject@@@Z ; EFileDecodeContext::AttachFileObject
; Line 832
	mov	edx, DWORD PTR _ptrWaveBuf$31333[ebp]
	push	edx
	mov	eax, DWORD PTR _pBuffer$[ebp]
	add	eax, 24					; 00000018H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1256]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1260]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1260]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+12]
; Line 834
	mov	eax, DWORD PTR _ptrWaveBuf$31333[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+16]
; Line 835
	mov	eax, DWORD PTR _pBuffer$[ebp]
	mov	DWORD PTR $T31452[ebp], eax
	mov	ecx, DWORD PTR $T31452[ebp]
	mov	DWORD PTR $T31451[ebp], ecx
	cmp	DWORD PTR $T31451[ebp], 0
	je	SHORT $L31453
	push	1
	mov	edx, DWORD PTR $T31451[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR $T31451[ebp]
	call	DWORD PTR [eax]
	mov	DWORD PTR -120+[ebp], eax
	jmp	SHORT $L31454
$L31453:
	mov	DWORD PTR -120+[ebp], 0
$L31454:
; Line 836
	jmp	$L31328
$L31329:
; Line 837
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Unlock@MIODynamicPlayer@@QAEXXZ	; MIODynamicPlayer::Unlock
; Line 838
	jmp	$L31310
$L31320:
$L31337:
; Line 843
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+1276], 0
	je	SHORT $L31338
; Line 845
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetPreloadBuffer@MIODynamicPlayer@@IAEPAVEPreloadBuffer@1@XZ ; MIODynamicPlayer::GetPreloadBuffer
	mov	DWORD PTR $T31456[ebp], eax
	mov	edx, DWORD PTR $T31456[ebp]
	mov	DWORD PTR $T31455[ebp], edx
	cmp	DWORD PTR $T31455[ebp], 0
	je	SHORT $L31457
	push	1
	mov	eax, DWORD PTR $T31455[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR $T31455[ebp]
	call	DWORD PTR [edx]
	mov	DWORD PTR -124+[ebp], eax
	jmp	SHORT $L31458
$L31457:
	mov	DWORD PTR -124+[ebp], 0
$L31458:
; Line 846
	jmp	SHORT $L31337
$L31338:
; Line 848
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Unlock@MIODynamicPlayer@@QAEXXZ	; MIODynamicPlayer::Unlock
; Line 853
	mov	eax, DWORD PTR _nSample$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchKeySample@MIODynamicPlayer@@IAEPAUKEY_POINT@1@I@Z ; MIODynamicPlayer::SearchKeySample
	mov	DWORD PTR _pKeyPoint$[ebp], eax
; Line 854
	cmp	DWORD PTR _pKeyPoint$[ebp], 0
	jne	$L31342
; Line 856
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Lock@MIODynamicPlayer@@QAEXXZ		; MIODynamicPlayer::Lock
; Line 857
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+1300], 0
	jbe	SHORT $L31343
; Line 859
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1300]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1296]
	lea	eax, DWORD PTR [edx+eax*8-8]
	mov	DWORD PTR _pKeyPoint$[ebp], eax
; Line 860
	mov	ecx, DWORD PTR _pKeyPoint$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+4]
	call	DWORD PTR [edx+16]
; Line 861
	mov	eax, DWORD PTR _nCurrentSample$[ebp]
	mov	ecx, DWORD PTR _pKeyPoint$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [eax], edx
$L31343:
; Line 863
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Unlock@MIODynamicPlayer@@QAEXXZ	; MIODynamicPlayer::Unlock
$L31345:
; Line 868
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+4]
	call	DWORD PTR [edx+12]
	mov	DWORD PTR _dwRecPosition$31347[ebp], eax
; Line 869
	push	OFFSET FLAT:$SG31350
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	call	?DescendRecord@ERIFile@@QAE_NPB_K@Z	; ERIFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31349
; Line 871
	jmp	$L31310
$L31349:
; Line 875
	push	8
	lea	eax, DWORD PTR _miodh$31351[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	call	DWORD PTR [eax+4]
; Line 876
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	call	?AscendRecord@ERIFile@@QAEXXZ		; ERIFile::AscendRecord
; Line 879
	mov	ecx, DWORD PTR _miodh$31351[ebp+1]
	and	ecx, 255				; 000000ffH
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L31352
; Line 881
	mov	edx, DWORD PTR _nCurrentSample$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchKeySample@MIODynamicPlayer@@IAEPAUKEY_POINT@1@I@Z ; MIODynamicPlayer::SearchKeySample
	mov	DWORD PTR _pKeyPoint$[ebp], eax
; Line 882
	cmp	DWORD PTR _pKeyPoint$[ebp], 0
	jne	SHORT $L31353
; Line 885
	mov	ecx, DWORD PTR _nCurrentSample$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _keypoint$31354[ebp], edx
; Line 886
	mov	eax, DWORD PTR _dwRecPosition$31347[ebp]
	mov	DWORD PTR _keypoint$31354[ebp+4], eax
; Line 887
	mov	ecx, DWORD PTR _keypoint$31354[ebp+4]
	push	ecx
	mov	edx, DWORD PTR _keypoint$31354[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AddKeySample@MIODynamicPlayer@@IAEXUKEY_POINT@1@@Z ; MIODynamicPlayer::AddKeySample
; Line 890
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1300]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1296]
	lea	ecx, DWORD PTR [eax+ecx*8-8]
	mov	DWORD PTR _pKeyPoint$[ebp], ecx
$L31353:
$L31352:
; Line 896
	mov	edx, DWORD PTR _nCurrentSample$[ebp]
	mov	eax, DWORD PTR [edx]
	cmp	eax, DWORD PTR _nSample$[ebp]
	ja	SHORT $L31355
	mov	ecx, DWORD PTR _nCurrentSample$[ebp]
	mov	edx, DWORD PTR _nSample$[ebp]
	sub	edx, DWORD PTR [ecx]
	cmp	edx, DWORD PTR _miodh$31351[ebp+4]
	jae	SHORT $L31355
; Line 898
	jmp	SHORT $L31346
$L31355:
; Line 900
	mov	eax, DWORD PTR _nCurrentSample$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, DWORD PTR _miodh$31351[ebp+4]
	mov	edx, DWORD PTR _nCurrentSample$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 901
	jmp	$L31345
$L31346:
$L31342:
; Line 906
	cmp	DWORD PTR _pKeyPoint$[ebp], 0
	jne	SHORT $L31356
; Line 908
	jmp	$L31310
$L31356:
; Line 910
	mov	eax, DWORD PTR _nCurrentSample$[ebp]
	mov	ecx, DWORD PTR _pKeyPoint$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [eax], edx
; Line 911
	mov	eax, DWORD PTR _pKeyPoint$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	call	DWORD PTR [eax+16]
$L31358:
; Line 915
	push	OFFSET FLAT:$SG31362
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	call	?DescendRecord@ERIFile@@QAE_NPB_K@Z	; ERIFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31361
; Line 917
	jmp	$L31310
$L31361:
; Line 921
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	call	DWORD PTR [eax+8]
	mov	DWORD PTR _dwDataBytes$31363[ebp], eax
; Line 923
	push	32					; 00000020H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR $T31459[ebp], eax
	cmp	DWORD PTR $T31459[ebp], 0
	je	SHORT $L31460
	mov	ecx, DWORD PTR _dwDataBytes$31363[ebp]
	sub	ecx, 8
	push	ecx
	mov	ecx, DWORD PTR $T31459[ebp]
	call	??0EPreloadBuffer@MIODynamicPlayer@@QAE@K@Z ; MIODynamicPlayer::EPreloadBuffer::EPreloadBuffer
	mov	DWORD PTR -128+[ebp], eax
	jmp	SHORT $L31461
$L31460:
	mov	DWORD PTR -128+[ebp], 0
$L31461:
	mov	edx, DWORD PTR -128+[ebp]
	mov	DWORD PTR _pBuffer$31364[ebp], edx
; Line 925
	mov	eax, DWORD PTR _pBuffer$31364[ebp]
	mov	ecx, DWORD PTR _nCurrentSample$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [eax+20], edx
; Line 926
	push	8
	mov	eax, DWORD PTR _pBuffer$31364[ebp]
	add	eax, 24					; 00000018H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	call	DWORD PTR [eax+4]
; Line 928
	mov	ecx, DWORD PTR _dwDataBytes$31363[ebp]
	sub	ecx, 8
	push	ecx
	mov	edx, DWORD PTR _pBuffer$31364[ebp]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+4]
	call	DWORD PTR [eax+4]
; Line 930
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	call	?AscendRecord@ERIFile@@QAEXXZ		; ERIFile::AscendRecord
; Line 934
	mov	ecx, DWORD PTR _nCurrentSample$[ebp]
	mov	edx, DWORD PTR [ecx]
	cmp	edx, DWORD PTR _nSample$[ebp]
	ja	SHORT $L31370
	mov	eax, DWORD PTR _nCurrentSample$[ebp]
	mov	ecx, DWORD PTR _nSample$[ebp]
	sub	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _pBuffer$31364[ebp]
	cmp	ecx, DWORD PTR [edx+28]
	jae	SHORT $L31370
; Line 936
	mov	eax, DWORD PTR _nCurrentSample$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _pBuffer$31364[ebp]
	add	ecx, DWORD PTR [edx+28]
	mov	eax, DWORD PTR _nCurrentSample$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 937
	mov	ecx, DWORD PTR _pBuffer$31364[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AddPreloadBuffer@MIODynamicPlayer@@IAEXPAVEPreloadBuffer@1@@Z ; MIODynamicPlayer::AddPreloadBuffer
; Line 938
	jmp	$L31359
$L31370:
; Line 940
	mov	edx, DWORD PTR _nCurrentSample$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _pBuffer$31364[ebp]
	add	eax, DWORD PTR [ecx+28]
	mov	edx, DWORD PTR _nCurrentSample$[ebp]
	mov	DWORD PTR [edx], eax
; Line 943
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetChannelCount@MIODynamicPlayer@@QBEKXZ ; MIODynamicPlayer::GetChannelCount
	mov	esi, eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetBitsPerSample@MIODynamicPlayer@@QBEKXZ ; MIODynamicPlayer::GetBitsPerSample
	imul	esi, eax
	shr	esi, 3
	mov	DWORD PTR _dwSampleBytes$31371[ebp], esi
; Line 944
	mov	eax, DWORD PTR _pBuffer$31364[ebp]
	mov	ecx, DWORD PTR [eax+28]
	imul	ecx, DWORD PTR _dwSampleBytes$31371[ebp]
	mov	DWORD PTR _dwBytes$31372[ebp], ecx
; Line 946
	mov	edx, DWORD PTR _dwBytes$31372[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+12]
	mov	DWORD PTR _ptrWaveBuf$31373[ebp], eax
; Line 948
	mov	eax, DWORD PTR _pBuffer$31364[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+1256]
	call	?AttachFileObject@EFileDecodeContext@@QAEXPAVEFileObject@@@Z ; EFileDecodeContext::AttachFileObject
; Line 950
	mov	edx, DWORD PTR _ptrWaveBuf$31373[ebp]
	push	edx
	mov	eax, DWORD PTR _pBuffer$31364[ebp]
	add	eax, 24					; 00000018H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1256]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1260]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1260]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+12]
; Line 952
	mov	eax, DWORD PTR _ptrWaveBuf$31373[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+16]
; Line 953
	mov	eax, DWORD PTR _pBuffer$31364[ebp]
	mov	DWORD PTR $T31463[ebp], eax
	mov	ecx, DWORD PTR $T31463[ebp]
	mov	DWORD PTR $T31462[ebp], ecx
	cmp	DWORD PTR $T31462[ebp], 0
	je	SHORT $L31464
	push	1
	mov	edx, DWORD PTR $T31462[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR $T31462[ebp]
	call	DWORD PTR [eax]
	mov	DWORD PTR -132+[ebp], eax
	jmp	SHORT $L31465
$L31464:
	mov	DWORD PTR -132+[ebp], 0
$L31465:
; Line 954
	jmp	$L31358
$L31359:
$L31310:
; Line 955
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
?SeekKeySample@MIODynamicPlayer@@IAEXKAAI@Z ENDP	; MIODynamicPlayer::SeekKeySample
_TEXT	ENDS
EXTRN	__imp__EnterCriticalSection@4:NEAR
_TEXT	SEGMENT
_this$ = -4
?Lock@MIODynamicPlayer@@QAEXXZ PROC NEAR		; MIODynamicPlayer::Lock
; Line 961
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 962
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 1308				; 0000051cH
	push	eax
	call	DWORD PTR __imp__EnterCriticalSection@4
; Line 963
	mov	esp, ebp
	pop	ebp
	ret	0
?Lock@MIODynamicPlayer@@QAEXXZ ENDP			; MIODynamicPlayer::Lock
_TEXT	ENDS
EXTRN	__imp__LeaveCriticalSection@4:NEAR
_TEXT	SEGMENT
_this$ = -4
?Unlock@MIODynamicPlayer@@QAEXXZ PROC NEAR		; MIODynamicPlayer::Unlock
; Line 966
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 967
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 1308				; 0000051cH
	push	eax
	call	DWORD PTR __imp__LeaveCriticalSection@4
; Line 968
	mov	esp, ebp
	pop	ebp
	ret	0
?Unlock@MIODynamicPlayer@@QAEXXZ ENDP			; MIODynamicPlayer::Unlock
_TEXT	ENDS
END
