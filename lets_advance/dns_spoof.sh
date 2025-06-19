#!/bin/bash
# Detect unauthorized DNS changes

KNOWN_DNS="8.8.8.8"
CURRENT=$(grep nameserver /etc/resolv.conf | awk '{print $2}')

if [[ "$CURRENT" != "$KNOWN_DNS" ]]; then
    echo "⚠️ Potential DNS spoofing: $CURRENT" | mail -s "DNS Alert" you@example.com
fi
