#!/usr/bin/env bash

sudo docker run -d --net client_net --ip \
10.0.1.254 --cap-add=NET_ADMIN --name router \
netubuntu

sudo docker network connect server_net \
router --ip 10.0.2.254

sudo docker exec router /bin/bash -c \
'iptables -t filter -A FORWARD -p tcp -- dport 80 ! -s 10.0.1.253 -j DROP'