
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

## 📦 Como pegar este kit (do GitHub) — 3 jeitos, do mais fácil ao técnico

> 🧒 **Antes de tudo:** "GitHub" é só o site onde este kit mora (esta página que você está lendo).
> Você **não precisa criar conta** nem saber programar pra pegar o kit.

### ⭐ Jeito 1 — NÃO baixe nada (o mais fácil, caminho gerenciado)
No caminho **Fácil (Hostinger)**, sua Eva **lê o kit sozinha pela internet**. Você só **cola o link**
no chat dela (a mensagem do Passo 5 lá em cima). Pronto — **nem precisa baixar arquivo.** É o recomendado pra leigo.
> O link é: `https://github.com/carlosmarins/eva-starter-kit`

### 📥 Jeito 2 — Baixar o ZIP (se quiser os arquivos no seu computador)
1. **No topo desta página**, clique no botão verde **`< > Code`**.
2. No menUzinho que abre, clique em **Download ZIP**.
3. Vá na pasta de **Downloads** do seu computador e **descompacte** (clique 2x / "Extrair tudo").
4. Pronto — essa pasta é o kit. (Dá pra arrastar os arquivos pro seu agente, se ele aceitar upload.)
> 💡 Dica: a **[Release mais recente](../../releases)** (ex.: v1.0.0) é a versão estável recomendada.

### 🧑‍💻 Jeito 3 — `git clone` (pra quem usa Git / caminho VM própria)
No terminal (ou no Cloud Shell do Google, no caminho VM):
```bash
git clone https://github.com/carlosmarins/eva-starter-kit
```
É exatamente o que o caminho **VM própria** usa pra trazer os scripts de instalação.

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
- **Eva não responde no GRUPO do Telegram?** (o tropeço nº1) → guia dedicado: **[docs/GRUPO-TELEGRAM.md](docs/GRUPO-TELEGRAM.md)**.
- Erro no serviço pago? Chame o **suporte** do provedor.
- Mais dúvidas: veja o **[FAQ.md](FAQ.md)**.

---

## 🗺️ Mapa do kit — o que é essencial e o que é "quando quiser"

> 🧒 **Pra você (leigo):** você só precisa da **jornada**. O resto a Eva cuida sozinha ou você pede depois — **não precisa entender skill por skill.**

**1️⃣ A jornada (uma vez, guiada — é só isto que você faz):**
- `0-LEIA-PRIMEIRO.md` (o agente vira seu tutor) · `skills/criar-eva/` (`/criar-eva` conduz tudo) ·
  `wizards/` (casa → no ar → nome → canais → ferramentas → backup) · `PRIMEIROS-PEDIDOS.md` (os 5 primeiros pedidos 🐣).

**2️⃣ Proteção automática (a Eva liga sozinha no fim — você não faz nada):**
- 🛟 `backup-eva` (cofre no seu GitHub a cada 2h) · 🛡️ `guardiao-eva` (saúde + faxina de disco + segredos) ·
  🧪 `restore-drill` (prova mensal que o backup volta) · 🚧 `acoes-sensiveis` (confirma antes de algo sério) ·
  🦺 `tarefas-autonomas` (cinto anti-loop/gasto quando trabalha sozinha).

**3️⃣ Poderes extras (só quando você pedir):**
- 🎓 `aprender-com-cerca` (aprende com o uso, com segurança) · 🔎 `pesquisar` (com fontes) ·
  🌐 `ler-web` (lê um link) · 📄 `ler-documentos` (*só VM* — lê PDF/Word/imagem).

**Bastidores:** `templates/`, `tools/`, `install/` (scripts da VM), `FAQ.md`, `COMO-RESTAURAR.md`.

---

<sub>Feito com ❤️ pra deixar IA pessoal ao alcance de qualquer um · MIT · github.com/carlosmarins/eva-starter-kit</sub>
