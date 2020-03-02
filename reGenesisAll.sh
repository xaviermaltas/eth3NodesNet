#!/bin/bash

StringVal="node1 node2 node3"
echo "-----------------------"
echo "| ALL NODES REGENESIS |"
echo "-----------------------"

# Iterate the string variable using for loop
for val in $StringVal; do
    # echo $val
    # NODE_NAME=$val


    # # echo "Execute at /network"
    # echo " "
    # echo " - Regenesis of $NODE_NAME"

    # cd identities/$NODE_NAME
    # echo "Directory : $(pwd)"

    # # cd $NODE_NAME

    # if [ -d "geth/" ];then
    #     cd geth/
    #     [ -d chaindata/ ] && echo "Deleting Chain Data Directory" && rm -rf chaindata/
    #     [ -d lightchaindata/ ] && echo "Deleting Light Chain Data Directory" && rm -rf lightchaindata/
    #     [ -d nodes/ ] && echo "Deleting Nodes Directory" && rm -rf nodes/
    #     [ -e LOCK ] && echo "Deleting LOCK" && rm -r LOCK
    #     [ -e transactions.rlp ] && echo "Deleting transactions.rlp" && rm -r transactions.rlp
    # fi

    # cd ..
    # cd ..
    # cd ..

    # geth --datadir=./identities/$NODE_NAME init genesis.json

    
    ./reGenesis.sh $val

done
