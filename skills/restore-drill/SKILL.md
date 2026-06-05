---
name: restore-drill
description: Simulado de recuperação — prova que o backup da Eva REALMENTE restaura (não basta fazer backup; backup não-testado não é backup). Clona o cofre num espaço temporário, verifica os arquivos vitais e reporta ao dono se a Eva é recuperável. Use 1x por mês (ou sob comando "testar backup", "/restore-drill", "será que meu backup funciona?").
user-invocable: true
metadata:
  openclaw: {"emoji":"🧪"}
---

# 🧪 restore-drill — provar que a Eva renasce

> **A lição mais dura de backup:** *backup que nunca foi testado não é backup.* Muita gente
> "tinha backup" e mesmo assim perdeu tudo, porque ninguém validou que dava pra voltar. Esta skill
> testa de verdade — **sem mexer na Eva de produção**.

## O que faz (read-only, seguro)
1. **Clona o cofre num diretório temporário** (NÃO toca no workspace ativo):
   `git clone <url-do-cofre> /tmp/eva-drill-<data>`
2. **Verifica os arquivos vitais** no clone: `MEMORY.md`, `IDENTITY.md`, `SOUL.md`, `USER.md`,
   `AGENTS.md` e a pasta `memory/`. Confere que existem e não estão vazios/corrompidos.
3. **Mede o frescor:** data do último commit do cofre (quão velho é o backup).
4. **Confere o `COMO-RESTAURAR`** está presente no cofre.
5. **Apaga o diretório temporário** (`rm -rf /tmp/eva-drill-*`).
6. **Reporta ao dono** no canal principal, em linguagem de gente.

## O veredito (mande exatamente um destes)
- ✅ Tudo certo:
  > "🧪🛟 Simulado de recuperação OK! Sua Eva é **100% recuperável**. Último backup há {idade}.
  > Se algo acontecer com o servidor, você volta em minutos. Pode ficar tranquilo. 🎉"
- 🚨 Algo faltando/quebrado (ex.: cofre vazio, MEMORY.md ausente, backup velho demais):
  > "🚨 Atenção: o simulado encontrou um problema — {o quê}. Seu backup pode não restaurar.
  > Vamos consertar agora?" → e proponha a correção (rodar `backup-eva`, checar credencial, etc.)

## Regras
- **Nunca** toque no workspace de produção nem nas credenciais — só clona o cofre num /tmp e apaga depois.
- Se o cofre não existe/clone falha → é exatamente o tipo de problema que esta skill existe pra pegar: **avise o dono**.
- Frescor: se o último backup tem **mais de ~3 dias**, alerte (o backup pode ter parado).
- Rode **mensalmente** (agende no cron do OpenClaw) e **sob comando** quando o dono pedir.

## Agendar (opcional, recomendado)
`openclaw cron add --cron "0 9 1 * *" --name "restore-drill-mensal" --tools exec --message "Rode o simulado de recuperação (skill restore-drill) e me reporte o veredito."`
