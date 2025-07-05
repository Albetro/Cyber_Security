#!/bin/bash
# Zip, password-protect, split into chunks

TARGET="$1"
PASSWORD="hunter2"

zip -P "$PASSWORD" secret.zip "$TARGET"
split -b 500K secret.zip part_

echo " File encrypted and split. Ready for exfil:"
ls part_*
