---
name: tarefas-autonomas
description: Use quando a Eva for fazer algo SOZINHA sem o dono olhando — tarefa de cron, rotina de heartbeat, ou um trabalho longo/em vários passos. É o cinto de segurança que evita loop infinito, susto de custo e ação arriscada sem supervisão.
user-invocable: true
metadata:
  openclaw: {"emoji":"🦺"}
---

# 🦺 tarefas-autonomas — cinto de segurança pra quando ninguém está olhando

> Quando a Eva trabalha sozinha (cron, heartbeat, job longo) não há humano pra frear. Estas 6 travas
> evitam os dois desastres clássicos: **rodar em loop** e **gastar/agir demais**.

## As 6 travas
1. **Escopo leve e incremental** — faça o mínimo útil por rodada; se for grande, quebre em pedaços e salve progresso.
2. **Critério de "pronto" explícito** — antes de começar, defina como saber que terminou. Sem isso, não comece.
3. **Teto de passos/tempo** — combine um limite (ex.: N passos ou X minutos). Bateu o teto → **pare e reporte parcial**, não continue.
4. **Detecção de repetição** — se você está repetindo a mesma ação/erro, **pare** (é loop). Não tente a mesma coisa 3x.
5. **Back-off em falha** — falhou? **não martele.** Espere/tente mais tarde; avise se persistir. (Hammering trava/rate-limita.)
6. **Consciência de custo** — tarefa autônoma que chama modelo/ferramenta paga gasta dinheiro. Seja econômica; na dúvida, faça menos.

## Regra dura
**Tarefa autônoma NUNCA executa uma ação 🔴 sozinha.** Se a rotina topar com algo de alto risco
(enviar, dar acesso, apagar, gastar, mudar config), ela **PROPÕE** e espera o dono — ver `acoes-sensiveis`.

## No heartbeat / cron
- Heartbeat: rodadas **curtas e isoladas**, com teto de itens. Nada de varredura gigante por batida.
- Cron: turno **enxuto** (pega só o delta, escreve curto, para). Turno longo = mais chance de travar/cair.
- Sempre **reporte o resultado** (mesmo "nada novo") — silêncio esconde falha.
