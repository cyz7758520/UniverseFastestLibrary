@if "%1"=="" (
    echo 错误：未提供文件夹参数！
    exit /b -1
)
del /S /Q %1
for /d %%d in (%1\*) do ( rmdir /s /q "%%d" )