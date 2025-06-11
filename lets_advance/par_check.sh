#!/bin/bash
# Advanced: Check multiple website statuses in parallel

URLS=("https://google.com" "https://github.com" "https://tryhackme.com")
check_url() {
    local url=$1
    code=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    echo "$url - Status: $code"
}

for url in "${URLS[@]}"; do
    check_url "$url" &
done

wait
echo "✅ All checks complete."
