# the minimum version of CMake.
cmake_minimum_required( VERSION 3.10.0 )
project( UniverseFastestLibrary )
string( TOUPPER "${PROJECT_NAME}" PROJECT_NAME_UPPER )
include( ProcessorCount )
ProcessorCount( NUM_CPU_CORES )

set( CMAKE_C_COMPILER "clang" )
set( CMAKE_CXX_COMPILER "clang++" )
set( CMAKE_ASM_COMPILER "clang" )
enable_language( ASM )

set( CMAKE_RUNTIME_OUTPUT_DIRECTORY ../../${PROJECT_NAME} )
set( CMAKE_LIBRARY_OUTPUT_DIRECTORY ../../${PROJECT_NAME} )
set( CMAKE_ARCHIVE_OUTPUT_DIRECTORY ../../${PROJECT_NAME} )

link_directories(
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

set( CMAKE_C_FLAGS "" )
set( CMAKE_ASM_FLAGS "" )
if( DEFINED __CYGWIN_GCC__ )
	set( CMAKE_C_FLAGS "-D__CYGWIN__ -DUNICODE ${CMAKE_C_FLAGS} -D__NAME_${PROJECT_NAME_UPPER}__ -D__CYGWIN_GCC__" )
elseif( DEFINED __LINUX_GCC__ )
	set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__NAME_${PROJECT_NAME_UPPER}__ -D__LINUX_GCC__" )
endif()
if( DEFINED __X64__ )
	set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__X64__" )
	set( CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS}" )
endif()
if( DEFINED __DEBUG__ ) #Cygwin和Linux下，gcc用O2或O3会导致_StrU16CpyU8函数运算错误，clang用lto会导致编译Func.cpp.o中间文件格式错误。
	#set( CMAKE_C_FLAGS "-fPIC -fvisibility=hidden -finput-charset=UTF-8 -fexec-charset=UTF-8 -Wall -Wpedantic -Wshadow -Winline -Wunreachable-code -flto=${NUM_CPU_CORES} -O0 -g2 ${CMAKE_C_FLAGS} -D__DEBUG__" )
	set( CMAKE_C_FLAGS "-fPIC -fvisibility=hidden -finput-charset=UTF-8 -fexec-charset=UTF-8 -Wall -Wpedantic -Wshadow -Winline -Wunreachable-code -O0 -g2 ${CMAKE_C_FLAGS} -D__DEBUG__" )
elseif( DEFINED __RELEASE__ )
	#set( CMAKE_C_FLAGS "-fPIC -fvisibility=hidden -finput-charset=UTF-8 -fexec-charset=UTF-8 -Wall -Wpedantic -Wshadow -Winline -Wunreachable-code -flto=${NUM_CPU_CORES} -O1 -pipe ${CMAKE_C_FLAGS} -D__RELEASE__" )
	set( CMAKE_C_FLAGS "-fPIC -fvisibility=hidden -finput-charset=UTF-8 -fexec-charset=UTF-8 -Wall -Wpedantic -Wshadow -Winline -Wunreachable-code -O3 -ffast-math -pipe ${CMAKE_C_FLAGS} -D__RELEASE__" )
endif()
if( DEFINED __LNKLIB__ )
	set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__LNKLIB__" )
elseif( DEFINED __LNKDLL__ )
	set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__LNKDLL__" )
endif()
if( DEFINED __COMLIB__ )
	set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__COMLIB__" )
elseif( DEFINED __COMDLL__ )
	set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__COMDLL__" )
elseif( DEFINED __COMEXE__ )
	set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__COMEXE__" )
endif()
set( CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_CXX_FLAGS} -frtti -std=gnu++17" )
set( CMAKE_ASM_NASM_FLAGS "${CMAKE_ASM_FLAGS} ${CMAKE_ASM_NASM_FLAGS}" )
set( CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-O1 -Wl,-gc-sections -Wl,-hash-style=gnu -Wl,--as-needed" ) #用lld会导致Test可执行文件段错误。
set( CMAKE_EXE_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS}" )

if( DEFINED __COMLIB__ )
	add_library( ${PROJECT_NAME} STATIC )
	set_target_properties( ${PROJECT_NAME} PROPERTIES
		PREFIX "lib"
		SUFFIX "_${PROJECT_LIB_SUFFIX}"
	)
elseif( DEFINED __COMDLL__ )
	add_library( ${PROJECT_NAME} SHARED )
	set_target_properties( ${PROJECT_NAME} PROPERTIES
		PREFIX "lib"
		SUFFIX "_${PROJECT_LIB_SUFFIX}"
	)
elseif( DEFINED __COMEXE__ )
	add_executable( ${PROJECT_NAME} )
	set_target_properties( ${PROJECT_NAME} PROPERTIES
		PREFIX ""
		SUFFIX "_${PROJECT_EXE_SUFFIX}"
		)
endif()

target_sources( ${PROJECT_NAME} PRIVATE
	../Source/UniverseFastestLibrary/UniverseFastestLibrary.cpp
	)
if( DEFINED __CYGWIN_GCC__ )
	target_sources( ${PROJECT_NAME} PRIVATE
		../Source/UniverseFastestLibrary/MemCpy_CygwinGCC_x64.s
		../Source/UniverseFastestLibrary/MutexLock_CygwinGCC_x64.s
		)
elseif( DEFINED __LINUX_GCC__ )
	target_sources( ${PROJECT_NAME} PRIVATE
		../Source/UniverseFastestLibrary/MemCpy_LinuxGCC_x64.s
		../Source/UniverseFastestLibrary/MutexLock_LinuxGCC_x64.s
		)
endif()

target_link_libraries( ${PROJECT_NAME} PUBLIC
	#libFunc_${PROJECT_LIB_SUFFIX}
	)
if( DEFINED __CYGWIN_GCC__ )
	target_link_libraries( ${PROJECT_NAME} PUBLIC
		libgdi32.a
		libwinmm.a
		libole32.a
		)
elseif( DEFINED __LINUX_GCC__ )
	target_link_libraries( ${PROJECT_NAME} PUBLIC
		)
endif()
