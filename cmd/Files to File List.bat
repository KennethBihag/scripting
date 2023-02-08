rem gives a list of all files (specified in args) in the current directory
@echo off
setlocal EnableDelayedExpansion
set outText=file_list.txt
if exist "!outText!" del "!outText!"
if [%~1]==[] ( set inFiles=*.* ) else ( set "inFiles=%~1" )
for %%f in (%inFiles%) do (
  for /f "tokens=1" %%g in ('attrib "%%f"') do (
    if [%%g]==[A] echo %%f>>"!outText!"
  )
)
endlocal