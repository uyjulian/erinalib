
//////////////////////////////////////////////////////////////////////////////
// ERI Library �f�[�^�^��`�t�@�C��                    (�ŏI�X�V 2002/04/21)
//////////////////////////////////////////////////////////////////////////////

//
// �K�v�ȃf�[�^�^��e�L�X�g�}�N�����`���܂�
//////////////////////////////////////////////////////////////////////////////
// �R���p�C���ɕK�v�ȃf�[�^�^�G
//		BYTE	: ��������8�r�b�g����
//		WORD	: ��������16�r�b�g����
//		SWORD	: ��������16�r�b�g����
//		DWORD	: ��������32�r�b�g����
//		SDWORD	: �����L��32�r�b�g����
//		INT		: �����L��16�r�b�g�ȏ㐮��
//		UINT	: ��������16�r�b�g�ȏ㐮��
//		LONG	: �����L��32�r�b�g�ȏ㐮��
//		ULONG	: ��������32�r�b�g�ȏ㐮��
//		UINT64	: ��������64�r�b�g����
//		PVOID	: void �^�ւ̃|�C���^
//		PBYTE	: ��������8�r�b�g�����ւ̃|�C���^
//		PWORD	: ��������16�r�b�g�����ւ̃|�C���^
//		PINT	: �����L��16�r�b�g�ȏ㐮���ւ̃|�C���^
//		REAL32	: 32�r�b�g���������_
//		REAL64	: 64�r�b�g���������_


#if	!defined(ERITYPES_H_INCLUDED)
#define	ERITYPES_H_INCLUDED

#if	!defined(_WINDOWS_)

typedef	void *					PVOID ;
typedef	unsigned char			BYTE, * PBYTE ;
typedef	unsigned short int		WORD, * PWORD ;
typedef	unsigned long int		DWORD ;
typedef	signed int				INT, * PINT ;
typedef	unsigned int			UINT ;
typedef	signed long int			LONG, * PLONG ;
typedef	unsigned long int		ULONG ;

#endif

typedef	signed char				SBYTE ;
typedef	signed short int		SWORD ;
typedef	signed long int			SDWORD ;
typedef	signed __int64			INT64 ;
typedef	unsigned __int64		UINT64 ;
typedef	float					REAL32 ;
typedef	double					REAL64 ;

#endif
