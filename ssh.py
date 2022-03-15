#!/usr/bin/env python3

import os
from sys import argv

if len(argv) == 1:
    print("Usage: python ssh.py [A|B|C]")
    exit(1)

if argv[1] == "A":
    os.system("ssh -i g.rsa theuser@192.168.109.154")
elif argv[1] == "B":
    os.system("ssh -i g.rsa theuser@192.168.109.154 -t ssh -i .ssh/privBC.rsa theuser@192.168.88.101")
elif argv[1] == "C":
    os.system("ssh -i g.rsa theuser@192.168.109.154 -t ssh -i .ssh/privBC.rsa theuser@192.168.88.102")
