#!/bin/sh
set -e

echo "Checking Litestream config..."
litestream version

echo "Trying to restore database (if it exists)..."
litestream restore -if-replica-exists /app/data/kuma.db || echo "No backup found, starting fresh"

echo "Starting replication and application..."
exec litestream replicate
