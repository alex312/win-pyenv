::=========================================================
:: TODO: 去除字符串两侧的空格 Plant.
:: call stipt <str> <return>
::      argument
::          str     需要去除空格的字符串.
::          return  去除空格后的字符串，返回值.
::=========================================================

@echo off

set str=%1

:strip_left
if "%str:~0,1%"==" " set str=%str:~1% & goto strip_left

:strip_right
if "%str:~-1%"==" " set str=%str:~0,-1% & goto strip_right

set %~2=%str%

goto:eof