for /f "tokens=*" %%i in ('type %~dp0\d当前项目名称.txt') do set ProjectName=%%i

::链接头文件
call :MakeFileLink %~dp0\%ProjectName%\UniverseFastestLibrary.h ..\Source\%ProjectName%\UniverseFastestLibrary.h
call :MakeFileLink %~dp0\%ProjectName%\MemCpy.h ..\Source\%ProjectName%\MemCpy.h
call :MakeFileLink %~dp0\%ProjectName%\MutexLock.h ..\Source\%ProjectName%\MutexLock.h

::链接Keil的库文件
mkdir %~dp0\%ProjectName%\Keil
call :MakeDirLink %~dp0\%ProjectName%\Keil\ArmAt32 ..\..\%ProjectName%-Keil\%ProjectName%_KeilArmC_ArmAt32_Release_LNKLIB_LIB\Objects
call :MakeDirLink %~dp0\%ProjectName%\Keil\ArmA64 ..\..\%ProjectName%-Keil\%ProjectName%_KeilArmC_ArmA64_Release_LNKLIB_LIB\Objects

::复制库文件到各个项目
::set SrcDir=%~dp0\%ProjectName%\AndroidNDK\*
::set DestDir=%~dp0\..\AndrdTest\app\src\main\jniLibs
::xcopy /E /Y /C %SrcDir% %DestDir%

::set SrcDir=%~dp0\%ProjectName%\AndroidNDK\*
::set DestDir=%~dp0\..\AndrdAdoVdoSftkDemo\app\src\main\jniLibs
::xcopy /E /Y /C %SrcDir% %DestDir%

::set SrcDir=%~dp0\%ProjectName%\AndroidNDK\*
::set DestDir=%~dp0\..\AndrdAdoVdoTkbkDemo\app\src\main\jniLibs
::xcopy /E /Y /C %SrcDir% %DestDir%

::set SrcDir=%~dp0\%ProjectName%\HarmonyNDK\*
::set DestDir=%~dp0\..\HarmonyTest\entry\libs
::xcopy /E /Y /C %SrcDir% %DestDir%

exit /b

:MakeFileLink
@echo off
fsutil reparsepoint query %1 >nul
if %errorlevel% equ 0 ( echo %1已是文件链接 & echo on & exit /b )
del %1
echo on
mklink %1 %2
exit /b

:MakeDirLink
@echo off
fsutil reparsepoint query %1 >nul
if %errorlevel% equ 0 ( echo %1已是文件夹链接 & echo on & exit /b )
rd /q %1
echo on
mklink /D %1 %2
exit /b
