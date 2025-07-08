#pragma once

#include "UniverseFastestLibrary.h"

#ifdef __cplusplus
extern "C"
{
#endif

typedef uint8_t MutexLock;

__UNIVERSEFASTESTLIBRARY_DLLAPI__ void MutexLocked( MutexLock * MutexLockPt );
__UNIVERSEFASTESTLIBRARY_DLLAPI__ void MutexUnlock( MutexLock * MutexLockPt );

#ifdef __cplusplus
}
#endif
