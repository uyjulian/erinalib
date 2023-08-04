
; ****************************************************************************
;                        E R I N A - L i b r a r y
;                                                      最終更新 2001/11/04
; ----------------------------------------------------------------------------
;         Copyright (C) 2000-2001 Leshade Entis. All rights reserved.
; ****************************************************************************


	.586
	.MMX
	.Model	Flat

	Include	experi.inc
	Include	cmperi.inc

	MMWord	TextEqu	<QWord>


; ----------------------------------------------------------------------------
;                        コンスタントセグメント
; ----------------------------------------------------------------------------

ConstSeg	Segment	Para ReadOnly Flat 'CONST'

Align	10H
GammaTable	Label	Byte
		Byte	0
		Byte	1
		Byte	3, 3
		Byte	4 Dup( 5 )
		Byte	8 Dup( 7 )
		Byte	16 Dup( 9 )
		Byte	32 Dup( 11 )
		Byte	64 Dup( 13 )
		Byte	128 Dup( 15 )
		Byte	256 Dup( 17 )

Align	10H
iClrOpFull	Label	DWord
		DWord	5, 6, 7, 9, 10, 11, 13, 14, 15

Align	10H
iClrOpHalf	Label	DWord
		DWord	7, 11, 15


ConstSeg	EndS



; ----------------------------------------------------------------------------
;                             コードセグメント
; ----------------------------------------------------------------------------

CodeSeg	Segment	Para ReadOnly Flat 'CODE'

;
;	ｎビット出力するマクロ
; ----------------------------------------------------------------------------
; @OutNBits <esc_label>
; ----------------------------------------------------------------------------
; 引数；
;	EAX register	: 出力するビットパターン
;	EBX register	: RLHEncodeContext構造体へのポインタ
;	ECX register	: 出力するビット数
; レジスタ；
;	EBX, EBP, ESP レジスタは保存される。	
; ----------------------------------------------------------------------------

@OutNBits	Macro	esc_label:Req

	.While	ecx != 0
		Mov	edx, [ebx].m_nIntBufCount
		Mov	esi, [ebx].m_dwIntBuffer
		Lea	edi, [edx + ecx]
		.If	edi < 32
			;;
			;; 中間バッファには余裕がある
			ShlD	esi, eax, cl
			Mov	[ebx].m_nIntBufCount, edi
			Mov	[ebx].m_dwIntBuffer, esi
			.Break
		.Else
			;;
			;; 中間バッファがいっぱいになる
			.If	edx == 0
				Mov	esi, eax
				Xor	eax, eax
				Sub	ecx, 32
				Mov	[ebx].m_nIntBufCount, 0
			.Else
				Mov	edi, ecx
				Mov	ecx, 32
				Mov	[ebx].m_nIntBufCount, 0
				Sub	ecx, edx
				ShlD	esi, eax, cl
				Sub	edi, ecx
				Shl	eax, cl
				Mov	ecx, edi
			.EndIf
			;;
			;; バッファに出力
			Mov	edi, [ebx].m_ptrBuffer
			Mov	edx, [ebx].m_nBufCount
			BSwap	esi
			Mov	DWord Ptr [edi + edx], esi
			Add	edx, (SizeOf DWord)
			Mov	[ebx].m_nBufCount, edx
			;;
			.If	edx >= [ebx].m_nBufferingSize
				Push	eax
				Push	ecx
				;;
				IfNDef	_BORLAND_CPP
					Mov	ecx, ebx
					Push	edx
					Mov	edx, [ebx].pvfnTable
					Push	edi
					Call	Near32 Ptr [edx + VFI_WriteNextData]
				Else
					Push	edx
					Mov	edx, [ebx].pvfnTable
					Push	edi
					Push	ebx
					Call	Near32 Ptr [edx + VFI_WriteNextData]
					Add	esp, (SizeOf DWord) * 3
				EndIf
				;;
				Mov	edx, eax
				Pop	ecx
				Pop	eax
				Cmp	edx, [ebx].m_nBufCount
				Jb	esc_label
				Mov	[ebx].m_nBufCount, 0
			.EndIf
		.EndIf
	.EndW

	EndM


;
;	ｎビット出力する
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
RLHEncodeContext@@OutNBits	Proc	Near32 SysCall Uses ebx esi edi,
	dwData:DWord, n:SDWord
Else
RLHEncodeContext@@OutNBits	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PRLHEncodeContext, dwData:DWord, n:SDWord
EndIf

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
	Else
		Mov	ebx, _this
	EndIf
	Mov	eax, dwData
	Mov	ecx, n

	Assume	ebx:PRLHEncodeContext
	@OutNBits	esc_label
	Assume	ebx:Nothing
	Xor	eax, eax

	IfNDef	_BORLAND_CPP
		Ret	4 * 2
	Else
		Ret
	EndIf

esc_label:
	Mov	eax, 1
	IfNDef	_BORLAND_CPP
		Ret	4 * 2
	Else
		Ret
	EndIf

RLHEncodeContext@@OutNBits	EndP


;
;	ガンマ符号のビット長を計算
; ----------------------------------------------------------------------------
; @TryOutACode
; ----------------------------------------------------------------------------
; 引数；
;	EDX register	: ビット長を計算する値
; 返り値；
;	EAX レジスタに符号長が加算される
; レジスタ；
;	EBX, ESI, EDI, EBP, ESP レジスタは保存される
; ----------------------------------------------------------------------------

@TryOutACode	Macro

	.If	edx <= 1FFH
		MovZx	edx, GammaTable[edx]
		Add	eax, edx
	.Else
		Sub	edx, 200H
		Mov	ecx, 200H
		Add	eax, 17 + 2
		.While	edx >= ecx
			Sub	edx, ecx
			Add	ecx, ecx
			Add	eax, 2
		.EndW
	.EndIf

	EndM


;
;	ガンマ符号の符号長を計算する
; ----------------------------------------------------------------------------
Align	10H
RLHEncodeContext@@TryEncodeGammaCodes	Proc	Near32 SysCall Uses ebx esi edi,
	ptrSrc:PINT, nCount:DWord

	Xor	eax, eax
	Mov	esi, ptrSrc
	Mov	ecx, nCount
	;;
	.While	ecx != 0
		Mov	edi, SDWord Ptr [esi]
		Xor	edx, edx
		.If	edi == 0
			;;
			;; ゼロ信号の連続数を取得
			.Repeat
				Inc	edx
				Dec	ecx
				.Break	.If	Zero?
				Mov	edi, SDWord Ptr [esi + 4]
				Add	esi, (SizeOf DWord)
			.Until	edi != 0
			;;
			;; 符号の長さを加算
			Push	ecx
			@TryOutACode
			Pop	ecx
		.Else
			;;
			;; 非ゼロ信号の連続数を取得
			Push	esi
			.Repeat
				Add	esi, (SizeOf DWord)
				Inc	edx
				Dec	ecx
				.Break	.If	Zero?
				Mov	edi, SDWord Ptr [esi]
			.Until	edi != 0
			Pop	esi
			;;
			;; 符号の長さを加算
			Mov	edi, edx
			Push	ecx
			@TryOutACode
			;;
			;; 各符号の長さを加算
			.Repeat
				Inc	eax
				Mov	ebx, SDWord Ptr [esi]
				Add	esi, (SizeOf DWord)
				Mov	edx, ebx
				Sar	ebx, 31
				Xor	edx, ebx
				Sub	edx, ebx
				@TryOutACode
				Dec	edi
			.Until	Zero?
			Pop	ecx
		.EndIf
	.EndW

	Ret

RLHEncodeContext@@TryEncodeGammaCodes	EndP


;
;	ハフマン符号を出力するマクロ
; ----------------------------------------------------------------------------
; @OutAHuffmanCode <esc_label>
; ----------------------------------------------------------------------------
; 引数；
;	EAX register	: 符号化する数値（00H〜0FFH）＝ num
;	EBX register	: RLHEncodeContext 構造体へのポインタ
;	EDI register	: ERINA_HUFFMAN_TREE 構造体へのポインタ
; 不変変数；
;	_this		: Ptr RLHEncodeContext
;	tree		: Ptr ERINA_HUFFMAN_TREE
;	num		: DWord
; 一時変数；
;	iEntry		: SDWord
; レジスタ；
;	EBP, ESP レジスタは保存される
; ----------------------------------------------------------------------------

@OutAHuffmanCode	Macro	esc_label:Req

	PushContext	Assumes
	;;
	;; 指定のツリーエントリを取得
	Mov	edx, [edi].m_iSymLookup[eax * 4]
	.If	edx == ERINA_HUFFMAN_NULL
		;;
		;; エスケープコードを出力
		Mov	edx, [edi].m_iEscape
		.If	edx != ERINA_HUFFMAN_NULL
			Xor	ecx, ecx
			.Repeat
				MovZx	esi, [edi].m_hnTree[edx * 8].m_parent
				Inc	ecx
				Cmp	[edi].m_hnTree[esi * 8].m_child_code, edx
				Rcr	eax, 1
				Mov	edx, esi
			.Until	esi >= ERINA_HUFFMAN_ROOT
			;;
			@OutNBits	esc_label
			;;
			Mov	ebx, tree
			Assume	ebx:Ptr ERINA_HUFFMAN_TREE
			Mov	eax, [ebx].m_iEscape
			@TREE@@IncreaseOccuredCount	0
			Mov	ebx, _this
			Assume	ebx:Ptr RLHEncodeContext
		.EndIf
		;;
		Mov	eax, num
		Mov	ecx, 8
		Shl	eax, 24
		@OutNBits	esc_label
		;;
		IfNDef	_BORLAND_CPP
			Mov	ecx, tree
			Push	num
			Call	ERINA_HUFFMAN_TREE@@AddNewEntry
		Else
			Push	num
			Push	tree
			Call	ERINA_HUFFMAN_TREE@@AddNewEntry
			Add	esp, (SizeOf DWord) * 2
		EndIf
	.Else
		;;
		;; 普通のコードを出力
		Mov	iEntry, edx
		Xor	ecx, ecx
		.Repeat
			MovZx	esi, [edi].m_hnTree[edx * 8].m_parent
			Inc	ecx
			Cmp	[edi].m_hnTree[esi * 8].m_child_code, edx
			Rcr	eax, 1
			Mov	edx, esi
		.Until	esi >= ERINA_HUFFMAN_ROOT
		;;
		@OutNBits	esc_label
		;;
		Mov	ebx, tree
		Assume	ebx:Ptr ERINA_HUFFMAN_TREE
		Mov	eax, iEntry
		@TREE@@IncreaseOccuredCount	0
	.EndIf
	PopContext	Assumes

	EndM


;
;	ハフマン符号を出力する
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
RLHEncodeContext@@OutAHuffmanCode	Proc	Near32 SysCall Uses ebx esi edi,
	tree:PERINA_HUFFMAN_TREE, num:SDWord
	Local	_this:PRLHEncodeContext
Else
RLHEncodeContext@@OutAHuffmanCode	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PRLHEncodeContext, tree:PERINA_HUFFMAN_TREE, num:SDWord
EndIf

	Local	dwInitESP:DWord
	Local	iEntry:SDWord

	Mov	dwInitESP, esp

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
		Mov	_this, ecx
	Else
		Mov	ebx, _this
	EndIf
	Mov	edi, tree

	Assume	ebx:Ptr RLHEncodeContext
	Assume	edi:Ptr ERINA_HUFFMAN_TREE
	Mov	eax, num
	And	eax, 0FFH
	Mov	num, eax
	@OutAHuffmanCode	esc_label
	Assume	ebx:Nothing
	Assume	edi:Nothing

	Xor	eax, eax
	IfNDef	_BORLAND_CPP
		Ret	4 * 2
	Else
		Ret
	EndIf

esc_label:
	Mov	esp, dwInitESP
	Mov	eax, 1
	IfNDef	_BORLAND_CPP
		Ret	4 * 2
	Else
		Ret
	EndIf

RLHEncodeContext@@OutAHuffmanCode	EndP


;
;	長さをハフマン符号にして出力するマクロ
; ----------------------------------------------------------------------------
; @OutLengthHuffman <esc_label>
; ----------------------------------------------------------------------------
; 引数；
;	EAX register	: 符号化する数値 ＝ _length
;	EBX register	: RLHEncodeContext 構造体へのポインタ
;	EDI register	: ERINA_HUFFMAN_TREE 構造体へのポインタ
; 不変変数；
;	_this		: Ptr RLHEncodeContext
;	tree		: Ptr ERINA_HUFFMAN_TREE
;	_length		: DWord
; 一時変数；
;	iEntry		: SDWord
; レジスタ；
;	EBP, ESP レジスタは保存される
; ----------------------------------------------------------------------------

@OutLengthHuffman	Macro	esc_label:Req
	Local	Label1, Label2, Label3

	PushContext	Assumes
	;;
	;; 指定のツリーエントリを取得
	And	eax, 0FFH
	Mov	edx, [edi].m_iSymLookup[eax * 4]
	Cmp	edx, ERINA_HUFFMAN_NULL
	Jz	Label1
	Mov	eax, [edi].m_hnTree[edx * 8].m_child_code
	And	eax, (Not ERINA_CODE_FLAG)
	Cmp	eax, _length
	Jz	Label2
Label1:	;;
	;; ツリーエントリを検索
	Mov	eax, _length
	Mov	ecx, [edi].m_iTreePointer
	Mov	edx, ERINA_HUFFMAN_ROOT - 1
	Or	eax, ERINA_CODE_FLAG
	.While	(SDWord Ptr edx) >= (SDWord Ptr ecx)
		Mov	esi, [edi].m_hnTree[edx * 8].m_child_code
		Cmp	esi, eax
		Jz	Label2
		Dec	edx
	.EndW
	;;
	;; エスケープコードを出力
	Mov	edx, [edi].m_iEscape
	.If	edx != ERINA_HUFFMAN_NULL
		Xor	ecx, ecx
		.Repeat
			MovZx	esi, [edi].m_hnTree[edx * 8].m_parent
			Inc	ecx
			Cmp	[edi].m_hnTree[esi * 8].m_child_code, edx
			Rcr	eax, 1
			Mov	edx, esi
		.Until	esi >= ERINA_HUFFMAN_ROOT
		;;
		@OutNBits	esc_label
		;;
		Mov	ebx, tree
		Assume	ebx:Ptr ERINA_HUFFMAN_TREE
		Mov	eax, [ebx].m_iEscape
		@TREE@@IncreaseOccuredCount	0
		Mov	ebx, _this
		Assume	ebx:Ptr RLHEncodeContext
	.EndIf
	;;
	IfNDef	_BORLAND_CPP
		Mov	ecx, _this
		Push	_length
		Call	RLHEncodeContext@@OutACode
		Mov	ecx, tree
		Push	_length
		Call	ERINA_HUFFMAN_TREE@@AddNewEntry
	Else
		Push	_length
		Push	_this
		Call	RLHEncodeContext@@OutACode
		Push	_length
		Push	tree
		Call	ERINA_HUFFMAN_TREE@@AddNewEntry
		Add	esp, (SizeOf DWord) * 2
	EndIf
	Jmp	Label3

Label2:
	;;
	;; 通常のハフマン符号を出力
	Mov	iEntry, edx
	Xor	ecx, ecx
	.Repeat
		MovZx	esi, [edi].m_hnTree[edx * 8].m_parent
		Inc	ecx
		Cmp	[edi].m_hnTree[esi * 8].m_child_code, edx
		Rcr	eax, 1
		Mov	edx, esi
	.Until	esi >= ERINA_HUFFMAN_ROOT
	;;
	@OutNBits	esc_label
	;;
	Mov	ebx, tree
	Assume	ebx:Ptr ERINA_HUFFMAN_TREE
	Mov	eax, iEntry
	@TREE@@IncreaseOccuredCount	0

Label3:
	PopContext	Assumes

	EndM


;
;	長さをハフマン符号にして出力
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
RLHEncodeContext@@OutLengthHuffman	Proc	Near32 SysCall Uses ebx esi edi,
	tree:PERINA_HUFFMAN_TREE, _length:DWord
	Local	_this:PRLHEncodeContext
Else
RLHEncodeContext@@OutLengthHuffman	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PRLHEncodeContext, tree:PERINA_HUFFMAN_TREE, _length:DWord
EndIf

	Local	dwInitESP:DWord
	Local	iEntry:SDWord

	Mov	dwInitESP, esp

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
		Mov	_this, ecx
	Else
		Mov	ebx, _this
	EndIf
	Mov	edi, tree

	Assume	ebx:Ptr RLHEncodeContext
	Assume	edi:Ptr ERINA_HUFFMAN_TREE
	Mov	eax, _length
	@OutLengthHuffman	esc_label
	Assume	ebx:Nothing
	Assume	edi:Nothing

	Xor	eax, eax
	IfNDef	_BORLAND_CPP
		Ret	4 * 2
	Else
		Ret
	EndIf

esc_label:
	Mov	esp, dwInitESP
	Mov	eax, 1
	IfNDef	_BORLAND_CPP
		Ret	4 * 2
	Else
		Ret
	EndIf

RLHEncodeContext@@OutLengthHuffman	EndP


;
;	ERINA 符号に符号化して出力する
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
RLHEncodeContext@@EncodeERINACodes	Proc	Near32 SysCall Uses ebx esi edi,
	ptrSrc:PINT, nCount:DWord
	Local	_this:PRLHEncodeContext
Else
RLHEncodeContext@@EncodeERINACodes	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PRLHEncodeContext, ptrSrc:PINT, nCount:DWord
EndIf

	Local	tree:PERINA_HUFFMAN_TREE
	Local	dwInitESP:DWord
	Local	iEntry:SDWord
	Local	nEncoded:DWord
	Local	num:DWord, _length:DWord

	Mov	dwInitESP, esp

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
		Mov	_this, ecx
	Else
		Mov	ebx, _this
	EndIf

	Assume	ebx:Ptr RLHEncodeContext

	Mov	eax, [ebx].m_pLastHuffmanTree
	Mov	ecx, nCount
	Mov	nEncoded, 0
	Mov	tree, eax
	Mov	edi, eax
	;;
	.While	ecx != 0
		;;
		;; 次の符号を符号化
		Mov	esi, ptrSrc
		Mov	edx, nEncoded
		Dec	ecx
		MovZx	eax, Byte Ptr [esi]
		Inc	edx
		Add	esi, (SizeOf SDWord)
		Mov	nCount, ecx
		Mov	nEncoded, edx
		Mov	ptrSrc, esi
		;;
		Mov	num, eax
		Assume	edi:PERINA_HUFFMAN_TREE
		@OutAHuffmanCode	esc_label
		Assume	edi:Nothing
		;;
		;; ゼロランレングス
		Mov	eax, num
		Mov	ebx, _this
		.If	eax == 0
			;;
			;; 長さを取得
			Mov	eax, 1
			Mov	ecx, nCount
			Mov	esi, ptrSrc
			.If	ecx != 0
			.Repeat
				Mov	dl, Byte Ptr [esi]
				.Break	.If	dl != 0
				Inc	eax
				Add	esi, (SizeOf SDWord)
				Dec	ecx
			.Until	Zero?
			.EndIf
			Mov	edx, nEncoded
			Mov	_length, eax
			Mov	nCount, ecx
			Lea	edx, [edx + eax - 1]
			Mov	ptrSrc, esi
			Mov	nEncoded, edx
			;;
			;; 長さを符号化
			Mov	edi, [ebx].m_pHuffmanTree[100H * 4]
			Mov	tree, edi
			Assume	edi:PERINA_HUFFMAN_TREE
			@OutLengthHuffman	esc_label
			Assume	edi:Nothing
			;;
			Mov	ebx, _this
			Mov	eax, num
		.EndIf
		;;
		Mov	edi, [ebx].m_pHuffmanTree[eax * 4]
		Mov	ecx, nCount
		Mov	tree, edi
	.EndW

	Mov	eax, tree
	Mov	[ebx].m_pLastHuffmanTree, eax
	Assume	ebx:Nothing
esc_label:
	Mov	esp, dwInitESP
	Mov	eax, nEncoded
	IfNDef	_BORLAND_CPP
		Ret	4 * 2
	Else
		Ret
	EndIf

RLHEncodeContext@@EncodeERINACodes	EndP


;
;	ERINA 符号に符号化して出力する（8ビットバージョン）
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
RLHEncodeContext@@EncodeERINACodesSBZL	Proc	Near32 SysCall Uses ebx esi edi,
	ptrSrc:Ptr SByte, nCount:DWord
	Local	_this:PRLHEncodeContext
Else
RLHEncodeContext@@EncodeERINACodesSBZL	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PRLHEncodeContext, ptrSrc:Ptr SByte, nCount:DWord
EndIf

	Local	tree:PERINA_HUFFMAN_TREE
	Local	dwInitESP:DWord
	Local	iEntry:SDWord
	Local	nEncoded:DWord
	Local	num:DWord, _length:DWord

	Mov	dwInitESP, esp

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
		Mov	_this, ecx
	Else
		Mov	ebx, _this
	EndIf

	Assume	ebx:Ptr RLHEncodeContext

	Mov	eax, [ebx].m_pLastHuffmanTree
	Mov	ecx, nCount
	Mov	nEncoded, 0
	Mov	tree, eax
	Mov	edi, eax
	;;
	.While	ecx != 0
		;;
		;; 次の符号を符号化
		Mov	esi, ptrSrc
		Mov	edx, nEncoded
		Dec	ecx
		MovZx	eax, Byte Ptr [esi]
		Inc	edx
		Inc	esi
		Mov	nCount, ecx
		Mov	nEncoded, edx
		Mov	ptrSrc, esi
		;;
		Mov	num, eax
		Assume	edi:PERINA_HUFFMAN_TREE
		@OutAHuffmanCode	esc_label
		Assume	edi:Nothing
		;;
		;; ゼロランレングス
		Mov	eax, num
		Mov	ebx, _this
		.If	eax == 0
			;;
			;; 長さを取得
			Mov	eax, 1
			Mov	ecx, nCount
			Mov	esi, ptrSrc
			.If	ecx != 0
			.Repeat
				Mov	dl, Byte Ptr [esi]
				.Break	.If	dl != 0
				Inc	eax
				Inc	esi
				Dec	ecx
			.Until	Zero?
			.EndIf
			Mov	edx, nEncoded
			Mov	_length, eax
			Mov	nCount, ecx
			Lea	edx, [edx + eax - 1]
			Mov	ptrSrc, esi
			Mov	nEncoded, edx
			;;
			;; 長さを符号化
			Mov	edi, [ebx].m_pHuffmanTree[100H * 4]
			Mov	tree, edi
			Assume	edi:PERINA_HUFFMAN_TREE
			@OutLengthHuffman	esc_label
			Assume	edi:Nothing
			;;
			Mov	ebx, _this
			Mov	eax, num
		.EndIf
		;;
		Mov	edi, [ebx].m_pHuffmanTree[eax * 4]
		Mov	ecx, nCount
		Mov	tree, edi
	.EndW

	Mov	eax, tree
	Mov	[ebx].m_pLastHuffmanTree, eax
	Assume	ebx:Nothing
esc_label:
	Mov	esp, dwInitESP
	Mov	eax, nEncoded
	IfNDef	_BORLAND_CPP
		Ret	4 * 2
	Else
		Ret
	EndIf

RLHEncodeContext@@EncodeERINACodesSBZL	EndP


;
;	ERINA 符号（256色用）に符号化して出力する
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
RLHEncodeContext@@EncodeERINACodes256	Proc	Near32 SysCall Uses ebx esi edi,
	ptrSrc:PBYTE, nCount:DWord
	Local	_this:PRLHEncodeContext
Else
RLHEncodeContext@@EncodeERINACodes256	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PRLHEncodeContext, ptrSrc:PBYTE, nCount:DWord
EndIf

	Local	tree:PERINA_HUFFMAN_TREE
	Local	dwInitESP:DWord
	Local	iEntry:SDWord
	Local	nEncoded:DWord
	Local	num:DWord, _length:DWord
	Local	nLastSymbol:SDWord

	Mov	dwInitESP, esp

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
		Mov	_this, ecx
	Else
		Mov	ebx, _this
	EndIf

	Assume	ebx:Ptr RLHEncodeContext

	Mov	eax, [ebx].m_pLastHuffmanTree
	Mov	ecx, nCount
	Mov	nLastSymbol, ERINA_HUFFMAN_ESCAPE
	Mov	nEncoded, 0
	Mov	tree, eax
	Mov	edi, eax
	;;
	.While	ecx != 0
		;;
		;; 次の符号を符号化
		Mov	esi, ptrSrc
		Mov	edx, nEncoded
		Dec	ecx
		MovZx	eax, Byte Ptr [esi]
		Inc	edx
		Inc	esi
		Mov	nCount, ecx
		Mov	nEncoded, edx
		Mov	ptrSrc, esi
		;;
		Mov	num, eax
		Assume	edi:PERINA_HUFFMAN_TREE
		@OutAHuffmanCode	esc_label
		Assume	edi:Nothing
		;;
		;; ゼロランレングス
		Mov	eax, num
		Mov	ebx, _this
		.If	eax == nLastSymbol
			;;
			;; 長さを取得
			Mov	dh, al
			Mov	eax, 1
			Mov	ecx, nCount
			Mov	esi, ptrSrc
			.If	ecx != 0
			.Repeat
				Mov	dl, Byte Ptr [esi]
				.Break	.If	dl != dh
				Inc	eax
				Inc	esi
				Dec	ecx
			.Until	Zero?
			.EndIf
			Mov	edx, nEncoded
			Mov	_length, eax
			Mov	nCount, ecx
			Lea	edx, [edx + eax - 1]
			Mov	ptrSrc, esi
			Mov	nEncoded, edx
			;;
			;; 長さを符号化
			Mov	edi, [ebx].m_pHuffmanTree[100H * 4]
			Mov	tree, edi
			Assume	edi:PERINA_HUFFMAN_TREE
			@OutLengthHuffman	esc_label
			Assume	edi:Nothing
			;;
			Mov	ebx, _this
			Mov	eax, num
		.EndIf
		;;
		Mov	nLastSymbol, eax
		Mov	edi, [ebx].m_pHuffmanTree[eax * 4]
		Mov	ecx, nCount
		Mov	tree, edi
	.EndW

	Mov	eax, tree
	Mov	[ebx].m_pLastHuffmanTree, eax
	Assume	ebx:Nothing
esc_label:
	Mov	esp, dwInitESP
	Mov	eax, nEncoded
	IfNDef	_BORLAND_CPP
		Ret	4 * 2
	Else
		Ret
	EndIf

RLHEncodeContext@@EncodeERINACodes256	EndP


;
;	空間差分処理
; ----------------------------------------------------------------------------

@VerticalDifferentialOperation	Macro

	Mov	eax, [ebx].m_nBlockSize
	Mov	edi, ptrNextLineBuf
	Mov	ecx, [ebx].m_nChannelCount
	Mov	esi, [ebx].m_ptrBuffer1
	Mov	edi, PINT Ptr [edi]
	;
	.If	(eax >= 4) && (ERI_EnabledProcessorType & ERI_USE_MMX_PENTIUM)
		.Repeat
			Mov	nChannelCount, ecx
			Mov	ptrLineBuf, edi
			Mov	ecx, [ebx].m_nBlockSize
			.Repeat
				Mov	edi, ptrLineBuf
				Mov	edx, [ebx].m_nBlockSize
				.Repeat
					movq	mm0, MMWord Ptr [esi]
					movq	mm1, MMWord Ptr [edi]
					movq	mm2, MMWord Ptr [esi + 8]
					movq	mm3, MMWord Ptr [edi + 8]
					movq	MMWord Ptr [edi], mm0
					psubd	mm0, mm1
					movq	MMWord Ptr [edi + 8], mm2
					psubd	mm2, mm3
					movq	MMWord Ptr [esi], mm0
					Add	edi, 16
					movq	MMWord Ptr [esi + 8], mm2
					Add	esi, 16
					Sub	edx, 4
				.Until	Zero?
				;
				Dec	ecx
			.Until	Zero?
			Mov	ecx, nChannelCount
			Dec	ecx
		.Until	Zero?
	.Else
		.Repeat
			Mov	nChannelCount, ecx
			Mov	ptrLineBuf, edi
			Mov	ecx, [ebx].m_nBlockSize
			.Repeat
				Mov	nBlockSize, ecx
				;
				Mov	edi, ptrLineBuf
				Mov	ecx, [ebx].m_nBlockSize
				.Repeat
					Mov	edx, SDWord Ptr [edi]
					Mov	eax, SDWord Ptr [esi]
					Mov	SDWord Ptr [edi], eax
					Sub	eax, edx
					Add	edi, (SizeOf SDWord)
					Mov	SDWord Ptr [esi], eax
					Add	esi, (SizeOf SDWord)
					Dec	ecx
				.Until	Zero?
				;
				Mov	ecx, nBlockSize
				Dec	ecx
			.Until	Zero?
			Mov	ecx, nChannelCount
			Dec	ecx
		.Until	Zero?
	.EndIf
	Mov	eax, ptrNextLineBuf
	Mov	PINT Ptr [eax], edi

	EndM

@HorizontalDifferentialOperation	Macro

	Mov	esi, [ebx].m_ptrBuffer1
	Mov	edi, [ebx].m_ptrColumnBuf
	Mov	ecx, nAllBlockLines
	Mov	ptrNextColBuf, edi
	.Repeat
		Mov	nAllBlockLines, ecx
		;
		Push	ebx
		Mov	ecx, [ebx].m_nBlockSize
		Lea	edi, [esi + ecx * 4]
		Mov	edx, SDWord Ptr [esi + ecx * 4 - 4]
		Mov	ebx, SDWord Ptr [edi + ecx * 4 - 4]
		Mov	nRightVal[0], edx
		Mov	nRightVal[4], ebx
		;
		Dec	ecx
		.If	!Zero?
		Push	ebp
		.Repeat
			Mov	eax, SDWord Ptr [esi + ecx * 4 - 4]
			Mov	ebp, SDWord Ptr [edi + ecx * 4 - 4]
			Sub	edx, eax
			Sub	ebx, ebp
			Mov	SDWord Ptr [esi + ecx * 4], edx
			Mov	edx, eax
			Mov	SDWord Ptr [edi + ecx * 4], ebx
			Mov	ebx, ebp
			Dec	ecx
		.Until	Zero?
		Pop	ebp
		.EndIf
		Mov	eax, ptrNextColBuf
		Mov	ecx, ebx
		Pop	ebx
		;
		Sub	edx, SDWord Ptr [eax]
		Sub	ecx, SDWord Ptr [eax + 4]
		Mov	SDWord Ptr [esi], edx
		Mov	SDWord Ptr [edi], ecx
		Mov	ecx, nRightVal[0]
		Mov	edx, nRightVal[4]
		Mov	SDWord Ptr [eax], ecx
		Mov	SDWord Ptr [eax + 4], edx
		Mov	ecx, [ebx].m_nBlockSize
		Add	eax, 8
		Lea	esi, [edi + ecx * 4]
		Mov	ecx, nAllBlockLines
		Mov	ptrNextColBuf, eax
		;
		Sub	ecx, 2
	.Until	Zero?

	EndM

Align	10H
IfNDef	_BORLAND_CPP
ERIEncoder@@DifferentialOperation	Proc	Near32 SysCall ,
	nAllBlockLines:DWord, ptrNextLineBuf:Ptr PINT
Else
ERIEncoder@@DifferentialOperation	Proc	Near32 SysCall ,
	_this:PERIEncoder, nAllBlockLines:DWord, ptrNextLineBuf:Ptr PINT
EndIf

	Local	nRightVal[2]:SDWord
	Local	ptrNextColBuf:PINT
	Local	nChannelCount:DWord
	Local	nBlockSize:DWord
	Local	ptrLineBuf:PINT

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
	Else
		Mov	ebx, _this
	EndIf
	Assume	ebx:PERIEncoder

	;
	; 垂直方向差分処理
	;
	@VerticalDifferentialOperation
	.If	ERI_EnabledProcessorType & ERI_USE_MMX_PENTIUM
		emms
	.EndIf

	;
	; 水平方向差分処理
	;
	@HorizontalDifferentialOperation

	Assume	ebx:Nothing
	IfNDef	_BORLAND_CPP
		Ret	4 * 2
	Else
		Ret
	EndIf

ERIEncoder@@DifferentialOperation	EndP


;
;	オペレーションコードを決定する
; ----------------------------------------------------------------------------
Align	10H
IfNDef	_BORLAND_CPP
ERIEncoder@@DecideOperationCode	Proc	Near32 SysCall Uses ebx esi edi,
	nCompressMode:DWord, nAllBlockLines:DWord, ptrNextLineBuf:Ptr PINT
	Local	_this:PERIEncoder
Else
ERIEncoder@@DecideOperationCode	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIEncoder,
	nCompressMode:DWord, nAllBlockLines:DWord, ptrNextLineBuf:Ptr PINT
EndIf

	Local	iBestDifOp:DWord, iBestArrange:DWord, iBestClrOp:DWord
	Local	nBestSize:DWord, nTrySize:DWord
	Local	iLoopCount:DWord, iLoopMax:DWord
	Local	nRightVal[2]:SDWord, ptrNextColBuf:PINT
	Local	nChannelCount:DWord, ptrLineBuf:PINT, nBlockSize:DWord

	IfNDef	_BORLAND_CPP
		Mov	ebx, ecx
		Mov	_this, ecx
	Else
		Mov	ebx, _this
	EndIf
	Assume	ebx:PERIEncoder

	.If	nCompressMode == 3
		;
		; オペレーションコードは使用しない
		;
		IfNDef	_BORLAND_CPP
			Mov	ecx, ebx
			Push	ptrNextLineBuf
			Push	nAllBlockLines
			Call	ERIEncoder@@DifferentialOperation
		Else
			Push	ptrNextLineBuf
			Push	nAllBlockLines
			Push	ebx
			Call	ERIEncoder@@DifferentialOperation
			Add	esp, 4 * 3
		EndIf
		;
		Mov	eax, 0C0H
		;
		IfNDef	_BORLAND_CPP
			Ret	4 * 3
		Else
			Ret
		EndIf
	.EndIf

	;
	;	最適な差分処理コードを選択
	; --------------------------------------------------------------------
	.If	nCompressMode >= 2
		;
		; 差分処理の選択はしない
		;
		Mov	iBestDifOp, 03H
		;
		IfNDef	_BORLAND_CPP
			Mov	ecx, ebx
			Push	ptrNextLineBuf
			Push	nAllBlockLines
			Call	ERIEncoder@@DifferentialOperation
		Else
			Push	ptrNextLineBuf
			Push	nAllBlockLines
			Push	ebx
			Call	ERIEncoder@@DifferentialOperation
			Add	esp, 4 * 3
		EndIf
		;
		Push	[ebx].m_nBlockSamples
		Push	[ebx].m_ptrBuffer1
		Call	RLHEncodeContext@@TryEncodeGammaCodes
		Add	esp, 4 * 2
		Mov	nBestSize, eax

	.Else ;	nCompressMode <= 1
		;
		; 差分処理を実行（垂直方向）
		;
		@VerticalDifferentialOperation
		;
		Mov	iBestDifOp, 02H
		Push	[ebx].m_nBlockSamples
		Push	[ebx].m_ptrBuffer1
		Call	RLHEncodeContext@@TryEncodeGammaCodes
		Add	esp, 4 * 2
		Mov	nBestSize, eax
		;
		; 中間状態を保存
		;
		Mov	ecx, [ebx].m_nBlockSamples
		Mov	edi, [ebx].m_ptrBuffer2
		Mov	esi, [ebx].m_ptrBuffer1
		.If	(ecx >= 8) && \
			(ERI_EnabledProcessorType & ERI_USE_MMX_PENTIUM)
			.Repeat
				Mov	eax, DWord Ptr [edi]
				movq	mm0, MMWord Ptr [esi]
				movq	mm1, MMWord Ptr [esi + 8]
				movq	mm2, MMWord Ptr [esi + 16]
				movq	mm3, MMWord Ptr [esi + 24]
				Add	esi, 32
				movq	MMWord Ptr [edi], mm0
				movq	MMWord Ptr [edi + 8], mm1
				movq	MMWord Ptr [edi + 16], mm2
				movq	MMWord Ptr [edi + 24], mm3
				Add	edi, 32
				Sub	ecx, 8
			.Until	Zero?
		.Else
			.Repeat
				Mov	eax, DWord Ptr [esi]
				Mov	edx, DWord Ptr [esi + 4]
				Add	esi, 8
				Mov	DWord Ptr [edi], eax
				Mov	DWord Ptr [edi + 4], edx
				Add	edi, 8
				Sub	ecx, 2
			.Until	Zero?
		.EndIf
		;
		; 差分処理を実行（水平方向）
		;
		@HorizontalDifferentialOperation
		;
		Push	[ebx].m_nBlockSamples
		Push	[ebx].m_ptrBuffer1
		Call	RLHEncodeContext@@TryEncodeGammaCodes
		Add	esp, 4 * 2
		;
		.If	eax <= nBestSize
			Mov	iBestDifOp, 03H
			Mov	nBestSize, eax
		.Else
			Mov	ecx, [ebx].m_nBlockSamples
			Mov	edi, [ebx].m_ptrBuffer1
			Mov	esi, [ebx].m_ptrBuffer2
			.If	(ecx >= 8) && \
				(ERI_EnabledProcessorType & ERI_USE_MMX_PENTIUM)
				.Repeat
					Mov	eax, DWord Ptr [edi]
					movq	mm0, MMWord Ptr [esi]
					movq	mm1, MMWord Ptr [esi + 8]
					movq	mm2, MMWord Ptr [esi + 16]
					movq	mm3, MMWord Ptr [esi + 24]
					Add	esi, 32
					movq	MMWord Ptr [edi], mm0
					movq	MMWord Ptr [edi + 8], mm1
					movq	MMWord Ptr [edi + 16], mm2
					movq	MMWord Ptr [edi + 24], mm3
					Add	edi, 32
					Sub	ecx, 8
				.Until	Zero?
			.Else
				.Repeat
					Mov	eax, DWord Ptr [esi]
					Mov	edx, DWord Ptr [esi + 4]
					Add	esi, 8
					Mov	DWord Ptr [edi], eax
					Mov	DWord Ptr [edi + 4], edx
					Add	edi, 8
					Sub	ecx, 2
				.Until	Zero?
			.EndIf
		.EndIf
	.EndIf

	;
	;	アルファチャネルをコピーする
	; --------------------------------------------------------------------
	.If	[ebx].m_nChannelCount >= 4
		Mov	eax, [ebx].m_nBlockArea
		Mov	esi, [ebx].m_ptrBuffer1
		Mov	edi, [ebx].m_ptrBuffer2
		Mov	ecx, eax
		Lea	eax, [eax + eax * 2]
		Lea	esi, [esi + eax * 4]
		Lea	edi, [edi + eax * 4]
		.If	ERI_EnabledProcessorType & ERI_USE_MMX_PENTIUM
		.While	ecx >= 4
			movq	mm0, MMWord Ptr [esi]
			movq	mm1, MMWord Ptr [esi + 8]
			Add	esi, 16
			movq	MMWord Ptr [edi]    , mm0
			movq	MMWord Ptr [edi + 8], mm1
			Add	edi, 16
			Sub	ecx, 4
		.EndW
		.EndIf
		;
		.If	ecx != 0
		.Repeat
			Mov	eax, SDWord Ptr [esi]
			Mov	edx, SDWord Ptr [esi + 4]
			Add	esi, (SizeOf SDWord) * 2
			Mov	SDWord Ptr [edi]    , eax
			Mov	SDWord Ptr [edi + 4], edx
			Add	edi, (SizeOf SDWord) * 2
			Sub	ecx, 2
		.Until	Zero?
		.EndIf
	.EndIf

	;
	;	最適なカラーオペレーションを選択
	; --------------------------------------------------------------------
	Xor	ecx, ecx
	.If	nCompressMode >= 1
		Mov	esi, Offset iClrOpHalf
		Mov	iLoopMax, 3
	.Else ;	nCompressMode == 0
		Mov	esi, Offset iClrOpFull
		Mov	iLoopMax, 9
	.EndIf
	Mov	iBestClrOp, ecx
	.Repeat
		Mov	eax, DWord Ptr [esi + ecx * 4]
		Mov	iLoopCount, ecx
		;
		IfNDef	_BORLAND_CPP
			Mov	ecx, ebx
			Call	ERIEncoder@@m_pfnColorOperation[eax * 4]
		Else
			Push	ebx
			Call	ERIEncoder@@m_pfnColorOperation[eax * 4]
			Add	esp, (SizeOf DWord)
		EndIf
		;
		Push	[ebx].m_nBlockSamples
		Push	[ebx].m_ptrBuffer2
		Call	RLHEncodeContext@@TryEncodeGammaCodes
		Add	esp, 4 * 2
		;
		Mov	ecx, iLoopCount
		.If	eax < nBestSize
			Mov	edx, DWord Ptr [esi + ecx * 4]
			Mov	nBestSize, eax
			Mov	iBestClrOp, edx
		.EndIf
		;
		Inc	ecx
	.Until	ecx >= iLoopMax
	;
	; カラーオペレーションを実行
	;
	Mov	eax, iBestClrOp
	IfNDef	_BORLAND_CPP
		Mov	ecx, ebx
		Call	ERIEncoder@@m_pfnColorOperation[eax * 4]
	Else
		Push	ebx
		Call	ERIEncoder@@m_pfnColorOperation[eax * 4]
		Add	esp, (SizeOf DWord)
	EndIf
	;
	; 不要なビットを削る
	;
	.If	[ebx].m_nChannelDepth == 8
		Mov	ecx, [ebx].m_nBlockSamples
		Mov	esi, [ebx].m_ptrBuffer2
		.Repeat
			MovSx	eax, SByte Ptr [esi]
			MovSx	edx, SByte Ptr [esi + 4]
			Mov	SDWord Ptr [esi], eax
			Mov	SDWord Ptr [esi + 4], edx
			Add	esi, 4 * 2
			Sub	ecx, 2
		.Until	Zero?
	.Else
		Mov	ecx, 32
		Mov	edi, [ebx].m_nBlockSamples
		Mov	esi, [ebx].m_ptrBuffer2
		Sub	ecx, [ebx].m_nChannelDepth
		.Repeat
			Mov	eax, SDWord Ptr [esi]
			Mov	edx, SDWord Ptr [esi + 4]
			Shl	eax, cl
			Shl	edx, cl
			Sar	eax, cl
			Sar	edx, cl
			Mov	SDWord Ptr [esi], eax
			Mov	SDWord Ptr [esi + 4], edx
			Add	esi, 4 * 2
			Sub	edi, 2
		.Until	Zero?
	.EndIf

	;
	;	最適なアレンジコードを選ぶ
	; --------------------------------------------------------------------
	Mov	iBestArrange, 0
	.If	nCompressMode == 2
		;
		; アレンジコードは使わない
		;

	.ElseIf	nCompressMode == 1
		;
		; インターリーブの有効性を検証
		;
		Mov	ecx, [ebx].m_nBlockSamples
		Mov	esi, [ebx].m_ptrBuffer2
		Mov	edi, [ebx].m_ptrBuffer1
		Mov	ebx, [ebx].m_pArrangeTable[2 * 4]
		Assume	ebx:Nothing
		.Repeat
			Mov	eax, DWord Ptr [ebx]
			Mov	edx, SDWord Ptr [esi]
			Add	ebx, (SizeOf DWord)
			Add	esi, (SizeOf SDWord)
			Mov	SDWord Ptr [edi + eax * 4], edx
			Dec	ecx
		.Until	Zero?
		Mov	ebx, _this
		Assume	ebx:PERIEncoder
		;
		Push	[ebx].m_nBlockSamples
		Push	[ebx].m_ptrBuffer1
		Call	RLHEncodeContext@@TryEncodeGammaCodes
		Add	esp, 4 * 2
		;
		.If	eax < nBestSize
			Mov	nBestSize, eax
			Or	iBestArrange, 02H
		.EndIf
		;
		; 垂直走査の有効性を検証
		;
		Mov	eax, iBestArrange
		Or	eax, 01H
		Mov	ecx, [ebx].m_nBlockSamples
		Mov	esi, [ebx].m_ptrBuffer2
		Mov	edi, [ebx].m_ptrBuffer1
		Mov	ebx, [ebx].m_pArrangeTable[eax * 4]
		Assume	ebx:Nothing
		.Repeat
			Mov	eax, DWord Ptr [ebx]
			Mov	edx, SDWord Ptr [esi]
			Add	ebx, (SizeOf DWord)
			Add	esi, (SizeOf SDWord)
			Mov	SDWord Ptr [edi + eax * 4], edx
			Dec	ecx
		.Until	Zero?
		Mov	ebx, _this
		Assume	ebx:PERIEncoder
		;
		Push	[ebx].m_nBlockSamples
		Push	[ebx].m_ptrBuffer1
		Call	RLHEncodeContext@@TryEncodeGammaCodes
		Add	esp, 4 * 2
		;
		.If	eax < nBestSize
			Mov	nBestSize, eax
			Or	iBestArrange, 01H
		.EndIf

	.Else
		;
		; アレンジコード総当たり
		;
		Mov	edx, 1
		.Repeat
			Mov	iLoopCount, edx
			;
			Mov	ecx, [ebx].m_nBlockSamples
			Mov	esi, [ebx].m_ptrBuffer2
			Mov	edi, [ebx].m_ptrBuffer1
			Mov	ebx, [ebx].m_pArrangeTable[edx * 4]
			Assume	ebx:Nothing
			.Repeat
				Mov	eax, DWord Ptr [ebx]
				Mov	edx, SDWord Ptr [esi]
				Add	ebx, (SizeOf DWord)
				Add	esi, (SizeOf SDWord)
				Mov	SDWord Ptr [edi + eax * 4], edx
				Dec	ecx
			.Until	Zero?
			Mov	ebx, _this
			Assume	ebx:PERIEncoder
			;
			Push	[ebx].m_nBlockSamples
			Push	[ebx].m_ptrBuffer1
			Call	RLHEncodeContext@@TryEncodeGammaCodes
			Add	esp, 4 * 2
			;
			Mov	edx, iLoopCount
			.If	eax < nBestSize
				Mov	nBestSize, eax
				Mov	iBestArrange, edx
			.EndIf
			;
			Inc	edx
		.Until	edx >= 4

	.EndIf
	;
	Mov	eax, iBestArrange
	Mov	ecx, [ebx].m_nBlockSamples
	Mov	esi, [ebx].m_ptrBuffer2
	Mov	edi, [ebx].m_ptrBuffer1
	Mov	ebx, [ebx].m_pArrangeTable[eax * 4]
	Assume	ebx:Nothing
	.Repeat
		Mov	eax, DWord Ptr [ebx]
		Mov	edx, SDWord Ptr [esi]
		Add	ebx, (SizeOf DWord)
		Add	esi, (SizeOf SDWord)
		Mov	SDWord Ptr [edi + eax * 4], edx
		Dec	ecx
	.Until	Zero?

	;
	;	オペレーションコードを返す
	; --------------------------------------------------------------------
	.If	ERI_EnabledProcessorType & ERI_USE_MMX_PENTIUM
		emms
	.EndIf

	Mov	eax, iBestDifOp
	Mov	edx, iBestArrange
	Mov	ecx, iBestClrOp
	Shl	eax, 6
	Shl	edx, 4
	Or	eax, ecx
	Or	eax, edx

	IfNDef	_BORLAND_CPP
		Ret	4 * 3
	Else
		Ret
	EndIf

ERIEncoder@@DecideOperationCode	EndP


;
;
;	チャネル間差分処理マクロ
; ----------------------------------------------------------------------------
;  Parameters ;
;	EBX register : ERIEncoder オブジェクトへのポインタ
;  Registers ;
;	EBP, ESP レジスタは保証される
; ----------------------------------------------------------------------------

@ERImage_DifferenceBetweenChannel	Macro	op_code:Req

	Assume	ebx:Ptr ERIEncoder
	Mov	ecx, [ebx].m_nBlockArea
	Mov	esi, [ebx].m_ptrBuffer1
	Mov	edi, [ebx].m_ptrBuffer2
	Lea	edx, [ecx * (SizeOf SDWord)]
	Assume	ebx:Nothing

	.If	ERI_EnabledProcessorType & ERI_USE_MMX_PENTIUM
	.While	ecx >= 4
		Sub	ecx, 4
		;;
		movq	mm0, MMWord Ptr [esi]
		movq	mm2, MMWord Ptr [esi + edx]
		movq	mm4, MMWord Ptr [esi + edx * 2]
		movq	mm1, MMWord Ptr [esi + 8]
		movq	mm3, MMWord Ptr [esi + edx + 8]
		movq	mm5, MMWord Ptr [esi + edx * 2 + 8]
		Add	esi, (SizeOf SDWord) * 4
		;;
		If	op_code Eq 0101B
			psubd	mm2, mm0
			psubd	mm3, mm1
		ElseIf	op_code Eq 0110B
			psubd	mm4, mm0
			psubd	mm5, mm1
		ElseIf	op_code Eq 0111B
			psubd	mm2, mm0
			psubd	mm3, mm1
			psubd	mm4, mm0
			psubd	mm5, mm1
		ElseIf	op_code Eq 1001B
			psubd	mm0, mm2
			psubd	mm1, mm3
		ElseIf	op_code Eq 1010B
			psubd	mm4, mm2
			psubd	mm5, mm3
		ElseIf	op_code Eq 1011B
			psubd	mm0, mm2
			psubd	mm1, mm3
			psubd	mm4, mm2
			psubd	mm5, mm3
		ElseIf	op_code Eq 1101B
			psubd	mm0, mm4
			psubd	mm1, mm5
		ElseIf	op_code Eq 1110B
			psubd	mm2, mm4
			psubd	mm3, mm5
		ElseIf	op_code Eq 1111B
			psubd	mm0, mm4
			psubd	mm1, mm5
			psubd	mm2, mm4
			psubd	mm3, mm5
		EndIf
		;;
		movq	MMWord Ptr [edi], mm0
		movq	MMWord Ptr [edi + edx], mm2
		movq	MMWord Ptr [edi + edx * 2], mm4
		movq	MMWord Ptr [edi + 8], mm1
		movq	MMWord Ptr [edi + edx + 8], mm3
		movq	MMWord Ptr [edi + edx * 2 + 8], mm5
		Add	edi, (SizeOf SDWord) * 4
	.EndW
	emms
	.EndIf

	.If	ecx != 0
	Push	ebp
	.Repeat
		Mov	eax, DWord Ptr [esi]
		Mov	ebx, DWord Ptr [esi + edx]
		Mov	ebp, DWord Ptr [esi + edx * 2]
		Add	esi, (SizeOf DWord)
		;;
		If	(op_code And 1100B) Eq 0100B
			If	op_code And 0001B
				Sub	ebx, eax
			EndIf
			If	op_code And 0010B
				Sub	ebp, eax
			EndIf
		ElseIf	(op_code And 1100B) Eq 1000B
			If	op_code And 0001B
				Sub	eax, ebx
			EndIf
			If	op_code And 0010B
				Sub	ebp, ebx
			EndIf
		ElseIf	(op_code And 1100B) Eq 1100B
			If	op_code And 0001B
				Sub	eax, ebp
			EndIf
			If	op_code And 0010B
				Sub	ebx, ebp
			EndIf
		EndIf
		;;
		Mov	DWord Ptr [edi], eax
		Mov	DWord Ptr [edi + edx], ebx
		Mov	DWord Ptr [edi + edx * 2], ebp
		Add	edi, (SizeOf DWord)
		Dec	ecx
	.Until	Zero?
	Pop	ebp
	.EndIf

	EndM


Align	10H
IfNDef	_BORLAND_CPP
ERIEncoder@@ColorOperation0000	Proc	Near32 SysCall Uses ebx esi edi
	Mov	ebx, ecx
Else
ERIEncoder@@ColorOperation0000	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIEncoder
EndIf
	@ERImage_DifferenceBetweenChannel	0000B
	Ret
ERIEncoder@@ColorOperation0000	EndP

Align	10H
IfNDef	_BORLAND_CPP
ERIEncoder@@ColorOperation0101	Proc	Near32 SysCall Uses ebx esi edi
	Mov	ebx, ecx
Else
ERIEncoder@@ColorOperation0101	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIEncoder
EndIf
	@ERImage_DifferenceBetweenChannel	0101B
	Ret
ERIEncoder@@ColorOperation0101	EndP

Align	10H
IfNDef	_BORLAND_CPP
ERIEncoder@@ColorOperation0110	Proc	Near32 SysCall Uses ebx esi edi
	Mov	ebx, ecx
Else
ERIEncoder@@ColorOperation0110	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIEncoder
EndIf
	@ERImage_DifferenceBetweenChannel	0110B
	Ret
ERIEncoder@@ColorOperation0110	EndP

Align	10H
IfNDef	_BORLAND_CPP
ERIEncoder@@ColorOperation0111	Proc	Near32 SysCall Uses ebx esi edi
	Mov	ebx, ecx
Else
ERIEncoder@@ColorOperation0111	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIEncoder
EndIf
	@ERImage_DifferenceBetweenChannel	0111B
	Ret
ERIEncoder@@ColorOperation0111	EndP

Align	10H
IfNDef	_BORLAND_CPP
ERIEncoder@@ColorOperation1001	Proc	Near32 SysCall Uses ebx esi edi
	Mov	ebx, ecx
Else
ERIEncoder@@ColorOperation1001	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIEncoder
EndIf
	@ERImage_DifferenceBetweenChannel	1001B
	Ret
ERIEncoder@@ColorOperation1001	EndP

Align	10H
IfNDef	_BORLAND_CPP
ERIEncoder@@ColorOperation1010	Proc	Near32 SysCall Uses ebx esi edi
	Mov	ebx, ecx
Else
ERIEncoder@@ColorOperation1010	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIEncoder
EndIf
	@ERImage_DifferenceBetweenChannel	1010B
	Ret
ERIEncoder@@ColorOperation1010	EndP

Align	10H
IfNDef	_BORLAND_CPP
ERIEncoder@@ColorOperation1011	Proc	Near32 SysCall Uses ebx esi edi
	Mov	ebx, ecx
Else
ERIEncoder@@ColorOperation1011	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIEncoder
EndIf
	@ERImage_DifferenceBetweenChannel	1011B
	Ret
ERIEncoder@@ColorOperation1011	EndP

Align	10H
IfNDef	_BORLAND_CPP
ERIEncoder@@ColorOperation1101	Proc	Near32 SysCall Uses ebx esi edi
	Mov	ebx, ecx
Else
ERIEncoder@@ColorOperation1101	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIEncoder
EndIf
	@ERImage_DifferenceBetweenChannel	1101B
	Ret
ERIEncoder@@ColorOperation1101	EndP

Align	10H
IfNDef	_BORLAND_CPP
ERIEncoder@@ColorOperation1110	Proc	Near32 SysCall Uses ebx esi edi	
	Mov	ebx, ecx
Else
ERIEncoder@@ColorOperation1110	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIEncoder
EndIf
	@ERImage_DifferenceBetweenChannel	1110B
	Ret
ERIEncoder@@ColorOperation1110	EndP

Align	10H
IfNDef	_BORLAND_CPP
ERIEncoder@@ColorOperation1111	Proc	Near32 SysCall Uses ebx esi edi
	Mov	ebx, ecx
Else
ERIEncoder@@ColorOperation1111	Proc	Near32 SysCall Uses ebx esi edi,
	_this:PERIEncoder
EndIf
	@ERImage_DifferenceBetweenChannel	1111B
	Ret
ERIEncoder@@ColorOperation1111	EndP


CodeSeg	EndS

	End
