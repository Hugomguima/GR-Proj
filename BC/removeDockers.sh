#!/usr/bin/env bash

# Remove all client and server dockers

dsi() { docker stop $(docker ps -a | awk -v i="$1*" '{{print$1}}'); }

docker rm $(dsi client  | tr '\n' ' ');
docker rm $(dsi server  | tr '\n' ' ');