#!/bin/bash
set -x

ProjectName=`cat ../d当前项目名称.txt`
ProjectType=`cat ../d当前项目类型.txt`

if [[ $ProjectType == lib ]]
then
	ClearLib()
	{
		rm -rfv ./$1/*
		rm -rfv ./$1/.*
		rm -fv ../$ProjectName/lib${ProjectName}_$1
	}

	if [[ $OSTYPE == *cygwin* ]]
	then
		ClearLib CygwinGCC_x64_Debug_LNKLIB_LIB.a
		ClearLib CygwinGCC_x64_Release_LNKLIB_LIB.a
		ClearLib CygwinGCC_x64_Debug_LNKDLL_DLL.dll
		ClearLib CygwinGCC_x64_Release_LNKDLL_DLL.dll
	else
		ClearLib LinuxGCC_x64_Debug_LNKLIB_LIB.a
		ClearLib LinuxGCC_x64_Release_LNKLIB_LIB.a
		ClearLib LinuxGCC_x64_Debug_LNKDLL_DLL.so
		ClearLib LinuxGCC_x64_Release_LNKDLL_DLL.so
	fi
elif [[ $ProjectType == exe ]]
then
	ClearExe()
	{
		rm -rfv ./$1/*
		rm -rfv ./$1/.*
		rm -fv ../$ProjectName/${ProjectName}_$1
	}

	if [[ $OSTYPE == *cygwin* ]]
	then
		ClearExe CygwinGCC_x64_Debug_LNKLIB_EXE.exe
		ClearExe CygwinGCC_x64_Release_LNKLIB_EXE.exe
		ClearExe CygwinGCC_x64_Debug_LNKDLL_EXE.exe
		ClearExe CygwinGCC_x64_Release_LNKDLL_EXE.exe
	else
		ClearExe LinuxGCC_x64_Debug_LNKLIB_EXE.exe
		ClearExe LinuxGCC_x64_Release_LNKLIB_EXE.exe
		ClearExe LinuxGCC_x64_Debug_LNKDLL_EXE.exe
		ClearExe LinuxGCC_x64_Release_LNKDLL_EXE.exe
	fi
fi
