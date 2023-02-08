#! /bin/bash
if [ "$2" = "" ]
then
	echo Usage : \<Unmatched string\> \<command string\> [StopWhenFound: 1]
	exit 1
fi
test $3 -eq 1 2> /dev/null
stopWhenFound=$?
unmatchedString=$1
while IFS=' ' read -r lin
do
#	if [ "$(echo "$lin"|grep "$unmatchedString")" = "" ]
	test ! -z "$(echo "$lin"|grep "$unmatchedString")"
	if [ $? = 1 ]
	then
		echo "$lin"
	elif [ $stopWhenFound = 0 ]
	then
		break;
	fi
done < <($2)
exit 0