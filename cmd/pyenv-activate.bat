::=========================================================
:: TODO: 启用虚拟环境 Test.
:: 使用方法:
::    pyenv activate [options]
:: 操作
::    --help              打印帮助
::=========================================================
@echo off

:: TODO: 解析参数 Test.
if "%1"=="--help" goto help

:: TODO: 获取当前工作目录的虚拟环境设置 Test.
::       从当前路径%cd%开始向上遍历，查找python-version文件
::       如果找到文件，获取虚拟环境名称,否则退出。
set cur_dir=%cd%
:find_venv
if exist %cur_dir%\python-version set /p venv_name=<%cur_dir%\python-version && goto activate_venv
call %UTILITS_PATH%\normalize_path %cur_dir%\.. cur_dir
echo %cur_dir%
if %cur_dir:~0,3%==%cur_dir% (
    echo 没有找到虚拟环境设置。
    echo 命令pyenv local可以设置工作目录的虚拟环境.使用pyenv local --help查看详情
    goto:eof
)
goto find_venv

:: TODO: 启用虚拟环境 Test.
::       先检查虚拟环境是否仍然存在。若不存在，提示并退出
::       如果当前已经启用了一个虚拟环境，先停用
:activate_venv
call %UTILITS_PATH%\stript %venv_name%,venv_name

if not exist %VENV_ROOT%\%venv_name% (
    echo 虚拟环境%venv_name%已经不存在。
    echo 若要重建，请使用pyenv create。使用pyenv create。使用pyenv --help查看详情
    goto:eof
)

call %BINARY_PATH%\pyenv-deactivate


:: TODO: 保存启用前的PROMPT，在旧PROMPT基础上设置新值 Test.
set "VENV_PATH=%VENV_ROOT%\%venv_name%"
if not defined old_prompt (
    if not defined PROMPT set "PROMPT=$P$G"
    set "old_prompt=%PROMPT%"
)
set "PROMPT=(%venv_name%) %old_prompt%"

REM if defined old_prompt (
REM     set "PROMPT=%old_prompt%"
REM ) else (
REM     if not defined PROMPT (
REM         set "PROMPT=$P$G"
REM     )
REM     set "old_prompt=%PROMPT%"
REM )
REM set "PROMPT=(%venv_name%) %PROMPT%"

:: TODO: 保存启用前的PYTHONHOME，然后清除PYTHONHOME Test.
if not defined old_pythonhome set "old_pythonhome=%PYTHONHOME%"
set PYTHONHOME=

:: TODO: 保存启用前的PATH后，在PATH中增加虚拟环境执行路径。
if not defined old_path set "old_path=%PATH%"
set "PATH=%VENV_PATH%\Scripts;%old_path%"

goto:eof

:: TODO: 打印帮助 Test.
:help
%BINARY_PATH%\pyenv-help activate

