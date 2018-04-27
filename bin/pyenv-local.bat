::=========================================================
:: TODO: 设置工作目录的虚拟环境 Test.
:: 使用方法:
::      pyenv local [options] <work_dir_path> <venv_name>
:: 参数:
::      work_dir_path             工作目录的路径。若该参数省略，默认为%cd%
::                                这里的工作目录是一个python项目的根目录。
::      venv_name                 这个参数是必须的，用于指定设置的虚拟环境名称.
:: 操作:
::      --help                    打印帮助
::=========================================================
@echo off

:: TODO: 解析参数 Test.
if "%1"=="" goto help
if "%1"=="--help" goto help
set work_dir_path=%1
set venv_name=%2

:: 如果没有设置work_dir_path参数
if not defined venv_name (
    set work_dir_path=%cd%
    set venv_name=%1
)

call %UTILITS_PATH%\normalize_path %work_dir_path% work_dir_path

:: TODO: 检查工作目录路径是否存在。如果不存在，提示并推出 Test.
if not exist %work_dir_path% (
    echo 工作目录不存在。
    goto:eof
)

:: TODO: 检查虚拟环境名称是否存在。如果不存在，提示创建方法，并退出 Test.
set venv_path=%VENV_ROOT%\%venv_name%
if not exist %venv_path% (
    echo 找不到虚拟环境%venv_name%
    echo 您可以使用pyenv create命令创建，使用pyenv create --help 查看详情
    goto:eof
)

:: TODO: 在工作目录中创建python_version文件记录虚拟环境名称 Test.
echo work_dir_path: %work_dir_path%
echo venv_name: %venv_name%

echo %venv_name% >%work_dir_path%\.python-version
goto:eof

:: TODO: 打印帮助 Test.
:help
%BINARY_PATH%\pyenv-help local