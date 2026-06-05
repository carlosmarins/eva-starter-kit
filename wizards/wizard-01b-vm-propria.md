---
name: wizard-01b-vm-propria
description: Caminho PODEROSO. Guia a pessoa a criar uma VM própria na Google Cloud e instalar a Eva (OpenClaw) do zero via install-eva.sh, com systemd, backup e snapshot. Use quando a pessoa escolheu VM própria no wizard-00.
user-invocable: true
---

# Wizard 01b — Casa própria (VM na Google Cloud)

Objetivo: a pessoa ter uma VM rodando OpenClaw, com gateway supervisionado por systemd, backup
e snapshot — tudo automatizado pelo `install/install-eva.sh`. Você faz o pesado; ela cria a conta
e cola comandos quando você pedir.

## Antes — avise honestamente
> "Esse caminho leva ~20 min e é mais 'mão na massa', mas eu te guio em cada passo. Você vai
> precisar de uma conta Google Cloud (tem créditos grátis no início) e um cartão pra ativar.
> Quando travar, é só me mandar o que apareceu na tela."

## Passos

1. **Conta Google Cloud.** Guie a criar/entrar em https://console.cloud.google.com, criar um
   **projeto** novo, e **ativar o faturamento** (cartão). Explique: "isso é só pra ligar a conta;
   o uso inicial costuma cair nos créditos grátis."
2. **Abrir o Cloud Shell** (ícone `>_` no topo do console) — "é um terminal que já vem pronto, sem
   instalar nada". Peça pra ela colar os comandos que você mandar e te enviar a saída.
3. **Trazer o kit + provisionar a VM.** ⚠️ O Cloud Shell **não tem os arquivos do kit** — clone
   primeiro. Oriente a colar:
   ```bash
   git clone https://github.com/carlosmarins/eva-starter-kit && cd eva-starter-kit/install
   bash provision-gcp.sh <ID_DO_PROJETO_DELA>
   ```
   (cria APIs, service account, VM `e2-standard-4` Ubuntu, firewall, chave Gemini, snapshot diário).
4. **Instalar a Eva na VM.** O `install-eva.sh` **não está na VM** — baixe do GitHub na hora. Entre
   na VM e cole a linha única (o passo 3 também imprime ela no final):
   ```bash
   gcloud compute ssh eva --zone=us-central1-a --project=<ID_DO_PROJETO>
   curl -fsSL https://raw.githubusercontent.com/carlosmarins/eva-starter-kit/main/install/install-eva.sh | sudo bash
   ```
   Instala Node 24 + OpenClaw, cria o usuário `openclaw`, sobe o gateway via **systemd** (restart automático).
5. **Modelo do agente** — configure o provedor de modelo (o wizard pergunta: usar a chave do
   Google/Gemini, que dá pra gerar no próprio projeto, é o caminho mais simples/keyless).
6. **Validar** — `openclaw status` + um "oi" de teste. Comemore quando responder. ✅

## Stop condition
`openclaw status` mostra o gateway ativo e o agente responde a um "oi".

## Próximo passo
→ **wizard-02-identidade**.

## Princípios de robustez (já embutidos no install)
- **Um supervisor só** (systemd) — nunca dois (evita conflito que derruba o agente).
- **Backup** do workspace pro Git + **snapshot** diário do disco (ver wizard-05).
- Segredos em `~/.openclaw/.env`/`credentials/` (chmod 600), **nunca** no Git.
