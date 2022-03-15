#!/usr/bin/env bash

# Copies all the files to the VM A
ssh -i g.rsa theuser@192.168.109.154 -t mkdir -p /home/theuser/grs
scp -i g.rsa -r *  theuser@192.168.109.154:/home/theuser/grs