#! /bin/bash
# functions
function showHelp(){
	echo '<sample> <func>'
	echo 'func:'
	echo '- reset'
	echo '- stat'
}

function resetRepo(){
	git status -s >/dev/nul 2>&1
	lastCode=$?
	if [ $lastCode -eq 0 ]
	then
		git reset --hard
		git clean -fx
		git fetch
		git pull
	fi
}



# main function
if [ $# -lt 1 ]
then
	showHelp
	exit 0
fi

case $1 in 'reset')

for d in */
do
	if [ -d "$d" ]
	then
		pushd "$d" 2>/dev/nul
		lastCode=$?
		if [ $lastCode -eq 0 ]
		then
			resetRepo
			popd
		fi
	fi
done
;;
'stat')
for d in */
do
	if [ -d "$d" ]
	then
		pushd "$d" 2>/dev/nul
		lastCode=$?
		if [ $lastCode -eq 0 ]
		then
			git status
			popd
		fi
	fi
done
;;
*)
echo No function called $1
exit 1
;;
esac
