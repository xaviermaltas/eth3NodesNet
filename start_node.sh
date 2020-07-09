#!/bin/bash

NODE_NAME=$1
NODE_ID=$2
NODE_IP=$3
NODE_PORT=$4
NET_ID=$5
NODE_RPC_PORT=$6

NODE_ACCOUNT=" "

PWD="$(pwd)"

SYSTEM_ACCOUNTS_FILE_PATH='accounts.txt'
line="${NODE_ID}p"

print_conf(){
    NODE_NAME=$1
    NODE_IP=$2
    NODE_PORT=$3

	echo "[*] Starting $NODE_NAME"
	echo " "
	echo "Directory: $PWD/$NODE_NAME"
	echo "Network: $NET_ID " 
	echo "$NODE_IP:$NODE_PORT , rpc: $NODE_RPC_PORT"
	echo " "
}

print_conf $NODE_NAME $NODE_IP $NODE_PORT

getNodeAccount(){
	NODE_ID=$1
	NODE_ACCOUNT=`sed -n $line $SYSTEM_ACCOUNTS_FILE_PATH`
	NODE_ACCOUNT="0x${NODE_ACCOUNT}"
	echo "$NODE_ACCOUNT"
}

getNodeAccount $NODE_ID


# ETH_STATS=" --ethstats $NODE_NAME@$NODE_IP:3000"

# geth --datadir node1/ --syncmode 'full' --port 30311 --rpc --rpcaddr 'localhost' --rpcport 8501 --rpcapi 'personal,db,eth,net,web3,txpool,miner' --bootnodes 'enode://6fee50f602ea84263b77d2730908adbb34e75d646d3ef9f5cec015693c31f0a0b22295c36e0fd892c6033d9f01c9697277fd96828fdfaff8f181c62bb8438971@127.0.0.1:30310' --networkid 1515 --gasprice '1' --unlock '0x39d4895806b8821b1b71ffd517666949db53ec5e' --password node1/password.txt --allow-insecure-unlock --verbosity 9

geth --datadir $NODE_NAME/ --syncmode 'full' --port $NODE_PORT --rpc --rpcaddr $NODE_IP --rpcport $NODE_RPC_PORT --rpcapi 'personal,db,eth,net,web3,txpool,miner' --rpccorsdomain https://remix.ethereum.org --bootnodes 'enode://6fee50f602ea84263b77d2730908adbb34e75d646d3ef9f5cec015693c31f0a0b22295c36e0fd892c6033d9f01c9697277fd96828fdfaff8f181c62bb8438971@127.0.0.1:30310' --networkid $NET_ID --gasprice '1' --unlock $NODE_ACCOUNT --password $NODE_NAME/password.txt --allow-insecure-unlock --verbosity 9 --mine