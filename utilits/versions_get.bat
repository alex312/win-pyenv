::=========================================================
:: TODO: ��ȡϵͳ�е�python�汾��\·���Լ����⻷�����ƺ�python·���� Closed.
::
:: ʹ�÷���:
::      call versions_get <type>
::
:: �����ʽ:
::      <ϵͳ�汾|���⻷������>=<python.exe���ļ�·��>
::
:: ����:
::      type            Ĭ��ֵΪall��system��ʾϵͳpython��
::                      envs��ʾ���⻷��
::=========================================================
@echo off
echo all,system,envs | findstr "\<%1\>" >nul 2>&1 || (
    goto:eof
)

if "%1"=="envs" goto show_envs

:show_sys_vers
for /f "tokens=*" %%i in ('where python') do (
    for /f "tokens=2" %%x in ('%%i --version 2^>^&1') do echo %%x=%%i
)

:show_envs
if "%1"=="system" goto:eof
for /f "tokens=*" %%i in ('dir /b /a:d %VENV_ROOT%') do (
    echo %%i=%VENV_ROOT%\%%i\Scripts\python.exe
)
