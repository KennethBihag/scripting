@Echo Off
SetLocal EnableDelayedExpansion

For /F "delims=" %%f In ('Dir /B %1') Do (
    Call my_functions.bat CompressSpacesToUs "%%f"
    Echo !output!
)

EndLocal