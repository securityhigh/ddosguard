#!/bin/bash
iptables -A OUTPUT -p icmp --icmp-type echo-request -j DROP
iptables -A INPUT -p icmp --icmp-type echo-reply -j DROP
iptables-save
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_all
