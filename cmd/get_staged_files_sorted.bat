@ECHO off
SETLOCAL ENABLEDELAYEDEXPANSION

IF EXIST temp.tmp DEL temp.tmp

set cmdStr=git status --short

FOR /F "tokens=2*" %%f IN ('%cmdStr%') do (
	set currFile=%%f%%g
	CALL my_functions.bat GetFileExt !currFile! output
    ECHO !output! !currFile!>>temp.tmp
)
FOR /F "tokens=1* usebackq" %%l IN (`SORT ^< temp.tmp`) DO ECHO %%~m
DEL temp.tmp

exit /b 0

endlocal