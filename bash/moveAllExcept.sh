#! /bin/bash/

expectedArgs="<source directory> <exception file/dir> <target directory> "
expectedCount=3
actualArgs="$@"
actualCount=$#
export expectedArgs actualArgs expectedCount actualCount
./args_check.sh
if (($? > 0))
then exit 1
fi

source="$1"
except="$2"
target="$3"

pushd "$source"
tomove=$(ls -I "$except")
mv $tomove -t $target
popd

