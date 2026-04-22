for /f "tokens=*" %%i in ('type %~dp0\..\d当前项目名称.txt') do set ProjectName=%%i

call %ProjectName%-Visual_Studio\q清理.bat
call %ProjectName%-Cygwin_Linux\q清理.bat
call %ProjectName%-AndroidNDK\q清理.bat
call %ProjectName%-HarmonyNDK\q清理.bat
call %ProjectName%-Keil\q清理.bat
