FROM ubuntu
RUN apt update && apt install -y vim \
    iproute2 iputils-ping tcpdump \
    iptables dnsutils curl net-tools \
    openvpn
COPY setup_openvpn.sh ~/setup_openvpn.sh
CMD ~/setup_openvpn.sh
COPY sleep.sh /root/sleep.sh
CMD /root/sleep.sh