# Eva Starter Kit 🌱

Crie a **sua própria assistente de IA pessoal** (a "Eva", rodando em OpenClaw) — mesmo sem saber
nada de tecnologia. Você só precisa de **internet e um cartão de crédito**.

> A mágica: você **não lê manual**. Você conversa. O próprio agente lê este kit e vira o seu
> **tutor**, te guiando passo a passo, fazendo o trabalho pesado e te ensinando o resto.

## Como funciona (3 passos)
1. **Tenha um agente "no ar"** — pelo jeito **fácil** (serviço gerenciado, em minutos) ou
   **poderoso** (uma VM só sua). O kit te guia nos dois.
2. **Dê este kit pro agente** — ele lê o `0-LEIA-PRIMEIRO.md` e assume como tutor.
3. **Responda as perguntas dele** — identidade, canais (Telegram/WhatsApp/Slack), ferramentas
   (Omie, Jira, Drive, etc.) e backup. Em ~30 min você tem a sua Eva.

## Dois caminhos
| | 🟢 Gerenciado (fácil) | 🔵 VM própria (poderoso) |
|---|---|---|
| Pra quem | Não-técnico, quer rapidez | Quer controle total + backup robusto |
| Como | Contrata um plano (Hostinger) → agente pronto | Roda 1 instalador numa VM (GCP) |
| Tempo | ~5 min | ~20 min (guiado) |

## O que tem no kit
- `0-LEIA-PRIMEIRO.md` — instruções pro agente virar tutor
- `wizards/` — os assistentes passo a passo (escolha-casa → identidade → canais → ferramentas → backup)
- `install/` — `install-eva.sh` (monta a VM do zero) e `provision-gcp.sh`
- `tools/` — ferramentas comuns prontas pra conectar (Omie, Jira, Zendesk, BigQuery, Drive, GitLab...)
- `templates/` e `exemplos/` — modelos de identidade e uma Eva de referência
- `FAQ.md` — dúvidas comuns

## Começando
- **Gerenciado:** siga o `FAQ.md` → "Como contratar" e depois cole este kit pro seu agente.
- **VM própria:** veja `install/README` ou deixe o `wizard-01b` te guiar.

Feito com ❤️ pra deixar IA pessoal ao alcance de qualquer um.
