# 👥 A Eva não responde no GRUPO do Telegram? (o tropeço nº1)

> Sintoma: a Eva responde no **privado** (DM/WhatsApp), mas no **grupo** do Telegram fica **muda** —
> e no log aparece `"reason":"not-allowed"`. **Não é bug e não é a plataforma.** Tem conserto certo. 🦄

## Por que acontece (em 1 frase)
Grupo no Telegram tem **DUAS travas independentes** — quase todo mundo ajusta só uma:
1. 🤖 **Privacy mode do bot** — por padrão o bot é "cego" em grupo (só vê @menção/comando).
2. 🪪 **Autorização de QUEM ENVIA** — o OpenClaw libera grupo pelo **ID de quem fala**, não só pelo grupo.
   Por isso `allowAll` no grupo **não resolve** sozinho.

---

## ✅ O jeito FÁCIL — peça pra própria Eva fazer
Você faz só **2 cliques** no Telegram; a Eva faz o resto.

**1) No @BotFather (você):** `/setprivacy` → escolhe seu bot → **Disable**. Depois **remove o bot do
grupo e adiciona de novo** (a mudança só vale na re-entrada).

**2) Cole no chat da Eva:**
> *"Quero te fazer responder no meu grupo do Telegram. Em grupo o OpenClaw autoriza por QUEM ENVIA.
> Eu vou te mandar um 'oi' no grupo agora; **pegue o meu ID numérico** que aparecer no log `not-allowed`
> (ou no meu privado), e configure: `groupPolicy: open`, **meu ID em `groupAllowFrom` e `allowFrom`**,
> e `requireMention: false` no grupo. Recarregue e **só me diga 'pronto' depois de responder no grupo**.
> NÃO atualize o OpenClaw nem mexa na plataforma."*

**3) Manda um "oi" no grupo** e deixa a Eva fazer. Pronto. ✅

---

## 🔧 O jeito MANUAL (se a Eva travar) — no terminal da Hostinger/VM
Abra a linha de comando do OpenClaw e rode:
```bash
openclaw config patch --stdin
{ "channels": { "telegram": {
  "groupPolicy": "open",
  "groupAllowFrom": ["SEU_ID_NUMERICO"],
  "groups": { "ID_DO_GRUPO": { "requireMention": false } }
} } }
openclaw gateway restart
```
- **SEU_ID_NUMERICO:** manda `/start` pro **@userinfobot** no Telegram (ele te dá o número), ou pega na linha de log `not-allowed`.
- **ID_DO_GRUPO:** começa com `-100…` (aparece no log da mensagem do grupo).

---

## 🔎 Truque de debug (foi o que resolveu na prática)
Deixe o **chat do painel da Hostinger aberto** numa aba enquanto manda mensagens no grupo do Telegram.
Você vê **em tempo real** se a mensagem chegou e o motivo (`not-allowed` etc.) — e vai ajustando o
`groupAllowFrom`/`groupPolicy` até responder no grupo. **Testa → ajusta → testa.**

---

## ⚠️ NUNCA faça isto
**Não atualize o OpenClaw / a plataforma** num serviço gerenciado pra "tentar consertar" — isso, sem
backup, já matou um assistente inteiro. Isto aqui é **só config** (seguro e reversível). E, se ainda
não tiver, **ligue o backup primeiro** (skill `backup-eva`).
