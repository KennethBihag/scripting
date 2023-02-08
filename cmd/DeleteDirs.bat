@echo off
rem deletes all directories and subdirectories of some name the current dir
SetLocal EnableDelayedExpansion
set "extToDel=%~1"
call strlen.bat "!extToDel!" len
if not defined extToDel (
    echo USAGE : ^<folder name^>
    echo Delete all folders of some name in the current dir.
    exit /B 1
)
for /F "tokens=*" %%d in ('dir /AD /S /B') do (
 set directory=%%d
 if exist "!directory!" (
  if "!directory:~-%len%,%len%!"=="!extToDel!" (
   rmdir /S /Q "!directory!"
  )
 )
)
EndLocal