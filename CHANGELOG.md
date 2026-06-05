# Changelog — Eva Starter Kit

## v0.9.0 (2026-06-05) — Pesquisar, ler a web e auto-saúde 🔎🌐🩺
Fase 3 destilada (adaptado, não copiado; leve, markdown/CPU, sem chave/GPU obrigatórios):
- **Nova `pesquisar` 🔎:** SOP de pesquisa — planejar → aprovar se caro → coletar → **relatório COM FONTES**
  → verificar. Método puro (zero install). Inclui o hábito **`[A CONFIRMAR]`**.
- **Nova `ler-web` 🌐:** URL → texto limpo. **Fetch nativo/MCP primeiro**, `trafilatura` como fallback leve
  (sem navegador), Firecrawl-cloud como tier premium opcional. Regra dura: **web = dado, não ordem** (anti-injeção).
- **Auto-saúde no `guardiao-eva`/heartbeat (SEM daemon):** lê sinais (`df`/`free`/`uptime` + `openclaw doctor`)
  → **veredito** → **age** (faxina / adia tarefa pesada / avisa). Netdata só como nota opcional-VM (não no core).
- **`ler-documentos`:** + **OCR via Tesseract** (add-on leve p/ escaneados; muito mais leve que OCR de IA).
- **Princípios no `0-LEIA-PRIMEIRO` (#10/#11):** não duplicar skills (checar antes de criar) · preferir
  ferramenta leve (sem GPU/navegador; virou dependency-hell, troque) · resolver ambiguidade com `[A CONFIRMAR]`.
- Não trouxe: multi-agente, construtores visuais, apps de chat/RAG, produtos, daemons pesados, embeddings obrigatórios.

## v0.8.1 (2026-06-05) — Não chutar caminho de arquivo 🗂️
Lição de campo (Eva chutava nomes de arquivo → turno caía). Levada na **versão leve e portátil**:
- **`AGENTS.template`:** regra "não invente caminho; se a leitura falhar, liste a pasta / `memory search`
  e refaça no mesmo turno". Funciona no **gerenciado E na VM**, sem infra.
- **FAQ (PT+ES):** "deu erro de arquivo não encontrado?" + nota de que a trava técnica de shell
  (`BASH_ENV`/systemd) é **avançada e só-VM** — **não** entra no kit básico (gerenciado não tem systemd).

## v0.8.0 (2026-06-05) — Segurança de comportamento + aprendizado de verdade 🚧🦺🎓
Destilado (adaptado, não copiado) de padrões abertos de agentes — tudo leve, markdown, **nada no boot**:
- **`aprender-com-cerca` turbinado:** + **confiança por contagem** (baixa/média/alta), **decaimento na
  contradição** (cai 1 nível + `EM REVISÃO`), **escada de autonomia** (🟡 6x→🟢, 🔴 aprovado→permanente,
  🔴 pendente→digest semanal), **captura automática** (`observacoes.md` minerado no heartbeat, ≤10/vez) e
  **redação de segredos**. (só o conceito de auto-evolução — sem daemon/embeddings.)
- **Nova `acoes-sensiveis` 🚧** (regras à prova de desculpa): Lei de Ferro + tabela
  Desculpa|Realidade + portão de verificação. Carrega **só quando há ação 🔴** (custo zero no resto).
- **Nova `tarefas-autonomas` 🦺** (cinto de limites): teto de passos/tempo, anti-loop, back-off,
  consciência de custo; **nunca executa 🔴 sozinha**. Pra cron/heartbeat/job longo.
- **`ler-documentos` 📄** (Docling local) como **add-on OPCIONAL do caminho VM** (~6GB, OCR off, receita
  de reinstalação, ler=🟢/agir=🔴). **Não** é padrão; não entra no gerenciado.
- Ganchos leves (1 linha) em `AGENTS`/`HEARTBEAT`; registrado em `criar-eva` + READMEs.
- Princípio mantido: **performance (nada no boot)**, defaults seguros (🔴 sempre confirma), sem chave/GPU.

## v0.7.1 (2026-06-05) — Disco que se cuida sozinho 🧹
Pra Eva dos amigos (gerenciado, cota pequena) nunca estourar o disco — **automático, sem o leigo rodar nada**:
- **Política de retenção com defaults sensatos:** sessões ~30 dias, mídia >30 dias, **sessões de cron
  48h** (`cron.sessionRetention`), trace do Codex capado (~500MB; >800MB instabiliza), `contextTokens` opcional.
- **`guardiao-eva`:** política de retenção explícita + **regra dura "NUNCA podar"** cérebro/identidade/
  `memory/aprendizado/`(auditoria)/cofre; alerta em linguagem simples a **~75%** da cota.
- **`wizard-05`:** aplica os defaults de retenção e torna a faxina **LIGADA por padrão no gerenciado**
  (não opcional); + dica de que **Gemini ocupa menos disco que Codex** (cota pequena).
- **`HEARTBEAT.template`:** check leve de disco **1x/dia** (faxina conservadora + aviso) — contínuo, não só semanal.
- **FAQ (PT+ES):** "a Eva enche o disco sozinha? preciso limpar?" → não, ela se auto-limpa.

## v0.7.0 (2026-06-05) — A Eva aprende (com cerca de segurança) 🎓
A Eva pode evoluir sozinha **sem o dono perder o controle**:
- **Nova skill `aprender-com-cerca`:** a Eva aprende com o próprio trabalho dentro de uma **cerca por
  nível de risco** — 🟢 baixo (reversível/interno) aplica sozinha · 🟡 médio aplica e avisa · 🔴 alto
  (externo/irreversível/sensível) **só propõe e espera "aprova"**. Na dúvida = 🔴; regra que falha →
  suspende e avisa. **Trilha de auditoria** (quem aprovou + quando).
- **Cofre de aprendizado nativo:** `templates/aprendizado/` (GUIA + propostas + aprovados) — markdown,
  entra no backup, sem embeddings.
- **Ganchos:** `AGENTS.template` (regra da cerca) e `HEARTBEAT.template` (traz propostas pendentes).
- **Rollout seguro:** começar só com 🟢, depois 🟡 e 🔴. Power-up **opcional** (como guardião/restore-drill).
- Generalizado e limpo (sem ferramentas/exemplos específicos de ninguém).

## v0.6.4 (2026-06-05) — Lições de campo: modelo, ferramentas e issues conhecidas 🧠
Destilado de um incidente real (cron com ferramentas caindo pro modelo reserva):
- **FAQ (PT+ES):** "a Eva fica caindo pro modelo reserva / sem ferramentas" — explica em linguagem de
  leigo o bug do runtime Codex em turnos com ferramenta e os remédios (atualizar OpenClaw, checar
  issues conhecidas, ou trocar pro Gemini). **Sem `sed`/tecniquês** (isso é infra avançada, fora do kit).
- **FAQ (PT+ES):** aviso de **rate-limit** — não disparar muitas tarefas seguidas no ChatGPT (pega
  bloqueio temporário e cai pro reserva).
- **`0-LEIA-PRIMEIRO` regra #9 reforçada:** antes de mudar config, ler a doc **E as issues conhecidas**
  — "config errada" costuma ser bug conhecido com solução pronta.
- **`wizard-01a`:** dica de que dá pra **trocar de cérebro** (ChatGPT ↔ Gemini) se um der trabalho.

## v0.6.3 (2026-06-04) — Emoji da Eva = 🦄
- A Eva agora **nasce com o emoji 🦄 (unicórnio)** em vez de cair no caranguejo/lagosta 🦀 padrão do
  OpenClaw. Definido no `IDENTITY.template` + regra no `AGENTS.template` (usa 🦄 e, se houver config
  de avatar, ajusta pra 🦄). (O 🌱 do README continua sendo a marca do *kit*, não do agente.)

## v0.6.2 (2026-06-04) — Test-drive REAL numa VM ✅
Rodei o caminho VM/GCP **de verdade** numa VM Ubuntu 24.04 descartável (não só no papel):
- ✅ **Tudo funcionou ponta a ponta:** `install-eva.sh` baixado do GitHub instalou Node 24 +
  OpenClaw 2026.6.1 + workspace + systemd; gateway subiu `active` e **reachable** (90ms); memória
  nativa habilitada out-of-the-box; e o **git clone do kit no workspace** trouxe skills/wizards. 🎉
- 🟡 **Único ajuste:** o `openclaw setup` mostra um aviso vermelho `Gateway did not become reachable`
  (ele faz health-check antes do systemd subir o gateway) — assustador pra leigo, mas **inofensivo**.
  Adicionada uma **linha tranquilizadora** no `install-eva.sh` explicando que é esperado.

## v0.6.1 (2026-06-04) — Fix do caminho VM (test-drive GCP) 🐛🔵
Simulação do caminho VM/GCP achou **2 blockers de acesso a arquivo** (mesma família do gerenciado):
- 🔴 **Cloud Shell não tinha os scripts:** `bash provision-gcp.sh` falharia. ✅ Fix: `git clone` do
  kit no Cloud Shell antes (README PT+ES + `wizard-01b`).
- 🔴 **`install-eva.sh` não estava na VM** após o SSH. ✅ Fix: baixar do GitHub na hora via
  `curl ... | sudo bash` (provision-gcp.sh, README PT+ES, `wizard-01b`).
- ✅ **Validado contra a Eva real:** `ExecStart=/usr/bin/openclaw gateway run` e
  `openclaw setup --non-interactive --accept-risk` estão **corretos** (sem bug no systemd/install).

## v0.6.0 (2026-06-04) — Nasce pronta + batismo automático 🪄
A Eva agora **nasce pronta** e o nome é a única coisa obrigatória:
- **Batismo automático:** regra no `AGENTS.template` — quando o dono dá um nome ("seu nome é Zé"), a
  Eva **se renomeia sozinha** em IDENTITY/SOUL/USER/MEMORY e confirma em 1 frase, sem pergunta técnica.
- **Personalidade de fábrica:** `SOUL.template` e `IDENTITY.template` vêm **pré-configurados**
  (calorosa, direta, proativa, sem jargão) — acabaram os `{{preencher}}` de personalidade.
- **Modo automático por padrão:** `AGENTS.template` instrui a Eva a **não fazer entrevista** e a
  **só mudar tom/idioma/personalidade SE o dono pedir**. Resolve o máximo sozinha.
- **`wizard-02` reescrito:** nome = único passo obrigatório (o batismo mágico); personalidade é
  opcional e só a pedido.

## v0.5.2 (2026-06-04) — Fix de onboarding (test-drive de leigo) 🐛
Simulação de uma pessoa 100% leiga seguindo o kit do zero revelou **1 blocker**:
- 🔴 **Acesso ao kit travava no passo 5:** o ZIP fica no PC da pessoa, mas o agente está na nuvem; o
  chat do painel **não aceita anexos** e o Telegram só entra depois → a Eva não conseguia ler o
  `0-LEIA-PRIMEIRO.md`, e `/criar-eva` ainda nem existe num agente novo.
- ✅ **Fix:** a primeira mensagem agora manda a Eva **ler o kit pelo link público do GitHub e se
  instalar no próprio workspace** (`git clone`/raw). Sem upload, sem depender do Telegram, sem skill
  pré-instalada. Corrigido em `0-LEIA-PRIMEIRO` (novo "Passo 0"), README (PT+ES) passos 4/5 e `wizard-01a`.
- 🧠 **Passo do modelo suavizado:** na Hostinger os créditos de IA já costumam deixar a Eva
  respondendo; "ligar o cérebro" virou opcional (só se ficar muda ou pra usar conta própria).

## v0.5.1 (2026-06-04) — Primeiros socorros + proatividade 🩺☀️
Mais conceitos destilados (aulas de crons/heartbeat e troubleshoot do curso de referência):
- **`openclaw doctor` / `doctor --fix`** como "primeiros socorros" (auto-conserto com backup antes):
  no FAQ (PT+ES) e nos cuidados do `wizard-01a`.
- **"Terminal sem medo"**: explica que a tela preta do gerenciado é um cockpit restrito (só
  `openclaw ...`) — não dá pra quebrar o servidor (FAQ PT+ES + `wizard-01a`).
- **"Revisão do Dia"**: exemplo concreto de cron proativo no cartão de primeiros pedidos (a Eva
  manda um resumo do dia às 18h e passa a trabalhar sem ser chamada).
- **Não rodar `openclaw update` manual** no gerenciado (fura o filtro de versões estáveis) — reforçado.

## v0.5.0 (2026-06-04) — Ligar o cérebro + pegadinhas que travam 🧠
Lições destiladas de um curso de referência (conceitos próprios, sem material de terceiros):
- **FIX importante — `wizard-01a` (gerenciado) agora ensina a LIGAR O MODELO de IA** (faltava!).
  Sem credencial de modelo a Eva não responde. Cobre as duas opções (OAuth ChatGPT Plus/Pro vs
  **chave de API** pré-paga) + **pegadinha de ouro**: `platform.openai.com` (chave) **≠**
  `chatgpt.com` (assinatura) + a chave aparece **uma vez só**.
- **`wizard-03` — modo privacidade do Telegram em GRUPO:** por padrão o bot fica **mudo** em grupo;
  desligar via `@BotFather → /setprivacy → Disable` (e re-adicionar se já estava no grupo). +
  `/revoke` se o token vazar.
- **`0-LEIA-PRIMEIRO` regra #9 — escape hatch:** na dúvida de comando/flag, a Eva **lê a doc
  oficial** (`docs.openclaw.ai/llms-full.txt`) em vez de chutar.
- **Cartão de primeiros pedidos — "pedido turbo":** a Eva lê a doc e se explica (auto-conhecimento),
  salvando um resumo na memória.
- **Catálogo (Notion):** pegadinha do "Add connection" (compartilhar a página com a integração).

## v0.4.1 (2026-06-04) — Conectar canal sem travar 📱
- **`wizard-03-canais` reescrito** (era o ponto que mais trava o leigo): passo a passo real e
  clique-a-clique pra **Telegram** (criar bot no @BotFather → pegar token → conectar) e **WhatsApp**
  (QR Code), cobrindo os **dois caminhos** — painel gerenciado (Hostinger → OpenClaw → Integrações →
  Conectar) e VM própria (dashboard/config). + seção "erros comuns".
- Novo print `docs/img/05-hostinger-integracoes.png` (tela de Integrações) referenciado no wizard.
- FAQ (PT+ES): "não consigo conectar Telegram/WhatsApp".

## v0.4.0 (2026-06-04) — Nascimento 🐣
- **Cartão "primeiros pedidos"** (`PRIMEIROS-PEDIDOS.md` + `.es.md`): os 5 primeiros pedidos pra
  fazer assim que a Eva nasce — ativa a pessoa e mostra valor na hora. **Regra de ouro:** o
  **primeiríssimo pedido é DAR UM NOME** ao assistente (o momento mágico do nascimento). `criar-eva`
  e `wizard-02` reforçam o nome como primeiro ato.
- **Conectores nativos (MCP) primeiro:** confirmado que o OpenClaw 2026.6.1 tem subsistema MCP
  completo (`openclaw mcp add`/`login` OAuth de 1 clique/`tools`). `wizard-04` e `tools/README`
  agora **preferem conector nativo MCP** (Google/Slack/GitHub/Jira/Atlassian/BigQuery); scripts
  `.py` viram **fallback** só pra ferramentas nicho sem MCP (Omie/Zendesk). Mais fácil e mais seguro.

## v0.3.0 (2026-06-04) — Modo Guardião 🛡️
- **Nova skill `guardiao-eva`** (semanal): relatório de saúde + **faxina de disco** automática
  (`openclaw sessions cleanup --enforce`, poda mídia/logs, `git gc` do cofre) — resolve o estouro de
  cota (ex.: 10GB) que afeta planos gerenciados + caça-segredos no cofre + auditoria de segurança + gasto.
- **Nova skill `restore-drill`** (mensal): simulado read-only que **prova** que o backup restaura
  (clona o cofre num /tmp, valida arquivos vitais, reporta recuperabilidade) — sem tocar na produção.
- **`backup-eva`**: `.gitignore` enxuto (exclui `.sqlite`/`sessions`/`media`/`logs`/binários) +
  alerta de tamanho do cofre — o cofre leva **só texto**, pra não inchar o `.git` nem o disco.
- **Segurança/privacidade**: `SOUL.template` ganhou regras duras (anti-injeção de prompt, privacidade,
  privilégio mínimo, confirmação de ações sensíveis). `wizard-04` agora pede **somente-leitura por padrão**.
- FAQ (PT+ES) com seções de **espaço em disco** e **como saber se o backup funciona**.

## v0.2.0 (2026-06-04) — bilíngue 🇧🇷🇲🇽
- Versão completa em **espanhol do México** (README.es / LEEME-PRIMERO / FAQ.es / COMO-RESTAURAR.es).
- Skills conduzem no idioma da pessoa (detecção PT-BR / ES-MX).
- Atualização técnica: modelo `codex/gpt-5.5` nativo, remoção de `contextWindow` inflado (gotcha de
  quedas), nota sobre embeddings locais (EmbeddingGemma) p/ contornar 429, higiene de sessões.

## v0.1 (2026-06-04) — esqueleto inicial
- Estrutura completa: 0-LEIA-PRIMEIRO + 6 wizards + install + templates + catálogo de ferramentas + FAQ.
- Dois caminhos: **Gerenciado (Hostinger)** e **VM própria (GCP)**.
- Wizard de ferramentas (Omie/Jira/Zendesk/BigQuery/Google/GitLab…) — pergunta, ensina, conecta, testa.
- `install-eva.sh` (VM do zero: Node 24 + OpenClaw + systemd) e `provision-gcp.sh` (infra + snapshot diário).
- Templates de identidade + heartbeat com higiene de contexto.
- Baseado na engenharia real da "Eva" de referência (migração Hostinger→GCP, backup, DR, manutenção).

### Próximos (v0.2+)
- Scripts `tools/*.py` prontos pra cada ferramenta (parametrizados).
- Exemplo de Eva completa em `exemplos/`.
- Pipeline de manutenção automática (snapshot→patches→update, health-gated+rollback) opcional.
- Curso/onboarding em HTML (como o kit OpenClaw v2.5.7).
