::=========================================================
:: TODO: ö��ϵͳpython�汾�Լ����⻷������ Test.
:: ʹ�÷���:
::      pyenv list [option]
:: ����
::      --all           Ĭ�ϣ�ö������ϵͳpython�汾���Ѿ���װ
::                      �����⻷��
::      --system        ö��ϵͳ�а�װ��python�汾,������--all
::                      ��--envsͬʱ����
::      --envs          öö���Ѿ���װ�����⻷��,������--all��
::                      --systemͬʱ����
::      --help          ��ӡ����
::=========================================================

@echo off

:: TODO: �������� Test.
:parse_params
set params=--all,--system,--envs,--help

if "%1"=="--help" goto help
set list_type=
echo %params% | findstr "\<%1\>" >nul 2>&1 && set list_type=%1

if defined list_type set "list_type=%list_type:--=%"


:: TODO: ��ȡ�б� Test.
if "%list_type%"=="envs" goto show_env
echo;
for /f "tokens=1,2 delims==" %%i in ('call %UTILITS_PATH%\versions_get system') do ( echo %%i^(system^) )

:show_env
if "%list_type%"=="system" goto:eof
echo;
for /f "tokens=1,2 delims==" %%i in ('call %UTILITS_PATH%\versions_get system') do ( echo %%i )

goto:eof

:: TODO: ��ӡ���� Test.
:help
%BINARY_PATH%\pyenv-help list