#!/bin/bash
# Advanced: System health dashboard

echo "📊 SYSTEM HEALTH SUMMARY"
echo "------------------------"
echo "🧠 Memory Usage:"
free -h

echo ""
echo "💾 Disk Usage:"
df -h /

echo ""
echo "🔥 CPU Load:"
uptime

echo ""
echo "🌐 Network Interfaces:"
ip -brief address show
