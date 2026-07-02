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

### Tenho medo de usar o "terminal" (aquela tela preta). Posso quebrar algo?
Relaxa. No serviço gerenciado, aquela telinha **não é um Linux de verdade** — é um "cockpit"
restrito que **só aceita comandos `openclaw ...`**. Pensa nele como o controle remoto da TV: poucos
botões, e o que não é botão simplesmente não funciona. Você **não tem como quebrar o servidor** por
ali. E, na real, na maior parte do tempo quem digita os comandos é a **própria Eva** — você só
conversa com ela.

### Algo quebrou / deu erro estranho. Tem um "primeiros socorros"?
Sim: **`openclaw doctor`** (diagnostica problemas comuns de config/canal/serviço) e, se ele achar
algo, **`openclaw doctor --fix`** (conserta sozinho — e faz um backup antes de mexer). É o primeiro
comando a tentar quando a Eva "fica estranha". Você pode até pedir pra própria Eva: *"roda o
`openclaw doctor` e me diz se achou algo."*

### A Eva fica "caindo pro modelo reserva" ou diz que está sem ferramentas. Por quê?
Se você usa **ChatGPT/Codex** como cérebro e, em tarefas que **usam ferramentas** (rodar algo, mexer
em arquivo, automações/cron), a Eva fica caindo pro modelo reserva ou diz que "não tem ferramenta":
pode ser um **bug conhecido do runtime Codex** (ele às vezes "trava" turnos que usam ferramentas).
O que fazer, do mais simples ao mais técnico:
1. Peça pra Eva **atualizar o OpenClaw** (`openclaw doctor` / a versão nova pode já corrigir).
2. Peça pra ela **checar as *issues conhecidas* do OpenClaw** pro seu sintoma (ela lê a doc/GitHub) —
   muitas vezes é bug conhecido **com solução pronta**, não config sua.
3. **Alternativa que sempre funciona:** troque o cérebro pro **Gemini** (estável pra ferramentas).
   E vale o contrário — se um modelo te der trabalho, troque pelo outro; você não fica preso.

### Evite disparar muitas tarefas seguidas no ChatGPT (rate-limit). 🚦
Se você mandar **vários comandos/testes em sequência** em poucos minutos usando o ChatGPT, ele pode
te dar um **bloqueio temporário** (anti-robô) e a Eva cair pro modelo reserva até "esfriar".
Espace os testes; se acontecer, espere alguns minutos.

### A Eva (no ChatGPT/Codex) cai pro reserva com erro `403` / `auth` — mesmo com o login válido?
Se nos logs aparece `reason=auth` / um **403** do `chatgpt.com` ("Enable JavaScript and cookies") e ela
cai pro Gemini, mesmo com o login **ainda válido (não expirado)**: o token OAuth provavelmente está
**"preso"/marcado**. O conserto é **re-logar com `--force`** (gera um token limpo) — no terminal:
```
openclaw models auth login --provider openai --device-code --force
```
Abre um **link + código** → você loga com a conta ChatGPT → autoriza. Depois: `openclaw gateway restart`.
*(É diferente de "token expirado" — aqui o `--force` é o pulo do gato.)*
> ⚠️ Se o 403 **voltar mesmo com token novo**, é a OpenAI bloqueando **uso automatizado** da assinatura.
> Aí o caminho estável é **trocar pro Gemini** como modelo principal (ou usar uma **API key paga** da OpenAI).
> 💡 Por isso: se você usa a Eva pra **automação/uso intenso**, o ChatGPT por assinatura pode ser instável — o **Gemini** tende a ser mais tranquilo.

### A Eva deu erro de "arquivo não encontrado" (errou o nome de um arquivo)?
Acontece — às vezes a IA "chuta" o nome de um arquivo. A Eva foi orientada a **não inventar caminho**:
se uma leitura falhar, ela **lista a pasta** (ou usa `openclaw memory search`), acha o nome certo e
**refaz no mesmo turno** — sem travar. Num workspace pequeno (o caso normal), isso raramente atrapalha.
> 🛠️ *(Avançado, só VM própria — não dá no gerenciado):* quem tiver um workspace **enorme** e bater
> nisso com frequência pode instalar uma "trava" de shell que, na falha, já mostra os nomes parecidos.
> É técnico (systemd/`BASH_ENV`) e **não** faz parte do kit básico.

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

### Minha Eva parece ter "esquecido" coisas / o recall piorou (ou vejo `Unknown memory embedding provider` no log)?
Se você usa **memória semântica com embedding LOCAL** (ex.: `llama-cpp`/GGUF) e, depois de um
**update / `doctor --fix` / refresh**, a Eva passou a achar menos coisa (recall "burro", só por
palavra-chave) — ou no log aparece `Unknown memory embedding provider: local` / `memory sync failed`:
o **plugin do embedding caiu** (o `doctor --fix` desabilita plugins não-core). Conserto:
```
openclaw plugins enable llama-cpp
openclaw gateway restart
```
Confirme com `openclaw memory status --deep` (Embeddings/Vector "ready"). **Regra de ouro:** **toda vez
que rodar `doctor --fix`/update, re-habilite seus plugins críticos depois** — e ponha um check no
heartbeat pra avisar se o embedding cair (ele cai **calado** e ninguém percebe por horas).

### Não consigo conectar o Telegram / WhatsApp. O que faço?
É o passo que mais trava — calma, é simples quando você sabe o pulo do gato:
- **Telegram:** primeiro você cria um "robô" no **@BotFather** (manda `/newbot`, escolhe nome e um
  usuário que **termina em `bot`**) — ele te dá um **token**. Depois é só **colar esse token**: no
  gerenciado, em **OpenClaw → Integrações → Telegram → Conectar**; na VM, a própria Eva configura.
  Por fim, procure **o seu bot** no Telegram e mande "oi".
- **WhatsApp:** não tem token — você **escaneia um QR Code** (igual WhatsApp Web): Integrações →
  WhatsApp → Conectar → no celular, WhatsApp → Aparelhos conectados → Conectar um aparelho.
- Comece pelo **Telegram** (mais estável). O passo a passo completo está no `wizard-03-canais`.

### A Eva responde no privado/WhatsApp mas NÃO responde nos grupos do Telegram (log `not-allowed`)?
É o tropeço nº1 de grupo — e quase nunca é bug. Em grupo, o Telegram + OpenClaw têm **duas travas
independentes**, e a maioria só ajusta uma:
1. **Privacy mode do bot** (no @BotFather): `/setprivacy` → **Disable** → e **remova o bot do grupo e
   adicione de novo** (só vale na re-entrada). Sem isso o bot fica "cego" no grupo.
2. **Autorização de QUEM ENVIA** (no OpenClaw): em grupo o OpenClaw checa o **ID numérico de quem
   mandou** a mensagem, não só o grupo. Se o seu ID não estiver em **`groupAllowFrom`** (ou `allowFrom`),
   dá **`not-allowed`** — *mesmo com o grupo liberado / `allowAll`*. **É isto que falta na maioria dos casos.**
3. **Mencionar:** por padrão (`requireMention: true`) a Eva só responde quando é **@mencionada** no grupo.
   Pra responder a tudo, ponha `requireMention: false` naquele grupo.

**Como pedir pra própria Eva consertar** (cole no chat dela): *"Em grupo, o OpenClaw autoriza por QUEM
ENVIA. Pegue o ID numérico do remetente que aparece no log `not-allowed`, adicione em `groupAllowFrom`
e `allowFrom`, ponha `groupPolicy: open` e `requireMention: false` no grupo, recarregue, e **só diga
'feito' depois de me ver responder no grupo**."* (Seu ID numérico também sai mandando `/start` pro **@userinfobot**.)
> 📖 **Guia passo a passo dedicado:** [`docs/GRUPO-TELEGRAM.md`](docs/GRUPO-TELEGRAM.md) — com o jeito fácil (a Eva faz), o manual e o truque de debug.

### Meu disco/cota encheu rápido (quase bati o limite). Por quê?
Normal — o que cresce **não** é a memória (texto leve), e sim **sessões, mídia e logs** do dia a dia.
Quem criou este kit quase bateu 10GB em 3 dias por isso. Soluções:
- Instale a skill **`guardiao-eva`** (faxina semanal automática: `openclaw sessions cleanup --enforce`,
  poda mídia/logs velhos, compacta o cofre) — ela ainda te avisa se passar de ~70%.
- O **cofre de backup leva só texto** (o `.gitignore` da skill `backup-eva` exclui
  `.sqlite`/`sessions`/`media`/binários). Se versionar binário, o `.git` incha **pra sempre**.
- Se o cofre passar de ~50MB, algo grande entrou errado — investigue.

### A Eva vai encher o disco/cota sozinha com o tempo? Preciso limpar?
**Você não precisa fazer nada** — ela se auto-limpa. O que cresce (sessões de conversa, mídia, logs e,
se usar ChatGPT, o trace do Codex) é podado automaticamente com **retenção sensata** (sessões ~30 dias,
mídia >30 dias, sessões de cron 48h). Quem faz isso é a skill **`guardiao-eva`** (semanal) + um check
diário no heartbeat. Ela **avisa em linguagem simples** quando o disco passa de ~75% ("fiz faxina,
liberei X") e **nunca apaga** o cérebro/memória/identidade nem o cofre de backup — só coisa recriável.
💡 Em plano básico (cota pequena), o **Gemini** ocupa menos disco que o ChatGPT/Codex.

### Como sei se meu backup REALMENTE funciona?
Instale a skill **`restore-drill`** (simulado mensal): ela clona o cofre num espaço temporário,
confere os arquivos vitais e te diz se a Eva é **100% recuperável** — sem tocar na produção.
*Backup que nunca foi testado não é backup.*

### Recebi "backup falhou" no Telegram (mas o backup parece ok) / o backup parou sem avisar?
Se o backup é feito pelo **cron do agente** (padrão no gerenciado) e o modelo caiu pro **reserva** num
blip (auth/403), o reserva **não tem ferramenta de shell** → o turno de backup **não roda** e a Eva pode
mandar **"backup falhou"** (alarme **falso**: o problema foi o modelo, não o cofre). O que fazer:
- **Confirme o cofre:** veja o **último commit** no repositório de backup do GitHub. Se está recente, está ok.
- **Em VM:** migre o backup pro **systemd timer** (shell puro, não depende do agente/modelo — ver
  `skill backup-eva`, passo 4); aí esses alarmes falsos somem.
- Mantenha o **check de frescor** (passo 7 da `backup-eva`): ele avisa **de verdade** se o cofre ficar
  **sem commit** por muitas horas.

### Depois de um update, a Eva parece ter "esquecido" tudo / vejo "Vector search: paused"?
> 📍 **Isto é sobretudo VM/self-hosted com embedding LOCAL** (`llama-cpp`/GGUF). No **gerenciado
> (Hostinger)** você **não roda update manual** (a plataforma atualiza) e normalmente não usa embedding
> local — então raramente cai aqui; se o recall piorar, **peça pra própria Eva** rodar o comando abaixo
> (o gateway já está no ar no gerenciado) ou acione o **suporte**. O resto desta resposta é pra quem tem VM.

Todo **update do OpenClaw invalida o índice de embeddings** (muda a "identidade" dele) → o recall semântico
cai pra keyword até reindexar. Conserto — rode **com o gateway/OpenClaw NO AR**:
```
openclaw memory index --force --agent main
```
Depois confira `openclaw memory status --deep`: tem que dizer `Semantic vectors: ready` e **não**
`Vector search: paused`/`fts-only`. ⚠️ **Nunca reindexe com o gateway parado** — aí ele gera um índice
`fts-only` (sem vetores). O ideal é o **job de manutenção reindexar sozinho** após cada update (ver
`wizard-05`, Parte D) e o **`guardiao-eva`** pegar se ficar paused.

### É seguro? Meus tokens ficam expostos?
Não. Credenciais ficam em arquivos protegidos (`~/.openclaw/.env` / `credentials/`, chmod 600),
**nunca** no Git nem repetidos no chat.

### Travou num passo e o agente não sabe seguir?
Ele foi instruído a **perguntar** em vez de inventar. Responda o que ele perguntar. Se for no
provedor (Gerenciado), acione o **suporte** do provedor.
