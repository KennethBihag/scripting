set precision=50
call %*
exit /b 0
:ToFraction
rem convert from decimal with denominator of power of 10
set o=
set p=
set q=
set sign=+
set "r=%~1"

for /f "delims=. tokens=1,2" %%d in ("!r!") do (
 set /a p=%%d
 if "%%e"=="" (
  set q=1
 ) else (
 
 
  set /a q=%%e
 )
)
set %2=p=!p! q=!q! o=!o!
goto :eof