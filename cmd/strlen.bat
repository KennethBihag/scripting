@echo off
SetLocal EnableDelayedExpansion

rem a module, call only from another script
rem no escape sequence needed for input string
set str=%~1
if !str!==[] (
    echo Please provide a string as argument!
    exit /b 1
)

call :strLen
rem echo String is %ret% characters long
goto :exit

:strLen
set len=0
:strLen_Loop
if not "!str:~%len%!"=="" (
 set /A len+=1
 goto :strLen_Loop
)
EXIT /B 0

:exit
EndLocal & Set len2=%len%
