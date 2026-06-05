---
name: wizard-03-canais
description: Conecta os canais de conversa da Eva — Telegram (primeiro, mais fácil), depois WhatsApp e Slack se a pessoa quiser. Ensina, clique a clique, a criar o bot no BotFather, pegar o token e conectar — tanto no painel gerenciado (Hostinger → OpenClaw → Integrações → Conectar) quanto na VM própria. Use após a identidade.
user-invocable: true
---

# Wizard 03 — Por onde você fala com a Eva 📱

> ⚠️ **Este é o passo onde a maioria trava.** Conectar canal tem uns detalhes (criar um "robô",
> colar um código, escanear um QR). Vá **bem devagar, um clique por vez**, e confirme cada parte
> antes de seguir. Comece SEMPRE pelo **Telegram** (é o mais simples e nunca falha).

Antes de tudo, descubra **onde** a pessoa vai conectar:
- 🏠 **Gerenciado (Hostinger):** tem uma tela pronta → menu lateral **OpenClaw → Integrações** →
  botões **Conectar** pra WhatsApp e Telegram (veja o print abaixo).
- 🖥️ **VM própria:** conecta pelo **dashboard** do OpenClaw (botão "Help me configure a channel")
  ou pela config — você (agente) faz o trabalho.

![Integrações no painel Hostinger](../docs/img/05-hostinger-integracoes.png)

---

## 1) Telegram — comece por aqui (≈ 2 min) ✅

### Parte A — criar o "robô" (bot) no Telegram → vale pros DOIS caminhos
Isso é o que dá o **token** (a "senha" do bot). Guie clique a clique:
1. "Abra o **Telegram** no celular ou no PC e, na busca, procure **@BotFather** (o oficial tem o
   selo azul ✓). Abra a conversa com ele."
2. "Mande a mensagem **`/newbot`**."
3. "Ele pergunta um **nome** (ex.: *Minha Eva*) — qualquer um serve."
4. "Depois pede um **usuário**, que precisa **terminar em `bot`** (ex.: `minhaeva_bot`). Se já
   existir, ele pede outro."
5. "Pronto! Ele te manda uma mensagem com um **token** parecido com `8123456:AAF...xyz`.
   **Copia e cola aqui pra mim.**" → (você guarda em segredo; nunca repita o token no chat depois.)

### Parte A.5 — só se for usar a Eva em GRUPO: desligar o "modo privacidade" 👥
> **Pegadinha importante:** por padrão, um bot do Telegram **só enxerga** mensagens onde é
> @mencionado ou comandos (`/algo`). Em conversa 1-a-1 (DM) isso não atrapalha. Mas se você for pôr
> a Eva num **grupo** (equipe, família), ela fica **muda** — não lê o contexto. Conserte ANTES de
> adicionar no grupo:
> 1. No **@BotFather**, mande `/setprivacy` → escolha o seu bot → clique **Disable**.
> 2. Se o bot **já estava** num grupo, **remova e adicione de novo** pra valer.

### Parte B — conectar o bot na Eva
**Se for Gerenciado (Hostinger):**
1. "No painel, vá em **OpenClaw → Integrações** e clique em **Conectar** na linha do **Telegram**."
2. "Vai aparecer um campo pra colar o **token** do BotFather → cole e salve."

**Se for VM própria:** você configura o canal `telegram` (com o `botToken`) na config do OpenClaw e
recarrega — sem a pessoa precisar mexer em nada.

### Parte C — testar (não pule!)
"Agora, no Telegram, **procure o seu bot** pelo @usuário que você criou, abra e mande um **`oi`**."
→ Confirme que a Eva respondeu. **Comemore:** "✅ Telegram conectado! Agora você fala com a sua Eva
direto do celular. 🎉"

---

## 2) WhatsApp — opcional (via QR Code, igual WhatsApp Web) 📲
> No WhatsApp **não tem BotFather**: conecta escaneando um QR, como no WhatsApp Web. Use o **seu**
> número ou (recomendado) um número separado só pra Eva, se você tiver.

**Gerenciado (Hostinger):**
1. "Em **OpenClaw → Integrações**, clique **Conectar** no **WhatsApp**."
2. "Vai aparecer um **QR Code** na tela."
3. "No celular: WhatsApp → **Configurações → Aparelhos conectados → Conectar um aparelho** → aponte
   a câmera pro QR."
4. Confirme que conectou e peça pra ela mandar um "oi" pro número. ✅

**VM própria:** você ativa o canal `whatsapp`, o QR aparece no log/dashboard, e a pessoa escaneia
do mesmo jeito.

> ⚠️ **WhatsApp é mais sensível:** é uma conexão "não oficial" (estilo WhatsApp Web) — se o celular
> ficar muito tempo offline, pode cair e precisar reconectar o QR. Por isso o **Telegram é o
> recomendado** como canal principal.

---

## 3) Slack — opcional, p/ quem usa no trabalho 💼
Tem mais passos (criar um app em api.slack.com, pegar os tokens `xoxb-`/`xapp-`, dar permissões).
Só faça se a pessoa pedir; guie clique a clique ou deixe pra depois (dá pra adicionar quando quiser).

---

## Regras importantes 🔒
- **Token/QR são segredos.** Depois de usar, confirme que ficou salvo (painel/config/.env) e
  **nunca** repita o token no chat. **Se o token do Telegram vazar:** no @BotFather mande
  `/revoke`, gere um novo e atualize na Eva (o antigo deixa de funcionar na hora).
- **Privacidade desde o início:** deixe a Eva respondendo **só pra pessoa** (allowlist do próprio
  usuário). Estranho não comanda a Eva.
- **Em grupos:** trave quem pode dar comandos (senão qualquer um no grupo manda na Eva).

## Erros comuns (não trave a pessoa)
- *"@BotFather não aparece / aparece vários"* → o certo tem **selo azul ✓** e o nome exato `BotFather`.
- *"Disse que o usuário do bot já existe"* → é só escolher outro que **termine em `bot`**.
- *"Mandei oi e a Eva não responde"* → confirme: token colado certo? canal salvo/reiniciado?
  está falando com o **bot certo** (o @usuário que você criou)? Veja o log antes de desistir.
- *"O WhatsApp caiu"* → reabra Integrações → Conectar → escaneie o QR de novo.

## Stop condition
Pelo menos o **Telegram** funcionando (a pessoa manda "oi" e a Eva responde de verdade).

## Próximo passo
→ **wizard-04-ferramentas**.
