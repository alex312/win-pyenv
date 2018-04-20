::=========================================================
:: TODO: 获取执行的配置项 Plan.
:: call config-set <group> <item> <value>
::      argument:
::          group   分组名称，对应config目录中的文件名.
::          item    配置项名称.
::          value   配置项的值.
::=========================================================

:: TODO: 检查配置文件是否存在 Test.

if not exist %PYENV_CONFIG_PATH%\%1.properties (
    echo 找不到配置文件%1.properties
    goto:eof
)
:: TODO: 读取配置文件各行，重新写入新的文件，写入前替换配置项的旧值 Test.
for /f "tokens=* delims==" %%a in (%PYENV_CONFIG_PATH%\%1.properties) do (
    echo %%a | findstr "^%2=" 2>&1 >nul && echo %2=%3>>%PYENV_CONFIG_PATH%\~%1.properties || echo %%a>>%PYENV_CONFIG_PATH%\~%1.properties
)

:: TODO: 新配置文件替换旧配置文件，删除新配置文件
if exist %PYENV_CONFIG_PATH%\~%1.properties (
    move %PYENV_CONFIG_PATH%\~%1.properties %PYENV_CONFIG_PATH%\%1.properties
)
