#!/bin/bash
sudo iptables -N syn_flood
sudo iptables -A INPUT -p tcp --syn -j syn_flood
sudo iptables -A syn_flood -m limit --limit 500/s --limit-burst 2000 -j RETURN
sudo iptables -A syn_flood -j DROP

sudo iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
sudo iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
sudo iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
sudo iptables -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
sudo iptables -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j DROP
sudo iptables -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j DROP
sudo iptables -A INPUT -p tcp --tcp-flags ACK,URG URG -j DROP

sudo iptables -I INPUT 1 -m set --match-set dos src -j DROP
sudo ipset -N dos iphash
sudo iptables-save
