@ECHO off
REM automatically moves all "Segment*.off" to a specified folder and renamed to
REM "^<chosen name^>*.off"
SETLOCAL ENABLEDELAYEDEXPANSION
SET fileWC=%~1
SET subStr=%~2
SET newDir=%~3
SET newName=%~4
IF NOT DEFINED newName (
 ECHO ^<file wildcard^> ^<substring to rename^> ^<Directory to move files to^> ^<New name of files^>
 EXIT /B -1
) ELSE (
 CALL :move_file
 EXIT /B 0
)

:move_file
IF NOT EXIST "!newDir!" MKDIR "!newDir!"
FOR %%o IN (!fileWC!) DO (
 ECHO %%o
 COPY /V /Y "%%o" "!newDir!"
 )
PUSHD "!newDir!"
FOR %%p IN (!fileWC!) DO (
 SET tmp=%%p
 SET "tmp=!tmp:%subStr%=%newName%!"
 RENAME "%%p" "!tmp!"
 )
POPD
DEL !fileWC!
ENDLOCAL