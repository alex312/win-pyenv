::=========================================================
:: TODO: �������⻷�� Test.
:: ʹ�÷���:
::      pyenv create [options] [source_py] <venv_name>
:: ����:
::      py_source       �������⻷����ʹ�õ�ԭʼpython������ϵͳ�а�װ��
::                      python�汾�ţ�Ҳ�������Ѿ����ڵ����⻷������
::                      ��������ǿ�ѡ�ģ�Ĭ�ϰ���ϵͳ�������������õ�python
::                      ·��˳��ѡ��
::      venv_name       ���⻷�������ƣ������ƽ���Ϊ���⻷����Ŀ¼������
::                      %VENV_ROOT%�С�
:: ����:
::      -c,--clear      ����ָ����venv_nameǰ�����ԭ�е�ͬ�����⻷��
::      --help          ��ӡ����
::=========================================================

@echo off

:: TODO: ���ñ�Ҫ�ı��� Test.
set verions_file=%PYENV_HOME%\cur_envs
set clear=
set source_py=
set source_py_path=
set venv_name=
set venv_path=

set options=-c --clear,--help
:: TODO: ���������Ͳ��� Test.
:parse_options
    echo %1 | findstr "^-[a-z]\> ^--[a-z]*\> ^--[a-z]*-[a-z]*\>" 2>&1 >nul || goto parse_arguments
    echo %options% | findstr "\<%1\>" 2>&1 >nul || (
        echo;
        echo �޷�ʶ��Ĳ��� %1
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

:: TODO: ���venv_name�Ƿ��Ѿ����ڣ��������д��� -c/--clearʱ��ɾ��ԭ�����⻷���������˳� Test.
setlocal ENABLEDELAYEDEXPANSION
if exist %venv_path% if defined clear (
    choice /C YN /M "��Ҫɾ��Ŀ¼%venv_path%���������ɲ������Ӱ�졣ȷ���밴 Y�����밴 N��"
    if !ERRORLEVEL!==1 (rd /s %venv_path%)
    if !ERRORLEVEL!==2 goto:eof
)
endlocal ENABLEDELAYEDEXPANSION

if exist %venv_path% (
    echo �Ѿ��������⻷��%venv_name%��
    echo ��Ҫ���´�����ʹ�ò���-c/--clear��
    echo ������鿴 pyenv create --help
    goto:eof
)

:: TODO: ��ȡϵͳ�е�python�汾��·�� ��ʽ���汾�� ·�� Test.
echo [system] >%verions_file%
call %UTILITS_PATH%\versions_get system >>%verions_file%

:: TODO: ��ȡϵͳ�е����⻷������ Test.
echo [venvs] >>%verions_file%
call %UTILITS_PATH%\versions_get envs >>%verions_file%

:: TODO: ����source_py,���������û��ָ��������ΪϵͳĬ�ϵ�python�汾�š� Test.
if not defined source_py for /f "tokens=2" %%i in ('python --version 2^>^&1') do set source_py=%%i

:: TODO: ���source_py��ϵͳpython���Լ����⻷�����Ƿ����,������ڣ���ȡ��Ӧ��python·�������������˳� Test.
for /f "tokens=1,2 delims==" %%i in (%verions_file%) do (
    if "%%i"=="%source_py%" (
        set source_py_path=%%j
        goto create_venv
    )
)

:: TODO: ����virtualenv�����������⻷�� Test.
:create_venv
echo source_py:         %source_py%
echo source_py_path:    %source_py_path%
echo venv_name:         %venv_name%
echo venv_path:         %venv_path%
virtualenv -p %source_py_path% %venv_path%
del %verions_file%

:: TODO: ��¼���⻷������� Plan.
goto :eof

:help
%BINARY_PATH%\pyenv-help create