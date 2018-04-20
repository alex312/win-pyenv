::=========================================================
:: TODO: 停用当前启用的虚拟环境 Test.
:: 使用方法:
::     pyenv deactivate [options]
:: 操作:
::     --help               打印帮助
::=========================================================
@echo off

:: TODO: 解析参数 Test.
if "%1"=="--help" goto help

:: TODO: 停用虚拟环境 Test.
set VENV_PATH=

:: TODO: 还原PROMPT，清除old_prompt Test.
if defined old_prompt set "PROMPT=%old_prompt%" && set old_prompt=
REM Don't use () to avoid problems with them in %PATH%
REM if not defined old_prompt goto endifvprompt
REM     set "PROMPT=%old_prompt%"
REM     set old_prompt=
REM :endifvprompt

:: TODO: 还原PYTHONHOME，清除old_pythonhome Test.
if defined old_pythonhome set "PYTHONHOME=%old_pythonhome%" && set old_pythonhome=
REM if not defined old_pythonhome goto endifvhome
REM     set "PYTHONHOME=%old_pythonhome%"
REM     set old_pythonhome=
REM :endifvhome

:: TODO: 还原PATH，清除old_path Test.
if defined old_path set "PATH=%old_path%" && set old_path=
REM if not defined old_path goto endifvpath
REM     set "PATH=%old_path%"
REM     set old_path=
REM :endifvpath
goto:eof

:: TODO: 打印帮助 Test.
:help
%BINARY_PATH%\pyenv-help deactivate