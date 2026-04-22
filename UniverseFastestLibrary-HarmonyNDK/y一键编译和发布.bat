cls
call b编译.bat
if %errorlevel% neq 0 ( exit /b -1 )
call ..\f发布项目文件.bat
if %errorlevel% neq 0 ( exit /b -1 )