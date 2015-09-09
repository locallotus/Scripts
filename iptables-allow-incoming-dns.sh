SERVER_IP="10.0.0.11"
iptables -A INPUT -p udp -s 0/0 --sport 1024:65535 -d $SERVER_IP --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p udp -s $SERVER_IP --sport 53 -d 0/0 --dport 1024:65535 -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -p udp -s 0/0 --sport 53 -d $SERVER_IP --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p udp -s $SERVER_IP --sport 53 -d 0/0 --dport 53 -m state --state ESTABLISHED -j ACCEPT


SERVER_IP="192.168.0.1"
iptables -A INPUT -p udp -s 0/0 --sport 1024:65535 -d $SERVER_IP --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p udp -s $SERVER_IP --sport 53 -d 0/0 --dport 1024:65535 -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -p udp -s 0/0 --sport 53 -d $SERVER_IP --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p udp -s $SERVER_IP --sport 53 -d 0/0 --dport 53 -m state --state ESTABLISHED -j ACCEPT
