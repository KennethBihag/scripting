#! /bin/bash

if [ "$3" = "" ]
then
    echo 'USAGE: <ROWS> <COL NUM> <COMMAND>'
    exit 1
fi
i=0;
limit=$(($1+1))
while IFS=' ' read line
do
    i=$(($i+1))
    if [ $i -gt 1 ] && [ $i -le $limit ]
    then
        nCol=0
        for col in $line
        do
            nCol=$(($nCol+1))
            if [ $nCol -eq $2 ]
            then
                echo -e "COL$nCol - $col"
                break
            fi
        done
    elif [ $i -gt $limit ]
    then
        break
    fi
done < <($3)
