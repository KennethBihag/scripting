#! /bin/bash/
# Renames all files matched by some pattern
if [ -z $2 ]
then
    echo 'Usage: '
    echo "<'original file path(s)'> <old pattern in name to replace> [new pattern]"
    exit 1
fi
oPattern=$2
nPattern=$3
while ifs='' read -r fileName
do
 newFileName=${fileName//$oPattern/$nPattern}
 # echo -e "From:\n\t$fileName"
 # echo -e "To:\n\t${fileName//$oPattern/$nPattern}"
 mv "$fileName" "$newFileName"
done < <(ls $1)

exit 0
