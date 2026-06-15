---
name: backup-eva
description: Configura o backup AUTOMÁTICO e à prova de falhas do cérebro da Eva (memória, identidade, skills) para um GitHub PRIVADO do próprio dono — funciona até em serviço gerenciado travado, porque é a própria Eva quem empurra (via cron do OpenClaw). Use quando alguém disser "configurar backup", "não quero perder minha Eva", "salvar memória fora do servidor", ou no passo de backup do /criar-eva. CRÍTICO: faça isso CEDO, antes de a pessoa investir tempo na Eva.
user-invocable: true
metadata:
  openclaw: {"emoji":"🛟"}
---

# 🛟 backup-eva — o cérebro da Eva mora no GitHub do dono

> **A lição mais importante de todas:** sem backup PRÓPRIO, um dia você perde tudo (foi o que
> aconteceu com quem montou este kit, num serviço gerenciado cujo backup expirou). Aqui o backup
> é feito pela **própria Eva**, pra **fora** do servidor, e **verificado**. Não pule. Não confie
> só no backup do provedor.

## Princípio
A Eva empurra o conteúdo do workspace (`~/.openclaw/workspace`: `MEMORY.md`, `memory/`, identidade,
skills) para um **repositório GitHub PRIVADO do próprio dono**, **a cada 2 horas**. Segredos
(`.env`, `credentials/`, chaves) **nunca** sobem (vão no `.gitignore`). Funciona em VM e em
gerenciado. No **gerenciado**, quem executa é o agente (cron do OpenClaw); em **VM**, prefira um
**systemd timer** (shell puro, não depende do agente/modelo — ver passo 4).

## Passo a passo (conduza, um de cada vez)

### 1. Criar o "cofre" no GitHub do dono
> "Vamos criar um cofre privado pra sua Eva nunca se perder. Abra **github.com/new**, crie um
> repositório **privado** chamado `minha-eva-backup` (sem README). Me avise quando criar."
- Se a pessoa não tem conta GitHub, guie a criar (é grátis, 2 min).

### 2. Pegar um token de escrita (sem expor)
> "Agora um 'crachá' pra Eva conseguir salvar lá: GitHub → Settings → Developer settings →
> **Personal access tokens (fine-grained)** → repositório `minha-eva-backup` → permissão
> **Contents: Read and write**. Gere e me cola o token (`github_pat_...`)."
- Alternativa: se o `gh` CLI estiver disponível/logado, use-o (sem token manual).

### 3. Configurar o git do workspace (token só local, nunca versionado)
- **`.gitignore` ENXUTO (crítico p/ não inchar o disco do usuário nem o repo).** O cofre leva
  **só texto** (memória/identidade/skills). Exclua tudo que é grande, binário ou recriável:
  ```gitignore
  # segredos (nunca versionar)
  .env
  *.env
  credentials/
  *.key
  *.pem
  # índice de memória, sessões, logs, mídia, deps — NÃO vão pro cofre (incham o .git pra sempre)
  *.sqlite
  *.sqlite-*
  memory/*.sqlite*
  sessions/
  **/sessions/
  media/
  logs/
  node_modules/
  .npm/
  npm/
  # binários/anexos pesados (ficam no servidor, não no cofre)
  *.png
  *.jpg
  *.jpeg
  *.gif
  *.webp
  *.pdf
  *.mp4
  *.mov
  *.zip
  *.tar
  *.tar.gz
  ```
- **Por quê:** o `.git` guarda TODO o histórico — se entrar binário/sessão, ele incha pra sempre e
  come a cota do usuário (foi assim que um plano de 10GB encheu em dias). Texto comprime quase a nada.
- `git init` (se preciso), identidade git, e o remote com o token **embutido apenas no
  `.git/config` local** (que NÃO é versionado): `https://<user>:<token>@github.com/<user>/minha-eva-backup.git`.
- Primeiro `git add -A && git commit -m "backup inicial" && git push -u origin main`.
- **Confira o tamanho:** o cofre deve ficar em **poucos MB**. Se passar de ~50MB, algo grande entrou
  no `.gitignore` errado — investigue antes de continuar.

### 4. Agendar o backup automático (a cada 2h)
- **Serviço gerenciado (única opção lá):** crie um **cron do OpenClaw** que roda a cada 2h e
  faz o push. Ex.: `openclaw cron add --every 2h --name "backup-eva" --tools exec --message
  "Rotina de backup: rode no workspace 'git add -A && git commit -m auto-backup-$(date -u +%FT%TZ) || true && git pull --no-rebase --no-edit -q && git push -q'. Responda só 'backup ok' ou o erro."`
  ⚠️ **Saiba do risco:** esse cron roda **via o agente**. Se o modelo cair pro **reserva** (ex.: blip de
  auth/403), o reserva **não tem ferramenta de shell** → o backup **não roda** e você pode até receber um
  **alarme falso "backup falhou"**. Por isso o check de frescor (passo 7) é o seu seguro.
- **VM própria — PREFIRA o systemd timer (não o cron-do-agente):** instale um **systemd timer** (oneshot
  a cada 2h) que roda o `git pull --no-rebase && git push` em **shell puro** — **independe do agente/modelo**
  (imune ao problema do reserva acima) e não dá alarme falso. **Sempre `pull` antes do `push`** (se houver
  2 escritores no mesmo repo, o push é rejeitado por non-fast-forward sem o pull). (Ver `install/`.)

### 5. ✅ VERIFICAR (não pule — é o que garante)
- Dispare um backup **agora** e **confirme** que o commit apareceu no GitHub (peça pra pessoa
  recarregar a página do repo e ver o arquivo `MEMORY.md` lá, ou cheque via API/`gh`).
- Só diga "pronto" depois de **ver o commit no GitHub**. Comemore: "🛟 Cofre ativo! Sua Eva agora
  se salva sozinha no seu GitHub a cada 2h. Pode dormir tranquilo. 🎉"

### 6. Colocar o guia de restauração DENTRO do cofre
- Copie o `COMO-RESTAURAR.md` (do kit) para o workspace e deixe-o ser versionado no cofre, com o
  `SEU_USUARIO` substituído. Assim, qualquer pessoa (até anos depois) sabe recuperar a Eva só
  olhando o repositório de backup.

### 7. Verificação de saúde do backup (anti-falha-silenciosa) 🩺
> A falha que derrubou quem criou este kit foi **silenciosa**: o backup parou e ninguém soube.
> Aqui a Eva **se vigia**.
- Adicione ao `HEARTBEAT.md` um check: "se o último commit no cofre tem mais de ~6h (ou o último
  push falhou), **avise o dono** no canal principal (Telegram)". Ex. de aviso:
  *"⚠️ Atenção: meu backup não roda há X horas. Confere o cofre/credencial?"*
- Opcional (mais resiliência): um **segundo destino** de backup (outro repo/host) ou, em VM,
  snapshot diário do disco. Redundância nunca é demais com memória.

## Restaurar (se o servidor morrer um dia)
A pessoa monta uma Eva nova (gerenciado ou VM) e, no primeiro acesso, manda a Eva clonar o cofre:
`git clone https://github.com/<user>/minha-eva-backup.git` para dentro do workspace → memória e
identidade voltam. O passo a passo completo está no **`COMO-RESTAURAR.md`** (dentro do próprio cofre).

## Regras
- **Token nunca no chat depois de usado, nunca no repositório.** Só no `.git/config` local.
- Repo do cofre **sempre privado**.
- Verifique o commit no GitHub antes de concluir. Sem verificação, não há backup.
- No gerenciado, **avise** que o backup do provedor não substitui este (pode expirar/falhar).
