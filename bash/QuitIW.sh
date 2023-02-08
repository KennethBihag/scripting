#! /bin/bash/

: '
# use env var to set dir from other working dir
myBashScriptsDir="/c$HOMEPATH/personal repository/bash"
myBashScriptsDir="${myBashScriptsDir//\\//}"
'
myBashScriptsDir=.
procToStop=IWDesktop.exe
# echo "$myBashScriptsDir/kill_process_by_command_name.sh $procToStop"
"$myBashScriptsDir/kill_process_by_command_name.sh" $procToStop

sleep 1
exit 0
