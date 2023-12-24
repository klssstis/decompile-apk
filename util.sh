#!/bin/sh

function check() {

	if [ $# -ne 1 ]; 
		then
		echo "Please input an apk file"
		exit
	fi

	export param=$1
	export filename=${param##*/}
	export foldername=${filename%.apk}
	export absolutename=$(cd `dirname $param`; pwd)"/"${filename}

	local len=${#filename}

	if [ $len -le 4 ];
		then
		echo "Please input a correct apk file"
		exit
	fi

	if [ "${filename##*.}"x != "apk"x ];
		then
		echo "Please input a correct apk file"
		exit
	fi

	local output="output"
	if [ ! -d "$output" ];
		then
		mkdir $output
	fi

	cd $output

}
