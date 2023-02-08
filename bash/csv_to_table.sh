#! /bin/bash/
if [ -z "$1" ]
then
    echo 'Formats a csv from <COL_NAMES,values ...> per row to
    <COL_NAME_X,COL_NAME_Y,...>'
    exit 1
else
    if [ $(echo "$1"|grep '.csv$') ]
    then
        orig_csv="$1"
        echo "Opening $orig_csv"
    else
        echo "File is not a csv"
        exit 2
    fi
fi

table_csv=${orig_csv//.csv/_formatted.csv}

while IFS= read line
do
    echo "$line"
done < "$orig_csv"
