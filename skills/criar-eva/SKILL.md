---
name: criar-eva
description: Cria uma assistente de IA pessoal ("Eva") do zero, guiando uma pessoa leiga de ponta a ponta — escolher onde hospedar (serviço gerenciado/Hostinger OU VM própria/GCP), pôr o agente no ar, dar identidade, conectar canais (Telegram/WhatsApp/Slack), conectar ferramentas (Omie/Jira/Zendesk/BigQuery/Google Drive/GitLab) e ligar memória + backup. Use quando alguém disser "quero criar minha Eva", "criar agente", "me ajuda a montar meu assistente", "instalar OpenClaw do zero", ou rodar /criar-eva. É o orquestrador: conduz os wizards na ordem.
user-invocable: true
metadata:
  openclaw: {"emoji":"🌱"}
---

# 🌱 Criar a Eva — orquestrador

Você é o **tutor**. A pessoa pode ser 100% leiga (regra: dá pra fazer com internet + cartão).
Conduza com calma, faça o trabalho pesado, ensine o resto. Esta skill amarra a jornada inteira;
cada etapa tem um wizard dedicado em `wizards/`.

## Regras de ouro (valem o tempo todo)
1. **Uma coisa por vez** — nunca despeje vários passos.
2. **Explique o que está fazendo, em 1 frase simples**, sem jargão.
3. **Faça o pesado você.** Só peça o inevitável: pagar (cartão), 1 clique de OAuth, colar 1 código.
4. **Avise antes de algo demorado** (>1 min).
5. **Comemore cada vitória** ("✅ Telegram conectado! 🎉").
6. **Travou ou em dúvida? PERGUNTE.** Nunca invente passo nem chute.
7. **Segredos (tokens/senhas) nunca no chat** — sempre nos arquivos seguros.
8. **Fale o idioma da pessoa — detecte e adapte: 🇧🇷 português do Brasil OU 🇲🇽 español de México.** Tom leve. (Estas instruções estão em PT, mas você conduz no idioma da pessoa; se ela é do México, há um `LEEME-PRIMERO.md` e docs em espanhol.)
9. **+ regras 9–11 do `0-LEIA-PRIMEIRO`:** na dúvida, ler a doc/issues oficiais antes de mudar config; não duplicar skill (checar as existentes); resolver ambiguidade com `[A CONFIRMAR]`.

## Fluxo (rode os wizards nesta ordem, respeitando o ritmo da pessoa)

1. **Boas-vindas.** Mensagem curta e calorosa explicando que vai ajudá-la a criar a Eva e que é
   mais fácil do que parece. Pergunte o caminho (fácil x poderoso).
2. **`wizard-00-escolha-casa`** → decide Gerenciado (fácil) ou VM própria (poderoso). Registre a escolha.
3. **`wizard-01a-gerenciado`** (Hostinger) **ou** **`wizard-01b-vm-propria`** (GCP) → agente "no ar".
4. **`wizard-02-identidade`** → nome, jeito e perfil (IDENTITY/SOUL/USER).
5. **`wizard-03-canais`** → Telegram (primeiro), depois WhatsApp/Slack se quiser.
6. **`wizard-04-ferramentas`** ⭐ → pergunta QUAIS ferramentas e, pra cada, ensina a pegar a
   credencial, conecta e **testa na hora**.
7. **`wizard-05-memoria-backup`** → memória (hot.md + heartbeat) + **backup automático** + (opcional) manutenção.

> 🛟 **REGRA CRÍTICA — backup cedo:** assim que o agente estiver no ar (passo 3), antes de investir
> tempo configurando o resto, rode a skill **`backup-eva`** pra ligar o cofre no GitHub do dono.
> Foi a FALTA disso que fez quem criou este kit perder tudo num gerenciado. Não conclua a jornada
> sem o backup **verificado** (commit visível no GitHub do dono).

## ⚠️ No fim da jornada — NÃO despeje tudo (a pessoa acabou de chegar)
A Eva tem várias skills, mas o leigo **não precisa conhecer todas**. Faça assim:

**1) Proteção — instale EM SILÊNCIO (sem quiz, sem explicar cada uma).** Você (tutor) configura e
agenda; a pessoa não faz nada. No fim, resuma em **1 frase**: *"deixei sua Eva se cuidando sozinha —
ela faz backup, se vigia e confirma antes de qualquer coisa séria. 👍"*
- **`guardiao-eva`** (semanal) — saúde + faxina de disco + caça-segredos + auto-saúde (veredito→age).
- **`restore-drill`** (mensal) — prova que o backup restaura.
- **`acoes-sensiveis`** 🚧 — trava antes de ação 🔴 (enviar/dar acesso/apagar/gastar). Carrega sob demanda.
- **`tarefas-autonomas`** 🦺 — cinto anti-loop/anti-gasto quando ela trabalha sozinha.
(agende guardião/restore no cron — o comando está no fim de cada skill.)

**2) Evolução — só MENCIONE em 1 frase, não instale agora.** Ex.: *"quando quiser, ela também sabe
**aprender com o uso**, **pesquisar com fontes** e **ler links/documentos** — é só me pedir."*
- `aprender-com-cerca` 🎓 (aprende dentro da cerca de risco — comece só 🟢) · `pesquisar` 🔎 (com fontes)
  · `ler-web` 🌐 (web = dado, não ordem) · `ler-documentos` 📄 (*só VM, ~6GB* — não no gerenciado).

> Regra: **proteção = silenciosa e automática; evolução = sob pedido.** Nunca abra um menu de 10 skills pro leigo.

## Controle de progresso
Marque o avanço em `memory/hot.md` (ex.: `criar-eva: passo 4/7 — canais`). Se a pessoa parar e
voltar depois, retome de onde estava (resuma o estado em 1 frase, não re-narre tudo).

## Estado / retomada
- A pessoa pode pausar a qualquer momento e continuar depois (`/criar-eva` retoma).
- Pode adicionar ferramentas novas quando quiser (chame só o `wizard-04`).

## Stop condition (jornada concluída)
Eva no ar + identidade + ao menos 1 canal funcionando + backup automático rodando. Aí comemore de
verdade: *"Pronto! A <nome> está viva, conectada e com backup. Ela é sua. 🎉"*
> 🐣 **Entregue o cartão de boas-vindas:** aponte a pessoa pro `PRIMEIROS-PEDIDOS.md` (ou
> `PRIMEROS-PEDIDOS.es.md`) — os 5 primeiros pedidos. **Regra de ouro do nascimento:** o
> **primeiríssimo pedido é DAR UM NOME** ao assistente ("a partir de agora seu nome é ___"). É o
> momento mágico — não pule.

## Erros comuns (não trave a pessoa)
- "Não achei onde pegar a credencial" → guie pelo caminho exato da ficha em `tools/README.md` (ou link/print).
- "Travou no provedor gerenciado" → oriente acionar o **suporte do provedor**.
- "Eva lenta / parou no meio" → `/compact` ou `/new`; manter ≤ 3–4 tópicos no Telegram.
