
; ****************************************************************************
;                        E R I N A - L i b r a r y
;                                                      �ŏI�X�V 2000/04/06
; ----------------------------------------------------------------------------
;         Copyright (C) 2000-2001 Leshade Entis. All rights reserved.
; ****************************************************************************


;
;	���k�R���e�L�X�g
; ----------------------------------------------------------------------------

RLHEncodeContext	Struct

pvfnTable		PVOID	?	; ���z�֐��e�[�u��

m_nIntBufCount		SDWord	?	; ���ԓ��̓o�b�t�@�ɒ~�ς���Ă���r�b�g��
m_dwIntBuffer		DWord	?	; ���ԓ��̓o�b�t�@
m_nBufferingSize	DWord	?	; �o�b�t�@�����O����o�C�g��
m_nBufCount		DWord	?	; �o�b�t�@�ɒ~�ς���Ă���o�C�g��
m_ptrBuffer		PBYTE	?	; �o�̓o�b�t�@�̐擪�ւ̃|�C���^

m_pMTFTable		PMTF_TABLE	101H Dup( ? )

m_pLastHuffmanTree	PERINA_HUFFMAN_TREE	?
m_pHuffmanTree		PERINA_HUFFMAN_TREE	101H Dup( ? )

RLHEncodeContext	EndS

PRLHEncodeContext	TypeDef	Ptr RLHEncodeContext


VFI_WriteNextData	Equ	4


;
;	���k�I�u�W�F�N�g
; ----------------------------------------------------------------------------

ERIEncoder		Struct

pvfnTable		PVOID	?		; ���z�֐��e�[�u��

m_EriInfHdr		ERI_INFO_HEADER	{ }	; �摜���w�b�_

m_nBlockSize		DWord	?		; �u���b�L���O�T�C�Y
m_nBlockArea		DWord	?		; �u���b�N�ʐ�
m_nBlockSamples		DWord	?		; �u���b�N�̃T���v����
m_nChannelCount		DWord	?		; �`���l����
m_nWidthBlocks		DWord	?		; �摜�̕��i�u���b�N���j
m_nHeightBlocks		DWord	?		; �摜�̍����i�u���b�N���j

m_nSrcBytesPerPixel	DWord	?		; 1�s�N�Z���̃o�C�g��

m_ptrColumnBuf		PINT	?		; ��o�b�t�@
m_ptrLineBuf		PINT	?		; �s�o�b�t�@
m_ptrBuffer1		PINT	?		; �����o�b�t�@
m_ptrBuffer2		PINT	?
m_nChannelDepth		SDWord	?		; �`���l���̃r�b�g�[�x

m_pArrangeTable		PINT	4 Dup( ? )	; �T���v�����O�e�[�u��

m_ptrOperations		PBYTE	?		; �I�y���[�V�����e�[�u��
m_ptrDstBuffer		PINT	?		; �f�X�e�B�l�[�V�����o�b�t�@

m_pHuffmanTree		PERINA_HUFFMAN_TREE ?	; �n�t�}����

ERIEncoder		EndS

PERIEncoder	TypeDef	Ptr ERIEncoder



;
;	�֐��v���g�^�C�v
; ----------------------------------------------------------------------------

IfNDef	_BORLAND_CPP

RLHEncodeContext@@OutNBits	TextEqu	\
	<?OutNBits@RLHEncodeContext@@QAEHKH@Z>
RLHEncodeContext@@OutACode	TextEqu	\
	<?OutACode@RLHEncodeContext@@QAEHH@Z>
RLHEncodeContext@@TryEncodeGammaCodes	TextEqu	\
	<?TryEncodeGammaCodes@RLHEncodeContext@@SAHPBHH@Z>
RLHEncodeContext@@OutAHuffmanCode	TextEqu	\
	<?OutAHuffmanCode@RLHEncodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@H@Z>
RLHEncodeContext@@OutLengthHuffman	TextEqu	\
	<?OutLengthHuffman@RLHEncodeContext@@QAEHPAUERINA_HUFFMAN_TREE@@H@Z>
RLHEncodeContext@@EncodeERINACodes	TextEqu	\
	<?EncodeERINACodes@RLHEncodeContext@@QAEHPBHH@Z>
RLHEncodeContext@@EncodeERINACodes256	TextEqu	\
	<?EncodeERINACodes256@RLHEncodeContext@@QAEHPBEH@Z>
RLHEncodeContext@@EncodeERINACodesSBZL	TextEqu	\
	<?EncodeERINACodesSBZL@RLHEncodeContext@@QAEHPBCH@Z>

ERIEncoder@@m_pfnColorOperation		TextEqu	\
	<?m_pfnColorOperation@ERIEncoder@@1PAP81@AEXXZA>
ERIEncoder@@DifferentialOperation	TextEqu	\
	<?DifferentialOperation@ERIEncoder@@IAEXJPAPAH@Z>
ERIEncoder@@DecideOperationCode		TextEqu	\
	<?DecideOperationCode@ERIEncoder@@IAEKHJPAPAH@Z>
ERIEncoder@@ColorOperation0000		TextEqu	\
	<?ColorOperation0000@ERIEncoder@@IAEXXZ>
ERIEncoder@@ColorOperation0101		TextEqu	\
	<?ColorOperation0101@ERIEncoder@@IAEXXZ>
ERIEncoder@@ColorOperation0110		TextEqu	\
	<?ColorOperation0110@ERIEncoder@@IAEXXZ>
ERIEncoder@@ColorOperation0111		TextEqu	\
	<?ColorOperation0111@ERIEncoder@@IAEXXZ>
ERIEncoder@@ColorOperation1001		TextEqu	\
	<?ColorOperation1001@ERIEncoder@@IAEXXZ>
ERIEncoder@@ColorOperation1010		TextEqu	\
	<?ColorOperation1010@ERIEncoder@@IAEXXZ>
ERIEncoder@@ColorOperation1011		TextEqu	\
	<?ColorOperation1011@ERIEncoder@@IAEXXZ>
ERIEncoder@@ColorOperation1101		TextEqu	\
	<?ColorOperation1101@ERIEncoder@@IAEXXZ>
ERIEncoder@@ColorOperation1110		TextEqu	\
	<?ColorOperation1110@ERIEncoder@@IAEXXZ>
ERIEncoder@@ColorOperation1111		TextEqu	\
	<?ColorOperation1111@ERIEncoder@@IAEXXZ>

RLHEncodeContext@@OutNBits	Proto	Near32 SysCall ,
	dwData:DWord, n:SDWord
RLHEncodeContext@@OutACode	Proto	Near32 SysCall ,
	num:SDWord
RLHEncodeContext@@TryEncodeGammaCodes	Proto	Near32 SysCall ,
	ptrSrc:PINT, nCount:DWord
RLHEncodeContext@@OutAHuffmanCode	Proto	Near32 SysCall ,
	tree:PERINA_HUFFMAN_TREE, num:SDWord
RLHEncodeContext@@OutLengthHuffman	Proto	Near32 SysCall ,
	tree:PERINA_HUFFMAN_TREE, _length:DWord
RLHEncodeContext@@EncodeERINACodes	Proto	Near32 SysCall ,
	ptrSrc:PINT, nCount:DWord
RLHEncodeContext@@EncodeERINACodes256	Proto	Near32 SysCall ,
	ptrSrc:PBYTE, nCount:DWord
RLHEncodeContext@@EncodeERINACodesSBZL	Proto	Near32 SysCall ,
	ptrSrc:Ptr SByte, nCount:DWord

ExternDef	ERIEncoder@@m_pfnColorOperation:Ptr Near32
ERIEncoder@@DifferentialOperation	Proto	Near32 SysCall ,
	nAllBlockLines:DWord, ptrNextLineBuf:Ptr PINT
ERIEncoder@@DecideOperationCode	Proto	Near32 SysCall ,
	nCompressMode:DWord, nAllBlockLines:DWord, ptrNextLineBuf:Ptr PINT
ERIEncoder@@ColorOperation0000	Proto	Near32 SysCall
ERIEncoder@@ColorOperation0101	Proto	Near32 SysCall
ERIEncoder@@ColorOperation0110	Proto	Near32 SysCall
ERIEncoder@@ColorOperation0111	Proto	Near32 SysCall
ERIEncoder@@ColorOperation1001	Proto	Near32 SysCall
ERIEncoder@@ColorOperation1010	Proto	Near32 SysCall
ERIEncoder@@ColorOperation1011	Proto	Near32 SysCall
ERIEncoder@@ColorOperation1101	Proto	Near32 SysCall
ERIEncoder@@ColorOperation1110	Proto	Near32 SysCall
ERIEncoder@@ColorOperation1111	Proto	Near32 SysCall

Else

RLHEncodeContext@@OutNBits	TextEqu	\
	<@RLHEncodeContext@OutNBits$quli>
RLHEncodeContext@@OutACode	TextEqu	\
	<@RLHEncodeContext@TryOutACode$qi>
RLHEncodeContext@@TryEncodeGammaCodes	TextEqu	\
	<@RLHEncodeContext@TryEncodeGammaCodes$qpxii>
RLHEncodeContext@@OutAHuffmanCode	TextEqu	\
	<@RLHEncodeContext@OutAHuffmanCode$qp18ERINA_HUFFMAN_TREEi>
RLHEncodeContext@@OutLengthHuffman	TextEqu	\
	<@RLHEncodeContext@OutLengthHuffman$qp18ERINA_HUFFMAN_TREEi>
RLHEncodeContext@@EncodeERINACodes	TextEqu	\
	<@RLHEncodeContext@EncodeERINACodes$qpxii>
RLHEncodeContext@@EncodeERINACodes256	TextEqu	\
	<@RLHEncodeContext@EncodeERINACodes256$qpxuci>
RLHEncodeContext@@EncodeERINACodesSBZL	TextEqu	\
	<@RLHEncodeContext@EncodeERINACodesSBZL$qpxzci>

ERIEncoder@@m_pfnColorOperation		TextEqu	\
	<@ERIEncoder@m_pfnColorOperation>
ERIEncoder@@DifferentialOperation	TextEqu	\
	<@ERIEncoder@DifferentialOperation$qlppi>
ERIEncoder@@DecideOperationCode		TextEqu	\
	<@ERIEncoder@DecideOperationCode$qilppi>
ERIEncoder@@ColorOperation0000		TextEqu	\
	<@ERIEncoder@ColorOperation0000$qv>
ERIEncoder@@ColorOperation0101		TextEqu	\
	<@ERIEncoder@ColorOperation0101$qv>
ERIEncoder@@ColorOperation0110		TextEqu	\
	<@ERIEncoder@ColorOperation0110$qv>
ERIEncoder@@ColorOperation0111		TextEqu	\
	<@ERIEncoder@ColorOperation0111$qv>
ERIEncoder@@ColorOperation1001		TextEqu	\
	<@ERIEncoder@ColorOperation1001$qv>
ERIEncoder@@ColorOperation1010		TextEqu	\
	<@ERIEncoder@ColorOperation1010$qv>
ERIEncoder@@ColorOperation1011		TextEqu	\
	<@ERIEncoder@ColorOperation1011$qv>
ERIEncoder@@ColorOperation1101		TextEqu	\
	<@ERIEncoder@ColorOperation1101$qv>
ERIEncoder@@ColorOperation1110		TextEqu	\
	<@ERIEncoder@ColorOperation1110$qv>
ERIEncoder@@ColorOperation1111		TextEqu	\
	<@ERIEncoder@ColorOperation1111$qv>

RLHEncodeContext@@OutNBits	Proto	Near32 SysCall ,
	_this:PRLHEncodeContext, dwData:DWord, n:SDWord
RLHEncodeContext@@OutACode	Proto	Near32 SysCall ,
	_this:PRLHEncodeContext, num:SDWord
RLHEncodeContext@@TryEncodeGammaCodes	Proto	Near32 SysCall ,
	ptrSrc:PINT, nCount:DWord
RLHEncodeContext@@OutAHuffmanCode	Proto	Near32 SysCall ,
	_this:PRLHEncodeContext, tree:PERINA_HUFFMAN_TREE, num:SDWord
RLHEncodeContext@@OutLengthHuffman	Proto	Near32 SysCall ,
	_this:PRLHEncodeContext, tree:PERINA_HUFFMAN_TREE, _length:DWord
RLHEncodeContext@@EncodeERINACodes	Proto	Near32 SysCall ,
	_this:PRLHEncodeContext, ptrSrc:PINT, nCount:DWord
RLHEncodeContext@@EncodeERINACodes256	Proto	Near32 SysCall ,
	_this:PRLHEncodeContext, ptrSrc:PBYTE, nCount:DWord
RLHEncodeContext@@EncodeERINACodesSBZL	Proto	Near32 SysCall ,
	_this:PRLHEncodeContext, ptrSrc:Ptr SByte, nCount:DWord

ExternDef	ERIEncoder@@m_pfnColorOperation:Ptr Near32
ERIEncoder@@DifferentialOperation	Proto	Near32 SysCall ,
	_this:PERIEncoder, nAllBlockLines:DWord, ptrNextLineBuf:Ptr PINT
ERIEncoder@@DecideOperationCode	Proto	Near32 SysCall ,
	_this:PERIEncoder,
	nCompressMode:DWord, nAllBlockLines:DWord, ptrNextLineBuf:Ptr PINT
ERIEncoder@@ColorOperation0000	Proto	Near32 SysCall ,
	_this:PERIEncoder
ERIEncoder@@ColorOperation0101	Proto	Near32 SysCall ,
	_this:PERIEncoder
ERIEncoder@@ColorOperation0110	Proto	Near32 SysCall ,
	_this:PERIEncoder
ERIEncoder@@ColorOperation0111	Proto	Near32 SysCall ,
	_this:PERIEncoder
ERIEncoder@@ColorOperation1001	Proto	Near32 SysCall ,
	_this:PERIEncoder
ERIEncoder@@ColorOperation1010	Proto	Near32 SysCall ,
	_this:PERIEncoder
ERIEncoder@@ColorOperation1011	Proto	Near32 SysCall ,
	_this:PERIEncoder
ERIEncoder@@ColorOperation1101	Proto	Near32 SysCall ,
	_this:PERIEncoder
ERIEncoder@@ColorOperation1110	Proto	Near32 SysCall ,
	_this:PERIEncoder
ERIEncoder@@ColorOperation1111	Proto	Near32 SysCall ,
	_this:PERIEncoder

EndIf