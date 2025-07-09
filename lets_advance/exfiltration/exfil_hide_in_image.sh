#!/bin/bash
# Hides a file inside a PNG using steghide (or zip and cat for basic use)

FILE="$1"
COVER="cover.png"
OUTPUT="payload.png"

if [[ ! -f "$FILE" || ! -f "$COVER" ]]; then
    echo "Usage: $0 <file-to-hide> (requires cover.png in same dir)"
    exit 1
fi

zip hidden.zip "$FILE" > /dev/null
cat "$COVER" hidden.zip > "$OUTPUT"
rm hidden.zip

echo "Payload saved as $OUTPUT"
