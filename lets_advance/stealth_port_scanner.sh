#!/bin/bash
# Stealthy port scanner with random delays between each scan

TARGET="$1"
START_PORT=20
END_PORT=1024

echo "🔍 Scanning $TARGET from port $START_PORT to $END_PORT..."

for ((port=$START_PORT; port<=$END_PORT; port++)); do
    timeout 1 bash -c "echo >/dev/tcp/$TARGET/$port" 2>/dev/null &&
    echo "✅ Port $port is open" &
    sleep $(awk -v min=0.3 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')
done
wait
