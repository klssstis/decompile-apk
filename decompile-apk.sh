#!/bin/sh
SCRIPT_DIR="$(dirname "$0")"
export SCRIPT_DIR

arg=$1

function input() {
	if [ $1 = true ]; 
		then
		echo "You can choose the following three ways to decompile an apk file"
		echo "1: using apktool/dex2jar/jd-gui to decompile apk"
		echo "2: using ClassyShark to decompile apk"
		echo "3: using jadx to decompile apk"
		echo "4: using bytecode-viewer to decompile apk"
		echo "q: exit"
	fi

	read -p "Please input your choice(1, 2, 3, 4):" input
	
	case $input in
		1)
		bash $SCRIPT_DIR/jdgui-apk.sh $arg
		;;
		2)
		bash $SCRIPT_DIR/classyshark-apk.sh $arg
		;;
		3)
		bash $SCRIPT_DIR/jadx-apk.sh $arg
		;;
		4)
		bash bytecode-viewer.sh $arg
		;;
		q)
		exit
		;;
		*)
		input false
		;;
	esac
}

input true
