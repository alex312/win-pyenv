::=========================================================
:: TODO: ȥ���ַ�������Ŀո� Plant.
:: call stipt <str> <return>
::      argument
::          str     ��Ҫȥ���ո���ַ���.
::          return  ȥ���ո����ַ���������ֵ.
::=========================================================

@echo off

set str=%1

:strip_left
if "%str:~0,1%"==" " set str=%str:~1% & goto strip_left

:strip_right
if "%str:~-1%"==" " set str=%str:~0,-1% & goto strip_right

set %~2=%str%

goto:eof