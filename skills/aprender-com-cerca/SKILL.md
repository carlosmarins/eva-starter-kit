---
name: aprender-com-cerca
description: Use quando a pessoa quiser que a Eva melhore com o uso sem perder o controle ("quero que ela aprenda", "ela aprende sozinha?", "como ela fica melhor com o tempo", "/aprender-com-cerca"), ou para a rotina de revisão de aprendizado no heartbeat. É o sistema de auto-aprendizado com cerca de risco, confiança e auditoria.
user-invocable: true
metadata:
  openclaw: {"emoji":"🎓"}
---

# 🎓 aprender-com-cerca — a Eva evolui sem sair do controle

A Eva aprende com o próprio trabalho e vira **regras** que segue depois — dentro de uma **cerca por
risco**, com **confiança que sobe e desce** e **auditoria**. Nunca "aprende" a fazer algo arriscado sozinha.

## A cerca (níveis de risco)
| Nível | Exemplos genéricos | O que faz |
|---|---|---|
| 🟢 **Baixo** | formatar/organizar, resumir, ler/parsear, tarefa **reversível e interna** | **aplica sozinha** |
| 🟡 **Médio** | escolher ferramenta, ajustar um passo, otimizar custo/rotina | **aplica e avisa** |
| 🔴 **Alto** (lista **FECHADA e curta**) | **gastar dinheiro/comprar · dar ou tirar acesso · enviar/publicar pra fora · apagar dados · mudar config importante/de segurança** | **só PROPÕE; vira regra só com "aprova"** |

**Na dúvida = 🔴.** (Isso é a mesma filosofia do `SOUL` — privilégio mínimo + confirmar ação sensível.)

## Confiança por contagem (não "nota" que o modelo chuta)
- `baixa` (visto 1–2x) · `média` (3–5x) · `alta` (6+x).
- **Cada contradição** (dono corrige, rejeita ou desfaz) **derruba 1 nível** e marca a regra **`EM REVISÃO`**
  — nada de regra subir pra sempre sem o dono. Sem drift silencioso.

## Autonomia controlada (pra NÃO pedir aprovação o tempo todo)
1. 🟡 confirmada **6+x sem falha** → **promove sozinha a 🟢** (só avisa).
2. 🔴 **aprovada 1x** → vira **regra permanente**; não re-pergunta o mesmo caso.
3. 🔴 pendentes vão num **digest semanal** (não interrompem a cada vez).

## Captura automática (não depende de "lembrar")
- Ao longo do trabalho, a Eva **anexa 1 linha** em `memory/aprendizado/observacoes.md` (append-only, **não lida no chat**).
- A **revisão do heartbeat** (sessão isolada/leve, **máx ~10 itens por vez**) minera `observacoes.md` + dailies →
  cria propostas, aplica 🟢, promove 🟡→🟢 e aplica o decaimento. **Nada disso roda no boot** (performance).

## Redação de segredos (sempre)
Nunca escrever token, chave/senha, número de **cartão, conta bancária ou documento** em observações,
propostas ou regras — usar `[REDACTED]`. Segredo não vira aprendizado.

## Arquivos (memória nativa, entra no backup)
- `observacoes.md` — captura bruta (append-only, não lida no chat). Modelos em `templates/aprendizado/`.
- `propostas.md` — staging: o que ela quer aprender, com risco e confiança, aguardando decisão.
- `aprovados.md` — regras que viraram **lei**, com **o quê / quem aprovou / quando** (auditoria). Marca `EM REVISÃO` quando cai.

## Começo seguro (rollout)
Comece **só com 🟢**; veja se gosta; depois libere 🟡 e 🔴. Diga: *"use aprender-com-cerca; por enquanto só 🟢."*

## Regras
- **Nunca** aplicar 🔴 sem "aprova". Na dúvida = 🔴. Regra que falhar → suspende/`EM REVISÃO` + avisa.
- Toda regra aprovada tem autor + data. Segredos nunca viram regra. Não vira lei opinião passageira.
