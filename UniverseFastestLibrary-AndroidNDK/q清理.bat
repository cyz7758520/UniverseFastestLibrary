for /f "tokens=*" %%i in ('type %~dp0\..\d当前项目名称.txt') do set ProjectName=%%i
for /f "tokens=*" %%i in ('type %~dp0\..\d当前项目类型.txt') do set ProjectType=%%i

call :ClearLib x86
call :ClearLib x86_64
call :ClearLib armeabi-v7a
call :ClearLib arm64-v8a

exit /b

:ClearLib
call %~dp0\..\q清空文件夹.bat "%~dp0\%1"
call %~dp0\..\q清空文件夹.bat "%~dp0\..\%ProjectName%\AndroidNDK\%1"
exit /b
