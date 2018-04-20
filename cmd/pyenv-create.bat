::=========================================================
:: TODO: 创建虚拟环境 Test.
:: 使用方法:
::      pyenv create [options] [source_py] <venv_name>
:: 参数:
::      py_source       创建虚拟环境所使用的原始python，可是系统中安装的
::                      python版本号，也可以是已经存在的虚拟环境名称
::                      这个参数是可选的，默认按照系统环境变量中设置的python
::                      路径顺序选择。
::      venv_name       虚拟环境的名称，该名称将作为虚拟环境的目录名放在
::                      %VENV_ROOT%中。
:: 操作:
::      -c,--clear      创建指定的venv_name前先清除原有的同名虚拟环境
::      --help          打印帮助
::=========================================================

@echo off

:: TODO: 重置必要的变量 Test.
set verions_file=%PYENV_HOME%\cur_envs
set clear=
set source_py=
set source_py_path=
set venv_name=
set venv_path=

set options=-c --clear,--help
:: TODO: 分析操作和参数 Test.
:parse_options
    echo %1 | findstr "^-[a-z]\> ^--[a-z]*\> ^--[a-z]*-[a-z]*\>" 2>&1 >nul || goto parse_arguments
    echo %options% | findstr "\<%1\>" 2>&1 >nul || (
        echo;
        echo 无法识别的参数 %1
        goto help
    )
    echo %1 | findstr "^--help\>" 2>&1 >nul && goto help
    echo %1 | findstr "^-c\> ^--clear" 2>&1 >nul && set clear=1
    shift
goto parse_options

:parse_arguments
set source_py=%1
set venv_name=%2
if not defined venv_name (
    set source_py=
    set venv_name=%1
)
set venv_path=%VENV_ROOT%\%venv_name%

:: TODO: 检查venv_name是否已经存在，当参数中存在 -c/--clear时，删除原有虚拟环境，否则退出 Test.
setlocal ENABLEDELAYEDEXPANSION
if exist %venv_path% if defined clear (
    choice /C YN /M "需要删除目录%venv_path%？这可能造成不可逆的影响。确认请按 Y，否请按 N。"
    if !ERRORLEVEL!==1 (rd /s %venv_path%)
    if !ERRORLEVEL!==2 goto:eof
)
endlocal ENABLEDELAYEDEXPANSION

if exist %venv_path% (
    echo 已经存在虚拟环境%venv_name%。
    echo 若要重新创建请使用操作-c/--clear。
    echo 详情请查看 pyenv create --help
    goto:eof
)

:: TODO: 获取系统中的python版本和路径 格式：版本号 路径 Test.
echo [system] >%verions_file%
call %UTILITS_PATH%\versions_get system >>%verions_file%

:: TODO: 获取系统中的虚拟环境名称 Test.
echo [venvs] >>%verions_file%
call %UTILITS_PATH%\versions_get envs >>%verions_file%

:: TODO: 设置source_py,如果参数中没有指定，设置为系统默认的python版本号。 Test.
if not defined source_py for /f "tokens=2" %%i in ('python --version 2^>^&1') do set source_py=%%i

:: TODO: 检查source_py在系统python中以及虚拟环境中是否存在,如果存在，获取对应的python路径，不存在则退出 Test.
for /f "tokens=1,2 delims==" %%i in (%verions_file%) do (
    if "%%i"=="%source_py%" (
        set source_py_path=%%j
        goto create_venv
    )
)

:: TODO: 调用virtualenv命令生成虚拟环境 Test.
:create_venv
echo source_py:         %source_py%
echo source_py_path:    %source_py_path%
echo venv_name:         %venv_name%
echo venv_path:         %venv_path%
virtualenv -p %source_py_path% %venv_path%
del %verions_file%

:: TODO: 记录虚拟环境情况？ Plan.
goto :eof

:help
%BINARY_PATH%\pyenv-help create