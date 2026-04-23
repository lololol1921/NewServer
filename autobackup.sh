#!/bin/bash
echo "[AUTOBACKUP] Iniciado. Backup cada 10 minutos."
while true; do
    sleep 600
    bash backup.sh >> backup.log 2>&1
done
