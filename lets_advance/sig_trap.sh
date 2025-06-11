#!/bin/bash
# Advanced: Trap and handle signals

trap 'echo "❗ Caught SIGINT. Cleaning up..."; rm -f /tmp/tempfile; exit 1' SIGINT

echo "Running... Press Ctrl+C to stop."
touch /tmp/tempfile
while true; do
    sleep 1
done
