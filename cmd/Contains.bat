@echo off
setlocal EnableDelayedExpansion
if [%1]==[] (
    echo Usage: ^<"sentence"^>
    echo Returns: 0 if all 26 letters present, 1 otherwise
) else (
    set alphas=a b c d e f g h i j k l m n o p q r s t u v w x y z
    set "sentence=%~1"
    call :ContainsAllLetters "!sentence!"
)
exit /b !errorlevel!

:ContainsAllLetters
set prevSentence=%~1
set unique=0
for %%l in (!alphas!) do (
    if "!prevSentence!"=="" goto breakLoop
    set "newSentence=!prevSentence:%%l=!"
    if not "!newSentence!"=="!prevSentence!" set /a unique=!unique!+1
    set "prevSentence=!newSentence!"
    rem echo !newSentence!
)
:breakLoop
@REM echo Unique letters !unique!
if !unique! lss 26 (exit /b 1) else (exit /b 0)

endlocal