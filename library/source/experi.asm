	TITLE	I:\EntisGLS\eri-chan\experi\experi.cpp
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
;	COMDAT ?Initialize@MTF_TABLE@RLHDecodeContext@@QAEXXZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ?DecodeSymbols@RLHDecodeContext@@QAEKPAHK@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_GRLHDecodeContext@@UAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_GERIDecoder@@UAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_GEFileDecodeContext@@UAEPAXI@Z
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??_7RLHDecodeContext@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
;	COMDAT ??_7EFileDecodeContext@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
;	COMDAT ??_7ERIDecoder@@6B@
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	?m_pfnColorOperation@ERIDecoder@@1PAP81@AEXXZA	; ERIDecoder::m_pfnColorOperation
PUBLIC	?m_opcCodeTable@ERIDecoder@@1PBUOPERATION_CODE_II@1@B ; ERIDecoder::m_opcCodeTable
EXTRN	?ColorOperation0000@ERIDecoder@@IAEXXZ:NEAR	; ERIDecoder::ColorOperation0000
EXTRN	?ColorOperation0101@ERIDecoder@@IAEXXZ:NEAR	; ERIDecoder::ColorOperation0101
EXTRN	?ColorOperation0110@ERIDecoder@@IAEXXZ:NEAR	; ERIDecoder::ColorOperation0110
EXTRN	?ColorOperation0111@ERIDecoder@@IAEXXZ:NEAR	; ERIDecoder::ColorOperation0111
EXTRN	?ColorOperation1001@ERIDecoder@@IAEXXZ:NEAR	; ERIDecoder::ColorOperation1001
EXTRN	?ColorOperation1010@ERIDecoder@@IAEXXZ:NEAR	; ERIDecoder::ColorOperation1010
EXTRN	?ColorOperation1011@ERIDecoder@@IAEXXZ:NEAR	; ERIDecoder::ColorOperation1011
EXTRN	?ColorOperation1101@ERIDecoder@@IAEXXZ:NEAR	; ERIDecoder::ColorOperation1101
EXTRN	?ColorOperation1110@ERIDecoder@@IAEXXZ:NEAR	; ERIDecoder::ColorOperation1110
EXTRN	?ColorOperation1111@ERIDecoder@@IAEXXZ:NEAR	; ERIDecoder::ColorOperation1111
_DATA	SEGMENT
?m_pfnColorOperation@ERIDecoder@@1PAP81@AEXXZA DD FLAT:?ColorOperation0000@ERIDecoder@@IAEXXZ ; ERIDecoder::m_pfnColorOperation
	DD	FLAT:?ColorOperation0000@ERIDecoder@@IAEXXZ
	DD	FLAT:?ColorOperation0000@ERIDecoder@@IAEXXZ
	DD	FLAT:?ColorOperation0000@ERIDecoder@@IAEXXZ
	DD	FLAT:?ColorOperation0000@ERIDecoder@@IAEXXZ
	DD	FLAT:?ColorOperation0101@ERIDecoder@@IAEXXZ
	DD	FLAT:?ColorOperation0110@ERIDecoder@@IAEXXZ
	DD	FLAT:?ColorOperation0111@ERIDecoder@@IAEXXZ
	DD	FLAT:?ColorOperation0000@ERIDecoder@@IAEXXZ
	DD	FLAT:?ColorOperation1001@ERIDecoder@@IAEXXZ
	DD	FLAT:?ColorOperation1010@ERIDecoder@@IAEXXZ
	DD	FLAT:?ColorOperation1011@ERIDecoder@@IAEXXZ
	DD	FLAT:?ColorOperation0000@ERIDecoder@@IAEXXZ
	DD	FLAT:?ColorOperation1101@ERIDecoder@@IAEXXZ
	DD	FLAT:?ColorOperation1110@ERIDecoder@@IAEXXZ
	DD	FLAT:?ColorOperation1111@ERIDecoder@@IAEXXZ
_DATA	ENDS
CONST	SEGMENT
?m_opcCodeTable@ERIDecoder@@1PBUOPERATION_CODE_II@1@B DD 00H ; ERIDecoder::m_opcCodeTable
	DD	00H
	DD	05H
	DD	00H
	DD	06H
	DD	00H
	DD	07H
	DD	00H
	DD	09H
	DD	00H
	DD	0aH
	DD	00H
	DD	0bH
	DD	00H
	DD	0dH
	DD	00H
	DD	0eH
	DD	00H
	DD	0fH
	DD	00H
	DD	00H
	DD	01H
	DD	05H
	DD	01H
	DD	06H
	DD	01H
	DD	07H
	DD	01H
	DD	09H
	DD	01H
	DD	0aH
	DD	01H
	DD	0bH
	DD	01H
	DD	0dH
	DD	01H
	DD	0eH
	DD	01H
	DD	0fH
	DD	01H
	DD	00H
	DD	02H
	DD	05H
	DD	02H
	DD	06H
	DD	02H
	DD	07H
	DD	02H
	DD	09H
	DD	02H
	DD	0aH
	DD	02H
	DD	0bH
	DD	02H
	DD	0dH
	DD	02H
	DD	0eH
	DD	02H
	DD	0fH
	DD	02H
	DD	00H
	DD	03H
	DD	05H
	DD	03H
	DD	06H
	DD	03H
	DD	07H
	DD	03H
	DD	09H
	DD	03H
	DD	0aH
	DD	03H
	DD	0bH
	DD	03H
	DD	0dH
	DD	03H
	DD	0eH
	DD	03H
	DD	0fH
	DD	03H
	DD	00H
	DD	04H
	DD	05H
	DD	04H
	DD	06H
	DD	04H
	DD	07H
	DD	04H
	DD	09H
	DD	04H
	DD	0aH
	DD	04H
	DD	0bH
	DD	04H
	DD	0dH
	DD	04H
	DD	0eH
	DD	04H
	DD	0fH
	DD	04H
	ORG $+112
CONST	ENDS
PUBLIC	_eriInitializeLibrary
EXTRN	_eriEnableMMX:NEAR
EXTRN	_eriInitializeFPU:NEAR
EXTRN	_eriInitializeMatrixDCT:NEAR
_TEXT	SEGMENT
_eriInitializeLibrary PROC NEAR
; File I:\EntisGLS\eri-chan\experi\experi.cpp
; Line 31
	push	ebp
	mov	ebp, esp
; Line 35
	push	0
	call	_eriEnableMMX
	add	esp, 4
; Line 38
	call	_eriInitializeFPU
; Line 42
	call	_eriInitializeMatrixDCT
; Line 43
	pop	ebp
	ret	0
_eriInitializeLibrary ENDP
_TEXT	ENDS
PUBLIC	_eriCloseLibrary
_TEXT	SEGMENT
_eriCloseLibrary PROC NEAR
; Line 49
	push	ebp
	mov	ebp, esp
; Line 50
	pop	ebp
	ret	0
_eriCloseLibrary ENDP
_TEXT	ENDS
PUBLIC	_eriInitializeTask
_TEXT	SEGMENT
_eriInitializeTask PROC NEAR
; Line 56
	push	ebp
	mov	ebp, esp
; Line 60
	call	_eriInitializeFPU
; Line 62
	pop	ebp
	ret	0
_eriInitializeTask ENDP
_TEXT	ENDS
PUBLIC	_eriCloseTask
_TEXT	SEGMENT
_eriCloseTask PROC NEAR
; Line 68
	push	ebp
	mov	ebp, esp
; Line 69
	pop	ebp
	ret	0
_eriCloseTask ENDP
_TEXT	ENDS
PUBLIC	_eriDrawImageToDC
EXTRN	__imp__StretchDIBits@52:NEAR
_TEXT	SEGMENT
_hDC$ = 8
_x$ = 12
_y$ = 16
_rii$ = 20
_ppalette$ = 24
_psize$ = 28
_ptrImageArray$ = -8
_nBytesPerLine$ = -16
_nImageWidth$ = -24
_nImageHeight$ = -12
_srcbmi$ = -1088
_nDstWidth$ = -20
_nDstHeight$ = -4
_eriDrawImageToDC PROC NEAR
; Line 79
	push	ebp
	mov	ebp, esp
	sub	esp, 1088				; 00000440H
	push	esi
	push	edi
; Line 82
	mov	eax, DWORD PTR _rii$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _ptrImageArray$[ebp], ecx
; Line 83
	mov	edx, DWORD PTR _rii$[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	DWORD PTR _nBytesPerLine$[ebp], eax
; Line 84
	mov	ecx, DWORD PTR _rii$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR _nImageWidth$[ebp], edx
; Line 85
	mov	eax, DWORD PTR _rii$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	mov	DWORD PTR _nImageHeight$[ebp], ecx
; Line 86
	cmp	DWORD PTR _ptrImageArray$[ebp], 0
	jne	SHORT $L31058
; Line 87
	jmp	$L31053
$L31058:
; Line 88
	cmp	DWORD PTR _nBytesPerLine$[ebp], 0
	jge	SHORT $L31059
; Line 90
	mov	edx, DWORD PTR _nImageHeight$[ebp]
	sub	edx, 1
	imul	edx, DWORD PTR _nBytesPerLine$[ebp]
	mov	eax, DWORD PTR _ptrImageArray$[ebp]
	add	eax, edx
	mov	DWORD PTR _ptrImageArray$[ebp], eax
; Line 91
	mov	ecx, DWORD PTR _nBytesPerLine$[ebp]
	neg	ecx
	mov	DWORD PTR _nBytesPerLine$[ebp], ecx
$L31059:
; Line 101
	mov	DWORD PTR _srcbmi$[ebp], 40		; 00000028H
; Line 102
	mov	edx, DWORD PTR _nImageWidth$[ebp]
	mov	DWORD PTR _srcbmi$[ebp+4], edx
; Line 103
	mov	eax, DWORD PTR _nImageHeight$[ebp]
	mov	DWORD PTR _srcbmi$[ebp+8], eax
; Line 104
	mov	WORD PTR _srcbmi$[ebp+12], 1
; Line 105
	mov	ecx, DWORD PTR _rii$[ebp]
	mov	dx, WORD PTR [ecx+16]
	mov	WORD PTR _srcbmi$[ebp+14], dx
; Line 106
	mov	DWORD PTR _srcbmi$[ebp+16], 0
; Line 107
	mov	eax, DWORD PTR _nBytesPerLine$[ebp]
	imul	eax, DWORD PTR _nImageHeight$[ebp]
	mov	DWORD PTR _srcbmi$[ebp+20], eax
; Line 108
	mov	DWORD PTR _srcbmi$[ebp+24], 0
; Line 109
	mov	DWORD PTR _srcbmi$[ebp+28], 0
; Line 110
	mov	DWORD PTR _srcbmi$[ebp+32], 0
; Line 111
	mov	DWORD PTR _srcbmi$[ebp+36], 0
; Line 113
	mov	ecx, DWORD PTR _rii$[ebp]
	cmp	DWORD PTR [ecx+16], 8
	ja	SHORT $L31070
	cmp	DWORD PTR _ppalette$[ebp], 0
	je	SHORT $L31070
; Line 116
	mov	edx, DWORD PTR _rii$[ebp]
	mov	eax, 4
	mov	ecx, DWORD PTR [edx+16]
	shl	eax, cl
	mov	ecx, eax
	mov	esi, DWORD PTR _ppalette$[ebp]
	lea	edi, DWORD PTR _srcbmi$[ebp+40]
	mov	edx, ecx
	shr	ecx, 2
	rep movsd
	mov	ecx, edx
	and	ecx, 3
	rep movsb
$L31070:
; Line 121
	cmp	DWORD PTR _psize$[ebp], 0
	je	SHORT $L31074
; Line 123
	mov	eax, DWORD PTR _psize$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _nDstWidth$[ebp], ecx
; Line 124
	mov	edx, DWORD PTR _psize$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR _nDstHeight$[ebp], eax
; Line 126
	jmp	SHORT $L31075
$L31074:
; Line 128
	mov	ecx, DWORD PTR _nImageWidth$[ebp]
	mov	DWORD PTR _nDstWidth$[ebp], ecx
; Line 129
	mov	edx, DWORD PTR _nImageHeight$[ebp]
	mov	DWORD PTR _nDstHeight$[ebp], edx
$L31075:
; Line 135
	push	13369376				; 00cc0020H
	push	0
	lea	eax, DWORD PTR _srcbmi$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrImageArray$[ebp]
	push	ecx
	mov	edx, DWORD PTR _nImageHeight$[ebp]
	push	edx
	mov	eax, DWORD PTR _nImageWidth$[ebp]
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _nDstHeight$[ebp]
	push	ecx
	mov	edx, DWORD PTR _nDstWidth$[ebp]
	push	edx
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	ecx, DWORD PTR _x$[ebp]
	push	ecx
	mov	edx, DWORD PTR _hDC$[ebp]
	push	edx
	call	DWORD PTR __imp__StretchDIBits@52
$L31053:
; Line 136
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_eriDrawImageToDC ENDP
_TEXT	ENDS
PUBLIC	?Initialize@ERINA_HUFFMAN_TREE@@QAEXXZ		; ERINA_HUFFMAN_TREE::Initialize
_TEXT	SEGMENT
_this$ = -8
_i$ = -4
?Initialize@ERINA_HUFFMAN_TREE@@QAEXXZ PROC NEAR	; ERINA_HUFFMAN_TREE::Initialize
; Line 147
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 149
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31082
$L31083:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31082:
	cmp	DWORD PTR _i$[ebp], 256			; 00000100H
	jge	SHORT $L31084
; Line 151
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+ecx*4+4104], 32768	; 00008000H
; Line 152
	jmp	SHORT $L31083
$L31084:
; Line 153
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+5128], 32768		; 00008000H
; Line 154
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+5132], 512		; 00000200H
; Line 155
	mov	edx, DWORD PTR _this$[ebp]
	mov	WORD PTR [edx+4096], 0
; Line 156
	mov	eax, DWORD PTR _this$[ebp]
	mov	WORD PTR [eax+4098], 32768		; 00008000H
; Line 157
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4100], 32768		; 00008000H
; Line 158
	mov	esp, ebp
	pop	ebp
	ret	0
?Initialize@ERINA_HUFFMAN_TREE@@QAEXXZ ENDP		; ERINA_HUFFMAN_TREE::Initialize
_TEXT	ENDS
PUBLIC	?RecountOccuredCount@ERINA_HUFFMAN_TREE@@QAEXH@Z ; ERINA_HUFFMAN_TREE::RecountOccuredCount
_TEXT	SEGMENT
_iParent$ = 8
_this$ = -8
_iChild$ = -4
?RecountOccuredCount@ERINA_HUFFMAN_TREE@@QAEXH@Z PROC NEAR ; ERINA_HUFFMAN_TREE::RecountOccuredCount
; Line 164
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 165
	mov	eax, DWORD PTR _iParent$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+eax*8+4]
	mov	DWORD PTR _iChild$[ebp], edx
; Line 168
	mov	eax, DWORD PTR _iChild$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx+eax*8]
	mov	eax, DWORD PTR _iChild$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	xor	esi, esi
	mov	si, WORD PTR [ecx+eax*8+8]
	add	edx, esi
	mov	eax, DWORD PTR _iParent$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	WORD PTR [ecx+eax*8], dx
; Line 169
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?RecountOccuredCount@ERINA_HUFFMAN_TREE@@QAEXH@Z ENDP	; ERINA_HUFFMAN_TREE::RecountOccuredCount
_TEXT	ENDS
PUBLIC	?AddNewEntry@ERINA_HUFFMAN_TREE@@QAEXH@Z	; ERINA_HUFFMAN_TREE::AddNewEntry
EXTRN	?Normalize@ERINA_HUFFMAN_TREE@@QAEXH@Z:NEAR	; ERINA_HUFFMAN_TREE::Normalize
_TEXT	SEGMENT
_nNewCode$ = 8
_this$ = -40
_i$31093 = -4
_phnNew$31094 = -8
_phnRoot$31095 = -12
_phnParent$31097 = -20
_phnChild$31098 = -16
_nCode$31100 = -24
_phnEscape$31104 = -28
_i$31106 = -36
_phnEntry$31107 = -32
?AddNewEntry@ERINA_HUFFMAN_TREE@@QAEXH@Z PROC NEAR	; ERINA_HUFFMAN_TREE::AddNewEntry
; Line 175
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 176
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+5132], 0
	jle	$L31092
; Line 180
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+5132]
	sub	edx, 2
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+5132], edx
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+5132]
	mov	DWORD PTR _i$31093[ebp], edx
; Line 183
	mov	eax, DWORD PTR _i$31093[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	lea	edx, DWORD PTR [ecx+eax*8]
	mov	DWORD PTR _phnNew$31094[ebp], edx
; Line 184
	mov	eax, DWORD PTR _phnNew$31094[ebp]
	mov	WORD PTR [eax], 1
; Line 185
	mov	ecx, DWORD PTR _nNewCode$[ebp]
	or	ecx, -2147483648			; 80000000H
	mov	edx, DWORD PTR _phnNew$31094[ebp]
	mov	DWORD PTR [edx+4], ecx
; Line 186
	mov	eax, DWORD PTR _nNewCode$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$31093[ebp]
	mov	DWORD PTR [ecx+eax*4+4104], edx
; Line 188
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 4096				; 00001000H
	mov	DWORD PTR _phnRoot$31095[ebp], eax
; Line 189
	mov	ecx, DWORD PTR _phnRoot$31095[ebp]
	cmp	DWORD PTR [ecx+4], 32768		; 00008000H
	je	$L31096
; Line 193
	mov	edx, DWORD PTR _i$31093[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	lea	ecx, DWORD PTR [eax+edx*8+16]
	mov	DWORD PTR _phnParent$31097[ebp], ecx
; Line 194
	mov	edx, DWORD PTR _i$31093[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	lea	ecx, DWORD PTR [eax+edx*8+8]
	mov	DWORD PTR _phnChild$31098[ebp], ecx
; Line 195
	mov	edx, DWORD PTR _i$31093[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+edx*8+16]
	mov	edx, DWORD PTR [eax+edx*8+20]
	mov	eax, DWORD PTR _i$31093[ebp]
	mov	esi, DWORD PTR _this$[ebp]
	mov	DWORD PTR [esi+eax*8+8], ecx
	mov	DWORD PTR [esi+eax*8+12], edx
; Line 197
	mov	ecx, DWORD PTR _phnChild$31098[ebp]
	mov	edx, DWORD PTR [ecx+4]
	and	edx, -2147483648			; 80000000H
	test	edx, edx
	je	SHORT $L31099
; Line 199
	mov	eax, DWORD PTR _phnChild$31098[ebp]
	mov	ecx, DWORD PTR [eax+4]
	and	ecx, 2147483647				; 7fffffffH
	mov	DWORD PTR _nCode$31100[ebp], ecx
; Line 200
	cmp	DWORD PTR _nCode$31100[ebp], 2147483647	; 7fffffffH
	je	SHORT $L31101
; Line 201
	mov	edx, DWORD PTR _i$31093[ebp]
	add	edx, 1
	mov	eax, DWORD PTR _nCode$31100[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+eax*4+4104], edx
; Line 202
	jmp	SHORT $L31102
$L31101:
; Line 203
	mov	edx, DWORD PTR _i$31093[ebp]
	add	edx, 1
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+5128], edx
$L31102:
$L31099:
; Line 207
	mov	ecx, DWORD PTR _phnNew$31094[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx]
	mov	eax, DWORD PTR _phnChild$31098[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax]
	add	edx, ecx
	mov	eax, DWORD PTR _phnParent$31097[ebp]
	mov	WORD PTR [eax], dx
; Line 208
	mov	ecx, DWORD PTR _phnParent$31097[ebp]
	mov	edx, DWORD PTR _phnChild$31098[ebp]
	mov	ax, WORD PTR [edx+2]
	mov	WORD PTR [ecx+2], ax
; Line 209
	mov	ecx, DWORD PTR _phnParent$31097[ebp]
	mov	edx, DWORD PTR _i$31093[ebp]
	mov	DWORD PTR [ecx+4], edx
; Line 211
	mov	eax, DWORD PTR _i$31093[ebp]
	add	eax, 2
	mov	ecx, DWORD PTR _phnChild$31098[ebp]
	mov	WORD PTR [ecx+2], ax
	mov	edx, DWORD PTR _phnNew$31094[ebp]
	mov	eax, DWORD PTR _phnChild$31098[ebp]
	mov	cx, WORD PTR [eax+2]
	mov	WORD PTR [edx+2], cx
; Line 214
	mov	edx, DWORD PTR _i$31093[ebp]
	add	edx, 2
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Normalize@ERINA_HUFFMAN_TREE@@QAEXH@Z	; ERINA_HUFFMAN_TREE::Normalize
; Line 216
	jmp	SHORT $L31103
$L31096:
; Line 220
	mov	eax, DWORD PTR _phnNew$31094[ebp]
	mov	WORD PTR [eax+2], 512			; 00000200H
; Line 223
	mov	ecx, DWORD PTR _i$31093[ebp]
	add	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+5128], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+5128]
	mov	edx, DWORD PTR _this$[ebp]
	lea	eax, DWORD PTR [edx+ecx*8]
	mov	DWORD PTR _phnEscape$31104[ebp], eax
; Line 224
	mov	ecx, DWORD PTR _phnEscape$31104[ebp]
	mov	WORD PTR [ecx], 1
; Line 225
	mov	edx, DWORD PTR _phnEscape$31104[ebp]
	mov	WORD PTR [edx+2], 512			; 00000200H
; Line 226
	mov	eax, DWORD PTR _phnEscape$31104[ebp]
	mov	DWORD PTR [eax+4], -1
; Line 228
	mov	ecx, DWORD PTR _phnRoot$31095[ebp]
	mov	WORD PTR [ecx], 2
; Line 229
	mov	edx, DWORD PTR _phnRoot$31095[ebp]
	mov	eax, DWORD PTR _i$31093[ebp]
	mov	DWORD PTR [edx+4], eax
$L31103:
; Line 232
	jmp	SHORT $L31105
$L31092:
; Line 236
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+5132]
	mov	DWORD PTR _i$31106[ebp], edx
; Line 237
	mov	eax, DWORD PTR _i$31106[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	lea	edx, DWORD PTR [ecx+eax*8]
	mov	DWORD PTR _phnEntry$31107[ebp], edx
; Line 239
	mov	eax, DWORD PTR _phnEntry$31107[ebp]
	cmp	DWORD PTR [eax+4], -1
	jne	SHORT $L31108
; Line 241
	mov	ecx, DWORD PTR _i$31106[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	lea	eax, DWORD PTR [edx+ecx*8+8]
	mov	DWORD PTR _phnEntry$31107[ebp], eax
$L31108:
; Line 243
	mov	ecx, DWORD PTR _nNewCode$[ebp]
	or	ecx, -2147483648			; 80000000H
	mov	edx, DWORD PTR _phnEntry$31107[ebp]
	mov	DWORD PTR [edx+4], ecx
$L31105:
; Line 245
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?AddNewEntry@ERINA_HUFFMAN_TREE@@QAEXH@Z ENDP		; ERINA_HUFFMAN_TREE::AddNewEntry
_TEXT	ENDS
PUBLIC	?HalfAndRebuild@ERINA_HUFFMAN_TREE@@QAEXXZ	; ERINA_HUFFMAN_TREE::HalfAndRebuild
_TEXT	SEGMENT
_this$ = -36
_i$ = -8
_iNextEntry$ = -16
_iChild$ = -4
_nCode$ = -12
_phnChild1$31123 = -20
_phnChild2$31124 = -24
_weight$31133 = -28
_j$31135 = -32
?HalfAndRebuild@ERINA_HUFFMAN_TREE@@QAEXXZ PROC NEAR	; ERINA_HUFFMAN_TREE::HalfAndRebuild
; Line 251
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 255
	mov	DWORD PTR _iNextEntry$[ebp], 512	; 00000200H
; Line 256
	mov	DWORD PTR _i$[ebp], 511			; 000001ffH
	jmp	SHORT $L31114
$L31115:
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31114:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+5132]
	jl	SHORT $L31116
; Line 258
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+eax*8+4]
	and	edx, -2147483648			; 80000000H
	test	edx, edx
	je	SHORT $L31117
; Line 260
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx+eax*8]
	add	edx, 1
	sar	edx, 1
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	WORD PTR [ecx+eax*8], dx
; Line 261
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+edx*8]
	mov	edx, DWORD PTR [eax+edx*8+4]
	mov	eax, DWORD PTR _iNextEntry$[ebp]
	mov	esi, DWORD PTR _this$[ebp]
	mov	DWORD PTR [esi+eax*8], ecx
	mov	DWORD PTR [esi+eax*8+4], edx
	mov	ecx, DWORD PTR _iNextEntry$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _iNextEntry$[ebp], ecx
$L31117:
; Line 263
	jmp	SHORT $L31115
$L31116:
; Line 264
	mov	edx, DWORD PTR _iNextEntry$[ebp]
	add	edx, 1
	mov	DWORD PTR _iNextEntry$[ebp], edx
; Line 268
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+5132]
	mov	DWORD PTR _i$[ebp], ecx
$L31121:
; Line 273
	mov	edx, DWORD PTR _iNextEntry$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+edx*8]
	mov	edx, DWORD PTR [eax+edx*8+4]
	mov	eax, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _this$[ebp]
	mov	DWORD PTR [esi+eax*8], ecx
	mov	DWORD PTR [esi+eax*8+4], edx
; Line 274
	mov	ecx, DWORD PTR _iNextEntry$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+ecx*8+8]
	mov	ecx, DWORD PTR [edx+ecx*8+12]
	mov	edx, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _this$[ebp]
	mov	DWORD PTR [esi+edx*8+8], eax
	mov	DWORD PTR [esi+edx*8+12], ecx
; Line 275
	mov	eax, DWORD PTR _iNextEntry$[ebp]
	add	eax, 2
	mov	DWORD PTR _iNextEntry$[ebp], eax
; Line 276
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	lea	eax, DWORD PTR [edx+ecx*8]
	mov	DWORD PTR _phnChild1$31123[ebp], eax
; Line 277
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	lea	eax, DWORD PTR [edx+ecx*8+8]
	mov	DWORD PTR _phnChild2$31124[ebp], eax
; Line 279
	mov	ecx, DWORD PTR _phnChild1$31123[ebp]
	mov	edx, DWORD PTR [ecx+4]
	and	edx, -2147483648			; 80000000H
	test	edx, edx
	jne	SHORT $L31125
; Line 281
	mov	eax, DWORD PTR _phnChild1$31123[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _iChild$[ebp], ecx
; Line 282
	mov	edx, DWORD PTR _iChild$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	cx, WORD PTR _i$[ebp]
	mov	WORD PTR [eax+edx*8+2], cx
; Line 283
	mov	edx, DWORD PTR _iChild$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	cx, WORD PTR _i$[ebp]
	mov	WORD PTR [eax+edx*8+10], cx
; Line 285
	jmp	SHORT $L31126
$L31125:
; Line 287
	mov	edx, DWORD PTR _phnChild1$31123[ebp]
	mov	eax, DWORD PTR [edx+4]
	and	eax, 2147483647				; 7fffffffH
	mov	DWORD PTR _nCode$[ebp], eax
; Line 288
	cmp	DWORD PTR _nCode$[ebp], 2147483647	; 7fffffffH
	jne	SHORT $L31127
; Line 289
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx+5128], edx
; Line 290
	jmp	SHORT $L31128
$L31127:
; Line 291
	mov	eax, DWORD PTR _nCode$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx+eax*4+4104], edx
$L31128:
$L31126:
; Line 294
	mov	eax, DWORD PTR _phnChild2$31124[ebp]
	mov	ecx, DWORD PTR [eax+4]
	and	ecx, -2147483648			; 80000000H
	test	ecx, ecx
	jne	SHORT $L31129
; Line 296
	mov	edx, DWORD PTR _phnChild2$31124[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR _iChild$[ebp], eax
; Line 297
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	edx, DWORD PTR _iChild$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	WORD PTR [eax+edx*8+2], cx
; Line 298
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	edx, DWORD PTR _iChild$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	WORD PTR [eax+edx*8+10], cx
; Line 300
	jmp	SHORT $L31130
$L31129:
; Line 302
	mov	ecx, DWORD PTR _phnChild2$31124[ebp]
	mov	edx, DWORD PTR [ecx+4]
	and	edx, 2147483647				; 7fffffffH
	mov	DWORD PTR _nCode$[ebp], edx
; Line 303
	cmp	DWORD PTR _nCode$[ebp], 2147483647	; 7fffffffH
	jne	SHORT $L31131
; Line 304
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+5128], eax
; Line 305
	jmp	SHORT $L31132
$L31131:
; Line 306
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	eax, DWORD PTR _nCode$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+eax*4+4104], edx
$L31132:
$L31130:
; Line 309
	mov	edx, DWORD PTR _phnChild1$31123[ebp]
	xor	eax, eax
	mov	ax, WORD PTR [edx]
	mov	ecx, DWORD PTR _phnChild2$31124[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx]
	add	eax, edx
	mov	WORD PTR _weight$31133[ebp], ax
; Line 312
	cmp	DWORD PTR _iNextEntry$[ebp], 512	; 00000200H
	jg	$L31134
; Line 314
	mov	eax, DWORD PTR _iNextEntry$[ebp]
	mov	DWORD PTR _j$31135[ebp], eax
$L31137:
; Line 317
	mov	ecx, DWORD PTR _weight$31133[ebp]
	and	ecx, 65535				; 0000ffffH
	mov	edx, DWORD PTR _j$31135[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	xor	esi, esi
	mov	si, WORD PTR [eax+edx*8]
	cmp	ecx, esi
	jg	SHORT $L31139
; Line 319
	mov	ecx, DWORD PTR _j$31135[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	ax, WORD PTR _weight$31133[ebp]
	mov	WORD PTR [edx+ecx*8-8], ax
; Line 320
	mov	ecx, DWORD PTR _j$31135[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR [edx+ecx*8-4], eax
; Line 321
	jmp	SHORT $L31138
$L31139:
; Line 323
	mov	ecx, DWORD PTR _j$31135[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+ecx*8]
	mov	ecx, DWORD PTR [edx+ecx*8+4]
	mov	edx, DWORD PTR _j$31135[ebp]
	mov	esi, DWORD PTR _this$[ebp]
	mov	DWORD PTR [esi+edx*8-8], eax
	mov	DWORD PTR [esi+edx*8-4], ecx
; Line 324
	mov	eax, DWORD PTR _j$31135[ebp]
	add	eax, 1
	mov	DWORD PTR _j$31135[ebp], eax
	cmp	DWORD PTR _j$31135[ebp], 512		; 00000200H
	jle	SHORT $L31140
; Line 326
	mov	ecx, DWORD PTR _this$[ebp]
	mov	dx, WORD PTR _weight$31133[ebp]
	mov	WORD PTR [ecx+4096], dx
; Line 327
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [eax+4100], ecx
; Line 328
	jmp	SHORT $L31138
$L31140:
; Line 330
	jmp	$L31137
$L31138:
; Line 331
	mov	edx, DWORD PTR _iNextEntry$[ebp]
	sub	edx, 1
	mov	DWORD PTR _iNextEntry$[ebp], edx
; Line 333
	jmp	SHORT $L31141
$L31134:
; Line 335
	mov	eax, DWORD PTR _this$[ebp]
	mov	cx, WORD PTR _weight$31133[ebp]
	mov	WORD PTR [eax+4096], cx
; Line 336
	mov	edx, DWORD PTR _this$[ebp]
	mov	WORD PTR [edx+4098], 32768		; 00008000H
; Line 337
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [eax+4100], ecx
; Line 338
	mov	edx, DWORD PTR _phnChild1$31123[ebp]
	mov	WORD PTR [edx+2], 512			; 00000200H
; Line 339
	mov	eax, DWORD PTR _phnChild2$31124[ebp]
	mov	WORD PTR [eax+2], 512			; 00000200H
; Line 340
	jmp	SHORT $L31122
$L31141:
; Line 343
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 2
	mov	DWORD PTR _i$[ebp], ecx
; Line 344
	jmp	$L31121
$L31122:
; Line 345
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
?HalfAndRebuild@ERINA_HUFFMAN_TREE@@QAEXXZ ENDP		; ERINA_HUFFMAN_TREE::HalfAndRebuild
_TEXT	ENDS
PUBLIC	??0RLHDecodeContext@@QAE@K@Z			; RLHDecodeContext::RLHDecodeContext
PUBLIC	??_7RLHDecodeContext@@6B@			; RLHDecodeContext::`vftable'
PUBLIC	??_GRLHDecodeContext@@UAEPAXI@Z			; RLHDecodeContext::`scalar deleting destructor'
;PUBLIC	??_ERLHDecodeContext@@UAEPAXI@Z			; RLHDecodeContext::`vector deleting destructor'
EXTRN	?DecodeGammaCodes@RLHDecodeContext@@QAEKPAHK@Z:NEAR ; RLHDecodeContext::DecodeGammaCodes
EXTRN	__purecall:NEAR
EXTRN	?eriAllocateMemory@@YAPAXK@Z:NEAR		; eriAllocateMemory
;	COMDAT ??_7RLHDecodeContext@@6B@
; File I:\EntisGLS\eri-chan\experi\experi.cpp
CONST	SEGMENT
??_7RLHDecodeContext@@6B@	LABEL	DWORD
;DD FLAT:??_ERLHDecodeContext@@UAEPAXI@Z ; RLHDecodeContext::`vftable'
	DD	FLAT:??_GRLHDecodeContext@@UAEPAXI@Z
	DD	FLAT:__purecall
CONST	ENDS
_TEXT	SEGMENT
_nBufferingSize$ = 8
_this$ = -4
??0RLHDecodeContext@@QAE@K@Z PROC NEAR			; RLHDecodeContext::RLHDecodeContext
; File I:\EntisGLS\eri-chan\experi\experi.cpp
; Line 356
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7RLHDecodeContext@@6B@ ; RLHDecodeContext::`vftable'
; Line 357
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+12], 0
; Line 358
	mov	edx, DWORD PTR _nBufferingSize$[ebp]
	add	edx, 3
	and	edx, -4					; fffffffcH
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+20], edx
; Line 359
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+24], 0
; Line 360
	mov	edx, DWORD PTR _nBufferingSize$[ebp]
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 361
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+68], 0
; Line 362
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+1092], 0
; Line 363
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+2120], OFFSET FLAT:?DecodeGammaCodes@RLHDecodeContext@@QAEKPAHK@Z ; RLHDecodeContext::DecodeGammaCodes
; Line 364
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+2128], 0
; Line 365
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??0RLHDecodeContext@@QAE@K@Z ENDP			; RLHDecodeContext::RLHDecodeContext
_TEXT	ENDS
PUBLIC	??1RLHDecodeContext@@UAE@XZ			; RLHDecodeContext::~RLHDecodeContext
EXTRN	??3@YAXPAX@Z:NEAR				; operator delete
;	COMDAT ??_GRLHDecodeContext@@UAEPAXI@Z
_TEXT	SEGMENT
___flags$ = 8
_this$ = -4
??_GRLHDecodeContext@@UAEPAXI@Z PROC NEAR		; RLHDecodeContext::`scalar deleting destructor', COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1RLHDecodeContext@@UAE@XZ		; RLHDecodeContext::~RLHDecodeContext
	mov	eax, DWORD PTR ___flags$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L31149
	mov	ecx, DWORD PTR _this$[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L31149:
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??_GRLHDecodeContext@@UAEPAXI@Z ENDP			; RLHDecodeContext::`scalar deleting destructor'
_TEXT	ENDS
EXTRN	?eriFreeMemory@@YAXPAX@Z:NEAR			; eriFreeMemory
_TEXT	SEGMENT
_this$ = -4
??1RLHDecodeContext@@UAE@XZ PROC NEAR			; RLHDecodeContext::~RLHDecodeContext
; Line 371
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7RLHDecodeContext@@6B@ ; RLHDecodeContext::`vftable'
; Line 372
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 373
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+68], 0
	je	SHORT $L31153
; Line 375
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+68]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31153:
; Line 377
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1092], 0
	je	SHORT $L31154
; Line 379
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1092]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31154:
; Line 381
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+2128], 0
	je	SHORT $L31155
; Line 383
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+2128]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31155:
; Line 385
	mov	esp, ebp
	pop	ebp
	ret	0
??1RLHDecodeContext@@UAE@XZ ENDP			; RLHDecodeContext::~RLHDecodeContext
_TEXT	ENDS
PUBLIC	?Initialize@RLHDecodeContext@@QAEXXZ		; RLHDecodeContext::Initialize
EXTRN	?GetABit@RLHDecodeContext@@QAEHXZ:NEAR		; RLHDecodeContext::GetABit
_TEXT	SEGMENT
_this$ = -4
?Initialize@RLHDecodeContext@@QAEXXZ PROC NEAR		; RLHDecodeContext::Initialize
; Line 391
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 392
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetABit@RLHDecodeContext@@QAEHXZ	; RLHDecodeContext::GetABit
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 393
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], 0
; Line 394
	mov	esp, ebp
	pop	ebp
	ret	0
?Initialize@RLHDecodeContext@@QAEXXZ ENDP		; RLHDecodeContext::Initialize
_TEXT	ENDS
PUBLIC	?FlushBuffer@RLHDecodeContext@@QAEXXZ		; RLHDecodeContext::FlushBuffer
_TEXT	SEGMENT
_this$ = -4
?FlushBuffer@RLHDecodeContext@@QAEXXZ PROC NEAR		; RLHDecodeContext::FlushBuffer
; Line 400
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 403
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 404
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+24], 0
; Line 405
	mov	esp, ebp
	pop	ebp
	ret	0
?FlushBuffer@RLHDecodeContext@@QAEXXZ ENDP		; RLHDecodeContext::FlushBuffer
_TEXT	ENDS
PUBLIC	?PrepareToDecodeArithmeticCode@RLHDecodeContext@@QAEXH@Z ; RLHDecodeContext::PrepareToDecodeArithmeticCode
EXTRN	?GetNBits@RLHDecodeContext@@QAEIH@Z:NEAR	; RLHDecodeContext::GetNBits
EXTRN	?DecodeArithmeticCodes@RLHDecodeContext@@QAEKPAHK@Z:NEAR ; RLHDecodeContext::DecodeArithmeticCodes
_TEXT	SEGMENT
_nBitCount$ = 8
_this$ = -32
_i$ = -12
_j$ = -16
_maskSignBit$ = -4
_bitSignExpansion$ = -24
_pSymbolTable$ = -8
_pStatisticalModel$ = -20
_pacs$31185 = -28
?PrepareToDecodeArithmeticCode@RLHDecodeContext@@QAEXH@Z PROC NEAR ; RLHDecodeContext::PrepareToDecodeArithmeticCode
; Line 411
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 415
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nBitCount$[ebp]
	mov	DWORD PTR [eax+52], ecx
; Line 416
	mov	edx, 1
	mov	ecx, DWORD PTR _nBitCount$[ebp]
	shl	edx, cl
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+56], edx
; Line 417
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+56]
	sub	edx, 1
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+60], edx
; Line 420
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+68], 0
	je	SHORT $L31166
; Line 422
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+68]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31166:
; Line 426
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+56]
	lea	eax, DWORD PTR [edx*4+4]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+56]
	imul	edx, eax
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+64], eax
; Line 430
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+56]
	sar	eax, 1
	mov	DWORD PTR _maskSignBit$[ebp], eax
; Line 431
	or	edx, -1
	mov	ecx, DWORD PTR _nBitCount$[ebp]
	shl	edx, cl
	mov	DWORD PTR _bitSignExpansion$[ebp], edx
; Line 432
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+56]
	mov	DWORD PTR [ecx], eax
; Line 433
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	add	edx, 4
	mov	DWORD PTR _pSymbolTable$[ebp], edx
; Line 434
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31175
$L31176:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31175:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+56]
	jge	SHORT $L31177
; Line 436
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pSymbolTable$[ebp]
	mov	WORD PTR [ecx+eax*4], 1
; Line 437
	mov	edx, DWORD PTR _i$[ebp]
	and	edx, DWORD PTR _maskSignBit$[ebp]
	test	edx, edx
	je	SHORT $L31178
; Line 438
	mov	eax, DWORD PTR _i$[ebp]
	or	eax, DWORD PTR _bitSignExpansion$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _pSymbolTable$[ebp]
	mov	WORD PTR [edx+ecx*4+2], ax
; Line 439
	jmp	SHORT $L31179
$L31178:
; Line 440
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _pSymbolTable$[ebp]
	mov	dx, WORD PTR _i$[ebp]
	mov	WORD PTR [ecx+eax*4+2], dx
$L31179:
; Line 441
	jmp	SHORT $L31176
$L31177:
; Line 443
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+64]
	mov	DWORD PTR [eax+68], edx
; Line 446
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+56]
	lea	ecx, DWORD PTR [ecx+eax*4+4]
	mov	DWORD PTR _pStatisticalModel$[ebp], ecx
; Line 448
	mov	DWORD PTR _i$[ebp], 1
	jmp	SHORT $L31182
$L31183:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31182:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+56]
	jge	SHORT $L31184
; Line 450
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _pStatisticalModel$[ebp]
	mov	DWORD PTR [eax+edx*4+68], ecx
; Line 451
	mov	edx, DWORD PTR _pStatisticalModel$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	mov	DWORD PTR [edx], ecx
; Line 452
	mov	edx, DWORD PTR _pStatisticalModel$[ebp]
	add	edx, 4
	mov	DWORD PTR _pacs$31185[ebp], edx
; Line 454
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31186
$L31187:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L31186:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+56]
	jge	SHORT $L31188
; Line 456
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _pSymbolTable$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR _pacs$31185[ebp]
	mov	DWORD PTR [eax], edx
	mov	ecx, DWORD PTR _pacs$31185[ebp]
	add	ecx, 4
	mov	DWORD PTR _pacs$31185[ebp], ecx
; Line 457
	jmp	SHORT $L31187
$L31188:
; Line 458
	mov	edx, DWORD PTR _pacs$31185[ebp]
	mov	DWORD PTR _pStatisticalModel$[ebp], edx
; Line 459
	jmp	SHORT $L31183
$L31184:
; Line 463
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+36], 0
; Line 464
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+40], -1
; Line 465
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+44], eax
; Line 467
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31190
$L31191:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31190:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L31192
; Line 471
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+44], -1
	jne	SHORT $L31193
; Line 473
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetABit@RLHDecodeContext@@QAEHXZ	; RLHDecodeContext::GetABit
	sar	eax, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+44]
	sub	ecx, eax
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+44], ecx
; Line 474
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+44], 0
	jne	SHORT $L31194
; Line 475
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+36]
	add	edx, 1
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+36], edx
$L31194:
$L31193:
; Line 479
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+36]
	shl	edx, 1
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	shr	ecx, 31					; 0000001fH
	or	edx, ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+36], edx
; Line 480
	mov	ecx, DWORD PTR _this$[ebp]
	mov	esi, DWORD PTR [ecx+44]
	shl	esi, 1
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetABit@RLHDecodeContext@@QAEHXZ	; RLHDecodeContext::GetABit
	and	eax, 1
	or	esi, eax
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+44], esi
; Line 481
	jmp	SHORT $L31191
$L31192:
; Line 484
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+44], -1
	jne	SHORT $L31195
; Line 486
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetABit@RLHDecodeContext@@QAEHXZ	; RLHDecodeContext::GetABit
	sar	eax, 1
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+44]
	sub	edx, eax
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+44], edx
; Line 487
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+44], 0
	jne	SHORT $L31196
; Line 488
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+36]
	add	eax, 1
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+36], eax
$L31196:
$L31195:
; Line 492
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+48], 0
; Line 493
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+2120], OFFSET FLAT:?DecodeArithmeticCodes@RLHDecodeContext@@QAEKPAHK@Z ; RLHDecodeContext::DecodeArithmeticCodes
; Line 494
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?PrepareToDecodeArithmeticCode@RLHDecodeContext@@QAEXH@Z ENDP ; RLHDecodeContext::PrepareToDecodeArithmeticCode
_TEXT	ENDS
PUBLIC	?PrepareToDecodeRLMTFGCode@RLHDecodeContext@@QAEXXZ ; RLHDecodeContext::PrepareToDecodeRLMTFGCode
_TEXT	SEGMENT
_i$32072 = -12
$T32076 = -16
_this$ = -20
_ptrBuffer$ = -8
_i$ = -4
?PrepareToDecodeRLMTFGCode@RLHDecodeContext@@QAEXXZ PROC NEAR ; RLHDecodeContext::PrepareToDecodeRLMTFGCode
; Line 500
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 504
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+1092], 0
	jne	SHORT $L31201
; Line 507
	push	65792					; 00010100H
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	DWORD PTR _ptrBuffer$[ebp], eax
; Line 509
	jmp	SHORT $L31204
$L31201:
; Line 511
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+1092]
	mov	DWORD PTR _ptrBuffer$[ebp], edx
$L31204:
; Line 515
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31207
$L31208:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31207:
	cmp	DWORD PTR _i$[ebp], 256			; 00000100H
	jg	SHORT $L31209
; Line 517
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _ptrBuffer$[ebp]
	mov	DWORD PTR [edx+ecx*4+1092], eax
; Line 518
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4+1092]
	mov	DWORD PTR $T32076[ebp], eax
	mov	DWORD PTR _i$32072[ebp], 0
	jmp	SHORT $L32073
$L32074:
	mov	ecx, DWORD PTR _i$32072[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$32072[ebp], ecx
$L32073:
	cmp	DWORD PTR _i$32072[ebp], 256		; 00000100H
	jge	SHORT $L32075
	mov	edx, DWORD PTR $T32076[ebp]
	add	edx, DWORD PTR _i$32072[ebp]
	mov	al, BYTE PTR _i$32072[ebp]
	mov	BYTE PTR [edx], al
	jmp	SHORT $L32074
$L32075:
; Line 519
	mov	ecx, DWORD PTR _ptrBuffer$[ebp]
	add	ecx, 256				; 00000100H
	mov	DWORD PTR _ptrBuffer$[ebp], ecx
; Line 520
	jmp	SHORT $L31208
$L31209:
; Line 521
	mov	esp, ebp
	pop	ebp
	ret	0
?PrepareToDecodeRLMTFGCode@RLHDecodeContext@@QAEXXZ ENDP ; RLHDecodeContext::PrepareToDecodeRLMTFGCode
_TEXT	ENDS
PUBLIC	?PrepareToDecodeERINACode@RLHDecodeContext@@QAEXXZ ; RLHDecodeContext::PrepareToDecodeERINACode
_TEXT	SEGMENT
_this$ = -12
_ptrBuf$ = -4
_i$ = -8
?PrepareToDecodeERINACode@RLHDecodeContext@@QAEXXZ PROC NEAR ; RLHDecodeContext::PrepareToDecodeERINACode
; Line 527
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 530
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 532
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+2128], 0
	jne	SHORT $L31216
; Line 535
	push	1319952					; 00142410H
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	DWORD PTR _ptrBuf$[ebp], eax
; Line 537
	jmp	SHORT $L31219
$L31216:
; Line 539
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+2128]
	mov	DWORD PTR _ptrBuf$[ebp], eax
$L31219:
; Line 543
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31222
$L31223:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L31222:
	cmp	DWORD PTR _i$[ebp], 257			; 00000101H
	jge	SHORT $L31224
; Line 545
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _ptrBuf$[ebp]
	mov	DWORD PTR [eax+edx*4+2128], ecx
; Line 546
	mov	edx, DWORD PTR _ptrBuf$[ebp]
	add	edx, 5136				; 00001410H
	mov	DWORD PTR _ptrBuf$[ebp], edx
; Line 547
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+eax*4+2128]
	call	?Initialize@ERINA_HUFFMAN_TREE@@QAEXXZ	; ERINA_HUFFMAN_TREE::Initialize
; Line 548
	jmp	SHORT $L31223
$L31224:
; Line 549
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+2128]
	mov	DWORD PTR [edx+2124], ecx
; Line 550
	mov	esp, ebp
	pop	ebp
	ret	0
?PrepareToDecodeERINACode@RLHDecodeContext@@QAEXXZ ENDP	; RLHDecodeContext::PrepareToDecodeERINACode
_TEXT	ENDS
PUBLIC	??0ERIDecoder@@QAE@XZ				; ERIDecoder::ERIDecoder
PUBLIC	?Initialize@ERIDecoder@@UAEHABUERI_INFO_HEADER@@@Z ; ERIDecoder::Initialize
PUBLIC	?Delete@ERIDecoder@@UAEXXZ			; ERIDecoder::Delete
PUBLIC	?DecodeImage@ERIDecoder@@UAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@_N@Z ; ERIDecoder::DecodeImage
PUBLIC	?GetRestoreFunc@ERIDecoder@@MAEP81@AEXPAEJHH@ZKK@Z ; ERIDecoder::GetRestoreFunc
PUBLIC	?GetRestoreFuncII@ERIDecoder@@MAEP81@AEXPAEJQAPAMHH@ZKK@Z ; ERIDecoder::GetRestoreFuncII
PUBLIC	?OnDecodedBlock@ERIDecoder@@MAEHJJ@Z		; ERIDecoder::OnDecodedBlock
PUBLIC	?OnDecodedLine@ERIDecoder@@MAEHJ@Z		; ERIDecoder::OnDecodedLine
PUBLIC	??_7ERIDecoder@@6B@				; ERIDecoder::`vftable'
PUBLIC	??_GERIDecoder@@UAEPAXI@Z			; ERIDecoder::`scalar deleting destructor'
;PUBLIC	??_EERIDecoder@@UAEPAXI@Z			; ERIDecoder::`vector deleting destructor'
;	COMDAT ??_7ERIDecoder@@6B@
; File I:\EntisGLS\eri-chan\experi\experi.cpp
CONST	SEGMENT
??_7ERIDecoder@@6B@	LABEL	DWORD
;DD FLAT:??_EERIDecoder@@UAEPAXI@Z	; ERIDecoder::`vftable'
	DD	FLAT:??_GERIDecoder@@UAEPAXI@Z
	DD	FLAT:?Initialize@ERIDecoder@@UAEHABUERI_INFO_HEADER@@@Z
	DD	FLAT:?Delete@ERIDecoder@@UAEXXZ
	DD	FLAT:?DecodeImage@ERIDecoder@@UAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@_N@Z
	DD	FLAT:?GetRestoreFunc@ERIDecoder@@MAEP81@AEXPAEJHH@ZKK@Z
	DD	FLAT:?GetRestoreFuncII@ERIDecoder@@MAEP81@AEXPAEJQAPAMHH@ZKK@Z
	DD	FLAT:?OnDecodedBlock@ERIDecoder@@MAEHJJ@Z
	DD	FLAT:?OnDecodedLine@ERIDecoder@@MAEHJ@Z
CONST	ENDS
_TEXT	SEGMENT
_this$ = -4
??0ERIDecoder@@QAE@XZ PROC NEAR				; ERIDecoder::ERIDecoder
; File I:\EntisGLS\eri-chan\experi\experi.cpp
; Line 595
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7ERIDecoder@@6B@ ; ERIDecoder::`vftable'
; Line 596
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+100], 0
; Line 597
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+104], 0
; Line 598
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+108], 0
; Line 599
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+112], 0
; Line 600
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+116], 0
; Line 602
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+124], 0
; Line 603
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+128], 0
; Line 604
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+132], 0
; Line 605
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+136], 0
; Line 607
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+140], 0
; Line 609
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+152], 0
; Line 610
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+216], 0
; Line 611
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+280], 0
; Line 612
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+344], 0
; Line 613
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+348], 0
; Line 615
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+416], 0
; Line 616
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0ERIDecoder@@QAE@XZ ENDP				; ERIDecoder::ERIDecoder
_TEXT	ENDS
PUBLIC	??1ERIDecoder@@UAE@XZ				; ERIDecoder::~ERIDecoder
;	COMDAT ??_GERIDecoder@@UAEPAXI@Z
_TEXT	SEGMENT
___flags$ = 8
_this$ = -4
??_GERIDecoder@@UAEPAXI@Z PROC NEAR			; ERIDecoder::`scalar deleting destructor', COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1ERIDecoder@@UAE@XZ			; ERIDecoder::~ERIDecoder
	mov	eax, DWORD PTR ___flags$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L31233
	mov	ecx, DWORD PTR _this$[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L31233:
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??_GERIDecoder@@UAEPAXI@Z ENDP				; ERIDecoder::`scalar deleting destructor'
_TEXT	ENDS
_TEXT	SEGMENT
_this$ = -4
??1ERIDecoder@@UAE@XZ PROC NEAR				; ERIDecoder::~ERIDecoder
; Line 622
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7ERIDecoder@@6B@ ; ERIDecoder::`vftable'
; Line 623
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Delete@ERIDecoder@@UAEXXZ		; ERIDecoder::Delete
; Line 624
	mov	esp, ebp
	pop	ebp
	ret	0
??1ERIDecoder@@UAE@XZ ENDP				; ERIDecoder::~ERIDecoder
_TEXT	ENDS
PUBLIC	?InitializeArrangeTable@ERIDecoder@@IAEXXZ	; ERIDecoder::InitializeArrangeTable
PUBLIC	?InitializeArrangeTableII@ERIDecoder@@IAEXXZ	; ERIDecoder::InitializeArrangeTableII
PUBLIC	?InitializeZigZagTable@ERIDecoder@@IAEXXZ	; ERIDecoder::InitializeZigZagTable
EXTRN	?BlockScaling444@ERIDecoder@@IAEXXZ:NEAR	; ERIDecoder::BlockScaling444
EXTRN	?BlockScaling422@ERIDecoder@@IAEXXZ:NEAR	; ERIDecoder::BlockScaling422
EXTRN	?BlockScaling411@ERIDecoder@@IAEXXZ:NEAR	; ERIDecoder::BlockScaling411
_TEXT	SEGMENT
_infhdr$ = 8
_this$ = -16
_ptrBuffer$31310 = -12
_i$31313 = -4
_j$31314 = -8
?Initialize@ERIDecoder@@UAEHABUERI_INFO_HEADER@@@Z PROC NEAR ; ERIDecoder::Initialize
; Line 630
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 633
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+8]
; Line 636
	mov	esi, DWORD PTR _infhdr$[ebp]
	mov	edi, DWORD PTR _this$[ebp]
	add	edi, 4
	mov	ecx, 17					; 00000011H
	rep movsd
; Line 638
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 50462720		; 03020000H
	jne	$L31240
; Line 644
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+12], -1
	je	SHORT $L31241
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+12], -4			; fffffffcH
	je	SHORT $L31241
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+12], 32			; 00000020H
	je	SHORT $L31241
; Line 646
	mov	eax, 1
	jmp	$L31239
$L31241:
; Line 649
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	and	edx, 16777215				; 00ffffffH
	mov	DWORD PTR -20+[ebp], edx
	cmp	DWORD PTR -20+[ebp], 1
	je	SHORT $L31246
	cmp	DWORD PTR -20+[ebp], 2
	je	SHORT $L31251
	jmp	SHORT $L31252
$L31246:
; Line 652
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+28], 8
	ja	SHORT $L31247
; Line 653
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+84], 1
; Line 654
	jmp	SHORT $L31248
$L31247:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	and	eax, 67108864				; 04000000H
	test	eax, eax
	jne	SHORT $L31249
; Line 655
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+84], 3
; Line 656
	jmp	SHORT $L31250
$L31249:
; Line 657
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+84], 4
$L31250:
$L31248:
; Line 658
	jmp	SHORT $L31243
$L31251:
; Line 661
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+84], 1
; Line 662
	jmp	SHORT $L31243
$L31252:
; Line 665
	mov	eax, 1
	jmp	$L31239
$L31243:
; Line 668
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+56], 0
	je	$L31253
; Line 672
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, 1
	mov	ecx, DWORD PTR [edx+56]
	shl	eax, cl
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+72], eax
; Line 673
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+56]
	shl	ecx, 1
	mov	eax, 1
	shl	eax, cl
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+76], eax
; Line 674
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+76]
	imul	ecx, DWORD PTR [eax+84]
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+80], ecx
; Line 677
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	lea	edx, DWORD PTR [ecx+eax-1]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	shr	edx, cl
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+88], edx
; Line 678
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+24], 0
	jge	SHORT $L31257
; Line 680
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	neg	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+92], ecx
; Line 682
	jmp	SHORT $L31259
$L31257:
; Line 684
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	mov	DWORD PTR [eax+92], edx
$L31259:
; Line 688
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+92]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	lea	edx, DWORD PTR [ecx+eax-1]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	shr	edx, cl
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+92], edx
; Line 692
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+88]
	imul	ecx, DWORD PTR [eax+92]
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+100], eax
; Line 695
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+72]
	imul	edx, DWORD PTR [ecx+84]
	shl	edx, 2
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+104], eax
; Line 698
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [edx+88]
	mov	ecx, DWORD PTR [eax+56]
	shl	edx, cl
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+84]
	imul	ecx, edx
	shl	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+108], eax
; Line 700
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	shl	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+112], eax
; Line 702
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	shl	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+116], eax
$L31253:
; Line 706
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+4], 131328		; 00020100H
	jne	SHORT $L31270
; Line 710
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+120], 0
; Line 712
	jmp	SHORT $L31271
$L31270:
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+4], 131584		; 00020200H
	jne	SHORT $L31272
; Line 716
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+12], -4			; fffffffcH
	jne	SHORT $L31273
; Line 718
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+120], 2
; Line 719
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+56], 0
	je	SHORT $L31274
; Line 721
	mov	ecx, DWORD PTR _this$[ebp]
	call	?InitializeArrangeTableII@ERIDecoder@@IAEXXZ ; ERIDecoder::InitializeArrangeTableII
; Line 724
	push	5136					; 00001410H
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+140], eax
$L31274:
; Line 727
	jmp	SHORT $L31277
$L31273:
; Line 729
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+120], 1
; Line 730
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+56], 0
	je	SHORT $L31278
; Line 732
	mov	ecx, DWORD PTR _this$[ebp]
	call	?InitializeArrangeTable@ERIDecoder@@IAEXXZ ; ERIDecoder::InitializeArrangeTable
$L31278:
$L31277:
; Line 736
	jmp	SHORT $L31279
$L31272:
; Line 738
	mov	eax, 1
	jmp	$L31239
$L31279:
$L31271:
; Line 741
	jmp	$L31280
$L31240:
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+8], 1
	jne	$L31281
; Line 744
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+12], -1
	je	SHORT $L31282
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+12], -4			; fffffffcH
	je	SHORT $L31282
; Line 746
	mov	eax, 1
	jmp	$L31239
$L31282:
; Line 749
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	and	edx, 16777215				; 00ffffffH
	cmp	edx, 1
	je	SHORT $L31283
; Line 751
	mov	eax, 1
	jmp	$L31239
$L31283:
; Line 753
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+28], 24			; 00000018H
	jae	SHORT $L31284
; Line 755
	mov	eax, 1
	jmp	$L31239
$L31284:
; Line 757
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	and	edx, 67108864				; 04000000H
	test	edx, edx
	jne	SHORT $L31285
; Line 759
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+84], 3
; Line 761
	jmp	SHORT $L31286
$L31285:
; Line 763
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+84], 4
$L31286:
; Line 767
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+56], 3
	jb	SHORT $L31288
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+56], 5
	jbe	SHORT $L31287
$L31288:
; Line 769
	mov	eax, 1
	jmp	$L31239
$L31287:
; Line 773
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, 1
	mov	ecx, DWORD PTR [ecx+56]
	shl	edx, cl
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+72], edx
; Line 774
	mov	ecx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [ecx+56]
	shl	ecx, 1
	mov	edx, 1
	shl	edx, cl
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+76], edx
; Line 775
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	shl	edx, 2
	mov	eax, DWORD PTR _this$[ebp]
	imul	edx, DWORD PTR [eax+84]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+80], edx
; Line 778
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
; Line 779
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jge	SHORT $L31292
; Line 781
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	neg	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+92], edx
; Line 783
	jmp	SHORT $L31294
$L31292:
; Line 785
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+24]
	mov	DWORD PTR [ecx+92], eax
$L31294:
; Line 789
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
; Line 791
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+144], 0
; Line 792
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+36]
	mov	DWORD PTR -24+[ebp], ecx
	cmp	DWORD PTR -24+[ebp], 262401		; 00040101H
	je	SHORT $L31302
	cmp	DWORD PTR -24+[ebp], 262658		; 00040202H
	je	SHORT $L31301
	cmp	DWORD PTR -24+[ebp], 263172		; 00040404H
	je	SHORT $L31300
	jmp	SHORT $L31303
$L31300:
; Line 795
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+144], 12			; 0000000cH
; Line 796
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+148], OFFSET FLAT:?BlockScaling444@ERIDecoder@@IAEXXZ ; ERIDecoder::BlockScaling444
; Line 797
	jmp	SHORT $L31297
$L31301:
; Line 799
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+144], 8
; Line 800
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+148], OFFSET FLAT:?BlockScaling422@ERIDecoder@@IAEXXZ ; ERIDecoder::BlockScaling422
; Line 801
	jmp	SHORT $L31297
$L31302:
; Line 803
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+144], 6
; Line 804
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+148], OFFSET FLAT:?BlockScaling411@ERIDecoder@@IAEXXZ ; ERIDecoder::BlockScaling411
; Line 805
	jmp	SHORT $L31297
$L31303:
; Line 807
	mov	eax, 1
	jmp	$L31239
$L31297:
; Line 809
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+84], 4
	jne	SHORT $L31304
; Line 811
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+144]
	add	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+144], ecx
$L31304:
; Line 817
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+88]
	imul	edx, DWORD PTR [ecx+92]
	shl	edx, 2
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+100], eax
; Line 821
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+88]
	imul	ecx, DWORD PTR [eax+92]
	mov	edx, DWORD PTR _this$[ebp]
	imul	ecx, DWORD PTR [edx+144]
	shl	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+416], eax
; Line 825
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+144]
	imul	ecx, DWORD PTR [eax+76]
	shl	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+112], eax
; Line 829
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	shl	ecx, 2
	shl	ecx, 4
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	DWORD PTR _ptrBuffer$31310[ebp], eax
; Line 831
	mov	DWORD PTR _i$31313[ebp], 0
	jmp	SHORT $L31315
$L31316:
	mov	edx, DWORD PTR _i$31313[ebp]
	add	edx, 1
	mov	DWORD PTR _i$31313[ebp], edx
$L31315:
	cmp	DWORD PTR _i$31313[ebp], 4
	jge	SHORT $L31317
; Line 833
	mov	DWORD PTR _j$31314[ebp], 0
	jmp	SHORT $L31318
$L31319:
	mov	eax, DWORD PTR _j$31314[ebp]
	add	eax, 1
	mov	DWORD PTR _j$31314[ebp], eax
$L31318:
	cmp	DWORD PTR _j$31314[ebp], 4
	jge	SHORT $L31320
; Line 835
	mov	ecx, DWORD PTR _i$31313[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR _this$[ebp]
	lea	eax, DWORD PTR [edx+ecx+152]
	mov	ecx, DWORD PTR _j$31314[ebp]
	mov	edx, DWORD PTR _ptrBuffer$31310[ebp]
	mov	DWORD PTR [eax+ecx*4], edx
; Line 836
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	mov	edx, DWORD PTR _ptrBuffer$31310[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _ptrBuffer$31310[ebp], eax
; Line 837
	jmp	SHORT $L31319
$L31320:
; Line 838
	jmp	SHORT $L31316
$L31317:
; Line 842
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	shl	edx, 2
	shl	edx, 4
	push	edx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	DWORD PTR _ptrBuffer$31310[ebp], eax
; Line 843
	mov	DWORD PTR _i$31313[ebp], 0
	jmp	SHORT $L31323
$L31324:
	mov	eax, DWORD PTR _i$31313[ebp]
	add	eax, 1
	mov	DWORD PTR _i$31313[ebp], eax
$L31323:
	cmp	DWORD PTR _i$31313[ebp], 16		; 00000010H
	jge	SHORT $L31325
; Line 845
	mov	ecx, DWORD PTR _i$31313[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _ptrBuffer$31310[ebp]
	mov	DWORD PTR [edx+ecx*4+216], eax
; Line 846
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	mov	eax, DWORD PTR _ptrBuffer$31310[ebp]
	lea	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _ptrBuffer$31310[ebp], ecx
; Line 847
	jmp	SHORT $L31324
$L31325:
; Line 851
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	shl	eax, 2
	shl	eax, 4
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	DWORD PTR _ptrBuffer$31310[ebp], eax
; Line 852
	mov	DWORD PTR _i$31313[ebp], 0
	jmp	SHORT $L31328
$L31329:
	mov	ecx, DWORD PTR _i$31313[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$31313[ebp], ecx
$L31328:
	cmp	DWORD PTR _i$31313[ebp], 16		; 00000010H
	jge	SHORT $L31330
; Line 854
	mov	edx, DWORD PTR _i$31313[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _ptrBuffer$31310[ebp]
	mov	DWORD PTR [eax+edx*4+280], ecx
; Line 855
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	mov	ecx, DWORD PTR _ptrBuffer$31310[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _ptrBuffer$31310[ebp], edx
; Line 856
	jmp	SHORT $L31329
$L31330:
; Line 859
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	shl	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+344], eax
; Line 861
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	shl	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+348], eax
; Line 865
	push	5136					; 00001410H
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+140], eax
; Line 868
	mov	ecx, DWORD PTR _this$[ebp]
	call	?InitializeZigZagTable@ERIDecoder@@IAEXXZ ; ERIDecoder::InitializeZigZagTable
; Line 870
	jmp	SHORT $L31337
$L31281:
; Line 872
	mov	eax, 1
	jmp	SHORT $L31239
$L31337:
$L31280:
; Line 877
	xor	eax, eax
$L31239:
; Line 878
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?Initialize@ERIDecoder@@UAEHABUERI_INFO_HEADER@@@Z ENDP	; ERIDecoder::Initialize
_this$ = -4
?Delete@ERIDecoder@@UAEXXZ PROC NEAR			; ERIDecoder::Delete
; Line 884
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 885
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+100], 0
	je	SHORT $L31341
; Line 887
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 888
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+100], 0
$L31341:
; Line 890
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+104], 0
	je	SHORT $L31342
; Line 892
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+104]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 893
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+104], 0
$L31342:
; Line 895
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+108], 0
	je	SHORT $L31343
; Line 897
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 898
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+108], 0
$L31343:
; Line 900
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+112], 0
	je	SHORT $L31344
; Line 902
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 903
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+112], 0
$L31344:
; Line 905
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+116], 0
	je	SHORT $L31345
; Line 907
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+116]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 908
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+116], 0
$L31345:
; Line 910
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+124], 0
	je	SHORT $L31346
; Line 912
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 913
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+124], 0
$L31346:
; Line 915
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+140], 0
	je	SHORT $L31347
; Line 917
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+140]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 918
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+140], 0
$L31347:
; Line 920
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+152], 0
	je	SHORT $L31348
; Line 922
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+152]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 923
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+152], 0
$L31348:
; Line 925
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+216], 0
	je	SHORT $L31349
; Line 927
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+216]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 928
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+216], 0
$L31349:
; Line 930
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+280], 0
	je	SHORT $L31350
; Line 932
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+280]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 933
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+280], 0
$L31350:
; Line 935
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+344], 0
	je	SHORT $L31351
; Line 937
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+344]
	push	eax
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 938
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+344], 0
$L31351:
; Line 940
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+348], 0
	je	SHORT $L31352
; Line 942
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+348]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 943
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+348], 0
$L31352:
; Line 945
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+416], 0
	je	SHORT $L31353
; Line 947
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+416]
	push	edx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
; Line 948
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+416], 0
$L31353:
; Line 950
	mov	esp, ebp
	pop	ebp
	ret	0
?Delete@ERIDecoder@@UAEXXZ ENDP				; ERIDecoder::Delete
_TEXT	ENDS
PUBLIC	?DecodeTrueColorImage@ERIDecoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@@Z ; ERIDecoder::DecodeTrueColorImage
PUBLIC	?DecodeTrueColorImageII@ERIDecoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@@Z ; ERIDecoder::DecodeTrueColorImageII
PUBLIC	?DecodePaletteImage@ERIDecoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@@Z ; ERIDecoder::DecodePaletteImage
PUBLIC	?DecodeTrueColorImageDCT@ERIDecoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@@Z ; ERIDecoder::DecodeTrueColorImageDCT
_TEXT	SEGMENT
_dstimginf$ = 8
_context$ = 12
_fTopDown$ = 16
_this$ = -36
_imginf$ = -28
_fReverse$ = -4
_nERIVersion$31364 = -32
?DecodeImage@ERIDecoder@@UAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@_N@Z PROC NEAR ; ERIDecoder::DecodeImage
; Line 958
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 961
	mov	esi, DWORD PTR _dstimginf$[ebp]
	mov	ecx, 6
	lea	edi, DWORD PTR _imginf$[ebp]
	rep movsd
; Line 962
	mov	al, BYTE PTR _fTopDown$[ebp]
	mov	BYTE PTR _fReverse$[ebp], al
; Line 963
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+24], 0
	jge	SHORT $L31361
; Line 965
	mov	edx, DWORD PTR _fReverse$[ebp]
	and	edx, 255				; 000000ffH
	neg	edx
	sbb	edx, edx
	inc	edx
	mov	BYTE PTR _fReverse$[ebp], dl
$L31361:
; Line 967
	mov	eax, DWORD PTR _fReverse$[ebp]
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L31362
; Line 970
	mov	ecx, DWORD PTR _imginf$[ebp+12]
	sub	ecx, 1
	imul	ecx, DWORD PTR _imginf$[ebp+20]
	mov	edx, DWORD PTR _imginf$[ebp+4]
	add	edx, ecx
	mov	DWORD PTR _imginf$[ebp+4], edx
; Line 971
	mov	eax, DWORD PTR _imginf$[ebp+20]
	neg	eax
	mov	DWORD PTR _imginf$[ebp+20], eax
$L31362:
; Line 974
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+8], 50462720		; 03020000H
	jne	SHORT $L31363
; Line 978
	mov	ecx, DWORD PTR _context$[ebp]
	call	?FlushBuffer@RLHDecodeContext@@QAEXXZ	; RLHDecodeContext::FlushBuffer
; Line 979
	push	8
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	DWORD PTR _nERIVersion$31364[ebp], eax
; Line 980
	cmp	DWORD PTR _nERIVersion$31364[ebp], 1
	je	SHORT $L31366
	cmp	DWORD PTR _nERIVersion$31364[ebp], 4
	jne	SHORT $L31365
$L31366:
; Line 984
	cmp	DWORD PTR _nERIVersion$31364[ebp], 4
	jne	SHORT $L31367
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+120], 1
	je	SHORT $L31367
; Line 986
	mov	eax, 1
	jmp	SHORT $L31358
$L31367:
; Line 988
	mov	eax, DWORD PTR _context$[ebp]
	push	eax
	lea	ecx, DWORD PTR _imginf$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DecodeTrueColorImage@ERIDecoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@@Z ; ERIDecoder::DecodeTrueColorImage
	jmp	SHORT $L31358
$L31365:
; Line 990
	cmp	DWORD PTR _nERIVersion$31364[ebp], 8
	jne	SHORT $L31369
; Line 994
	mov	edx, DWORD PTR _context$[ebp]
	push	edx
	lea	eax, DWORD PTR _imginf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DecodeTrueColorImageII@ERIDecoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@@Z ; ERIDecoder::DecodeTrueColorImageII
	jmp	SHORT $L31358
$L31369:
; Line 996
	cmp	DWORD PTR _nERIVersion$31364[ebp], 2
	jne	SHORT $L31371
; Line 1000
	mov	ecx, DWORD PTR _context$[ebp]
	push	ecx
	lea	edx, DWORD PTR _imginf$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DecodePaletteImage@ERIDecoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@@Z ; ERIDecoder::DecodePaletteImage
	jmp	SHORT $L31358
$L31371:
; Line 1003
	jmp	SHORT $L31372
$L31363:
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+8], 1
	jne	SHORT $L31373
; Line 1007
	mov	ecx, DWORD PTR _context$[ebp]
	push	ecx
	lea	edx, DWORD PTR _imginf$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DecodeTrueColorImageDCT@ERIDecoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@@Z ; ERIDecoder::DecodeTrueColorImageDCT
	jmp	SHORT $L31358
$L31373:
$L31372:
; Line 1010
	mov	eax, 1
$L31358:
; Line 1011
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?DecodeImage@ERIDecoder@@UAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@_N@Z ENDP ; ERIDecoder::DecodeImage
_this$ = -44
_i$ = -12
_j$ = -20
_k$ = -28
_l$ = -32
_ptrNext$ = -40
_nBlockDegree$ = -4
_nBlockSize$ = -36
_nBlockHalf$ = -24
_nBlockArea$ = -8
_ptrTable$ = -16
?InitializeArrangeTable@ERIDecoder@@IAEXXZ PROC NEAR	; ERIDecoder::InitializeArrangeTable
; Line 1017
	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1020
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	mov	DWORD PTR _nBlockDegree$[ebp], ecx
; Line 1021
	mov	edx, 1
	mov	ecx, DWORD PTR _nBlockDegree$[ebp]
	shl	edx, cl
	mov	DWORD PTR _nBlockSize$[ebp], edx
; Line 1022
	mov	eax, DWORD PTR _nBlockSize$[ebp]
	sar	eax, 1
	mov	DWORD PTR _nBlockHalf$[ebp], eax
; Line 1023
	mov	edx, DWORD PTR _nBlockSize$[ebp]
	mov	ecx, DWORD PTR _nBlockDegree$[ebp]
	shl	edx, cl
	mov	DWORD PTR _nBlockArea$[ebp], edx
; Line 1027
	mov	eax, DWORD PTR _nBlockArea$[ebp]
	shl	eax, 2
	shl	eax, 2
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	DWORD PTR _ptrTable$[ebp], eax
; Line 1028
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _ptrTable$[ebp]
	mov	DWORD PTR [ecx+124], edx
; Line 1029
	mov	eax, DWORD PTR _nBlockArea$[ebp]
	mov	ecx, DWORD PTR _ptrTable$[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+128], edx
; Line 1030
	mov	ecx, DWORD PTR _nBlockArea$[ebp]
	shl	ecx, 1
	mov	edx, DWORD PTR _ptrTable$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+132], eax
; Line 1031
	mov	edx, DWORD PTR _nBlockArea$[ebp]
	imul	edx, 3
	mov	eax, DWORD PTR _ptrTable$[ebp]
	lea	ecx, DWORD PTR [eax+edx*4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+136], ecx
; Line 1034
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	mov	DWORD PTR _ptrNext$[ebp], ecx
; Line 1035
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31389
$L31390:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31389:
	cmp	DWORD PTR _i$[ebp], 2
	jge	SHORT $L31391
; Line 1037
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31392
$L31393:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L31392:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _nBlockHalf$[ebp]
	jge	SHORT $L31394
; Line 1039
	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [eax+edx*2]
	imul	ecx, DWORD PTR _nBlockSize$[ebp]
	mov	DWORD PTR _l$[ebp], ecx
; Line 1040
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L31395
$L31396:
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
$L31395:
	mov	eax, DWORD PTR _k$[ebp]
	cmp	eax, DWORD PTR _nBlockSize$[ebp]
	jge	SHORT $L31397
; Line 1041
	mov	ecx, DWORD PTR _ptrNext$[ebp]
	mov	edx, DWORD PTR _l$[ebp]
	mov	DWORD PTR [ecx], edx
	mov	eax, DWORD PTR _ptrNext$[ebp]
	add	eax, 4
	mov	DWORD PTR _ptrNext$[ebp], eax
	mov	ecx, DWORD PTR _l$[ebp]
	add	ecx, 1
	mov	DWORD PTR _l$[ebp], ecx
	jmp	SHORT $L31396
$L31397:
; Line 1042
	jmp	SHORT $L31393
$L31394:
; Line 1043
	jmp	SHORT $L31390
$L31391:
; Line 1046
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+128]
	mov	DWORD PTR _ptrNext$[ebp], eax
; Line 1047
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31398
$L31399:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L31398:
	cmp	DWORD PTR _i$[ebp], 2
	jge	SHORT $L31400
; Line 1049
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31401
$L31402:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L31401:
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _nBlockHalf$[ebp]
	jge	SHORT $L31403
; Line 1051
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [edx+ecx*2]
	mov	DWORD PTR _l$[ebp], eax
; Line 1052
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L31404
$L31405:
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
$L31404:
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR _nBlockSize$[ebp]
	jge	SHORT $L31406
; Line 1054
	mov	eax, DWORD PTR _ptrNext$[ebp]
	mov	ecx, DWORD PTR _l$[ebp]
	mov	DWORD PTR [eax], ecx
	mov	edx, DWORD PTR _ptrNext$[ebp]
	add	edx, 4
	mov	DWORD PTR _ptrNext$[ebp], edx
; Line 1055
	mov	eax, DWORD PTR _l$[ebp]
	add	eax, DWORD PTR _nBlockSize$[ebp]
	mov	DWORD PTR _l$[ebp], eax
; Line 1056
	jmp	SHORT $L31405
$L31406:
; Line 1057
	jmp	SHORT $L31402
$L31403:
; Line 1058
	jmp	SHORT $L31399
$L31400:
; Line 1061
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+132]
	mov	DWORD PTR _ptrNext$[ebp], edx
; Line 1062
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31407
$L31408:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31407:
	cmp	DWORD PTR _i$[ebp], 2
	jge	SHORT $L31409
; Line 1064
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _j$[ebp], ecx
$L31411:
; Line 1067
	mov	edx, DWORD PTR _j$[ebp]
	mov	DWORD PTR _k$[ebp], edx
; Line 1068
	mov	eax, DWORD PTR _k$[ebp]
	cmp	eax, DWORD PTR _nBlockSize$[ebp]
	jl	SHORT $L31413
; Line 1070
	mov	ecx, DWORD PTR _nBlockSize$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
; Line 1071
	mov	edx, DWORD PTR _j$[ebp]
	sub	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR _nBlockSize$[ebp]
	jl	SHORT $L31414
; Line 1072
	jmp	SHORT $L31412
$L31414:
$L31413:
$L31416:
; Line 1076
	mov	eax, DWORD PTR _j$[ebp]
	sub	eax, DWORD PTR _k$[ebp]
	mov	DWORD PTR _l$[ebp], eax
; Line 1077
	mov	ecx, DWORD PTR _l$[ebp]
	cmp	ecx, DWORD PTR _nBlockSize$[ebp]
	jl	SHORT $L31418
; Line 1078
	jmp	SHORT $L31417
$L31418:
; Line 1079
	mov	edx, DWORD PTR _l$[ebp]
	mov	ecx, DWORD PTR _nBlockDegree$[ebp]
	shl	edx, cl
	add	edx, DWORD PTR _k$[ebp]
	mov	eax, DWORD PTR _ptrNext$[ebp]
	mov	DWORD PTR [eax], edx
	mov	ecx, DWORD PTR _ptrNext$[ebp]
	add	ecx, 4
	mov	DWORD PTR _ptrNext$[ebp], ecx
; Line 1080
	mov	edx, DWORD PTR _k$[ebp]
	sub	edx, 1
	mov	DWORD PTR _k$[ebp], edx
	cmp	DWORD PTR _k$[ebp], 0
	jge	SHORT $L31419
; Line 1081
	jmp	SHORT $L31417
$L31419:
; Line 1082
	jmp	SHORT $L31416
$L31417:
; Line 1083
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 2
	mov	DWORD PTR _j$[ebp], eax
; Line 1084
	jmp	SHORT $L31411
$L31412:
; Line 1085
	jmp	$L31408
$L31409:
; Line 1088
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+136]
	mov	DWORD PTR _ptrNext$[ebp], edx
; Line 1089
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31420
$L31421:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31420:
	cmp	DWORD PTR _i$[ebp], 2
	jge	SHORT $L31422
; Line 1091
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _j$[ebp], ecx
$L31424:
; Line 1094
	mov	edx, DWORD PTR _j$[ebp]
	mov	DWORD PTR _k$[ebp], edx
; Line 1095
	mov	eax, DWORD PTR _k$[ebp]
	cmp	eax, DWORD PTR _nBlockSize$[ebp]
	jl	SHORT $L31426
; Line 1097
	mov	ecx, DWORD PTR _nBlockSize$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
; Line 1098
	mov	edx, DWORD PTR _j$[ebp]
	sub	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR _nBlockSize$[ebp]
	jl	SHORT $L31427
; Line 1099
	jmp	SHORT $L31425
$L31427:
$L31426:
$L31429:
; Line 1103
	mov	eax, DWORD PTR _j$[ebp]
	sub	eax, DWORD PTR _k$[ebp]
	mov	DWORD PTR _l$[ebp], eax
; Line 1104
	mov	ecx, DWORD PTR _l$[ebp]
	cmp	ecx, DWORD PTR _nBlockSize$[ebp]
	jl	SHORT $L31431
; Line 1105
	jmp	SHORT $L31430
$L31431:
; Line 1106
	mov	edx, DWORD PTR _nBlockSize$[ebp]
	sub	edx, DWORD PTR _k$[ebp]
	sub	edx, 1
	mov	ecx, DWORD PTR _nBlockDegree$[ebp]
	shl	edx, cl
	add	edx, DWORD PTR _l$[ebp]
	mov	eax, DWORD PTR _ptrNext$[ebp]
	mov	DWORD PTR [eax], edx
	mov	ecx, DWORD PTR _ptrNext$[ebp]
	add	ecx, 4
	mov	DWORD PTR _ptrNext$[ebp], ecx
; Line 1107
	mov	edx, DWORD PTR _k$[ebp]
	sub	edx, 1
	mov	DWORD PTR _k$[ebp], edx
	cmp	DWORD PTR _k$[ebp], 0
	jge	SHORT $L31432
; Line 1108
	jmp	SHORT $L31430
$L31432:
; Line 1109
	jmp	SHORT $L31429
$L31430:
; Line 1110
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 2
	mov	DWORD PTR _j$[ebp], eax
; Line 1111
	jmp	SHORT $L31424
$L31425:
; Line 1112
	jmp	$L31421
$L31422:
; Line 1113
	mov	esp, ebp
	pop	ebp
	ret	0
?InitializeArrangeTable@ERIDecoder@@IAEXXZ ENDP		; ERIDecoder::InitializeArrangeTable
_this$ = -32
_i$ = -4
_j$ = -12
_k$ = -16
_l$ = -20
_m$ = -24
_ptrTable$ = -8
_ptrNext$ = -28
?InitializeArrangeTableII@ERIDecoder@@IAEXXZ PROC NEAR	; ERIDecoder::InitializeArrangeTableII
; Line 1119
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1124
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	shl	ecx, 2
	shl	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	DWORD PTR _ptrTable$[ebp], eax
; Line 1126
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _ptrTable$[ebp]
	mov	DWORD PTR [edx+124], eax
; Line 1127
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	eax, DWORD PTR _ptrTable$[ebp]
	lea	ecx, DWORD PTR [eax+edx*4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+128], ecx
; Line 1128
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	shl	ecx, 1
	mov	edx, DWORD PTR _ptrTable$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+132], eax
; Line 1129
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+80]
	imul	eax, 3
	mov	ecx, DWORD PTR _ptrTable$[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+136], edx
; Line 1132
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	mov	DWORD PTR _ptrNext$[ebp], edx
; Line 1133
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31445
$L31446:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31445:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+80]
	jae	SHORT $L31447
; Line 1135
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrNext$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx+eax*4], edx
; Line 1136
	jmp	SHORT $L31446
$L31447:
; Line 1139
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	mov	DWORD PTR _ptrNext$[ebp], ecx
; Line 1140
	mov	DWORD PTR _l$[ebp], 0
; Line 1141
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31448
$L31449:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31448:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+84]
	jae	SHORT $L31450
; Line 1143
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31451
$L31452:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L31451:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+72]
	jae	SHORT $L31453
; Line 1145
	mov	edx, DWORD PTR _l$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	DWORD PTR _m$[ebp], edx
; Line 1146
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L31454
$L31455:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L31454:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR [ecx+72]
	jae	SHORT $L31456
; Line 1148
	mov	eax, DWORD PTR _ptrNext$[ebp]
	mov	ecx, DWORD PTR _m$[ebp]
	mov	DWORD PTR [eax], ecx
	mov	edx, DWORD PTR _ptrNext$[ebp]
	add	edx, 4
	mov	DWORD PTR _ptrNext$[ebp], edx
; Line 1149
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _m$[ebp]
	add	ecx, DWORD PTR [eax+72]
	mov	DWORD PTR _m$[ebp], ecx
; Line 1150
	jmp	SHORT $L31455
$L31456:
; Line 1151
	jmp	SHORT $L31452
$L31453:
; Line 1152
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _l$[ebp]
	add	eax, DWORD PTR [edx+76]
	mov	DWORD PTR _l$[ebp], eax
; Line 1153
	jmp	$L31449
$L31450:
; Line 1156
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+132]
	mov	DWORD PTR _ptrNext$[ebp], edx
; Line 1157
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31457
$L31458:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31457:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+76]
	jae	SHORT $L31459
; Line 1159
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _k$[ebp], eax
; Line 1160
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31460
$L31461:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L31460:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+84]
	jae	SHORT $L31462
; Line 1162
	mov	ecx, DWORD PTR _ptrNext$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	mov	DWORD PTR [ecx], edx
	mov	eax, DWORD PTR _ptrNext$[ebp]
	add	eax, 4
	mov	DWORD PTR _ptrNext$[ebp], eax
; Line 1163
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, DWORD PTR [ecx+76]
	mov	DWORD PTR _k$[ebp], edx
; Line 1164
	jmp	SHORT $L31461
$L31462:
; Line 1165
	jmp	SHORT $L31458
$L31459:
; Line 1168
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+136]
	mov	DWORD PTR _ptrNext$[ebp], ecx
; Line 1169
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31463
$L31464:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31463:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+72]
	jae	SHORT $L31465
; Line 1171
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _l$[ebp], edx
; Line 1172
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31466
$L31467:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L31466:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+72]
	jae	SHORT $L31468
; Line 1174
	mov	eax, DWORD PTR _l$[ebp]
	mov	DWORD PTR _m$[ebp], eax
; Line 1175
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _l$[ebp]
	add	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR _l$[ebp], edx
; Line 1176
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L31469
$L31470:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L31469:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR [ecx+84]
	jae	SHORT $L31471
; Line 1178
	mov	eax, DWORD PTR _ptrNext$[ebp]
	mov	ecx, DWORD PTR _m$[ebp]
	mov	DWORD PTR [eax], ecx
	mov	edx, DWORD PTR _ptrNext$[ebp]
	add	edx, 4
	mov	DWORD PTR _ptrNext$[ebp], edx
; Line 1179
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _m$[ebp]
	add	ecx, DWORD PTR [eax+76]
	mov	DWORD PTR _m$[ebp], ecx
; Line 1180
	jmp	SHORT $L31470
$L31471:
; Line 1181
	jmp	SHORT $L31467
$L31468:
; Line 1182
	jmp	$L31464
$L31465:
; Line 1183
	mov	esp, ebp
	pop	ebp
	ret	0
?InitializeArrangeTableII@ERIDecoder@@IAEXXZ ENDP	; ERIDecoder::InitializeArrangeTableII
$T32078 = -136
$T32079 = -140
$T32081 = -144
$T32082 = -148
_imginf$ = 8
_context$ = 12
_this$ = -152
_pfnRestore$ = -52
_i$ = -36
_j$ = -40
_k$ = -48
_nWidthSamples$ = -4
_fOpTable$ = -12
_fEncodeType$ = -32
_fReserved$ = -44
_nBitCount$ = -56
_nOpCodeLen$ = -8
_pNextOperation$ = -24
_nAllBlockCount$31502 = -64
_nPosX$ = -16
_nPosY$ = -20
_nAllBlockLines$ = -60
_nRestHeight$ = -28
_nColumnBufSamples$31522 = -76
_ptrDstLine$31527 = -80
_nBlockHeight$31528 = -84
_nRestWidth$31531 = -68
_ptrNextLineBuf$31533 = -72
_nOperationCode$31538 = -104
_nColorOperation$31539 = -88
_nArrangeCode$31548 = -112
_pArrange$31555 = -116
_k$31560 = -120
_ptrNextBuf$31566 = -96
_ptrNextColBuf$31567 = -92
_nLastVal$31571 = -124
_ptrLastLine$31580 = -128
_ptrCurrentLine$31585 = -132
_nBlockWidth$31594 = -100
_flgContinue$31597 = -108
?DecodeTrueColorImage@ERIDecoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@@Z PROC NEAR ; ERIDecoder::DecodeTrueColorImage
; Line 1190
	push	ebp
	mov	ebp, esp
	sub	esp, 152				; 00000098H
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1193
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	shr	ecx, 3
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+96], ecx
; Line 1195
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+16]
	mov	DWORD PTR _pfnRestore$[ebp], eax
; Line 1196
	cmp	DWORD PTR _pfnRestore$[ebp], 0
	jne	SHORT $L31478
; Line 1197
	mov	eax, 1
	jmp	$L31475
$L31478:
; Line 1202
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+88]
	mov	ecx, DWORD PTR [ecx+56]
	shl	edx, cl
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+84]
	imul	ecx, edx
	mov	DWORD PTR _nWidthSamples$[ebp], ecx
; Line 1203
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31483
$L31484:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31483:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nWidthSamples$[ebp]
	jge	SHORT $L31485
; Line 1205
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR [edx+eax*4], 0
; Line 1206
	jmp	SHORT $L31484
$L31485:
; Line 1211
	push	8
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	DWORD PTR _fOpTable$[ebp], eax
; Line 1212
	push	8
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	DWORD PTR _fEncodeType$[ebp], eax
; Line 1213
	push	8
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	DWORD PTR _fReserved$[ebp], eax
; Line 1214
	mov	DWORD PTR _nBitCount$[ebp], 0
; Line 1215
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+12], 32			; 00000020H
	jne	SHORT $L31490
; Line 1217
	cmp	DWORD PTR _fOpTable$[ebp], 0
	jne	SHORT $L31492
	cmp	DWORD PTR _fReserved$[ebp], 0
	je	SHORT $L31491
$L31492:
; Line 1219
	mov	eax, 1
	jmp	$L31475
$L31491:
; Line 1221
	mov	edx, DWORD PTR _fEncodeType$[ebp]
	mov	DWORD PTR _nBitCount$[ebp], edx
; Line 1222
	mov	DWORD PTR _fEncodeType$[ebp], 1
; Line 1224
	jmp	SHORT $L31493
$L31490:
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+12], -1
	jne	SHORT $L31494
; Line 1227
	cmp	DWORD PTR _fOpTable$[ebp], 0
	jne	SHORT $L31496
	mov	ecx, DWORD PTR _fEncodeType$[ebp]
	and	ecx, 254				; 000000feH
	test	ecx, ecx
	jne	SHORT $L31496
	cmp	DWORD PTR _fReserved$[ebp], 0
	je	SHORT $L31495
$L31496:
; Line 1229
	mov	eax, 1
	jmp	$L31475
$L31495:
; Line 1232
	jmp	SHORT $L31497
$L31494:
; Line 1234
	mov	eax, 1
	jmp	$L31475
$L31497:
$L31493:
; Line 1238
	mov	DWORD PTR _nOpCodeLen$[ebp], 4
; Line 1239
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+120], 0
	je	SHORT $L31499
; Line 1241
	mov	DWORD PTR _nOpCodeLen$[ebp], 6
$L31499:
; Line 1243
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	mov	DWORD PTR _pNextOperation$[ebp], ecx
; Line 1244
	mov	edx, DWORD PTR _fEncodeType$[ebp]
	and	edx, 1
	test	edx, edx
	je	SHORT $L31501
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+84], 3
	jb	SHORT $L31501
; Line 1246
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [ecx+88]
	imul	eax, DWORD PTR [edx+92]
	mov	DWORD PTR _nAllBlockCount$31502[ebp], eax
; Line 1247
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31504
$L31505:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L31504:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nAllBlockCount$31502[ebp]
	jge	SHORT $L31506
; Line 1249
	mov	eax, DWORD PTR _nOpCodeLen$[ebp]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [edx+ecx], al
; Line 1250
	jmp	SHORT $L31505
$L31506:
$L31501:
; Line 1254
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetABit@RLHDecodeContext@@QAEHXZ	; RLHDecodeContext::GetABit
	test	eax, eax
	je	SHORT $L31508
; Line 1256
	mov	eax, 1
	jmp	$L31475
$L31508:
; Line 1258
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+12], 32			; 00000020H
	jne	SHORT $L31509
; Line 1260
	mov	eax, DWORD PTR _nBitCount$[ebp]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	call	?PrepareToDecodeArithmeticCode@RLHDecodeContext@@QAEXH@Z ; RLHDecodeContext::PrepareToDecodeArithmeticCode
; Line 1262
	jmp	SHORT $L31510
$L31509:
; Line 1264
	mov	ecx, DWORD PTR _fEncodeType$[ebp]
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L31511
; Line 1266
	mov	ecx, DWORD PTR _context$[ebp]
	call	?Initialize@RLHDecodeContext@@QAEXXZ	; RLHDecodeContext::Initialize
$L31511:
$L31510:
; Line 1271
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+72]
	imul	ecx, DWORD PTR [eax+84]
	mov	DWORD PTR _nAllBlockLines$[ebp], ecx
; Line 1272
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	DWORD PTR _nRestHeight$[ebp], eax
; Line 1274
	mov	DWORD PTR _nPosY$[ebp], 0
	jmp	SHORT $L31519
$L31520:
	mov	ecx, DWORD PTR _nPosY$[ebp]
	add	ecx, 1
	mov	DWORD PTR _nPosY$[ebp], ecx
$L31519:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nPosY$[ebp]
	cmp	eax, DWORD PTR [edx+92]
	jge	$L31521
; Line 1278
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [ecx+72]
	imul	eax, DWORD PTR [edx+84]
	mov	DWORD PTR _nColumnBufSamples$31522[ebp], eax
; Line 1279
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31524
$L31525:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L31524:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nColumnBufSamples$31522[ebp]
	jge	SHORT $L31526
; Line 1281
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+104]
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx+edx*4], 0
; Line 1282
	jmp	SHORT $L31525
$L31526:
; Line 1286
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR _nPosY$[ebp]
	imul	edx, DWORD PTR [eax+20]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	shl	edx, cl
	mov	ecx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [ecx+4]
	add	eax, edx
	mov	DWORD PTR _ptrDstLine$31527[ebp], eax
; Line 1287
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR _nBlockHeight$31528[ebp], edx
; Line 1288
	mov	eax, DWORD PTR _nBlockHeight$31528[ebp]
	cmp	eax, DWORD PTR _nRestHeight$[ebp]
	jle	SHORT $L31530
; Line 1289
	mov	ecx, DWORD PTR _nRestHeight$[ebp]
	mov	DWORD PTR _nBlockHeight$31528[ebp], ecx
$L31530:
; Line 1291
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR _nRestWidth$31531[ebp], eax
; Line 1292
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	DWORD PTR _ptrNextLineBuf$31533[ebp], edx
; Line 1294
	mov	DWORD PTR _nPosX$[ebp], 0
	jmp	SHORT $L31535
$L31536:
	mov	eax, DWORD PTR _nPosX$[ebp]
	add	eax, 1
	mov	DWORD PTR _nPosX$[ebp], eax
$L31535:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nPosX$[ebp]
	cmp	edx, DWORD PTR [ecx+88]
	jge	$L31537
; Line 1300
	mov	eax, DWORD PTR _fEncodeType$[ebp]
	and	eax, 1
	test	eax, eax
	jne	SHORT $L31540
; Line 1302
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+84], 3
	jb	SHORT $L31541
; Line 1303
	mov	edx, DWORD PTR _nOpCodeLen$[ebp]
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	DWORD PTR _nOperationCode$31538[ebp], eax
$L31541:
; Line 1304
	mov	ecx, DWORD PTR _context$[ebp]
	call	?Initialize@RLHDecodeContext@@QAEXXZ	; RLHDecodeContext::Initialize
; Line 1306
	jmp	SHORT $L31542
$L31540:
; Line 1308
	mov	eax, DWORD PTR _pNextOperation$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	mov	DWORD PTR _nOperationCode$31538[ebp], ecx
	mov	edx, DWORD PTR _pNextOperation$[ebp]
	add	edx, 1
	mov	DWORD PTR _pNextOperation$[ebp], edx
$L31542:
; Line 1310
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+120], 0
	je	SHORT $L31544
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+84], 3
	jae	SHORT $L31543
$L31544:
; Line 1315
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	DWORD PTR $T32079[ebp], eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	mov	DWORD PTR $T32078[ebp], edx
	mov	eax, DWORD PTR $T32079[ebp]
	push	eax
	mov	ecx, DWORD PTR $T32078[ebp]
	push	ecx
	mov	ecx, DWORD PTR _context$[ebp]
	mov	edx, DWORD PTR _context$[ebp]
	call	DWORD PTR [edx+2120]
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	eax, DWORD PTR [ecx+80]
	jae	SHORT $L31545
; Line 1317
	mov	eax, 1
	jmp	$L31475
$L31545:
; Line 1319
	mov	edx, DWORD PTR _nOperationCode$31538[ebp]
	mov	DWORD PTR _nColorOperation$31539[ebp], edx
; Line 1321
	jmp	$L31546
$L31543:
; Line 1326
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR $T32082[ebp], ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+116]
	mov	DWORD PTR $T32081[ebp], eax
	mov	ecx, DWORD PTR $T32082[ebp]
	push	ecx
	mov	edx, DWORD PTR $T32081[ebp]
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	mov	eax, DWORD PTR _context$[ebp]
	call	DWORD PTR [eax+2120]
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	eax, DWORD PTR [ecx+80]
	jae	SHORT $L31547
; Line 1328
	mov	eax, 1
	jmp	$L31475
$L31547:
; Line 1334
	mov	edx, DWORD PTR _nOperationCode$31538[ebp]
	mov	eax, DWORD PTR ?m_opcCodeTable@ERIDecoder@@1PBUOPERATION_CODE_II@1@B[edx*8]
	mov	DWORD PTR _nColorOperation$31539[ebp], eax
; Line 1336
	mov	ecx, DWORD PTR _nOperationCode$31538[ebp]
	mov	edx, DWORD PTR ?m_opcCodeTable@ERIDecoder@@1PBUOPERATION_CODE_II@1@B[ecx*8+4]
	mov	DWORD PTR _nArrangeCode$31548[ebp], edx
; Line 1338
	cmp	DWORD PTR _nArrangeCode$31548[ebp], 0
	jne	SHORT $L31549
; Line 1340
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31551
$L31552:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31551:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+80]
	jge	SHORT $L31553
; Line 1342
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+116]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+112]
	mov	edx, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR [ecx+esi*4]
	mov	DWORD PTR [eax+edx*4], ecx
; Line 1343
	jmp	SHORT $L31552
$L31553:
; Line 1345
	jmp	$L31554
$L31549:
; Line 1347
	mov	edx, DWORD PTR _nArrangeCode$31548[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+edx*4+120]
	mov	DWORD PTR _pArrange$31555[ebp], ecx
; Line 1348
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31557
$L31558:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31557:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+84]
	jge	SHORT $L31559
; Line 1350
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, DWORD PTR [edx+76]
	mov	DWORD PTR _k$31560[ebp], eax
; Line 1351
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31562
$L31563:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L31562:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+76]
	jge	SHORT $L31564
; Line 1353
	mov	ecx, DWORD PTR _k$31560[ebp]
	add	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+116]
	mov	edx, DWORD PTR _j$[ebp]
	mov	esi, DWORD PTR _pArrange$31555[ebp]
	mov	edi, DWORD PTR _k$31560[ebp]
	add	edi, DWORD PTR [esi+edx*4]
	mov	edx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [edx+112]
	mov	eax, DWORD PTR [eax+ecx*4]
	mov	DWORD PTR [edx+edi*4], eax
; Line 1354
	jmp	SHORT $L31563
$L31564:
; Line 1355
	jmp	SHORT $L31558
$L31559:
$L31554:
$L31546:
; Line 1360
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+84], 3
	jb	SHORT $L31565
; Line 1362
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nColorOperation$31539[ebp]
	call	DWORD PTR ?m_pfnColorOperation@ERIDecoder@@1PAP81@AEXXZA[edx*4]
$L31565:
; Line 1366
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	mov	DWORD PTR _ptrNextBuf$31566[ebp], ecx
; Line 1367
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+104]
	mov	DWORD PTR _ptrNextColBuf$31567[ebp], eax
; Line 1368
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31568
$L31569:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L31568:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nAllBlockLines$[ebp]
	jge	SHORT $L31570
; Line 1370
	mov	eax, DWORD PTR _ptrNextColBuf$31567[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _nLastVal$31571[ebp], ecx
; Line 1371
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31573
$L31574:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L31573:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+72]
	jge	SHORT $L31575
; Line 1373
	mov	edx, DWORD PTR _ptrNextBuf$31566[ebp]
	mov	eax, DWORD PTR _nLastVal$31571[ebp]
	add	eax, DWORD PTR [edx]
	mov	DWORD PTR _nLastVal$31571[ebp], eax
; Line 1374
	mov	ecx, DWORD PTR _ptrNextBuf$31566[ebp]
	mov	edx, DWORD PTR _nLastVal$31571[ebp]
	mov	DWORD PTR [ecx], edx
	mov	eax, DWORD PTR _ptrNextBuf$31566[ebp]
	add	eax, 4
	mov	DWORD PTR _ptrNextBuf$31566[ebp], eax
; Line 1375
	jmp	SHORT $L31574
$L31575:
; Line 1376
	mov	ecx, DWORD PTR _ptrNextColBuf$31567[ebp]
	mov	edx, DWORD PTR _nLastVal$31571[ebp]
	mov	DWORD PTR [ecx], edx
	mov	eax, DWORD PTR _ptrNextColBuf$31567[ebp]
	add	eax, 4
	mov	DWORD PTR _ptrNextColBuf$31567[ebp], eax
; Line 1377
	jmp	SHORT $L31569
$L31570:
; Line 1380
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	mov	DWORD PTR _ptrNextBuf$31566[ebp], edx
; Line 1381
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L31577
$L31578:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L31577:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	cmp	edx, DWORD PTR [ecx+84]
	jge	$L31579
; Line 1383
	mov	eax, DWORD PTR _ptrNextLineBuf$31533[ebp]
	mov	DWORD PTR _ptrLastLine$31580[ebp], eax
; Line 1384
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31582
$L31583:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L31582:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx+72]
	jge	SHORT $L31584
; Line 1386
	mov	ecx, DWORD PTR _ptrNextBuf$31566[ebp]
	mov	DWORD PTR _ptrCurrentLine$31585[ebp], ecx
; Line 1387
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31587
$L31588:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L31587:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR [eax+72]
	jge	SHORT $L31589
; Line 1389
	mov	edx, DWORD PTR _ptrNextBuf$31566[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _ptrLastLine$31580[ebp]
	add	eax, DWORD PTR [ecx]
	mov	edx, DWORD PTR _ptrNextBuf$31566[ebp]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR _ptrLastLine$31580[ebp]
	add	eax, 4
	mov	DWORD PTR _ptrLastLine$31580[ebp], eax
	mov	ecx, DWORD PTR _ptrNextBuf$31566[ebp]
	add	ecx, 4
	mov	DWORD PTR _ptrNextBuf$31566[ebp], ecx
; Line 1390
	jmp	SHORT $L31588
$L31589:
; Line 1391
	mov	edx, DWORD PTR _ptrCurrentLine$31585[ebp]
	mov	DWORD PTR _ptrLastLine$31580[ebp], edx
; Line 1392
	jmp	SHORT $L31583
$L31584:
; Line 1393
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31591
$L31592:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L31591:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+72]
	jge	SHORT $L31593
; Line 1395
	mov	eax, DWORD PTR _ptrNextLineBuf$31533[ebp]
	mov	ecx, DWORD PTR _ptrLastLine$31580[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [eax], edx
	mov	eax, DWORD PTR _ptrNextLineBuf$31533[ebp]
	add	eax, 4
	mov	DWORD PTR _ptrNextLineBuf$31533[ebp], eax
	mov	ecx, DWORD PTR _ptrLastLine$31580[ebp]
	add	ecx, 4
	mov	DWORD PTR _ptrLastLine$31580[ebp], ecx
; Line 1396
	jmp	SHORT $L31592
$L31593:
; Line 1397
	jmp	$L31578
$L31579:
; Line 1400
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	mov	DWORD PTR _nBlockWidth$31594[ebp], eax
; Line 1401
	mov	ecx, DWORD PTR _nBlockWidth$31594[ebp]
	cmp	ecx, DWORD PTR _nRestWidth$31531[ebp]
	jle	SHORT $L31596
; Line 1402
	mov	edx, DWORD PTR _nRestWidth$31531[ebp]
	mov	DWORD PTR _nBlockWidth$31594[ebp], edx
$L31596:
; Line 1404
	mov	eax, DWORD PTR _nBlockHeight$31528[ebp]
	push	eax
	mov	ecx, DWORD PTR _nBlockWidth$31594[ebp]
	push	ecx
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx+20]
	push	eax
	mov	ecx, DWORD PTR _ptrDstLine$31527[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR _pfnRestore$[ebp]
; Line 1407
	mov	edx, DWORD PTR _nPosX$[ebp]
	push	edx
	mov	eax, DWORD PTR _nPosY$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+24]
	mov	DWORD PTR _flgContinue$31597[ebp], eax
; Line 1408
	cmp	DWORD PTR _flgContinue$31597[ebp], 0
	je	SHORT $L31598
; Line 1409
	mov	eax, DWORD PTR _flgContinue$31597[ebp]
	jmp	SHORT $L31475
$L31598:
; Line 1412
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+96]
	mov	ecx, DWORD PTR [ecx+56]
	shl	edx, cl
	mov	eax, DWORD PTR _ptrDstLine$31527[ebp]
	add	eax, edx
	mov	DWORD PTR _ptrDstLine$31527[ebp], eax
; Line 1413
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nRestWidth$31531[ebp]
	sub	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR _nRestWidth$31531[ebp], edx
; Line 1414
	jmp	$L31536
$L31537:
; Line 1416
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nRestHeight$[ebp]
	sub	ecx, DWORD PTR [eax+72]
	mov	DWORD PTR _nRestHeight$[ebp], ecx
; Line 1417
	jmp	$L31520
$L31521:
; Line 1419
	xor	eax, eax
$L31475:
; Line 1420
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
?DecodeTrueColorImage@ERIDecoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@@Z ENDP ; ERIDecoder::DecodeTrueColorImage
_TEXT	ENDS
EXTRN	?GetAHuffmanCode@RLHDecodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@@Z:NEAR ; RLHDecodeContext::GetAHuffmanCode
EXTRN	?DecodeERINACodes@RLHDecodeContext@@QAEKPAHK@Z:NEAR ; RLHDecodeContext::DecodeERINACodes
EXTRN	?PerformOperation@ERIDecoder@@IAEXKJPAPAH@Z:NEAR ; ERIDecoder::PerformOperation
_TEXT	SEGMENT
_imginf$ = 8
_context$ = 12
_this$ = -84
_pfnRestore$ = -36
_i$ = -32
_nWidthSamples$ = -4
_fOpTable$ = -8
_fEncodeType$ = -28
_nBitCount$ = -40
_pNextOperation$ = -20
_nAllBlockCount$31622 = -48
_nPosX$ = -12
_nPosY$ = -16
_nAllBlockLines$ = -44
_nRestHeight$ = -24
_nColumnBufSamples$31639 = -60
_ptrDstLine$31644 = -64
_nBlockHeight$31645 = -68
_nRestWidth$31648 = -52
_ptrNextLineBuf$31650 = -56
_dwOperationCode$31655 = -72
_nBlockWidth$31659 = -76
_flgContinue$31662 = -80
?DecodeTrueColorImageII@ERIDecoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@@Z PROC NEAR ; ERIDecoder::DecodeTrueColorImageII
; Line 1427
	push	ebp
	mov	ebp, esp
	sub	esp, 84					; 00000054H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1432
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+84], 3
	jb	SHORT $L31606
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+120], 2
	jne	SHORT $L31606
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+12], -4			; fffffffcH
	je	SHORT $L31605
$L31606:
; Line 1434
	mov	eax, 1
	jmp	$L31604
$L31605:
; Line 1438
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	shr	ecx, 3
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+96], ecx
; Line 1440
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+16]
	mov	DWORD PTR _pfnRestore$[ebp], eax
; Line 1441
	cmp	DWORD PTR _pfnRestore$[ebp], 0
	jne	SHORT $L31609
; Line 1442
	mov	eax, 1
	jmp	$L31604
$L31609:
; Line 1447
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+88]
	mov	ecx, DWORD PTR [ecx+56]
	shl	edx, cl
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+84]
	imul	ecx, edx
	mov	DWORD PTR _nWidthSamples$[ebp], ecx
; Line 1448
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31612
$L31613:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31612:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _nWidthSamples$[ebp]
	jge	SHORT $L31614
; Line 1450
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR [edx+eax*4], 0
; Line 1451
	jmp	SHORT $L31613
$L31614:
; Line 1456
	push	8
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	DWORD PTR _fOpTable$[ebp], eax
; Line 1457
	push	8
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	DWORD PTR _fEncodeType$[ebp], eax
; Line 1458
	push	8
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	DWORD PTR _nBitCount$[ebp], eax
; Line 1459
	cmp	DWORD PTR _fOpTable$[ebp], 0
	jne	SHORT $L31619
	mov	ecx, DWORD PTR _fEncodeType$[ebp]
	and	ecx, 254				; 000000feH
	test	ecx, ecx
	jne	SHORT $L31619
	cmp	DWORD PTR _nBitCount$[ebp], 8
	je	SHORT $L31618
$L31619:
; Line 1461
	mov	eax, 1
	jmp	$L31604
$L31618:
; Line 1465
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+140]
	call	?Initialize@ERINA_HUFFMAN_TREE@@QAEXXZ	; ERINA_HUFFMAN_TREE::Initialize
; Line 1466
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	mov	DWORD PTR _pNextOperation$[ebp], ecx
; Line 1467
	mov	edx, DWORD PTR _fEncodeType$[ebp]
	and	edx, 1
	test	edx, edx
	je	SHORT $L31621
; Line 1469
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+88]
	imul	edx, DWORD PTR [ecx+92]
	mov	DWORD PTR _nAllBlockCount$31622[ebp], edx
; Line 1470
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31624
$L31625:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31624:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _nAllBlockCount$31622[ebp]
	jge	SHORT $L31626
; Line 1473
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+140]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetAHuffmanCode@RLHDecodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@@Z ; RLHDecodeContext::GetAHuffmanCode
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [edx+ecx], al
; Line 1474
	jmp	SHORT $L31625
$L31626:
$L31621:
; Line 1478
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetABit@RLHDecodeContext@@QAEHXZ	; RLHDecodeContext::GetABit
	test	eax, eax
	je	SHORT $L31628
; Line 1480
	mov	eax, 1
	jmp	$L31604
$L31628:
; Line 1482
	mov	ecx, DWORD PTR _context$[ebp]
	call	?PrepareToDecodeERINACode@RLHDecodeContext@@QAEXXZ ; RLHDecodeContext::PrepareToDecodeERINACode
; Line 1485
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+72]
	imul	ecx, DWORD PTR [eax+84]
	mov	DWORD PTR _nAllBlockLines$[ebp], ecx
; Line 1486
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	DWORD PTR _nRestHeight$[ebp], eax
; Line 1488
	mov	DWORD PTR _nPosY$[ebp], 0
	jmp	SHORT $L31636
$L31637:
	mov	ecx, DWORD PTR _nPosY$[ebp]
	add	ecx, 1
	mov	DWORD PTR _nPosY$[ebp], ecx
$L31636:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nPosY$[ebp]
	cmp	eax, DWORD PTR [edx+92]
	jge	$L31638
; Line 1492
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [ecx+72]
	imul	eax, DWORD PTR [edx+84]
	mov	DWORD PTR _nColumnBufSamples$31639[ebp], eax
; Line 1493
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31641
$L31642:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L31641:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _nColumnBufSamples$31639[ebp]
	jge	SHORT $L31643
; Line 1495
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+104]
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR [ecx+edx*4], 0
; Line 1496
	jmp	SHORT $L31642
$L31643:
; Line 1500
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR _nPosY$[ebp]
	imul	edx, DWORD PTR [eax+20]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	shl	edx, cl
	mov	ecx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [ecx+4]
	add	eax, edx
	mov	DWORD PTR _ptrDstLine$31644[ebp], eax
; Line 1501
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR _nBlockHeight$31645[ebp], edx
; Line 1502
	mov	eax, DWORD PTR _nBlockHeight$31645[ebp]
	cmp	eax, DWORD PTR _nRestHeight$[ebp]
	jle	SHORT $L31647
; Line 1503
	mov	ecx, DWORD PTR _nRestHeight$[ebp]
	mov	DWORD PTR _nBlockHeight$31645[ebp], ecx
$L31647:
; Line 1505
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR _nRestWidth$31648[ebp], eax
; Line 1506
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	mov	DWORD PTR _ptrNextLineBuf$31650[ebp], edx
; Line 1508
	mov	DWORD PTR _nPosX$[ebp], 0
	jmp	SHORT $L31652
$L31653:
	mov	eax, DWORD PTR _nPosX$[ebp]
	add	eax, 1
	mov	DWORD PTR _nPosX$[ebp], eax
$L31652:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nPosX$[ebp]
	cmp	edx, DWORD PTR [ecx+88]
	jge	$L31654
; Line 1513
	mov	eax, DWORD PTR _fEncodeType$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L31656
; Line 1515
	mov	ecx, DWORD PTR _pNextOperation$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx]
	mov	DWORD PTR _dwOperationCode$31655[ebp], edx
	mov	eax, DWORD PTR _pNextOperation$[ebp]
	add	eax, 1
	mov	DWORD PTR _pNextOperation$[ebp], eax
; Line 1517
	jmp	SHORT $L31657
$L31656:
; Line 1520
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+140]
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetAHuffmanCode@RLHDecodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@@Z ; RLHDecodeContext::GetAHuffmanCode
	mov	DWORD PTR _dwOperationCode$31655[ebp], eax
$L31657:
; Line 1523
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+116]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	call	?DecodeERINACodes@RLHDecodeContext@@QAEKPAHK@Z ; RLHDecodeContext::DecodeERINACodes
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	eax, DWORD PTR [ecx+80]
	jae	SHORT $L31658
; Line 1525
	mov	eax, 1
	jmp	$L31604
$L31658:
; Line 1530
	lea	edx, DWORD PTR _ptrNextLineBuf$31650[ebp]
	push	edx
	mov	eax, DWORD PTR _nAllBlockLines$[ebp]
	push	eax
	mov	ecx, DWORD PTR _dwOperationCode$31655[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?PerformOperation@ERIDecoder@@IAEXKJPAPAH@Z ; ERIDecoder::PerformOperation
; Line 1533
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	mov	DWORD PTR _nBlockWidth$31659[ebp], eax
; Line 1534
	mov	ecx, DWORD PTR _nBlockWidth$31659[ebp]
	cmp	ecx, DWORD PTR _nRestWidth$31648[ebp]
	jle	SHORT $L31661
; Line 1535
	mov	edx, DWORD PTR _nRestWidth$31648[ebp]
	mov	DWORD PTR _nBlockWidth$31659[ebp], edx
$L31661:
; Line 1537
	mov	eax, DWORD PTR _nBlockHeight$31645[ebp]
	push	eax
	mov	ecx, DWORD PTR _nBlockWidth$31659[ebp]
	push	ecx
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx+20]
	push	eax
	mov	ecx, DWORD PTR _ptrDstLine$31644[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR _pfnRestore$[ebp]
; Line 1540
	mov	edx, DWORD PTR _nPosX$[ebp]
	push	edx
	mov	eax, DWORD PTR _nPosY$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+24]
	mov	DWORD PTR _flgContinue$31662[ebp], eax
; Line 1541
	cmp	DWORD PTR _flgContinue$31662[ebp], 0
	je	SHORT $L31663
; Line 1542
	mov	eax, DWORD PTR _flgContinue$31662[ebp]
	jmp	SHORT $L31604
$L31663:
; Line 1545
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+96]
	mov	ecx, DWORD PTR [ecx+56]
	shl	edx, cl
	mov	eax, DWORD PTR _ptrDstLine$31644[ebp]
	add	eax, edx
	mov	DWORD PTR _ptrDstLine$31644[ebp], eax
; Line 1546
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nRestWidth$31648[ebp]
	sub	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR _nRestWidth$31648[ebp], edx
; Line 1547
	jmp	$L31653
$L31654:
; Line 1549
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nRestHeight$[ebp]
	sub	ecx, DWORD PTR [eax+72]
	mov	DWORD PTR _nRestHeight$[ebp], ecx
; Line 1550
	jmp	$L31637
$L31638:
; Line 1552
	xor	eax, eax
$L31604:
; Line 1553
	mov	esp, ebp
	pop	ebp
	ret	8
?DecodeTrueColorImageII@ERIDecoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@@Z ENDP ; ERIDecoder::DecodeTrueColorImageII
_TEXT	ENDS
EXTRN	?DecodeRLMTFGCodes@RLHDecodeContext@@QAEKPAEK@Z:NEAR ; RLHDecodeContext::DecodeRLMTFGCodes
EXTRN	?DecodeERINACodes256@RLHDecodeContext@@QAEKPAEK@Z:NEAR ; RLHDecodeContext::DecodeERINACodes256
_TEXT	SEGMENT
$T32084 = -36
_imginf$ = 8
_context$ = 12
_this$ = -40
_fReserved$ = -24
_nLine$ = -4
_nHeight$ = -20
_ptrDstLine$ = -12
_nImageWidth$ = -16
_nBytesPerLine$ = -8
_i$31693 = -32
_flgContinue$31703 = -28
?DecodePaletteImage@ERIDecoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@@Z PROC NEAR ; ERIDecoder::DecodePaletteImage
; Line 1560
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1563
	mov	eax, DWORD PTR _imginf$[ebp]
	cmp	DWORD PTR [eax+16], 8
	je	SHORT $L31670
; Line 1564
	mov	eax, 1
	jmp	$L31669
$L31670:
; Line 1567
	push	24					; 00000018H
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	DWORD PTR _fReserved$[ebp], eax
; Line 1568
	cmp	DWORD PTR _fReserved$[ebp], 0
	je	SHORT $L31672
; Line 1569
	mov	eax, 1
	jmp	$L31669
$L31672:
; Line 1572
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+12], 32			; 00000020H
	jne	SHORT $L31673
; Line 1574
	push	8
	mov	ecx, DWORD PTR _context$[ebp]
	call	?PrepareToDecodeArithmeticCode@RLHDecodeContext@@QAEXH@Z ; RLHDecodeContext::PrepareToDecodeArithmeticCode
; Line 1575
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+112], 0
	je	SHORT $L31674
; Line 1576
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	push	ecx
	call	?eriFreeMemory@@YAXPAX@Z		; eriFreeMemory
	add	esp, 4
$L31674:
; Line 1578
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx+8]
	shl	eax, 2
	push	eax
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+112], eax
; Line 1580
	jmp	SHORT $L31677
$L31673:
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+12], -1
	jne	SHORT $L31678
; Line 1582
	mov	ecx, DWORD PTR _context$[ebp]
	call	?PrepareToDecodeRLMTFGCode@RLHDecodeContext@@QAEXXZ ; RLHDecodeContext::PrepareToDecodeRLMTFGCode
; Line 1584
	jmp	SHORT $L31679
$L31678:
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+12], -4			; fffffffcH
	jne	SHORT $L31680
; Line 1586
	mov	ecx, DWORD PTR _context$[ebp]
	call	?PrepareToDecodeERINACode@RLHDecodeContext@@QAEXXZ ; RLHDecodeContext::PrepareToDecodeERINACode
; Line 1588
	jmp	SHORT $L31681
$L31680:
; Line 1590
	mov	eax, 1
	jmp	$L31669
$L31681:
$L31679:
$L31677:
; Line 1595
	mov	ecx, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR _nHeight$[ebp], edx
; Line 1596
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _ptrDstLine$[ebp], ecx
; Line 1597
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR _nImageWidth$[ebp], eax
; Line 1598
	mov	ecx, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	mov	DWORD PTR _nBytesPerLine$[ebp], edx
; Line 1600
	mov	DWORD PTR _nLine$[ebp], 0
	jmp	SHORT $L31688
$L31689:
	mov	eax, DWORD PTR _nLine$[ebp]
	add	eax, 1
	mov	DWORD PTR _nLine$[ebp], eax
$L31688:
	mov	ecx, DWORD PTR _nLine$[ebp]
	cmp	ecx, DWORD PTR _nHeight$[ebp]
	jge	$L31690
; Line 1602
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+12], 32			; 00000020H
	jne	SHORT $L31691
; Line 1607
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	mov	DWORD PTR $T32084[ebp], ecx
	mov	edx, DWORD PTR _nImageWidth$[ebp]
	push	edx
	mov	eax, DWORD PTR $T32084[ebp]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	mov	edx, DWORD PTR _context$[ebp]
	call	DWORD PTR [edx+2120]
	cmp	eax, DWORD PTR _nImageWidth$[ebp]
	jae	SHORT $L31692
; Line 1609
	mov	eax, 1
	jmp	$L31669
$L31692:
; Line 1612
	mov	DWORD PTR _i$31693[ebp], 0
	jmp	SHORT $L31694
$L31695:
	mov	eax, DWORD PTR _i$31693[ebp]
	add	eax, 1
	mov	DWORD PTR _i$31693[ebp], eax
$L31694:
	mov	ecx, DWORD PTR _i$31693[ebp]
	cmp	ecx, DWORD PTR _nImageWidth$[ebp]
	jae	SHORT $L31696
; Line 1614
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+112]
	mov	ecx, DWORD PTR _ptrDstLine$[ebp]
	add	ecx, DWORD PTR _i$31693[ebp]
	mov	edx, DWORD PTR _i$31693[ebp]
	mov	al, BYTE PTR [eax+edx*4]
	mov	BYTE PTR [ecx], al
; Line 1615
	jmp	SHORT $L31695
$L31696:
; Line 1617
	jmp	SHORT $L31698
$L31691:
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+12], -1
	jne	SHORT $L31699
; Line 1622
	mov	edx, DWORD PTR _nImageWidth$[ebp]
	push	edx
	mov	eax, DWORD PTR _ptrDstLine$[ebp]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	call	?DecodeRLMTFGCodes@RLHDecodeContext@@QAEKPAEK@Z ; RLHDecodeContext::DecodeRLMTFGCodes
	cmp	eax, DWORD PTR _nImageWidth$[ebp]
	jae	SHORT $L31700
; Line 1624
	mov	eax, 1
	jmp	SHORT $L31669
$L31700:
; Line 1627
	jmp	SHORT $L31701
$L31699:
; Line 1632
	mov	ecx, DWORD PTR _nImageWidth$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptrDstLine$[ebp]
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?DecodeERINACodes256@RLHDecodeContext@@QAEKPAEK@Z ; RLHDecodeContext::DecodeERINACodes256
	cmp	eax, DWORD PTR _nImageWidth$[ebp]
	jae	SHORT $L31702
; Line 1634
	mov	eax, 1
	jmp	SHORT $L31669
$L31702:
$L31701:
$L31698:
; Line 1639
	mov	eax, DWORD PTR _nLine$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+28]
	mov	DWORD PTR _flgContinue$31703[ebp], eax
; Line 1640
	cmp	DWORD PTR _flgContinue$31703[ebp], 0
	je	SHORT $L31704
; Line 1641
	mov	eax, DWORD PTR _flgContinue$31703[ebp]
	jmp	SHORT $L31669
$L31704:
; Line 1643
	mov	eax, DWORD PTR _ptrDstLine$[ebp]
	add	eax, DWORD PTR _nBytesPerLine$[ebp]
	mov	DWORD PTR _ptrDstLine$[ebp], eax
; Line 1644
	jmp	$L31689
$L31690:
; Line 1646
	xor	eax, eax
$L31669:
; Line 1647
	mov	esp, ebp
	pop	ebp
	ret	8
?DecodePaletteImage@ERIDecoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@@Z ENDP ; ERIDecoder::DecodePaletteImage
_TEXT	ENDS
PUBLIC	?RestoreGray8@ERIDecoder@@IAEXPAEJHH@Z		; ERIDecoder::RestoreGray8
PUBLIC	?RestoreRGB16@ERIDecoder@@IAEXPAEJHH@Z		; ERIDecoder::RestoreRGB16
PUBLIC	?RestoreRGB24@ERIDecoder@@IAEXPAEJHH@Z		; ERIDecoder::RestoreRGB24
PUBLIC	?RestoreRGBA32@ERIDecoder@@IAEXPAEJHH@Z		; ERIDecoder::RestoreRGBA32
_TEXT	SEGMENT
_dwBitsPerPixel$ = 12
_this$ = -4
?GetRestoreFunc@ERIDecoder@@MAEP81@AEXPAEJHH@ZKK@Z PROC NEAR ; ERIDecoder::GetRestoreFunc
; Line 1654
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1655
	mov	eax, DWORD PTR _dwBitsPerPixel$[ebp]
	shr	eax, 3
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+96], eax
; Line 1657
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	DWORD PTR -8+[ebp], eax
	cmp	DWORD PTR -8+[ebp], 1
	je	SHORT $L31714
	cmp	DWORD PTR -8+[ebp], 2
	je	SHORT $L31721
	cmp	DWORD PTR -8+[ebp], 67108865		; 04000001H
	je	SHORT $L31719
	jmp	SHORT $L31711
$L31714:
; Line 1660
	cmp	DWORD PTR _dwBitsPerPixel$[ebp], 16	; 00000010H
	jne	SHORT $L31715
; Line 1662
	mov	eax, OFFSET FLAT:?RestoreRGB16@ERIDecoder@@IAEXPAEJHH@Z ; ERIDecoder::RestoreRGB16
	jmp	SHORT $L31708
$L31715:
; Line 1665
	cmp	DWORD PTR _dwBitsPerPixel$[ebp], 24	; 00000018H
	je	SHORT $L31718
	cmp	DWORD PTR _dwBitsPerPixel$[ebp], 32	; 00000020H
	jne	SHORT $L31717
$L31718:
; Line 1667
	mov	eax, OFFSET FLAT:?RestoreRGB24@ERIDecoder@@IAEXPAEJHH@Z ; ERIDecoder::RestoreRGB24
	jmp	SHORT $L31708
$L31717:
; Line 1669
	jmp	SHORT $L31711
$L31719:
; Line 1672
	cmp	DWORD PTR _dwBitsPerPixel$[ebp], 32	; 00000020H
	jne	SHORT $L31720
; Line 1673
	mov	eax, OFFSET FLAT:?RestoreRGBA32@ERIDecoder@@IAEXPAEJHH@Z ; ERIDecoder::RestoreRGBA32
	jmp	SHORT $L31708
$L31720:
; Line 1674
	jmp	SHORT $L31711
$L31721:
; Line 1677
	cmp	DWORD PTR _dwBitsPerPixel$[ebp], 8
	jne	SHORT $L31722
; Line 1678
	mov	eax, OFFSET FLAT:?RestoreGray8@ERIDecoder@@IAEXPAEJHH@Z ; ERIDecoder::RestoreGray8
	jmp	SHORT $L31708
$L31722:
$L31711:
; Line 1681
	xor	eax, eax
$L31708:
; Line 1682
	mov	esp, ebp
	pop	ebp
	ret	8
?GetRestoreFunc@ERIDecoder@@MAEP81@AEXPAEJHH@ZKK@Z ENDP	; ERIDecoder::GetRestoreFunc
_ptrDst$ = 8
_nLineBytes$ = 12
_nWidth$ = 16
_nHeight$ = 20
_this$ = -12
_ptrNextBuf$ = -4
_x$31733 = -8
?RestoreGray8@ERIDecoder@@IAEXPAEJHH@Z PROC NEAR	; ERIDecoder::RestoreGray8
; Line 1689
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1690
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	mov	DWORD PTR _ptrNextBuf$[ebp], ecx
$L31731:
; Line 1692
	mov	edx, DWORD PTR _nHeight$[ebp]
	mov	eax, DWORD PTR _nHeight$[ebp]
	sub	eax, 1
	mov	DWORD PTR _nHeight$[ebp], eax
	test	edx, edx
	je	SHORT $L31732
; Line 1694
	mov	DWORD PTR _x$31733[ebp], 0
	jmp	SHORT $L31734
$L31735:
	mov	ecx, DWORD PTR _x$31733[ebp]
	add	ecx, 1
	mov	DWORD PTR _x$31733[ebp], ecx
$L31734:
	mov	edx, DWORD PTR _x$31733[ebp]
	cmp	edx, DWORD PTR _nWidth$[ebp]
	jge	SHORT $L31736
; Line 1696
	mov	eax, DWORD PTR _ptrDst$[ebp]
	add	eax, DWORD PTR _x$31733[ebp]
	mov	ecx, DWORD PTR _x$31733[ebp]
	mov	edx, DWORD PTR _ptrNextBuf$[ebp]
	mov	cl, BYTE PTR [edx+ecx*4]
	mov	BYTE PTR [eax], cl
; Line 1697
	jmp	SHORT $L31735
$L31736:
; Line 1698
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	mov	ecx, DWORD PTR _ptrNextBuf$[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _ptrNextBuf$[ebp], edx
; Line 1699
	mov	eax, DWORD PTR _ptrDst$[ebp]
	add	eax, DWORD PTR _nLineBytes$[ebp]
	mov	DWORD PTR _ptrDst$[ebp], eax
; Line 1700
	jmp	SHORT $L31731
$L31732:
; Line 1701
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?RestoreGray8@ERIDecoder@@IAEXPAEJHH@Z ENDP		; ERIDecoder::RestoreGray8
_ptrDstLine$ = -4
_ptrBufLine$ = -8
_nBlockSamples$ = -12
_ptrNextBuf$31751 = -20
_pwDst$31752 = -24
_i$31754 = -16
_ptrDst$ = 8
_nLineBytes$ = 12
_nWidth$ = 16
_nHeight$ = 20
_this$ = -28
?RestoreRGB16@ERIDecoder@@IAEXPAEJHH@Z PROC NEAR	; ERIDecoder::RestoreRGB16
; Line 1708
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1709
	mov	eax, DWORD PTR _ptrDst$[ebp]
	mov	DWORD PTR _ptrDstLine$[ebp], eax
; Line 1710
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	mov	DWORD PTR _ptrBufLine$[ebp], edx
; Line 1711
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	mov	DWORD PTR _nBlockSamples$[ebp], ecx
$L31749:
; Line 1713
	mov	edx, DWORD PTR _nHeight$[ebp]
	mov	eax, DWORD PTR _nHeight$[ebp]
	sub	eax, 1
	mov	DWORD PTR _nHeight$[ebp], eax
	test	edx, edx
	je	$L31750
; Line 1715
	mov	ecx, DWORD PTR _ptrBufLine$[ebp]
	mov	DWORD PTR _ptrNextBuf$31751[ebp], ecx
; Line 1716
	mov	edx, DWORD PTR _ptrDstLine$[ebp]
	mov	DWORD PTR _pwDst$31752[ebp], edx
; Line 1718
	mov	eax, DWORD PTR _nWidth$[ebp]
	mov	DWORD PTR _i$31754[ebp], eax
$L31756:
; Line 1719
	mov	ecx, DWORD PTR _i$31754[ebp]
	mov	edx, DWORD PTR _i$31754[ebp]
	sub	edx, 1
	mov	DWORD PTR _i$31754[ebp], edx
	test	ecx, ecx
	je	SHORT $L31757
; Line 1724
	mov	eax, DWORD PTR _ptrNextBuf$31751[ebp]
	mov	ecx, DWORD PTR [eax]
	and	ecx, 31					; 0000001fH
	and	ecx, 65535				; 0000ffffH
	mov	edx, DWORD PTR _nBlockSamples$[ebp]
	mov	eax, DWORD PTR _ptrNextBuf$31751[ebp]
	mov	edx, DWORD PTR [eax+edx*4]
	and	edx, 31					; 0000001fH
	shl	edx, 5
	or	ecx, edx
	mov	eax, DWORD PTR _nBlockSamples$[ebp]
	shl	eax, 1
	mov	edx, DWORD PTR _ptrNextBuf$31751[ebp]
	mov	eax, DWORD PTR [edx+eax*4]
	and	eax, 31					; 0000001fH
	shl	eax, 10					; 0000000aH
	or	ecx, eax
	mov	edx, DWORD PTR _pwDst$31752[ebp]
	mov	WORD PTR [edx], cx
; Line 1725
	mov	eax, DWORD PTR _ptrNextBuf$31751[ebp]
	add	eax, 4
	mov	DWORD PTR _ptrNextBuf$31751[ebp], eax
; Line 1726
	mov	ecx, DWORD PTR _pwDst$31752[ebp]
	add	ecx, 2
	mov	DWORD PTR _pwDst$31752[ebp], ecx
; Line 1727
	jmp	SHORT $L31756
$L31757:
; Line 1728
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	mov	ecx, DWORD PTR _ptrBufLine$[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _ptrBufLine$[ebp], edx
; Line 1729
	mov	eax, DWORD PTR _ptrDstLine$[ebp]
	add	eax, DWORD PTR _nLineBytes$[ebp]
	mov	DWORD PTR _ptrDstLine$[ebp], eax
; Line 1730
	jmp	$L31749
$L31750:
; Line 1731
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?RestoreRGB16@ERIDecoder@@IAEXPAEJHH@Z ENDP		; ERIDecoder::RestoreRGB16
_ptrDst$ = 8
_nLineBytes$ = 12
_nWidth$ = 16
_nHeight$ = 20
_this$ = -28
_ptrDstLine$ = -4
_ptrBufLine$ = -8
_nBytesPerPixel$ = -16
_nBlockSamples$ = -12
_ptrNextBuf$31777 = -24
_i$31778 = -20
?RestoreRGB24@ERIDecoder@@IAEXPAEJHH@Z PROC NEAR	; ERIDecoder::RestoreRGB24
; Line 1738
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1739
	mov	eax, DWORD PTR _ptrDst$[ebp]
	mov	DWORD PTR _ptrDstLine$[ebp], eax
; Line 1740
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	mov	DWORD PTR _ptrBufLine$[ebp], edx
; Line 1741
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+96]
	mov	DWORD PTR _nBytesPerPixel$[ebp], ecx
; Line 1742
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+76]
	mov	DWORD PTR _nBlockSamples$[ebp], eax
$L31775:
; Line 1744
	mov	ecx, DWORD PTR _nHeight$[ebp]
	mov	edx, DWORD PTR _nHeight$[ebp]
	sub	edx, 1
	mov	DWORD PTR _nHeight$[ebp], edx
	test	ecx, ecx
	je	SHORT $L31776
; Line 1746
	mov	eax, DWORD PTR _ptrBufLine$[ebp]
	mov	DWORD PTR _ptrNextBuf$31777[ebp], eax
; Line 1747
	mov	ecx, DWORD PTR _ptrDstLine$[ebp]
	mov	DWORD PTR _ptrDst$[ebp], ecx
; Line 1749
	mov	edx, DWORD PTR _nWidth$[ebp]
	mov	DWORD PTR _i$31778[ebp], edx
$L31780:
; Line 1750
	mov	eax, DWORD PTR _i$31778[ebp]
	mov	ecx, DWORD PTR _i$31778[ebp]
	sub	ecx, 1
	mov	DWORD PTR _i$31778[ebp], ecx
	test	eax, eax
	je	SHORT $L31781
; Line 1752
	mov	edx, DWORD PTR _ptrDst$[ebp]
	mov	eax, DWORD PTR _ptrNextBuf$31777[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
; Line 1753
	mov	edx, DWORD PTR _ptrDst$[ebp]
	mov	eax, DWORD PTR _nBlockSamples$[ebp]
	mov	ecx, DWORD PTR _ptrNextBuf$31777[ebp]
	mov	al, BYTE PTR [ecx+eax*4]
	mov	BYTE PTR [edx+1], al
; Line 1754
	mov	ecx, DWORD PTR _nBlockSamples$[ebp]
	shl	ecx, 1
	mov	edx, DWORD PTR _ptrDst$[ebp]
	mov	eax, DWORD PTR _ptrNextBuf$31777[ebp]
	mov	cl, BYTE PTR [eax+ecx*4]
	mov	BYTE PTR [edx+2], cl
; Line 1755
	mov	edx, DWORD PTR _ptrNextBuf$31777[ebp]
	add	edx, 4
	mov	DWORD PTR _ptrNextBuf$31777[ebp], edx
; Line 1756
	mov	eax, DWORD PTR _ptrDst$[ebp]
	add	eax, DWORD PTR _nBytesPerPixel$[ebp]
	mov	DWORD PTR _ptrDst$[ebp], eax
; Line 1757
	jmp	SHORT $L31780
$L31781:
; Line 1758
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	mov	eax, DWORD PTR _ptrBufLine$[ebp]
	lea	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _ptrBufLine$[ebp], ecx
; Line 1759
	mov	edx, DWORD PTR _ptrDstLine$[ebp]
	add	edx, DWORD PTR _nLineBytes$[ebp]
	mov	DWORD PTR _ptrDstLine$[ebp], edx
; Line 1760
	jmp	$L31775
$L31776:
; Line 1761
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?RestoreRGB24@ERIDecoder@@IAEXPAEJHH@Z ENDP		; ERIDecoder::RestoreRGB24
_ptrDst$ = 8
_nLineBytes$ = 12
_nWidth$ = 16
_nHeight$ = 20
_this$ = -28
_ptrDstLine$ = -8
_ptrBufLine$ = -12
_nBlockSamples$ = -16
_nBlockSamplesX3$ = -4
_ptrNextBuf$31799 = -24
_i$31800 = -20
?RestoreRGBA32@ERIDecoder@@IAEXPAEJHH@Z PROC NEAR	; ERIDecoder::RestoreRGBA32
; Line 1768
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1769
	mov	eax, DWORD PTR _ptrDst$[ebp]
	mov	DWORD PTR _ptrDstLine$[ebp], eax
; Line 1770
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	mov	DWORD PTR _ptrBufLine$[ebp], edx
; Line 1771
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	mov	DWORD PTR _nBlockSamples$[ebp], ecx
; Line 1772
	mov	edx, DWORD PTR _nBlockSamples$[ebp]
	imul	edx, 3
	mov	DWORD PTR _nBlockSamplesX3$[ebp], edx
$L31797:
; Line 1774
	mov	eax, DWORD PTR _nHeight$[ebp]
	mov	ecx, DWORD PTR _nHeight$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _nHeight$[ebp], ecx
	test	eax, eax
	je	$L31798
; Line 1776
	mov	edx, DWORD PTR _ptrBufLine$[ebp]
	mov	DWORD PTR _ptrNextBuf$31799[ebp], edx
; Line 1777
	mov	eax, DWORD PTR _ptrDstLine$[ebp]
	mov	DWORD PTR _ptrDst$[ebp], eax
; Line 1779
	mov	ecx, DWORD PTR _nWidth$[ebp]
	mov	DWORD PTR _i$31800[ebp], ecx
$L31802:
; Line 1780
	mov	edx, DWORD PTR _i$31800[ebp]
	mov	eax, DWORD PTR _i$31800[ebp]
	sub	eax, 1
	mov	DWORD PTR _i$31800[ebp], eax
	test	edx, edx
	je	SHORT $L31803
; Line 1782
	mov	ecx, DWORD PTR _ptrDst$[ebp]
	mov	edx, DWORD PTR _ptrNextBuf$31799[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
; Line 1783
	mov	ecx, DWORD PTR _ptrDst$[ebp]
	mov	edx, DWORD PTR _nBlockSamples$[ebp]
	mov	eax, DWORD PTR _ptrNextBuf$31799[ebp]
	mov	dl, BYTE PTR [eax+edx*4]
	mov	BYTE PTR [ecx+1], dl
; Line 1784
	mov	eax, DWORD PTR _nBlockSamples$[ebp]
	shl	eax, 1
	mov	ecx, DWORD PTR _ptrDst$[ebp]
	mov	edx, DWORD PTR _ptrNextBuf$31799[ebp]
	mov	al, BYTE PTR [edx+eax*4]
	mov	BYTE PTR [ecx+2], al
; Line 1785
	mov	ecx, DWORD PTR _ptrDst$[ebp]
	mov	edx, DWORD PTR _nBlockSamplesX3$[ebp]
	mov	eax, DWORD PTR _ptrNextBuf$31799[ebp]
	mov	dl, BYTE PTR [eax+edx*4]
	mov	BYTE PTR [ecx+3], dl
; Line 1786
	mov	eax, DWORD PTR _ptrNextBuf$31799[ebp]
	add	eax, 4
	mov	DWORD PTR _ptrNextBuf$31799[ebp], eax
; Line 1787
	mov	ecx, DWORD PTR _ptrDst$[ebp]
	add	ecx, 4
	mov	DWORD PTR _ptrDst$[ebp], ecx
; Line 1788
	jmp	SHORT $L31802
$L31803:
; Line 1789
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	mov	ecx, DWORD PTR _ptrBufLine$[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _ptrBufLine$[ebp], edx
; Line 1790
	mov	eax, DWORD PTR _ptrDstLine$[ebp]
	add	eax, DWORD PTR _nLineBytes$[ebp]
	mov	DWORD PTR _ptrDstLine$[ebp], eax
; Line 1791
	jmp	$L31797
$L31798:
; Line 1792
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?RestoreRGBA32@ERIDecoder@@IAEXPAEJHH@Z ENDP		; ERIDecoder::RestoreRGBA32
_this$ = -20
_ptrArrange$ = -16
_i$ = -12
_x$ = -4
_y$ = -8
?InitializeZigZagTable@ERIDecoder@@IAEXXZ PROC NEAR	; ERIDecoder::InitializeZigZagTable
; Line 1798
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1800
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	shl	ecx, 2
	push	ecx
	call	?eriAllocateMemory@@YAPAXK@Z		; eriAllocateMemory
	add	esp, 4
	mov	DWORD PTR _ptrArrange$[ebp], eax
; Line 1801
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _ptrArrange$[ebp]
	mov	DWORD PTR [edx+124], eax
; Line 1803
	mov	DWORD PTR _i$[ebp], 0
; Line 1804
	mov	DWORD PTR _x$[ebp], 0
	mov	DWORD PTR _y$[ebp], 0
$L31818:
$L31821:
; Line 1809
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
; Line 1810
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+76]
	jb	SHORT $L31823
; Line 1811
	jmp	$L31810
$L31823:
; Line 1812
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 1
	mov	DWORD PTR _x$[ebp], eax
; Line 1813
	mov	ecx, DWORD PTR _y$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _y$[ebp], ecx
; Line 1814
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _x$[ebp]
	cmp	eax, DWORD PTR [edx+72]
	jl	SHORT $L31825
; Line 1816
	mov	ecx, DWORD PTR _x$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _x$[ebp], ecx
; Line 1817
	mov	edx, DWORD PTR _y$[ebp]
	add	edx, 2
	mov	DWORD PTR _y$[ebp], edx
; Line 1818
	jmp	SHORT $L31822
$L31825:
; Line 1820
	cmp	DWORD PTR _y$[ebp], 0
	jge	SHORT $L31827
; Line 1822
	mov	DWORD PTR _y$[ebp], 0
; Line 1823
	jmp	SHORT $L31822
$L31827:
; Line 1825
	jmp	SHORT $L31821
$L31822:
$L31829:
; Line 1828
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
; Line 1829
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+76]
	jb	SHORT $L31831
; Line 1830
	jmp	SHORT $L31810
$L31831:
; Line 1831
	mov	edx, DWORD PTR _y$[ebp]
	add	edx, 1
	mov	DWORD PTR _y$[ebp], edx
; Line 1832
	mov	eax, DWORD PTR _x$[ebp]
	sub	eax, 1
	mov	DWORD PTR _x$[ebp], eax
; Line 1833
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _y$[ebp]
	cmp	edx, DWORD PTR [ecx+72]
	jl	SHORT $L31833
; Line 1835
	mov	eax, DWORD PTR _y$[ebp]
	sub	eax, 1
	mov	DWORD PTR _y$[ebp], eax
; Line 1836
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 2
	mov	DWORD PTR _x$[ebp], ecx
; Line 1837
	jmp	SHORT $L31830
$L31833:
; Line 1839
	cmp	DWORD PTR _x$[ebp], 0
	jge	SHORT $L31835
; Line 1841
	mov	DWORD PTR _x$[ebp], 0
; Line 1842
	jmp	SHORT $L31830
$L31835:
; Line 1844
	jmp	SHORT $L31829
$L31830:
; Line 1845
	jmp	$L31818
$L31810:
; Line 1846
	mov	esp, ebp
	pop	ebp
	ret	0
?InitializeZigZagTable@ERIDecoder@@IAEXXZ ENDP		; ERIDecoder::InitializeZigZagTable
_TEXT	ENDS
PUBLIC	?PerformIDCT@ERIDecoder@@IAEXXZ			; ERIDecoder::PerformIDCT
PUBLIC	?ArrangeAndIQuantumize@ERIDecoder@@IAEXQAE@Z	; ERIDecoder::ArrangeAndIQuantumize
EXTRN	?ConvertYUVtoRGB@ERIDecoder@@IAEXXZ:NEAR	; ERIDecoder::ConvertYUVtoRGB
EXTRN	__fltused:NEAR
CONST	SEGMENT
$T32085	DQ	04070000000000000r		; 256
$T32086	DQ	04000000000000000r		; 2
CONST	ENDS
_TEXT	SEGMENT
_imginf$ = 8
_context$ = 12
_this$ = -160
_pfnRestore$ = -40
_nERIVersion$ = -52
_fOpTable$ = -8
_fEncodeType$ = -28
_nBitCount$ = -44
_nFixedScaleDC$ = -4
_i$ = -24
_j$ = -32
_nAllBlockCount$ = -48
_nDCSampleCount$31863 = -60
_ptrNextDCSamples$ = -36
_ptrNextCoefficient$ = -56
_nPosX$ = -12
_nPosY$ = -16
_nRestHeight$ = -20
_ptrDstLine$31880 = -72
_nBlockHeightA$31881 = -76
_nBlockHeightB$31882 = -68
_nRestWidth$31888 = -64
_nACSampleCount$31909 = -100
_nBlockWidthL$31919 = -80
_nBlockWidthR$31920 = -104
_widthBlock$31926 = -120
_heightBlock$31927 = -136
_dwOffsetAddr$31928 = -96
_ptrBuf$31932 = -156
_flgContinue$31936 = -140
?DecodeTrueColorImageDCT@ERIDecoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@@Z PROC NEAR ; ERIDecoder::DecodeTrueColorImageDCT
; Line 1853
	push	ebp
	mov	ebp, esp
	sub	esp, 192				; 000000c0H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1858
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+84], 3
	jb	SHORT $L31841
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+12], -4			; fffffffcH
	je	SHORT $L31840
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+12], -1
	je	SHORT $L31840
$L31841:
; Line 1860
	mov	eax, 1
	jmp	$L31839
$L31840:
; Line 1864
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	shr	ecx, 3
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+96], ecx
; Line 1866
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	push	ecx
	mov	edx, DWORD PTR _imginf$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+20]
	mov	DWORD PTR _pfnRestore$[ebp], eax
; Line 1867
	cmp	DWORD PTR _pfnRestore$[ebp], 0
	jne	SHORT $L31844
; Line 1868
	mov	eax, 1
	jmp	$L31839
$L31844:
; Line 1871
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+12], -4			; fffffffcH
	jne	SHORT $L31845
; Line 1873
	mov	ecx, DWORD PTR _context$[ebp]
	call	?PrepareToDecodeERINACode@RLHDecodeContext@@QAEXXZ ; RLHDecodeContext::PrepareToDecodeERINACode
$L31845:
; Line 1879
	push	8
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	DWORD PTR _nERIVersion$[ebp], eax
; Line 1880
	push	8
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	DWORD PTR _fOpTable$[ebp], eax
; Line 1881
	push	8
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	DWORD PTR _fEncodeType$[ebp], eax
; Line 1882
	push	8
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	DWORD PTR _nBitCount$[ebp], eax
; Line 1884
	cmp	DWORD PTR _nERIVersion$[ebp], 9
	jne	SHORT $L31851
	cmp	DWORD PTR _fOpTable$[ebp], 0
	jne	SHORT $L31851
	mov	ecx, DWORD PTR _fEncodeType$[ebp]
	and	ecx, 254				; 000000feH
	test	ecx, ecx
	jne	SHORT $L31851
	cmp	DWORD PTR _nBitCount$[ebp], 8
	je	SHORT $L31850
$L31851:
; Line 1886
	mov	eax, 1
	jmp	$L31839
$L31850:
; Line 1888
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetABit@RLHDecodeContext@@QAEHXZ	; RLHDecodeContext::GetABit
	test	eax, eax
	je	SHORT $L31852
; Line 1890
	mov	eax, 1
	jmp	$L31839
$L31852:
; Line 1894
	push	8
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	DWORD PTR _nFixedScaleDC$[ebp], eax
; Line 1895
	mov	edx, DWORD PTR _nFixedScaleDC$[ebp]
	add	edx, 1
	mov	DWORD PTR -164+[ebp], edx
	fild	DWORD PTR -164+[ebp]
	fstp	QWORD PTR -172+[ebp]
	fld	QWORD PTR $T32085
	fdiv	QWORD PTR -172+[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	fstp	DWORD PTR [eax+424]
; Line 1896
	push	8
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetNBits@RLHDecodeContext@@QAEIH@Z	; RLHDecodeContext::GetNBits
	mov	DWORD PTR _nFixedScaleDC$[ebp], eax
; Line 1897
	mov	ecx, DWORD PTR _nFixedScaleDC$[ebp]
	add	ecx, 1
	mov	DWORD PTR -176+[ebp], ecx
	fild	DWORD PTR -176+[ebp]
	fstp	QWORD PTR -184+[ebp]
	fld	QWORD PTR $T32085
	fdiv	QWORD PTR -184+[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	fstp	DWORD PTR [edx+428]
; Line 1898
	mov	eax, DWORD PTR _this$[ebp]
	fild	DWORD PTR [eax+72]
	fstp	QWORD PTR -192+[ebp]
	fld	QWORD PTR $T32086
	fdiv	QWORD PTR -192+[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	fstp	DWORD PTR [ecx+420]
; Line 1899
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	fld	DWORD PTR [edx+424]
	fmul	DWORD PTR [eax+420]
	mov	ecx, DWORD PTR _this$[ebp]
	fstp	DWORD PTR [ecx+424]
; Line 1900
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	fld	DWORD PTR [edx+428]
	fmul	DWORD PTR [eax+420]
	mov	ecx, DWORD PTR _this$[ebp]
	fstp	DWORD PTR [ecx+428]
; Line 1904
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+88]
	imul	ecx, DWORD PTR [eax+92]
	mov	DWORD PTR _nAllBlockCount$[ebp], ecx
; Line 1906
	mov	edx, DWORD PTR _fEncodeType$[ebp]
	and	edx, 1
	test	edx, edx
	je	$L31862
; Line 1910
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _nAllBlockCount$[ebp]
	imul	ecx, DWORD PTR [eax+144]
	mov	DWORD PTR _nDCSampleCount$31863[ebp], ecx
; Line 1911
	mov	ecx, DWORD PTR _context$[ebp]
	call	?Initialize@RLHDecodeContext@@QAEXXZ	; RLHDecodeContext::Initialize
; Line 1913
	mov	edx, DWORD PTR _nDCSampleCount$31863[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+416]
	push	ecx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?DecodeGammaCodes@RLHDecodeContext@@QAEKPAHK@Z ; RLHDecodeContext::DecodeGammaCodes
	cmp	eax, DWORD PTR _nDCSampleCount$31863[ebp]
	jae	SHORT $L31864
; Line 1915
	mov	eax, 1
	jmp	$L31839
$L31864:
; Line 1919
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+140]
	call	?Initialize@ERINA_HUFFMAN_TREE@@QAEXXZ	; ERINA_HUFFMAN_TREE::Initialize
; Line 1920
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31865
$L31866:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31865:
	mov	ecx, DWORD PTR _nAllBlockCount$[ebp]
	shl	ecx, 2
	cmp	DWORD PTR _i$[ebp], ecx
	jge	SHORT $L31867
; Line 1923
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+140]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetAHuffmanCode@RLHDecodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@@Z ; RLHDecodeContext::GetAHuffmanCode
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [edx+ecx], al
; Line 1924
	jmp	SHORT $L31866
$L31867:
; Line 1927
	mov	edx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [edx+12], -4			; fffffffcH
	je	SHORT $L31869
; Line 1929
	mov	ecx, DWORD PTR _context$[ebp]
	call	?Initialize@RLHDecodeContext@@QAEXXZ	; RLHDecodeContext::Initialize
$L31869:
$L31862:
; Line 1933
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+416]
	mov	DWORD PTR _ptrNextDCSamples$[ebp], ecx
; Line 1934
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+100]
	mov	DWORD PTR _ptrNextCoefficient$[ebp], eax
; Line 1937
	mov	ecx, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR _nRestHeight$[ebp], edx
; Line 1939
	mov	DWORD PTR _nPosY$[ebp], 0
	jmp	SHORT $L31877
$L31878:
	mov	eax, DWORD PTR _nPosY$[ebp]
	add	eax, 1
	mov	DWORD PTR _nPosY$[ebp], eax
$L31877:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nPosY$[ebp]
	cmp	edx, DWORD PTR [ecx+92]
	jge	$L31879
; Line 1946
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
	mov	DWORD PTR _ptrDstLine$31880[ebp], eax
; Line 1948
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR _nBlockHeightA$31881[ebp], edx
; Line 1949
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	mov	DWORD PTR _nBlockHeightB$31882[ebp], ecx
; Line 1950
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nRestHeight$[ebp]
	cmp	eax, DWORD PTR [edx+72]
	jge	SHORT $L31884
; Line 1952
	mov	ecx, DWORD PTR _nRestHeight$[ebp]
	mov	DWORD PTR _nBlockHeightA$31881[ebp], ecx
; Line 1953
	mov	DWORD PTR _nBlockHeightB$31882[ebp], 0
; Line 1955
	jmp	SHORT $L31885
$L31884:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	shl	eax, 1
	cmp	DWORD PTR _nRestHeight$[ebp], eax
	jge	SHORT $L31887
; Line 1957
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nRestHeight$[ebp]
	sub	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR _nBlockHeightB$31882[ebp], edx
$L31887:
$L31885:
; Line 1960
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR _nRestWidth$31888[ebp], ecx
; Line 1963
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31891
$L31892:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31891:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+144]
	jge	SHORT $L31893
; Line 1965
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+edx*4+352], 0
; Line 1966
	jmp	SHORT $L31892
$L31893:
; Line 1968
	mov	DWORD PTR _nPosX$[ebp], 0
	jmp	SHORT $L31895
$L31896:
	mov	ecx, DWORD PTR _nPosX$[ebp]
	add	ecx, 1
	mov	DWORD PTR _nPosX$[ebp], ecx
$L31895:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nPosX$[ebp]
	cmp	eax, DWORD PTR [edx+88]
	jge	$L31897
; Line 1972
	mov	ecx, DWORD PTR _fEncodeType$[ebp]
	and	ecx, 1
	test	ecx, ecx
	jne	$L31898
; Line 1974
	mov	ecx, DWORD PTR _context$[ebp]
	call	?Initialize@RLHDecodeContext@@QAEXXZ	; RLHDecodeContext::Initialize
; Line 1976
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+144]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?DecodeGammaCodes@RLHDecodeContext@@QAEKPAHK@Z ; RLHDecodeContext::DecodeGammaCodes
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	eax, DWORD PTR [ecx+144]
	jae	SHORT $L31899
; Line 1978
	mov	eax, 1
	jmp	$L31839
$L31899:
; Line 1982
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+140]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetAHuffmanCode@RLHDecodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@@Z ; RLHDecodeContext::GetAHuffmanCode
	mov	ecx, DWORD PTR _ptrNextCoefficient$[ebp]
	mov	BYTE PTR [ecx], al
; Line 1984
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+140]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetAHuffmanCode@RLHDecodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@@Z ; RLHDecodeContext::GetAHuffmanCode
	mov	ecx, DWORD PTR _ptrNextCoefficient$[ebp]
	mov	BYTE PTR [ecx+1], al
; Line 1986
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+140]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetAHuffmanCode@RLHDecodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@@Z ; RLHDecodeContext::GetAHuffmanCode
	mov	ecx, DWORD PTR _ptrNextCoefficient$[ebp]
	mov	BYTE PTR [ecx+2], al
; Line 1988
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+140]
	push	eax
	mov	ecx, DWORD PTR _context$[ebp]
	call	?GetAHuffmanCode@RLHDecodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@@Z ; RLHDecodeContext::GetAHuffmanCode
	mov	ecx, DWORD PTR _ptrNextCoefficient$[ebp]
	mov	BYTE PTR [ecx+3], al
; Line 1990
	jmp	SHORT $L31904
$L31898:
; Line 1992
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31906
$L31907:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31906:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+144]
	jge	SHORT $L31908
; Line 1994
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+112]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _ptrNextDCSamples$[ebp]
	mov	edx, DWORD PTR [esi+edx*4]
	mov	DWORD PTR [eax+ecx*4], edx
; Line 1995
	jmp	SHORT $L31907
$L31908:
; Line 1996
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+144]
	mov	edx, DWORD PTR _ptrNextDCSamples$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _ptrNextDCSamples$[ebp], eax
$L31904:
; Line 2000
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+76]
	sub	edx, 1
	mov	eax, DWORD PTR _this$[ebp]
	imul	edx, DWORD PTR [eax+144]
	mov	DWORD PTR _nACSampleCount$31909[ebp], edx
; Line 2001
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+12], -4			; fffffffcH
	jne	SHORT $L31910
; Line 2005
	mov	edx, DWORD PTR _nACSampleCount$31909[ebp]
	push	edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+144]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+112]
	lea	ecx, DWORD PTR [eax+ecx*4]
	push	ecx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?DecodeERINACodes@RLHDecodeContext@@QAEKPAHK@Z ; RLHDecodeContext::DecodeERINACodes
	cmp	eax, DWORD PTR _nACSampleCount$31909[ebp]
	jae	SHORT $L31911
; Line 2007
	mov	eax, 1
	jmp	$L31839
$L31911:
; Line 2010
	jmp	SHORT $L31912
$L31910:
; Line 2012
	mov	edx, DWORD PTR _fEncodeType$[ebp]
	and	edx, 1
	test	edx, edx
	jne	SHORT $L31913
; Line 2014
	mov	ecx, DWORD PTR _context$[ebp]
	call	?Initialize@RLHDecodeContext@@QAEXXZ	; RLHDecodeContext::Initialize
$L31913:
; Line 2018
	mov	eax, DWORD PTR _nACSampleCount$31909[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+144]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	lea	edx, DWORD PTR [ecx+edx*4]
	push	edx
	mov	ecx, DWORD PTR _context$[ebp]
	call	?DecodeGammaCodes@RLHDecodeContext@@QAEKPAHK@Z ; RLHDecodeContext::DecodeGammaCodes
	cmp	eax, DWORD PTR _nACSampleCount$31909[ebp]
	jae	SHORT $L31914
; Line 2020
	mov	eax, 1
	jmp	$L31839
$L31914:
$L31912:
; Line 2025
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31916
$L31917:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31916:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+144]
	jge	SHORT $L31918
; Line 2028
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [ecx+edx*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	add	eax, DWORD PTR [edx+ecx*4+352]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+ecx*4+352], eax
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	esi, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [esi+eax*4+352]
	mov	DWORD PTR [ecx+edx*4], eax
; Line 2029
	jmp	SHORT $L31917
$L31918:
; Line 2032
	mov	ecx, DWORD PTR _ptrNextCoefficient$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?ArrangeAndIQuantumize@ERIDecoder@@IAEXQAE@Z ; ERIDecoder::ArrangeAndIQuantumize
; Line 2033
	mov	edx, DWORD PTR _ptrNextCoefficient$[ebp]
	add	edx, 4
	mov	DWORD PTR _ptrNextCoefficient$[ebp], edx
; Line 2036
	mov	ecx, DWORD PTR _this$[ebp]
	call	?PerformIDCT@ERIDecoder@@IAEXXZ		; ERIDecoder::PerformIDCT
; Line 2039
	mov	ecx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	call	DWORD PTR [eax+148]
; Line 2042
	mov	ecx, DWORD PTR _this$[ebp]
	call	?ConvertYUVtoRGB@ERIDecoder@@IAEXXZ	; ERIDecoder::ConvertYUVtoRGB
; Line 2045
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR _nBlockWidthL$31919[ebp], edx
; Line 2046
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	mov	DWORD PTR _nBlockWidthR$31920[ebp], ecx
; Line 2047
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _nRestWidth$31888[ebp]
	cmp	eax, DWORD PTR [edx+72]
	jge	SHORT $L31922
; Line 2049
	mov	ecx, DWORD PTR _nRestWidth$31888[ebp]
	mov	DWORD PTR _nBlockWidthL$31919[ebp], ecx
; Line 2050
	mov	DWORD PTR _nBlockWidthR$31920[ebp], 0
; Line 2052
	jmp	SHORT $L31923
$L31922:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	shl	eax, 1
	cmp	DWORD PTR _nRestWidth$31888[ebp], eax
	jge	SHORT $L31925
; Line 2054
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _nRestWidth$31888[ebp]
	sub	edx, DWORD PTR [ecx+72]
	mov	DWORD PTR _nBlockWidthR$31920[ebp], edx
$L31925:
$L31923:
; Line 2059
	mov	eax, DWORD PTR _nBlockWidthL$31919[ebp]
	mov	DWORD PTR _widthBlock$31926[ebp], eax
	mov	ecx, DWORD PTR _nBlockWidthR$31920[ebp]
	mov	DWORD PTR _widthBlock$31926[ebp+4], ecx
; Line 2060
	mov	edx, DWORD PTR _nBlockWidthL$31919[ebp]
	mov	DWORD PTR _widthBlock$31926[ebp+8], edx
; Line 2061
	mov	eax, DWORD PTR _nBlockWidthR$31920[ebp]
	mov	DWORD PTR _widthBlock$31926[ebp+12], eax
; Line 2064
	mov	ecx, DWORD PTR _nBlockHeightA$31881[ebp]
	mov	DWORD PTR _heightBlock$31927[ebp], ecx
	mov	edx, DWORD PTR _nBlockHeightA$31881[ebp]
	mov	DWORD PTR _heightBlock$31927[ebp+4], edx
; Line 2065
	mov	eax, DWORD PTR _nBlockHeightB$31882[ebp]
	mov	DWORD PTR _heightBlock$31927[ebp+8], eax
; Line 2066
	mov	ecx, DWORD PTR _nBlockHeightB$31882[ebp]
	mov	DWORD PTR _heightBlock$31927[ebp+12], ecx
; Line 2069
	mov	DWORD PTR _dwOffsetAddr$31928[ebp], 0
; Line 2070
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+72]
	imul	ecx, DWORD PTR [eax+96]
	mov	DWORD PTR _dwOffsetAddr$31928[ebp+4], ecx
; Line 2071
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	ecx, DWORD PTR [edx+72]
	imul	ecx, DWORD PTR [eax+20]
	mov	DWORD PTR _dwOffsetAddr$31928[ebp+8], ecx
; Line 2074
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+72]
	imul	ecx, DWORD PTR [eax+96]
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR [edx+72]
	imul	edx, DWORD PTR [eax+20]
	add	ecx, edx
	mov	DWORD PTR _dwOffsetAddr$31928[ebp+12], ecx
; Line 2077
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31929
$L31930:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31929:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L31931
; Line 2080
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L31933
$L31934:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L31933:
	cmp	DWORD PTR _j$[ebp], 4
	jge	SHORT $L31935
; Line 2082
	mov	edx, DWORD PTR _j$[ebp]
	shl	edx, 4
	mov	eax, DWORD PTR _this$[ebp]
	lea	ecx, DWORD PTR [eax+edx+152]
	mov	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _ptrBuf$31932[ebp+edx*4], ecx
; Line 2083
	jmp	SHORT $L31934
$L31935:
; Line 2087
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _heightBlock$31927[ebp+edx*4]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _widthBlock$31926[ebp+ecx*4]
	push	edx
	lea	eax, DWORD PTR _ptrBuf$31932[ebp]
	push	eax
	mov	ecx, DWORD PTR _imginf$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptrDstLine$31880[ebp]
	add	ecx, DWORD PTR _dwOffsetAddr$31928[ebp+eax*4]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR _pfnRestore$[ebp]
; Line 2088
	jmp	$L31930
$L31931:
; Line 2091
	mov	edx, DWORD PTR _nPosX$[ebp]
	push	edx
	mov	eax, DWORD PTR _nPosY$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _this$[ebp]
	call	DWORD PTR [edx+24]
	mov	DWORD PTR _flgContinue$31936[ebp], eax
; Line 2092
	cmp	DWORD PTR _flgContinue$31936[ebp], 0
	je	SHORT $L31937
; Line 2093
	mov	eax, DWORD PTR _flgContinue$31936[ebp]
	jmp	SHORT $L31839
$L31937:
; Line 2096
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	add	ecx, 1
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+96]
	shl	eax, cl
	mov	ecx, DWORD PTR _ptrDstLine$31880[ebp]
	add	ecx, eax
	mov	DWORD PTR _ptrDstLine$31880[ebp], ecx
; Line 2097
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	shl	eax, 1
	mov	ecx, DWORD PTR _nRestWidth$31888[ebp]
	sub	ecx, eax
	mov	DWORD PTR _nRestWidth$31888[ebp], ecx
; Line 2098
	jmp	$L31896
$L31897:
; Line 2100
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	shl	eax, 1
	mov	ecx, DWORD PTR _nRestHeight$[ebp]
	sub	ecx, eax
	mov	DWORD PTR _nRestHeight$[ebp], ecx
; Line 2101
	jmp	$L31878
$L31879:
; Line 2103
	xor	eax, eax
$L31839:
; Line 2104
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
?DecodeTrueColorImageDCT@ERIDecoder@@IAEHABURASTER_IMAGE_INFO@@AAVRLHDecodeContext@@@Z ENDP ; ERIDecoder::DecodeTrueColorImageDCT
_TEXT	ENDS
EXTRN	?RestoreRGB24II@ERIDecoder@@IAEXPAEJQAPAMHH@Z:NEAR ; ERIDecoder::RestoreRGB24II
EXTRN	?RestoreRGBA32II@ERIDecoder@@IAEXPAEJQAPAMHH@Z:NEAR ; ERIDecoder::RestoreRGBA32II
_TEXT	SEGMENT
_fdwFormatType$ = 8
_dwBitsPerPixel$ = 12
_this$ = -4
?GetRestoreFuncII@ERIDecoder@@MAEP81@AEXPAEJQAPAMHH@ZKK@Z PROC NEAR ; ERIDecoder::GetRestoreFuncII
; Line 2111
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 2112
	cmp	DWORD PTR _dwBitsPerPixel$[ebp], 24	; 00000018H
	je	SHORT $L31944
	cmp	DWORD PTR _dwBitsPerPixel$[ebp], 32	; 00000020H
	je	SHORT $L31944
; Line 2114
	xor	eax, eax
	jmp	SHORT $L31943
$L31944:
; Line 2117
	mov	eax, DWORD PTR _fdwFormatType$[ebp]
	and	eax, 67108864				; 04000000H
	test	eax, eax
	je	SHORT $L31945
; Line 2119
	mov	eax, OFFSET FLAT:?RestoreRGBA32II@ERIDecoder@@IAEXPAEJQAPAMHH@Z ; ERIDecoder::RestoreRGBA32II
	jmp	SHORT $L31943
$L31945:
; Line 2123
	mov	eax, OFFSET FLAT:?RestoreRGB24II@ERIDecoder@@IAEXPAEJQAPAMHH@Z ; ERIDecoder::RestoreRGB24II
$L31943:
; Line 2125
	mov	esp, ebp
	pop	ebp
	ret	8
?GetRestoreFuncII@ERIDecoder@@MAEP81@AEXPAEJQAPAMHH@ZKK@Z ENDP ; ERIDecoder::GetRestoreFuncII
_TEXT	ENDS
PUBLIC	?RoundR32ToByte@ERIDecoder@@IAEEM@Z		; ERIDecoder::RoundR32ToByte
EXTRN	_eriRoundR32ToInt:NEAR
_TEXT	SEGMENT
_r$ = 8
_this$ = -8
_n$ = -4
?RoundR32ToByte@ERIDecoder@@IAEEM@Z PROC NEAR		; ERIDecoder::RoundR32ToByte
; Line 2131
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2132
	mov	eax, DWORD PTR _r$[ebp]
	push	eax
	call	_eriRoundR32ToInt
	add	esp, 4
	mov	DWORD PTR _n$[ebp], eax
; Line 2133
	cmp	DWORD PTR _n$[ebp], 0
	jge	SHORT $L31951
; Line 2135
	xor	al, al
	jmp	SHORT $L31949
$L31951:
; Line 2137
	cmp	DWORD PTR _n$[ebp], 256			; 00000100H
	jl	SHORT $L31953
; Line 2139
	or	al, 255					; 000000ffH
	jmp	SHORT $L31949
$L31953:
; Line 2141
	mov	al, BYTE PTR _n$[ebp]
$L31949:
; Line 2142
	mov	esp, ebp
	pop	ebp
	ret	4
?RoundR32ToByte@ERIDecoder@@IAEEM@Z ENDP		; ERIDecoder::RoundR32ToByte
_TEXT	ENDS
EXTRN	_eriSquareIDCT:NEAR
_TEXT	SEGMENT
_this$ = -8
_i$ = -4
?PerformIDCT@ERIDecoder@@IAEXXZ PROC NEAR		; ERIDecoder::PerformIDCT
; Line 2148
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2149
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31960
$L31961:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31960:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+144]
	jge	SHORT $L31962
; Line 2154
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+348]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+344]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+56]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4+216]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4+280]
	push	edx
	call	_eriSquareIDCT
	add	esp, 20					; 00000014H
; Line 2155
	jmp	SHORT $L31961
$L31962:
; Line 2156
	mov	esp, ebp
	pop	ebp
	ret	0
?PerformIDCT@ERIDecoder@@IAEXXZ ENDP			; ERIDecoder::PerformIDCT
_TEXT	ENDS
CONST	SEGMENT
$T32088	DD	043800000r			; 256
CONST	ENDS
_TEXT	SEGMENT
_bytCoefficient$ = 8
_this$ = -108
_i$ = -84
_j$ = -88
_scale$ = -64
_c_count$ = -76
_ptrQuantumized$ = -80
_ptrDst$ = -96
_count$ = -72
_rYScale$ = -68
_rCScale$ = -100
_pArrange$ = -92
_ptrSrc$32029 = -104
?ArrangeAndIQuantumize@ERIDecoder@@IAEXQAE@Z PROC NEAR	; ERIDecoder::ArrangeAndIQuantumize
; Line 2162
	push	ebp
	mov	ebp, esp
	sub	esp, 152				; 00000098H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2167
	mov	DWORD PTR _c_count$[ebp], 12		; 0000000cH
; Line 2168
	mov	eax, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [eax+36], 262658		; 00040202H
	jne	SHORT $L31970
; Line 2170
	mov	DWORD PTR _c_count$[ebp], 8
; Line 2172
	jmp	SHORT $L31971
$L31970:
	mov	ecx, DWORD PTR _this$[ebp]
	cmp	DWORD PTR [ecx+36], 262401		; 00040101H
	jne	SHORT $L31972
; Line 2174
	mov	DWORD PTR _c_count$[ebp], 6
$L31972:
$L31971:
; Line 2176
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+424]
	mov	DWORD PTR _scale$[ebp+12], eax
	mov	ecx, DWORD PTR _scale$[ebp+12]
	mov	DWORD PTR _scale$[ebp+8], ecx
	mov	edx, DWORD PTR _scale$[ebp+8]
	mov	DWORD PTR _scale$[ebp+4], edx
	mov	eax, DWORD PTR _scale$[ebp+4]
	mov	DWORD PTR _scale$[ebp], eax
; Line 2177
	mov	DWORD PTR _i$[ebp], 4
	jmp	SHORT $L31973
$L31974:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L31973:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _c_count$[ebp]
	jge	SHORT $L31975
; Line 2179
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+428]
	mov	DWORD PTR _scale$[ebp+eax*4], edx
; Line 2180
	jmp	SHORT $L31974
$L31975:
; Line 2181
	jmp	SHORT $L31977
$L31978:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31977:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+144]
	jge	SHORT $L31979
; Line 2183
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+424]
	mov	DWORD PTR _scale$[ebp+eax*4], edx
; Line 2184
	jmp	SHORT $L31978
$L31979:
; Line 2187
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	mov	DWORD PTR _ptrQuantumized$[ebp], ecx
; Line 2188
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+280]
	mov	DWORD PTR _ptrDst$[ebp], eax
; Line 2189
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+144]
	mov	DWORD PTR _count$[ebp], edx
; Line 2190
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31984
$L31985:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31984:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _count$[ebp]
	jge	SHORT $L31986
; Line 2192
	mov	edx, DWORD PTR _ptrQuantumized$[ebp]
	fild	DWORD PTR [edx]
	fstp	DWORD PTR -112+[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	fld	DWORD PTR _scale$[ebp+eax*4]
	fmul	DWORD PTR -112+[ebp]
	mov	ecx, DWORD PTR _ptrDst$[ebp]
	fstp	DWORD PTR [ecx]
	mov	edx, DWORD PTR _ptrDst$[ebp]
	add	edx, 4
	mov	DWORD PTR _ptrDst$[ebp], edx
	mov	eax, DWORD PTR _ptrQuantumized$[ebp]
	add	eax, 4
	mov	DWORD PTR _ptrQuantumized$[ebp], eax
; Line 2193
	jmp	SHORT $L31985
$L31986:
; Line 2197
	mov	ecx, DWORD PTR _this$[ebp]
	fld	DWORD PTR [ecx+420]
	fmul	DWORD PTR $T32088
	mov	edx, DWORD PTR _bytCoefficient$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx]
	add	eax, 1
	mov	DWORD PTR -116+[ebp], eax
	fild	DWORD PTR -116+[ebp]
	fstp	DWORD PTR -120+[ebp]
	fdiv	DWORD PTR -120+[ebp]
	fstp	DWORD PTR _rYScale$[ebp]
; Line 2198
	mov	ecx, DWORD PTR _this$[ebp]
	fld	DWORD PTR [ecx+420]
	fmul	DWORD PTR $T32088
	mov	edx, DWORD PTR _bytCoefficient$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+1]
	add	eax, 1
	mov	DWORD PTR -124+[ebp], eax
	fild	DWORD PTR -124+[ebp]
	fstp	DWORD PTR -128+[ebp]
	fdiv	DWORD PTR -128+[ebp]
	fstp	DWORD PTR _rCScale$[ebp]
; Line 2200
	mov	ecx, DWORD PTR _rYScale$[ebp]
	mov	DWORD PTR _scale$[ebp+12], ecx
	mov	edx, DWORD PTR _scale$[ebp+12]
	mov	DWORD PTR _scale$[ebp+8], edx
	mov	eax, DWORD PTR _scale$[ebp+8]
	mov	DWORD PTR _scale$[ebp+4], eax
	mov	ecx, DWORD PTR _scale$[ebp+4]
	mov	DWORD PTR _scale$[ebp], ecx
; Line 2201
	mov	DWORD PTR _i$[ebp], 4
	jmp	SHORT $L31992
$L31993:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31992:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _c_count$[ebp]
	jge	SHORT $L31994
; Line 2203
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _rCScale$[ebp]
	mov	DWORD PTR _scale$[ebp+ecx*4], edx
; Line 2204
	jmp	SHORT $L31993
$L31994:
; Line 2205
	jmp	SHORT $L31996
$L31997:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L31996:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+144]
	jge	SHORT $L31998
; Line 2207
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _rYScale$[ebp]
	mov	DWORD PTR _scale$[ebp+eax*4], ecx
; Line 2208
	jmp	SHORT $L31997
$L31998:
; Line 2212
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+72]
	sub	eax, 1
	mov	ecx, DWORD PTR _this$[ebp]
	imul	eax, DWORD PTR [ecx+72]
	shr	eax, 1
	sub	eax, 1
	mov	DWORD PTR _count$[ebp], eax
; Line 2213
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L31999
$L32000:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L31999:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _count$[ebp]
	jge	SHORT $L32001
; Line 2215
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32003
$L32004:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L32003:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+144]
	jge	SHORT $L32005
; Line 2217
	mov	ecx, DWORD PTR _ptrQuantumized$[ebp]
	fild	DWORD PTR [ecx]
	fstp	DWORD PTR -132+[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	fld	DWORD PTR _scale$[ebp+edx*4]
	fmul	DWORD PTR -132+[ebp]
	mov	eax, DWORD PTR _ptrDst$[ebp]
	fstp	DWORD PTR [eax]
	mov	ecx, DWORD PTR _ptrDst$[ebp]
	add	ecx, 4
	mov	DWORD PTR _ptrDst$[ebp], ecx
	mov	edx, DWORD PTR _ptrQuantumized$[ebp]
	add	edx, 4
	mov	DWORD PTR _ptrQuantumized$[ebp], edx
; Line 2218
	jmp	SHORT $L32004
$L32005:
; Line 2219
	jmp	SHORT $L32000
$L32001:
; Line 2222
	mov	eax, DWORD PTR _this$[ebp]
	fld	DWORD PTR [eax+420]
	fmul	DWORD PTR $T32088
	mov	ecx, DWORD PTR _bytCoefficient$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx+2]
	add	edx, 1
	mov	DWORD PTR -136+[ebp], edx
	fild	DWORD PTR -136+[ebp]
	fstp	DWORD PTR -140+[ebp]
	fdiv	DWORD PTR -140+[ebp]
	fstp	DWORD PTR _rYScale$[ebp]
; Line 2223
	mov	eax, DWORD PTR _this$[ebp]
	fld	DWORD PTR [eax+420]
	fmul	DWORD PTR $T32088
	mov	ecx, DWORD PTR _bytCoefficient$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx+3]
	add	edx, 1
	mov	DWORD PTR -144+[ebp], edx
	fild	DWORD PTR -144+[ebp]
	fstp	DWORD PTR -148+[ebp]
	fdiv	DWORD PTR -148+[ebp]
	fstp	DWORD PTR _rCScale$[ebp]
; Line 2225
	mov	eax, DWORD PTR _rYScale$[ebp]
	mov	DWORD PTR _scale$[ebp+12], eax
	mov	ecx, DWORD PTR _scale$[ebp+12]
	mov	DWORD PTR _scale$[ebp+8], ecx
	mov	edx, DWORD PTR _scale$[ebp+8]
	mov	DWORD PTR _scale$[ebp+4], edx
	mov	eax, DWORD PTR _scale$[ebp+4]
	mov	DWORD PTR _scale$[ebp], eax
; Line 2226
	mov	DWORD PTR _i$[ebp], 4
	jmp	SHORT $L32009
$L32010:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L32009:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _c_count$[ebp]
	jge	SHORT $L32011
; Line 2228
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _rCScale$[ebp]
	mov	DWORD PTR _scale$[ebp+eax*4], ecx
; Line 2229
	jmp	SHORT $L32010
$L32011:
; Line 2230
	jmp	SHORT $L32013
$L32014:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32013:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+144]
	jge	SHORT $L32015
; Line 2232
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _rYScale$[ebp]
	mov	DWORD PTR _scale$[ebp+edx*4], eax
; Line 2233
	jmp	SHORT $L32014
$L32015:
; Line 2236
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	add	edx, 1
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	imul	ecx, edx
	shr	ecx, 1
	mov	DWORD PTR _count$[ebp], ecx
; Line 2237
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32016
$L32017:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32016:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _count$[ebp]
	jge	SHORT $L32018
; Line 2239
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32020
$L32021:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L32020:
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR [edx+144]
	jge	SHORT $L32022
; Line 2241
	mov	ecx, DWORD PTR _ptrQuantumized$[ebp]
	fild	DWORD PTR [ecx]
	fstp	DWORD PTR -152+[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	fld	DWORD PTR _scale$[ebp+edx*4]
	fmul	DWORD PTR -152+[ebp]
	mov	eax, DWORD PTR _ptrDst$[ebp]
	fstp	DWORD PTR [eax]
	mov	ecx, DWORD PTR _ptrDst$[ebp]
	add	ecx, 4
	mov	DWORD PTR _ptrDst$[ebp], ecx
	mov	edx, DWORD PTR _ptrQuantumized$[ebp]
	add	edx, 4
	mov	DWORD PTR _ptrQuantumized$[ebp], edx
; Line 2242
	jmp	SHORT $L32021
$L32022:
; Line 2243
	jmp	SHORT $L32017
$L32018:
; Line 2246
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	mov	DWORD PTR _pArrange$[ebp], ecx
; Line 2247
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L32026
$L32027:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L32026:
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+144]
	jge	SHORT $L32028
; Line 2249
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+280]
	mov	ecx, DWORD PTR _i$[ebp]
	lea	edx, DWORD PTR [eax+ecx*4]
	mov	DWORD PTR _ptrSrc$32029[ebp], edx
; Line 2250
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4+216]
	mov	DWORD PTR _ptrDst$[ebp], edx
; Line 2252
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L32031
$L32032:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L32031:
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR [ecx+76]
	jge	SHORT $L32033
; Line 2254
	mov	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _pArrange$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR _ptrDst$[ebp]
	mov	ecx, DWORD PTR _ptrSrc$32029[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	DWORD PTR [eax+edx*4], ecx
; Line 2255
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+144]
	mov	ecx, DWORD PTR _ptrSrc$32029[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _ptrSrc$32029[ebp], edx
; Line 2256
	jmp	SHORT $L32032
$L32033:
; Line 2257
	jmp	SHORT $L32027
$L32028:
; Line 2258
	mov	esp, ebp
	pop	ebp
	ret	4
?ArrangeAndIQuantumize@ERIDecoder@@IAEXQAE@Z ENDP	; ERIDecoder::ArrangeAndIQuantumize
_this$ = -4
?OnDecodedBlock@ERIDecoder@@MAEHJJ@Z PROC NEAR		; ERIDecoder::OnDecodedBlock
; Line 2264
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 2265
	xor	eax, eax
; Line 2266
	mov	esp, ebp
	pop	ebp
	ret	8
?OnDecodedBlock@ERIDecoder@@MAEHJJ@Z ENDP		; ERIDecoder::OnDecodedBlock
_this$ = -4
?OnDecodedLine@ERIDecoder@@MAEHJ@Z PROC NEAR		; ERIDecoder::OnDecodedLine
; Line 2269
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 2270
	xor	eax, eax
; Line 2271
	mov	esp, ebp
	pop	ebp
	ret	4
?OnDecodedLine@ERIDecoder@@MAEHJ@Z ENDP			; ERIDecoder::OnDecodedLine
_TEXT	ENDS
PUBLIC	??0EFileDecodeContext@@QAE@PAVEFileObject@@K@Z	; EFileDecodeContext::EFileDecodeContext
PUBLIC	?ReadNextData@EFileDecodeContext@@UAEKPAEK@Z	; EFileDecodeContext::ReadNextData
PUBLIC	??_7EFileDecodeContext@@6B@			; EFileDecodeContext::`vftable'
PUBLIC	??_GEFileDecodeContext@@UAEPAXI@Z		; EFileDecodeContext::`scalar deleting destructor'
;PUBLIC	??_EEFileDecodeContext@@UAEPAXI@Z		; EFileDecodeContext::`vector deleting destructor'
;	COMDAT ??_7EFileDecodeContext@@6B@
; File I:\EntisGLS\eri-chan\experi\experi.cpp
CONST	SEGMENT
??_7EFileDecodeContext@@6B@	LABEL	DWORD
;DD FLAT:??_EEFileDecodeContext@@UAEPAXI@Z ; EFileDecodeContext::`vftable'
	DD	FLAT:??_GEFileDecodeContext@@UAEPAXI@Z
	DD	FLAT:?ReadNextData@EFileDecodeContext@@UAEKPAEK@Z
CONST	ENDS
_TEXT	SEGMENT
_pFileObj$ = 8
_nBufferingSize$ = 12
_this$ = -4
??0EFileDecodeContext@@QAE@PAVEFileObject@@K@Z PROC NEAR ; EFileDecodeContext::EFileDecodeContext
; File I:\EntisGLS\eri-chan\experi\experi.cpp
; Line 2284
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _nBufferingSize$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0RLHDecodeContext@@QAE@K@Z		; RLHDecodeContext::RLHDecodeContext
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _pFileObj$[ebp]
	mov	DWORD PTR [ecx+3156], edx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EFileDecodeContext@@6B@ ; EFileDecodeContext::`vftable'
; Line 2285
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	8
??0EFileDecodeContext@@QAE@PAVEFileObject@@K@Z ENDP	; EFileDecodeContext::EFileDecodeContext
_TEXT	ENDS
PUBLIC	??1EFileDecodeContext@@UAE@XZ			; EFileDecodeContext::~EFileDecodeContext
;	COMDAT ??_GEFileDecodeContext@@UAEPAXI@Z
_TEXT	SEGMENT
___flags$ = 8
_this$ = -4
??_GEFileDecodeContext@@UAEPAXI@Z PROC NEAR		; EFileDecodeContext::`scalar deleting destructor', COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1EFileDecodeContext@@UAE@XZ		; EFileDecodeContext::~EFileDecodeContext
	mov	eax, DWORD PTR ___flags$[ebp]
	and	eax, 1
	test	eax, eax
	je	SHORT $L32048
	mov	ecx, DWORD PTR _this$[ebp]
	push	ecx
	call	??3@YAXPAX@Z				; operator delete
	add	esp, 4
$L32048:
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??_GEFileDecodeContext@@UAEPAXI@Z ENDP			; EFileDecodeContext::`scalar deleting destructor'
_TEXT	ENDS
_TEXT	SEGMENT
_this$ = -4
??1EFileDecodeContext@@UAE@XZ PROC NEAR			; EFileDecodeContext::~EFileDecodeContext
; Line 2291
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], OFFSET FLAT:??_7EFileDecodeContext@@6B@ ; EFileDecodeContext::`vftable'
	mov	ecx, DWORD PTR _this$[ebp]
	call	??1RLHDecodeContext@@UAE@XZ		; RLHDecodeContext::~RLHDecodeContext
; Line 2292
	mov	esp, ebp
	pop	ebp
	ret	0
??1EFileDecodeContext@@UAE@XZ ENDP			; EFileDecodeContext::~EFileDecodeContext
_ptrBuffer$ = 8
_nBytes$ = 12
_this$ = -4
?ReadNextData@EFileDecodeContext@@UAEKPAEK@Z PROC NEAR	; EFileDecodeContext::ReadNextData
; Line 2298
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 2299
	mov	eax, DWORD PTR _nBytes$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptrBuffer$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [edx+3156]
	mov	eax, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [eax+3156]
	mov	eax, DWORD PTR [edx]
	call	DWORD PTR [eax+4]
; Line 2300
	mov	esp, ebp
	pop	ebp
	ret	8
?ReadNextData@EFileDecodeContext@@UAEKPAEK@Z ENDP	; EFileDecodeContext::ReadNextData
_TEXT	ENDS
PUBLIC	?AttachFileObject@EFileDecodeContext@@QAEXPAVEFileObject@@@Z ; EFileDecodeContext::AttachFileObject
_TEXT	SEGMENT
_pFileObj$ = 8
_this$ = -4
?AttachFileObject@EFileDecodeContext@@QAEXPAVEFileObject@@@Z PROC NEAR ; EFileDecodeContext::AttachFileObject
; Line 2306
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 2307
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _pFileObj$[ebp]
	mov	DWORD PTR [eax+3156], ecx
; Line 2308
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FlushBuffer@RLHDecodeContext@@QAEXXZ	; RLHDecodeContext::FlushBuffer
; Line 2309
	mov	esp, ebp
	pop	ebp
	ret	4
?AttachFileObject@EFileDecodeContext@@QAEXPAVEFileObject@@@Z ENDP ; EFileDecodeContext::AttachFileObject
_TEXT	ENDS
END
