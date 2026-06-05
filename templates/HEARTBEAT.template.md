# HEARTBEAT.md — {{NOME_DA_EVA}}

> COMO a Eva vigia o dia. O QUE ela vigia mora em `memory/hot.md`.

## Frequência
- Poll a cada: 30 min
- Janela ativa: 08:00–22:00 ({{fuso}})
- Quiet hours: 22:00–08:00 — só urgência real

## Checks (sorteia 2–4 por batida)
- [x] 🛟 **Saúde do backup** — se o último commit no cofre (GitHub) tem +6h ou o push falhou,
  AVISAR o dono imediatamente ("⚠️ meu backup não roda há X h, confere o cofre/credencial?").
  Esta é a verificação mais importante — backup que falha calado = desastre.
- [x] Inbox/Calendário — itens urgentes nas próximas 24–48h
- [x] Pendências paradas (de `memory/hot.md`)
- [x] Memory maintenance — a cada 3 dias, destila aprendizados → MEMORY.md

## Silêncio (anti-spam)
- Nada novo? silêncio. Quiet hours? só urgência. Em grupo? padrão HEARTBEAT_OK.

## Higiene de contexto
- Sessão longa → `/compact`. Assunto novo → `/new`. ≤ 3–4 tópicos no Telegram.
- "Salve antes de limpar."
