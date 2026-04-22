for /f "tokens=*" %%i in ('type %~dp0\..\d当前项目名称.txt') do set ProjectName=%%i
for /f "tokens=*" %%i in ('type %~dp0\..\d当前项目类型.txt') do set ProjectType=%%i

set CMakePath=D:\Software\Android_SDK\cmake\3.22.1\bin
set AndroidNdkPath=D:\Software\Android_SDK\ndk\28.1.13356709

call :BuildLib x86
if %errorlevel% neq 0 ( exit /b -1 )

call :BuildLib x86_64
if %errorlevel% neq 0 ( exit /b -1 )

call :BuildLib armeabi-v7a
if %errorlevel% neq 0 ( exit /b -1 )

call :BuildLib arm64-v8a
if %errorlevel% neq 0 ( exit /b -1 )

exit /b

:BuildLib
%CMakePath%\cmake.exe -G "Ninja" -DCMAKE_MAKE_PROGRAM=%CMakePath%\ninja.exe -DCMAKE_TOOLCHAIN_FILE=%AndroidNdkPath%\build\cmake\android.toolchain.cmake -DCMAKE_VERBOSE_MAKEFILE=ON -DANDROID_ABI=%1 -DANDROID_PLATFORM=android-14 -DANDROID_STL=c++_shared -B %1
if %errorlevel% neq 0 ( exit /b -1 )
%CMakePath%\cmake.exe --build %1
if %errorlevel% neq 0 ( exit /b -1 )
exit /b
