#! /bin/bash
if [ "$1" = "" ]
then
	echo 'Usage : <input file> [output file]'
	echo -n 'Extracts some strings from a file and modifies the/creates another file'
	echo ' with the extracted strings (modified or not)'
	exit 1
fi

fPath="$1"
outPath=${2:-"${fPath//.cs/.py}"} # code to set output file name
reClassName='(?<=class )(\w*)(?= : DerivedObject)' # regular expression of exact string to extract
reClassDecl='public class \w* : DerivedObject' # regular expression for line of string to extract
#charsToRemoveFromCsName=2
# template string to write to output file
pyClassTemplate='
class PYCLASSNAME(CSCLASSNAME):
    pass
'
pyClassTemplate=${pyClassTemplate:1}

exec 4>tmp
i=0
maxCount=9999
while IFS='' read -er lin
do
    expr "$lin" : "\($reClassDecl\)" > /dev/null
	if (($? == 0))
	then
	i=$(($i+1))
	csClassName=$(echo "$lin" | grep -oP "$reClassName")
	#pyClassName=${csClassName:$charsToRemoveFromCsName}
	pyClassName="$csClassName"
	currPyClass="${pyClassTemplate//PYCLASSNAME/$pyClassName}"
	currPyClass="${currPyClass//CSCLASSNAME/$csClassName}"
	echo "$currPyClass" >> tmp
	#echo "$currPyClass"
	fi
	if (($i == $maxCount))
	then
		break
	fi
done < "$fPath"
exec 4>&-
# mv -f tmp "$outPath"
cat tmp >> "$outPath"

exit 0
