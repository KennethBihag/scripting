@Echo off
setlocal enabledelayedexpansion
Set addend1=%1
Set addend2=%2
Set precision=%3
If Not defined precision Set precision=2
:separateIntegerAndDecimal
For /F "delims=. tokens=1,2" %%d In ("!addend1!") Do (
 Set "whole1=%%d"
 If Not "%%e"=="" (
  Set decimal1=%%e
  if "!whole1:~0,1!"=="-" set /a decimal1=-!decimal1!
 )
)
For /F "delims=. tokens=1,2" %%d In ("!addend2!") Do (
 Set whole2=%%d
 If Not "%%e"=="" (
  Set decimal2=%%e
  if "!whole2:~0,1!"=="-" set /a decimal2=-!decimal2!
 )
)
Set /A wholeAns=!whole1!+!whole2!
If Not Defined decimal1 (
 If Not defined decimal2 Goto :Done
)
:alignDecimals
Set i=0
:loop1
If !i! EQU !precision! goto :AddDecimals
Set tkn11=!decimal1:~%i%,1!
Set tkn21=!decimal2:~%i%,1!
Set /A i+=1
if not defined tkn11 (
 if defined tkn21 (Set tmpDec1=!tmpDec1!0) Else (
  goto :AddDecimals
 )
) Else (
 Set tmpDec1=!tmpDec1!!tkn11!
)

if not defined tkn21 (
 if defined tkn11 Set tmpDec2=!tmpDec2!0
 ) Else (
 Set tmpDec2=!tmpDec2!!tkn21!
)
set j=!j!9
goto :loop1
:AddDecimals
set /a tmpDec1+=!tmpDec2!
set decimal1=!tmpDec1! & set decimal2= & ^
set tmpDec1= & set tmpDec2=
if %decimal1% GTR %j% (
 set tmpWhole=!decimal1:~,1!
 set /a wholeAns+=!tmpWhole!
 set decimal1=!decimal1:~1,%precision%!
)
:Done
Echo Final answer : %wholeAns%.%decimal1%
endlocal