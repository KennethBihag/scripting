@Echo OFF
REM division function for integers but returns
REM a float of any precision
SetLocal EnableDelayedExpansion

:check the parameters
If "%1"=="" ( Exit /B -1) Else (Set "dividend=%~1")
If "%2"=="" (Exit /B -1) Else (Set "divisor=%~2")
If "!divisor!"=="0" Exit /B -2
Set "precision=%~3"
If Not Defined precision (Set precision=16) Else (Set "precision=%~3")
:getIntPart
Set /A rmn=!dividend!%%!divisor!
Set /A wholeNum=!dividend!/!divisor!
:getSign
If !dividend! GTR 0 (
 If !divisor! GTR 0 (
  Set isPos=1
 ) Else (
  Set isPos=-1
 )
) Else (
 Set /A rmn=-!rmn!
 If !divisor! GTR 0 (
  Set isPos=-1
 ) Else (
  Set isPos=1
 )
)
:getDecimalPart
Set decPart=
If !rmn! GTR 0 (
 If !wholeNum! EQU 0 (
  If !isPos! EQU -1 (
   Set "wholeNum=-0"
  )
 )
 If !precision! GTR 0 Set decPart=!decPart!.
 Call :getDecimal !rmn! !divisor! precision decPart
)
Set quotient=!wholeNum!!decPart!
Echo Final Answer : !quotient!
Exit /B	

:getDecimal
Set "prevRmdr=%~1"
If !%3! LEQ 0 (goto :eof) Else (
 If "!prevRmdr!"=="0" (goto :eof)
)
Set /A %3-=1
Set divisor=%2
Set /A currQuo=!prevRmdr!*10/!divisor!
Set /A currRmdr=!prevRmdr!*10%%!divisor!
If !currQuo! LSS 0 Set /A currQuo=-!currQuo!
Set %4=!%4!!currQuo!
Call :getDecimal !currRmdr! !divisor! %3 %4
goto :eof				
EndLocal