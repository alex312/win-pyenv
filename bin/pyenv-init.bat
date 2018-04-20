::=========================================================
:: TODO: 初始化虚拟环境的管理目录 Test.
:: command: pyenv init [options] <venv_root>
::      arguments:
::          venv_root   虚拟环境管理目录路径，默认为 %PYENV_HOME%\versions
::      options:
::          -c, --clear 创建新的管理目录前清除现有的管理目录.
::          --help      打印帮助
::=========================================================

@echo off

:: TODO: 解析参数 Test.
set params=-c --clear,--help

set clear=
:loop_paras
    echo %1 | findstr "^-[a-z]\> ^--[a-z]*\> ^--[a-z]*-[a-z]*\>" 2>&1 >nul || goto check_venv_root
    
    echo %1 | findstr "^--help\>" >nul && goto help
    echo %params%| findstr "\<%1\>" >nul || (
        echo;
        echo 无法识别的操作符: %1
        goto help
    )
    echo %1 | findstr "^-c\> ^--clear\>" >nul && set clear=1 
    shift 
goto loop_paras



:: TODO: 如果VENV_ROOT已经设置，并且存在-c/--clear参数，删除经创建的虚拟环境管理目录 Test.
:check_venv_root
setlocal ENABLEDELAYEDEXPANSION
if defined VENV_ROOT if defined clear if exist %VENV_ROOT% (
    choice /C YN /M "是否删除目录%VENV_ROOT%？确认请按 Y，否请按 N。"
    if !ERRORLEVEL!==1 (rd /s %VENV_ROOT% & goto init_venv_root)
    if !ERRORLEVEL!==2 goto:eof
)
endlocal ENABLEDELAYEDEXPANSION

if defined VENV_ROOT if exist %VENV_ROOT% (
    echo 虚拟环境管理目录已经存在： %VENV_ROOT%
    echo 如果需要重建该目录，使用 pyenv init --help 查看详情
    goto:eof
)

:: TODO: 创建虚拟环境管理目录。 Test.
:init_venv_root
set VENV_ROOT=%1
if not defined VENV_ROOT set VENV_ROOT=%PYENV_HOME%\versions

echo %_new_path% | findstr "^[a-z]:\\ ^[A-Z]:\\" || call %UTILITS_PATH%\normalize_path %PYENV_HOME%\%VENV_ROOT%, VENV_ROOT

setlocal ENABLEDELAYEDEXPANSION
if exist %VENV_ROOT% for /f %%i in ( 'dir /b %VENV_ROOT%' ) do (
    choice /c:YN /m "目录%VENV_ROOT%存在其他内容。此操作可能造成不可逆的影响。是否继续？"
    if !ERRORLEVEL!==2 goto:eof
)
endlocal ENABLEDELAYEDEXPANSION

if not exist %VENV_ROOT% mkdir %VENV_ROOT%

call %UTILITS_PATH%\config_set base, venv_root, %VENV_ROOT%

goto :eof

:: TODO: 打印 pyenv init 命令的帮助信息 Plan.
:help
%BINARY_PATH%\pyenv-help init