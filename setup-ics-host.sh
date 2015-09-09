cat /proc/sys/net/ipv4/ip_forward
echo 1 > /proc/sys/net/ipv4/ip_forward
cat /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o wlan0 -s 192.168.0.0/24 -j MASQUERADE
ifconfig eth0 up
ip addr add 192.168.0.1/24 dev eth0
ifconfig eth0
