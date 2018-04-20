::=========================================================
:: TODO: ��ʼ�����⻷���Ĺ���Ŀ¼ Test.
:: command: pyenv init [options] <venv_root>
::      arguments:
::          venv_root   ���⻷������Ŀ¼·����Ĭ��Ϊ %PYENV_HOME%\versions
::      options:
::          -c, --clear �����µĹ���Ŀ¼ǰ������еĹ���Ŀ¼.
::          --help      ��ӡ����
::=========================================================

@echo off

:: TODO: �������� Test.
set params=-c --clear,--help

set clear=
:loop_paras
    echo %1 | findstr "^-[a-z]\> ^--[a-z]*\> ^--[a-z]*-[a-z]*\>" 2>&1 >nul || goto check_venv_root
    
    echo %1 | findstr "^--help\>" >nul && goto help
    echo %params%| findstr "\<%1\>" >nul || (
        echo;
        echo �޷�ʶ��Ĳ�����: %1
        goto help
    )
    echo %1 | findstr "^-c\> ^--clear\>" >nul && set clear=1 
    shift 
goto loop_paras



:: TODO: ���VENV_ROOT�Ѿ����ã����Ҵ���-c/--clear������ɾ�������������⻷������Ŀ¼ Test.
:check_venv_root
setlocal ENABLEDELAYEDEXPANSION
if defined VENV_ROOT if defined clear if exist %VENV_ROOT% (
    choice /C YN /M "�Ƿ�ɾ��Ŀ¼%VENV_ROOT%��ȷ���밴 Y�����밴 N��"
    if !ERRORLEVEL!==1 (rd /s %VENV_ROOT% & goto init_venv_root)
    if !ERRORLEVEL!==2 goto:eof
)
endlocal ENABLEDELAYEDEXPANSION

if defined VENV_ROOT if exist %VENV_ROOT% (
    echo ���⻷������Ŀ¼�Ѿ����ڣ� %VENV_ROOT%
    echo �����Ҫ�ؽ���Ŀ¼��ʹ�� pyenv init --help �鿴����
    goto:eof
)

:: TODO: �������⻷������Ŀ¼�� Test.
:init_venv_root
set VENV_ROOT=%1
if not defined VENV_ROOT set VENV_ROOT=%PYENV_HOME%\versions

echo %_new_path% | findstr "^[a-z]:\\ ^[A-Z]:\\" || call %UTILITS_PATH%\normalize_path %PYENV_HOME%\%VENV_ROOT%, VENV_ROOT

setlocal ENABLEDELAYEDEXPANSION
if exist %VENV_ROOT% for /f %%i in ( 'dir /b %VENV_ROOT%' ) do (
    choice /c:YN /m "Ŀ¼%VENV_ROOT%�����������ݡ��˲���������ɲ������Ӱ�졣�Ƿ������"
    if !ERRORLEVEL!==2 goto:eof
)
endlocal ENABLEDELAYEDEXPANSION

if not exist %VENV_ROOT% mkdir %VENV_ROOT%

call %UTILITS_PATH%\config_set base, venv_root, %VENV_ROOT%

goto :eof

:: TODO: ��ӡ pyenv init ����İ�����Ϣ Plan.
:help
%BINARY_PATH%\pyenv-help init