#!/bin/bash
if [[ ! $# -eq 1 ]] ; then
    echo "Error with parameters"
    exit 1
fi
NODE_NAME="$1"
# echo "Execute at /network"
echo " "

if [ -d "$NODE_NAME" ]; then

    cd $NODE_NAME
    echo "[*] Regenesis of the $NODE_NAME"
    echo "Directory : $(pwd)"
else
    echo "[*] $NODE_NAME does not exist!"
fi

# cd $NODE_NAME

if [ -d "geth/" ];then
    cd geth/
    [ -d chaindata/ ] && echo "Deleting Chain Data Directory" && rm -rf chaindata/
    [ -d lightchaindata/ ] && echo "Deleting Light Chain Data Directory" && rm -rf lightchaindata/
    [ -d nodes/ ] && echo "Deleting Nodes Directory" && rm -rf nodes/
    [ -e LOCK ] && echo "Deleting LOCK" && rm -r LOCK
    [ -e transactions.rlp ] && echo "Deleting transactions.rlp" && rm -r transactions.rlp
fi

cd ..
cd ..

geth --datadir=./$NODE_NAME init genesis.json
