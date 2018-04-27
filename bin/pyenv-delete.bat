::=========================================================
:: TODO: 删除虚拟环境 Test.
:: 使用方法:
::      pyenv delete <venv_name>
:: 参数:
::      venv_name           要删除的虚拟环境的名称
:: 操作:
::      --help              打印帮助
::=========================================================

@echo off

set venv_name=
set venv_path=
:: TODO: 解析参数 Test.
if "%1"=="" goto help
if "%1"=="--help" goto help
set venv_name=%1

:: TODO: 检查venv_name虚拟环境目录是否存在。如果存在；删除，不存在，退出 Test.
set venv_path=%VENV_ROOT%\%venv_name%

setlocal ENABLEDELAYEDEXPANSION
if exist %venv_path% (
    choice /C YN /M "需要删除目录%venv_path%？这可能造成不可逆的影响。确认请按 Y，否请按 N。"
    if !ERRORLEVEL!==1 (rd /s /q %venv_path%)
    if !ERRORLEVEL!==2 goto:eof
)
endlocal ENABLEDELAYEDEXPANSION
goto:eof

:help
%BINARY_PATH%\pyenv-help delete