# the minimum version of CMake.
cmake_minimum_required( VERSION 3.10.0 )
project( UniverseFastestLibrary )
string( TOUPPER "${PROJECT_NAME}" PROJECT_NAME_UPPER )

if( OHOS_ARCH STREQUAL "x86_64" )
	enable_language( ASM )
elseif( OHOS_ARCH STREQUAL "arm64-v8a" )
	enable_language( ASM )
endif()

set( CMAKE_RUNTIME_OUTPUT_DIRECTORY ../../${PROJECT_NAME}/HarmonyNDK/${OHOS_ARCH} )
set( CMAKE_LIBRARY_OUTPUT_DIRECTORY ../../${PROJECT_NAME}/HarmonyNDK/${OHOS_ARCH} )
set( CMAKE_ARCHIVE_OUTPUT_DIRECTORY ../../${PROJECT_NAME}/HarmonyNDK/${OHOS_ARCH} )

link_directories(
	../../Func/Func/HarmonyNDK/${OHOS_ARCH}
	../../DataStruct/DataStruct/HarmonyNDK/${OHOS_ARCH}
	../../Sokt/Sokt/HarmonyNDK/${OHOS_ARCH}
	../../SpeexDsp/SpeexDsp/HarmonyNDK/${OHOS_ARCH}
	../../WebRtc/WebRtc/HarmonyNDK/${OHOS_ARCH}
	../../WebRtc3/WebRtc3/HarmonyNDK/${OHOS_ARCH}
	../../SpeexWebRtcAec/SpeexWebRtcAec/HarmonyNDK/${OHOS_ARCH}
	../../RNNoise/RNNoise/HarmonyNDK/${OHOS_ARCH}
	../../Speex/Speex/HarmonyNDK/${OHOS_ARCH}
	../../SrcResampler/SrcResampler/HarmonyNDK/${OHOS_ARCH}
	../../OpenH264/OpenH264/HarmonyNDK/${OHOS_ARCH}
	../../SystemH264/SystemH264/HarmonyNDK/${OHOS_ARCH}
	../../Ajb/Ajb/HarmonyNDK/${OHOS_ARCH}
	../../LibYUV/LibYUV/HarmonyNDK/${OHOS_ARCH}
	../../MediaFile/MediaFile/HarmonyNDK/${OHOS_ARCH}
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
if( OHOS_ARCH STREQUAL "x86_64" )
	set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__NAME_${PROJECT_NAME_UPPER}__ -D__HARMONY_NDK__ -D__X64__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__" )
	set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}" )
	set( CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS}" )
elseif( OHOS_ARCH STREQUAL "arm64-v8a" )
	set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__NAME_${PROJECT_NAME_UPPER}__ -D__HARMONY_NDK__ -D__ARMA64__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__" )
	set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}" )
	set( CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS}" )
endif()
set( CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_CXX_FLAGS}" )
set( CMAKE_ASM_NASM_FLAGS "${CMAKE_ASM_FLAGS} ${CMAKE_ASM_NASM_FLAGS}" )
set( CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-O1 -Wl,-gc-sections -Wl,--hash-style=sysv -Wl,--as-needed" )

add_library( ${PROJECT_NAME} SHARED
	../Source/UniverseFastestLibrary-HarmonyNDK/UniverseFastestLibraryNapiModuleRegister.cpp
	../Source/UniverseFastestLibrary/UniverseFastestLibrary.cpp
	)
if( OHOS_ARCH STREQUAL "x86_64" )
	target_sources( ${PROJECT_NAME} PRIVATE
		../Source/UniverseFastestLibrary/MemCpy_HarmonyNDK_x64.s
		../Source/UniverseFastestLibrary/MutexLock_HarmonyNDK_x64.s
		)
elseif( OHOS_ARCH STREQUAL "arm64-v8a" )
	target_sources( ${PROJECT_NAME} PRIVATE
		../Source/UniverseFastestLibrary/MutexLock_HarmonyNDK_ArmA64.s
		../Source/UniverseFastestLibrary/MemCpy_HarmonyNDK_ArmA64.s
		)
endif()

target_link_libraries( ${PROJECT_NAME} PUBLIC
	libace_napi.z.so
	libhilog_ndk.z.so
	libace_ndk.z.so
	libnative_window.so
	#libFunc.so
	)
