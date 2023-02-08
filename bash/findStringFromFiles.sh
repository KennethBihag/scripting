#! /bin/bash

expectedArgs="<directory of files>:<pattern>"
expectedCount=2
actualArgs=$@
actualCount=$#

export expectedArgs expectedCount actualArgs actualCount
./args_check.sh
cod=$?
if (($cod > 0))
then exit $cod
fi

sourceDir="$1"
targetStr="$2"
for f in $(ls -d $sourceDir/*)
do
    if [ ! -d "$f" ]
    then
        lines=$(grep "$targetStr" "$f" 2>/dev/null)
        if [ -n "$lines" ]
        then
            echo "$f":
            while IFS= read line
            do
                echo -e "\t$line"
            done < <(echo "$lines")
        fi
    fi
done
