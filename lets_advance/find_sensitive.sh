#!/bin/bash
# Find sensitive files in /var/www, /home, etc.

echo "🔍 Searching for .env, .git, .bak, etc..."
find / -type f \( -name ".env" -o -name "*.bak" -o -name "config.php" -o -name "*.sql" \) 2>/dev/null
