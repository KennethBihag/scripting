#! /bin/bash

# if firstArg, expectedCount is not exported from client script
# firstArg="$1"

IFS=:
expectedArgs=($expectedArgs)
IFS=
if [ -z "${actualArgs[0]}" ] || [ $actualCount -lt $expectedCount ]
then
    echo -n "USAGE: "
    for ea in ${expectedArgs[@]}
    do echo -n "$ea "
    done
    echo ""
    exit 1
else
    exit 0
fi
