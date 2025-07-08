#pragma once

//UniverseFastestLibrary��Ŀ��DLL��̬���ļ����뵼�����źꡣ
#if( defined __NAME_UNIVERSEFASTESTLIBRARY__ ) //������ڱ���UniverseFastestLibrary��Ŀ��
	#if( ( defined __MS_VCXX__ ) ) //�������ʹ��MS VC++��������
		#if( defined __COMLIB__ ) //������ڱ���LIB��̬���ļ���
			#define __UNIVERSEFASTESTLIBRARY_DLLAPI__
		#elif( defined __COMDLL__ ) //������ڱ���DLL��̬���ļ���
			#define __UNIVERSEFASTESTLIBRARY_DLLAPI__ __declspec( dllexport )
		#elif( defined __COMEXE__ ) //������ڱ���EXE��ִ���ļ���
			#define __UNIVERSEFASTESTLIBRARY_DLLAPI__
		#endif
	#elif( ( defined __LINUX_GCC__ ) || ( defined __CYGWIN_GCC__ ) || ( defined __ANDROID_GCC__ ) || ( defined __KEIL_ARMC__ ) ) //�������ʹ��Cygwin GCC/G++��Linux GCC/G++��Android GCC/G++��KEIL ARMCLANG/ARMCC��������
		#if( defined __COMLIB__ ) //������ڱ���LIB��̬���ļ���
			#define __UNIVERSEFASTESTLIBRARY_DLLAPI__
		#elif( defined __COMDLL__ ) //������ڱ���DLL��̬���ļ���
			#define __UNIVERSEFASTESTLIBRARY_DLLAPI__ __attribute__( ( visibility( "default" ) ) )
		#elif( defined __COMEXE__ ) //������ڱ���EXE��ִ���ļ���
			#define __UNIVERSEFASTESTLIBRARY_DLLAPI__
		#endif
	#else //�������ʹ��δ֪��������
		#define __UNIVERSEFASTESTLIBRARY_DLLAPI__
	#endif
#else //������ڱ���������Ŀ��
	#if( ( defined __MS_VCXX__ ) ) //�������ʹ��MS VC++��������
		#if( defined __LNKLIB__ ) //�����������LIB��̬���ļ���
			#define __UNIVERSEFASTESTLIBRARY_DLLAPI__
		#elif( defined __LNKDLL__ ) //�����������DLL��̬���ļ���
			#define __UNIVERSEFASTESTLIBRARY_DLLAPI__ __declspec( dllimport )
		#endif
	#elif( ( defined __LINUX_GCC__ ) || ( defined __CYGWIN_GCC__ ) || ( defined __ANDROID_GCC__ ) || ( defined __KEIL_ARMC__ ) ) //�������ʹ��Cygwin GCC/G++��Linux GCC/G++��Android GCC/G++��KEIL ARMCLANG/ARMCC��������
		#define __UNIVERSEFASTESTLIBRARY_DLLAPI__
	#else //�������ʹ��δ֪��������
		#define __UNIVERSEFASTESTLIBRARY_DLLAPI__
	#endif
#endif

#include <stdint.h>
#include <stddef.h>

#include "MemCpy.h"
#include "MutexLock.h"
