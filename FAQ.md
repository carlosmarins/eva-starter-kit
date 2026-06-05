# FAQ — Eva Starter Kit

### Eu não entendo nada de tecnologia. Consigo mesmo?
Sim. A ideia é justa: você **conversa**, o agente faz. Se travar, ele pergunta. Vá no caminho
**Gerenciado** e siga o que ele disser.

### Quanto custa?
- **Gerenciado (Hostinger):** uma mensalidade do plano. Mais previsível.
- **VM própria (GCP):** a VM (algumas dezenas de US$/mês conforme o tamanho) + uso de IA por token
  (centavos a dólares conforme o uso). Tem créditos grátis no começo.
- O modelo de IA (ChatGPT Pro / Gemini) pode ter custo à parte conforme a opção.

### Caminho Gerenciado — como contrato?
1. Acesse a página do **OpenClaw gerenciado (Hostinger)**.
2. Escolha o plano básico, vá ao checkout e **pague com cartão**.
3. Acesse o painel/terminal do agente.
4. Suba/cole este kit e diga: *"Leia o `0-LEIA-PRIMEIRO.md` e seja meu tutor."*
O resto o agente conduz (wizards 02→05).

### Qual a diferença real entre os dois caminhos?
Gerenciado = casa alugada mobiliada (fácil, mantida por terceiros). VM própria = casa sua
(controle e backup totais, dá um pouco mais de trabalho). Ver `README.md`.

### Vou perder meus dados se algo der errado?
Não, **se você fizer o backup** (wizard-05). O kit configura backup automático do workspace pro
seu Git + (na VM) snapshot diário do disco. **Faça isso** — é a parte mais importante.

### Posso adicionar uma ferramenta depois?
Sim. Chame o `wizard-04` quando quiser — a Eva conecta a nova sem mexer no resto.

### A Eva ficou lenta / parou no meio (erro "agent failed"). O que faço?
1. **Sessão cheia:** mande `/compact` (ou `/new`) no chat. Mantenha ≤ 3–4 tópicos no Telegram
   (ver `templates/HEARTBEAT.template.md`).
2. **Se você usa o modelo ChatGPT/Codex** (comum no caminho gerenciado) e ela **cai no meio das
   respostas** (`codex app-server client closed`): isso é um **gotcha conhecido** —
   - Use o **runtime Codex nativo** (`/model codex/gpt-5.5` no chat) — mais estável que o adapter genérico.
   - ⚠️ **NÃO** configure um `contextWindow` enorme (tipo 1.000.000) no Codex: ele tem um limite
     interno menor e, se você exagerar, ele **estoura e derruba o turno no meio**. Deixe o padrão.
   - Dica: o **Gemini** aguenta janelas grandes; o Codex não. Se quiser conversas muito longas sem
     quedas, o Gemini como principal é mais estável (mas usa chave/cota).
3. Se uma conversa ficou "presa" num modelo de fallback, dê `/new` ou `/model <modelo>` nela.

### Meu disco/cota encheu rápido (quase bati o limite). Por quê?
Normal — o que cresce **não** é a memória (texto leve), e sim **sessões, mídia e logs** do dia a dia.
Quem criou este kit quase bateu 10GB em 3 dias por isso. Soluções:
- Instale a skill **`guardiao-eva`** (faxina semanal automática: `openclaw sessions cleanup --enforce`,
  poda mídia/logs velhos, compacta o cofre) — ela ainda te avisa se passar de ~70%.
- O **cofre de backup leva só texto** (o `.gitignore` da skill `backup-eva` exclui
  `.sqlite`/`sessions`/`media`/binários). Se versionar binário, o `.git` incha **pra sempre**.
- Se o cofre passar de ~50MB, algo grande entrou errado — investigue.

### Como sei se meu backup REALMENTE funciona?
Instale a skill **`restore-drill`** (simulado mensal): ela clona o cofre num espaço temporário,
confere os arquivos vitais e te diz se a Eva é **100% recuperável** — sem tocar na produção.
*Backup que nunca foi testado não é backup.*

### É seguro? Meus tokens ficam expostos?
Não. Credenciais ficam em arquivos protegidos (`~/.openclaw/.env` / `credentials/`, chmod 600),
**nunca** no Git nem repetidos no chat.

### Travou num passo e o agente não sabe seguir?
Ele foi instruído a **perguntar** em vez de inventar. Responda o que ele perguntar. Se for no
provedor (Gerenciado), acione o **suporte** do provedor.
