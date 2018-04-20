::=========================================================
:: TODO: 枚举系统python版本以及虚拟环境名称 Test.
:: 使用方法:
::      pyenv list [option]
:: 操作
::      --all           默认，枚举所有系统python版本和已经安装
::                      的虚拟环境
::      --system        枚举系统中安装的python版本,不能与--all
::                      和--envs同时设置
::      --envs          枚枚举已经安装的虚拟环境,不能与--all和
::                      --system同时设置
::      --help          打印帮助
::=========================================================

@echo off

:: TODO: 分析参数 Test.
:parse_params
set params=--all,--system,--envs,--help

if "%1"=="--help" goto help
set list_type=
echo %params% | findstr "\<%1\>" >nul 2>&1 && set list_type=%1

if defined list_type set "list_type=%list_type:--=%"


:: TODO: 获取列表 Test.
if "%list_type%"=="envs" goto show_env
echo;
for /f "tokens=1,2 delims==" %%i in ('call %UTILITS_PATH%\versions_get system') do ( echo %%i^(system^) )

:show_env
if "%list_type%"=="system" goto:eof
echo;
for /f "tokens=1,2 delims==" %%i in ('call %UTILITS_PATH%\versions_get system') do ( echo %%i )

goto:eof

:: TODO: 打印帮助 Test.
:help
%BINARY_PATH%\pyenv-help list