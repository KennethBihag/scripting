#! /bin/bash

# Tested to work properly if parts are 2,4,or 8
# Other values work but putting back the parts
# after doesn't seem to give a good file

infile="$1"
parts=$2

fname=$(echo "$infile" | awk -F'/' '{print $NF}')
opath="${infile//$fname/merged_$fname}"
rm -f "$opath"

for i in $(seq 1 $parts); do
    j=$(($i-1))
    actPath="${infile//$fname/${j}_$fname}"
    cat "$actPath" >> "$opath" 2>/dev/null
    if (($i==1))
    then
        chmod --reference="$actPath" "$opath"
    fi
done
