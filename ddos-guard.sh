#!/bin/bash
sudo iptables -I INPUT -p tcp --dport 80 -s 0.0.0.0/0 -j DROP
sudo iptables -I INPUT -p tcp --dport 443 -s 0.0.0.0/0 -j DROP
sudo iptables -I INPUT -p tcp --dport 80 -s 186.2.160.0/24 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 443 -s 186.2.160.0/24 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 80 -s 77.220.207.192/27 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 443 -s 77.220.207.192/27 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 80 -s 186.2.164.0/24 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 443 -s 186.2.164.0/24 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 80 -s 190.115.30.44 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 443 -s 190.115.30.44 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 80 -s 77.220.207.192/28 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 443 -s 77.220.207.192/28 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 80 -s 77.220.207.224/28 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 443 -s 77.220.207.224/28 -j ACCEPT

sudo iptables-save
