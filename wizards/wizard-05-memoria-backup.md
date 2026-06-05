---
name: wizard-05-memoria-backup
description: Liga a memória da Eva (hot.md + manutenção via heartbeat) e o backup automático pra nunca perder nada (workspace -> Git a cada X horas; e snapshot diário do disco, no caso de VM própria). Use por último na criação da Eva.
user-invocable: true
---

# Wizard 05 — Memória + Backup (pra nunca perder a Eva)

Objetivo: a Eva lembrar das coisas E ter backup automático. Esta é a lição mais importante:
**sem backup próprio, um dia você perde tudo.**

## Parte A — Memória que se mantém
1. Garanta que existe `memory/hot.md` (contexto quente) e que o `MEMORY.md` está **enxuto**
   (fatos estáveis; o histórico longo vai pra `memory/` datado, não pro MEMORY.md).
2. Configure o **heartbeat** pra fazer manutenção de memória a cada ~3 dias (destila aprendizados).
3. Higiene: ensine os comandos `/new` (assunto novo) e `/compact` (sessão longa) e a regra
   "no máximo 3-4 tópicos no Telegram" (senão o contexto entope e ela fica lenta).

## Parte B — Backup automático (faça SEMPRE)
1. **Workspace → Git.** Crie um repositório **privado** (GitLab/GitHub da pessoa). Transforme
   `~/.openclaw/workspace` num repo e configure um **timer** (systemd ou cron) que faz
   `add/commit/push` automático a cada **2 horas**. Assim memória/identidade/skills ficam versionadas
   **fora** do servidor. (Segredos no `.gitignore` — nunca sobem.)
2. **VM própria — snapshot diário do disco.** Crie um agendamento de snapshot (GCP resource-policy)
   no disco da VM, retendo ~14 dias. Recuperação completa em minutos se a VM morrer.
3. **Gerenciado — não confie só na plataforma.** O backup do workspace pro Git (passo 1) é
   essencial, porque o backup nativo do provedor pode falhar/expirar.

## Parte C — (opcional, avançado) Manutenção automática
Para VM própria: ofereça um job semanal que faz snapshot → patches de SO → update do OpenClaw,
com **health-check e rollback automático** se algo quebrar. (Ver `install/` / docs.)

## Stop condition
Backup do workspace rodando automático (confirmado por um commit recente no repo) e, em VM, o
snapshot diário agendado.

## Encerramento da jornada 🎉
Quando terminar, parabenize de verdade:
> "Pronto! 🎉 A **<nome da Eva>** está viva, conectada e com backup. Ela é sua. Pode conversar
> com ela quando quiser — e sempre que precisar de mais uma ferramenta, é só me chamar."
