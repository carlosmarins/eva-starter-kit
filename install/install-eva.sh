#!/usr/bin/env bash
# install-eva.sh — instala a Eva (OpenClaw) numa VM Ubuntu do zero.
# Roda como root na VM (ex.: sudo bash install-eva.sh). Idempotente o suficiente.
set -euo pipefail
echo "[eva] instalando dependências…"
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get install -y curl ca-certificates gnupg git build-essential

echo "[eva] instalando Node 24 (NodeSource)…"
curl -fsSL https://deb.nodesource.com/setup_24.x | bash -
apt-get install -y nodejs
node -v

echo "[eva] dependências do WhatsApp (Chromium headless)…"
apt-get install -y chromium-browser fonts-liberation libatk-bridge2.0-0 libgbm1 libnss3 libxss1 libasound2t64 2>/dev/null \
  || apt-get install -y chromium fonts-liberation libatk-bridge2.0-0 libgbm1 libnss3 || true

echo "[eva] usuário dedicado 'openclaw'…"
id -u openclaw &>/dev/null || useradd -m -s /bin/bash openclaw
loginctl enable-linger openclaw 2>/dev/null || true

echo "[eva] instalando OpenClaw…"
npm install -g openclaw@latest
echo "[eva] OpenClaw: $(command -v openclaw) — $(openclaw --version 2>/dev/null || echo n/a)"

echo "[eva] inicializando workspace (headless)…"
sudo -u openclaw -H bash -lc "openclaw setup --non-interactive --accept-risk" || true
echo "[eva] ℹ️  Se apareceu um aviso 'Gateway did not become reachable / ECONNREFUSED' acima, é"
echo "[eva]     ESPERADO — pode ignorar. O gateway sobe AGORA, no próximo passo (systemd). Não é erro."

echo "[eva] instalando serviço systemd (um único supervisor, restart automático)…"
cat >/etc/systemd/system/openclaw.service <<'UNIT'
[Unit]
Description=OpenClaw Gateway (Eva)
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=openclaw
Group=openclaw
WorkingDirectory=/home/openclaw
Environment=HOME=/home/openclaw
Environment=PATH=/usr/bin:/usr/local/bin:/bin
EnvironmentFile=-/home/openclaw/.openclaw/.env
ExecStart=/usr/bin/openclaw gateway run
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
UNIT
systemctl daemon-reload
systemctl enable --now openclaw
sleep 8
echo "[eva] status:"; systemctl is-active openclaw

cat <<'NEXT'

✅ Eva instalada. Próximos passos (o agente/tutor conduz):
  1) Configurar o modelo: openclaw config patch (provider Google/Gemini é o mais simples/keyless,
     ou ChatGPT/Codex via login; ver wizard).
  2) Conectar canais (Telegram) — wizard-03.
  3) Conectar ferramentas — wizard-04.
  4) Backup automático (workspace -> Git) + snapshot — wizard-05.

Comandos úteis:
  sudo -u openclaw -H openclaw status
  sudo journalctl -u openclaw -f
NEXT
