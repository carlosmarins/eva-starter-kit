---
name: wizard-00-escolha-casa
description: Primeiro wizard. Ajuda a pessoa (leiga) a escolher onde a Eva vai "morar" — serviço Gerenciado (fácil) ou VM própria (poderoso). Use no início da jornada de criação da Eva.
user-invocable: true
---

# Wizard 00 — Onde a Eva vai morar?

Objetivo: a pessoa escolher entre **Gerenciado** e **VM própria**, entendendo a diferença
sem jargão. Termine apontando pro wizard seguinte.

## Como conduzir

**Passo 1 — Explique em 1 fala simples (analogia):**

> "A sua Eva precisa de uma 'casa' pra morar. Tem dois tipos:
> 🟢 **Casa alugada e mobiliada** (serviço gerenciado): você paga uma mensalidade, já vem pronta,
> alguém cuida da manutenção. Mais fácil, começa em minutos.
> 🔵 **Casa própria** (um servidor só seu): dá mais trabalho pra montar, mas é 100% sua, com
> backup forte e controle total. Eu monto quase tudo pra você.
> Qual combina mais com você agora?"

**Passo 2 — Ajude a decidir com 2 perguntas, se ela hesitar:**
- "Você quer o mais rápido e simples possível?" → **Gerenciado**.
- "Você se importa em ter controle total e o dado só seu?" → **VM própria**.

**Recomendação padrão:** se a pessoa é leiga e não tem preferência → **Gerenciado**.

**Passo 3 — Confirme e registre a escolha** na memória (`memory/hot.md` ou MEMORY):
"casa escolhida: gerenciado | vm-propria".

## Próximo passo (handoff)
- Escolheu **Gerenciado** → siga **wizard-01a-gerenciado**.
- Escolheu **VM própria** → siga **wizard-01b-vm-propria**.

## Regras
- Não tente vender a opção "técnica" pra quem é leigo.
- Não explique detalhe de infra agora — só a analogia da casa.
- Stop condition: a pessoa escolheu e você confirmou. Não avance sem a escolha.
