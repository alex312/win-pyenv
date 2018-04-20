:: TODO: 初始化虚拟环境根目录 Test.
:: TODO: 创建虚拟环境 Test.
:: TODO: 删除虚拟环境 Test.
:: TODO: 枚举系统python版本以及虚拟环境名称 Test.
:: TODO: 设置工作目录的的虚拟环境 Test.
:: TODO: 启用虚拟环境 Test.
:: TODO: 关闭虚拟环境 Test.
:: =================================================

@echo off

if not defined PYENV_HOME set PYENV_HOME=%~dp0..

set UTILITS_PATH=%PYENV_HOME%\utilits

call %UTILITS_PATH%\normalize_path.bat %PYENV_HOME%, PYENV_HOME

set BINARY_PATH=%PYENV_HOME%\bin

:: 1. TODO: 判断子命令是否正确，如果不正确，打印help Closed.
if "%1"=="" goto help

echo %1 | findstr "^--help\> ^help" 2>&1 >nul && goto help

for /f "usebackq tokens=2*" %%i in ('echo %*') do set params=%%j 

set commands=
for /f "tokens=* delims= " %%a in ('%BINARY_PATH%\pyenv-commands') do set commands=%%a

:: TODO: 只通过管道传入findstr命令中，不要显示commands的值. Closed.
echo %commands% | findstr "\<%1\>" >nul || goto help

:: help 和 commands 命令不需要初始化环境，直接执行。
echo help commands | findstr "\<%1\>" >nul && goto route_commands

:: 2.   TODO: 加载环境，并路由命令 Test.
:: 2.1  TODO: 获取pyenv的根目录,并加载配置 Test.
::          pyenv目录结构如下：
::          PYENV_HOME
::          |---\bin         存放pyenv执行脚本
::          |---\versions    存放虚拟环境。该路径可以在base.properties中通过venv_root设置
::          |---\config      存放配置文件
::          |------|---base.properties     基本环境配置
::          |---\utilits     存放作为工具使用的批处理文件，这些为bin中的批处理提供服务
:init_config
call %UTILITS_PATH%\normalize_path.bat %PYENV_HOME%\config, PYENV_CONFIG_PATH

set VENV_ROOT=
call %UTILITS_PATH%\config_get base,venv_root,VENV_root
call %UTILITS_PATH%\stript %VENV_ROOT%,VENV_root

if not defined VENV_ROOT if not "%1"=="init" (
    echo 虚拟环境管理目录还没有初始化 
    echo 使用 pyenv init 完成初始化。详情查看pyenv init --help
    goto :eof
)

echo %VENV_ROOT% | findstr "^[a-z]:\\ ^[A-Z]:\\" >nul || (
    call %UTILITS_PATH%\normalize_path.bat %PYENV_HOME%\%VENV_ROOT%, VENV_ROOT
)

:: 2.3  TODO: 调用子命令 Test.
:route_commands
"%BINARY_PATH%\\pyenv-%1" %params%
goto :eof

:: 3.   TODO: 命令帮助 Test.
:: 3.1  TODO: 帮助部分移动到pyenv-help中 Closed.
:help
%BINARY_PATH%\pyenv-help