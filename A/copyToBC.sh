#!/usr/bin/env bash

# Copy files to both machines
ssh -i .ssh/privBC.rsa theuser@192.168.88.101 -t mkdir -p ~/grs
ssh -i .ssh/privBC.rsa theuser@192.168.88.102 -t mkdir -p ~/grs
scp -i .ssh/privBC.rsa -r ~/grs/BC ~/grs/netubuntu  theuser@192.168.88.101:/home/theuser/grs
scp -i .ssh/privBC.rsa -r ~/grs/BC ~/grs/netubuntu  theuser@192.168.88.102:/home/theuser/grs

# Give permissions and execute run scripts on both machines
ssh -i .ssh/privBC.rsa theuser@192.168.88.101 -t chmod 0744 ~/grs/BC/runBC.sh
ssh -i .ssh/privBC.rsa theuser@192.168.88.101 -t ~/grs/BC/runBC.sh B
ssh -i .ssh/privBC.rsa theuser@192.168.88.102 -t chmod 0744 ~/grs/BC/runBC.sh
ssh -i .ssh/privBC.rsa theuser@192.168.88.102 -t ~/grs/BC/runBC.sh C
