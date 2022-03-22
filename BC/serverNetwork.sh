#!/usr/bin/env bash 

sudo docker rm -f server
sudo docker network rm server_net
sudo ip l set ens20 up

# Create network for servers
sudo docker network create -d macvlan \
--subnet=10.0.2.0/24 --gateway=10.0.2.1 -o \
parent=ens20 server_net


for ((i=$1; i<=$2; i++))
do 
    ip=$((100+$i))
    # Launch a server
    sudo docker run -d --net server_net --ip \
    10.0.2.$ip --cap-add=NET_ADMIN --name server$i \
    server

    # Routing for server
    sudo docker exec server$i /bin/bash -c \
    'ip r del default via 10.0.2.1'

    sudo docker exec server$i /bin/bash -c \
    'ip r a 10.0.1.0/24 via 10.0.2.254'
done