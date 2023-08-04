
/*****************************************************************************
                          E R I N A - L i b r a r y
                                                        �ŏI�X�V 2002/05/26
 ----------------------------------------------------------------------------
         Copyright (C) 2000-2002 Leshade Entis. All rights reserved.
 *****************************************************************************/


#if	!defined(CXMIO_H_INCLUDE)
#define	CXMIO_H_INCLUDE

#if	!defined(ERIMATRIX_H_INCLUDE)
#include "erimatrix.h"
#endif

#if	!defined(CMPERI_H_INCLUDE)
#include "cmperi.h"
#endif


/*****************************************************************************
                            �������k�I�u�W�F�N�g
 *****************************************************************************/

class	MIOEncoder
{
protected:
	MIO_INFO_HEADER		m_mioih ;				// �������w�b�_

	unsigned int		m_nBufLength ;			// �o�b�t�@���i�T���v�����j
	void *				m_ptrBuffer1 ;			// ���������o�b�t�@
	void *				m_ptrBuffer2 ;			// ���ёւ��o�b�t�@
	SBYTE *				m_ptrBuffer3 ;			// �C���^�[���[�u�p�o�b�t�@
	REAL32 *			m_ptrSamplingBuf ;		// �T���v�����O�p�o�b�t�@
	REAL32 *			m_ptrInternalBuf ;		// ���ԃo�b�t�@
	REAL32 *			m_ptrDstBuf ;			// �o�͗p�o�b�t�@
	REAL32 *			m_ptrWorkBuf ;			// DCT ���Z�p���[�N�G���A
	REAL32 *			m_ptrWeightTable ;		// �e���g�������̏d�݃e�[�u��
	REAL32 *			m_ptrLastDCT ;			// ���O�u���b�N�� DCT �W��

public:
	struct	PARAMETER
	{
		double			rLowWeight ;			// ����g�����̏d��
		double			rMiddleWeight ;			// �����g�����̏d��
		double			rPowerScale ;			// �ʎq���̊�r�b�g��
		int				nOddWeight ;			// �u���b�N�c�΍�W��
		int				nPreEchoThreshold ;		// �v���G�R�[�΍�臒l

		PARAMETER( void ) ;
	} ;

protected:
	PARAMETER			m_parameter ;

	SWORD *				m_ptrNextDstBuf ;		// �o�̓o�b�t�@�A�h���X
	REAL32 *			m_ptrLastDCTBuf ;		// �d�����Z�p�o�b�t�@
	unsigned int		m_nSubbandDegree ;		// �s��̃T�C�Y
	unsigned int		m_nDegreeNum ;
	int					m_nFrequencyWidth[7] ;	// �e���g���т̕�
	int					m_nFrequencyPoint[7] ;	// �e���g���т̒��S�ʒu
	SIN_COS *			m_pRevolveParam ;

public:
	// �\�z�֐�
	MIOEncoder( void ) ;
	// ���Ŋ֐�
	virtual ~MIOEncoder( void ) ;

	// �������i�p�����[�^�̐ݒ�j
	virtual int Initialize( const MIO_INFO_HEADER & infhdr ) ;
	// �I���i�������̉���Ȃǁj
	virtual void Delete( void ) ;
	// ���������k
	virtual int EncodeSound
		( RLHEncodeContext & context,
			const MIO_DATA_HEADER & datahdr, const void * ptrWaveBuf ) ;
	// ���k�I�v�V������ݒ�
	void SetCompressionParameter( const PARAMETER & parameter ) ;

protected:		// �t���k
	// 8�r�b�g��PCM�����k
	int EncodeSoundPCM8
		( RLHEncodeContext & context,
			const MIO_DATA_HEADER & datahdr, const void * ptrWaveBuf ) ;
	// 16�r�b�g��PCM�����k
	int EncodeSoundPCM16
		( RLHEncodeContext & context,
			const MIO_DATA_HEADER & datahdr, const void * ptrWaveBuf ) ;

protected:		// ��t���k
	// �s��T�C�Y�̕ύX�ɔ����p�����[�^�̍Čv�Z
	void InitializeWithDegree( unsigned int nSubbandDegree ) ;
	// �w��T���v����̉��ʂ����߂�
	double EvaluateVolume( const REAL32 * ptrWave, int nCount ) ;
	// �����R�[�h���擾����
	int GetDivisionCode( const REAL32 * ptrSamples ) ;

protected:	// ���m�����E�X�e���I
	// 16�r�b�g�̔�t���k
	int EncodeSoundDCT
		( RLHEncodeContext & context,
			const MIO_DATA_HEADER & datahdr, const void * ptrWaveBuf ) ;
	// LOT �ϊ����{��
	void PerformLOT
		( RLHEncodeContext & context,
			REAL32 * ptrSamples, REAL32 rPowerScale ) ;
	// �ʏ�̃u���b�N�𕄍������ďo�͂���
	int EncodeInternalBlock
		( RLHEncodeContext & context,
			REAL32 * ptrSamples, REAL32 rPowerScale ) ;
	// ���[�h�u���b�N�𕄍������ďo�͂���
	int EncodeLeadBlock
		( RLHEncodeContext & context,
			REAL32 * ptrSamples, REAL32 rPowerScale ) ;
	// �|�X�g�u���b�N�𕄍������ďo�͂���
	int EncodePostBlock
		( RLHEncodeContext & context, REAL32 rPowerScale ) ;
	// �ʎq��
	void Quantumize
		( PINT ptrQuantumized, const REAL32 * ptrSource,
			int nDegreeNum, REAL32 rPowerScale,
			DWORD * ptrWeightCode, int * ptrCoefficient ) ;

protected:		// �~�h���T�C�h�X�e���I
	// 16�r�b�g�̔�t���k
	int EncodeSoundDCT_MSS
		( RLHEncodeContext & context,
			const MIO_DATA_HEADER & datahdr, const void * ptrWaveBuf ) ;
	// ��]�p�����[�^���擾����
	int GetRevolveCode
		( const REAL32 * ptrBuf1, const REAL32 * ptrBuf2 ) ;
	// LOT �ϊ����{��
	void PerformLOT_MSS
		( REAL32 * ptrDst, REAL32 * ptrLapBuf, REAL32 * ptrSrc ) ;
	// �ʏ�̃u���b�N�𕄍������ďo�͂���
	int EncodeInternalBlock_MSS
		( RLHEncodeContext & context,
			REAL32 * ptrSrc1, REAL32 * ptrSrc2, REAL32 rPowerScale ) ;
	// ���[�h�u���b�N�𕄍������ďo�͂���
	int EncodeLeadBlock_MSS
		( RLHEncodeContext & context,
			REAL32 * ptrSrc1, REAL32 * ptrSrc2, REAL32 rPowerScale ) ;
	// �|�X�g�u���b�N�𕄍������ďo�͂���
	int EncodePostBlock_MSS
		( RLHEncodeContext & context, REAL32 rPowerScale ) ;
	// �ʎq��
	void Quantumize_MSS
		( PINT ptrQuantumized, const REAL32 * ptrSource,
			int nDegreeNum, REAL32 rPowerScale,
			DWORD * ptrWeightCode, int * ptrCoefficient ) ;

} ;


/*****************************************************************************
                            �����W�J�I�u�W�F�N�g
 *****************************************************************************/

class	MIODecoder
{
protected:
	MIO_INFO_HEADER		m_mioih ;				// �������w�b�_

	unsigned int		m_nBufLength ;			// �o�b�t�@���i�T���v�����j
	void *				m_ptrBuffer1 ;			// ���������o�b�t�@
	void *				m_ptrBuffer2 ;			// ���ёւ��o�b�t�@
	SBYTE *				m_ptrBuffer3 ;			// �C���^�[���[�u�p�o�b�t�@
	PBYTE				m_ptrDivisionTable ;	// �����R�[�h�e�[�u��
	PBYTE				m_ptrRevolveCode ;		// ��]�R�[�h�e�[�u��
	SDWORD *			m_ptrWeightCode ;		// �ʎq���W���e�[�u��
	PINT				m_ptrCoefficient ;		//
	REAL32 *			m_ptrMatrixBuf ;		// �s�񉉎Z�p�o�b�t�@
	REAL32 *			m_ptrInternalBuf ;		// ���ԃo�b�t�@
	REAL32 *			m_ptrWorkBuf ;			// DCT ���Z�p���[�N�G���A
	REAL32 *			m_ptrWorkBuf2 ;
	REAL32 *			m_ptrWeightTable ;		// �e���g�������̏d�݃e�[�u��
	REAL32 *			m_ptrLastDCT ;			// ���O�� DCT �W��

	PBYTE				m_ptrNextDivision ;		// ���̕����R�[�h
	PBYTE				m_ptrNextRevCode ;		// ���̉�]�R�[�h
	SDWORD *			m_ptrNextWeight ;		// ���̗ʎq���W��
	PINT				m_ptrNextCoefficient ;	//
	PINT				m_ptrNextSource ;		// ���̓��͐M��
	REAL32 *			m_ptrLastDCTBuf ;		// �d�����Z�p�o�b�t�@
	unsigned int		m_nSubbandDegree ;		// �s��̃T�C�Y
	unsigned int		m_nDegreeNum ;
	SIN_COS *			m_pRevolveParam ;
	int					m_nFrequencyPoint[7] ;	// �e���g���т̒��S�ʒu

public:
	// �\�z�֐�
	MIODecoder( void ) ;
	// ���Ŋ֐�
	virtual ~MIODecoder( void ) ;

	// �������i�p�����[�^�̐ݒ�j
	virtual int Initialize( const MIO_INFO_HEADER & infhdr ) ;
	// �I���i�������̉���Ȃǁj
	virtual void Delete( void ) ;
	// ���������k
	virtual int DecodeSound
		( RLHDecodeContext & context,
			const MIO_DATA_HEADER & datahdr, void * ptrWaveBuf ) ;

protected:		// �t���k
	// 8�r�b�g��PCM��W�J
	int DecodeSoundPCM8
		( RLHDecodeContext & context,
			const MIO_DATA_HEADER & datahdr, void * ptrWaveBuf ) ;
	// 16�r�b�g��PCM��W�J
	int DecodeSoundPCM16
		( RLHDecodeContext & context,
			const MIO_DATA_HEADER & datahdr, void * ptrWaveBuf ) ;

protected:		// ���m�����E�X�e���I
	// �s��T�C�Y�̕ύX�ɔ����p�����[�^�̍Čv�Z
	void InitializeWithDegree( unsigned int nSubbandDegree ) ;
	// 16�r�b�g�̔�t�W�J
	int DecodeSoundDCT
		( RLHDecodeContext & context,
			const MIO_DATA_HEADER & datahdr, void * ptrWaveBuf ) ;
	// �ʏ�̃u���b�N�𕜍�����
	int DecodeInternalBlock
		( SWORD * ptrDst, unsigned int nSamples ) ;
	// ���[�h�u���b�N�𕜍�����
	int DecodeLeadBlock( void ) ;
	// �|�X�g�u���b�N�𕜍�����
	int DecodePostBlock
		( SWORD * ptrDst, unsigned int nSamples ) ;
	// �t�ʎq��
	void IQuantumize
		( REAL32 * ptrDestination,
			const INT * ptrQuantumized, int nDegreeNum,
			SDWORD nWeightCode, int nCoefficient ) ;

protected:		// �~�h���T�C�h�X�e���I
	// 16�r�b�g�̔�t�W�J
	int DecodeSoundDCT_MSS
		( RLHDecodeContext & context,
			const MIO_DATA_HEADER & datahdr, void * ptrWaveBuf ) ;
	// �ʏ�̃u���b�N�𕜍�����
	int DecodeInternalBlock_MSS
		( SWORD * ptrDst, unsigned int nSamples ) ;
	// ���[�h�u���b�N�𕜍�����
	int DecodeLeadBlock_MSS( void ) ;
	// �|�X�g�u���b�N�𕜍�����
	int DecodePostBlock_MSS
		( SWORD * ptrDst, unsigned int nSamples ) ;

} ;


#endif
