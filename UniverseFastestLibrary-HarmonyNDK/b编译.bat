for /f "tokens=*" %%i in ('type %~dp0\..\d当前项目名称.txt') do set ProjectName=%%i
for /f "tokens=*" %%i in ('type %~dp0\..\d当前项目类型.txt') do set ProjectType=%%i

::set OpenHarmonyNdkPath=D:\Software\DevEco_Studio\sdk\default\openharmony\native
set OpenHarmonyNdkPath=D:\Software\DevEco_Studio\sdk\default\hms\12\native

call :BuildLib x86_64
if %errorlevel% neq 0 ( exit /b -1 )

call :BuildLib arm64-v8a
if %errorlevel% neq 0 ( exit /b -1 )

exit /b

:BuildLib
%OpenHarmonyNdkPath%\build-tools\cmake\bin\cmake.exe -G "Ninja" -DCMAKE_MAKE_PROGRAM=%OpenHarmonyNdkPath%\build-tools\cmake\bin\ninja.exe -DCMAKE_TOOLCHAIN_FILE=%OpenHarmonyNdkPath%\build\cmake\ohos.toolchain.cmake -DCMAKE_VERBOSE_MAKEFILE=ON -DOHOS_ARCH=%1 -DOHOS_PLATFORM=OHOS -DOHOS_STL=c++_shared -B %1
if %errorlevel% neq 0 ( exit /b -1 )
%OpenHarmonyNdkPath%\build-tools\cmake\bin\cmake.exe --build %1
if %errorlevel% neq 0 ( exit /b -1 )
exit /b
