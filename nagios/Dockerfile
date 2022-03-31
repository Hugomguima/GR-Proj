FROM jasonrivers/nagios
RUN apt update && apt install -y vim \
    iproute2 iputils-ping tcpdump \
    iptables dnsutils curl net-tools
EXPOSE 80