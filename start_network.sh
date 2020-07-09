#!/bin/bash
echo "-----------------"
echo "| START NETWORK |"
echo "-----------------"

SYSTEM_IP="127.0.0.1"
SYSTEM_PORT=30310
SYSTEM_RPC_PORT=8500
SYSTEM_NETWORK_ID=1515
SYSTEM_NUMNODES=3


BOOTNODE_IP=$SYSTEM_IP
BOOTNODE_PORT=$SYSTEM_PORT
BOOTNODE_KEY="boot.key"

tab=" --tab"

# 1. Clean Environment

# 2. Regenesis all nodes
./reGenesisAll.sh

# 3. Start bootnode
# ./start_bootnode.sh "127.0.0.1" 30310 "boot.key"
bootnodeActions="./start_bootnode.sh $BOOTNODE_IP $BOOTNODE_PORT $BOOTNODE_KEY"
gnome-terminal --tab -e "${bootnodeActions}"


# 4. Start nodes
# ./start_node.sh "node1" 1 "127.0.0.1" 30311 ? 1515 8501
optionsNodes=()
for(( i=1; i<=$SYSTEM_NUMNODES; i++ ))
do
    startNodeAction[i]="./start_node.sh "node$i" $i $SYSTEM_IP $((SYSTEM_PORT+i)) $NET_ID $SYSTEM_NETWORK_ID $((SYSTEM_RPC_PORT+i))"
done

for(( i=1; i<=$SYSTEM_NUMNODES; i++ ))
do
    optionsNodes+=($tab -e "bash -c ' ${startNodeAction[i]}; bash'" )
done


sleep 5

gnome-terminal "${optionsNodes[@]}"

sleep 3

# One node attach 
node1Attach="geth attach node1/geth.ipc"
instrucctions1NodeAttach+=($tab -e "bash -c '${node1Attach}; bash'")
gnome-terminal "${instrucctions1NodeAttach[@]}"


