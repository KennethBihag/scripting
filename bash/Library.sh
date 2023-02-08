#! /bin/bash
if [ "$1" = "" ]
then
    echo No function and args specified
    exit
fi
lastIndex=$(($(expr length "$0")-10))
for d in $( echo "$0" | cut -c 1-$lastIndex )
do
     baseDir=$d
done
case $1 in
    "Get-FilesFromDir")
    $baseDir/Get-FilesFromDir.sh $2 $3
    ;;
    "Search-FilesForString")
    $baseDir/Search-FilesForString.sh $2 $3
    ;;
    "Delete-DirsFilesExcept")
    $baseDir/Delete-DirsFilesExcept.sh "$2"
    ;;
    *)
    echo Not implemented
    ;;
esac