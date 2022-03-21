#!/usr/bin/env bash

HOME=/home/theuser


# Execute this script on both B and C computers

ip r a default via 192.168.88.100

# Give execute permission to all the files that will be executed
chmod 0744 $HOME/grs/BC/* $HOME/grs/netubuntu/*

# Files to be executed on both computers
$HOME/grs/BC/installDocker.sh
$HOME/grs/netubuntu/buildNetubuntu.sh

if [ $1 = "B" ]; then
    # Execute only in B
    $HOME/grs/BC/clientNetwork.sh
    $HOME/grs/BC/serverNetwork.sh
    $HOME/grs/BC/router.sh
else
    # Execute only in C
    $HOME/grs/BC/clientNetwork.sh
fi