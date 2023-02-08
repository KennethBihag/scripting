#! /bin/bash

function in_array()
{
    w="$1"
    arr="$2"
    for a in $arr
    do
        echo "$a" | grep "$w" > /dev/null
        if (($? == 0))
        then
            return 0
        fi
    done

    return 1
}

function get_index(){
    w="$1"
    arr="$2"
    i=0
    for a in $arr
    do
        echo "$a" | grep "$w" > /dev/null
        if (($? == 0))
        then
            return $i
        fi
        i=$(($i+1))
    done

    return -1
}

if [ -z "$1" ]
then
    echo Usage: $0 \<file path\>
    exit 1
fi

contentPath="$1"
content=($(cat "$contentPath"))
words=
counts=()

for word in ${content[@]}
do
    in_array "$word" "$words"
    if (($? == 0))
    then
        get_index "$word" "$words"
        echo $?
    else
        words="$words $word"
        counts=(${counts[@]} 1)
    fi
done

echo $words
echo ${counts[@]}