#!/bin/sh

source util.sh
check $1

newfoldername=${foldername}"-bytecodeviewer"
rm -rf $foldername

if [ ! -d "$newfoldername" ];
	then
	mkdir $newfoldername
fi

cd $newfoldername

echo `pwd`

echo "View the decompile file"

#java -jar ../../tools/bytecode-viewer/Bytecode-Viewer.jar -i $absolutename -o . -t all
java -jar ../../tools/bytecode-viewer/Bytecode-Viewer.jar
