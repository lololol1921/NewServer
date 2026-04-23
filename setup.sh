#!/bin/bash
echo "=== Configurando entorno Minecraft Forge 1.20.1 ==="

echo "[1/6] Instalando Java 17..."
sudo apt-get update -qq
sudo apt-get install -y openjdk-21-jdk tmux -qq
sudo update-alternatives --set java /usr/lib/jvm/java-21-openjdk-amd64/bin/java
echo "Java listo: $(java -version 2>&1 | head -1)"

echo "[2/6] Configurando git..."
git config credential.helper store
git config pull.rebase false

echo "[3/6] Configurando tmux..."
cat > ~/.tmux.conf << 'TMUX'
set -g mouse on
set -g history-limit 5000
set -g status-bg colour235
set -g status-fg colour136
set -g status-left " 🟢 MinecraftServer "
set -g status-right " %H:%M "
TMUX

echo "[4/6] Dando permisos a scripts..."
chmod +x start.sh backup.sh autobackup.sh launch.sh 2>/dev/null || true

echo "[5/6] Creando carpetas..."
mkdir -p backups mods

echo "[6/6] Aceptando EULA..."
echo "eula=true" > eula.txt

echo ""
echo "=== Listo. Usá 'bash launch.sh' para iniciar todo ==="
