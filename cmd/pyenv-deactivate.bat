::=========================================================
:: TODO: ͣ�õ�ǰ���õ����⻷�� Test.
:: ʹ�÷���:
::     pyenv deactivate [options]
:: ����:
::     --help               ��ӡ����
::=========================================================
@echo off

:: TODO: �������� Test.
if "%1"=="--help" goto help

:: TODO: ͣ�����⻷�� Test.
set VENV_PATH=

:: TODO: ��ԭPROMPT�����old_prompt Test.
if defined old_prompt set "PROMPT=%old_prompt%" && set old_prompt=
REM Don't use () to avoid problems with them in %PATH%
REM if not defined old_prompt goto endifvprompt
REM     set "PROMPT=%old_prompt%"
REM     set old_prompt=
REM :endifvprompt

:: TODO: ��ԭPYTHONHOME�����old_pythonhome Test.
if defined old_pythonhome set "PYTHONHOME=%old_pythonhome%" && set old_pythonhome=
REM if not defined old_pythonhome goto endifvhome
REM     set "PYTHONHOME=%old_pythonhome%"
REM     set old_pythonhome=
REM :endifvhome

:: TODO: ��ԭPATH�����old_path Test.
if defined old_path set "PATH=%old_path%" && set old_path=
REM if not defined old_path goto endifvpath
REM     set "PATH=%old_path%"
REM     set old_path=
REM :endifvpath
goto:eof

:: TODO: ��ӡ���� Test.
:help
%BINARY_PATH%\pyenv-help deactivate