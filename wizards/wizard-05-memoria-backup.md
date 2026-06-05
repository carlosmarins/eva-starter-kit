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

## Parte C — Espaço em disco (pra não entupir a cota) 🧹
> Atenção real: em serviço gerenciado a cota é pequena (ex.: 10GB) e ela **enche rápido** — o que
> mais cresce é **sessão, mídia e logs** (não a memória, que é texto leve). Quem criou este kit
> quase bateu 10GB em 3 dias por causa disso.
1. **O cofre leva só texto** (a skill `backup-eva` já põe um `.gitignore` enxuto que exclui
   `.sqlite`, `sessions/`, `media/`, `logs/`, `node_modules/`, binários). Nunca versione isso — o
   `.git` incharia pra sempre.
2. **Retenção automática (defaults sensatos — faça já, sem perguntar config pro leigo):** deixe a Eva
   se auto-limpar. Aplique uma vez:
   - `openclaw config set cron.sessionRetention 48h` (sessões de cron não acumulam).
   - (opcional) cape o contexto p/ performance: `openclaw config set agents.defaults.contextTokens 200000`.
   - Rode `openclaw sessions cleanup --enforce` agora e deixe agendado (heartbeat/guardião cuidam depois).
3. **Faxina automática LIGADA por padrão (sobretudo no GERENCIADO):** instale a skill **`guardiao-eva`**
   — relatório semanal que poda **sessões (~30d), mídia (>30d), logs e trace do Codex**, compacta o
   cofre e **avisa a ~75%** da cota, **sem nunca tocar** no cérebro/identidade/cofre-de-aprendizado.
   No gerenciado (cota pequena) **não trate como opcional** — é o que evita o estouro de disco.
4. **Prove que restaura:** instale a skill **`restore-drill`** (simulado mensal) — backup não-testado
   não é backup. Ela clona o cofre num /tmp, confere os arquivos vitais e reporta se a Eva é 100%
   recuperável (sem tocar na produção).
5. 💡 **Dica de cota pequena:** se a pessoa quer o **mais leve possível**, o **Gemini** ocupa menos
   disco que o ChatGPT/Codex (que mantém um arquivo de trace local que cresce). Vale pra quem tem plano básico.

## Parte D — (opcional, avançado) Manutenção automática
Para VM própria: ofereça um job semanal que faz snapshot → patches de SO → update do OpenClaw,
com **health-check e rollback automático** se algo quebrar. (Ver `install/` / docs.)

## Stop condition
Backup do workspace rodando automático (confirmado por um commit recente no repo), faxina/guardião
agendados e, em VM, o snapshot diário agendado.

## Encerramento da jornada 🎉
Quando terminar, parabenize de verdade:
> "Pronto! 🎉 A **<nome da Eva>** está viva, conectada e com backup. Ela é sua. Pode conversar
> com ela quando quiser — e sempre que precisar de mais uma ferramenta, é só me chamar."
