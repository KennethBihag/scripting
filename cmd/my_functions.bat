:main
@REM TODO: Check all functions except CompressSepsToUs
@Echo Off
SetLocal EnableExtensions EnableDelayedExpansion
set output=
IF [%~1]==[] (
  ECHO ^< function name ^> ^< [arg1] [arg2 ...] ^>
  EXIT /B 0
)

SET funcName=%~1
:setNewArgs
For /L %%a In (2,1,16) Do (
    Call Set tArg=%%%%a
    If Defined tArg (
        Set args=!args! !tArg:^&=and!
    ) Else (
        Goto :break
    )
)
:break

CALL :!funcName! !args!
@REM TODO: handle last arg
@REM IF not [%~3]==[] SET %3=!output!
EndLocal & Set output=%output%
EXIT /B 0

rem functions
 rem param 1: array, param 2: pos, param 3: result character
:get_char_at
  SET array=%~1
  SET pos=%~2
  for /L %%L in (0,1,1024) do (
    IF %%L gtr %pos% ( 
	  GOTO :return
	)
    SET ch=!array:~%%L,1!
	IF not defined ch ( 
	  SET ch=\0
	  GOTO :return
	) else (
	  IF "%%L"=="%pos%" (
	    IF "!ch!"==" " SET ch=\s
		GOTO :return
	  )
	)
  )
:return
  SET %~3=!ch!
EXIT /B 0

 rem get vertex count and face count of an OBJ file
 rem :GetMeshDataCount <obj file path> <number of vertices variable> <number of faces variable>
 :GetMeshDataCount
SET numVertices=0
SET numFaces=0
for /f  %%f in ('type %1') do (
	SET tkn=%%f
	SET tkn=!tkn:~0,1!
	IF "!tkn!"=="v" SET /a numVertices = !numVertices! + 1
	IF "!tkn!"=="f" SET /a numFaces = !numFaces! + 1
)
SET %2=!numVertices!
SET %3=!numFaces!
IF !numVertices! lss 3 ( SET %4=false ) else ( SET %4=true )
EXIT /B 0

rem recursively get extension of file where a dot appears more
rem than once
:GetFileExt
SET fp=%~1
FOR /F "delims=. tokens=1*" %%c IN ("%fp%") DO (
	set xTmp=%%d
	IF NOT DEFINED xTmp (
		ECHO No extension
		GOTO :ret
	) ELSE (
		CALL :GetFileExtHelper "%%~d" finalExt
		SET output=!finalExt!
	)
)
:ret
EXIT /B 0
:GetFileExtHelper
SET fp=%~1
FOR /F "delims=. tokens=1*" %%c IN ("%fp%") DO (
	SET xTmp=%%d
	IF NOT DEFINED xTmp (
		set %2=%%c
	) ELSE (
		CALL :GetFileExtHelper "%%~d" outExt
		SET %2=!outExt!
	)
)
EXIT /B 0

:CompressSepsToUs
SET "fp=%~1"
SET "seps=%~2"
CALL :csstuhelper "!fp!"
EXIT /B 0
:csstuhelper
FOR /F "tokens=1* delims=%seps%" %%c IN ("%~1") DO (
    IF "!output!"=="" (SET "output=%%c") ELSE (SET output=!output!_%%c)
    IF NOT "%%d"=="" CALL :csstuhelper "%%~d"
)
EXIT /B 0