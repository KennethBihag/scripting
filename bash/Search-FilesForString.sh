#! /bin/bash/
for shDir in $( echo $0 | cut -c 1-$(($(expr length $0)-24)) )
do
	if [ "$baseDir" = "" ]
	then
		baseDir=$shDir
	fi
done
if [ "$2" = "" ]
then
	echo USAGE : \< \WILDCARD FOR FILENAME\ \> \< STRING PATTERN TO FIND\>
	exit
fi
extVar="$1"
export extVar
while read -r line
do
	for LINE in "$(grep -n "$2" "$line" 2>/dev/null)"
	do
		if [ "$LINE" != "" ]
		then
			echo RESULT IN FILE $line : 
			while IFS=  read rLine
			do
				echo -e "\t$rLine"
			done < <(echo -e "$LINE" | cat)
		fi
	done
	#echo File - $line :
	#grep -n $2 "$line" 2>/dev/null
done < <($baseDir/./Get-FilesFromDir.sh)