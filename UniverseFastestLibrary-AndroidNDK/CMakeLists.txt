# the minimum version of CMake.
cmake_minimum_required( VERSION 3.10.0 )
project( UniverseFastestLibrary )
string( TOUPPER "${PROJECT_NAME}" PROJECT_NAME_UPPER )

if( ANDROID_ABI STREQUAL "x86" )
	enable_language( ASM )
elseif( ANDROID_ABI STREQUAL "x86_64" )
	enable_language( ASM )
elseif( ANDROID_ABI STREQUAL "armeabi-v7a" )
	enable_language( ASM )
elseif( ANDROID_ABI STREQUAL "arm64-v8a" )
	enable_language( ASM )
endif()

set( CMAKE_RUNTIME_OUTPUT_DIRECTORY ../../${PROJECT_NAME}/AndroidNDK/${ANDROID_ABI} )
set( CMAKE_LIBRARY_OUTPUT_DIRECTORY ../../${PROJECT_NAME}/AndroidNDK/${ANDROID_ABI} )
set( CMAKE_ARCHIVE_OUTPUT_DIRECTORY ../../${PROJECT_NAME}/AndroidNDK/${ANDROID_ABI} )

link_directories(
	../../Func/Func/AndroidNDK/${ANDROID_ABI}
	../../DataStruct/DataStruct/AndroidNDK/${ANDROID_ABI}
	../../Sokt/Sokt/AndroidNDK/${ANDROID_ABI}
	../../SpeexDsp/SpeexDsp/AndroidNDK/${ANDROID_ABI}
	../../WebRtc/WebRtc/AndroidNDK/${ANDROID_ABI}
	../../WebRtc3/WebRtc3/AndroidNDK/${ANDROID_ABI}
	../../SpeexWebRtcAec/SpeexWebRtcAec/AndroidNDK/${ANDROID_ABI}
	../../RNNoise/RNNoise/AndroidNDK/${ANDROID_ABI}
	../../Speex/Speex/AndroidNDK/${ANDROID_ABI}
	../../SrcResampler/SrcResampler/AndroidNDK/${ANDROID_ABI}
	../../OpenH264/OpenH264/AndroidNDK/${ANDROID_ABI}
	../../SystemH264/SystemH264/AndroidNDK/${ANDROID_ABI}
	../../Ajb/Ajb/AndroidNDK/${ANDROID_ABI}
	../../LibYUV/LibYUV/AndroidNDK/${ANDROID_ABI}
	../../MediaFile/MediaFile/AndroidNDK/${ANDROID_ABI}
	)

include_directories(
	../Source/${PROJECT_NAME}
	../Source/${PROJECT_NAME}/${PROJECT_NAME}
	../../Func/Func
	../../DataStruct/DataStruct
	../../Sokt/Sokt
	../../SpeexDsp/SpeexDsp
	../../WebRtc/WebRtc
	../../WebRtc3/WebRtc3
	../../SpeexWebRtcAec/SpeexWebRtcAec
	../../RNNoise/RNNoise
	../../Speex/Speex
	../../SrcResampler/SrcResampler
	../../OpenH264/OpenH264
	../../SystemH264/SystemH264
	../../Ajb/Ajb
	../../LibYUV/LibYUV
	../../MediaFile/MediaFile
	)

set( CMAKE_C_FLAGS "-fPIC -fvisibility=hidden -finput-charset=UTF-8 -fexec-charset=UTF-8 -Wall -Wpedantic -Wshadow -Winline -Wunreachable-code -flto=full -Ofast -pipe" )
set( CMAKE_CXX_FLAGS "-frtti -std=c++20" )
set( CMAKE_ASM_FLAGS "" )
if( ANDROID_ABI STREQUAL "x86" )
	set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__NAME_${PROJECT_NAME_UPPER}__ -D__ANDROID_NDK__ -D__X86__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__" )
	set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}" )
	set( CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS}" )
elseif( ANDROID_ABI STREQUAL "x86_64" )
	set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__NAME_${PROJECT_NAME_UPPER}__ -D__ANDROID_NDK__ -D__X64__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__" )
	set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}" )
	set( CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS}" )
elseif( ANDROID_ABI STREQUAL "armeabi-v7a" )
	set( ANDROID_ARM_NEON TRUE )
	set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mfloat-abi=softfp -mfpu=neon-vfpv4" )
	set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__NAME_${PROJECT_NAME_UPPER}__ -D__ANDROID_NDK__ -D__ARMAT32__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__" )
	set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}" )
	set( CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS}" )
elseif( ANDROID_ABI STREQUAL "arm64-v8a" )
	set( ANDROID_ARM_NEON TRUE )
	#set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mfloat-abi=hard -mfpu=neon-fp-armv8" )
	set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__NAME_${PROJECT_NAME_UPPER}__ -D__ANDROID_NDK__ -D__ARMA64__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__" )
	set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}" )
	set( CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS}" )
endif()
set( CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_CXX_FLAGS}" )
set( CMAKE_ASM_NASM_FLAGS "${CMAKE_ASM_FLAGS} ${CMAKE_ASM_NASM_FLAGS}" )
set( CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-O1 -Wl,-gc-sections -Wl,--hash-style=sysv -Wl,--as-needed" )

add_library( ${PROJECT_NAME} SHARED
	../Source/UniverseFastestLibrary-AndroidNDK/UniverseFastestLibraryJniLoadAndUnload.cpp
	../Source/UniverseFastestLibrary/UniverseFastestLibrary.cpp
	)
if( ANDROID_ABI STREQUAL "x86" )
	target_sources( ${PROJECT_NAME} PRIVATE
		../Source/UniverseFastestLibrary/MutexLock_AndroidGCC_x86.s
		../Source/UniverseFastestLibrary/MemCpy_AndroidGCC_x86.s
		)
elseif( ANDROID_ABI STREQUAL "x86_64" )
	target_sources( ${PROJECT_NAME} PRIVATE
		../Source/UniverseFastestLibrary/MutexLock_AndroidGCC_x64.s
		../Source/UniverseFastestLibrary/MemCpy_AndroidGCC_x64.s
		)
elseif( ANDROID_ABI STREQUAL "armeabi-v7a" )
	target_sources( ${PROJECT_NAME} PRIVATE
		../Source/UniverseFastestLibrary/MutexLock_AndroidGCC_ArmAt32.s
		../Source/UniverseFastestLibrary/MemCpy_AndroidGCC_ArmAt32.s
		)
elseif( ANDROID_ABI STREQUAL "arm64-v8a" )
	target_sources( ${PROJECT_NAME} PRIVATE
		../Source/UniverseFastestLibrary/MutexLock_AndroidGCC_ArmA64.s
		../Source/UniverseFastestLibrary/MemCpy_AndroidGCC_ArmA64.s
		)
endif()

target_link_libraries( ${PROJECT_NAME} PUBLIC
	libc.so
	liblog.so
	#libFunc.so
	)
