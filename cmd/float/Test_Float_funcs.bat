@echo off
setlocal enabledelayedexpansion
rem set decimals=0 -0 000 -000 0.0 -0.0 -00.000 000.000 000.0
 set decimals=0.1 0.123 -0.1 -0.123 123.345 -123.345 123 -345 -678.0000
for /f "tokens=1,2,3,4,5,6,7,8,9" %%a in ("!decimals!") do (
 call Float.bat :ToFraction "%%~a" outFloat
 echo !outFloat!
 call Float.bat :ToFraction "%%~b" outFloat
 echo !outFloat!
 call Float.bat :ToFraction "%%~c" outFloat
 echo !outFloat!
 call Float.bat :ToFraction "%%~d" outFloat
 echo !outFloat!
 call Float.bat :ToFraction "%%~e" outFloat
 echo !outFloat!
 call Float.bat :ToFraction "%%~f" outFloat
 echo !outFloat!
 call Float.bat :ToFraction "%%~g" outFloat
 echo !outFloat!
 call Float.bat :ToFraction "%%~h" outFloat
 echo !outFloat!
 call Float.bat :ToFraction "%%~i" outFloat
 echo !outFloat!
)
endlocal