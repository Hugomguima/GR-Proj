#!/usr/bin/env bash

# File that is meant to be run on machine A to config everything

# Give execute permission to files that will be executed
chmod 0744 ~/grs/A/*

# Files to be executed on A
~/grs/A/configA.sh
~/grs/A/copyToBC.sh
