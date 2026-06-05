---
name: wizard-03-canais
description: Conecta os canais de conversa da Eva — Telegram (primeiro, mais fácil), depois WhatsApp e Slack se a pessoa quiser. Ensina a pegar cada token passo a passo. Use após a identidade.
user-invocable: true
---

# Wizard 03 — Por onde você fala com a Eva

Objetivo: deixar a pessoa conversando com a Eva pelo celular. Comece pelo **Telegram** (o mais
simples). WhatsApp e Slack são opcionais.

## Telegram (recomendado primeiro)
1. Explique: "Vamos criar um 'robô' (bot) no Telegram pra você falar com a Eva por lá. Leva 1 min."
2. Guie, um clique por vez:
   - Abrir o Telegram e procurar **@BotFather**.
   - Mandar `/newbot`, escolher um nome e um @usuario pro bot.
   - O BotFather devolve um **token** (tipo `8123:AAF...`). "Cola esse token aqui pra mim."
3. Você configura o canal `telegram` (botToken) na config do OpenClaw e reinicia.
4. Peça pra ela **mandar um "oi" pro bot** no Telegram e confirme que a Eva respondeu. ✅🎉

## WhatsApp (opcional)
- Explique que conecta via **QR Code** (igual WhatsApp Web). Ative o canal `whatsapp`, mostre o QR
  (no log/painel) e peça pra ela escanear com o celular. Confirme a conexão.

## Slack (opcional, p/ quem usa Slack no trabalho)
- Mais passos (criar um app no Slack, pegar tokens `xoxb`/`xapp`). Só faça se ela pedir; guie clique
  a clique ou ofereça deixar pra depois.

## Regras importantes
- **Tokens são segredos:** depois de usar, confirme que ficaram salvos na config/.env e **nunca**
  repita o token no chat.
- Telegram: no início, deixe o acesso restrito a ela (allowlist do próprio usuário) por segurança.
- Em **grupos**, oriente travar quem pode dar comandos (evita estranho comandando a Eva).

## Stop condition
Pelo menos o Telegram funcionando (ela manda "oi", Eva responde).

## Próximo passo
→ **wizard-04-ferramentas**.
