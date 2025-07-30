#!/bin/bash
# Stores encoded data into an SQLite DB (useful for blend-in)

FILE="$1"
DB="/tmp/cache.db"

ENC=$(base64 "$FILE")

sqlite3 "$DB" "CREATE TABLE IF NOT EXISTS cache (id INTEGER PRIMARY KEY, payload TEXT);"
sqlite3 "$DB" "INSERT INTO cache (payload) VALUES ('$ENC');"
