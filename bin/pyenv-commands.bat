@echo off

:: TODO: œ‘ æ√¸¡Ó
setlocal enabledelayedexpansion

set commands=
for /f "delims=" %%a in ('dir %~dp0pyenv-*.bat /a:-d /b') do (
    set tmp=%%a
    set tmp=!tmp:pyenv-=!
    set tmp=!tmp:.bat=!
    if "!commands!"=="" (
        set commands=!tmp!
    ) else (
        set commands=!commands! !tmp!
    )
)

setlocal disabledelayedexpansion

echo %commands%