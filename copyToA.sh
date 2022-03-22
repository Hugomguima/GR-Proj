#!/usr/bin/env bash

HOME=/home/theuser

# Copies all the files to the VM A
ssh -i g.rsa theuser@192.168.109.154 -t mkdir -p $HOME/grs
scp -i g.rsa -r A BC netubuntu server  theuser@192.168.109.154:$HOME/grs