::=========================================================
:: TODO: 打印pyenv的帮助信息 Test.
:: command: pyenv --help
::          pyenv <subcommand> --help
::     argument:
::          subcommand  子命令，当subcommand是help时，与pyenv --help相同
::     operation:
::          --help      出现在pyenv之后时，打印各个子命令的功能描述，当
::                      出现在sumcommand之后时，打印对应的子命令的详细帮助
::=========================================================

set commands=
for /f "tokens=* delims= " %%a in ('%BINARY_PATH%\pyenv-commands') do set commands=%%a

if "%1"=="" (
    echo;
    echo 使用方法:
    echo    pyenv ^<command^> [options]
    echo    pyenv --help
    echo;

    echo 命令:
    echo    commands            列举命令
    echo    init                初始虚拟环境管理目录
    echo    create              创建虚拟环境
    echo    delete              删除虚拟环境
    echo    list                列举已经安装的python环境，包括系统中安装的pytho
    echo                        n版本以及虚拟环境
    echo    local               为工作目录设置虚拟环境
    echo    activate            启用当前所在工作环境的虚拟环境
    echo    deactivate          停用当前启用的虚拟环境
    echo    help                打印帮助
    echo;

    echo 操作:
    echo    --help              打印帮助
    goto:eof
)

if "%1"=="init" (
    echo;
    echo 使用方法:
    echo    pyenv init [options] ^<venv_root_path^>

    echo;
    echo 参数:
    echo    venv_root_path      虚拟环境管理目录路径，默认为 %%PYENV_HOME%%^\versions

    echo;
    echo 操作:
    echo    -c, --clear         创建新的管理目录前清除现有的管理目录.
    echo    --help              打印帮助
    goto:eof
)
if "%1"=="create" (
    echo;
    echo 使用方法:
    echo    pyenv create [options] [source_py] ^<venv_name^>

    echo;
    echo 参数:
    echo    py_source           创建虚拟环境所使用的原始python，可是系统中安装的
    echo                        python版本号，也可以是已经存在的虚拟环境名称
    echo                        这个参数是可选的，默认按照系统环境变量中设置的python
    echo                        路径顺序选择。
    echo    venv_name           虚拟环境的名称，该名称将作为虚拟环境的目录名放在
    echo                        %%VENV_ROOT%%中。
    
    echo;
    echo 操作:
    echo    -c,--clear          创建指定的venv_name前先清除原有的同名虚拟环境
    echo    --help              打印帮助
    goto:eof
)


if "%1"=="delete" (
    echo;
    echo 使用方法:
    echo      pyenv delete ^<venv_name^>
    
    echo;
    echo 参数:
    echo    venv_name           要删除的虚拟环境的名称
    
    echo;
    echo 操作:
    echo    --help              打印帮助
    goto:eof
)

if "%1"=="list" (
    echo;
    echo 使用方法:
    echo      pyenv list [option]

    echo;
    echo 操作:
    echo    --all               默认，枚举所有系统python版本和已经安装
    echo                        的虚拟环境
    echo    --system            枚举系统中安装的python版本,不能与--all
    echo                        和--envs同时设置
    echo    --envs              枚枚举已经安装的虚拟环境,不能与--all和
    echo                        --system同时设置
    echo    --help              打印帮助
    goto:eof
)

if "%1"=="local" (
    echo;
    echo 使用方法:
    echo    pyenv local [options] ^<work_dir_path^> ^<venv_name^>

    echo;
    echo 参数:
    echo    work_dir_path       工作目录的路径。若该参数省略，默认为%%cd%%
    echo                        这里的工作目录是一个python项目的根目录。
    echo    venv_name           这个参数是必须的，用于指定设置的虚拟环境名称.

    echo;
    echo 操作:
    echo    --help              打印帮助
    goto:eof
)

if "%1"=="activate" (
    echo;
    echo 使用方法:
    echo    pyenv activate [options]

    echo;
    echo 操作
    echo    --help              打印帮助
    goto:eof
)

if "%1"=="deactivate" (
    echo;
    echo 使用方法:
    echo     pyenv deactivate [options]

    echo;
    echo 操作:
    echo     --help               打印帮助
    goto:eof
)