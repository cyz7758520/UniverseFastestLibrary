for /f "tokens=*" %%i in ('type %~dp0\..\d当前项目名称.txt') do set ProjectName=%%i
for /f "tokens=*" %%i in ('type %~dp0\..\d当前项目类型.txt') do set ProjectType=%%i

if %ProjectType% == lib (
	call :ClearLib CygwinGCC_x64_Debug_LNKLIB_LIB.a
	call :ClearLib CygwinGCC_x64_Release_LNKLIB_LIB.a
	call :ClearLib CygwinGCC_x64_Debug_LNKDLL_DLL.dll
	call :ClearLib CygwinGCC_x64_Release_LNKDLL_DLL.dll
	call :ClearLib LinuxGCC_x64_Debug_LNKLIB_LIB.a
	call :ClearLib LinuxGCC_x64_Release_LNKLIB_LIB.a
	call :ClearLib LinuxGCC_x64_Debug_LNKDLL_DLL.so
	call :ClearLib LinuxGCC_x64_Release_LNKDLL_DLL.so

	exit /b

	:ClearLib
	call %~dp0\..\q清空文件夹.bat "%~dp0\%1"
	del /S /Q "%~dp0\..\%ProjectName%\lib%ProjectName%_%1"
	exit /b
) else if %ProjectType% == exe (
	call :ClearExe CygwinGCC_x64_Debug_LNKLIB_EXE.exe
	call :ClearExe CygwinGCC_x64_Release_LNKLIB_EXE.exe
	call :ClearExe CygwinGCC_x64_Debug_LNKDLL_EXE.exe
	call :ClearExe CygwinGCC_x64_Release_LNKDLL_EXE.exe
	call :ClearExe LinuxGCC_x64_Debug_LNKLIB_EXE.exe
	call :ClearExe LinuxGCC_x64_Release_LNKLIB_EXE.exe
	call :ClearExe LinuxGCC_x64_Debug_LNKDLL_EXE.exe
	call :ClearExe LinuxGCC_x64_Release_LNKDLL_EXE.exe

	exit /b

	:ClearExe
	call %~dp0\..\q清空文件夹.bat "%~dp0\%1"
	del /S /Q "%~dp0\..\%ProjectName%\%ProjectName%_%1"
	exit /b
)
