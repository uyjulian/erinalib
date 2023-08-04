	TITLE	I:\EntisGLS\eri-chan\experi\common\erianime.cpp
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
;	COMDAT ??_GEPreloadBuffer@ERIAnimation@@UAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_7ERIAnimation@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
;	COMDAT ??_7EPreloadBuffer@ERIAnimation@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	??0EPreloadBuffer@ERIAnimation@@QAE@K@Z		; ERIAnimation::EPreloadBuffer::EPreloadBuffer
PUBLIC	??_7EPreloadBuffer@ERIAnimation@@6B@		; ERIAnimation::EPreloadBuffer::`vftable'
PUBLIC	??_GEPreloadBuffer@ERIAnimation@@UAEPAXI@Z	; ERIAnimation::EPreloadBuffer::`scalar deleting destructor'
;PUBLIC	??_EEPreloadBuffer@ERIAnimation@@UAEPAXI@Z	; ERIAnimation::EPreloadBuffer::`vector deleting destructor'
EXTRN	?eriAllocateMemory@@YAPAXK@Z:NEAR		; eriAllocateMemory
EXTRN	??0EMemFile@@QAE@PBEK@Z:NEAR			; EMemFile::EMemFile
EXTRN	?Read@EMemFile@@UAEKPAXK@Z:NEAR			; EMemFile::Read
EXTRN	?GetLength@EMemFile@@UAEKXZ:NEAR		; EMemFile::GetLength
EXTRN	?GetPointer@EMemFile@@UAEKXZ:NEAR		; EMemFile::GetPointer
EXTRN	?Seek@EMemFile@@UAEXK@Z:NEAR			; EMemFile::Seek
;	COMDAT ??_7EPreloadBuffer@ERIAnimation@@6B@
; File I:\EntisGLS\eri-chan\experi\common\erianime.cpp
CONST	SEGMENT
??_7EPreloadBuffer@ERIAnimation@@6B@	LABEL	DWORD
;DD FLAT:??_EEPreloadBuffer@ERIAnimation@@UAEPAXI@Z ; ERIAnimation::EPreloadBuffer::`vftable'
	DD	FLAT:??_GEPreloadBuffer@ERIAnimation@@UAEPAXI@Z
	DD	FLAT:?Read@EMemFile@@UAEKPAXK@Z
	DD	FLAT:?GetLength@EMemFile@@UAEKXZ
	DD	FLAT:?GetPointer@EMemFile@@UAEKXZ
	DD	FLAT:?Seek@EMemFile@@UAEXK@Z
CONST	ENDS
_TEXT	SEGMENT
_dwLength$ = 8
_this$ = -4
??0EPreloadBuffer@ERIAnimation@@QAE@K@Z PROC NEAR	; ERIAnimation::EPreloadBuffer::EPreloadBuffer
; File I:\EntisGLS\eri-chan\experi\common\erianime.cpp
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
	mov	DWORD PTR [ecx], OFFSET FLAT:??_7EPreloadBuffer@ERIAnimation@@6B@ ; ERIAnimation::EPreloadBuffer::`vftable'
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
	mov	DWORD PTR [eax+24], 0
	mov	DWORD PTR [eax+28], 0
; Line 36
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??0EPreloadBuffer@ERIAnimation@@QAE@K@Z ENDP		; ERIAnimation::EPreloadBuffer::EPreloadBuffer
_TEXT	ENDS
PUBLIC	??1EPreloadBuffer@ERIAnimation@@UAE@XZ		; ERIAnimation::EPreloadBuffer::~EPreloadBuffer
EXTRN	??3@YAXPAX@Z:NEAR				; operator delete
;	COMDAT ??_GEPreloadBuffer@ERIAnimation@@UAEPAXI@Z
_TEXT	SEGMENT
___flags$ = 8
_this$ = -4
??_GEPreloadBuffer@ERIAnimation@@UAEPAXI@Z PROC NEAR	; ERIAnimation::EPreloadBuffer::`scalar deleting destructor', COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1EPreloadBuffer@ERIAnimation@@UAE@XZ	; ERIAnimation::EPreloadBuffer::~EPreloadBuffer
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
??_GEPreloadBuffer@ERIAnimation@@UAEPAXI@Z ENDP		; ERIAnimation::EPreloadBuffer::`scalar deleting destructor'
_TEXT	ENDS
EXTRN	?eriFreeMemory@@YAXPAX@Z:NEAR			; eriFreeMemory
EXTRN	??1EMemFile@@UAE@XZ:NEAR			; EMemFile::~EMemFile
_TEXT	SEGMENT
_this$ = -4
??1EPreloadBuffer@ERIAnimation@@UAE@XZ PROC NEAR	; ERIAnimation::EPreloadBuffer::~EPreloadBuffer
; Line 42
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EPreloadBuffer@ERIAnimation@@6B@ ; ERIAnimation::EPreloadBuffer::`vftable'
; Line 43
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1EMemFile@@UAE@XZ			; EMemFile::~EMemFile
; Line 44
	mov	esp, ebp
	pop	ebp
	ret	0
??1EPreloadBuffer@ERIAnimation@@UAE@XZ ENDP		; ERIAnimation::EPreloadBuffer::~EPreloadBuffer
_TEXT	ENDS
PUBLIC	??0EPreloadQueue@ERIAnimation@@QAE@XZ		; ERIAnimation::EPreloadQueue::EPreloadQueue
_TEXT	SEGMENT
_this$ = -4
??0EPreloadQueue@ERIAnimation@@QAE@XZ PROC NEAR		; ERIAnimation::EPreloadQueue::EPreloadQueue
; Line 50
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 51
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], 0
; Line 52
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], 0
; Line 53
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], 0
; Line 54
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0EPreloadQueue@ERIAnimation@@QAE@XZ ENDP		; ERIAnimation::EPreloadQueue::EPreloadQueue
_TEXT	ENDS
PUBLIC	??1EPreloadQueue@ERIAnimation@@QAE@XZ		; ERIAnimation::EPreloadQueue::~EPreloadQueue
PUBLIC	?RemoveAll@EPreloadQueue@ERIAnimation@@QAEXXZ	; ERIAnimation::EPreloadQueue::RemoveAll
_TEXT	SEGMENT
_this$ = -4
??1EPreloadQueue@ERIAnimation@@QAE@XZ PROC NEAR		; ERIAnimation::EPreloadQueue::~EPreloadQueue
; Line 60
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 61
	mov	ecx, DWORD PTR _this$[ebp]
	call	?RemoveAll@EPreloadQueue@ERIAnimation@@QAEXXZ ; ERIAnimation::EPreloadQueue::RemoveAll
; Line 62
	mov	esp, ebp
	pop	ebp
	ret	0
??1EPreloadQueue@ERIAnimation@@QAE@XZ ENDP		; ERIAnimation::EPreloadQueue::~EPreloadQueue
_TEXT	ENDS
PUBLIC	?SetLimit@EPreloadQueue@ERIAnimation@@QAEXI@Z	; ERIAnimation::EPreloadQueue::SetLimit
_TEXT	SEGMENT
_nLimit$ = 8
_this$ = -4
?SetLimit@EPreloadQueue@ERIAnimation@@QAEXI@Z PROC NEAR	; ERIAnimation::EPreloadQueue::SetLimit
; Line 68
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 69
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nLimit$[ebp]
	mov	DWORD PTR [eax+8], ecx
; Line 71
	mov	edx, DWORD PTR _nLimit$[ebp]
	shl	edx, 2
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 72
	mov	esp, ebp
	pop	ebp
	ret	4
?SetLimit@EPreloadQueue@ERIAnimation@@QAEXI@Z ENDP	; ERIAnimation::EPreloadQueue::SetLimit
_this$ = -16
_i$31065 = -4
$T31591 = -8
$T31592 = -12
?RemoveAll@EPreloadQueue@ERIAnimation@@QAEXXZ PROC NEAR	; ERIAnimation::EPreloadQueue::RemoveAll
; Line 78
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 79
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L31064
; Line 81
	mov	DWORD PTR _i$31065[ebp], 0
	jmp	SHORT $L31066
$L31067:
	mov	ecx, DWORD PTR _i$31065[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$31065[ebp], ecx
$L31066:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$31065[ebp]
	cmp	eax, DWORD PTR [edx+4]
	jae	SHORT $L31068
; Line 83
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _i$31065[ebp]
	mov	ecx, DWORD PTR [edx+eax*4]
	mov	DWORD PTR $T31592[ebp], ecx
	mov	edx, DWORD PTR $T31592[ebp]
	mov	DWORD PTR $T31591[ebp], edx
	cmp	DWORD PTR $T31591[ebp], 0
	je	SHORT $L31593
	push	1
	mov	eax, DWORD PTR $T31591[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR $T31591[ebp]
	call	DWORD PTR [edx]
	mov	DWORD PTR -20+[ebp], eax
	jmp	SHORT $L31594
$L31593:
	mov	DWORD PTR -20+[ebp], 0
$L31594:
; Line 84
	jmp	SHORT $L31067
$L31068:
; Line 85
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 86
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx], 0
; Line 87
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 88
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+8], 0
$L31064:
; Line 90
	mov	esp, ebp
	pop	ebp
	ret	0
?RemoveAll@EPreloadQueue@ERIAnimation@@QAEXXZ ENDP	; ERIAnimation::EPreloadQueue::RemoveAll
_TEXT	ENDS
PUBLIC	??0EKeyPointList@ERIAnimation@@QAE@XZ		; ERIAnimation::EKeyPointList::EKeyPointList
_TEXT	SEGMENT
_this$ = -4
??0EKeyPointList@ERIAnimation@@QAE@XZ PROC NEAR		; ERIAnimation::EKeyPointList::EKeyPointList
; Line 96
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 97
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], 0
; Line 98
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], 0
; Line 99
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], 0
; Line 100
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0EKeyPointList@ERIAnimation@@QAE@XZ ENDP		; ERIAnimation::EKeyPointList::EKeyPointList
_TEXT	ENDS
PUBLIC	??1EKeyPointList@ERIAnimation@@QAE@XZ		; ERIAnimation::EKeyPointList::~EKeyPointList
PUBLIC	?RemoveAll@EKeyPointList@ERIAnimation@@QAEXXZ	; ERIAnimation::EKeyPointList::RemoveAll
_TEXT	SEGMENT
_this$ = -4
??1EKeyPointList@ERIAnimation@@QAE@XZ PROC NEAR		; ERIAnimation::EKeyPointList::~EKeyPointList
; Line 106
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 107
	mov	ecx, DWORD PTR _this$[ebp]
	call	?RemoveAll@EKeyPointList@ERIAnimation@@QAEXXZ ; ERIAnimation::EKeyPointList::RemoveAll
; Line 108
	mov	esp, ebp
	pop	ebp
	ret	0
??1EKeyPointList@ERIAnimation@@QAE@XZ ENDP		; ERIAnimation::EKeyPointList::~EKeyPointList
_TEXT	ENDS
PUBLIC	?SetLimit@EKeyPointList@ERIAnimation@@QAEXI@Z	; ERIAnimation::EKeyPointList::SetLimit
_TEXT	SEGMENT
_nLimit$ = 8
_this$ = -4
?SetLimit@EKeyPointList@ERIAnimation@@QAEXI@Z PROC NEAR	; ERIAnimation::EKeyPointList::SetLimit
; Line 114
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 115
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nLimit$[ebp]
	mov	DWORD PTR [eax+8], ecx
; Line 117
	mov	edx, DWORD PTR _nLimit$[ebp]
	shl	edx, 3
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 118
	mov	esp, ebp
	pop	ebp
	ret	4
?SetLimit@EKeyPointList@ERIAnimation@@QAEXI@Z ENDP	; ERIAnimation::EKeyPointList::SetLimit
_this$ = -4
?RemoveAll@EKeyPointList@ERIAnimation@@QAEXXZ PROC NEAR	; ERIAnimation::EKeyPointList::RemoveAll
; Line 124
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 125
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax], 0
	je	SHORT $L31085
; Line 127
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 128
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], 0
; Line 129
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], 0
; Line 130
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], 0
$L31085:
; Line 132
	mov	esp, ebp
	pop	ebp
	ret	0
?RemoveAll@EKeyPointList@ERIAnimation@@QAEXXZ ENDP	; ERIAnimation::EKeyPointList::RemoveAll
_TEXT	ENDS
PUBLIC	??0ERIAnimation@@QAE@XZ				; ERIAnimation::ERIAnimation
PUBLIC	?CreateImageBuffer@ERIAnimation@@MAEPAURASTER_IMAGE_INFO@@KJJKPAPATENTIS_PALETTE@@@Z ; ERIAnimation::CreateImageBuffer
PUBLIC	?DeleteImageBuffer@ERIAnimation@@MAEXPAURASTER_IMAGE_INFO@@PATENTIS_PALETTE@@@Z ; ERIAnimation::DeleteImageBuffer
PUBLIC	?CreateERIDecoder@ERIAnimation@@MAEPAVERIDecoder@@XZ ; ERIAnimation::CreateERIDecoder
PUBLIC	?CreateMIODecoder@ERIAnimation@@MAEPAVMIODecoder@@XZ ; ERIAnimation::CreateMIODecoder
PUBLIC	?RequestWaveOut@ERIAnimation@@MAE_NKKK@Z	; ERIAnimation::RequestWaveOut
PUBLIC	?CloseWaveOut@ERIAnimation@@MAEXXZ		; ERIAnimation::CloseWaveOut
PUBLIC	?PushWaveBuffer@ERIAnimation@@MAEXPAXK@Z	; ERIAnimation::PushWaveBuffer
PUBLIC	?AllocateWaveBuffer@ERIAnimation@@UAEPAXK@Z	; ERIAnimation::AllocateWaveBuffer
PUBLIC	?DeleteWaveBuffer@ERIAnimation@@UAEXPAX@Z	; ERIAnimation::DeleteWaveBuffer
PUBLIC	?BeginWaveStreaming@ERIAnimation@@UAEXXZ	; ERIAnimation::BeginWaveStreaming
PUBLIC	?EndWaveStreaming@ERIAnimation@@UAEXXZ		; ERIAnimation::EndWaveStreaming
PUBLIC	??_7ERIAnimation@@6B@				; ERIAnimation::`vftable'
EXTRN	__imp__InitializeCriticalSection@4:NEAR
EXTRN	??0ERIFile@@QAE@XZ:NEAR				; ERIFile::ERIFile
;	COMDAT ??_7ERIAnimation@@6B@
; File I:\EntisGLS\eri-chan\experi\common\erianime.cpp
CONST	SEGMENT
??_7ERIAnimation@@6B@ DD FLAT:?CreateImageBuffer@ERIAnimation@@MAEPAURASTER_IMAGE_INFO@@KJJKPAPATENTIS_PALETTE@@@Z ; ERIAnimation::`vftable'
	DD	FLAT:?DeleteImageBuffer@ERIAnimation@@MAEXPAURASTER_IMAGE_INFO@@PATENTIS_PALETTE@@@Z
	DD	FLAT:?CreateERIDecoder@ERIAnimation@@MAEPAVERIDecoder@@XZ
	DD	FLAT:?CreateMIODecoder@ERIAnimation@@MAEPAVMIODecoder@@XZ
	DD	FLAT:?RequestWaveOut@ERIAnimation@@MAE_NKKK@Z
	DD	FLAT:?CloseWaveOut@ERIAnimation@@MAEXXZ
	DD	FLAT:?PushWaveBuffer@ERIAnimation@@MAEXPAXK@Z
	DD	FLAT:?AllocateWaveBuffer@ERIAnimation@@UAEPAXK@Z
	DD	FLAT:?DeleteWaveBuffer@ERIAnimation@@UAEXPAX@Z
	DD	FLAT:?BeginWaveStreaming@ERIAnimation@@UAEXXZ
	DD	FLAT:?EndWaveStreaming@ERIAnimation@@UAEXXZ
CONST	ENDS
_TEXT	SEGMENT
_this$ = -4
??0ERIAnimation@@QAE@XZ PROC NEAR			; ERIAnimation::ERIAnimation
; File I:\EntisGLS\eri-chan\experi\common\erianime.cpp
; Line 138
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	??0ERIFile@@QAE@XZ			; ERIFile::ERIFile
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1300				; 00000514H
	call	??0EPreloadQueue@ERIAnimation@@QAE@XZ	; ERIAnimation::EPreloadQueue::EPreloadQueue
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1320				; 00000528H
	call	??0EKeyPointList@ERIAnimation@@QAE@XZ	; ERIAnimation::EKeyPointList::EKeyPointList
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1332				; 00000534H
	call	??0EKeyPointList@ERIAnimation@@QAE@XZ	; ERIAnimation::EKeyPointList::EKeyPointList
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7ERIAnimation@@6B@ ; ERIAnimation::`vftable'
; Line 139
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+5], 0
; Line 140
	mov	edx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [edx+6], 0
; Line 141
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+1260], 0
; Line 142
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1264], 0
; Line 143
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+1268], 0
; Line 144
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+1272], 0
; Line 145
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1280], 0
; Line 146
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+1284], 0
; Line 147
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+1288], 0
; Line 148
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1292], 0
; Line 149
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+1312], 0
; Line 150
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+1316], 0
; Line 151
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1344				; 00000540H
	push	ecx
	call	DWORD PTR __imp__InitializeCriticalSection@4
; Line 152
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0ERIAnimation@@QAE@XZ ENDP				; ERIAnimation::ERIAnimation
_TEXT	ENDS
PUBLIC	??1ERIAnimation@@QAE@XZ				; ERIAnimation::~ERIAnimation
PUBLIC	?Close@ERIAnimation@@QAEXXZ			; ERIAnimation::Close
EXTRN	__imp__DeleteCriticalSection@4:NEAR
EXTRN	??1ERIFile@@UAE@XZ:NEAR				; ERIFile::~ERIFile
_TEXT	SEGMENT
_this$ = -4
??1ERIAnimation@@QAE@XZ PROC NEAR			; ERIAnimation::~ERIAnimation
; Line 158
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7ERIAnimation@@6B@ ; ERIAnimation::`vftable'
; Line 159
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Close@ERIAnimation@@QAEXXZ		; ERIAnimation::Close
; Line 160
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1344				; 00000540H
	push	ecx
	call	DWORD PTR __imp__DeleteCriticalSection@4
; Line 161
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1332				; 00000534H
	call	??1EKeyPointList@ERIAnimation@@QAE@XZ	; ERIAnimation::EKeyPointList::~EKeyPointList
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1320				; 00000528H
	call	??1EKeyPointList@ERIAnimation@@QAE@XZ	; ERIAnimation::EKeyPointList::~EKeyPointList
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1300				; 00000514H
	call	??1EPreloadQueue@ERIAnimation@@QAE@XZ	; ERIAnimation::EPreloadQueue::~EPreloadQueue
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	??1ERIFile@@UAE@XZ			; ERIFile::~ERIFile
	mov	esp, ebp
	pop	ebp
	ret	0
??1ERIAnimation@@QAE@XZ ENDP				; ERIAnimation::~ERIAnimation
_TEXT	ENDS
EXTRN	??2@YAPAXI@Z:NEAR				; operator new
_TEXT	SEGMENT
_format$ = 8
_width$ = 12
_height$ = 16
_bpp$ = 20
_ppaltbl$ = 24
_this$ = -8
_prii$ = -4
?CreateImageBuffer@ERIAnimation@@MAEPAURASTER_IMAGE_INFO@@KJJKPAPATENTIS_PALETTE@@@Z PROC NEAR ; ERIAnimation::CreateImageBuffer
; Line 169
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 170
	push	24					; 00000018H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR _prii$[ebp], eax
; Line 171
	cmp	DWORD PTR _height$[ebp], 0
	jge	SHORT $L31101
; Line 173
	mov	eax, DWORD PTR _height$[ebp]
	neg	eax
	mov	DWORD PTR _height$[ebp], eax
$L31101:
; Line 175
	mov	ecx, DWORD PTR _prii$[ebp]
	mov	edx, DWORD PTR _format$[ebp]
	mov	DWORD PTR [ecx], edx
; Line 176
	mov	eax, DWORD PTR _prii$[ebp]
	mov	ecx, DWORD PTR _width$[ebp]
	mov	DWORD PTR [eax+8], ecx
; Line 177
	mov	edx, DWORD PTR _prii$[ebp]
	mov	eax, DWORD PTR _height$[ebp]
	mov	DWORD PTR [edx+12], eax
; Line 178
	mov	ecx, DWORD PTR _prii$[ebp]
	mov	edx, DWORD PTR _bpp$[ebp]
	mov	DWORD PTR [ecx+16], edx
; Line 179
	mov	eax, DWORD PTR _width$[ebp]
	imul	eax, DWORD PTR _bpp$[ebp]
	shr	eax, 3
	add	eax, 3
	and	al, -4					; fffffffcH
	mov	ecx, DWORD PTR _prii$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 181
	mov	edx, DWORD PTR _prii$[ebp]
	mov	eax, DWORD PTR [edx+20]
	imul	eax, DWORD PTR _height$[ebp]
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _prii$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 183
	cmp	DWORD PTR _ppaltbl$[ebp], 0
	je	SHORT $L31103
; Line 185
	cmp	DWORD PTR _bpp$[ebp], 8
	ja	SHORT $L31104
; Line 187
	push	1024					; 00000400H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	edx, DWORD PTR _ppaltbl$[ebp]
	mov	DWORD PTR [edx], eax
; Line 189
	jmp	SHORT $L31106
$L31104:
; Line 191
	mov	eax, DWORD PTR _ppaltbl$[ebp]
	mov	DWORD PTR [eax], 0
$L31106:
$L31103:
; Line 195
	mov	eax, DWORD PTR _prii$[ebp]
; Line 196
	mov	esp, ebp
	pop	ebp
	ret	20					; 00000014H
?CreateImageBuffer@ERIAnimation@@MAEPAURASTER_IMAGE_INFO@@KJJKPAPATENTIS_PALETTE@@@Z ENDP ; ERIAnimation::CreateImageBuffer
_prii$ = 8
_paltbl$ = 12
_this$ = -12
$T31595 = -4
$T31596 = -8
?DeleteImageBuffer@ERIAnimation@@MAEXPAURASTER_IMAGE_INFO@@PATENTIS_PALETTE@@@Z PROC NEAR ; ERIAnimation::DeleteImageBuffer
; Line 203
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 204
	cmp	DWORD PTR _prii$[ebp], 0
	je	SHORT $L31111
; Line 206
	mov	eax, DWORD PTR _prii$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 207
	mov	edx, DWORD PTR _prii$[ebp]
	mov	DWORD PTR $T31595[ebp], edx
	mov	eax, DWORD PTR $T31595[ebp]
	push	eax
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L31111:
; Line 209
	cmp	DWORD PTR _paltbl$[ebp], 0
	je	SHORT $L31113
; Line 211
	mov	ecx, DWORD PTR _paltbl$[ebp]
	mov	DWORD PTR $T31596[ebp], ecx
	mov	edx, DWORD PTR $T31596[ebp]
	push	edx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L31113:
; Line 213
	mov	esp, ebp
	pop	ebp
	ret	8
?DeleteImageBuffer@ERIAnimation@@MAEXPAURASTER_IMAGE_INFO@@PATENTIS_PALETTE@@@Z ENDP ; ERIAnimation::DeleteImageBuffer
_TEXT	ENDS
EXTRN	??0ERIDecoder@@QAE@XZ:NEAR			; ERIDecoder::ERIDecoder
_TEXT	SEGMENT
_this$ = -8
$T31597 = -4
?CreateERIDecoder@ERIAnimation@@MAEPAVERIDecoder@@XZ PROC NEAR ; ERIAnimation::CreateERIDecoder
; Line 219
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 220
	push	432					; 000001b0H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR $T31597[ebp], eax
	cmp	DWORD PTR $T31597[ebp], 0
	je	SHORT $L31598
	mov	ecx, DWORD PTR $T31597[ebp]
	call	??0ERIDecoder@@QAE@XZ			; ERIDecoder::ERIDecoder
	mov	DWORD PTR -12+[ebp], eax
	jmp	SHORT $L31599
$L31598:
	mov	DWORD PTR -12+[ebp], 0
$L31599:
	mov	eax, DWORD PTR -12+[ebp]
; Line 221
	mov	esp, ebp
	pop	ebp
	ret	0
?CreateERIDecoder@ERIAnimation@@MAEPAVERIDecoder@@XZ ENDP ; ERIAnimation::CreateERIDecoder
_TEXT	ENDS
EXTRN	??0MIODecoder@@QAE@XZ:NEAR			; MIODecoder::MIODecoder
_TEXT	SEGMENT
_this$ = -8
$T31600 = -4
?CreateMIODecoder@ERIAnimation@@MAEPAVMIODecoder@@XZ PROC NEAR ; ERIAnimation::CreateMIODecoder
; Line 227
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 228
	push	164					; 000000a4H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR $T31600[ebp], eax
	cmp	DWORD PTR $T31600[ebp], 0
	je	SHORT $L31601
	mov	ecx, DWORD PTR $T31600[ebp]
	call	??0MIODecoder@@QAE@XZ			; MIODecoder::MIODecoder
	mov	DWORD PTR -12+[ebp], eax
	jmp	SHORT $L31602
$L31601:
	mov	DWORD PTR -12+[ebp], 0
$L31602:
	mov	eax, DWORD PTR -12+[ebp]
; Line 229
	mov	esp, ebp
	pop	ebp
	ret	0
?CreateMIODecoder@ERIAnimation@@MAEPAVMIODecoder@@XZ ENDP ; ERIAnimation::CreateMIODecoder
_this$ = -4
?RequestWaveOut@ERIAnimation@@MAE_NKKK@Z PROC NEAR	; ERIAnimation::RequestWaveOut
; Line 236
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 237
	xor	al, al
; Line 238
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?RequestWaveOut@ERIAnimation@@MAE_NKKK@Z ENDP		; ERIAnimation::RequestWaveOut
_this$ = -4
?CloseWaveOut@ERIAnimation@@MAEXXZ PROC NEAR		; ERIAnimation::CloseWaveOut
; Line 244
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 245
	mov	esp, ebp
	pop	ebp
	ret	0
?CloseWaveOut@ERIAnimation@@MAEXXZ ENDP			; ERIAnimation::CloseWaveOut
_ptrWaveBuf$ = 8
_this$ = -4
?PushWaveBuffer@ERIAnimation@@MAEXPAXK@Z PROC NEAR	; ERIAnimation::PushWaveBuffer
; Line 251
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 252
	mov	eax, DWORD PTR _ptrWaveBuf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+32]
; Line 253
	mov	esp, ebp
	pop	ebp
	ret	8
?PushWaveBuffer@ERIAnimation@@MAEXPAXK@Z ENDP		; ERIAnimation::PushWaveBuffer
_dwBytes$ = 8
_this$ = -4
?AllocateWaveBuffer@ERIAnimation@@UAEPAXK@Z PROC NEAR	; ERIAnimation::AllocateWaveBuffer
; Line 259
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 260
	mov	eax, DWORD PTR _dwBytes$[ebp]
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
; Line 261
	mov	esp, ebp
	pop	ebp
	ret	4
?AllocateWaveBuffer@ERIAnimation@@UAEPAXK@Z ENDP	; ERIAnimation::AllocateWaveBuffer
_ptrWaveBuf$ = 8
_this$ = -4
?DeleteWaveBuffer@ERIAnimation@@UAEXPAX@Z PROC NEAR	; ERIAnimation::DeleteWaveBuffer
; Line 267
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 268
	mov	eax, DWORD PTR _ptrWaveBuf$[ebp]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 269
	mov	esp, ebp
	pop	ebp
	ret	4
?DeleteWaveBuffer@ERIAnimation@@UAEXPAX@Z ENDP		; ERIAnimation::DeleteWaveBuffer
_TEXT	ENDS
EXTRN	__imp__PostThreadMessageA@16:NEAR
EXTRN	__imp__CreateEventA@16:NEAR
EXTRN	__imp__WaitForMultipleObjects@16:NEAR
EXTRN	__imp__CloseHandle@4:NEAR
_TEXT	SEGMENT
_this$ = -16
_hEventList$31148 = -8
_dwWaitResult$31150 = -12
?BeginWaveStreaming@ERIAnimation@@UAEXXZ PROC NEAR	; ERIAnimation::BeginWaveStreaming
; Line 275
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 276
	mov	eax, DWORD PTR _this$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+5]
	test	ecx, ecx
	je	SHORT $L31146
; Line 278
	mov	edx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [edx+6], 1
; Line 280
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1292], 0
	je	SHORT $L31147
; Line 283
	push	0
	push	0
	push	1
	push	0
	call	DWORD PTR __imp__CreateEventA@16
	mov	DWORD PTR _hEventList$31148[ebp], eax
; Line 284
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1292]
	mov	DWORD PTR _hEventList$31148[ebp+4], edx
; Line 287
	mov	eax, DWORD PTR _hEventList$31148[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1276]
	push	edx
	push	1025					; 00000401H
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1296]
	push	ecx
	call	DWORD PTR __imp__PostThreadMessageA@16
; Line 289
	push	-1
	push	0
	lea	edx, DWORD PTR _hEventList$31148[ebp]
	push	edx
	push	2
	call	DWORD PTR __imp__WaitForMultipleObjects@16
	mov	DWORD PTR _dwWaitResult$31150[ebp], eax
; Line 290
	mov	eax, DWORD PTR _hEventList$31148[ebp]
	push	eax
	call	DWORD PTR __imp__CloseHandle@4
$L31147:
$L31146:
; Line 293
	mov	esp, ebp
	pop	ebp
	ret	0
?BeginWaveStreaming@ERIAnimation@@UAEXXZ ENDP		; ERIAnimation::BeginWaveStreaming
_this$ = -4
?EndWaveStreaming@ERIAnimation@@UAEXXZ PROC NEAR	; ERIAnimation::EndWaveStreaming
; Line 299
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 300
	mov	eax, DWORD PTR _this$[ebp]
	mov	BYTE PTR [eax+6], 0
; Line 301
	mov	esp, ebp
	pop	ebp
	ret	0
?EndWaveStreaming@ERIAnimation@@UAEXXZ ENDP		; ERIAnimation::EndWaveStreaming
_TEXT	ENDS
PUBLIC	?Open@ERIAnimation@@QAE_NPAVEFileObject@@I_N@Z	; ERIAnimation::Open
PUBLIC	?SeekToNextFrame@ERIAnimation@@QAE_NH@Z		; ERIAnimation::SeekToNextFrame
PUBLIC	?ThreadProc@ERIAnimation@@KGKPAX@Z		; ERIAnimation::ThreadProc
EXTRN	??0EFileDecodeContext@@QAE@PAVEFileObject@@K@Z:NEAR ; EFileDecodeContext::EFileDecodeContext
EXTRN	__imp__CreateThread@24:NEAR
EXTRN	?Open@ERIFile@@QAE_NPAVEFileObject@@W4OpenType@1@@Z:NEAR ; ERIFile::Open
_TEXT	SEGMENT
_pFile$ = 8
_nPreloadSize$ = 12
_fTopDown$ = 16
_this$ = -20
_nImageHeight$ = -8
_ppaltbl$ = -4
$T31603 = -12
$T31606 = -16
?Open@ERIAnimation@@QAE_NPAVEFileObject@@I_N@Z PROC NEAR ; ERIAnimation::Open
; Line 308
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 309
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Close@ERIAnimation@@QAEXXZ		; ERIAnimation::Close
; Line 313
	push	2
	mov	eax, DWORD PTR _pFile$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?Open@ERIFile@@QAE_NPAVEFileObject@@W4OpenType@1@@Z ; ERIFile::Open
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31159
; Line 315
	xor	al, al
	jmp	$L31158
$L31159:
; Line 320
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+8]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1264], eax
; Line 321
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 112				; 00000070H
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1264]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1264]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+4]
	test	eax, eax
	je	SHORT $L31160
; Line 323
	xor	al, al
	jmp	$L31158
$L31160:
; Line 325
	push	3160					; 00000c58H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR $T31603[ebp], eax
	cmp	DWORD PTR $T31603[ebp], 0
	je	SHORT $L31604
	push	65536					; 00010000H
	push	0
	mov	ecx, DWORD PTR $T31603[ebp]
	call	??0EFileDecodeContext@@QAE@PAVEFileObject@@K@Z ; EFileDecodeContext::EFileDecodeContext
	mov	DWORD PTR -24+[ebp], eax
	jmp	SHORT $L31605
$L31604:
	mov	DWORD PTR -24+[ebp], 0
$L31605:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR -24+[ebp]
	mov	DWORD PTR [eax+1260], ecx
; Line 327
	mov	edx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [edx+5], 0
; Line 328
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	and	ecx, 8
	test	ecx, ecx
	je	$L31163
; Line 332
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1272], eax
; Line 333
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 180				; 000000b4H
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1272]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1272]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+4]
	test	eax, eax
	jne	SHORT $L31164
; Line 335
	push	3160					; 00000c58H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR $T31606[ebp], eax
	cmp	DWORD PTR $T31606[ebp], 0
	je	SHORT $L31607
	push	65536					; 00010000H
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR $T31606[ebp]
	call	??0EFileDecodeContext@@QAE@PAVEFileObject@@K@Z ; EFileDecodeContext::EFileDecodeContext
	mov	DWORD PTR -28+[ebp], eax
	jmp	SHORT $L31608
$L31607:
	mov	DWORD PTR -28+[ebp], 0
$L31608:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR -28+[ebp]
	mov	DWORD PTR [ecx+1268], edx
; Line 341
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+216]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+196]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+192]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+16]
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L31167
; Line 345
	mov	eax, DWORD PTR _this$[ebp]
	mov	BYTE PTR [eax+5], 1
$L31167:
$L31164:
$L31163:
; Line 352
	mov	ecx, DWORD PTR _this$[ebp]
	mov	dl, BYTE PTR _fTopDown$[ebp]
	mov	BYTE PTR [ecx+4], dl
; Line 354
	mov	DWORD PTR _ppaltbl$[ebp], 0
; Line 355
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+136], 8
	ja	SHORT $L31170
; Line 357
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1284				; 00000504H
	mov	DWORD PTR _ppaltbl$[ebp], ecx
$L31170:
; Line 359
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+132]
	mov	DWORD PTR _nImageHeight$[ebp], eax
; Line 360
	cmp	DWORD PTR _nImageHeight$[ebp], 0
	jge	SHORT $L31171
; Line 362
	mov	ecx, DWORD PTR _nImageHeight$[ebp]
	neg	ecx
	mov	DWORD PTR _nImageHeight$[ebp], ecx
$L31171:
; Line 367
	mov	edx, DWORD PTR _ppaltbl$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+136]
	push	ecx
	mov	edx, DWORD PTR _nImageHeight$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1280], eax
; Line 369
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+1280], 0
	jne	SHORT $L31172
; Line 371
	xor	al, al
	jmp	$L31158
$L31172:
; Line 374
	push	24					; 00000018H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1288], eax
; Line 375
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1288]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	mov	DWORD PTR [eax], edx
; Line 376
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1288]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+128]
	mov	DWORD PTR [ecx+8], eax
; Line 377
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1288]
	mov	eax, DWORD PTR _nImageHeight$[ebp]
	mov	DWORD PTR [edx+12], eax
; Line 378
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1288]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+136]
	mov	DWORD PTR [edx+16], ecx
; Line 381
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+128]
	imul	ecx, DWORD PTR [eax+136]
	shr	ecx, 3
	add	ecx, 3
	and	ecx, -4					; fffffffcH
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1288]
	mov	DWORD PTR [eax+20], ecx
; Line 384
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1288]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1288]
	mov	edx, DWORD PTR [edx+20]
	imul	edx, DWORD PTR [ecx+12]
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1288]
	mov	DWORD PTR [edx+4], eax
; Line 388
	cmp	DWORD PTR _nPreloadSize$[ebp], 0
	jne	SHORT $L31175
; Line 390
	mov	DWORD PTR _nPreloadSize$[ebp], 30	; 0000001eH
$L31175:
; Line 392
	mov	eax, DWORD PTR _nPreloadSize$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1300				; 00000514H
	call	?SetLimit@EPreloadQueue@ERIAnimation@@QAEXI@Z ; ERIAnimation::EPreloadQueue::SetLimit
; Line 396
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+36]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1320				; 00000528H
	call	?SetLimit@EKeyPointList@ERIAnimation@@QAEXI@Z ; ERIAnimation::EKeyPointList::SetLimit
; Line 397
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+36]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1332				; 00000534H
	call	?SetLimit@EKeyPointList@ERIAnimation@@QAEXI@Z ; ERIAnimation::EKeyPointList::SetLimit
; Line 401
	push	0
	push	0
	push	1
	push	0
	call	DWORD PTR __imp__CreateEventA@16
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+1312], eax
; Line 402
	push	0
	push	1
	push	1
	push	0
	call	DWORD PTR __imp__CreateEventA@16
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1316], eax
; Line 404
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 1296				; 00000510H
	push	edx
	push	0
	mov	eax, DWORD PTR _this$[ebp]
	push	eax
	push	OFFSET FLAT:?ThreadProc@ERIAnimation@@KGKPAX@Z ; ERIAnimation::ThreadProc
	push	0
	push	0
	call	DWORD PTR __imp__CreateThread@24
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1292], eax
; Line 405
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+1312], 0
	je	SHORT $L31177
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1316], 0
	je	SHORT $L31177
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+1292], 0
	jne	SHORT $L31176
$L31177:
; Line 407
	xor	al, al
	jmp	SHORT $L31158
$L31176:
; Line 412
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SeekToNextFrame@ERIAnimation@@QAE_NH@Z	; ERIAnimation::SeekToNextFrame
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31178
; Line 414
	xor	al, al
	jmp	SHORT $L31158
$L31178:
; Line 417
	mov	al, 1
$L31158:
; Line 418
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?Open@ERIAnimation@@QAE_NPAVEFileObject@@I_N@Z ENDP	; ERIAnimation::Open
_TEXT	ENDS
EXTRN	__imp__WaitForSingleObject@8:NEAR
EXTRN	?Close@ERIFile@@QAEXXZ:NEAR			; ERIFile::Close
_TEXT	SEGMENT
_this$ = -40
$T31609 = -4
$T31610 = -8
$T31611 = -12
$T31614 = -16
$T31615 = -20
$T31618 = -24
$T31619 = -28
$T31622 = -32
$T31623 = -36
?Close@ERIAnimation@@QAEXXZ PROC NEAR			; ERIAnimation::Close
; Line 424
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	mov	DWORD PTR _this$[ebp], ecx
; Line 427
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1292], 0
	je	SHORT $L31182
; Line 429
	push	0
	push	0
	push	1026					; 00000402H
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1296]
	push	edx
	call	DWORD PTR __imp__PostThreadMessageA@16
; Line 430
	push	-1
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1292]
	push	ecx
	call	DWORD PTR __imp__WaitForSingleObject@8
; Line 431
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1292]
	push	eax
	call	DWORD PTR __imp__CloseHandle@4
; Line 432
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1292], 0
$L31182:
; Line 436
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+1312], 0
	je	SHORT $L31183
; Line 438
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1312]
	push	ecx
	call	DWORD PTR __imp__CloseHandle@4
; Line 439
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+1312], 0
$L31183:
; Line 441
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1316], 0
	je	SHORT $L31184
; Line 443
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1316]
	push	edx
	call	DWORD PTR __imp__CloseHandle@4
; Line 444
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+1316], 0
$L31184:
; Line 446
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1300				; 00000514H
	call	?RemoveAll@EPreloadQueue@ERIAnimation@@QAEXXZ ; ERIAnimation::EPreloadQueue::RemoveAll
; Line 449
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1320				; 00000528H
	call	?RemoveAll@EKeyPointList@ERIAnimation@@QAEXXZ ; ERIAnimation::EKeyPointList::RemoveAll
; Line 450
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1332				; 00000534H
	call	?RemoveAll@EKeyPointList@ERIAnimation@@QAEXXZ ; ERIAnimation::EKeyPointList::RemoveAll
; Line 453
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+1280], 0
	je	SHORT $L31185
; Line 455
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1284]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1280]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+4]
; Line 456
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+1280], 0
; Line 457
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1284], 0
$L31185:
; Line 459
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+1288], 0
	je	SHORT $L31186
; Line 461
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1288]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 462
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1288]
	mov	DWORD PTR $T31609[ebp], ecx
	mov	edx, DWORD PTR $T31609[ebp]
	push	edx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
; Line 463
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+1288], 0
$L31186:
; Line 467
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+1264], 0
	je	SHORT $L31188
; Line 469
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+1264]
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+1264]
	mov	eax, DWORD PTR [edx]
	call	DWORD PTR [eax+8]
; Line 470
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1264]
	mov	DWORD PTR $T31611[ebp], edx
	mov	eax, DWORD PTR $T31611[ebp]
	mov	DWORD PTR $T31610[ebp], eax
	cmp	DWORD PTR $T31610[ebp], 0
	je	SHORT $L31612
	push	1
	mov	ecx, DWORD PTR $T31610[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR $T31610[ebp]
	call	DWORD PTR [edx]
	mov	DWORD PTR -44+[ebp], eax
	jmp	SHORT $L31613
$L31612:
	mov	DWORD PTR -44+[ebp], 0
$L31613:
; Line 471
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+1264], 0
$L31188:
; Line 473
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+1272], 0
	je	SHORT $L31191
; Line 475
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+1272]
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+1272]
	mov	eax, DWORD PTR [edx]
	call	DWORD PTR [eax+8]
; Line 476
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1272]
	mov	DWORD PTR $T31615[ebp], edx
	mov	eax, DWORD PTR $T31615[ebp]
	mov	DWORD PTR $T31614[ebp], eax
	cmp	DWORD PTR $T31614[ebp], 0
	je	SHORT $L31616
	push	1
	mov	ecx, DWORD PTR $T31614[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR $T31614[ebp]
	call	DWORD PTR [edx]
	mov	DWORD PTR -48+[ebp], eax
	jmp	SHORT $L31617
$L31616:
	mov	DWORD PTR -48+[ebp], 0
$L31617:
; Line 477
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+1272], 0
$L31191:
; Line 479
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+1260], 0
	je	SHORT $L31194
; Line 481
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1260]
	mov	DWORD PTR $T31619[ebp], eax
	mov	ecx, DWORD PTR $T31619[ebp]
	mov	DWORD PTR $T31618[ebp], ecx
	cmp	DWORD PTR $T31618[ebp], 0
	je	SHORT $L31620
	push	1
	mov	edx, DWORD PTR $T31618[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR $T31618[ebp]
	call	DWORD PTR [eax]
	mov	DWORD PTR -52+[ebp], eax
	jmp	SHORT $L31621
$L31620:
	mov	DWORD PTR -52+[ebp], 0
$L31621:
; Line 482
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+1260], 0
$L31194:
; Line 484
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+1268], 0
	je	SHORT $L31197
; Line 486
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1268]
	mov	DWORD PTR $T31623[ebp], ecx
	mov	edx, DWORD PTR $T31623[ebp]
	mov	DWORD PTR $T31622[ebp], edx
	cmp	DWORD PTR $T31622[ebp], 0
	je	SHORT $L31624
	push	1
	mov	eax, DWORD PTR $T31622[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR $T31622[ebp]
	call	DWORD PTR [edx]
	mov	DWORD PTR -56+[ebp], eax
	jmp	SHORT $L31625
$L31624:
	mov	DWORD PTR -56+[ebp], 0
$L31625:
; Line 487
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+1268], 0
$L31197:
; Line 491
	mov	ecx, DWORD PTR _this$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx+5]
	test	edx, edx
	je	SHORT $L31200
; Line 493
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+20]
; Line 494
	mov	eax, DWORD PTR _this$[ebp]
	mov	BYTE PTR [eax+5], 0
$L31200:
; Line 498
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?Close@ERIFile@@QAEXXZ			; ERIFile::Close
; Line 499
	mov	esp, ebp
	pop	ebp
	ret	0
?Close@ERIAnimation@@QAEXXZ ENDP			; ERIAnimation::Close
_TEXT	ENDS
PUBLIC	?SeekToBegin@ERIAnimation@@QAE_NXZ		; ERIAnimation::SeekToBegin
_TEXT	SEGMENT
_this$ = -16
_hEventList$ = -8
_dwWaitResult$ = -12
?SeekToBegin@ERIAnimation@@QAE_NXZ PROC NEAR		; ERIAnimation::SeekToBegin
; Line 505
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 509
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1292], 0
	jne	SHORT $L31204
; Line 511
	xor	al, al
	jmp	SHORT $L31203
$L31204:
; Line 514
	push	0
	push	0
	push	1
	push	0
	call	DWORD PTR __imp__CreateEventA@16
	mov	DWORD PTR _hEventList$[ebp], eax
; Line 515
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1292]
	mov	DWORD PTR _hEventList$[ebp+4], edx
; Line 517
	mov	eax, DWORD PTR _hEventList$[ebp]
	push	eax
	push	0
	push	1024					; 00000400H
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1296]
	push	edx
	call	DWORD PTR __imp__PostThreadMessageA@16
; Line 519
	push	-1
	push	0
	lea	eax, DWORD PTR _hEventList$[ebp]
	push	eax
	push	2
	call	DWORD PTR __imp__WaitForMultipleObjects@16
	mov	DWORD PTR _dwWaitResult$[ebp], eax
; Line 520
	mov	ecx, DWORD PTR _hEventList$[ebp]
	push	ecx
	call	DWORD PTR __imp__CloseHandle@4
; Line 521
	cmp	DWORD PTR _dwWaitResult$[ebp], 0
	je	SHORT $L31209
; Line 523
	xor	al, al
	jmp	SHORT $L31203
$L31209:
; Line 528
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SeekToNextFrame@ERIAnimation@@QAE_NH@Z	; ERIAnimation::SeekToNextFrame
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31210
; Line 530
	xor	al, al
	jmp	SHORT $L31203
$L31210:
; Line 533
	mov	al, 1
$L31203:
; Line 534
	mov	esp, ebp
	pop	ebp
	ret	0
?SeekToBegin@ERIAnimation@@QAE_NXZ ENDP			; ERIAnimation::SeekToBegin
_TEXT	ENDS
PUBLIC	?DecodeNextFrame@ERIAnimation@@IAE_NXZ		; ERIAnimation::DecodeNextFrame
PUBLIC	?GetPreloadBuffer@ERIAnimation@@IAEPAVEPreloadBuffer@1@XZ ; ERIAnimation::GetPreloadBuffer
PUBLIC	?GetKeyFrameCount@ERIAnimation@@QBEIXZ		; ERIAnimation::GetKeyFrameCount
PUBLIC	?Lock@ERIAnimation@@QAEXXZ			; ERIAnimation::Lock
PUBLIC	?Unlock@ERIAnimation@@QAEXXZ			; ERIAnimation::Unlock
_DATA	SEGMENT
$SG31238 DB	'ImageFrm', 00H
	ORG $+3
$SG31239 DB	'DiffeFrm', 00H
	ORG $+3
$SG31243 DB	'Palette ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_nSkipFrame$ = 8
_this$ = -60
_nBreakCount$ = -8
_nCountUntilNext$31219 = -16
_nSkipKeyFrame$31221 = -12
_nBreakedCount$31223 = -20
_hEventList$31227 = -32
_dwWaitResult$31228 = -36
_pBuffer$31231 = -24
_recid$31233 = -44
_nBytes$31244 = -48
_nSkippedCount$ = -4
$T31626 = -52
$T31627 = -56
?SeekToNextFrame@ERIAnimation@@QAE_NH@Z PROC NEAR	; ERIAnimation::SeekToNextFrame
; Line 540
	push	ebp
	mov	ebp, esp
	sub	esp, 64					; 00000040H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 541
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1292], 0
	jne	SHORT $L31214
; Line 543
	xor	al, al
	jmp	$L31213
$L31214:
; Line 549
	mov	DWORD PTR _nBreakCount$[ebp], 0
; Line 550
	cmp	DWORD PTR _nSkipFrame$[ebp], 0
	jle	$L31216
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetKeyFrameCount@ERIAnimation@@QBEIXZ	; ERIAnimation::GetKeyFrameCount
	test	eax, eax
	je	$L31216
; Line 552
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetKeyFrameCount@ERIAnimation@@QBEIXZ	; ERIAnimation::GetKeyFrameCount
	cmp	eax, 1
	jne	SHORT $L31217
; Line 554
	mov	ecx, DWORD PTR _nSkipFrame$[ebp]
	mov	DWORD PTR _nBreakCount$[ebp], ecx
; Line 556
	jmp	$L31218
$L31217:
; Line 560
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetKeyFrameCount@ERIAnimation@@QBEIXZ	; ERIAnimation::GetKeyFrameCount
	mov	esi, eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetKeyFrameCount@ERIAnimation@@QBEIXZ	; ERIAnimation::GetKeyFrameCount
	mov	ecx, eax
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1276]
	xor	edx, edx
	div	ecx
	sub	esi, edx
	sub	esi, 1
	mov	DWORD PTR _nCountUntilNext$31219[ebp], esi
; Line 561
	mov	eax, DWORD PTR _nCountUntilNext$31219[ebp]
	cmp	eax, DWORD PTR _nSkipFrame$[ebp]
	jg	SHORT $L31220
; Line 563
	mov	ecx, DWORD PTR _nCountUntilNext$31219[ebp]
	mov	DWORD PTR _nBreakCount$[ebp], ecx
; Line 564
	mov	edx, DWORD PTR _nSkipFrame$[ebp]
	sub	edx, DWORD PTR _nCountUntilNext$31219[ebp]
	mov	DWORD PTR _nSkipFrame$[ebp], edx
$L31220:
; Line 566
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetKeyFrameCount@ERIAnimation@@QBEIXZ	; ERIAnimation::GetKeyFrameCount
	mov	ecx, eax
	mov	eax, DWORD PTR _nSkipFrame$[ebp]
	xor	edx, edx
	div	ecx
	mov	DWORD PTR _nSkipKeyFrame$31221[ebp], eax
; Line 567
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetKeyFrameCount@ERIAnimation@@QBEIXZ	; ERIAnimation::GetKeyFrameCount
	mov	edx, DWORD PTR _nSkipKeyFrame$31221[ebp]
	imul	edx, eax
	mov	eax, DWORD PTR _nSkipFrame$[ebp]
	sub	eax, edx
	mov	DWORD PTR _nSkipFrame$[ebp], eax
; Line 568
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetKeyFrameCount@ERIAnimation@@QBEIXZ	; ERIAnimation::GetKeyFrameCount
	mov	ecx, DWORD PTR _nSkipKeyFrame$31221[ebp]
	imul	ecx, eax
	mov	edx, DWORD PTR _nBreakCount$[ebp]
	add	edx, ecx
	mov	DWORD PTR _nBreakCount$[ebp], edx
$L31218:
$L31216:
; Line 574
	cmp	DWORD PTR _nBreakCount$[ebp], 0
	jle	$L31222
; Line 576
	mov	DWORD PTR _nBreakedCount$31223[ebp], 0
$L31225:
; Line 583
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1312]
	mov	DWORD PTR _hEventList$31227[ebp], ecx
; Line 584
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1292]
	mov	DWORD PTR _hEventList$31227[ebp+4], eax
; Line 586
	push	-1
	push	0
	lea	ecx, DWORD PTR _hEventList$31227[ebp]
	push	ecx
	push	2
	call	DWORD PTR __imp__WaitForMultipleObjects@16
	mov	DWORD PTR _dwWaitResult$31228[ebp], eax
; Line 587
	cmp	DWORD PTR _dwWaitResult$31228[ebp], 0
	je	SHORT $L31230
; Line 589
	xor	al, al
	jmp	$L31213
$L31230:
; Line 593
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Lock@ERIAnimation@@QAEXXZ		; ERIAnimation::Lock
; Line 594
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetPreloadBuffer@ERIAnimation@@IAEPAVEPreloadBuffer@1@XZ ; ERIAnimation::GetPreloadBuffer
	mov	DWORD PTR _pBuffer$31231[ebp], eax
; Line 595
	cmp	DWORD PTR _pBuffer$31231[ebp], 0
	je	$L31232
; Line 597
	mov	edx, DWORD PTR _pBuffer$31231[ebp]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR _recid$31233[ebp], eax
	mov	ecx, DWORD PTR [edx+28]
	mov	DWORD PTR _recid$31233[ebp+4], ecx
; Line 599
	mov	edx, DWORD PTR _recid$31233[ebp]
	cmp	edx, DWORD PTR $SG31238
	jne	SHORT $L31630
	mov	eax, DWORD PTR _recid$31233[ebp+4]
	cmp	eax, DWORD PTR $SG31238+4
	je	SHORT $L31237
$L31630:
	mov	ecx, DWORD PTR _recid$31233[ebp]
	cmp	ecx, DWORD PTR $SG31239
	jne	SHORT $L31236
	mov	edx, DWORD PTR _recid$31233[ebp+4]
	cmp	edx, DWORD PTR $SG31239+4
	jne	SHORT $L31236
$L31237:
; Line 603
	mov	eax, DWORD PTR _nBreakedCount$31223[ebp]
	add	eax, 1
	mov	DWORD PTR _nBreakedCount$31223[ebp], eax
; Line 605
	jmp	SHORT $L31240
$L31236:
	mov	ecx, DWORD PTR _recid$31233[ebp]
	cmp	ecx, DWORD PTR $SG31243
	jne	SHORT $L31242
	mov	edx, DWORD PTR _recid$31233[ebp+4]
	cmp	edx, DWORD PTR $SG31243+4
	jne	SHORT $L31242
; Line 609
	mov	eax, DWORD PTR _pBuffer$31231[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _pBuffer$31231[ebp]
	call	DWORD PTR [edx+8]
	mov	DWORD PTR _nBytes$31244[ebp], eax
; Line 610
	cmp	DWORD PTR _nBytes$31244[ebp], 1024	; 00000400H
	jbe	SHORT $L31246
; Line 611
	mov	DWORD PTR _nBytes$31244[ebp], 1024	; 00000400H
$L31246:
; Line 612
	mov	eax, DWORD PTR _nBytes$31244[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1284]
	push	edx
	mov	eax, DWORD PTR _pBuffer$31231[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _pBuffer$31231[ebp]
	call	DWORD PTR [edx+4]
$L31242:
$L31240:
$L31232:
; Line 615
	mov	eax, DWORD PTR _pBuffer$31231[ebp]
	mov	DWORD PTR $T31627[ebp], eax
	mov	ecx, DWORD PTR $T31627[ebp]
	mov	DWORD PTR $T31626[ebp], ecx
	cmp	DWORD PTR $T31626[ebp], 0
	je	SHORT $L31628
	push	1
	mov	edx, DWORD PTR $T31626[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR $T31626[ebp]
	call	DWORD PTR [eax]
	mov	DWORD PTR -64+[ebp], eax
	jmp	SHORT $L31629
$L31628:
	mov	DWORD PTR -64+[ebp], 0
$L31629:
; Line 616
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Unlock@ERIAnimation@@QAEXXZ		; ERIAnimation::Unlock
; Line 618
	mov	ecx, DWORD PTR _nBreakedCount$31223[ebp]
	cmp	ecx, DWORD PTR _nBreakCount$[ebp]
	jl	SHORT $L31250
; Line 620
	jmp	SHORT $L31226
$L31250:
; Line 622
	jmp	$L31225
$L31226:
$L31222:
; Line 627
	mov	DWORD PTR _nSkippedCount$[ebp], 0
; Line 628
	mov	edx, DWORD PTR _nSkipFrame$[ebp]
	add	edx, 1
	mov	DWORD PTR _nSkipFrame$[ebp], edx
$L31253:
; Line 631
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DecodeNextFrame@ERIAnimation@@IAE_NXZ	; ERIAnimation::DecodeNextFrame
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31255
; Line 633
	xor	al, al
	jmp	SHORT $L31213
$L31255:
; Line 635
	mov	eax, DWORD PTR _nSkippedCount$[ebp]
	add	eax, 1
	mov	DWORD PTR _nSkippedCount$[ebp], eax
	mov	ecx, DWORD PTR _nSkippedCount$[ebp]
	cmp	ecx, DWORD PTR _nSkipFrame$[ebp]
	jl	SHORT $L31256
; Line 637
	jmp	SHORT $L31254
$L31256:
; Line 639
	jmp	SHORT $L31253
$L31254:
; Line 641
	mov	al, 1
$L31213:
; Line 642
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?SeekToNextFrame@ERIAnimation@@QAE_NH@Z ENDP		; ERIAnimation::SeekToNextFrame
_TEXT	ENDS
PUBLIC	?SeekToFrame@ERIAnimation@@QAE_NI@Z		; ERIAnimation::SeekToFrame
_TEXT	SEGMENT
_iFrameIndex$ = 8
_this$ = -24
_nKeyFrame$31262 = -20
_iKeyFrame$ = -4
_hEventList$ = -12
_dwWaitResult$ = -16
?SeekToFrame@ERIAnimation@@QAE_NI@Z PROC NEAR		; ERIAnimation::SeekToFrame
; Line 648
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 652
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1276]
	cmp	ecx, DWORD PTR _iFrameIndex$[ebp]
	jne	SHORT $L31260
; Line 654
	mov	al, 1
	jmp	$L31259
$L31260:
; Line 656
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1276]
	cmp	eax, DWORD PTR _iFrameIndex$[ebp]
	ja	SHORT $L31261
; Line 658
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetKeyFrameCount@ERIAnimation@@QBEIXZ	; ERIAnimation::GetKeyFrameCount
	mov	DWORD PTR _nKeyFrame$31262[ebp], eax
; Line 659
	cmp	DWORD PTR _nKeyFrame$31262[ebp], 0
	jne	SHORT $L31263
; Line 661
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _iFrameIndex$[ebp]
	sub	edx, DWORD PTR [ecx+1276]
	sub	edx, 1
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SeekToNextFrame@ERIAnimation@@QAE_NH@Z	; ERIAnimation::SeekToNextFrame
	jmp	$L31259
$L31263:
; Line 663
	mov	eax, DWORD PTR _iFrameIndex$[ebp]
	xor	edx, edx
	div	DWORD PTR _nKeyFrame$31262[ebp]
	mov	ecx, eax
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1276]
	xor	edx, edx
	div	DWORD PTR _nKeyFrame$31262[ebp]
	cmp	ecx, eax
	jne	SHORT $L31264
; Line 665
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _iFrameIndex$[ebp]
	sub	ecx, DWORD PTR [eax+1276]
	sub	ecx, 1
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SeekToNextFrame@ERIAnimation@@QAE_NH@Z	; ERIAnimation::SeekToNextFrame
	jmp	$L31259
$L31264:
$L31261:
; Line 671
	mov	edx, DWORD PTR _this$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+6]
	test	eax, eax
	je	SHORT $L31265
; Line 673
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+40]
; Line 674
	mov	eax, DWORD PTR _this$[ebp]
	mov	BYTE PTR [eax+6], 0
$L31265:
; Line 679
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+1292], 0
	jne	SHORT $L31266
; Line 681
	xor	al, al
	jmp	$L31259
$L31266:
; Line 683
	mov	DWORD PTR _iKeyFrame$[ebp], 0
; Line 684
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetKeyFrameCount@ERIAnimation@@QBEIXZ	; ERIAnimation::GetKeyFrameCount
	test	eax, eax
	jbe	SHORT $L31268
; Line 686
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetKeyFrameCount@ERIAnimation@@QBEIXZ	; ERIAnimation::GetKeyFrameCount
	mov	ecx, eax
	mov	eax, DWORD PTR _iFrameIndex$[ebp]
	xor	edx, edx
	div	ecx
	mov	DWORD PTR _iKeyFrame$[ebp], eax
; Line 687
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetKeyFrameCount@ERIAnimation@@QBEIXZ	; ERIAnimation::GetKeyFrameCount
	mov	edx, DWORD PTR _iKeyFrame$[ebp]
	imul	edx, eax
	mov	DWORD PTR _iKeyFrame$[ebp], edx
$L31268:
; Line 690
	push	0
	push	0
	push	1
	push	0
	call	DWORD PTR __imp__CreateEventA@16
	mov	DWORD PTR _hEventList$[ebp], eax
; Line 691
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1292]
	mov	DWORD PTR _hEventList$[ebp+4], ecx
; Line 694
	mov	edx, DWORD PTR _hEventList$[ebp]
	push	edx
	mov	eax, DWORD PTR _iKeyFrame$[ebp]
	push	eax
	push	1024					; 00000400H
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1296]
	push	edx
	call	DWORD PTR __imp__PostThreadMessageA@16
; Line 696
	push	-1
	push	0
	lea	eax, DWORD PTR _hEventList$[ebp]
	push	eax
	push	2
	call	DWORD PTR __imp__WaitForMultipleObjects@16
	mov	DWORD PTR _dwWaitResult$[ebp], eax
; Line 697
	mov	ecx, DWORD PTR _hEventList$[ebp]
	push	ecx
	call	DWORD PTR __imp__CloseHandle@4
; Line 698
	cmp	DWORD PTR _dwWaitResult$[ebp], 0
	je	SHORT $L31274
; Line 700
	xor	al, al
	jmp	SHORT $L31259
$L31274:
; Line 705
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SeekToNextFrame@ERIAnimation@@QAE_NH@Z	; ERIAnimation::SeekToNextFrame
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31275
; Line 707
	xor	al, al
	jmp	SHORT $L31259
$L31275:
; Line 712
	mov	edx, DWORD PTR _iFrameIndex$[ebp]
	cmp	edx, DWORD PTR _iKeyFrame$[ebp]
	jbe	SHORT $L31276
; Line 714
	mov	eax, DWORD PTR _iFrameIndex$[ebp]
	sub	eax, DWORD PTR _iKeyFrame$[ebp]
	sub	eax, 1
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SeekToNextFrame@ERIAnimation@@QAE_NH@Z	; ERIAnimation::SeekToNextFrame
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31277
; Line 716
	xor	al, al
	jmp	SHORT $L31259
$L31277:
$L31276:
; Line 720
	mov	al, 1
$L31259:
; Line 721
	mov	esp, ebp
	pop	ebp
	ret	4
?SeekToFrame@ERIAnimation@@QAE_NI@Z ENDP		; ERIAnimation::SeekToFrame
_TEXT	ENDS
PUBLIC	?IsKeyFrame@ERIAnimation@@QAE_NI@Z		; ERIAnimation::IsKeyFrame
_TEXT	SEGMENT
_iFrameIndex$ = 8
_this$ = -4
?IsKeyFrame@ERIAnimation@@QAE_NI@Z PROC NEAR		; ERIAnimation::IsKeyFrame
; Line 727
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 728
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+32], 1
	jne	SHORT $L31281
; Line 729
	mov	al, 1
	jmp	SHORT $L31280
$L31281:
; Line 730
	cmp	DWORD PTR _iFrameIndex$[ebp], 0
	jne	SHORT $L31282
; Line 731
	mov	al, 1
	jmp	SHORT $L31280
$L31282:
; Line 732
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+32], 0
	jne	SHORT $L31283
; Line 733
	xor	al, al
	jmp	SHORT $L31280
$L31283:
; Line 735
	mov	ecx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _iFrameIndex$[ebp]
	xor	edx, edx
	div	DWORD PTR [ecx+32]
	mov	eax, edx
	neg	eax
	sbb	eax, eax
	inc	eax
$L31280:
; Line 736
	mov	esp, ebp
	pop	ebp
	ret	4
?IsKeyFrame@ERIAnimation@@QAE_NI@Z ENDP			; ERIAnimation::IsKeyFrame
_TEXT	ENDS
EXTRN	?AttachFileObject@EFileDecodeContext@@QAEXPAVEFileObject@@@Z:NEAR ; EFileDecodeContext::AttachFileObject
EXTRN	_eriAdditionOfFrame:NEAR
_DATA	SEGMENT
	ORG $+3
$SG31304 DB	'ImageFrm', 00H
	ORG $+3
$SG31305 DB	'DiffeFrm', 00H
	ORG $+3
$SG31308 DB	'ImageFrm', 00H
	ORG $+3
$SG31317 DB	'Palette ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -56
_fResult$ = -4
_hEventList$31292 = -20
_dwWaitResult$31293 = -24
_fDecodedFrame$31296 = -12
_pBuffer$31297 = -8
_recid$31299 = -32
_fKeyFrame$31306 = -40
_prii$31309 = -36
_nBytes$31318 = -44
$T31633 = -48
$T31634 = -52
?DecodeNextFrame@ERIAnimation@@IAE_NXZ PROC NEAR	; ERIAnimation::DecodeNextFrame
; Line 742
	push	ebp
	mov	ebp, esp
	sub	esp, 64					; 00000040H
	mov	DWORD PTR _this$[ebp], ecx
; Line 743
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1292], 0
	jne	SHORT $L31287
; Line 745
	xor	al, al
	jmp	$L31286
$L31287:
; Line 748
	mov	BYTE PTR _fResult$[ebp], 0
$L31290:
; Line 756
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1312]
	mov	DWORD PTR _hEventList$31292[ebp], edx
; Line 757
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1292]
	mov	DWORD PTR _hEventList$31292[ebp+4], ecx
; Line 759
	push	-1
	push	0
	lea	edx, DWORD PTR _hEventList$31292[ebp]
	push	edx
	push	2
	call	DWORD PTR __imp__WaitForMultipleObjects@16
	mov	DWORD PTR _dwWaitResult$31293[ebp], eax
; Line 760
	cmp	DWORD PTR _dwWaitResult$31293[ebp], 0
	je	SHORT $L31295
; Line 762
	xor	al, al
	jmp	$L31286
$L31295:
; Line 767
	mov	BYTE PTR _fDecodedFrame$31296[ebp], 0
; Line 768
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Lock@ERIAnimation@@QAEXXZ		; ERIAnimation::Lock
; Line 769
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetPreloadBuffer@ERIAnimation@@IAEPAVEPreloadBuffer@1@XZ ; ERIAnimation::GetPreloadBuffer
	mov	DWORD PTR _pBuffer$31297[ebp], eax
; Line 770
	cmp	DWORD PTR _pBuffer$31297[ebp], 0
	je	$L31298
; Line 772
	mov	eax, DWORD PTR _pBuffer$31297[ebp]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR _recid$31299[ebp], ecx
	mov	edx, DWORD PTR [eax+28]
	mov	DWORD PTR _recid$31299[ebp+4], edx
; Line 774
	mov	eax, DWORD PTR _recid$31299[ebp]
	cmp	eax, DWORD PTR $SG31304
	jne	SHORT $L31637
	mov	ecx, DWORD PTR _recid$31299[ebp+4]
	cmp	ecx, DWORD PTR $SG31304+4
	je	SHORT $L31303
$L31637:
	mov	edx, DWORD PTR _recid$31299[ebp]
	cmp	edx, DWORD PTR $SG31305
	jne	$L31302
	mov	eax, DWORD PTR _recid$31299[ebp+4]
	cmp	eax, DWORD PTR $SG31305+4
	jne	$L31302
$L31303:
; Line 778
	mov	ecx, DWORD PTR _recid$31299[ebp]
	cmp	ecx, DWORD PTR $SG31308
	jne	SHORT $L31631
	mov	edx, DWORD PTR _recid$31299[ebp+4]
	cmp	edx, DWORD PTR $SG31308+4
	jne	SHORT $L31631
	mov	DWORD PTR -60+[ebp], 1
	jmp	SHORT $L31632
$L31631:
	mov	DWORD PTR -60+[ebp], 0
$L31632:
	mov	al, BYTE PTR -60+[ebp]
	mov	BYTE PTR _fKeyFrame$31306[ebp], al
; Line 780
	mov	ecx, DWORD PTR _fKeyFrame$31306[ebp]
	and	ecx, 255				; 000000ffH
	test	ecx, ecx
	je	SHORT $L31310
; Line 782
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1280]
	mov	DWORD PTR _prii$31309[ebp], eax
; Line 784
	jmp	SHORT $L31311
$L31310:
; Line 786
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1288]
	mov	DWORD PTR _prii$31309[ebp], edx
$L31311:
; Line 789
	push	0
	mov	eax, DWORD PTR _pBuffer$31297[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _pBuffer$31297[ebp]
	call	DWORD PTR [edx+16]
; Line 790
	mov	eax, DWORD PTR _pBuffer$31297[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+1260]
	call	?AttachFileObject@EFileDecodeContext@@QAEXPAVEFileObject@@@Z ; EFileDecodeContext::AttachFileObject
; Line 791
	mov	edx, DWORD PTR _this$[ebp]
	mov	al, BYTE PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1260]
	push	edx
	mov	eax, DWORD PTR _prii$31309[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+1264]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1264]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+12]
	test	eax, eax
	jne	SHORT $L31312
; Line 793
	mov	BYTE PTR _fResult$[ebp], 1
$L31312:
; Line 797
	mov	eax, DWORD PTR _fKeyFrame$31306[ebp]
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31313
; Line 799
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1288]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1280]
	push	ecx
	call	_eriAdditionOfFrame
	add	esp, 8
$L31313:
; Line 802
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _pBuffer$31297[ebp]
	mov	ecx, DWORD PTR [eax+20]
	mov	DWORD PTR [edx+1276], ecx
; Line 803
	mov	BYTE PTR _fDecodedFrame$31296[ebp], 1
; Line 805
	jmp	SHORT $L31314
$L31302:
	mov	edx, DWORD PTR _recid$31299[ebp]
	cmp	edx, DWORD PTR $SG31317
	jne	SHORT $L31316
	mov	eax, DWORD PTR _recid$31299[ebp+4]
	cmp	eax, DWORD PTR $SG31317+4
	jne	SHORT $L31316
; Line 809
	mov	ecx, DWORD PTR _pBuffer$31297[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _pBuffer$31297[ebp]
	call	DWORD PTR [edx+8]
	mov	DWORD PTR _nBytes$31318[ebp], eax
; Line 810
	cmp	DWORD PTR _nBytes$31318[ebp], 1024	; 00000400H
	jbe	SHORT $L31320
; Line 811
	mov	DWORD PTR _nBytes$31318[ebp], 1024	; 00000400H
$L31320:
; Line 812
	mov	eax, DWORD PTR _nBytes$31318[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1284]
	push	edx
	mov	eax, DWORD PTR _pBuffer$31297[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _pBuffer$31297[ebp]
	call	DWORD PTR [edx+4]
$L31316:
$L31314:
$L31298:
; Line 815
	mov	eax, DWORD PTR _pBuffer$31297[ebp]
	mov	DWORD PTR $T31634[ebp], eax
	mov	ecx, DWORD PTR $T31634[ebp]
	mov	DWORD PTR $T31633[ebp], ecx
	cmp	DWORD PTR $T31633[ebp], 0
	je	SHORT $L31635
	push	1
	mov	edx, DWORD PTR $T31633[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR $T31633[ebp]
	call	DWORD PTR [eax]
	mov	DWORD PTR -64+[ebp], eax
	jmp	SHORT $L31636
$L31635:
	mov	DWORD PTR -64+[ebp], 0
$L31636:
; Line 816
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Unlock@ERIAnimation@@QAEXXZ		; ERIAnimation::Unlock
; Line 818
	mov	ecx, DWORD PTR _fDecodedFrame$31296[ebp]
	and	ecx, 255				; 000000ffH
	test	ecx, ecx
	je	SHORT $L31324
; Line 820
	jmp	SHORT $L31291
$L31324:
; Line 822
	jmp	$L31290
$L31291:
; Line 824
	mov	al, BYTE PTR _fResult$[ebp]
$L31286:
; Line 825
	mov	esp, ebp
	pop	ebp
	ret	0
?DecodeNextFrame@ERIAnimation@@IAE_NXZ ENDP		; ERIAnimation::DecodeNextFrame
_TEXT	ENDS
EXTRN	__imp__SetEvent@4:NEAR
EXTRN	__imp__ResetEvent@4:NEAR
_TEXT	SEGMENT
_this$ = -12
_pBuffer$ = -4
_i$31330 = -8
?GetPreloadBuffer@ERIAnimation@@IAEPAVEPreloadBuffer@1@XZ PROC NEAR ; ERIAnimation::GetPreloadBuffer
; Line 831
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 832
	mov	DWORD PTR _pBuffer$[ebp], 0
; Line 833
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Lock@ERIAnimation@@QAEXXZ		; ERIAnimation::Lock
; Line 834
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1304], 0
	je	$L31329
; Line 836
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1300]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _pBuffer$[ebp], eax
; Line 837
	mov	DWORD PTR _i$31330[ebp], 1
	jmp	SHORT $L31331
$L31332:
	mov	ecx, DWORD PTR _i$31330[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$31330[ebp], ecx
$L31331:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$31330[ebp]
	cmp	eax, DWORD PTR [edx+1304]
	jae	SHORT $L31333
; Line 839
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1300]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1300]
	mov	eax, DWORD PTR _i$31330[ebp]
	mov	esi, DWORD PTR _i$31330[ebp]
	mov	edx, DWORD PTR [edx+esi*4]
	mov	DWORD PTR [ecx+eax*4-4], edx
; Line 840
	jmp	SHORT $L31332
$L31333:
; Line 841
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1304]
	sub	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+1304], ecx
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1304], 0
	jne	SHORT $L31334
; Line 843
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1312]
	push	edx
	call	DWORD PTR __imp__ResetEvent@4
$L31334:
; Line 845
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+1304]
	cmp	edx, DWORD PTR [ecx+1308]
	jae	SHORT $L31335
; Line 847
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1316]
	push	ecx
	call	DWORD PTR __imp__SetEvent@4
$L31335:
$L31329:
; Line 850
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Unlock@ERIAnimation@@QAEXXZ		; ERIAnimation::Unlock
; Line 851
	mov	eax, DWORD PTR _pBuffer$[ebp]
; Line 852
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
?GetPreloadBuffer@ERIAnimation@@IAEPAVEPreloadBuffer@1@XZ ENDP ; ERIAnimation::GetPreloadBuffer
_TEXT	ENDS
PUBLIC	?AddPreloadBuffer@ERIAnimation@@IAEXPAVEPreloadBuffer@1@@Z ; ERIAnimation::AddPreloadBuffer
_TEXT	SEGMENT
_pBuffer$ = 8
_this$ = -4
?AddPreloadBuffer@ERIAnimation@@IAEXPAVEPreloadBuffer@1@@Z PROC NEAR ; ERIAnimation::AddPreloadBuffer
; Line 858
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 859
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Lock@ERIAnimation@@QAEXXZ		; ERIAnimation::Lock
; Line 860
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+1304]
	cmp	edx, DWORD PTR [ecx+1308]
	jae	SHORT $L31339
; Line 862
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1304]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1300]
	mov	edx, DWORD PTR _pBuffer$[ebp]
	mov	DWORD PTR [eax+ecx*4], edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1304]
	add	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+1304], ecx
; Line 863
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1304], 0
	je	SHORT $L31340
; Line 865
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1312]
	push	edx
	call	DWORD PTR __imp__SetEvent@4
$L31340:
; Line 867
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+1304]
	cmp	edx, DWORD PTR [ecx+1308]
	jb	SHORT $L31341
; Line 869
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1316]
	push	ecx
	call	DWORD PTR __imp__ResetEvent@4
$L31341:
$L31339:
; Line 872
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Unlock@ERIAnimation@@QAEXXZ		; ERIAnimation::Unlock
; Line 873
	mov	esp, ebp
	pop	ebp
	ret	4
?AddPreloadBuffer@ERIAnimation@@IAEXPAVEPreloadBuffer@1@@Z ENDP ; ERIAnimation::AddPreloadBuffer
_TEXT	ENDS
PUBLIC	?GetERIFile@ERIAnimation@@QBEABVERIFile@@XZ	; ERIAnimation::GetERIFile
_TEXT	SEGMENT
_this$ = -4
?GetERIFile@ERIAnimation@@QBEABVERIFile@@XZ PROC NEAR	; ERIAnimation::GetERIFile
; Line 879
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 880
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 8
; Line 881
	mov	esp, ebp
	pop	ebp
	ret	0
?GetERIFile@ERIAnimation@@QBEABVERIFile@@XZ ENDP	; ERIAnimation::GetERIFile
_TEXT	ENDS
PUBLIC	?CurrentIndex@ERIAnimation@@QBEIXZ		; ERIAnimation::CurrentIndex
_TEXT	SEGMENT
_this$ = -4
?CurrentIndex@ERIAnimation@@QBEIXZ PROC NEAR		; ERIAnimation::CurrentIndex
; Line 887
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 888
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+1276]
; Line 889
	mov	esp, ebp
	pop	ebp
	ret	0
?CurrentIndex@ERIAnimation@@QBEIXZ ENDP			; ERIAnimation::CurrentIndex
_TEXT	ENDS
PUBLIC	?GetImageInfo@ERIAnimation@@QBEPBURASTER_IMAGE_INFO@@XZ ; ERIAnimation::GetImageInfo
_TEXT	SEGMENT
_this$ = -4
?GetImageInfo@ERIAnimation@@QBEPBURASTER_IMAGE_INFO@@XZ PROC NEAR ; ERIAnimation::GetImageInfo
; Line 895
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 896
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+1280]
; Line 897
	mov	esp, ebp
	pop	ebp
	ret	0
?GetImageInfo@ERIAnimation@@QBEPBURASTER_IMAGE_INFO@@XZ ENDP ; ERIAnimation::GetImageInfo
_TEXT	ENDS
PUBLIC	?GetPaletteEntries@ERIAnimation@@QBEPBTENTIS_PALETTE@@XZ ; ERIAnimation::GetPaletteEntries
_TEXT	SEGMENT
_this$ = -4
?GetPaletteEntries@ERIAnimation@@QBEPBTENTIS_PALETTE@@XZ PROC NEAR ; ERIAnimation::GetPaletteEntries
; Line 903
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 904
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+1284]
; Line 905
	mov	esp, ebp
	pop	ebp
	ret	0
?GetPaletteEntries@ERIAnimation@@QBEPBTENTIS_PALETTE@@XZ ENDP ; ERIAnimation::GetPaletteEntries
_this$ = -4
?GetKeyFrameCount@ERIAnimation@@QBEIXZ PROC NEAR	; ERIAnimation::GetKeyFrameCount
; Line 911
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 912
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+32]
; Line 913
	mov	esp, ebp
	pop	ebp
	ret	0
?GetKeyFrameCount@ERIAnimation@@QBEIXZ ENDP		; ERIAnimation::GetKeyFrameCount
_TEXT	ENDS
PUBLIC	?GetAllFrameCount@ERIAnimation@@QBEIXZ		; ERIAnimation::GetAllFrameCount
_TEXT	SEGMENT
_this$ = -4
?GetAllFrameCount@ERIAnimation@@QBEIXZ PROC NEAR	; ERIAnimation::GetAllFrameCount
; Line 919
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 920
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+36]
; Line 921
	mov	esp, ebp
	pop	ebp
	ret	0
?GetAllFrameCount@ERIAnimation@@QBEIXZ ENDP		; ERIAnimation::GetAllFrameCount
_TEXT	ENDS
PUBLIC	?GetTotalTime@ERIAnimation@@QBEIXZ		; ERIAnimation::GetTotalTime
_TEXT	SEGMENT
_this$ = -4
?GetTotalTime@ERIAnimation@@QBEIXZ PROC NEAR		; ERIAnimation::GetTotalTime
; Line 927
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 928
	mov	eax, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [eax+40]
; Line 929
	mov	esp, ebp
	pop	ebp
	ret	0
?GetTotalTime@ERIAnimation@@QBEIXZ ENDP			; ERIAnimation::GetTotalTime
_TEXT	ENDS
PUBLIC	?FrameIndexToTime@ERIAnimation@@QBEII@Z		; ERIAnimation::FrameIndexToTime
EXTRN	__imp__MulDiv@12:NEAR
_TEXT	SEGMENT
_iFrameIndex$ = 8
_this$ = -4
?FrameIndexToTime@ERIAnimation@@QBEII@Z PROC NEAR	; ERIAnimation::FrameIndexToTime
; Line 935
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 936
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+36], 0
	jne	SHORT $L31366
; Line 937
	xor	eax, eax
	jmp	SHORT $L31365
$L31366:
; Line 941
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+36]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	push	ecx
	mov	edx, DWORD PTR _iFrameIndex$[ebp]
	push	edx
	call	DWORD PTR __imp__MulDiv@12
$L31365:
; Line 942
	mov	esp, ebp
	pop	ebp
	ret	4
?FrameIndexToTime@ERIAnimation@@QBEII@Z ENDP		; ERIAnimation::FrameIndexToTime
_TEXT	ENDS
PUBLIC	?TimeToFrameIndex@ERIAnimation@@QBEII@Z		; ERIAnimation::TimeToFrameIndex
_TEXT	SEGMENT
_nMilliSec$ = 8
_this$ = -4
?TimeToFrameIndex@ERIAnimation@@QBEII@Z PROC NEAR	; ERIAnimation::TimeToFrameIndex
; Line 948
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 949
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+40], 0
	jne	SHORT $L31370
; Line 950
	xor	eax, eax
	jmp	SHORT $L31369
$L31370:
; Line 954
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+40]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+36]
	push	ecx
	mov	edx, DWORD PTR _nMilliSec$[ebp]
	push	edx
	call	DWORD PTR __imp__MulDiv@12
$L31369:
; Line 955
	mov	esp, ebp
	pop	ebp
	ret	4
?TimeToFrameIndex@ERIAnimation@@QBEII@Z ENDP		; ERIAnimation::TimeToFrameIndex
_TEXT	ENDS
PUBLIC	?LoadingThreadProc@ERIAnimation@@IAEKXZ		; ERIAnimation::LoadingThreadProc
_TEXT	SEGMENT
_parameter$ = 8
?ThreadProc@ERIAnimation@@KGKPAX@Z PROC NEAR		; ERIAnimation::ThreadProc
; Line 961
	push	ebp
	mov	ebp, esp
; Line 962
	mov	ecx, DWORD PTR _parameter$[ebp]
	call	?LoadingThreadProc@ERIAnimation@@IAEKXZ	; ERIAnimation::LoadingThreadProc
; Line 963
	pop	ebp
	ret	4
?ThreadProc@ERIAnimation@@KGKPAX@Z ENDP			; ERIAnimation::ThreadProc
_TEXT	ENDS
PUBLIC	?AddKeyPoint@ERIAnimation@@IAEXAAVEKeyPointList@1@UKEY_POINT@1@@Z ; ERIAnimation::AddKeyPoint
PUBLIC	?SearchKeyPoint@ERIAnimation@@IAEPAUKEY_POINT@1@AAVEKeyPointList@1@I@Z ; ERIAnimation::SearchKeyPoint
PUBLIC	?SeekKeyPoint@ERIAnimation@@IAEXAAVEKeyPointList@1@IAAI@Z ; ERIAnimation::SeekKeyPoint
PUBLIC	?SeekKeyWave@ERIAnimation@@IAEXAAVEKeyPointList@1@I@Z ; ERIAnimation::SeekKeyWave
EXTRN	__imp__PeekMessageA@20:NEAR
EXTRN	__imp__MsgWaitForMultipleObjects@20:NEAR
EXTRN	?DescendRecord@ERIFile@@QAE_NPB_K@Z:NEAR	; ERIFile::DescendRecord
EXTRN	?AscendRecord@ERIFile@@QAEXXZ:NEAR		; ERIFile::AscendRecord
EXTRN	?GetRecordID@ERIFile@@QBE_KXZ:NEAR		; ERIFile::GetRecordID
_DATA	SEGMENT
	ORG $+3
$SG31392 DB	'ImageFrm', 00H
	ORG $+3
$SG31393 DB	'DiffeFrm', 00H
	ORG $+3
$SG31403 DB	'Palette ', 00H
	ORG $+3
$SG31410 DB	'SoundStm', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -124
_msg$ = -40
_iCurrentFrame$ = -12
_keypoint$ = -8
_dwRecPosition$31383 = -56
_recid$31386 = -52
_pBuffer$31387 = -44
_dwDataBytes$31394 = -64
_pKeyPoint$31398 = -68
_dwDataBytes$31404 = -72
_miodh$31411 = -80
_pKeyPoint$31414 = -84
_dwBytes$31417 = -92
_ptrWaveBuf$31418 = -88
_fQuit$31423 = -60
_dwWaitResult$31427 = -96
$T31638 = -100
$T31641 = -104
$T31644 = -108
$T31645 = -112
$T31648 = -116
$T31649 = -120
?LoadingThreadProc@ERIAnimation@@IAEKXZ PROC NEAR	; ERIAnimation::LoadingThreadProc
; Line 966
	push	ebp
	mov	ebp, esp
	sub	esp, 140				; 0000008cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 971
	push	0
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _msg$[ebp]
	push	eax
	call	DWORD PTR __imp__PeekMessageA@20
; Line 975
	mov	DWORD PTR _iCurrentFrame$[ebp], 0
; Line 977
	mov	DWORD PTR _keypoint$[ebp], 0
; Line 978
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	call	DWORD PTR [eax+12]
	mov	DWORD PTR _keypoint$[ebp+4], eax
; Line 979
	mov	ecx, DWORD PTR _keypoint$[ebp+4]
	push	ecx
	mov	edx, DWORD PTR _keypoint$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 1320				; 00000528H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AddKeyPoint@ERIAnimation@@IAEXAAVEKeyPointList@1@UKEY_POINT@1@@Z ; ERIAnimation::AddKeyPoint
$L31381:
; Line 988
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	call	DWORD PTR [eax+12]
	mov	DWORD PTR _dwRecPosition$31383[ebp], eax
; Line 989
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?DescendRecord@ERIFile@@QAE_NPB_K@Z	; ERIFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31384
; Line 991
	cmp	DWORD PTR _iCurrentFrame$[ebp], 0
	jne	SHORT $L31385
; Line 994
	jmp	$L31382
$L31385:
; Line 999
	mov	DWORD PTR _iCurrentFrame$[ebp], 0
; Line 1000
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	call	DWORD PTR [eax+16]
; Line 1001
	jmp	SHORT $L31381
$L31384:
; Line 1006
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?GetRecordID@ERIFile@@QBE_KXZ		; ERIFile::GetRecordID
	mov	DWORD PTR _recid$31386[ebp], eax
	mov	DWORD PTR _recid$31386[ebp+4], edx
; Line 1007
	mov	DWORD PTR _pBuffer$31387[ebp], 0
; Line 1009
	mov	ecx, DWORD PTR _recid$31386[ebp]
	cmp	ecx, DWORD PTR $SG31392
	jne	SHORT $L31652
	mov	edx, DWORD PTR _recid$31386[ebp+4]
	cmp	edx, DWORD PTR $SG31392+4
	je	SHORT $L31391
$L31652:
	mov	eax, DWORD PTR _recid$31386[ebp]
	cmp	eax, DWORD PTR $SG31393
	jne	$L31390
	mov	ecx, DWORD PTR _recid$31386[ebp+4]
	cmp	ecx, DWORD PTR $SG31393+4
	jne	$L31390
$L31391:
; Line 1014
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	call	DWORD PTR [eax+8]
	mov	DWORD PTR _dwDataBytes$31394[ebp], eax
; Line 1015
	push	32					; 00000020H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR $T31638[ebp], eax
	cmp	DWORD PTR $T31638[ebp], 0
	je	SHORT $L31639
	mov	ecx, DWORD PTR _dwDataBytes$31394[ebp]
	push	ecx
	mov	ecx, DWORD PTR $T31638[ebp]
	call	??0EPreloadBuffer@ERIAnimation@@QAE@K@Z	; ERIAnimation::EPreloadBuffer::EPreloadBuffer
	mov	DWORD PTR -128+[ebp], eax
	jmp	SHORT $L31640
$L31639:
	mov	DWORD PTR -128+[ebp], 0
$L31640:
	mov	edx, DWORD PTR -128+[ebp]
	mov	DWORD PTR _pBuffer$31387[ebp], edx
; Line 1016
	mov	eax, DWORD PTR _pBuffer$31387[ebp]
	mov	ecx, DWORD PTR _iCurrentFrame$[ebp]
	mov	DWORD PTR [eax+20], ecx
; Line 1017
	mov	edx, DWORD PTR _pBuffer$31387[ebp]
	mov	eax, DWORD PTR _recid$31386[ebp]
	mov	DWORD PTR [edx+24], eax
	mov	ecx, DWORD PTR _recid$31386[ebp+4]
	mov	DWORD PTR [edx+28], ecx
; Line 1018
	mov	edx, DWORD PTR _dwDataBytes$31394[ebp]
	push	edx
	mov	eax, DWORD PTR _pBuffer$31387[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	call	DWORD PTR [eax+4]
; Line 1020
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AscendRecord@ERIFile@@QAEXXZ		; ERIFile::AscendRecord
; Line 1022
	mov	ecx, DWORD PTR _iCurrentFrame$[ebp]
	add	ecx, 1
	mov	DWORD PTR _iCurrentFrame$[ebp], ecx
; Line 1023
	mov	edx, DWORD PTR _iCurrentFrame$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?IsKeyFrame@ERIAnimation@@QAE_NI@Z	; ERIAnimation::IsKeyFrame
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L31397
; Line 1026
	mov	eax, DWORD PTR _iCurrentFrame$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1320				; 00000528H
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchKeyPoint@ERIAnimation@@IAEPAUKEY_POINT@1@AAVEKeyPointList@1@I@Z ; ERIAnimation::SearchKeyPoint
	mov	DWORD PTR _pKeyPoint$31398[ebp], eax
; Line 1027
	cmp	DWORD PTR _pKeyPoint$31398[ebp], 0
	jne	SHORT $L31399
; Line 1029
	mov	edx, DWORD PTR _iCurrentFrame$[ebp]
	mov	DWORD PTR _keypoint$[ebp], edx
; Line 1030
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+8]
	call	DWORD PTR [edx+12]
	mov	DWORD PTR _keypoint$[ebp+4], eax
; Line 1031
	mov	eax, DWORD PTR _keypoint$[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _keypoint$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 1320				; 00000528H
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AddKeyPoint@ERIAnimation@@IAEXAAVEKeyPointList@1@UKEY_POINT@1@@Z ; ERIAnimation::AddKeyPoint
$L31399:
$L31397:
; Line 1035
	jmp	$L31400
$L31390:
	mov	eax, DWORD PTR _recid$31386[ebp]
	cmp	eax, DWORD PTR $SG31403
	jne	$L31402
	mov	ecx, DWORD PTR _recid$31386[ebp+4]
	cmp	ecx, DWORD PTR $SG31403+4
	jne	$L31402
; Line 1040
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	call	DWORD PTR [eax+8]
	mov	DWORD PTR _dwDataBytes$31404[ebp], eax
; Line 1041
	push	32					; 00000020H
	call	??2@YAPAXI@Z				; operator new
	add	esp, 4
	mov	DWORD PTR $T31641[ebp], eax
	cmp	DWORD PTR $T31641[ebp], 0
	je	SHORT $L31642
	mov	ecx, DWORD PTR _dwDataBytes$31404[ebp]
	push	ecx
	mov	ecx, DWORD PTR $T31641[ebp]
	call	??0EPreloadBuffer@ERIAnimation@@QAE@K@Z	; ERIAnimation::EPreloadBuffer::EPreloadBuffer
	mov	DWORD PTR -132+[ebp], eax
	jmp	SHORT $L31643
$L31642:
	mov	DWORD PTR -132+[ebp], 0
$L31643:
	mov	edx, DWORD PTR -132+[ebp]
	mov	DWORD PTR _pBuffer$31387[ebp], edx
; Line 1042
	mov	eax, DWORD PTR _pBuffer$31387[ebp]
	mov	ecx, DWORD PTR _iCurrentFrame$[ebp]
	mov	DWORD PTR [eax+20], ecx
; Line 1043
	mov	edx, DWORD PTR _pBuffer$31387[ebp]
	mov	eax, DWORD PTR _recid$31386[ebp]
	mov	DWORD PTR [edx+24], eax
	mov	ecx, DWORD PTR _recid$31386[ebp+4]
	mov	DWORD PTR [edx+28], ecx
; Line 1044
	mov	edx, DWORD PTR _dwDataBytes$31404[ebp]
	push	edx
	mov	eax, DWORD PTR _pBuffer$31387[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	call	DWORD PTR [eax+4]
; Line 1045
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AscendRecord@ERIFile@@QAEXXZ		; ERIFile::AscendRecord
; Line 1047
	jmp	$L31407
$L31402:
	mov	ecx, DWORD PTR _recid$31386[ebp]
	cmp	ecx, DWORD PTR $SG31410
	jne	$L31409
	mov	edx, DWORD PTR _recid$31386[ebp+4]
	cmp	edx, DWORD PTR $SG31410+4
	jne	$L31409
; Line 1053
	push	8
	lea	eax, DWORD PTR _miodh$31411[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	call	DWORD PTR [eax+4]
; Line 1054
	mov	ecx, DWORD PTR _miodh$31411[ebp+1]
	and	ecx, 255				; 000000ffH
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L31413
; Line 1057
	mov	edx, DWORD PTR _iCurrentFrame$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 1332				; 00000534H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchKeyPoint@ERIAnimation@@IAEPAUKEY_POINT@1@AAVEKeyPointList@1@I@Z ; ERIAnimation::SearchKeyPoint
	mov	DWORD PTR _pKeyPoint$31414[ebp], eax
; Line 1058
	cmp	DWORD PTR _pKeyPoint$31414[ebp], 0
	jne	SHORT $L31415
; Line 1060
	mov	ecx, DWORD PTR _iCurrentFrame$[ebp]
	mov	DWORD PTR _keypoint$[ebp], ecx
; Line 1061
	mov	edx, DWORD PTR _dwRecPosition$31383[ebp]
	mov	DWORD PTR _keypoint$[ebp+4], edx
; Line 1062
	mov	eax, DWORD PTR _keypoint$[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _keypoint$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 1332				; 00000534H
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AddKeyPoint@ERIAnimation@@IAEXAAVEKeyPointList@1@UKEY_POINT@1@@Z ; ERIAnimation::AddKeyPoint
$L31415:
$L31413:
; Line 1066
	mov	eax, DWORD PTR _this$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+6]
	test	ecx, ecx
	je	$L31416
	mov	edx, DWORD PTR _this$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+5]
	test	eax, eax
	je	$L31416
; Line 1074
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _miodh$31411[ebp+4]
	imul	edx, DWORD PTR [ecx+192]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+216]
	shr	ecx, 3
	imul	edx, ecx
	mov	DWORD PTR _dwBytes$31417[ebp], edx
; Line 1075
	mov	edx, DWORD PTR _dwBytes$31417[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+28]
	mov	DWORD PTR _ptrWaveBuf$31418[ebp], eax
; Line 1076
	cmp	DWORD PTR _ptrWaveBuf$31418[ebp], 0
	je	SHORT $L31419
; Line 1078
	mov	eax, DWORD PTR _ptrWaveBuf$31418[ebp]
	push	eax
	lea	ecx, DWORD PTR _miodh$31411[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1268]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+1272]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1272]
	mov	edx, DWORD PTR [eax]
	call	DWORD PTR [edx+12]
	test	eax, eax
	jne	SHORT $L31420
; Line 1080
	mov	eax, DWORD PTR _dwBytes$31417[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrWaveBuf$31418[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [eax+24]
; Line 1082
	jmp	SHORT $L31421
$L31420:
; Line 1084
	mov	ecx, DWORD PTR _ptrWaveBuf$31418[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [eax+32]
$L31421:
$L31419:
$L31416:
; Line 1089
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AscendRecord@ERIFile@@QAEXXZ		; ERIFile::AscendRecord
; Line 1091
	jmp	SHORT $L31422
$L31409:
; Line 1096
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AscendRecord@ERIFile@@QAEXXZ		; ERIFile::AscendRecord
$L31422:
$L31407:
$L31400:
; Line 1101
	mov	BYTE PTR _fQuit$31423[ebp], 0
$L31424:
; Line 1108
	push	255					; 000000ffH
	push	-1
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1316				; 00000524H
	push	ecx
	push	1
	call	DWORD PTR __imp__MsgWaitForMultipleObjects@20
	mov	DWORD PTR _dwWaitResult$31427[ebp], eax
; Line 1109
	cmp	DWORD PTR _pBuffer$31387[ebp], 0
	je	SHORT $L31429
	cmp	DWORD PTR _dwWaitResult$31427[ebp], 0
	jne	SHORT $L31429
; Line 1111
	mov	edx, DWORD PTR _pBuffer$31387[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AddPreloadBuffer@ERIAnimation@@IAEXPAVEPreloadBuffer@1@@Z ; ERIAnimation::AddPreloadBuffer
; Line 1112
	mov	DWORD PTR _pBuffer$31387[ebp], 0
$L31429:
; Line 1115
	push	1
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _msg$[ebp]
	push	eax
	call	DWORD PTR __imp__PeekMessageA@20
	test	eax, eax
	je	$L31430
; Line 1117
	cmp	DWORD PTR _msg$[ebp+4], 1024		; 00000400H
	jne	SHORT $L31431
; Line 1122
	cmp	DWORD PTR _pBuffer$31387[ebp], 0
	je	SHORT $L31432
; Line 1124
	mov	ecx, DWORD PTR _dwRecPosition$31383[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	call	DWORD PTR [eax+16]
; Line 1125
	mov	ecx, DWORD PTR _pBuffer$31387[ebp]
	mov	DWORD PTR $T31645[ebp], ecx
	mov	edx, DWORD PTR $T31645[ebp]
	mov	DWORD PTR $T31644[ebp], edx
	cmp	DWORD PTR $T31644[ebp], 0
	je	SHORT $L31646
	push	1
	mov	eax, DWORD PTR $T31644[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR $T31644[ebp]
	call	DWORD PTR [edx]
	mov	DWORD PTR -136+[ebp], eax
	jmp	SHORT $L31647
$L31646:
	mov	DWORD PTR -136+[ebp], 0
$L31647:
; Line 1126
	mov	DWORD PTR _pBuffer$31387[ebp], 0
$L31432:
; Line 1129
	lea	eax, DWORD PTR _iCurrentFrame$[ebp]
	push	eax
	mov	ecx, DWORD PTR _msg$[ebp+8]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 1320				; 00000528H
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SeekKeyPoint@ERIAnimation@@IAEXAAVEKeyPointList@1@IAAI@Z ; ERIAnimation::SeekKeyPoint
; Line 1131
	mov	eax, DWORD PTR _msg$[ebp+12]
	push	eax
	call	DWORD PTR __imp__SetEvent@4
; Line 1133
	jmp	SHORT $L31436
$L31431:
	cmp	DWORD PTR _msg$[ebp+4], 1025		; 00000401H
	jne	SHORT $L31437
; Line 1138
	mov	ecx, DWORD PTR _msg$[ebp+8]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 1332				; 00000534H
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SeekKeyWave@ERIAnimation@@IAEXAAVEKeyPointList@1@I@Z ; ERIAnimation::SeekKeyWave
; Line 1140
	mov	eax, DWORD PTR _msg$[ebp+12]
	push	eax
	call	DWORD PTR __imp__SetEvent@4
; Line 1142
	jmp	SHORT $L31439
$L31437:
	cmp	DWORD PTR _msg$[ebp+4], 1026		; 00000402H
	jne	SHORT $L31440
; Line 1147
	mov	BYTE PTR _fQuit$31423[ebp], 1
; Line 1148
	jmp	SHORT $L31426
$L31440:
$L31439:
$L31436:
$L31430:
; Line 1152
	cmp	DWORD PTR _pBuffer$31387[ebp], 0
	jne	$L31424
$L31426:
; Line 1154
	mov	ecx, DWORD PTR _fQuit$31423[ebp]
	and	ecx, 255				; 000000ffH
	test	ecx, ecx
	je	SHORT $L31441
; Line 1156
	mov	edx, DWORD PTR _pBuffer$31387[ebp]
	mov	DWORD PTR $T31649[ebp], edx
	mov	eax, DWORD PTR $T31649[ebp]
	mov	DWORD PTR $T31648[ebp], eax
	cmp	DWORD PTR $T31648[ebp], 0
	je	SHORT $L31650
	push	1
	mov	ecx, DWORD PTR $T31648[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR $T31648[ebp]
	call	DWORD PTR [edx]
	mov	DWORD PTR -140+[ebp], eax
	jmp	SHORT $L31651
$L31650:
	mov	DWORD PTR -140+[ebp], 0
$L31651:
; Line 1157
	jmp	SHORT $L31382
$L31441:
; Line 1159
	jmp	$L31381
$L31382:
; Line 1161
	xor	eax, eax
; Line 1162
	mov	esp, ebp
	pop	ebp
	ret	0
?LoadingThreadProc@ERIAnimation@@IAEKXZ ENDP		; ERIAnimation::LoadingThreadProc
_list$ = 8
_key$ = 12
_this$ = -4
?AddKeyPoint@ERIAnimation@@IAEXAAVEKeyPointList@1@UKEY_POINT@1@@Z PROC NEAR ; ERIAnimation::AddKeyPoint
; Line 1169
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1170
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Lock@ERIAnimation@@QAEXXZ		; ERIAnimation::Lock
; Line 1171
	mov	eax, DWORD PTR _list$[ebp]
	mov	ecx, DWORD PTR _list$[ebp]
	mov	edx, DWORD PTR [eax+4]
	cmp	edx, DWORD PTR [ecx+8]
	jae	SHORT $L31448
; Line 1173
	mov	eax, DWORD PTR _list$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	edx, DWORD PTR _list$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	edx, DWORD PTR _key$[ebp]
	mov	DWORD PTR [eax+ecx*8], edx
	mov	edx, DWORD PTR _key$[ebp+4]
	mov	DWORD PTR [eax+ecx*8+4], edx
	mov	eax, DWORD PTR _list$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	add	ecx, 1
	mov	edx, DWORD PTR _list$[ebp]
	mov	DWORD PTR [edx+4], ecx
$L31448:
; Line 1175
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Unlock@ERIAnimation@@QAEXXZ		; ERIAnimation::Unlock
; Line 1176
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AddKeyPoint@ERIAnimation@@IAEXAAVEKeyPointList@1@UKEY_POINT@1@@Z ENDP ; ERIAnimation::AddKeyPoint
_list$ = 8
_iKeyFrame$ = 12
_this$ = -20
_iFirst$ = -4
_iMiddle$ = -16
_iEnd$ = -12
_pFoundKey$ = -8
?SearchKeyPoint@ERIAnimation@@IAEPAUKEY_POINT@1@AAVEKeyPointList@1@I@Z PROC NEAR ; ERIAnimation::SearchKeyPoint
; Line 1183
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1187
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Lock@ERIAnimation@@QAEXXZ		; ERIAnimation::Lock
; Line 1189
	mov	DWORD PTR _iFirst$[ebp], 0
; Line 1190
	mov	eax, DWORD PTR _list$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	sub	ecx, 1
	mov	DWORD PTR _iEnd$[ebp], ecx
$L31458:
; Line 1194
	mov	edx, DWORD PTR _iFirst$[ebp]
	cmp	edx, DWORD PTR _iEnd$[ebp]
	jle	SHORT $L31460
; Line 1196
	mov	DWORD PTR _pFoundKey$[ebp], 0
; Line 1197
	jmp	SHORT $L31459
$L31460:
; Line 1200
	mov	eax, DWORD PTR _iFirst$[ebp]
	add	eax, DWORD PTR _iEnd$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	DWORD PTR _iMiddle$[ebp], eax
; Line 1201
	mov	eax, DWORD PTR _list$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _iMiddle$[ebp]
	lea	eax, DWORD PTR [ecx+edx*8]
	mov	DWORD PTR _pFoundKey$[ebp], eax
; Line 1203
	mov	ecx, DWORD PTR _pFoundKey$[ebp]
	mov	edx, DWORD PTR [ecx]
	cmp	edx, DWORD PTR _iKeyFrame$[ebp]
	jne	SHORT $L31461
; Line 1205
	jmp	SHORT $L31459
$L31461:
; Line 1207
	mov	eax, DWORD PTR _pFoundKey$[ebp]
	mov	ecx, DWORD PTR [eax]
	cmp	ecx, DWORD PTR _iKeyFrame$[ebp]
	jbe	SHORT $L31462
; Line 1209
	mov	edx, DWORD PTR _iMiddle$[ebp]
	sub	edx, 1
	mov	DWORD PTR _iEnd$[ebp], edx
; Line 1211
	jmp	SHORT $L31463
$L31462:
; Line 1213
	mov	eax, DWORD PTR _iMiddle$[ebp]
	add	eax, 1
	mov	DWORD PTR _iFirst$[ebp], eax
$L31463:
; Line 1215
	jmp	SHORT $L31458
$L31459:
; Line 1217
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Unlock@ERIAnimation@@QAEXXZ		; ERIAnimation::Unlock
; Line 1219
	mov	eax, DWORD PTR _pFoundKey$[ebp]
; Line 1220
	mov	esp, ebp
	pop	ebp
	ret	8
?SearchKeyPoint@ERIAnimation@@IAEPAUKEY_POINT@1@AAVEKeyPointList@1@I@Z ENDP ; ERIAnimation::SearchKeyPoint
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG31493 DB	'ImageFrm', 00H
	ORG $+3
$SG31494 DB	'DiffeFrm', 00H
	ORG $+3
$SG31503 DB	'SoundStm', 00H
_DATA	ENDS
_TEXT	SEGMENT
_iFrame$ = 12
_iCurrentFrame$ = 16
_this$ = -68
_fHaveSeeked$ = -4
_pBuffer$31475 = -8
_pKeyPoint$31480 = -12
_dwRecPosition$31486 = -24
_recid$31488 = -20
_pKeyPoint$31496 = -28
_keypoint$31498 = -36
_miodh$31504 = -44
_pKeyPoint$31507 = -48
_keypoint$31509 = -56
$T31653 = -60
$T31654 = -64
?SeekKeyPoint@ERIAnimation@@IAEXAAVEKeyPointList@1@IAAI@Z PROC NEAR ; ERIAnimation::SeekKeyPoint
; Line 1228
	push	ebp
	mov	ebp, esp
	sub	esp, 72					; 00000048H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1229
	mov	eax, DWORD PTR _iFrame$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?IsKeyFrame@ERIAnimation@@QAE_NI@Z	; ERIAnimation::IsKeyFrame
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31469
; Line 1230
	jmp	$L31468
$L31469:
; Line 1234
	mov	BYTE PTR _fHaveSeeked$[ebp], 0
; Line 1235
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Lock@ERIAnimation@@QAEXXZ		; ERIAnimation::Lock
$L31472:
; Line 1238
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+1304], 0
	jne	SHORT $L31474
; Line 1240
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+1312]
	push	eax
	call	DWORD PTR __imp__ResetEvent@4
; Line 1241
	jmp	SHORT $L31473
$L31474:
; Line 1243
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1300]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _pBuffer$31475[ebp], eax
; Line 1245
	cmp	DWORD PTR _pBuffer$31475[ebp], 0
	je	SHORT $L31476
	mov	ecx, DWORD PTR _pBuffer$31475[ebp]
	mov	edx, DWORD PTR [ecx+20]
	cmp	edx, DWORD PTR _iFrame$[ebp]
	jne	SHORT $L31476
; Line 1247
	mov	BYTE PTR _fHaveSeeked$[ebp], 1
; Line 1248
	jmp	SHORT $L31473
$L31476:
; Line 1250
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetPreloadBuffer@ERIAnimation@@IAEPAVEPreloadBuffer@1@XZ ; ERIAnimation::GetPreloadBuffer
	mov	DWORD PTR $T31654[ebp], eax
	mov	eax, DWORD PTR $T31654[ebp]
	mov	DWORD PTR $T31653[ebp], eax
	cmp	DWORD PTR $T31653[ebp], 0
	je	SHORT $L31655
	push	1
	mov	ecx, DWORD PTR $T31653[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR $T31653[ebp]
	call	DWORD PTR [edx]
	mov	DWORD PTR -72+[ebp], eax
	jmp	SHORT $L31656
$L31655:
	mov	DWORD PTR -72+[ebp], 0
$L31656:
; Line 1251
	jmp	SHORT $L31472
$L31473:
; Line 1252
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Unlock@ERIAnimation@@QAEXXZ		; ERIAnimation::Unlock
; Line 1254
	mov	eax, DWORD PTR _fHaveSeeked$[ebp]
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	$L31479
; Line 1260
	mov	ecx, DWORD PTR _iFrame$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 1320				; 00000528H
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchKeyPoint@ERIAnimation@@IAEPAUKEY_POINT@1@AAVEKeyPointList@1@I@Z ; ERIAnimation::SearchKeyPoint
	mov	DWORD PTR _pKeyPoint$31480[ebp], eax
; Line 1262
	cmp	DWORD PTR _pKeyPoint$31480[ebp], 0
	je	SHORT $L31481
; Line 1267
	mov	eax, DWORD PTR _pKeyPoint$31480[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	call	DWORD PTR [eax+16]
; Line 1268
	mov	ecx, DWORD PTR _iCurrentFrame$[ebp]
	mov	edx, DWORD PTR _iFrame$[ebp]
	mov	DWORD PTR [ecx], edx
; Line 1270
	jmp	$L31482
$L31481:
$L31483:
; Line 1280
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+8]
	call	DWORD PTR [edx+12]
	mov	DWORD PTR _dwRecPosition$31486[ebp], eax
; Line 1281
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?DescendRecord@ERIFile@@QAE_NPB_K@Z	; ERIFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31487
; Line 1283
	mov	eax, DWORD PTR _iCurrentFrame$[ebp]
	mov	DWORD PTR [eax], 0
; Line 1284
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	call	DWORD PTR [eax+16]
; Line 1285
	jmp	$L31485
$L31487:
; Line 1290
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?GetRecordID@ERIFile@@QBE_KXZ		; ERIFile::GetRecordID
	mov	DWORD PTR _recid$31488[ebp], eax
	mov	DWORD PTR _recid$31488[ebp+4], edx
; Line 1292
	mov	ecx, DWORD PTR _recid$31488[ebp]
	cmp	ecx, DWORD PTR $SG31493
	jne	SHORT $L31657
	mov	edx, DWORD PTR _recid$31488[ebp+4]
	cmp	edx, DWORD PTR $SG31493+4
	je	SHORT $L31492
$L31657:
	mov	eax, DWORD PTR _recid$31488[ebp]
	cmp	eax, DWORD PTR $SG31494
	jne	$L31491
	mov	ecx, DWORD PTR _recid$31488[ebp+4]
	cmp	ecx, DWORD PTR $SG31494+4
	jne	$L31491
$L31492:
; Line 1297
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AscendRecord@ERIFile@@QAEXXZ		; ERIFile::AscendRecord
; Line 1298
	mov	edx, DWORD PTR _iCurrentFrame$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, 1
	mov	ecx, DWORD PTR _iCurrentFrame$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1299
	mov	edx, DWORD PTR _iCurrentFrame$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?IsKeyFrame@ERIAnimation@@QAE_NI@Z	; ERIAnimation::IsKeyFrame
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L31495
; Line 1302
	mov	ecx, DWORD PTR _iCurrentFrame$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 1320				; 00000528H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchKeyPoint@ERIAnimation@@IAEPAUKEY_POINT@1@AAVEKeyPointList@1@I@Z ; ERIAnimation::SearchKeyPoint
	mov	DWORD PTR _pKeyPoint$31496[ebp], eax
; Line 1303
	cmp	DWORD PTR _pKeyPoint$31496[ebp], 0
	jne	SHORT $L31497
; Line 1306
	mov	ecx, DWORD PTR _iCurrentFrame$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _keypoint$31498[ebp], edx
; Line 1307
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+8]
	call	DWORD PTR [edx+12]
	mov	DWORD PTR _keypoint$31498[ebp+4], eax
; Line 1308
	mov	eax, DWORD PTR _keypoint$31498[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _keypoint$31498[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 1320				; 00000528H
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AddKeyPoint@ERIAnimation@@IAEXAAVEKeyPointList@1@UKEY_POINT@1@@Z ; ERIAnimation::AddKeyPoint
$L31497:
$L31495:
; Line 1311
	mov	eax, DWORD PTR _iCurrentFrame$[ebp]
	mov	ecx, DWORD PTR [eax]
	cmp	ecx, DWORD PTR _iFrame$[ebp]
	jne	SHORT $L31499
; Line 1313
	mov	BYTE PTR _fHaveSeeked$[ebp], 1
$L31499:
; Line 1316
	jmp	$L31500
$L31491:
	mov	edx, DWORD PTR _recid$31488[ebp]
	cmp	edx, DWORD PTR $SG31503
	jne	$L31502
	mov	eax, DWORD PTR _recid$31488[ebp+4]
	cmp	eax, DWORD PTR $SG31503+4
	jne	SHORT $L31502
; Line 1322
	push	8
	lea	ecx, DWORD PTR _miodh$31504[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	call	DWORD PTR [eax+4]
; Line 1323
	mov	ecx, DWORD PTR _miodh$31504[ebp+1]
	and	ecx, 255				; 000000ffH
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L31506
; Line 1326
	mov	edx, DWORD PTR _iCurrentFrame$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1332				; 00000534H
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchKeyPoint@ERIAnimation@@IAEPAUKEY_POINT@1@AAVEKeyPointList@1@I@Z ; ERIAnimation::SearchKeyPoint
	mov	DWORD PTR _pKeyPoint$31507[ebp], eax
; Line 1327
	cmp	DWORD PTR _pKeyPoint$31507[ebp], 0
	jne	SHORT $L31508
; Line 1330
	mov	edx, DWORD PTR _iCurrentFrame$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _keypoint$31509[ebp], eax
; Line 1331
	mov	ecx, DWORD PTR _dwRecPosition$31486[ebp]
	mov	DWORD PTR _keypoint$31509[ebp+4], ecx
; Line 1332
	mov	edx, DWORD PTR _keypoint$31509[ebp+4]
	push	edx
	mov	eax, DWORD PTR _keypoint$31509[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 1332				; 00000534H
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AddKeyPoint@ERIAnimation@@IAEXAAVEKeyPointList@1@UKEY_POINT@1@@Z ; ERIAnimation::AddKeyPoint
$L31508:
$L31506:
; Line 1335
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AscendRecord@ERIFile@@QAEXXZ		; ERIFile::AscendRecord
; Line 1337
	jmp	SHORT $L31510
$L31502:
; Line 1339
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AscendRecord@ERIFile@@QAEXXZ		; ERIFile::AscendRecord
$L31510:
$L31500:
; Line 1342
	mov	edx, DWORD PTR _fHaveSeeked$[ebp]
	and	edx, 255				; 000000ffH
	test	edx, edx
	je	$L31483
$L31485:
$L31482:
$L31479:
$L31468:
; Line 1345
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?SeekKeyPoint@ERIAnimation@@IAEXAAVEKeyPointList@1@IAAI@Z ENDP ; ERIAnimation::SeekKeyPoint
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG31540 DB	'ImageFrm', 00H
	ORG $+3
$SG31541 DB	'DiffeFrm', 00H
	ORG $+3
$SG31549 DB	'SoundStm', 00H
_DATA	ENDS
_TEXT	SEGMENT
_list$ = 8
_iFrame$ = 12
_this$ = -80
_iFirst$ = -4
_iMiddle$ = -20
_iEnd$ = -16
_pKeyPoint$ = -24
_dwOriginalPointer$ = -12
_iCurrentFrame$ = -8
_dwRecPosition$31533 = -36
_recid$31535 = -32
_pKeyPoint$31543 = -40
_keypoint$31545 = -48
_miodh$31550 = -60
_pKeyPoint$31553 = -68
_keypoint$31555 = -76
_dwBytes$31556 = -64
_ptrWaveBuf$31557 = -52
?SeekKeyWave@ERIAnimation@@IAEXAAVEKeyPointList@1@I@Z PROC NEAR ; ERIAnimation::SeekKeyWave
; Line 1352
	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1353
	mov	eax, DWORD PTR _this$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+5]
	test	ecx, ecx
	je	SHORT $L31516
	mov	edx, DWORD PTR _this$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+6]
	test	eax, eax
	jne	SHORT $L31515
$L31516:
; Line 1355
	jmp	$L31514
$L31515:
; Line 1362
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Lock@ERIAnimation@@QAEXXZ		; ERIAnimation::Lock
; Line 1363
	mov	DWORD PTR _iFirst$[ebp], 0
; Line 1364
	mov	ecx, DWORD PTR _list$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	sub	edx, 1
	mov	DWORD PTR _iEnd$[ebp], edx
$L31522:
; Line 1367
	mov	eax, DWORD PTR _iFirst$[ebp]
	cmp	eax, DWORD PTR _iEnd$[ebp]
	jle	SHORT $L31524
; Line 1369
	mov	ecx, DWORD PTR _list$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _iEnd$[ebp]
	lea	ecx, DWORD PTR [edx+eax*8]
	mov	DWORD PTR _pKeyPoint$[ebp], ecx
; Line 1370
	jmp	SHORT $L31523
$L31524:
; Line 1373
	mov	eax, DWORD PTR _iFirst$[ebp]
	add	eax, DWORD PTR _iEnd$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	DWORD PTR _iMiddle$[ebp], eax
; Line 1374
	mov	edx, DWORD PTR _list$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _iMiddle$[ebp]
	lea	edx, DWORD PTR [eax+ecx*8]
	mov	DWORD PTR _pKeyPoint$[ebp], edx
; Line 1376
	mov	eax, DWORD PTR _pKeyPoint$[ebp]
	mov	ecx, DWORD PTR [eax]
	cmp	ecx, DWORD PTR _iFrame$[ebp]
	jne	SHORT $L31525
; Line 1378
	jmp	SHORT $L31523
$L31525:
; Line 1380
	mov	edx, DWORD PTR _pKeyPoint$[ebp]
	mov	eax, DWORD PTR [edx]
	cmp	eax, DWORD PTR _iFrame$[ebp]
	jbe	SHORT $L31526
; Line 1382
	mov	ecx, DWORD PTR _iMiddle$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _iEnd$[ebp], ecx
; Line 1384
	jmp	SHORT $L31527
$L31526:
; Line 1386
	mov	edx, DWORD PTR _iMiddle$[ebp]
	add	edx, 1
	mov	DWORD PTR _iFirst$[ebp], edx
$L31527:
; Line 1388
	jmp	SHORT $L31522
$L31523:
; Line 1389
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Unlock@ERIAnimation@@QAEXXZ		; ERIAnimation::Unlock
; Line 1393
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+8]
	call	DWORD PTR [edx+12]
	mov	DWORD PTR _dwOriginalPointer$[ebp], eax
; Line 1394
	mov	eax, DWORD PTR _pKeyPoint$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _iCurrentFrame$[ebp], ecx
; Line 1395
	mov	edx, DWORD PTR _pKeyPoint$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	call	DWORD PTR [eax+16]
$L31530:
; Line 1404
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	call	DWORD PTR [eax+12]
	mov	DWORD PTR _dwRecPosition$31533[ebp], eax
; Line 1405
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?DescendRecord@ERIFile@@QAE_NPB_K@Z	; ERIFile::DescendRecord
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L31534
; Line 1407
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	call	DWORD PTR [eax+16]
; Line 1408
	jmp	$L31532
$L31534:
; Line 1413
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?GetRecordID@ERIFile@@QBE_KXZ		; ERIFile::GetRecordID
	mov	DWORD PTR _recid$31535[ebp], eax
	mov	DWORD PTR _recid$31535[ebp+4], edx
; Line 1415
	mov	ecx, DWORD PTR _recid$31535[ebp]
	cmp	ecx, DWORD PTR $SG31540
	jne	SHORT $L31658
	mov	edx, DWORD PTR _recid$31535[ebp+4]
	cmp	edx, DWORD PTR $SG31540+4
	je	SHORT $L31539
$L31658:
	mov	eax, DWORD PTR _recid$31535[ebp]
	cmp	eax, DWORD PTR $SG31541
	jne	$L31538
	mov	ecx, DWORD PTR _recid$31535[ebp+4]
	cmp	ecx, DWORD PTR $SG31541+4
	jne	SHORT $L31538
$L31539:
; Line 1420
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AscendRecord@ERIFile@@QAEXXZ		; ERIFile::AscendRecord
; Line 1421
	mov	edx, DWORD PTR _iCurrentFrame$[ebp]
	add	edx, 1
	mov	DWORD PTR _iCurrentFrame$[ebp], edx
; Line 1422
	mov	eax, DWORD PTR _iCurrentFrame$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?IsKeyFrame@ERIAnimation@@QAE_NI@Z	; ERIAnimation::IsKeyFrame
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L31542
; Line 1425
	mov	ecx, DWORD PTR _iCurrentFrame$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 1320				; 00000528H
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchKeyPoint@ERIAnimation@@IAEPAUKEY_POINT@1@AAVEKeyPointList@1@I@Z ; ERIAnimation::SearchKeyPoint
	mov	DWORD PTR _pKeyPoint$31543[ebp], eax
; Line 1426
	cmp	DWORD PTR _pKeyPoint$31543[ebp], 0
	jne	SHORT $L31544
; Line 1429
	mov	eax, DWORD PTR _iCurrentFrame$[ebp]
	mov	DWORD PTR _keypoint$31545[ebp], eax
; Line 1430
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	call	DWORD PTR [eax+12]
	mov	DWORD PTR _keypoint$31545[ebp+4], eax
; Line 1431
	mov	ecx, DWORD PTR _keypoint$31545[ebp+4]
	push	ecx
	mov	edx, DWORD PTR _keypoint$31545[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 1320				; 00000528H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AddKeyPoint@ERIAnimation@@IAEXAAVEKeyPointList@1@UKEY_POINT@1@@Z ; ERIAnimation::AddKeyPoint
$L31544:
$L31542:
; Line 1435
	jmp	$L31546
$L31538:
	mov	ecx, DWORD PTR _recid$31535[ebp]
	cmp	ecx, DWORD PTR $SG31549
	jne	$L31548
	mov	edx, DWORD PTR _recid$31535[ebp+4]
	cmp	edx, DWORD PTR $SG31549+4
	jne	$L31548
; Line 1441
	push	8
	lea	eax, DWORD PTR _miodh$31550[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+8]
	call	DWORD PTR [eax+4]
; Line 1442
	mov	ecx, DWORD PTR _miodh$31550[ebp+1]
	and	ecx, 255				; 000000ffH
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L31552
; Line 1445
	mov	edx, DWORD PTR _iCurrentFrame$[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 1332				; 00000534H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchKeyPoint@ERIAnimation@@IAEPAUKEY_POINT@1@AAVEKeyPointList@1@I@Z ; ERIAnimation::SearchKeyPoint
	mov	DWORD PTR _pKeyPoint$31553[ebp], eax
; Line 1446
	cmp	DWORD PTR _pKeyPoint$31553[ebp], 0
	jne	SHORT $L31554
; Line 1449
	mov	ecx, DWORD PTR _iCurrentFrame$[ebp]
	mov	DWORD PTR _keypoint$31555[ebp], ecx
; Line 1450
	mov	edx, DWORD PTR _dwRecPosition$31533[ebp]
	mov	DWORD PTR _keypoint$31555[ebp+4], edx
; Line 1451
	mov	eax, DWORD PTR _keypoint$31555[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _keypoint$31555[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	add	edx, 1332				; 00000534H
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AddKeyPoint@ERIAnimation@@IAEXAAVEKeyPointList@1@UKEY_POINT@1@@Z ; ERIAnimation::AddKeyPoint
$L31554:
$L31552:
; Line 1460
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _miodh$31550[ebp+4]
	imul	ecx, DWORD PTR [eax+192]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+216]
	shr	eax, 3
	imul	ecx, eax
	mov	DWORD PTR _dwBytes$31556[ebp], ecx
; Line 1461
	mov	ecx, DWORD PTR _dwBytes$31556[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [eax+28]
	mov	DWORD PTR _ptrWaveBuf$31557[ebp], eax
; Line 1462
	cmp	DWORD PTR _ptrWaveBuf$31557[ebp], 0
	je	SHORT $L31558
; Line 1464
	mov	ecx, DWORD PTR _ptrWaveBuf$31557[ebp]
	push	ecx
	lea	edx, DWORD PTR _miodh$31550[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+1268]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+1272]
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+1272]
	mov	eax, DWORD PTR [edx]
	call	DWORD PTR [eax+12]
	test	eax, eax
	jne	SHORT $L31559
; Line 1466
	mov	ecx, DWORD PTR _iCurrentFrame$[ebp]
	cmp	ecx, DWORD PTR _iFrame$[ebp]
	jb	SHORT $L31560
; Line 1468
	mov	edx, DWORD PTR _dwBytes$31556[ebp]
	push	edx
	mov	eax, DWORD PTR _ptrWaveBuf$31557[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+24]
; Line 1470
	jmp	SHORT $L31561
$L31560:
; Line 1472
	mov	eax, DWORD PTR _ptrWaveBuf$31557[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+32]
$L31561:
; Line 1475
	jmp	SHORT $L31562
$L31559:
; Line 1477
	mov	eax, DWORD PTR _ptrWaveBuf$31557[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+32]
$L31562:
$L31558:
; Line 1481
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AscendRecord@ERIFile@@QAEXXZ		; ERIFile::AscendRecord
; Line 1483
	jmp	SHORT $L31563
$L31548:
; Line 1485
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AscendRecord@ERIFile@@QAEXXZ		; ERIFile::AscendRecord
$L31563:
$L31546:
; Line 1488
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+8]
	call	DWORD PTR [edx+12]
	cmp	eax, DWORD PTR _dwOriginalPointer$[ebp]
	jb	$L31530
$L31532:
$L31514:
; Line 1489
	mov	esp, ebp
	pop	ebp
	ret	8
?SeekKeyWave@ERIAnimation@@IAEXAAVEKeyPointList@1@I@Z ENDP ; ERIAnimation::SeekKeyWave
_TEXT	ENDS
EXTRN	__imp__EnterCriticalSection@4:NEAR
_TEXT	SEGMENT
_this$ = -4
?Lock@ERIAnimation@@QAEXXZ PROC NEAR			; ERIAnimation::Lock
; Line 1495
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1496
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 1344				; 00000540H
	push	eax
	call	DWORD PTR __imp__EnterCriticalSection@4
; Line 1497
	mov	esp, ebp
	pop	ebp
	ret	0
?Lock@ERIAnimation@@QAEXXZ ENDP				; ERIAnimation::Lock
_TEXT	ENDS
EXTRN	__imp__LeaveCriticalSection@4:NEAR
_TEXT	SEGMENT
_this$ = -4
?Unlock@ERIAnimation@@QAEXXZ PROC NEAR			; ERIAnimation::Unlock
; Line 1500
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1501
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 1344				; 00000540H
	push	eax
	call	DWORD PTR __imp__LeaveCriticalSection@4
; Line 1502
	mov	esp, ebp
	pop	ebp
	ret	0
?Unlock@ERIAnimation@@QAEXXZ ENDP			; ERIAnimation::Unlock
_TEXT	ENDS
END
