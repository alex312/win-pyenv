::=========================================================
:: TODO: ��ȡִ�е������� Plan.
:: call config-get <group> <item> <return>
::      argument:
::          group   �������ƣ���ӦconfigĿ¼�е��ļ���.
::          item    ���������ƣ���Ӧ�����ļ��е�������.
::          return  ����ֵ.
::=========================================================

:: TODO: ��������ļ��Ƿ���� Plan.

if not exist %PYENV_CONFIG_PATH%\%1.properties (
    echo �Ҳ��������ļ�%1.properties
    goto:eof
)
:: TODO: ��ȡ�������ֵ
for /f "eol=# tokens=1,* delims==" %%a in (%PYENV_CONFIG_PATH%\%1.properties) do (
    if /i %%a==%2 set %~3=%%b
)