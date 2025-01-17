#!/bin/bash
SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
export SCRIPT_DIR

source $SCRIPT_DIR/util.sh
check $1

newfoldername=$foldername
rm -rf $newfoldername

function isEmptyDir(){ 
    return `ls -A $1|wc -w`
}

sh $SCRIPT_DIR/tools/apktool/apktool d -f $absolutename

if [ ! -d "$foldername" ];
	then
	echo "Resource files decompile failed"
	exit
fi

if isEmptyDir $foldername;
	then
	echo "Resource files decompile failed"
	exit
fi

echo "Resource files decompile successful"

cd $foldername
echo `pwd`

#sh $SCRIPT_DIR/tools/dex2jar/d2j-dex2jar.sh $absolutename

sh $SCRIPT_DIR/tools/dex-tools-2.x/d2j-dex2jar.sh $absolutename
suffix="-dex2jar.jar"
jarname=${foldername}${suffix}

if [ ! -f "$jarname" ];
	then
	echo "Dex file decompile failed"
	exit
fi

echo "Dex file decompile successful"

path=`pwd`
pathname=${path}"/"${jarname}
echo ${pathname}

foldname=${path}"/"${jarname}"_jadx"
rm -rf $foldname


sh /content/dec/tools/jadx/bin/jadx -d $foldname $pathname
#echo "View the decompile file"
#java -jar $SCRIPT_DIR/tools/jd-gui/jd-gui.jar $jarname
