::=========================================================
:: TODO: ɾ�����⻷�� Test.
:: ʹ�÷���:
::      pyenv delete <venv_name>
:: ����:
::      venv_name           Ҫɾ�������⻷��������
:: ����:
::      --help              ��ӡ����
::=========================================================

@echo off

set venv_name=
set venv_path=
:: TODO: �������� Test.
if "%1"=="" goto help
if "%1"=="--help" goto help
set venv_name=%1

:: TODO: ���venv_name���⻷��Ŀ¼�Ƿ���ڡ�������ڣ�ɾ���������ڣ��˳� Test.
set venv_path=%VENV_ROOT%\%venv_name%

setlocal ENABLEDELAYEDEXPANSION
if exist %venv_path% (
    choice /C YN /M "��Ҫɾ��Ŀ¼%venv_path%���������ɲ������Ӱ�졣ȷ���밴 Y�����밴 N��"
    if !ERRORLEVEL!==1 (rd /s /q %venv_path%)
    if !ERRORLEVEL!==2 goto:eof
)
endlocal ENABLEDELAYEDEXPANSION
goto:eof

:help
%BINARY_PATH%\pyenv-help delete