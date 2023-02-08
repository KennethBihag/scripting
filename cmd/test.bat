@ECHO OFF
SetLocal  EnableExtensions EnableDelayedExpansion
ECHO testing...

set testStr1="She sells seashells by the seashore"
set testStr2="The quick brown fox jumps over the lazy dog."

rem test custom module
call strlen.bat %testStr1%
call strlen.bat "Hello"
rem echo !var1! %var1%
call Contains.bat %testStr1%
echo %errorlevel%
call Contains.bat %testStr2%
echo %errorlevel%

rem test GetFileExt
CALL my_functions GetFileExt "folder1\folder2\filename.json"
ECHO extension is !output!
CALL my_functions GetFileExt "folder with\some spaces\file with.more.than one.dot.txt"
ECHO extension is !output!

CALL my_functions CompressSpacesToUs "  abc de   fgh.i.j.pdf"
ECHO new name:!output!
EndLocal