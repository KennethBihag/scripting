#! /bin/bash

actualArgs=$@
expectedArgs="<file path 1>:<string to be replace>:<string to replace>"
export actualArgs expectedArgs actualCount=$# expectedCount=3
./args_check.sh
lastCode=$?
if (($lastCode > 0))
then echo Failed && exit 1
fi

: '
Version 1
Save in a string variable all the contents of file 1
trailing blank lines are trimmed
'

replacedString="$2"
replaceString="$3"
text="$(cat "$1")"
newText=${text//$replacedString/$replaceString}
orgFile="$1"
echo "$newText">"${orgFile//.txt/_out.txt}"