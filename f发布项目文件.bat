set Name=UniverseFastestLibrary

::不要清理中间文件，否则编译器会认为要重新编译。

::链接头文件
set SrcDir=%~dp0\Source\%Name%\UniverseFastestLibrary.h
set DestDir=%~dp0\%Name%\UniverseFastestLibrary.h
mklink /H %DestDir% %SrcDir%

set SrcDir=%~dp0\Source\%Name%\MemCpy.h
set DestDir=%~dp0\%Name%\MemCpy.h
mklink /H %DestDir% %SrcDir%

set SrcDir=%~dp0\Source\%Name%\MutexLock.h
set DestDir=%~dp0\%Name%\MutexLock.h
mklink /H %DestDir% %SrcDir%

::链接NDK的库文件
mklink /J %~dp0\%Name%\NDK-libs %~dp0\%Name%-NDK\libs

::链接库文件到各个项目
::set SrcDir=%~dp0\%Name%\NDK-libs\*
::set DestDir=%~dp0\..\AndrdTest\app\src\main\jniLibs
::xcopy /E /Y /C %SrcDir% %DestDir%

::set SrcDir=%~dp0\%Name%\NDK-libs\*
::set DestDir=%~dp0\..\AndrdAdoVdoSftkDemo\app\src\main\jniLibs
::xcopy /E /Y /C %SrcDir% %DestDir%

::set SrcDir=%~dp0\%Name%\NDK-libs\*
::set DestDir=%~dp0\..\AndrdAdoVdoTkbkDemo\app\src\main\jniLibs
::xcopy /E /Y /C %SrcDir% %DestDir%