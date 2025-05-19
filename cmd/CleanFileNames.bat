@Echo Off
SetLocal EnableDelayedExpansion
Set /A files=0
For /F "delims=" %%f In ('Dir /B /S /A:-D %1') Do (
    Call my_functions.bat CompressSepsToUs "%%~nxf" "_- "
    If Not "%%~nxf"=="!output!" (
        Set /A files=!files!+1
        Ren "%%~ff" "!output!"
    )
)
If !files! GTR 1 Echo Renamed !files! files

EndLocal