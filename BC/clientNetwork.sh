#!/usr/bin/env bash

for ((i=$1; i<=$2; i++))
do 
    ip=$((100+$i))
    # Launch a client
    sudo docker run -d --net client_net --ip \
    10.0.1.$ip --cap-add=NET_ADMIN --name client$i \
    netubuntu

    # Routing for clients
    sudo docker exec client$i /bin/bash -c \
    'ip r del default via 10.0.1.1'

    sudo docker exec client$i /bin/bash -c \
    'ip r a 10.0.2.0/24 via 10.0.1.254'
done