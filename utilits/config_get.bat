::=========================================================
:: TODO: 获取执行的配置项 Plan.
:: call config-get <group> <item> <return>
::      argument:
::          group   分组名称，对应config目录中的文件名.
::          item    配置项名称，对应配置文件中的配置项.
::          return  返回值.
::=========================================================

:: TODO: 检查配置文件是否存在 Plan.

if not exist %PYENV_CONFIG_PATH%\%1.properties (
    echo 找不到配置文件%1.properties
    goto:eof
)
:: TODO: 获取配置项的值
for /f "eol=# tokens=1,* delims==" %%a in (%PYENV_CONFIG_PATH%\%1.properties) do (
    if /i %%a==%2 set %~3=%%b
)