#!/bin/bash
echo "Hostname: $(hostname)"
echo "IP Address: $(hostname -I | awk '{print $1}')"
echo "Gateway: $(ip route | grep default | awk '{print $3}')"
echo "DNS Servers:"
grep "nameserver" /etc/resolv.conf
