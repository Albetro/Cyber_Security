#!/bin/bash
# Evade basic detection by masking your process name

FAKE_NAME="/tmp/cron"
cp /bin/bash "$FAKE_NAME"
"$FAKE_NAME"
