#!/bin/sh
SCRIPT_DIR="$(dirname "$0")"
export SCRIPT_DIR

source $SCRIPT_DIR/util.sh
check $1

newfoldername=${foldername}"-jadx"
rm -rf $newfoldername

echo "View the decompile file"

#sh $SCRIPT_DIR/tools/jadx/bin/jadx -d $newfoldername $absolutename

sh $SCRIPT_DIR/tools/jadx/bin/jadx-gui $absolutename
