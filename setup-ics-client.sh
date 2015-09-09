ifconfig eth0 up
ip addr add 192.168.0.2/24 dev eth0
ip route add default via 192.168.0.1
ifconfig eth0
