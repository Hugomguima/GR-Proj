#!/usr/bin/env bash


# Add connection to internet
ssh -i .ssh/privBC.rsa theuser@192.168.88.101 -t ip r a default via 192.168.88.100
ssh -i .ssh/privBC.rsa theuser@192.168.88.102 -t ip r a default via 192.168.88.100

# Copy files to both machines
ssh -i .ssh/privBC.rsa theuser@192.168.88.101 -t mkdir -p /home/theuser/grs
ssh -i .ssh/privBC.rsa theuser@192.168.88.102 -t mkdir -p /home/theuser/grs
scp -i .ssh/privBC.rsa -r /home/theuser/grs/*  theuser@192.168.88.101:/home/theuser/grs
scp -i .ssh/privBC.rsa -r /home/theuser/grs/*  theuser@192.168.88.102:/home/theuser/grs

# Install docker on both machines
ssh -i .ssh/privBC.rsa theuser@192.168.88.101 -t /home/theuser/grs/installDocker.sh
ssh -i .ssh/privBC.rsa theuser@192.168.88.102 -t /home/theuser/grs/installDocker.sh

