::=========================================================
:: TODO: �������⻷�� Test.
:: ʹ�÷���:
::    pyenv activate [options]
:: ����
::    --help              ��ӡ����
::=========================================================
@echo off

:: TODO: �������� Test.
if "%1"=="--help" goto help

:: TODO: ��ȡ��ǰ����Ŀ¼�����⻷������ Test.
::       �ӵ�ǰ·��%cd%��ʼ���ϱ���������python-version�ļ�
::       ����ҵ��ļ�����ȡ���⻷������,�����˳���
set cur_dir=%cd%
:find_venv
if exist %cur_dir%\python-version set /p venv_name=<%cur_dir%\python-version && goto activate_venv
call %UTILITS_PATH%\normalize_path %cur_dir%\.. cur_dir
echo %cur_dir%
if %cur_dir:~0,3%==%cur_dir% (
    echo û���ҵ����⻷�����á�
    echo ����pyenv local�������ù���Ŀ¼�����⻷��.ʹ��pyenv local --help�鿴����
    goto:eof
)
goto find_venv

:: TODO: �������⻷�� Test.
::       �ȼ�����⻷���Ƿ���Ȼ���ڡ��������ڣ���ʾ���˳�
::       �����ǰ�Ѿ�������һ�����⻷������ͣ��
:activate_venv
call %UTILITS_PATH%\stript %venv_name%,venv_name

if not exist %VENV_ROOT%\%venv_name% (
    echo ���⻷��%venv_name%�Ѿ������ڡ�
    echo ��Ҫ�ؽ�����ʹ��pyenv create��ʹ��pyenv create��ʹ��pyenv --help�鿴����
    goto:eof
)

call %BINARY_PATH%\pyenv-deactivate


:: TODO: ��������ǰ��PROMPT���ھ�PROMPT������������ֵ Test.
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

:: TODO: ��������ǰ��PYTHONHOME��Ȼ�����PYTHONHOME Test.
if not defined old_pythonhome set "old_pythonhome=%PYTHONHOME%"
set PYTHONHOME=

:: TODO: ��������ǰ��PATH����PATH���������⻷��ִ��·����
if not defined old_path set "old_path=%PATH%"
set "PATH=%VENV_PATH%\Scripts;%old_path%"

goto:eof

:: TODO: ��ӡ���� Test.
:help
%BINARY_PATH%\pyenv-help activate

