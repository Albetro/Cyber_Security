#!/bin/bash
# Live monitor bandwidth usage per second

IFACE="eth0"
while true; do
    R1=$(cat /sys/class/net/$IFACE/statistics/rx_bytes)
    T1=$(cat /sys/class/net/$IFACE/statistics/tx_bytes)
    sleep 1
    R2=$(cat /sys/class/net/$IFACE/statistics/rx_bytes)
    T2=$(cat /sys/class/net/$IFACE/statistics/tx_bytes)
    RX=$(( (R2 - R1) / 1024 ))
    TX=$(( (T2 - T1) / 1024 ))
    echo "🔁 RX: ${RX}KB/s | TX: ${TX}KB/s"
done
