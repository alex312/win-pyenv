# Windows Pyenv

这是一个在windows下管理python虚拟环境的工具

## 工作环境

[python](https://www.python.org/downloads/)
virtualenv

## 安装

1. 安装[python](https://www.python.org/downloads/)
2. 安装virtualenv.

```
pip install virtualenv
```

3. 安装pyenv
```
git clone https://github.com/alex312/win-pyenv.git
```

4. 设置系统环境变量.
   在PATH中增加 "python根目录"
   新增变量PYENV_HOME,值为win-pyenv项目的根目录。
   将%PYENV_HOME%\bin增加到PATH中

## 验证

环境变量设置好之后，重新打开cmd,执行下面的命令，会打印pyenv的帮助信息

```
pyenv
```

## 使用

1. 在开始使用win-pyenv管理虚拟环境之前，首先要初始化存放虚拟环境的目录，除非你要重建各个目录，否则这个命令只需要执行一次
    ```
    pyenv init
    ```
   这会默认在PYENV_HOME中创建一个versions目录，用来存放创建的虚拟环境。你也可以指定一个路径来代替PYENV_HOME\versions。使用pyenv init --help。

2. 创建虚拟环境
    ```
    pyenv create myenv
    ```
    这个命令会使用系统默认的python创建一个名叫myenv的虚拟环境。如果你的系统中安装了多个版本的python，也可以使用下面的命令来创建虚拟环境

    ```
    pyenv create [python_version] myenv
    ```
    只要将python_version替换成对应的python版本号，如3.5.4。**但是要注意，系统环境变量PATH中必须能够找到对应版本的python的执行路径，否则win-pyenv会找不到**
    
    你也可以把python_version替换成已经创建的虚拟环境名称。效果与使用版本号一样

3. 列举可用的python环境。这包括系统已经安装的python，以及你创建的虚拟环     境。使用下面的命令

    ```
    pyenv list [--all|--system|--envs]
    ```
    其中，all表示列出所有，这是命令的默认选项，system表示只列出系统已安装的，envs表示虚拟环境。这个可以帮助你在创建虚拟环境前，选择想要使用的python。

4. 设置项目使用的虚拟环境。
    ```
    pyenv local [project_root] myenv
    ```
    这个命令会在project_root中创建一个.python-version文件。其中保存了虚拟环境名myenv。project_root默认为当前目录。

5. 启用虚拟环境。
    ```
    cd [path]
    pyenv activate
    ```
    pyenv activate会从path开始向上逐层查找.python-version文件，直到找到，或者到达磁盘根目录。如果找到.python-version，它会启用其中记录的虚拟环境。因此path可以是项目根目录和之下的任意子目录。

6. 停用虚拟环境。有两个方法可以停用当前启用的虚拟环境。使用下面的命令
    ```
    pyenv deactivate
    ```
    或者关闭cmd窗口。 **所以，如果你重新开启了cmd窗口，你需要重新启用虚拟环境才能继续之前的开发工作**

## 技巧

#### windows系统中多个python共存

假设你安装了两个python，2.7.6和3.5.4。
这是你可以把他们的启用路径都加到系统环境变量PATH中去。然后再各自的目录中创建"python[版本号].bat"。在里面增加下面的内容
```
@echo off
%~dp0python %*
```
例如再python2.7.6的根目录中创建python2.7.6.bat。使用时再cmd窗口中输入输入python2.7.6代替原来的python。
