@Echo Off
SetLocal EnableDelayedExpansion
Rem breaks a string to lines
Rem the string is formatted like the PATH env. var.

Set str="%~1"
Set str=%str:;=" "%
For %%l In (%str%) Do (
    Echo %%l
)

EndLocal
