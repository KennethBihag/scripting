#! /bin/bash
if [ "$3" = "" ]
then
	echo Usage : \<old string reg ex\> \<new string\> \<file\>
	echo This only works for files with an empty line as last line
	exit 1
fi
regEx="$1"
newStr="$2"
fPath="$3"
exec 4>tmp
# n=0;
while IFS='' read -er lin
do
	# n=$(($n+1))
    oldStr="$(expr "$lin" : ".*\($regEx\).*")"
	echo "${lin//$oldStr/$newStr}" >&4
	: ' diffing line by line
	if [ $n -gt 60 ]
	then
		echo "- $lin"
		echo "+ ${lin//$oldStr/$newStr}"
	fi '
done < "$fPath"
exec 4>&-
mv -f tmp "$3"
exit 0
