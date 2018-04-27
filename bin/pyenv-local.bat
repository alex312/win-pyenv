::=========================================================
:: TODO: ���ù���Ŀ¼�����⻷�� Test.
:: ʹ�÷���:
::      pyenv local [options] <work_dir_path> <venv_name>
:: ����:
::      work_dir_path             ����Ŀ¼��·�������ò���ʡ�ԣ�Ĭ��Ϊ%cd%
::                                ����Ĺ���Ŀ¼��һ��python��Ŀ�ĸ�Ŀ¼��
::      venv_name                 ��������Ǳ���ģ�����ָ�����õ����⻷������.
:: ����:
::      --help                    ��ӡ����
::=========================================================
@echo off

:: TODO: �������� Test.
if "%1"=="" goto help
if "%1"=="--help" goto help
set work_dir_path=%1
set venv_name=%2

:: ���û������work_dir_path����
if not defined venv_name (
    set work_dir_path=%cd%
    set venv_name=%1
)

call %UTILITS_PATH%\normalize_path %work_dir_path% work_dir_path

:: TODO: ��鹤��Ŀ¼·���Ƿ���ڡ���������ڣ���ʾ���Ƴ� Test.
if not exist %work_dir_path% (
    echo ����Ŀ¼�����ڡ�
    goto:eof
)

:: TODO: ������⻷�������Ƿ���ڡ���������ڣ���ʾ�������������˳� Test.
set venv_path=%VENV_ROOT%\%venv_name%
if not exist %venv_path% (
    echo �Ҳ������⻷��%venv_name%
    echo ������ʹ��pyenv create�������ʹ��pyenv create --help �鿴����
    goto:eof
)

:: TODO: �ڹ���Ŀ¼�д���python_version�ļ���¼���⻷������ Test.
echo work_dir_path: %work_dir_path%
echo venv_name: %venv_name%

echo %venv_name% >%work_dir_path%\.python-version
goto:eof

:: TODO: ��ӡ���� Test.
:help
%BINARY_PATH%\pyenv-help local