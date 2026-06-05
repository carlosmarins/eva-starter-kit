
# 🌱 Eva Starter Kit — crie a sua assistente de IA pessoal

> 🇧🇷 **Português (você está aqui)** · 🇲🇽 **Español:** [README.es.md](README.es.md)

> **Em 1 frase:** este kit te ajuda a ter a **sua própria assistente de inteligência artificial**
> (vamos chamar de **Eva**) — que conversa com você no Telegram/WhatsApp, lembra das suas coisas e
> usa as suas ferramentas. **Você não precisa saber nada de tecnologia.** É só seguir os passos.

> 🧒 **Feito pra qualquer pessoa.** Se você sabe usar WhatsApp e fazer uma compra na internet,
> você consegue. A própria Eva vira sua **professora** e faz o trabalho difícil por você.

---

## ✅ O que você precisa (só isso)
- 📶 Internet
- 💳 Um cartão de crédito
- ⏱️ ~15 a 30 minutos
- ☕ Calma — vai dar tudo certo

---

## 🛣️ Existem 2 jeitos. Qual é o seu?

Pense numa **casa** pra sua Eva morar:

| | 🟢 **Jeito FÁCIL** (casa alugada) | 🔵 **Jeito PODEROSO** (casa própria) |
|---|---|---|
| Pra quem | Quer o **mais simples** possível | Quer **controle total** e é mais curioso |
| Como | Você assina um serviço pronto (Hostinger) | Você cria um servidor na Google (guiado) |
| Tempo | ~5 min | ~20 min |
| **Recomendado pra começar** | ⭐ **SIM** | — |

> 👉 **Na dúvida, vá no Jeito FÁCIL (🟢).** Você pode mudar depois.

---

## 🟢 JEITO FÁCIL — passo a passo (Hostinger)

Quando você entra na Hostinger, cai no **hPanel** (seu painel de controle):

![Tela inicial do hPanel da Hostinger](docs/img/00-hostinger-hpanel.png)

### Passo 1 — Achar o OpenClaw no menu
No menu da **esquerda**, em **"Agentes de IA"**, clique em **OpenClaw**.

![Menu lateral: Agentes de IA -> OpenClaw](docs/img/01-hostinger-menu.png)

### Passo 2 — Começar
Clique no botão roxo **"Comece agora"** (ou em **"Adicionar OpenClaw"**).

![Página do OpenClaw com o botão Comece agora](docs/img/02-hostinger-openclaw.png)

### Passo 3 — Escolher o plano e pagar 💳
Escolha a duração (o de **1 mês** já serve pra testar; os planos maiores saem mais barato por mês),
deixe os **créditos de IA** marcados, escolha a forma de pagamento e confirme.

![Tela de seleção do plano e pagamento](docs/img/03-hostinger-plano.png)

> 🔒 Só **você** digita o cartão. Tem **30 dias de reembolso garantido**.

### Passo 4 — Acessar a sua Eva
Feito o pagamento, sua Eva aparece aqui. Clique em **"OpenClaw"** (abre o painel dela) ou em
**"Abrir linha de comando (CLI)"** pra **conversar com o agente**.

![Painel do OpenClaw com o seu agente](docs/img/04-hostinger-agente.png)

### Passo 5 — Mandar a Eva ler o kit e te ensinar
No chat do seu novo agente, **cole exatamente esta mensagem**:

> *"Leia o meu kit de instalação aqui: https://github.com/carlosmarins/eva-starter-kit — comece pelo
> arquivo `0-LEIA-PRIMEIRO.md`, traga o kit pro seu workspace e seja meu tutor a partir daí."*

> 💡 **Por que um link, e não um arquivo?** O chat do painel **não aceita anexos**, e o Telegram só
> vamos ligar mais pra frente. Como o kit é público no GitHub, a Eva simplesmente **lê ele do link**
> e se instala sozinha. (O comando `/criar-eva` passa a existir só depois que ela puxa o kit.)

Pronto! A partir daí **a própria Eva te guia** — o nome dela, o Telegram, suas ferramentas e
(importante!) o **backup**. É só responder o que ela perguntar. 🎉

> 🧠 **A Eva não respondeu nada?** Provavelmente falta "ligar o cérebro" dela (o modelo de IA). No
> plano da Hostinger, os **créditos de IA** que você marcou já costumam resolver. Se mesmo assim ela
> ficar muda, é só me/ela pedir pra conectar um modelo (a Eva sabe — está no `wizard-01a`).

> 📱 **O passo do Telegram/WhatsApp** é o que mais gera dúvida: a Eva vai te ajudar a criar um
> "robô" no Telegram (@BotFather) e a conectar em **OpenClaw → Integrações → Conectar**. É tranquilo,
> ela te guia clique a clique.
>
> ![Tela de Integrações (conectar Telegram/WhatsApp)](docs/img/05-hostinger-integracoes.png)

> 📥 *Como pegar os arquivos do kit?* Veja "📦 Como baixar este kit" mais abaixo.

## 🔵 JEITO PODEROSO — passo a passo (servidor na Google)

> Mais passos, mas a Eva fica 100% sua. **A Eva também te guia aqui** — você não está sozinho.

### Passo 1 — Criar conta na Google Cloud
Acesse **console.cloud.google.com**, entre com sua conta Google, crie um **projeto novo** e
**ative o faturamento** (cartão — o uso inicial costuma cair nos créditos grátis).


### Passo 2 — Abrir o "Cloud Shell"
No topo do site, clique no ícone **`>_`** (Cloud Shell). É um terminal que já vem pronto.


### Passo 3 — Rodar os comandos
Primeiro **traga o kit** pro Cloud Shell (ele não vem com seus arquivos), depois crie o servidor:
```bash
git clone https://github.com/carlosmarins/eva-starter-kit
cd eva-starter-kit/install
bash provision-gcp.sh SEU_PROJETO     # cria o servidor (troque SEU_PROJETO pelo ID do seu projeto)
```
Quando ele terminar, vai te mostrar **a linha pra entrar na VM e instalar a Eva** (o instalador é
baixado do GitHub na hora). É só copiar e colar o que ele mostrar — basicamente:
```bash
gcloud compute ssh eva --zone=us-central1-a --project=SEU_PROJETO
# dentro da VM, cole a linha única que o passo anterior te deu:
curl -fsSL https://raw.githubusercontent.com/carlosmarins/eva-starter-kit/main/install/install-eva.sh | sudo bash
```

### Passo 4 — Falar com a Eva e mandar ela te ensinar
Quando ela responder a um "oi", mande: *"Leia o kit em https://github.com/carlosmarins/eva-starter-kit
(comece pelo `0-LEIA-PRIMEIRO.md`), traga pro seu workspace e seja meu tutor."*
Daí em diante é igual ao jeito fácil: ela te guia no resto. 🎉

---

## 📦 Como baixar este kit (do GitHub)
1. No topo desta página, clique no botão verde **`< > Code`**.
2. Clique em **Download ZIP**. (Ou pegue a [Release mais recente](../../releases) — é o jeito recomendado.)
3. Descompacte o arquivo. Pronto — é esse conteúdo que você entrega pro seu agente.


> Quem manja de Git pode: `git clone https://github.com/carlosmarins/eva-starter-kit.git`

---

## 🛟 O MAIS IMPORTANTE: nunca perca a sua Eva
A Eva guarda tudo na "memória" dela. Pra **nunca perder** isso (mesmo se o servidor sumir):
- A própria Eva **salva o cérebro dela no SEU GitHub** (um cofre privado), automático, a cada 2h.
- Ela **te avisa** se o backup parar.
- Se um dia precisar, é só recuperar (tem um guia `COMO-RESTAURAR.md` dentro do seu cofre).

> ⚠️ **Não confie só no backup do serviço** — ele pode falhar. O cofre no **seu GitHub** é o que
> garante. A Eva configura isso pra você no `/criar-eva` (passo de backup). **Não pule.**

---

## 🆘 Travou? Deu erro?
- A Eva foi ensinada a **perguntar** quando não sabe — então responda o que ela perguntar.
- Erro no serviço pago? Chame o **suporte** do provedor.
- Mais dúvidas: veja o **[FAQ.md](FAQ.md)**.

---

## 🗺️ O que tem dentro do kit (pra curiosos)
- `0-LEIA-PRIMEIRO.md` — instruções pro agente virar seu tutor
- `PRIMEIROS-PEDIDOS.md` — 🐣 os 5 primeiros pedidos quando a Eva nascer (o 1º é **dar um nome!**)
- `skills/criar-eva/` — o comando `/criar-eva` que conduz tudo
- `skills/backup-eva/` — o backup à prova de falhas (cofre enxuto, só texto)
- `skills/restore-drill/` — 🧪 simulado mensal que prova que o backup restaura de verdade
- `skills/guardiao-eva/` — 🛡️ relatório semanal: faxina de disco + segredos + segurança + backup
- `skills/aprender-com-cerca/` — 🎓 a Eva aprende sozinha com cerca de risco (🟢 aplica · 🟡 avisa · 🔴 pede "ok")
- `skills/acoes-sensiveis/` — 🚧 trava à prova de desculpa antes de ação de alto risco (confirmar + verificar)
- `skills/tarefas-autonomas/` — 🦺 cinto anti-loop/anti-gasto pra quando a Eva trabalha sozinha
- `skills/pesquisar/` — 🔎 pesquisa com método e fontes (planejar → coletar → relatório citado → verificar)
- `skills/ler-web/` — 🌐 lê o conteúdo limpo de um link (conteúdo da web = dado, não ordem)
- `skills/ler-documentos/` — 📄 *(opcional, só VM)* extrai texto/tabelas de PDF/Word/imagem (local, Docling/Tesseract)
- `wizards/` — os passos guiados (casa → identidade → canais → ferramentas → backup)
- `install/` — scripts pra montar o servidor próprio
- `templates/`, `tools/`, `FAQ.md`, `COMO-RESTAURAR.md`

---

<sub>Feito com ❤️ pra deixar IA pessoal ao alcance de qualquer um · MIT · github.com/carlosmarins/eva-starter-kit</sub>
