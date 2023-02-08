#! /bin/bash

if [ -z "$1" ]
then
cat << static
# Usage: $0 <func_name> [return_name] [args...]
Usage: $0 <func_name> [args...]
static
exit 1
fi

function toDelimitedList(){
    # if [ -z $3 -o "${#2}" -ne "1" ]
    if [ -z "$2" -o "${#2}" -ne "1" ]
    then
        echo Invalid args for toDelimitedList function
        # echo Usage: toDelimitedList \<return_name\>\<Directory\> \<delim\>
        echo Usage: toDelimitedList \<Directory\> \<delim\>
        return 2
    fi
    folder="$1"
    delim=$2
    delimitedList=
    for j in $(find "$folder" -name "*.jar")
    do
        if [ -n "$delimitedList" ]
        then
            delimitedList="$delimitedList$delim$j"
        else
            delimitedList="$j"
        fi
    done
    if [ -z "$delimitedList" ]
    then return 2
    fi
    # eval "$3=\"$delimitedList\""
    # eval "export $3"
    echo "$delimitedList"
    return 0
}

case $1 in
    'toDelimitedList')
        # toDelimitedList "$3" "$4" $2 ;;
        toDelimitedList "$2" "$3" ;;
    *)
        echo No such function!
        exit 1;;
esac
