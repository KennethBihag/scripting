#! /bin/bash/
if [[ "$2" == "" && "$extVar" == "" ]]
then
	echo Usage : \< DIR \> \< \"CASE INSENSITIVE WILDCARD FOR FILENAME\"\>
	echo shows all paths matching the WILDCARD in DIR
	exit
elif [[ "$extVar" != "" ]]
then
	sDir=./
	patt="$extVar"
else
	sDir="$1"
	patt="$2"
fi
while IFS=' ' read -r filePath
do
	if (ls -ld "$filePath" | grep "^-" >/dev/null)
	then 
		echo $filePath
	fi
done < <(find "$sDir" -iname "$patt")