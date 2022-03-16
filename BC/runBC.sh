#!/usr/bin/env bash

# Execute this script on both B and C computers

ip r a default via 192.168.88.100

# Give execute permission to all the files that will be executed
chmod 0744 ~/grs/BC/* ~/grs/netubuntu/*

# Files to be executed on both computers
~/grs/BC/installDocker.sh
~/grs/netubuntu/buildNetubuntu.sh

if [ $1 = "B" ]; then
    # Execute only in B
    echo "B"
else
    # Execute only in C
    echo "C"
fi