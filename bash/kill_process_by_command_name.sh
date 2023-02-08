#! /bin/bash
if [ -z "$1" ]
then
    echo "
Usage: stopIW <process path pattern>
"
    exit 1
fi

proc_to_stop="$1"

psresult=$(ps aux -W | grep "$proc_to_stop")

if [ -z "$psresult" ]
then
    echo "No $proc_to_stop running found..."
    exit 2
fi

pids=
i=0
for f in $psresult
do
    i=$(($i+1))
    if (( i==4 ))
    then
        pids="$pids $f"
    fi
    if [ $i -ge 8 -a -n "$(echo "$f" | grep '.*.exe')" ]
    then
        i=0
    fi
done

for pid in $pids
do
    taskkill -f -pid $pid
done
