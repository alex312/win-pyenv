::=========================================================
:: TODO: ��ȡִ�е������� Plan.
:: call config-set <group> <item> <value>
::      argument:
::          group   �������ƣ���ӦconfigĿ¼�е��ļ���.
::          item    ����������.
::          value   �������ֵ.
::=========================================================

:: TODO: ��������ļ��Ƿ���� Test.

if not exist %PYENV_CONFIG_PATH%\%1.properties (
    echo �Ҳ��������ļ�%1.properties
    goto:eof
)
:: TODO: ��ȡ�����ļ����У�����д���µ��ļ���д��ǰ�滻������ľ�ֵ Test.
for /f "tokens=* delims==" %%a in (%PYENV_CONFIG_PATH%\%1.properties) do (
    echo %%a | findstr "^%2=" 2>&1 >nul && echo %2=%3>>%PYENV_CONFIG_PATH%\~%1.properties || echo %%a>>%PYENV_CONFIG_PATH%\~%1.properties
)

:: TODO: �������ļ��滻�������ļ���ɾ���������ļ�
if exist %PYENV_CONFIG_PATH%\~%1.properties (
    move %PYENV_CONFIG_PATH%\~%1.properties %PYENV_CONFIG_PATH%\%1.properties
)
