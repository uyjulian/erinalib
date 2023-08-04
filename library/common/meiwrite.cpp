
/*****************************************************************************
                         E R I N A - L i b r a r y
                                                      �ŏI�X�V 2002/05/26
 ----------------------------------------------------------------------------
          Copyright (C) 2000-2002 Leshade Entis. All rights reserved.
 *****************************************************************************/


#define	STRICT	1
#include <windows.h>


//
// ERINA ���C�u������`�t�@�C��
//////////////////////////////////////////////////////////////////////////////

#include "eritypes.h"
#include "erinalib.h"
typedef	const UINT64 *	PCUINT64 ;


/*****************************************************************************
                  ERI�A�j���[�V�����t�@�C���o�̓I�u�W�F�N�g
 *****************************************************************************/

//
// �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
ERIAnimationWriter::EOutputBuffer::EOutputBuffer
			( const BYTE * ptrBuffer, ULONG nBytes )
{
	m_ptrNext = NULL ;
	m_dwBytes = nBytes ;
	m_ptrBuffer = ::eriAllocateMemory( m_dwBytes ) ;
	::memcpy( m_ptrBuffer, ptrBuffer, m_dwBytes ) ;
}

//
// ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
ERIAnimationWriter::EOutputBuffer::~EOutputBuffer( void )
{
	::eriFreeMemory( m_ptrBuffer ) ;
}

//
// �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
ERIAnimationWriter::EEncodeContext::EEncodeContext( void )
	: RLHEncodeContext( 0x10000 )
{
	m_pFirstBuf = NULL ;
	m_pLastBuf = NULL ;
	m_dwTotalBytes = 0 ;
}

//
// ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
ERIAnimationWriter::EEncodeContext::~EEncodeContext( void )
{
	Delete( ) ;
}

//
// �f�[�^����
//////////////////////////////////////////////////////////////////////////////
void ERIAnimationWriter::EEncodeContext::Delete( void )
{
	EOutputBuffer *	pCurBuf = m_pFirstBuf ;
	while ( pCurBuf != NULL )
	{
		EOutputBuffer *	pNextBuf = pCurBuf->m_ptrNext ;
		delete	pCurBuf ;
		pCurBuf = pNextBuf ;
	}
	m_pFirstBuf = NULL ;
	m_pLastBuf = NULL ;
	m_dwTotalBytes = 0 ;
}

//
// ���̃f�[�^�������o��
//////////////////////////////////////////////////////////////////////////////
ULONG ERIAnimationWriter::EEncodeContext::WriteNextData
					( const BYTE * ptrBuffer, ULONG nBytes )
{
	EOutputBuffer *	pBuffer = new EOutputBuffer( ptrBuffer, nBytes ) ;
	if ( m_pLastBuf != NULL )
	{
		m_pLastBuf->m_ptrNext = pBuffer ;
		m_pLastBuf = pBuffer ;
	}
	else
	{
		m_pLastBuf = m_pFirstBuf = pBuffer ;
	}
	m_dwTotalBytes += nBytes ;

	return	nBytes ;
}

//
// �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
ERIAnimationWriter::ERIAnimationWriter( void )
{
	m_wsStatus = wsNotOpened ;
	m_perie1 = NULL ;
	m_perie2 = NULL ;
	m_pmioc = NULL ;
	m_pmioe = NULL ;
	m_priiLast = NULL ;
	m_priiBuf = NULL ;
	m_fDualEncoding = false ;
	m_hCompressed = NULL ;
	m_hThread = NULL ;
}

//
// ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
ERIAnimationWriter::~ERIAnimationWriter( void )
{
	Close( ) ;
}

//
// �t�@�C�����J��
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::Open
	( EWriteFileObj * pFile, ERIWriteFile::FileID fidType )
{
	//
	// ���Ƀt�@�C�����J���Ă���ꍇ�ɂ͕���
	Close( ) ;
	//
	// ERI �t�@�C�����J��
	if ( !m_eriwf.Open( pFile, fidType ) )
	{
		return	false ;
	}
	//
	// ����
	m_wsStatus = wsOpened ;

	return	true ;
}

//
// �t�@�C�������
//////////////////////////////////////////////////////////////////////////////
void ERIAnimationWriter::Close( void )
{
	//
	// ���R�[�h�����
	if ( m_wsStatus == wsWritingStream )
	{
		EndFileHeader( ) ;
	}
	else if ( m_wsStatus == wsWritingHeader )
	{
		EndStream( 0 ) ;
	}
	//
	// �X���b�h�I��
	if ( m_hThread != NULL )
	{
		::PostThreadMessage( m_idThread, tmQuit, 0, 0 ) ;
		::WaitForSingleObject( m_hThread, INFINITE ) ;
		::CloseHandle( m_hThread ) ;
		m_hThread = NULL ;
	}
	if ( m_hCompressed != NULL )
	{
		::CloseHandle( m_hCompressed ) ;
		m_hCompressed = NULL ;
	}
	if ( m_perie1 != NULL )
	{
		delete	m_perie1 ;
		m_perie1->Delete( ) ;
		m_perie1 = NULL ;
	}
	if ( m_perie2 != NULL )
	{
		delete	m_perie2 ;
		m_perie2->Delete( ) ;
		m_perie2 = NULL ;
	}
	if ( m_pmioc != NULL )
	{
		delete	m_pmioc ;
		m_pmioc = NULL ;
	}
	if ( m_pmioe != NULL )
	{
		m_pmioe->Delete( ) ;
		delete	m_pmioe ;
		m_pmioe = NULL ;
	}
	if ( m_priiLast != NULL )
	{
		DeleteImageBuffer( m_priiLast ) ;
		m_priiLast = NULL ;
	}
	if ( m_priiBuf != NULL )
	{
		DeleteImageBuffer( m_priiBuf ) ;
		m_priiBuf = NULL ;
	}
	//
	// �t�@�C�������
	if ( m_wsStatus != wsNotOpened )
	{
		m_eriwf.Close( ) ;
		m_wsStatus = wsNotOpened ;
	}
}

//
// �t�@�C���w�b�_���J��
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::BeginFileHeader( DWORD dwKeyFrame, DWORD dwKeyWave )
{
	//
	// �p�����[�^�̌��؂Ɛݒ�
	if ( m_wsStatus != wsOpened )
	{
		return	false ;
	}
	m_dwKeyFrame = dwKeyFrame ;
	m_dwKeyWave = dwKeyWave ;
	//
	// �w�b�_���R�[�h���J��
	if ( !m_eriwf.DescendRecord( (PCUINT64)"Header  " ) )
	{
		return	false ;
	}
	//
	// �t�@�C���w�b�_�������o���i�_�~�[�o�́j
	if ( !m_eriwf.DescendRecord( (PCUINT64)"FileHdr " ) )
	{
		return	false ;
	}
	m_efh.dwVersion = 0x00020100 ;
	m_efh.dwContainedFlag = 0 ;
	m_efh.dwKeyFrameCount = dwKeyFrame ;
	m_efh.dwFrameCount = 0 ;
	m_efh.dwAllFrameTime = 0 ;
	m_eriwf.Write( &m_efh, sizeof(m_efh) ) ;
	m_eriwf.AscendRecord( ) ;
	//
	m_dwMioHeaderPos = 0 ;
	m_dwOutputWaveSamples = 0 ;
	//
	// ����
	m_wsStatus = wsWritingHeader ;

	return	true ;
}

//
// �v���r���[�摜���w�b�_�������o��
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::WritePreviewInfo( const ERI_INFO_HEADER & eih )
{
	if ( m_wsStatus != wsWritingHeader )
	{
		return	false ;
	}
	if ( !m_eriwf.DescendRecord( (PCUINT64)"PrevwInf" ) )
	{
		return	false ;
	}
	m_prvwih = eih ;
	m_eriwf.Write( &m_prvwih, sizeof(m_prvwih) ) ;
	m_eriwf.AscendRecord( ) ;

	return	true ;
}

//
// �摜���w�b�_�������o��
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::WriteEriInfoHeader( const ERI_INFO_HEADER & eih )
{
	if ( m_wsStatus != wsWritingHeader )
	{
		return	false ;
	}
	if ( !m_eriwf.DescendRecord( (PCUINT64)"ImageInf" ) )
	{
		return	false ;
	}
	m_eih = eih ;
	m_eriwf.Write( &m_eih, sizeof(m_eih) ) ;
	m_eriwf.AscendRecord( ) ;
	//
	m_efh.dwContainedFlag |= EFH_CONTAIN_IMAGE ;

	return	true ;
}

//
// �������w�b�_�������o��
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::WriteMioInfoHeader( const MIO_INFO_HEADER & mih )
{
	if ( m_wsStatus != wsWritingHeader )
	{
		return	false ;
	}
	m_dwMioHeaderPos = m_eriwf.GetPointer( ) ;
	//
	if ( !m_eriwf.DescendRecord( (PCUINT64)"SoundInf" ) )
	{
		return	false ;
	}
	m_mih = mih ;
	m_eriwf.Write( &m_mih, sizeof(m_mih) ) ;
	m_eriwf.AscendRecord( ) ;
	//
	m_efh.dwContainedFlag |= EFH_CONTAIN_WAVE ;

	return	true ;
}

//
// ���쌠���������o��
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::WriteCopyright
	( const void * ptrCopyright, DWORD dwBytes )
{
	if ( m_wsStatus != wsWritingHeader )
	{
		return	false ;
	}
	if ( !m_eriwf.DescendRecord( (PCUINT64)"cpyright" ) )
	{
		return	false ;
	}
	m_eriwf.Write( ptrCopyright, dwBytes ) ;
	m_eriwf.AscendRecord( ) ;

	return	true ;
}

//
// �R�����g�������o��
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::WriteDescription
	( const void * ptrDescription, DWORD dwBytes )
{
	if ( m_wsStatus != wsWritingHeader )
	{
		return	false ;
	}
	if ( !m_eriwf.DescendRecord( (PCUINT64)"descript" ) )
	{
		return	false ;
	}
	m_eriwf.Write( ptrDescription, dwBytes ) ;
	m_eriwf.AscendRecord( ) ;

	return	true ;
}

//
// �t�@�C���w�b�_�����
//////////////////////////////////////////////////////////////////////////////
void ERIAnimationWriter::EndFileHeader( void )
{
	if ( m_wsStatus == wsWritingHeader )
	{
		m_dwHeaderBytes = m_eriwf.GetPointer( ) ;
		m_eriwf.AscendRecord( ) ;
		m_wsStatus = wsOpened ;
	}
}

//
// �X�g���[�����J�n����
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::BeginStream( void )
{
	//
	// �X�e�[�^�X�`�F�b�N
	if ( m_wsStatus != wsOpened )
	{
		return	false ;
	}
	//
	// �p�����[�^������
	m_dwFrameCount = 0 ;
	m_dwWaveCount = 0 ;
	//
	// ���k�I�u�W�F�N�g������
	if ( m_efh.dwContainedFlag & EFH_CONTAIN_IMAGE )
	{
		m_perie1 = CreateERIEncoder( ) ;
		m_perie2 = CreateERIEncoder( ) ;
		if ( m_perie1->Initialize( m_eih ) || m_perie2->Initialize( m_eih ) )
		{
			return	false ;
		}
		m_perie1->SetCompressionParameter( m_eriep ) ;
		m_perie2->SetCompressionParameter( m_eriep ) ;
	}
	if ( m_efh.dwContainedFlag & EFH_CONTAIN_WAVE )
	{
		m_pmioc = new EFileEncodeContext( &m_eriwf, 0x10000 ) ;
		m_pmioe = CreateMIOEncoder( ) ;
		if ( m_pmioe->Initialize( m_mih ) )
		{
			return	false ;
		}
		m_pmioe->SetCompressionParameter( m_mioep ) ;
	}
	//
	// ���������p�o�b�t�@����
	if ( m_efh.dwContainedFlag & EFH_CONTAIN_IMAGE )
	{
		m_priiLast = CreateImageBuffer( m_eih ) ;
		m_priiBuf = CreateImageBuffer( m_eih ) ;
	}
	//
	// ���k�X���b�h����
	m_hCompressed = ::CreateEvent( NULL, TRUE, FALSE, NULL ) ;
	if ( m_hCompressed == NULL )
	{
		return	false ;
	}
	m_hThread = ::CreateThread
		( NULL, 0, &ERIAnimationWriter::ThreadProc, this, 0, &m_idThread ) ;
	if ( m_hThread == NULL )
	{
		return	false ;
	}
	HANDLE	hEventList[2] ;
	hEventList[0] = m_hThread ;
	hEventList[1] = m_hCompressed ;
	DWORD	dwWaitResult =
		::WaitForMultipleObjects( 2, hEventList, FALSE, INFINITE ) ;
	if ( dwWaitResult == WAIT_OBJECT_0 )
	{
		::CloseHandle( m_hCompressed ) ;
		m_hThread = NULL ;
		m_hCompressed = NULL ;
		return	false ;
	}
	m_wsStatus = wsWritingStream ;
	//
	// �X�g���[�����R�[�h���J��
	if ( !m_eriwf.DescendRecord( (PCUINT64)"Stream  " ) )
	{
		EndStream( 0 ) ;
		return	false ;
	}

	return	true ;
}

//
// �摜�̈��k�p�����[�^��ݒ肷��
//////////////////////////////////////////////////////////////////////////////
void ERIAnimationWriter::SetImageCompressionParameter
	( const ERIEncoder::PARAMETER & eriep )
{
	m_eriep = eriep ;
	//
	if ( m_perie1 != NULL )
		m_perie1->SetCompressionParameter( eriep ) ;
	if ( m_perie2 != NULL )
		m_perie2->SetCompressionParameter( eriep ) ;
}

//
// �����̈��k�p�����[�^��ݒ肷��
//////////////////////////////////////////////////////////////////////////////
void ERIAnimationWriter::SetSoundCompressionParameter
	( const MIOEncoder::PARAMETER & mioep )
{
	m_mioep = mioep ;
	//
	if ( m_pmioe != NULL )
		m_pmioe->SetCompressionParameter( mioep ) ;
}

//
// �p���b�g�e�[�u���������o��
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::WritePaletteTable
	( const ENTIS_PALETTE * paltbl, unsigned int nLength )
{
	if ( m_wsStatus != wsWritingStream )
	{
		return	false ;
	}
	if ( !m_eriwf.DescendRecord( (PCUINT64)"Palette " ) )
	{
		return	false ;
	}
	m_eriwf.Write( paltbl, nLength * sizeof(ENTIS_PALETTE) ) ;
	m_eriwf.AscendRecord( ) ;
	//
	m_efh.dwContainedFlag |= EFH_CONTAIN_PALETTE ;

	return	true ;
}

//
// �v���r���[�摜���o�͂���
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::WritePreviewData
	( const RASTER_IMAGE_INFO & rii, DWORD fdwFlags )
{
	if ( m_wsStatus != wsWritingStream )
	{
		return	false ;
	}
	if ( !m_eriwf.DescendRecord( (PCUINT64)"Preview " ) )
	{
		return	false ;
	}
	//
	// �摜���k
	//
	bool	fSuccessed = false ;
	do
	{
		EFileEncodeContext	context( &m_eriwf, 0x10000 ) ;
		ERIEncoder			encoder ;
		//
		if ( encoder.Initialize( m_prvwih ) )
		{
			break ;
		}
		if ( encoder.EncodeImage( rii, context, fdwFlags ) )
		{
			break ;
		}
		//
		fSuccessed = true ;
	}
	while ( false ) ;
	//
	m_eriwf.AscendRecord( ) ;

	return	fSuccessed ;
}

//
// �����f�[�^���o�͂���
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::WriteWaveData
	( const void * ptrWaveBuf, DWORD dwSampleCount )
{
	if ( m_wsStatus != wsWritingStream )
	{
		return	false ;
	}
	if ( !m_eriwf.DescendRecord( (PCUINT64)"SoundStm" ) )
	{
		return	false ;
	}
	//
	// �������k
	//
	bool	fSuccessed = false ;
	MIO_DATA_HEADER	miodh ;
	miodh.bytVersion = 1 ;
	miodh.bytFlags = 0 ;
	miodh.bytReserved1 = 0 ;
	miodh.bytReserved2 = 0 ;
	miodh.dwSampleCount = dwSampleCount ;
	if ( ((m_dwKeyWave == 0) && (m_dwWaveCount == 0))
				|| (m_dwWaveCount % m_dwKeyWave) == 0 )
	{
		miodh.bytFlags = MIO_LEAD_BLOCK ;
	}
	if ( m_eriwf.Write( &miodh, sizeof(miodh) ) == sizeof(miodh) )
	{
		if ( !m_pmioe->EncodeSound( *m_pmioc, miodh, ptrWaveBuf ) )
		{
			++ m_dwWaveCount ;
			m_dwOutputWaveSamples += dwSampleCount ;
			fSuccessed = true ;
		}
	}
	//
	m_eriwf.AscendRecord( ) ;

	return	fSuccessed ;
}

//
// �摜�f�[�^���o�͂���
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::WriteImageData
	( const RASTER_IMAGE_INFO & rii, DWORD fdwFlags )
{
	if ( m_wsStatus != wsWritingStream )
	{
		return	false ;
	}
	//
	// �L�[�t���[�����ǂ����𔻒�
	bool	fKeyFrame =
		((m_dwKeyFrame == 0) && (m_dwFrameCount == 0))
			|| ((m_dwFrameCount % m_dwKeyFrame) == 0) ;
	//
	// ���������t���[�������k
	if ( !fKeyFrame )
	{
		//
		// ��������
		::eriCopyImage( *m_priiBuf, rii ) ;
		::eriSubtractionOfFrame( *m_priiBuf, *m_priiLast ) ;
		//
		// ���k�J�n
		m_eric2.Delete( ) ;
		if ( m_fDualEncoding )
		{
			::ResetEvent( m_hCompressed ) ;
			::PostThreadMessage
				( m_idThread, tmEncodeImage, fdwFlags, (LPARAM) m_priiBuf ) ;
		}
		else
		{
			//
			// �V���O���X���b�h�����̏ꍇ�ɂ͂����ň��k
			if ( m_perie2->EncodeImage( *m_priiBuf, m_eric2, fdwFlags ) )
			{
				return	false ;
			}
		}
	}
	//
	// �񍷕������t���[�������k
	m_eric1.Delete( ) ;
	bool	fSuccessed =
		!m_perie1->EncodeImage( rii, m_eric1, fdwFlags ) ;
	//
	// �f���A���X���b�h���k���[�h�̎��́A����̈��k���I������̂�҂�
	if ( m_fDualEncoding && !fKeyFrame )
	{
		HANDLE	hEventList[2] ;
		hEventList[0] = m_hThread ;
		hEventList[1] = m_hCompressed ;
		DWORD	dwWaitResult =
			::WaitForMultipleObjects( 2, hEventList, FALSE, INFINITE ) ;
		//
		if ( (dwWaitResult == WAIT_OBJECT_0) || !m_fCompressSuccessed )
		{
			fSuccessed = false ;
		}
	}
	if ( !fSuccessed )
	{
		return	false ;
	}
	//
	// �t���[�����P�i�߂�
	++ m_dwFrameCount ;
	::eriCopyImage( *m_priiLast, rii ) ;
	//
	// ���k���ꂽ�f�[�^���擾����
	EEncodeContext *	pEncodedData ;
	PCUINT64			pRecID ;
	//
	if ( fKeyFrame )
	{
		pEncodedData = &m_eric1 ;
		pRecID = (PCUINT64)"ImageFrm" ;
	}
	else
	{
		if ( m_eric1.m_dwTotalBytes < m_eric2.m_dwTotalBytes )
		{
			pEncodedData = &m_eric1 ;
			pRecID = (PCUINT64)"ImageFrm" ;
		}
		else
		{
			pEncodedData = &m_eric2 ;
			pRecID = (PCUINT64)"DiffeFrm" ;
		}
	}
	//
	// �f�[�^�������o��
	if ( !m_eriwf.DescendRecord( pRecID ) )
	{
		return	false ;
	}
	//
	EOutputBuffer *	pNextBuf = pEncodedData->m_pFirstBuf ;
	while ( pNextBuf != NULL )
	{
		m_eriwf.Write( pNextBuf->m_ptrBuffer, pNextBuf->m_dwBytes ) ;
		pNextBuf = pNextBuf->m_ptrNext ;
	}
	//
	m_eriwf.AscendRecord( ) ;
	//
	// �o�̓o�b�t�@��j������
	m_eric1.Delete( ) ;
	//
	if ( !fKeyFrame )
	{
		m_eric2.Delete( ) ;
	}

	return	fSuccessed ;
}

//
// �X�g���[�������
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimationWriter::EndStream( DWORD dwTotalTime )
{
	if ( m_wsStatus != wsWritingStream )
	{
		return	false ;
	}
	//
	// �X���b�h���I��
	if ( m_hThread != NULL )
	{
		::PostThreadMessage( m_idThread, tmQuit, 0, 0 ) ;
		::WaitForSingleObject( m_hThread, INFINITE ) ;
		::CloseHandle( m_hThread ) ;
		m_hThread = NULL ;
	}
	if ( m_hCompressed != NULL )
	{
		::CloseHandle( m_hCompressed ) ;
		m_hCompressed = NULL ;
	}
	//
	// ���k�I�u�W�F�N�g�̗��p���Ă��郊�\�[�X��j��
	if ( m_efh.dwContainedFlag & EFH_CONTAIN_IMAGE )
	{
		m_eric1.Delete( ) ;
		m_eric2.Delete( ) ;
		m_perie1->Delete( ) ;
		m_perie2->Delete( ) ;
	}
	if ( m_pmioc != NULL )
	{
		delete	m_pmioc ;
		m_pmioc = NULL ;
	}
	//
	// �o�b�t�@���폜
	if ( m_priiLast != NULL )
	{
		DeleteImageBuffer( m_priiLast ) ;
		m_priiLast = NULL ;
	}
	if ( m_priiBuf != NULL )
	{
		DeleteImageBuffer( m_priiBuf ) ;
		m_priiBuf = NULL ;
	}
	//
	// �X�g���[�����R�[�h�����
	m_eriwf.AscendRecord( ) ;
	m_wsStatus = wsOpened ;
	//
	// �t�@�C���w�b�_���ďo��
	m_eriwf.Seek( 0 ) ;
	//
	if ( !m_eriwf.DescendRecord( (PCUINT64)"Header  " )
		|| !m_eriwf.DescendRecord( (PCUINT64)"FileHdr " ) )
	{
		return	false ;
	}
	m_efh.dwFrameCount = m_dwFrameCount ;
	m_efh.dwAllFrameTime = dwTotalTime ;
	m_eriwf.Write( &m_efh, sizeof(m_efh) ) ;
	m_eriwf.AscendRecord( ) ;
	//
	// �������w�b�_���ďo��
	if ( m_efh.dwContainedFlag & EFH_CONTAIN_WAVE )
	{
		m_eriwf.Seek( m_dwMioHeaderPos ) ;
		m_eriwf.DescendRecord( (PCUINT64)"SoundInf" ) ;
		m_mih.dwAllSampleCount = m_dwOutputWaveSamples ;
		m_eriwf.Write( &m_mih, sizeof(m_mih) ) ;
		m_eriwf.AscendRecord( ) ;
	}
	//
	m_eriwf.Seek( m_dwHeaderBytes ) ;
	m_eriwf.AscendRecord( ) ;

	return	true ;
}

//
// �摜�o�b�t�@�𐶐�
//////////////////////////////////////////////////////////////////////////////
RASTER_IMAGE_INFO *
	 ERIAnimationWriter::CreateImageBuffer( const ERI_INFO_HEADER & eih )
{
	//
	// RASTER_IMAGE_INFO �\���̃��������m��
	RASTER_IMAGE_INFO *	prii = new RASTER_IMAGE_INFO ;
	//
	// �p�����[�^�R�s�[
	prii->fdwFormatType = eih.fdwFormatType ;
	prii->nImageWidth = eih.nImageWidth ;
	prii->nImageHeight =
		(eih.nImageHeight < 0) ? - eih.nImageHeight : eih.nImageHeight ;
	prii->dwBitsPerPixel = eih.dwBitsPerPixel ;
	prii->BytesPerLine =
		((prii->nImageWidth * prii->dwBitsPerPixel / 8) + 0x03) & ~0x03 ;
	//
	// �摜�o�b�t�@�̃��������m��
	prii->ptrImageArray = (PBYTE)
		::eriAllocateMemory( prii->BytesPerLine * prii->nImageHeight ) ;

	return	prii ;
}

//
// �摜�o�b�t�@������
//////////////////////////////////////////////////////////////////////////////
void ERIAnimationWriter::DeleteImageBuffer( RASTER_IMAGE_INFO * prii )
{
	if ( prii != NULL )
	{
		::eriFreeMemory( prii->ptrImageArray ) ;
		delete	prii ;
	}
}

//
// �摜���k�I�u�W�F�N�g�𐶐�
//////////////////////////////////////////////////////////////////////////////
ERIEncoder * ERIAnimationWriter::CreateERIEncoder( void )
{
	return	new ERIEncoder ;
}

//
// �������k�I�u�W�F�N�g�𐶐�
//////////////////////////////////////////////////////////////////////////////
MIOEncoder * ERIAnimationWriter::CreateMIOEncoder( void )
{
	return	new MIOEncoder ;
}

//
// �o�͂��ꂽ�摜�̖������擾����
//////////////////////////////////////////////////////////////////////////////
DWORD ERIAnimationWriter::GetWrittenFrameCount( void ) const
{
	return	m_dwFrameCount ;
}

//
// �}���`�X���b�h���k��L����
//////////////////////////////////////////////////////////////////////////////
void ERIAnimationWriter::EnableDualEncoding( bool fDualEncoding )
{
	m_fDualEncoding = fDualEncoding ;
}

//
// �X���b�h�֐�
//////////////////////////////////////////////////////////////////////////////
DWORD WINAPI ERIAnimationWriter::ThreadProc( LPVOID parameter )
{
	return	((ERIAnimationWriter*)parameter)->EncodingThreadProc( ) ;
}

DWORD ERIAnimationWriter::EncodingThreadProc( void )
{
	::eriInitializeTask( ) ;
	//
	// ���b�Z�[�W�L���[�𐶐�
	//
	MSG		msg ;
	::PeekMessage( &msg, NULL, 0, 0, PM_NOREMOVE ) ;
	m_fCompressSuccessed = false ;
	::SetEvent( m_hCompressed ) ;
	//
	while ( ::GetMessage( &msg, NULL, 0, 0 ) )
	{
		if ( msg.message == tmEncodeImage )
		{
			//
			// �摜�����k
			//
			RASTER_IMAGE_INFO *	prii = (RASTER_IMAGE_INFO*) msg.lParam ;
			DWORD				fdwFlags = msg.wParam ;
			//
			m_fCompressSuccessed =
				!m_perie2->EncodeImage( *prii, m_eric2, fdwFlags ) ;
			//
			::SetEvent( m_hCompressed ) ;
		}
		else if ( msg.message == tmQuit )
		{
			break ;
		}
	}
	//
	::eriCloseTask( ) ;

	return	0 ;
}

