# Changelog — Eva Starter Kit

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
