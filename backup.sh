#!/bin/bash

WORLD_NAME="world"
BACKUP_DIR="backups"
MAX_BACKUPS=5

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/${WORLD_NAME}_$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"

echo "[BACKUP] Iniciando backup: $TIMESTAMP"

tar -czf "$BACKUP_FILE" \
    "$WORLD_NAME" \
    "${WORLD_NAME}_nether" \
    "${WORLD_NAME}_the_end" \
    ops.json \
    whitelist.json \
    banned-players.json \
    server.properties \
    mods/ \
    2>/dev/null

echo "[BACKUP] Comprimido: $BACKUP_FILE"

cd "$BACKUP_DIR"
ls -t *.tar.gz 2>/dev/null | tail -n +$((MAX_BACKUPS + 1)) | xargs -r rm --
cd ..

git add backups/
git commit -m "backup: $TIMESTAMP"
git push origin main

echo "[BACKUP] Subido a GitHub OK"
