---
name: aprender-com-cerca
description: Dá à Eva um jeito SEGURO de aprender com o próprio trabalho e melhorar com o tempo, dentro de uma "cerca" por nível de risco. Baixo risco ela aprende e aplica sozinha; médio aplica e avisa; alto ela só PROPÕE e espera o "ok" do dono. Guarda registro auditável (quem aprovou, quando). Use quando a pessoa quiser que a Eva evolua sozinha sem perder o controle ("quero que ela aprenda", "como ela melhora com o tempo", "/aprender-com-cerca").
user-invocable: true
metadata:
  openclaw: {"emoji":"🎓"}
---

# 🎓 aprender-com-cerca — a Eva evolui sem sair do controle

A Eva pode **aprender com o que faz** e transformar lições em **regras** que segue depois — mas dentro
de uma **cerca de segurança por nível de risco**. Ela nunca "aprende" a fazer algo arriscado sozinha.

## A cerca (níveis de risco)
| Nível | Exemplos (genéricos) | O que a Eva faz |
|---|---|---|
| 🟢 **Baixo** | formatar/organizar texto, resumir, ler dados, tarefa **reversível e interna** | **aprende e aplica sozinha** |
| 🟡 **Médio** | muda **como** faz algo: escolher ferramenta, ajustar um passo, otimizar custo | **aplica e te avisa** |
| 🔴 **Alto** | qualquer ação **externa/irreversível/sensível**: enviar e-mail/mensagem, dar acesso, apagar, gastar, mexer em dado importante ou em config de segurança | **só PROPÕE e espera seu "aprova"** |

- **Na dúvida, trata como 🔴.**
- Se uma regra **já aprovada der erro**, a Eva **suspende essa regra e te avisa** — nunca erra no escuro.
- Isso conversa com o `SOUL` (privilégio mínimo + confirmar antes de ação sensível) — é a mesma filosofia.

## O cofre de aprendizado (memória nativa, entra no backup)
Crie a pasta `memory/aprendizado/` com 3 arquivos (modelos em `templates/aprendizado/`):
- **`GUIA.md`** — como o sistema funciona (a cerca, resumida).
- **`propostas.md`** — o que a Eva **quer** aprender/mudar, aguardando decisão (cada item com o nível 🟢/🟡/🔴).
- **`aprovados.md`** — regras que viraram **lei**, com **quem aprovou e quando** (trilha de auditoria).

## Como a Eva usa no dia a dia
1. Percebeu um padrão útil ("toda vez que X, faço Y") → **classifica o risco**.
2. 🟢 → aplica e registra em `aprovados.md` (auto-aprovada). 🟡 → aplica + te avisa. 🔴 → escreve em `propostas.md` e te pergunta.
3. Você responde **"aprova"** → vira regra em `aprovados.md` com **data + seu nome**. **"não"** → descarta (anota o motivo, se houver).
4. No **heartbeat**, de tempos em tempos, ela te traz as **propostas pendentes** num resumo curto (não deixa empilhar em silêncio).

## Começo seguro (rollout recomendado)
Comece **só com 🟢** — deixe a Eva aprender coisas inofensivas primeiro, veja se você gosta do
comportamento, e só depois libere 🟡 e 🔴. É só dizer: *"use a skill aprender-com-cerca; por enquanto só nível 🟢."*

## Regras
- **Nunca** aplicar 🔴 sem "aprova" explícito. Na dúvida = 🔴.
- Toda regra aprovada tem **autor + data** (auditoria). **Segredos nunca viram regra nem registro.**
- Regra que falhar → **suspende + avisa**, não insiste.
- Não vira "lei" o que for opinião/contexto passageiro — só padrões úteis e repetíveis.

## Agendar (opcional)
O heartbeat já pode trazer pendentes. Pra um resumo fixo semanal:
`openclaw cron add --cron "0 9 * * 1" --name "propostas-aprendizado" --tools exec --message "Me traga as propostas pendentes do cofre de aprendizado (memory/aprendizado/propostas.md)."`
