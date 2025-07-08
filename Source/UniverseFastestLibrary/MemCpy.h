#pragma once

#include "UniverseFastestLibrary.h"

#ifdef __cplusplus
extern "C"
{
#endif

//__UNIVERSEFASTESTLIBRARY_DLLAPI__ void * __cdecl memcpy( void * DstPt, void const * SrcPt, size_t SzByt ); //���ﲻ��Ҫ��������Ϊ�������ᱨ�ض��壬��Ӱ����á�
//__UNIVERSEFASTESTLIBRARY_DLLAPI__ void * __cdecl memmove( void * DstPt, void const * SrcPt, size_t SzByt ); //���ﲻ��Ҫ��������Ϊ�������ᱨ�ض��壬��Ӱ����á�
__UNIVERSEFASTESTLIBRARY_DLLAPI__ void * MemCpy( void * DstPt, void const * SrcPt, size_t SzByt );

#if( ( ( ( defined __MS_VCXX__ ) || ( defined __CYGWIN_GCC__ ) || ( defined __LINUX_GCC__ ) ) && ( ( defined __X86__ ) || ( defined __X64__ ) ) ) || ( ( defined __ANDROID_GCC__ ) && ( defined __X64__ ) ) ) //Android x86�²���ֱ�ӵ���MemCpyAvx��MemCpySse2��������ΪMemCpy�������ȡGOTָ�룬��MemCpyAvx��MemCpySse2���������ȡGOTָ�롣
__UNIVERSEFASTESTLIBRARY_DLLAPI__ void * MemCpyAvx( void * DstPt, void const * SrcPt, size_t SzByt );
__UNIVERSEFASTESTLIBRARY_DLLAPI__ void * MemCpySse2( void * DstPt, void const * SrcPt, size_t SzByt );
#endif

#ifdef __cplusplus
}
#endif
