#! /bin/bash
dirToIgnore="$1"
if [ "$dirToIgnore" = "" ]
then
	echo This script deletes all files and folders in the current \
		working directory except an ignored folder wildcard
	echo USAGE : \[ \'DIR TO IGNORE\': default, all hidden paths\]
	exit 1
else
	echo Deleting files and folders but "$dirToIgnore"
fi
while IFS=' ' read -r path
do
	if [[ "$path" != $dirToIgnore ]]
	then
	 rm -r "$path"
	fi
done < <(ls * -d)