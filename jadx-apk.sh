#!/bin/bash
SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
export SCRIPT_DIR

source $SCRIPT_DIR/util.sh
check $1

newfoldername=${foldername}"-jadx"
rm -rf $newfoldername

echo "View the decompile file"

sh $SCRIPT_DIR/tools/jadx/bin/jadx -d $newfoldername $absolutename
#sh $SCRIPT_DIR/tools/jadx/bin/jadx-gui $absolutename
