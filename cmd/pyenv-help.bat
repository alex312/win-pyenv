::=========================================================
:: TODO: ��ӡpyenv�İ�����Ϣ Test.
:: command: pyenv --help
::          pyenv <subcommand> --help
::     argument:
::          subcommand  �������subcommand��helpʱ����pyenv --help��ͬ
::     operation:
::          --help      ������pyenv֮��ʱ����ӡ����������Ĺ�����������
::                      ������sumcommand֮��ʱ����ӡ��Ӧ�����������ϸ����
::=========================================================

set commands=
for /f "tokens=* delims= " %%a in ('%BINARY_PATH%\pyenv-commands') do set commands=%%a

if "%1"=="" (
    echo;
    echo ʹ�÷���:
    echo    pyenv ^<command^> [options]
    echo    pyenv --help
    echo;

    echo ����:
    echo    commands            �о�����
    echo    init                ��ʼ���⻷������Ŀ¼
    echo    create              �������⻷��
    echo    delete              ɾ�����⻷��
    echo    list                �о��Ѿ���װ��python����������ϵͳ�а�װ��pytho
    echo                        n�汾�Լ����⻷��
    echo    local               Ϊ����Ŀ¼�������⻷��
    echo    activate            ���õ�ǰ���ڹ������������⻷��
    echo    deactivate          ͣ�õ�ǰ���õ����⻷��
    echo    help                ��ӡ����
    echo;

    echo ����:
    echo    --help              ��ӡ����
    goto:eof
)

if "%1"=="init" (
    echo;
    echo ʹ�÷���:
    echo    pyenv init [options] ^<venv_root_path^>

    echo;
    echo ����:
    echo    venv_root_path      ���⻷������Ŀ¼·����Ĭ��Ϊ %%PYENV_HOME%%^\versions

    echo;
    echo ����:
    echo    -c, --clear         �����µĹ���Ŀ¼ǰ������еĹ���Ŀ¼.
    echo    --help              ��ӡ����
    goto:eof
)
if "%1"=="create" (
    echo;
    echo ʹ�÷���:
    echo    pyenv create [options] [source_py] ^<venv_name^>

    echo;
    echo ����:
    echo    py_source           �������⻷����ʹ�õ�ԭʼpython������ϵͳ�а�װ��
    echo                        python�汾�ţ�Ҳ�������Ѿ����ڵ����⻷������
    echo                        ��������ǿ�ѡ�ģ�Ĭ�ϰ���ϵͳ�������������õ�python
    echo                        ·��˳��ѡ��
    echo    venv_name           ���⻷�������ƣ������ƽ���Ϊ���⻷����Ŀ¼������
    echo                        %%VENV_ROOT%%�С�
    
    echo;
    echo ����:
    echo    -c,--clear          ����ָ����venv_nameǰ�����ԭ�е�ͬ�����⻷��
    echo    --help              ��ӡ����
    goto:eof
)


if "%1"=="delete" (
    echo;
    echo ʹ�÷���:
    echo      pyenv delete ^<venv_name^>
    
    echo;
    echo ����:
    echo    venv_name           Ҫɾ�������⻷��������
    
    echo;
    echo ����:
    echo    --help              ��ӡ����
    goto:eof
)

if "%1"=="list" (
    echo;
    echo ʹ�÷���:
    echo      pyenv list [option]

    echo;
    echo ����:
    echo    --all               Ĭ�ϣ�ö������ϵͳpython�汾���Ѿ���װ
    echo                        �����⻷��
    echo    --system            ö��ϵͳ�а�װ��python�汾,������--all
    echo                        ��--envsͬʱ����
    echo    --envs              öö���Ѿ���װ�����⻷��,������--all��
    echo                        --systemͬʱ����
    echo    --help              ��ӡ����
    goto:eof
)

if "%1"=="local" (
    echo;
    echo ʹ�÷���:
    echo    pyenv local [options] ^<work_dir_path^> ^<venv_name^>

    echo;
    echo ����:
    echo    work_dir_path       ����Ŀ¼��·�������ò���ʡ�ԣ�Ĭ��Ϊ%%cd%%
    echo                        ����Ĺ���Ŀ¼��һ��python��Ŀ�ĸ�Ŀ¼��
    echo    venv_name           ��������Ǳ���ģ�����ָ�����õ����⻷������.

    echo;
    echo ����:
    echo    --help              ��ӡ����
    goto:eof
)

if "%1"=="activate" (
    echo;
    echo ʹ�÷���:
    echo    pyenv activate [options]

    echo;
    echo ����
    echo    --help              ��ӡ����
    goto:eof
)

if "%1"=="deactivate" (
    echo;
    echo ʹ�÷���:
    echo     pyenv deactivate [options]

    echo;
    echo ����:
    echo     --help               ��ӡ����
    goto:eof
)