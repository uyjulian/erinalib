
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


/*****************************************************************************
                    ERI�A�j���[�V�����t�@�C���I�u�W�F�N�g
 *****************************************************************************/

//
// �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
ERIAnimation::EPreloadBuffer::EPreloadBuffer( DWORD dwLength )
	: EMemFile( NULL, dwLength )
{
	m_ptrBuffer = (BYTE*) ::eriAllocateMemory( dwLength ) ;
	m_ptrMemory = m_ptrBuffer ;
	m_iFrameIndex = 0 ;
	m_ui64RecType = 0 ;
}

//
// ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
ERIAnimation::EPreloadBuffer::~EPreloadBuffer( void )
{
	::eriFreeMemory( m_ptrBuffer ) ;
}

//
// �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
ERIAnimation::EPreloadQueue::EPreloadQueue( void )
{
	m_queue = NULL ;
	m_length = 0 ;
	m_limit = 0 ;
}

//
// ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
ERIAnimation::EPreloadQueue::~EPreloadQueue( void )
{
	RemoveAll( ) ;
}

//
// �z��̍ő�̒�����ݒ�
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::EPreloadQueue::SetLimit( unsigned int nLimit )
{
	m_limit = nLimit ;
	m_queue = (EPreloadBuffer**)
		::eriAllocateMemory( nLimit * sizeof(EPreloadBuffer*) ) ;
}

//
// �z�������
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::EPreloadQueue::RemoveAll( void )
{
	if ( m_queue != NULL )
	{
		for ( unsigned int i = 0; i < m_length; i ++ )
		{
			delete	m_queue[i] ;
		}
		::eriFreeMemory( m_queue ) ;
		m_queue = NULL ;
		m_length = 0 ;
		m_limit = 0 ;
	}
}

//
// �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
ERIAnimation::EKeyPointList::EKeyPointList( void )
{
	m_list = NULL ;
	m_count = 0 ;
	m_limit = 0 ;
}

//
// ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
ERIAnimation::EKeyPointList::~EKeyPointList( void )
{
	RemoveAll( ) ;
}

//
// �z��̍ō܂̒�����ݒ�
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::EKeyPointList::SetLimit( unsigned int nLimit )
{
	m_limit = nLimit ;
	m_list = (KEY_POINT*)
		::eriAllocateMemory( nLimit * sizeof(KEY_POINT) ) ;
}

//
// �z�������
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::EKeyPointList::RemoveAll( void )
{
	if ( m_list != NULL )
	{
		::eriFreeMemory( m_list ) ;
		m_list = NULL ;
		m_count = 0 ;
		m_limit = 0 ;
	}
}

//
// �\�z�֐�
//////////////////////////////////////////////////////////////////////////////
ERIAnimation::ERIAnimation( void )
{
	m_fWaveOutput = false ;
	m_fWaveStreaming = false ;
	m_peric = NULL ;
	m_perid = NULL ;
	m_pmioc = NULL ;
	m_pmiod = NULL ;
	m_pDstImage = NULL ;
	m_pPaletteTable = NULL ;
	m_pWorkImage = NULL ;
	m_hThread = NULL ;
	m_hQueueNotEmpty = NULL ;
	m_hQueueSpace = NULL ;
	::InitializeCriticalSection( &m_cs ) ;
}

//
// ���Ŋ֐�
//////////////////////////////////////////////////////////////////////////////
ERIAnimation::~ERIAnimation( void )
{
	Close( ) ;
	::DeleteCriticalSection( &m_cs ) ;
}

//
// �摜�W�J�o�̓o�b�t�@�v��
//////////////////////////////////////////////////////////////////////////////
RASTER_IMAGE_INFO * ERIAnimation::CreateImageBuffer
	( DWORD format, SDWORD width, SDWORD height,
				DWORD bpp, ENTIS_PALETTE ** ppaltbl )
{
	RASTER_IMAGE_INFO *	prii = new RASTER_IMAGE_INFO ;
	if ( height < 0 )
	{
		height = - height ;
	}
	prii->fdwFormatType = format ;
	prii->nImageWidth = width ;
	prii->nImageHeight = height ;
	prii->dwBitsPerPixel = bpp ;
	prii->BytesPerLine = ((width * bpp / 8) + 0x03) & ~0x03 ;
	prii->ptrImageArray =
		(PBYTE) ::eriAllocateMemory( prii->BytesPerLine * height ) ;
	//
	if ( ppaltbl != NULL )
	{
		if ( bpp <= 8 )
		{
			*ppaltbl = new ENTIS_PALETTE[0x100] ;
		}
		else
		{
			*ppaltbl = NULL ;
		}
	}
	//
	return	prii ;
}

//
// �摜�W�J�o�̓o�b�t�@����
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::DeleteImageBuffer
	( RASTER_IMAGE_INFO * prii, ENTIS_PALETTE * paltbl )
{
	if ( prii != NULL )
	{
		::eriFreeMemory( prii->ptrImageArray ) ;
		delete	prii ;
	}
	if ( paltbl != NULL )
	{
		delete []	paltbl ;
	}
}

//
// �摜�W�J�I�u�W�F�N�g����
//////////////////////////////////////////////////////////////////////////////
ERIDecoder * ERIAnimation::CreateERIDecoder( void )
{
	return	new ERIDecoder ;
}

//
// �����W�J�I�u�W�F�N�g����
//////////////////////////////////////////////////////////////////////////////
MIODecoder * ERIAnimation::CreateMIODecoder( void )
{
	return	new MIODecoder ;
}

//
// �����o�͗v��
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimation::RequestWaveOut
	( DWORD channels, DWORD frequency, DWORD bps )
{
	return	false ;
}

//
// �����o�͏I��
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::CloseWaveOut( void )
{
}

//
// �����f�[�^�o��
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::PushWaveBuffer( void * ptrWaveBuf, DWORD dwBytes )
{
	DeleteWaveBuffer( ptrWaveBuf ) ;
}

//
// �����o�b�t�@�m��
//////////////////////////////////////////////////////////////////////////////
void * ERIAnimation::AllocateWaveBuffer( DWORD dwBytes )
{
	return	::eriAllocateMemory( dwBytes ) ;
}

//
// �����f�[�^�j������
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::DeleteWaveBuffer( void * ptrWaveBuf )
{
	::eriFreeMemory( ptrWaveBuf ) ;
}

//
// �����X�g���[�~���O�J�n
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::BeginWaveStreaming( void )
{
	if ( m_fWaveOutput )
	{
		m_fWaveStreaming = true ;
		//
		if ( m_hThread != NULL )
		{
			HANDLE	hEventList[2] ;
			hEventList[0] = ::CreateEvent( NULL, TRUE, FALSE, NULL ) ;
			hEventList[1] = m_hThread ;
			::PostThreadMessage
				( m_idThread, tmSeekSound,
					m_iCurrentFrame, (LPARAM) hEventList[0] ) ;
			DWORD	dwWaitResult =
				::WaitForMultipleObjects( 2, hEventList, FALSE, INFINITE ) ;
			::CloseHandle( hEventList[0] ) ;
		}
	}
}

//
// �����X�g���[�~���O�I��
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::EndWaveStreaming( void )
{
	m_fWaveStreaming = false ;
}

//
// �A�j���[�V�����t�@�C�����J��
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimation::Open
	( EFileObject * pFile, unsigned int nPreloadSize, bool fTopDown )
{
	Close( ) ;
	//
	// ERI�t�@�C�����J���i�X�g���[�����R�[�h�܂ŊJ���j
	//////////////////////////////////////////////////////////////////////////
	if ( !m_erif.Open( pFile, m_erif.otOpenStream ) )
	{
		return	false ;
	}
	//
	// �W�J�I�u�W�F�N�g������������
	//////////////////////////////////////////////////////////////////////////
	m_perid = CreateERIDecoder( ) ;
	if ( m_perid->Initialize( m_erif.m_InfoHeader ) )
	{
		return	false ;
	}
	m_peric = new EFileDecodeContext( NULL, 0x10000 ) ;
	//
	m_fWaveOutput = false ;
	if ( m_erif.m_fdwReadMask & ERIFile::rmSoundInfo )
	{
		//
		// �T�E���h���܂܂�Ă���
		m_pmiod = CreateMIODecoder( ) ;
		if ( !m_pmiod->Initialize( m_erif.m_MIOInfHdr ) )
		{
			m_pmioc = new EFileDecodeContext( &m_erif, 0x10000 ) ;
			//
			// �����o�͗v��
			if ( RequestWaveOut
				( m_erif.m_MIOInfHdr.dwChannelCount,
					m_erif.m_MIOInfHdr.dwSamplesPerSec,
					m_erif.m_MIOInfHdr.dwBitsPerSample ) )
			{
				//
				// �����o�͗v�����󂯓����ꂽ
				m_fWaveOutput = true ;
			}
		}
	}
	//
	// �摜�o�b�t�@�𐶐�
	//////////////////////////////////////////////////////////////////////////
	m_fTopDown = fTopDown ;
	signed int			nImageHeight ;
	ENTIS_PALETTE **	ppaltbl = NULL ;
	if ( m_erif.m_InfoHeader.dwBitsPerPixel <= 8 )
	{
		ppaltbl = &m_pPaletteTable ;
	}
	nImageHeight = m_erif.m_InfoHeader.nImageHeight ;
	if ( nImageHeight < 0 )
	{
		nImageHeight = - nImageHeight ;
	}
	m_pDstImage = CreateImageBuffer
		( m_erif.m_InfoHeader.fdwFormatType,
			m_erif.m_InfoHeader.nImageWidth, nImageHeight,
			m_erif.m_InfoHeader.dwBitsPerPixel, ppaltbl ) ;
	//
	if ( m_pDstImage == NULL )
	{
		return	false ;
	}
	//
	m_pWorkImage = new RASTER_IMAGE_INFO ;
	m_pWorkImage->fdwFormatType = m_erif.m_InfoHeader.fdwFormatType ;
	m_pWorkImage->nImageWidth = m_erif.m_InfoHeader.nImageWidth ;
	m_pWorkImage->nImageHeight = nImageHeight ;
	m_pWorkImage->dwBitsPerPixel = m_erif.m_InfoHeader.dwBitsPerPixel ;
	m_pWorkImage->BytesPerLine =
		((m_erif.m_InfoHeader.nImageWidth *
			m_erif.m_InfoHeader.dwBitsPerPixel / 8) + 0x03) & ~0x03 ;
	m_pWorkImage->ptrImageArray =
		(PBYTE) ::eriAllocateMemory
			( m_pWorkImage->BytesPerLine * m_pWorkImage->nImageHeight ) ;
	//
	// ��ǂ݃o�b�t�@�z����m��
	//////////////////////////////////////////////////////////////////////////
	if ( nPreloadSize == 0 )
	{
		nPreloadSize = 30 ;
	}
	m_queueImage.SetLimit( nPreloadSize ) ;
	//
	// �t���[���V�[�N�p�L�[�|�C���g�z��m��
	//////////////////////////////////////////////////////////////////////////
	m_listKeyFrame.SetLimit( m_erif.m_FileHeader.dwFrameCount ) ;
	m_listKeyWave.SetLimit( m_erif.m_FileHeader.dwFrameCount ) ;
	//
	// �X���b�h�𐶐�
	//////////////////////////////////////////////////////////////////////////
	m_hQueueNotEmpty = ::CreateEvent( NULL, TRUE, FALSE, NULL ) ;
	m_hQueueSpace = ::CreateEvent( NULL, TRUE, TRUE, NULL ) ;
	m_hThread = ::CreateThread
		( NULL, 0, &ERIAnimation::ThreadProc, this, 0, &m_idThread ) ;
	if ( !(m_hQueueNotEmpty && m_hQueueSpace && m_hThread) )
	{
		return	false ;
	}
	//
	// ��1�t���[����W�J����
	//////////////////////////////////////////////////////////////////////////
	if ( !SeekToNextFrame( ) )
	{
		return	false ;
	}

	return	true ;
}

//
// �A�j���[�V�����t�@�C�������
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::Close( void )
{
	//
	// �X���b�h���I��������
	if ( m_hThread != NULL )
	{
		::PostThreadMessage( m_idThread, tmQuit, 0, 0 ) ;
		::WaitForSingleObject( m_hThread, INFINITE ) ;
		::CloseHandle( m_hThread ) ;
		m_hThread = NULL ;
	}
	//
	// ��ǂ݃L���[���N���A����
	if ( m_hQueueNotEmpty != NULL )
	{
		::CloseHandle( m_hQueueNotEmpty ) ;
		m_hQueueNotEmpty = NULL ;
	}
	if ( m_hQueueSpace != NULL )
	{
		::CloseHandle( m_hQueueSpace ) ;
		m_hQueueSpace = NULL ;
	}
	m_queueImage.RemoveAll( ) ;
	//
	// �L�[�t���[���|�C���g�z����N���A����
	m_listKeyFrame.RemoveAll( ) ;
	m_listKeyWave.RemoveAll( ) ;
	//
	// �摜�o�b�t�@���폜����
	if ( m_pDstImage != NULL )
	{
		DeleteImageBuffer( m_pDstImage, m_pPaletteTable ) ;
		m_pDstImage = NULL ;
		m_pPaletteTable = NULL ;
	}
	if ( m_pWorkImage != NULL )
	{
		::eriFreeMemory( m_pWorkImage->ptrImageArray ) ;
		delete	m_pWorkImage ;
		m_pWorkImage = NULL ;
	}
	//
	// �W�J�I�u�W�F�N�g���폜����
	if ( m_perid != NULL )
	{
		m_perid->Delete( ) ;
		delete	m_perid ;
		m_perid = NULL ;
	}
	if ( m_pmiod != NULL )
	{
		m_pmiod->Delete( ) ;
		delete	m_pmiod ;
		m_pmiod = NULL ;
	}
	if ( m_peric != NULL )
	{
		delete	m_peric ;
		m_peric = NULL ;
	}
	if ( m_pmioc != NULL )
	{
		delete	m_pmioc ;
		m_pmioc = NULL ;
	}
	//
	// �����o�͂̏I��
	if ( m_fWaveOutput )
	{
		CloseWaveOut( ) ;
		m_fWaveOutput = false ;
	}
	//
	// �t�@�C�������
	m_erif.Close( ) ;
}

//
// �擪�t���[���ֈړ�
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimation::SeekToBegin( void )
{
	//
	// �X���b�h�ɃV�[�N���b�Z�[�W�𑗂�
	//////////////////////////////////////////////////////////////////////////
	if ( m_hThread == NULL )
	{
		return	false ;
	}
	HANDLE	hEventList[2] ;
	hEventList[0] = ::CreateEvent( NULL, TRUE, FALSE, NULL ) ;
	hEventList[1] = m_hThread ;
	::PostThreadMessage
		( m_idThread, tmSeekFrame, 0, (LPARAM) hEventList[0] ) ;
	DWORD	dwWaitResult =
		::WaitForMultipleObjects( 2, hEventList, FALSE, INFINITE ) ;
	::CloseHandle( hEventList[0] ) ;
	if ( dwWaitResult != WAIT_OBJECT_0 )
	{
		return	false ;
	}
	//
	// �擪�t���[����W�J
	//////////////////////////////////////////////////////////////////////////
	if ( !SeekToNextFrame( ) )
	{
		return	false ;
	}

	return	true ;
}

//
// ���̃t���[���ֈړ�
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimation::SeekToNextFrame( int nSkipFrame )
{
	if ( m_hThread == NULL )
	{
		return	false ;
	}
	//
	// �w��t���[�����L�[�t���[��������ł���ꍇ�A
	// �L�[�t���[���f�[�^�܂ł̊Ԃ�ǂݔ�΂�
	//////////////////////////////////////////////////////////////////////////
	int	nBreakCount = 0 ;
	if ( (nSkipFrame > 0) && (GetKeyFrameCount() != 0) )
	{
		if ( GetKeyFrameCount() == 1 )
		{
			nBreakCount = nSkipFrame ;
		}
		else
		{
			int	nCountUntilNext =
				GetKeyFrameCount()
					- (m_iCurrentFrame % GetKeyFrameCount()) - 1 ;
			if ( nCountUntilNext <= nSkipFrame )
			{
				nBreakCount = nCountUntilNext ;
				nSkipFrame -= nCountUntilNext ;
			}
			int	nSkipKeyFrame = nSkipFrame / GetKeyFrameCount() ;
			nSkipFrame -= nSkipKeyFrame * GetKeyFrameCount() ;
			nBreakCount += nSkipKeyFrame * GetKeyFrameCount() ;
		}
	}
	//
	// �L�[�t���[���f�[�^�܂ł�j������
	//////////////////////////////////////////////////////////////////////////
	if ( nBreakCount > 0 )
	{
		int	nBreakedCount = 0 ;
		for ( ; ; )
		{
			//
			// �t���[�����ǂݍ��܂��܂ő҂�
			HANDLE	hEventList[2] =
			{
				m_hQueueNotEmpty, m_hThread
			} ;
			DWORD	dwWaitResult =
				::WaitForMultipleObjects( 2, hEventList, FALSE, INFINITE ) ;
			if ( dwWaitResult != WAIT_OBJECT_0 )
			{
				return	false ;
			}
			//
			// �t���[���f�[�^����j������
			Lock( ) ;
			EPreloadBuffer *	pBuffer = GetPreloadBuffer( ) ;
			if ( pBuffer != NULL )
			{
				unsigned __int64	recid = pBuffer->m_ui64RecType ;
				if ( (recid == *((UINT64*)"ImageFrm")) ||
						(recid == *((UINT64*)"DiffeFrm")) )
				{
					//
					// �t���[���f�[�^�͔j��
					++ nBreakedCount ;
				}
				else if ( recid == *((UINT64*)"Palette ") )
				{
					//
					// �p���b�g�f�[�^�͓K�p
					unsigned int	nBytes = pBuffer->GetLength( ) ;
					if ( nBytes > sizeof(ENTIS_PALETTE) * 0x100 )
						nBytes = sizeof(ENTIS_PALETTE) * 0x100 ;
					pBuffer->Read( m_pPaletteTable, nBytes ) ;
				}
			}
			delete	pBuffer ;
			Unlock( ) ;
			//
			if ( nBreakedCount >= nBreakCount )
			{
				break ;
			}
		}
	}
	//
	// �w��t���[���܂ŏ����W�J
	//////////////////////////////////////////////////////////////////////////
	int	nSkippedCount = 0 ;
	nSkipFrame ++ ;
	for ( ; ; )
	{
		if ( !DecodeNextFrame( ) )
		{
			return	false ;
		}
		if ( ++ nSkippedCount >= nSkipFrame )
		{
			break ;
		}
	}

	return	true ;
}

//
// �w��̃t���[���Ɉړ�
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimation::SeekToFrame( unsigned int iFrameIndex )
{
	//
	// �������
	//////////////////////////////////////////////////////////////////////////
	if ( m_iCurrentFrame == iFrameIndex )
	{
		return	true ;
	}
	if ( m_iCurrentFrame <= iFrameIndex )
	{
		unsigned int	nKeyFrame = GetKeyFrameCount( ) ;
		if ( nKeyFrame == 0 )
		{
			return	SeekToNextFrame( iFrameIndex - m_iCurrentFrame - 1 ) ;
		}
		if ( (iFrameIndex / nKeyFrame) == (m_iCurrentFrame / nKeyFrame) )
		{
			return	SeekToNextFrame( iFrameIndex - m_iCurrentFrame - 1 ) ;
		}
	}
	//
	// �X�g���[�~���O��~
	//////////////////////////////////////////////////////////////////////////
	if ( m_fWaveStreaming )
	{
		EndWaveStreaming( ) ;
		m_fWaveStreaming = false ;
	}
	//
	// �X���b�h�ɃV�[�N���b�Z�[�W�𑗂�
	//////////////////////////////////////////////////////////////////////////
	if ( m_hThread == NULL )
	{
		return	false ;
	}
	unsigned int	iKeyFrame = 0 ;
	if ( GetKeyFrameCount() > 0 )
	{
		iKeyFrame = iFrameIndex / GetKeyFrameCount() ;
		iKeyFrame *= GetKeyFrameCount() ;
	}
	HANDLE	hEventList[2] ;
	hEventList[0] = ::CreateEvent( NULL, TRUE, FALSE, NULL ) ;
	hEventList[1] = m_hThread ;
	::PostThreadMessage
		( m_idThread, tmSeekFrame,
			(WPARAM) iKeyFrame, (LPARAM) hEventList[0] ) ;
	DWORD	dwWaitResult =
		::WaitForMultipleObjects( 2, hEventList, FALSE, INFINITE ) ;
	::CloseHandle( hEventList[0] ) ;
	if ( dwWaitResult != WAIT_OBJECT_0 )
	{
		return	false ;
	}
	//
	// �L�[�t���[����W�J
	//////////////////////////////////////////////////////////////////////////
	if ( !SeekToNextFrame( ) )
	{
		return	false ;
	}
	//
	// �����t���[����W�J
	//////////////////////////////////////////////////////////////////////////
	if ( iFrameIndex > iKeyFrame )
	{
		if ( !SeekToNextFrame( iFrameIndex - iKeyFrame - 1 ) )
		{
			return	false ;
		}
	}

	return	true ;
}

//
// �w��̃t���[���̓L�[�t���[�����H
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimation::IsKeyFrame( unsigned int iFrameIndex )
{
	if ( m_erif.m_FileHeader.dwKeyFrameCount == 1 )
		return	true ;
	if ( iFrameIndex == 0 )
		return	true ;
	if ( m_erif.m_FileHeader.dwKeyFrameCount == 0 )
		return	false ;
	//
	return	(iFrameIndex % m_erif.m_FileHeader.dwKeyFrameCount) == 0 ;
}

//
// ���̃t���[����W�J����
//////////////////////////////////////////////////////////////////////////////
bool ERIAnimation::DecodeNextFrame( void )
{
	if ( m_hThread == NULL )
	{
		return	false ;
	}
	//
	bool	fResult = false ;
	for ( ; ; )
	{
		//
		// �t���[�����ǂݍ��܂��܂ő҂�
		//////////////////////////////////////////////////////////////////////
		HANDLE	hEventList[2] =
		{
			m_hQueueNotEmpty, m_hThread
		} ;
		DWORD	dwWaitResult =
			::WaitForMultipleObjects( 2, hEventList, FALSE, INFINITE ) ;
		if ( dwWaitResult != WAIT_OBJECT_0 )
		{
			return	false ;
		}
		//
		// 1�t���[���擾
		//////////////////////////////////////////////////////////////////////
		bool	fDecodedFrame = false ;
		Lock( ) ;
		EPreloadBuffer *	pBuffer = GetPreloadBuffer( ) ;
		if ( pBuffer != NULL )
		{
			unsigned __int64	recid = pBuffer->m_ui64RecType ;
			if ( (recid == *((UINT64*)"ImageFrm")) ||
					(recid == *((UINT64*)"DiffeFrm")) )
			{
				//
				// �t���[���f�[�^��W�J
				bool	fKeyFrame = (recid == *((UINT64*)"ImageFrm")) ;
				RASTER_IMAGE_INFO *	prii ;
				if ( fKeyFrame )
				{
					prii = m_pDstImage ;
				}
				else
				{
					prii = m_pWorkImage ;
				}
				//
				pBuffer->Seek( 0 ) ;
				m_peric->AttachFileObject( pBuffer ) ;
				if ( !m_perid->DecodeImage( *prii, *m_peric, m_fTopDown ) )
				{
					fResult = true ;
				}
				//
				// ��������
				if ( !fKeyFrame )
				{
					::eriAdditionOfFrame( *m_pDstImage, *m_pWorkImage ) ;
				}
				//
				m_iCurrentFrame = pBuffer->m_iFrameIndex ;
				fDecodedFrame = true ;
			}
			else if ( recid == *((UINT64*)"Palette ") )
			{
				//
				// �p���b�g�f�[�^��K�p
				unsigned int	nBytes = pBuffer->GetLength( ) ;
				if ( nBytes > sizeof(ENTIS_PALETTE) * 0x100 )
					nBytes = sizeof(ENTIS_PALETTE) * 0x100 ;
				pBuffer->Read( m_pPaletteTable, nBytes ) ;
			}
		}
		delete	pBuffer ;
		Unlock( ) ;
		//
		if ( fDecodedFrame )
		{
			break ;
		}
	}

	return	fResult ;
}

//
// ��ǂ݃o�b�t�@���擾����
//////////////////////////////////////////////////////////////////////////////
ERIAnimation::EPreloadBuffer * ERIAnimation::GetPreloadBuffer( void )
{
	EPreloadBuffer *	pBuffer = NULL ;
	Lock( ) ;
	if ( m_queueImage.m_length != 0 )
	{
		pBuffer = m_queueImage.m_queue[0] ;
		for ( unsigned int i = 1; i < m_queueImage.m_length; i ++ )
		{
			m_queueImage.m_queue[i - 1] = m_queueImage.m_queue[i] ;
		}
		if ( -- m_queueImage.m_length == 0 )
		{
			::ResetEvent( m_hQueueNotEmpty ) ;
		}
		if ( m_queueImage.m_length < m_queueImage.m_limit )
		{
			::SetEvent( m_hQueueSpace ) ;
		}
	}
	Unlock( ) ;
	return	pBuffer ;
}

//
// ��ǂ݃o�b�t�@�ɒǉ�����
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::AddPreloadBuffer( EPreloadBuffer * pBuffer )
{
	Lock( ) ;
	if ( m_queueImage.m_length < m_queueImage.m_limit )
	{
		m_queueImage.m_queue[m_queueImage.m_length ++] = pBuffer ;
		if ( m_queueImage.m_length != 0 )
		{
			::SetEvent( m_hQueueNotEmpty ) ;
		}
		if ( m_queueImage.m_length >= m_queueImage.m_limit )
		{
			::ResetEvent( m_hQueueSpace ) ;
		}
	}
	Unlock( ) ;
}

//
// ERIFile �I�u�W�F�N�g���擾����
//////////////////////////////////////////////////////////////////////////////
const ERIFile & ERIAnimation::GetERIFile( void ) const
{
	return	m_erif ;
}

//
// �J�����g�t���[���̃C���f�b�N�X���擾����
//////////////////////////////////////////////////////////////////////////////
unsigned int ERIAnimation::CurrentIndex( void ) const
{
	return	m_iCurrentFrame ;
}

//
// �J�����g�t���[���̉摜���擾
//////////////////////////////////////////////////////////////////////////////
const RASTER_IMAGE_INFO * ERIAnimation::GetImageInfo( void ) const
{
	return	m_pDstImage ;
}

//
// �p���b�g�e�[�u���擾
//////////////////////////////////////////////////////////////////////////////
const ENTIS_PALETTE * ERIAnimation::GetPaletteEntries( void ) const
{
	return	m_pPaletteTable ;
}

//
// �L�[�t���[�����擾
//////////////////////////////////////////////////////////////////////////////
unsigned int ERIAnimation::GetKeyFrameCount( void ) const
{
	return	m_erif.m_FileHeader.dwKeyFrameCount ;
}

//
// �S�t���[�������擾
//////////////////////////////////////////////////////////////////////////////
unsigned int ERIAnimation::GetAllFrameCount( void ) const
{
	return	m_erif.m_FileHeader.dwFrameCount ;
}

//
// �S�A�j���[�V�������Ԃ��擾
//////////////////////////////////////////////////////////////////////////////
unsigned int ERIAnimation::GetTotalTime( void ) const
{
	return	m_erif.m_FileHeader.dwAllFrameTime ;
}

//
// �t���[���ԍ����玞�Ԃ֕ϊ�
//////////////////////////////////////////////////////////////////////////////
unsigned int ERIAnimation::FrameIndexToTime( unsigned int iFrameIndex ) const
{
	if ( m_erif.m_FileHeader.dwFrameCount == 0 )
		return	0 ;
	return	::MulDiv
		( iFrameIndex,
			m_erif.m_FileHeader.dwAllFrameTime,
			m_erif.m_FileHeader.dwFrameCount ) ;
}

//
// ���Ԃ���t���[���ԍ��֕ϊ�
//////////////////////////////////////////////////////////////////////////////
unsigned int ERIAnimation::TimeToFrameIndex( unsigned int nMilliSec ) const
{
	if ( m_erif.m_FileHeader.dwAllFrameTime == 0 )
		return	0 ;
	return	::MulDiv
		( nMilliSec,
			m_erif.m_FileHeader.dwFrameCount,
			m_erif.m_FileHeader.dwAllFrameTime ) ;
}

//
// �X���b�h�֐�
//////////////////////////////////////////////////////////////////////////////
DWORD WINAPI ERIAnimation::ThreadProc( LPVOID parameter )
{
	return	((ERIAnimation*)parameter)->LoadingThreadProc( ) ;
}

DWORD ERIAnimation::LoadingThreadProc( void )
{
	//
	// ���b�Z�[�W�L���[���쐬
	//////////////////////////////////////////////////////////////////////////
	MSG		msg ;
	::PeekMessage( &msg, NULL, 0, 0, PM_NOREMOVE ) ;
	//
	// �ϐ�������
	//////////////////////////////////////////////////////////////////////////
	unsigned int	iCurrentFrame = 0 ;
	KEY_POINT	keypoint ;
	keypoint.iKeyFrame = 0 ;
	keypoint.dwRecOffset = m_erif.GetPointer( ) ;
	AddKeyPoint( m_listKeyFrame, keypoint ) ;
	//
	// �e���R�[�h��ǂݍ���
	//////////////////////////////////////////////////////////////////////////
	for ( ; ; )
	{
		//
		// ���R�[�h���J��
		//////////////////////////////////////////////////////////////////////
		DWORD	dwRecPosition = m_erif.GetPointer( ) ;
		if ( !m_erif.DescendRecord( ) )
		{
			if ( iCurrentFrame == 0 )
			{
				// 1���摜���R�[�h�������ꍇ�̓G���[
				break ;
			}
			//
			// ���R�[�h�̏I�[�ɓ��B������
			// �����I�ɐ擪�Ɉړ�
			iCurrentFrame = 0 ;
			m_erif.Seek( 0 ) ;
			continue ;
		}
		//
		// ���R�[�h�̎�ނ𔻕�
		//////////////////////////////////////////////////////////////////////
		UINT64	recid = m_erif.GetRecordID( ) ;
		EPreloadBuffer *	pBuffer = NULL ;
		if ( (recid == *((UINT64*)"ImageFrm")) ||
				(recid == *((UINT64*)"DiffeFrm")) )
		{
			//
			// �摜�f�[�^���R�[�h
			//
			DWORD	dwDataBytes = m_erif.GetLength( ) ;
			pBuffer = new EPreloadBuffer( dwDataBytes ) ;
			pBuffer->m_iFrameIndex = iCurrentFrame ;
			pBuffer->m_ui64RecType = recid ;
			m_erif.Read( pBuffer->m_ptrBuffer, dwDataBytes ) ;
			//
			m_erif.AscendRecord( ) ;
			//
			++ iCurrentFrame ;
			if ( IsKeyFrame( iCurrentFrame ) )
			{
				KEY_POINT *	pKeyPoint =
					SearchKeyPoint( m_listKeyFrame, iCurrentFrame ) ;
				if ( pKeyPoint == NULL )
				{
					keypoint.iKeyFrame = iCurrentFrame ;
					keypoint.dwRecOffset = m_erif.GetPointer( ) ;
					AddKeyPoint( m_listKeyFrame, keypoint ) ;
				}
			}
		}
		else if ( recid == *((UINT64*)"Palette ") )
		{
			//
			// �p���b�g�e�[�u�����R�[�h
			//
			DWORD	dwDataBytes = m_erif.GetLength( ) ;
			pBuffer = new EPreloadBuffer( dwDataBytes ) ;
			pBuffer->m_iFrameIndex = iCurrentFrame ;
			pBuffer->m_ui64RecType = recid ;
			m_erif.Read( pBuffer->m_ptrBuffer, dwDataBytes ) ;
			m_erif.AscendRecord( ) ;
		}
		else if ( recid == *((UINT64*)"SoundStm") )
		{
			//
			// �����X�g���[�����R�[�h
			//
			MIO_DATA_HEADER	miodh ;
			m_erif.Read( &miodh, sizeof(MIO_DATA_HEADER) ) ;
			if ( miodh.bytFlags & MIO_LEAD_BLOCK )
			{
				KEY_POINT *	pKeyPoint =
					SearchKeyPoint( m_listKeyWave, iCurrentFrame ) ;
				if ( pKeyPoint == NULL )
				{
					keypoint.iKeyFrame = iCurrentFrame ;
					keypoint.dwRecOffset = dwRecPosition ;
					AddKeyPoint( m_listKeyWave, keypoint ) ;
				}
			}
			//
			if ( m_fWaveStreaming && m_fWaveOutput )
			{
				//
				// �����X�g���[�~���O���[�h
				//		�� �f�R�[�h���ďo��
				//
				DWORD	dwBytes = miodh.dwSampleCount
							* m_erif.m_MIOInfHdr.dwChannelCount
							* (m_erif.m_MIOInfHdr.dwBitsPerSample / 8) ;
				void *	ptrWaveBuf = AllocateWaveBuffer( dwBytes ) ;
				if ( ptrWaveBuf != NULL )
				{
					if ( !m_pmiod->DecodeSound( *m_pmioc, miodh, ptrWaveBuf ) )
					{
						PushWaveBuffer( ptrWaveBuf, dwBytes ) ;
					}
					else
					{
						DeleteWaveBuffer( ptrWaveBuf ) ;
					}
				}
			}
			//
			m_erif.AscendRecord( ) ;
		}
		else
		{
			//
			// ���R�[�h�����
			//////////////////////////////////////////////////////////////////////
			m_erif.AscendRecord( ) ;
		}
		//
		// ���b�Z�[�W����M���E�F�C�g
		//////////////////////////////////////////////////////////////////////
		bool	fQuit = false ;
		do
		{
			//
			// �L���[���󂭂����b�Z�[�W����M����܂ő҂�
			DWORD	dwWaitResult =
				::MsgWaitForMultipleObjects
					( 1, &m_hQueueSpace, FALSE, INFINITE, QS_ALLINPUT ) ;
			if ( (pBuffer != NULL) && (dwWaitResult == WAIT_OBJECT_0) )
			{
				AddPreloadBuffer( pBuffer ) ;
				pBuffer = NULL ;
			}
			//
			if ( ::PeekMessage( &msg, NULL, 0, 0, PM_REMOVE ) )
			{
				if ( msg.message == tmSeekFrame )
				{
					//
					// �L�[�t���[���ɃV�[�N
					//
					if ( pBuffer != NULL )
					{
						m_erif.Seek( dwRecPosition ) ;
						delete	pBuffer ;
						pBuffer = NULL ;
					}
					SeekKeyPoint
						( m_listKeyFrame, msg.wParam, iCurrentFrame ) ;
					//
					::SetEvent( (HANDLE) msg.lParam ) ;
				}
				else if ( msg.message == tmSeekSound )
				{
					//
					// �����f�[�^���V�[�N
					//
					SeekKeyWave( m_listKeyWave, msg.wParam ) ;
					//
					::SetEvent( (HANDLE) msg.lParam ) ;
				}
				else if ( msg.message == tmQuit )
				{
					//
					// �I��
					//
					fQuit = true ;
					break ;
				}
			}
		}
		while ( pBuffer != NULL ) ;
		//
		if ( fQuit )
		{
			delete	pBuffer ;
			break ;
		}
	}

	return	0 ;
}

//
// �L�[�t���[���|�C���g��ǉ�����
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::AddKeyPoint
	( ERIAnimation::EKeyPointList & list, ERIAnimation::KEY_POINT key )
{
	Lock( ) ;
	if ( list.m_count < list.m_limit )
	{
		list.m_list[list.m_count ++] = key ;
	}
	Unlock( ) ;
}

//
// �w��̃L�[�t���[������������
//////////////////////////////////////////////////////////////////////////////
ERIAnimation::KEY_POINT * ERIAnimation::SearchKeyPoint
	( ERIAnimation::EKeyPointList & list, unsigned int iKeyFrame )
{
	int		iFirst, iMiddle, iEnd ;
	KEY_POINT *	pFoundKey ;
	//
	Lock( ) ;
	//
	iFirst = 0 ;
	iEnd = list.m_count - 1 ;
	//
	for ( ; ; )
	{
		if ( iFirst > iEnd )
		{
			pFoundKey = NULL ;
			break ;
		}
		//
		iMiddle = (iFirst + iEnd) / 2 ;
		pFoundKey = &(list.m_list[iMiddle]) ;
		//
		if ( pFoundKey->iKeyFrame == iKeyFrame )
		{
			break ;
		}
		if ( pFoundKey->iKeyFrame > iKeyFrame )
		{
			iEnd = iMiddle - 1 ;
		}
		else
		{
			iFirst = iMiddle + 1 ;
		}
	}
	//
	Unlock( ) ;
	//
	return	pFoundKey ;
}

//
// �w��̃t���[���ɃV�[�N����
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::SeekKeyPoint
	( ERIAnimation::EKeyPointList & list,
		unsigned int iFrame, unsigned int & iCurrentFrame )
{
	if ( !IsKeyFrame( iFrame ) )
		return ;
	//
	// ��ǂ݃L���[�ɓǂݍ��܂�Ă��邩���f
	//
	bool	fHaveSeeked = false ;
	Lock( ) ;
	for ( ; ; )
	{
		if ( m_queueImage.m_length == 0 )
		{
			::ResetEvent( m_hQueueNotEmpty ) ;
			break ;
		}
		EPreloadBuffer *	pBuffer = m_queueImage.m_queue[0] ;
		if ( (pBuffer != NULL)
				&& (pBuffer->m_iFrameIndex == iFrame) )
		{
			fHaveSeeked = true ;
			break ;
		}
		delete	GetPreloadBuffer( ) ;
	}
	Unlock( ) ;
	//
	if ( !fHaveSeeked )
	{
		//
		// ���X�g�Ɏw��t���[���̃|�C���^��
		// �o�^����Ă��邩�ǂ����𒲂ׂ�
		//
		KEY_POINT *	pKeyPoint = SearchKeyPoint( m_listKeyFrame, iFrame ) ;
		//
		if ( pKeyPoint != NULL )
		{
			//
			// �|�C���^�ɃV�[�N
			//
			m_erif.Seek( pKeyPoint->dwRecOffset ) ;
			iCurrentFrame = iFrame ;
		}
		else
		{
			//
			// �w��̃t���[����T��
			//
			do
			{
				//
				// ���̃��R�[�h���J��
				//
				DWORD	dwRecPosition = m_erif.GetPointer( ) ;
				if ( !m_erif.DescendRecord( ) )
				{
					iCurrentFrame = 0 ;
					m_erif.Seek( 0 ) ;
					break ;
				}
				//
				// ���R�[�h�̎�ނ𔻕�
				//
				UINT64	recid = m_erif.GetRecordID( ) ;
				if ( (recid == *((UINT64*)"ImageFrm")) ||
						(recid == *((UINT64*)"DiffeFrm")) )
				{
					//
					// �摜�f�[�^���R�[�h
					//
					m_erif.AscendRecord( ) ;
					++ iCurrentFrame ;
					if ( IsKeyFrame( iCurrentFrame ) )
					{
						KEY_POINT *	pKeyPoint =
							SearchKeyPoint( m_listKeyFrame, iCurrentFrame ) ;
						if ( pKeyPoint == NULL )
						{
							KEY_POINT	keypoint ;
							keypoint.iKeyFrame = iCurrentFrame ;
							keypoint.dwRecOffset = m_erif.GetPointer( ) ;
							AddKeyPoint( m_listKeyFrame, keypoint ) ;
						}
					}
					if ( iCurrentFrame == iFrame )
					{
						fHaveSeeked = true ;
					}
				}
				else if ( recid == *((UINT64*)"SoundStm") )
				{
					//
					// �����X�g���[�����R�[�h
					//
					MIO_DATA_HEADER	miodh ;
					m_erif.Read( &miodh, sizeof(MIO_DATA_HEADER) ) ;
					if ( miodh.bytFlags & MIO_LEAD_BLOCK )
					{
						KEY_POINT *	pKeyPoint =
							SearchKeyPoint( m_listKeyWave, iCurrentFrame ) ;
						if ( pKeyPoint == NULL )
						{
							KEY_POINT	keypoint ;
							keypoint.iKeyFrame = iCurrentFrame ;
							keypoint.dwRecOffset = dwRecPosition ;
							AddKeyPoint( m_listKeyWave, keypoint ) ;
						}
					}
					m_erif.AscendRecord( ) ;
				}
				else
				{
					m_erif.AscendRecord( ) ;
				}
			}
			while ( !fHaveSeeked ) ;
		}
	}
}

//
// �w��̉����f�[�^�܂ŃV�[�N���ăX�g���[�~���O�o�͂���
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::SeekKeyWave
	( EKeyPointList & list, unsigned int iFrame )
{
	if ( !m_fWaveOutput || !m_fWaveStreaming )
	{
		return ;
	}
	//
	// �V�[�N�|�C���g����ԂŁA�ł��߂��L�[�|�C���g����������
	//
	int		iFirst, iMiddle, iEnd ;
	KEY_POINT *	pKeyPoint ;
	Lock( ) ;
	iFirst = 0 ;
	iEnd = list.m_count - 1 ;
	for ( ; ; )
	{
		if ( iFirst > iEnd )
		{
			pKeyPoint = &(list.m_list[iEnd]) ;
			break ;
		}
		//
		iMiddle = (iFirst + iEnd) / 2 ;
		pKeyPoint = &(list.m_list[iMiddle]) ;
		//
		if ( pKeyPoint->iKeyFrame == iFrame )
		{
			break ;
		}
		if ( pKeyPoint->iKeyFrame > iFrame )
		{
			iEnd = iMiddle - 1 ;
		}
		else
		{
			iFirst = iMiddle + 1 ;
		}
	}
	Unlock( ) ;
	//
	// �t�@�C���|�C���^���ړ�
	//
	DWORD	dwOriginalPointer = m_erif.GetPointer( ) ;
	unsigned int	iCurrentFrame = pKeyPoint->iKeyFrame ;
	m_erif.Seek( pKeyPoint->dwRecOffset ) ;
	//
	// �w��̏ꏊ��T��
	//
	do
	{
		//
		// ���̃��R�[�h���J��
		//
		DWORD	dwRecPosition = m_erif.GetPointer( ) ;
		if ( !m_erif.DescendRecord( ) )
		{
			m_erif.Seek( 0 ) ;
			break ;
		}
		//
		// ���R�[�h�̎�ނ𔻕�
		//
		UINT64	recid = m_erif.GetRecordID( ) ;
		if ( (recid == *((UINT64*)"ImageFrm")) ||
				(recid == *((UINT64*)"DiffeFrm")) )
		{
			//
			// �摜�f�[�^���R�[�h
			//
			m_erif.AscendRecord( ) ;
			++ iCurrentFrame ;
			if ( IsKeyFrame( iCurrentFrame ) )
			{
				KEY_POINT *	pKeyPoint =
					SearchKeyPoint( m_listKeyFrame, iCurrentFrame ) ;
				if ( pKeyPoint == NULL )
				{
					KEY_POINT	keypoint ;
					keypoint.iKeyFrame = iCurrentFrame ;
					keypoint.dwRecOffset = m_erif.GetPointer( ) ;
					AddKeyPoint( m_listKeyFrame, keypoint ) ;
				}
			}
		}
		else if ( recid == *((UINT64*)"SoundStm") )
		{
			//
			// �����X�g���[�����R�[�h
			//
			MIO_DATA_HEADER	miodh ;
			m_erif.Read( &miodh, sizeof(MIO_DATA_HEADER) ) ;
			if ( miodh.bytFlags & MIO_LEAD_BLOCK )
			{
				KEY_POINT *	pKeyPoint =
					SearchKeyPoint( m_listKeyWave, iCurrentFrame ) ;
				if ( pKeyPoint == NULL )
				{
					KEY_POINT	keypoint ;
					keypoint.iKeyFrame = iCurrentFrame ;
					keypoint.dwRecOffset = dwRecPosition ;
					AddKeyPoint( m_listKeyWave, keypoint ) ;
				}
			}
			//
			// �����X�g���[�~���O���[�h
			//		�� �f�R�[�h���ďo��
			//
			DWORD	dwBytes = miodh.dwSampleCount
						* m_erif.m_MIOInfHdr.dwChannelCount
						* (m_erif.m_MIOInfHdr.dwBitsPerSample / 8) ;
			void *	ptrWaveBuf = AllocateWaveBuffer( dwBytes ) ;
			if ( ptrWaveBuf != NULL )
			{
				if ( !m_pmiod->DecodeSound( *m_pmioc, miodh, ptrWaveBuf ) )
				{
					if ( iCurrentFrame >= iFrame )
					{
						PushWaveBuffer( ptrWaveBuf, dwBytes ) ;
					}
					else
					{
						DeleteWaveBuffer( ptrWaveBuf ) ;
					}
				}
				else
				{
					DeleteWaveBuffer( ptrWaveBuf ) ;
				}
			}
			//
			m_erif.AscendRecord( ) ;
		}
		else
		{
			m_erif.AscendRecord( ) ;
		}
	}
	while ( m_erif.GetPointer() < dwOriginalPointer ) ;
}

//
// �r�������i�N���e�B�J���Z�N�V�����j
//////////////////////////////////////////////////////////////////////////////
void ERIAnimation::Lock( void )
{
	::EnterCriticalSection( &m_cs ) ;
}

void ERIAnimation::Unlock( void )
{
	::LeaveCriticalSection( &m_cs ) ;
}

