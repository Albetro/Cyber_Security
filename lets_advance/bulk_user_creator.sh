#!/bin/bash
# Batch-create users from a CSV file

CSV_FILE="users.csv"  # Format: username,password

while IFS=, read -r user pass; do
    if id "$user" &>/dev/null; then
        echo "⚠️ $user already exists."
    else
        useradd -m "$user"
        echo "$user:$pass" | chpasswd
        echo "✅ Created user: $user"
    fi
done < "$CSV_FILE"
