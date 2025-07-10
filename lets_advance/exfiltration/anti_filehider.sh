#!/bin/bash
# Rename a file to something overlooked and move it to a hidden dir
#Can optionally chattr +i it to make it immutable:

FILE="$1"
HIDE_DIR="/var/tmp/.cache"
HIDE_NAME=".conf.bak"

mkdir -p "$HIDE_DIR"
mv "$FILE" "$HIDE_DIR/$HIDE_NAME"

echo "$FILE hidden as $HIDE_DIR/$HIDE_NAME"
