#!/bin/bash
sudo echo "20000" > /proc/sys/net/ipv4/tcp_max_syn_backlog
sudo echo "1" > /proc/sys/net/ipv4/tcp_synack_retries
sudo echo "30" > /proc/sys/net/ipv4/tcp_fin_timeout
sudo echo "5" > /proc/sys/net/ipv4/tcp_keepalive_probes
sudo echo "15" > /proc/sys/net/ipv4/tcp_keepalive_intvl
sudo echo "20000" > /proc/sys/net/core/netdev_max_backlog
sudo echo "20000" > /proc/sys/net/core/somaxconn
