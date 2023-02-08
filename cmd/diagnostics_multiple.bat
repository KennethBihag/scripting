@echo off
rem Gives a space delimited file for diagnostics of multiple
rem instances of an image/process
setlocal EnableDelayedExpansion

set "imageName=%~1"
if [!imageName!]==[] (
 call :PrintHelp
 exit /B 1
)
set outFile=!imageName!_diag.txt
if exist !outFile! del !outFile!
ECHO Program : Running diagnostics for all !imageName! running...
rem call :ShowTime hours minutes seconds
rem echo !hours! - !minutes! - !seconds!
call :ShowTime allTime
echo Started at !allTime!
echo Time PID MemoryUsage CPUTime>>!outFile!
for /L %%i in (1,1,1000000) DO (
 for /L %%j in (1,1,10000) do call
 rem call :ShowTime hours,minutes,seconds
 rem echo !hours! - !minutes! - !seconds!
 call :ShowTime allTime
 for /f "tokens=2,5,9" %%f in ('TASKLIST /FI "IMAGENAME eq !imageName!" /V /NH') do (
  set "pid=%%~f"
  set memUsage=%%g
  set cpuTime=%%h
  if "%%f %%g %%h"=="No running specified" goto :done
  echo !allTime! %%f %%g %%h>>!outFile!
 )
)
:done
call :ShowTime allTime
echo Ended at !allTime!
exit /B 0
endlocal
rem functions
:PrintHelp
echo Diagnostics.bat ^< Program ^>
Exit /B 0
:ShowTime
set /a A=0
for /f "tokens=5" %%f in ('echo.^|time') do (
 set /a A=A+1
 if !A! lss 2 (
  REM for /f "delims=: tokens=1,2,3" %%g in ("%%f") do (
   REM set %1=%%g
   REM set %2=%%h
   REM set %3=%%i
  REM )
  set %1=%%f
 )
)
exit /b 0