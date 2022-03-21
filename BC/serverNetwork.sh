#!/usr/bin/env bash 

sudo docker rm -f server
sudo docker network rm server_net
sudo ip l set ens20 up

# Create network for servers
sudo docker network create -d macvlan \
--subnet=10.0.2.0/24 --gateway=10.0.2.1 -o \
parent=ens20 server_net

# Launch a server
sudo docker run -d --net server_net --ip \
10.0.2.100 --cap-add=NET_ADMIN --name server \
netubuntu

# Routing for server
sudo docker exec server /bin/bash -c \
'ip r del default via 10.0.2.1'

sudo docker exec server /bin/bash -c \
'ip r a 10.0.1.0/24 via 10.0.2.254'