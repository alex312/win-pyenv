:: TODO: ��ʼ�����⻷����Ŀ¼ Test.
:: TODO: �������⻷�� Test.
:: TODO: ɾ�����⻷�� Test.
:: TODO: ö��ϵͳpython�汾�Լ����⻷������ Test.
:: TODO: ���ù���Ŀ¼�ĵ����⻷�� Test.
:: TODO: �������⻷�� Test.
:: TODO: �ر����⻷�� Test.
:: =================================================

@echo off

if not defined PYENV_HOME set PYENV_HOME=%~dp0..

set UTILITS_PATH=%PYENV_HOME%\utilits

call %UTILITS_PATH%\normalize_path.bat %PYENV_HOME%, PYENV_HOME

set BINARY_PATH=%PYENV_HOME%\bin

:: 1. TODO: �ж��������Ƿ���ȷ���������ȷ����ӡhelp Closed.
if "%1"=="" goto help

echo %1 | findstr "^--help\> ^help" 2>&1 >nul && goto help

for /f "usebackq tokens=2*" %%i in ('echo %*') do set params=%%j 

set commands=
for /f "tokens=* delims= " %%a in ('%BINARY_PATH%\pyenv-commands') do set commands=%%a

:: TODO: ֻͨ���ܵ�����findstr�����У���Ҫ��ʾcommands��ֵ. Closed.
echo %commands% | findstr "\<%1\>" >nul || goto help

:: help �� commands �����Ҫ��ʼ��������ֱ��ִ�С�
echo help commands | findstr "\<%1\>" >nul && goto route_commands

:: 2.   TODO: ���ػ�������·������ Test.
:: 2.1  TODO: ��ȡpyenv�ĸ�Ŀ¼,���������� Test.
::          pyenvĿ¼�ṹ���£�
::          PYENV_HOME
::          |---\bin         ���pyenvִ�нű�
::          |---\versions    ������⻷������·��������base.properties��ͨ��venv_root����
::          |---\config      ��������ļ�
::          |------|---base.properties     ������������
::          |---\utilits     �����Ϊ����ʹ�õ��������ļ�����ЩΪbin�е��������ṩ����
:init_config
call %UTILITS_PATH%\normalize_path.bat %PYENV_HOME%\config, PYENV_CONFIG_PATH

set VENV_ROOT=
call %UTILITS_PATH%\config_get base,venv_root,VENV_root
call %UTILITS_PATH%\stript %VENV_ROOT%,VENV_root

if not defined VENV_ROOT if not "%1"=="init" (
    echo ���⻷������Ŀ¼��û�г�ʼ�� 
    echo ʹ�� pyenv init ��ɳ�ʼ��������鿴pyenv init --help
    goto :eof
)

echo %VENV_ROOT% | findstr "^[a-z]:\\ ^[A-Z]:\\" >nul || (
    call %UTILITS_PATH%\normalize_path.bat %PYENV_HOME%\%VENV_ROOT%, VENV_ROOT
)

:: 2.3  TODO: ���������� Test.
:route_commands
"%BINARY_PATH%\\pyenv-%1" %params%
goto :eof

:: 3.   TODO: ������� Test.
:: 3.1  TODO: ���������ƶ���pyenv-help�� Closed.
:help
%BINARY_PATH%\pyenv-help