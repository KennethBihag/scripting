# script to search for matching strings in all files in a directory and its subdirectories
$pathToFind='*.*'
$dirToSearch='.'
if($args[0] -eq $null){
	$txtToFind='webviewer.setSPPDebug'
} else{
	$txtToFind=$args[0]
		if($args[1] -ne $null){
			$pathToFind=$args[1]
			if($args[2] -ne $null){
				$dirToSearch=$args[2]
			}
		}
}
# echo "TEXT : $txtToFind"
# echo "PATH : $pathToFind"
# echo "DIR : $dirToSearch"
echo ("$dirToSearch\" + $pathToFind)
dir -path ("$dirToSearch\"+$pathToFind) -recurse | foreach-object {
	select-string  "$txtToFind" $_ -casesensitive -list -simplematch |
	  select-object -property path,linenumber
}