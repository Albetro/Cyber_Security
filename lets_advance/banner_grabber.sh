#!/bin/bash
# Get service banner of a port
#usage ./banner_grabber.sh <ip> 80

HOST="$1"
PORT="$2"

echo "📡 Connecting to $HOST:$PORT ..."
exec 3<>/dev/tcp/$HOST/$PORT
echo -e "HEAD / HTTP/1.0\r\n\r\n" >&3
cat <&3
