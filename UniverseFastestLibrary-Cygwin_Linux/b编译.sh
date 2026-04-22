#!/bin/bash
set -x

ProjectName=`cat ../d当前项目名称.txt`
ProjectType=`cat ../d当前项目类型.txt`

if [[ $ProjectType == lib ]]
then
	BuildLib()
	{
		cmake -G "Ninja" -DCMAKE_VERBOSE_MAKEFILE=ON $1 -DPROJECT_LIB_SUFFIX=$2 -DPROJECT_EXE_SUFFIX=$3 -B $2
		if [ $? -ne 0 ]; then return -1; fi
		cmake --build $2
		if [ $? -ne 0 ]; then return -1; fi
		return 0;
	}

	if [[ $OSTYPE == *cygwin* ]]
	then
		BuildLib "-D__CYGWIN_GCC__= -D__X64__= -D__DEBUG__= -D__LNKLIB__= -D__COMLIB__=" "CygwinGCC_x64_Debug_LNKLIB_LIB.a" "CygwinGCC_x64_Debug_LNKLIB_EXE.exe"
		if [ $? -ne 0 ]; then exit -1; fi
		
		BuildLib "-D__CYGWIN_GCC__= -D__X64__= -D__RELEASE__= -D__LNKLIB__= -D__COMLIB__=" "CygwinGCC_x64_Release_LNKLIB_LIB.a" "CygwinGCC_x64_Release_LNKLIB_EXE.exe"
		if [ $? -ne 0 ]; then exit -1; fi
		
		BuildLib "-D__CYGWIN_GCC__= -D__X64__= -D__DEBUG__= -D__LNKDLL__= -D__COMDLL__=" "CygwinGCC_x64_Debug_LNKDLL_DLL.dll" "CygwinGCC_x64_Debug_LNKDLL_EXE.exe"
		if [ $? -ne 0 ]; then exit -1; fi
		
		BuildLib "-D__CYGWIN_GCC__= -D__X64__= -D__RELEASE__= -D__LNKDLL__= -D__COMDLL__=" "CygwinGCC_x64_Release_LNKDLL_DLL.dll" "CygwinGCC_x64_Release_LNKDLL_EXE.exe"
		if [ $? -ne 0 ]; then exit -1; fi
	else
		BuildLib "-D__LINUX_GCC__= -D__X64__= -D__DEBUG__= -D__LNKLIB__= -D__COMLIB__=" "LinuxGCC_x64_Debug_LNKLIB_LIB.a" "LinuxGCC_x64_Debug_LNKLIB_EXE.exe"
		if [ $? -ne 0 ]; then exit -1; fi
		
		BuildLib "-D__LINUX_GCC__= -D__X64__= -D__RELEASE__= -D__LNKLIB__= -D__COMLIB__=" "LinuxGCC_x64_Release_LNKLIB_LIB.a" "LinuxGCC_x64_Release_LNKLIB_EXE.exe"
		if [ $? -ne 0 ]; then exit -1; fi
		
		BuildLib "-D__LINUX_GCC__= -D__X64__= -D__DEBUG__= -D__LNKDLL__= -D__COMDLL__=" "LinuxGCC_x64_Debug_LNKDLL_DLL.so" "LinuxGCC_x64_Debug_LNKDLL_EXE.exe"
		if [ $? -ne 0 ]; then exit -1; fi
		
		BuildLib "-D__LINUX_GCC__= -D__X64__= -D__RELEASE__= -D__LNKDLL__= -D__COMDLL__=" "LinuxGCC_x64_Release_LNKDLL_DLL.so" "LinuxGCC_x64_Release_LNKDLL_EXE.exe"
		if [ $? -ne 0 ]; then exit -1; fi
	fi
elif [[ $ProjectType == exe ]]
then
	BuildExe()
	{
		cmake -G "Ninja" -DCMAKE_VERBOSE_MAKEFILE=ON $1 -DPROJECT_LIB_SUFFIX=$2 -DPROJECT_EXE_SUFFIX=$3 -B $3
		if [ $? -ne 0 ]; then return -1; fi
		cmake --build $3
		if [ $? -ne 0 ]; then return -1; fi
		return 0;
	}

	if [[ $OSTYPE == *cygwin* ]]
	then
		BuildExe "-D__CYGWIN_GCC__= -D__X64__= -D__DEBUG__= -D__LNKLIB__= -D__COMEXE__=" "CygwinGCC_x64_Debug_LNKLIB_LIB.a" "CygwinGCC_x64_Debug_LNKLIB_EXE.exe"
		if [ $? -ne 0 ]; then exit -1; fi
		
		BuildExe "-D__CYGWIN_GCC__= -D__X64__= -D__RELEASE__= -D__LNKLIB__= -D__COMEXE__=" "CygwinGCC_x64_Release_LNKLIB_LIB.a" "CygwinGCC_x64_Release_LNKLIB_EXE.exe"
		if [ $? -ne 0 ]; then exit -1; fi
		
		BuildExe "-D__CYGWIN_GCC__= -D__X64__= -D__DEBUG__= -D__LNKDLL__= -D__COMEXE__=" "CygwinGCC_x64_Debug_LNKDLL_DLL.dll" "CygwinGCC_x64_Debug_LNKDLL_EXE.exe"
		if [ $? -ne 0 ]; then exit -1; fi
		
		BuildExe "-D__CYGWIN_GCC__= -D__X64__= -D__RELEASE__= -D__LNKDLL__= -D__COMEXE__=" "CygwinGCC_x64_Release_LNKDLL_DLL.dll" "CygwinGCC_x64_Release_LNKDLL_EXE.exe"
		if [ $? -ne 0 ]; then exit -1; fi
	else
		BuildExe "-D__LINUX_GCC__= -D__X64__= -D__DEBUG__= -D__LNKLIB__= -D__COMEXE__=" "LinuxGCC_x64_Debug_LNKLIB_LIB.a" "LinuxGCC_x64_Debug_LNKLIB_EXE.exe"
		if [ $? -ne 0 ]; then exit -1; fi
		
		BuildExe "-D__LINUX_GCC__= -D__X64__= -D__RELEASE__= -D__LNKLIB__= -D__COMEXE__=" "LinuxGCC_x64_Release_LNKLIB_LIB.a" "LinuxGCC_x64_Release_LNKLIB_EXE.exe"
		if [ $? -ne 0 ]; then exit -1; fi
		
		BuildExe "-D__LINUX_GCC__= -D__X64__= -D__DEBUG__= -D__LNKDLL__= -D__COMEXE__=" "LinuxGCC_x64_Debug_LNKDLL_DLL.so" "LinuxGCC_x64_Debug_LNKDLL_EXE.exe"
		if [ $? -ne 0 ]; then exit -1; fi
		
		BuildExe "-D__LINUX_GCC__= -D__X64__= -D__RELEASE__= -D__LNKDLL__= -D__COMEXE__=" "LinuxGCC_x64_Release_LNKDLL_DLL.so" "LinuxGCC_x64_Release_LNKDLL_EXE.exe"
		if [ $? -ne 0 ]; then exit -1; fi
	fi
fi
