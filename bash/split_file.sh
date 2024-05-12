#! /bin/bash

# Tested to work properly if parts are 2,4,or 8
# Other values work but putting back the parts
# after doesn't seem to give a good file

infile="$1"
parts=$2

if [ ! -a "$infile" -o -z "$infile" ]
then
    exit 1
fi

fname=$(echo "$infile" | awk -F'/' '{print $NF}')

if (($parts<2))
then
    echo Must be more than 1 part
    exit 2
fi

toks=($(ls -l "$infile"))
isize=${toks[4]}
size=$(($isize/$parts))

if (($size<1))
then
    echo Too many parts
    exit 3
fi

echo Splitting $infile to $parts $size-byte parts

i=0
toSkip=0
while (($parts>1))
do
    ofile=${infile//$fname/${i}_$fname}
    dd bs=1 count=$size skip=$toSkip if="$infile" iflag=binary of="$ofile" oflag=binary &
    i=$(($i+1))
    toSkip=$(($i*$size))
    isize=$(($isize-$size))
    parts=$(($parts-1))
done

ofile=${infile//$fname/${i}_$fname}
dd bs=1 count=$size skip=$toSkip if="$infile" iflag=binary of="$ofile" oflag=binary


