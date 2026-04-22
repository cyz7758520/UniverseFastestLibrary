for /f "tokens=*" %%i in ('type %~dp0\..\d当前项目名称.txt') do set ProjectName=%%i
for /f "tokens=*" %%i in ('type %~dp0\..\d当前项目类型.txt') do set ProjectType=%%i

::这个.vs文件夹不要删，删了会重置编译器的启动项目和打开的文件，只要删除AutoPCH子文件夹就可以了。
::rmdir /S /Q "%~dp0\.vs"
for /f "tokens=*" %%i in ('dir /b /s %~dp0\.vs\AutoPCH') do call %~dp0\..\q清空文件夹.bat %%i

if %ProjectType% == lib (
	call :ClearLib MSVC++_x86_Debug_LNKLIB_LIB Win32
	call :ClearLib MSVC++_x86_Release_LNKLIB_LIB Win32
	call :ClearLib MSVC++_x86_Debug_LNKDLL_DLL Win32
	call :ClearLib MSVC++_x86_Release_LNKDLL_DLL Win32
	call :ClearLib MSVC++_x64_Debug_LNKLIB_LIB x64
	call :ClearLib MSVC++_x64_Release_LNKLIB_LIB x64
	call :ClearLib MSVC++_x64_Debug_LNKDLL_DLL x64
	call :ClearLib MSVC++_x64_Release_LNKDLL_DLL x64

	exit /b

	:ClearLib
	call %~dp0\..\q清空文件夹.bat "%~dp0\%ProjectName%_%1\%2"
	del /S /Q "%~dp0\..\%ProjectName%\%ProjectName%_%1.*"
	exit /b
) else if %ProjectType% == exe (
	call :ClearExe MSVC++_x86_Debug_LNKLIB_EXE Win32
	call :ClearExe MSVC++_x86_Release_LNKLIB_EXE Win32
	call :ClearExe MSVC++_x86_Debug_LNKDLL_EXE Win32
	call :ClearExe MSVC++_x86_Release_LNKDLL_EXE Win32
	call :ClearExe MSVC++_x64_Debug_LNKLIB_EXE x64
	call :ClearExe MSVC++_x64_Release_LNKLIB_EXE x64
	call :ClearExe MSVC++_x64_Debug_LNKDLL_EXE x64
	call :ClearExe MSVC++_x64_Release_LNKDLL_EXE x64

	exit /b

	:ClearExe
	call %~dp0\..\q清空文件夹.bat "%~dp0\%ProjectName%_%1\%2"
	del /S /Q "%~dp0\..\%ProjectName%\%ProjectName%_%1.*"
	exit /b
)
