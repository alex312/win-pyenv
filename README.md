# Windows Pyenv

����һ����windows�¹���python���⻷���Ĺ���

## ��������

[python](https://www.python.org/downloads/)
virtualenv

## ��װ

1. ��װ[python](https://www.python.org/downloads/)
2. ��װvirtualenv.

```
pip install virtualenv
```

3. ��װpyenv
```
git clone https://github.com/alex312/win-pyenv.git
```

4. ����ϵͳ��������.
   ��PATH������ "python��Ŀ¼"
   ��������PYENV_HOME,ֵΪwin-pyenv��Ŀ�ĸ�Ŀ¼��
   ��%PYENV_HOME%\bin���ӵ�PATH��

## ��֤

�����������ú�֮�����´�cmd,ִ�������������ӡpyenv�İ�����Ϣ

```
pyenv
```

## ʹ��

1. �ڿ�ʼʹ��win-pyenv�������⻷��֮ǰ������Ҫ��ʼ��������⻷����Ŀ¼��������Ҫ�ؽ�����Ŀ¼�������������ֻ��Ҫִ��һ��
    ```
    pyenv init
    ```
   ���Ĭ����PYENV_HOME�д���һ��versionsĿ¼��������Ŵ��������⻷������Ҳ����ָ��һ��·��������PYENV_HOME\versions��ʹ��pyenv init --help��

2. �������⻷��
    ```
    pyenv create myenv
    ```
    ��������ʹ��ϵͳĬ�ϵ�python����һ������myenv�����⻷����������ϵͳ�а�װ�˶���汾��python��Ҳ����ʹ��������������������⻷��

    ```
    pyenv create [python_version] myenv
    ```
    ֻҪ��python_version�滻�ɶ�Ӧ��python�汾�ţ���3.5.4��**����Ҫע�⣬ϵͳ��������PATH�б����ܹ��ҵ���Ӧ�汾��python��ִ��·��������win-pyenv���Ҳ���**
    
    ��Ҳ���԰�python_version�滻���Ѿ����������⻷�����ơ�Ч����ʹ�ð汾��һ��

3. �оٿ��õ�python�����������ϵͳ�Ѿ���װ��python���Լ��㴴�������⻷     ����ʹ�����������

    ```
    pyenv list [--all|--system|--envs]
    ```
    ���У�all��ʾ�г����У����������Ĭ��ѡ�system��ʾֻ�г�ϵͳ�Ѱ�װ�ģ�envs��ʾ���⻷����������԰������ڴ������⻷��ǰ��ѡ����Ҫʹ�õ�python��

4. ������Ŀʹ�õ����⻷����
    ```
    pyenv local [project_root] myenv
    ```
    ����������project_root�д���һ��python-version�ļ������б��������⻷����myenv��project_rootĬ��Ϊ��ǰĿ¼��

5. �������⻷����
    ```
    cd [path]
    pyenv activate
    ```
    pyenv activate���path��ʼ����������python-version�ļ���ֱ���ҵ������ߵ�����̸�Ŀ¼������ҵ�python-version�������������м�¼�����⻷�������path��������Ŀ��Ŀ¼��֮�µ�������Ŀ¼��

6. ͣ�����⻷������������������ͣ�õ�ǰ���õ����⻷����ʹ�����������
    ```
    pyenv deactivate
    ```
    ���߹ر�cmd���ڡ� **���ԣ���������¿�����cmd���ڣ�����Ҫ�����������⻷�����ܼ���֮ǰ�Ŀ�������**

## ����

#### windowsϵͳ�ж��python����

�����㰲װ������python��2.7.6��3.5.4��
��������԰����ǵ�����·�����ӵ�ϵͳ��������PATH��ȥ��Ȼ���ٸ��Ե�Ŀ¼�д���"python[�汾��].bat"���������������������
```
@echo off
%~dp0python %*
```
������python2.7.6�ĸ�Ŀ¼�д���python2.7.6.bat��ʹ��ʱ��cmd��������������python2.7.6����ԭ����python��
