#!/bin/bash
# Monitor dmesg for new USB device activity

echo "🔍 Monitoring USB connections..."
dmesg -w | grep --line-buffered "USB disconnect\|new high-speed USB device"
