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

### A Eva ficou lenta / parou no meio. O que faço?
Geralmente é sessão "cheia". Mande `/compact` (ou `/new`) no chat. Mantenha ≤ 3–4 tópicos no
Telegram. Ver `templates/HEARTBEAT.template.md` (higiene de contexto).

### É seguro? Meus tokens ficam expostos?
Não. Credenciais ficam em arquivos protegidos (`~/.openclaw/.env` / `credentials/`, chmod 600),
**nunca** no Git nem repetidos no chat.

### Travou num passo e o agente não sabe seguir?
Ele foi instruído a **perguntar** em vez de inventar. Responda o que ele perguntar. Se for no
provedor (Gerenciado), acione o **suporte** do provedor.
