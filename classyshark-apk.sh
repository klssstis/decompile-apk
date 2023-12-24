#!/bin/sh
SCRIPT_DIR="$(dirname "$0")"
export SCRIPT_DIR

source $SCRIPT_DIR/util.sh
check $1

newfoldername=${foldername}"-classyshark"
rm -rf $foldername

if [ ! -d "$newfoldername" ];
	then
	mkdir $newfoldername
fi

cd $newfoldername

echo `pwd`

echo "View the decompile file"

java -jar $SCRIPT_DIR/tools/classyshark/ClassyShark.jar -export $absolutename
#java -jar $SCRIPT_DIR/tools/classyshark/ClassyShark.jar -open $absolutename
