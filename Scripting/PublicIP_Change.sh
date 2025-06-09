#!/bin/bash
ip_file="$HOME/.last_ip"
current_ip=$(curl -s ifconfig.me)

if [ -f "$ip_file" ]; then
  last_ip=$(cat "$ip_file")
  if [ "$current_ip" != "$last_ip" ]; then
    echo "Public IP changed: $current_ip"
    echo "$current_ip" > "$ip_file"
  fi
else
  echo "$current_ip" > "$ip_file"
  echo "IP recorded."
fi
