#!/bin/bash
# Self-updating script – fetches latest version from GitHub

REPO_URL="https://raw.githubusercontent.com/yourusername/bash-tools/main/self_update.sh"
SCRIPT_PATH="$(realpath "$0")"

echo "🔄 Checking for updates..."

curl -s "$REPO_URL" -o /tmp/latest_version.sh

if ! cmp -s "$SCRIPT_PATH" /tmp/latest_version.sh; then
    echo "⬆️ New version found! Updating..."
    cp /tmp/latest_version.sh "$SCRIPT_PATH"
    chmod +x "$SCRIPT_PATH"
    echo "✅ Update complete."
else
    echo "✅ You are already on the latest version."
fi

rm /tmp/latest_version.sh
