# 👥 ¿La Eva no responde en el GRUPO de Telegram? (el tropiezo nº1)

> Síntoma: la Eva responde en **privado** (DM/WhatsApp), pero en el **grupo** de Telegram queda
> **muda** — y en el log aparece `"reason":"not-allowed"`. **No es bug ni es la plataforma.** Tiene arreglo. 🦄

## Por qué pasa (en 1 frase)
El grupo de Telegram tiene **DOS candados independientes** — casi todos ajustan solo uno:
1. 🤖 **Privacy mode del bot** — por defecto el bot está "ciego" en grupo (solo ve @mención/comando).
2. 🪪 **Autorización de QUIÉN ENVÍA** — OpenClaw permite el grupo por el **ID de quien habla**, no solo por el grupo.
   Por eso `allowAll` en el grupo **no resuelve** solo.

---

## ✅ La forma FÁCIL — pídele a la propia Eva que lo haga
Tú haces solo **2 clics** en Telegram; la Eva hace el resto.

**1) En @BotFather (tú):** `/setprivacy` → elige tu bot → **Disable**. Luego **saca el bot del grupo y
agrégalo de nuevo** (el cambio solo aplica al re-entrar).

**2) Pega en el chat de la Eva:**
> *"Quiero que respondas en mi grupo de Telegram. En grupo, OpenClaw autoriza por QUIÉN ENVÍA. Te voy
> a mandar un 'hola' en el grupo ahora; **toma mi ID numérico** que aparezca en el log `not-allowed`
> (o en mi privado) y configura: `groupPolicy: open`, **mi ID en `groupAllowFrom` y `allowFrom`**, y
> `requireMention: false` en el grupo. Recarga y **solo dime 'listo' después de responder en el grupo**.
> NO actualices OpenClaw ni toques la plataforma."*

**3) Manda un "hola" en el grupo** y deja que la Eva lo haga. Listo. ✅

---

## 🔧 La forma MANUAL (si la Eva se traba) — en la terminal de Hostinger/VM
Abre la línea de comandos de OpenClaw y corre:
```bash
openclaw config patch --stdin
{ "channels": { "telegram": {
  "groupPolicy": "open",
  "groupAllowFrom": ["TU_ID_NUMERICO"],
  "groups": { "ID_DEL_GRUPO": { "requireMention": false } }
} } }
openclaw gateway restart
```
- **TU_ID_NUMERICO:** manda `/start` al **@userinfobot** en Telegram (te da el número), o tómalo del log `not-allowed`.
- **ID_DEL_GRUPO:** empieza con `-100…` (aparece en el log del mensaje del grupo).

---

## 🔎 Truco de debug (fue lo que resolvió en la práctica)
Deja el **chat del panel de Hostinger abierto** en una pestaña mientras mandas mensajes en el grupo de
Telegram. Ves **en tiempo real** si el mensaje llegó y el motivo (`not-allowed`, etc.) — y vas ajustando
`groupAllowFrom`/`groupPolicy` hasta que responda en el grupo. **Prueba → ajusta → prueba.**

---

## ⚠️ NUNCA hagas esto
**No actualices OpenClaw / la plataforma** en un servicio administrado para "intentar arreglar" — eso,
sin respaldo, ya mató a un asistente entero. Esto es **solo config** (seguro y reversible). Y, si aún no
lo tienes, **enciende el respaldo primero** (skill `backup-eva`).
