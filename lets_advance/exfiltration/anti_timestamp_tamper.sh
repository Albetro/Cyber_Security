#!/bin/bash
# Set fake timestamps on a file to make it look old
# stat "$FILE"

FILE="$1"
FAKE_DATE="2020-01-01 12:00:00"

if [[ ! -f "$FILE" ]]; then
    echo "File not found: $FILE"
    exit 1
fi

touch -d "$FAKE_DATE" "$FILE"
echo "Timestamps changed on $FILE to $FAKE_DATE"
