#!/bin/bash

BOOTNODE_IP=$1
BOOTNODE_PORT=$2
BOOTNODE_KEY=$3

echo "-----------------------"
echo "| STARTING A BOOTNODE |"
echo "| > $BOOTNODE_IP:$BOOTNODE_PORT   |"
echo "-----------------------"

bootnode --nodekey $BOOTNODE_KEY -verbosity 9 -addr :$BOOTNODE_PORT