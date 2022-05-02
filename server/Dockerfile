FROM nginx
RUN apt update && apt install -y vim \
    iproute2 iputils-ping tcpdump \
    iptables dnsutils curl net-tools
COPY index.html /usr/share/nginx/html/index.html
# COPY sleep.sh /root/sleep.sh
# CMD /root/sleep.sh