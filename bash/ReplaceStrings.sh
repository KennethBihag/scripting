#! /bin/bash

origFile=$1
origStr=$2
newStr=$3
# get extension of orig. file
IFS='.'
filenameTkns=($origFile)
tkns=${#filenameTkns[@]}
if [ $tkns -gt 1 ]
then
	fExt=".${filenameTkns[$(($tkns-1))]}"
fi
unset IFS
# insert _ between file basename and extension for new file
newFile=${origFile}_
newFile=${newFile//$fExt/}
newFile=$newFile$fExt
echo Start edit from $origFile to $newFile
# create new file with replaced strings
origFileCtnt=$(cat $origFile)
newFileCtnt=${origFileCtnt//$origStr/$newStr}
echo "$newFileCtnt" > "$newFile"
