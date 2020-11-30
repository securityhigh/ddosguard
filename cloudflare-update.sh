#!/bin/bash
while read ip ; do iptables -D INPUT -p tcp -m multiport --dports http,https -s "$ip" -j ACCEPT ; done <<< "$(curl https://www.cloudflare.com/ips-v4)"
while read ip ; do iptables -I INPUT -p tcp -m multiport --dports http,https -s "$ip" -j ACCEPT ; done <<< "$(curl https://www.cloudflare.com/ips-v4)"
iptables-save > /etc/iptables/rules.v4
