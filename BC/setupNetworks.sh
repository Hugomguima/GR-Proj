#!/usr/bin/env bash


# Clean docker and start eth device
sudo docker network rm client_net server_net
sudo ip l set ens19 up
sudo ip l set ens20 up

# Create network for clients
sudo docker network create -d macvlan \
--subnet=10.0.1.0/24 --gateway=10.0.1.1 -o \
parent=ens19 client_net

# Create network for servers
sudo docker network create -d macvlan \
--subnet=10.0.2.0/24 --gateway=10.0.2.1 -o \
parent=ens20 server_net