#! /bin/bash
if [ -z "$1" ]
then
cat << message
This script checks if an argument string contains all letters of the
english alphabet. Counts the number of unique letters. Returns SUCCESS exit code
if count is 26
message
else
uniqueLetters=0
for l in {A..Z}
do
    echo "$1" | grep -i "$l" >> /dev/null && uniqueLetters=$(($uniqueLetters+1))
done
echo $uniqueLetters letters from A-Z
fi
if (($uniqueLetters < 26))
then
    exit 1
else
    exit 0
fi
