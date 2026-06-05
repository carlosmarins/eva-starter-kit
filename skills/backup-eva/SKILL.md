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
gerenciado, porque quem executa é o agente (cron do OpenClaw), não o sistema.

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
- No workspace, garanta `.gitignore` com: `.env`, `*.env`, `credentials/`, `*.key`, `*.sqlite`.
- `git init` (se preciso), identidade git, e o remote com o token **embutido apenas no
  `.git/config` local** (que NÃO é versionado): `https://<user>:<token>@github.com/<user>/minha-eva-backup.git`.
- Primeiro `git add -A && git commit -m "backup inicial" && git push -u origin main`.

### 4. Agendar o backup automático (a cada 2h)
- **Serviço gerenciado (ou padrão universal):** crie um **cron do OpenClaw** que roda a cada 2h e
  faz o push. Ex.: `openclaw cron add --every 2h --name "backup-eva" --tools exec --message
  "Rotina de backup: rode no workspace 'git add -A && git commit -m auto-backup-$(date -u +%FT%TZ) || true && git push -q'. Responda só 'backup ok' ou o erro."`
- **VM própria (mais robusto):** além/no lugar do cron, instale um **systemd timer** (oneshot a
  cada 2h) que roda o `git push` — independe do agente estar de pé. (Ver `install/`.)

### 5. ✅ VERIFICAR (não pule — é o que garante)
- Dispare um backup **agora** e **confirme** que o commit apareceu no GitHub (peça pra pessoa
  recarregar a página do repo e ver o arquivo `MEMORY.md` lá, ou cheque via API/`gh`).
- Só diga "pronto" depois de **ver o commit no GitHub**. Comemore: "🛟 Cofre ativo! Sua Eva agora
  se salva sozinha no seu GitHub a cada 2h. Pode dormir tranquilo. 🎉"

## Restaurar (se o servidor morrer um dia)
A pessoa monta uma Eva nova (gerenciado ou VM) e, no primeiro acesso, manda a Eva clonar o cofre:
`git clone https://github.com/<user>/minha-eva-backup.git` para dentro do workspace → memória e
identidade voltam. (Documente isso pra ela num `COMO-RESTAURAR.md` no próprio cofre.)

## Regras
- **Token nunca no chat depois de usado, nunca no repositório.** Só no `.git/config` local.
- Repo do cofre **sempre privado**.
- Verifique o commit no GitHub antes de concluir. Sem verificação, não há backup.
- No gerenciado, **avise** que o backup do provedor não substitui este (pode expirar/falhar).
