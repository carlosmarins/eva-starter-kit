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

## Parte B — Backup automático (faça SEMPRE, e CEDO) 🛟
> **Esta é a parte que evita o desastre.** Idealmente faça logo após o agente estar no ar — não
> deixe a pessoa investir horas na Eva sem o cofre ligado.

1. **Use a skill dedicada `backup-eva`** — ela configura o cérebro da Eva sendo empurrado pra um
   **GitHub PRIVADO do próprio dono**, a cada 2h, pela **própria Eva** (cron do OpenClaw). Funciona
   **mesmo em serviço gerenciado travado** e **verifica** (só conclui quando vê o commit no GitHub).
2. **VM própria — reforço:** adicione um **snapshot diário do disco** (GCP resource-policy, ~14 dias)
   + opcionalmente um systemd timer pro push (mais robusto que o cron do agente).
3. **Gerenciado — regra de ouro:** o backup do provedor **não conta** (pode expirar/falhar, foi o que
   derrubou quem criou este kit). O cofre no GitHub do dono (passo 1) é o que garante.

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
