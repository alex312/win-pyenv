::=========================================================
:: TODO: 获取系统中的python版本号\路径以及虚拟环境名称和python路径。 Closed.
::
:: 使用方法:
::      call versions_get <type>
::
:: 输出格式:
::      <系统版本|虚拟环境名称>=<python.exe的文件路径>
::
:: 参数:
::      type            默认值为all，system表示系统python，
::                      envs表示虚拟环境
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
