#!/bin/bash
echo "=== Iniciando servidor Minecraft ==="

tmux kill-session -t minecraft 2>/dev/null
tmux kill-session -t playit 2>/dev/null
tmux kill-session -t backup 2>/dev/null

echo "[1/3] Iniciando Forge..."
tmux new-session -d -s minecraft -x 220 -y 50
tmux send-keys -t minecraft "bash start.sh" Enter

echo "      Esperando que el servidor levante..."
sleep 20

echo "[2/3] Iniciando playit tunnel..."
tmux new-session -d -s playit -x 220 -y 50
tmux send-keys -t playit "./playit" Enter

echo "[3/3] Iniciando autobackup..."
tmux new-session -d -s backup -x 220 -y 50
tmux send-keys -t backup "bash autobackup.sh" Enter

echo ""
echo "=== Todo corriendo ==="
echo ""
echo "  tmux attach -t minecraft   <- consola del server"
echo "  tmux attach -t playit      <- ver IP del tunnel"
echo "  tmux attach -t backup      <- log de backups"
echo ""
echo "  Para volver al terminal sin matar nada: Ctrl+B, D"
