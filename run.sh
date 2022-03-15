#!/usr/bin/env bash

# File meant to run on your machine to copy files to the machine A and execute them there

chmod 0744 *.sh *.py
./copyToA.sh

ssh -i g.rsa theuser@192.168.109.154 -t chmod 0744 /home/theuser/grs/*
ssh -i g.rsa theuser@192.168.109.154 -t /home/theuser/grs/runA.sh

