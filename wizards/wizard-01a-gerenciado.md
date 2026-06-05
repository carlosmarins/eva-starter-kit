---
name: wizard-01a-gerenciado
description: Caminho FÁCIL. Guia a pessoa leiga a contratar o OpenClaw gerenciado (Hostinger) e ter o agente no ar em minutos, usando só cartão de crédito. Use quando a pessoa escolheu o caminho Gerenciado no wizard-00.
user-invocable: true
---

# Wizard 01a — Casa alugada (OpenClaw Gerenciado / Hostinger)

Objetivo: a pessoa ter um agente OpenClaw **vivo** num plano gerenciado, com o mínimo de cliques.
Você guia; ela só paga e clica o inevitável.

## Antes de começar — avise
> "Esse caminho leva ~5 minutos e você vai precisar de um cartão de crédito. Eu te guio em cada
> tela. Pode ir me dizendo o que aparece que eu te falo o próximo clique."

## Passos (um de cada vez, confirmando)

1. **Abrir a página do plano gerenciado.** Mande o link da Hostinger (OpenClaw Managed) e diga:
   "Abre esse link numa aba nova e me diz quando estiver vendo a página de planos."
2. **Escolher o plano** mais simples que sirva (explique: "o básico já roda sua Eva"). Oriente a
   selecionar e ir pro checkout.
3. **Pagar.** "Agora é a parte do cartão — preenche os dados e confirma. Me avisa quando aparecer
   'compra concluída' ou um painel." (Não peça os dados do cartão; é ela quem digita.)
4. **Primeiro acesso ao painel/terminal do agente.** Guie até a tela onde ela fala com o agente
   (web/terminal do serviço).
5. **🧠 Ligar o cérebro da Eva (o modelo de IA).** Na Hostinger, os **créditos de IA** marcados na
   compra **já costumam deixar a Eva respondendo** — teste mandando "oi, quem é você?". Se ela
   respondeu, **pule este passo**. Só faça o abaixo se ela ficar **muda** OU se quiser usar a sua
   própria conta (mais barato no uso pesado). Dois jeitos:
   - **Tem assinatura ChatGPT Plus/Pro?** → conecte por **login (OAuth)**: no painel/terminal do
     serviço, autorize a conta (ou `openclaw models auth login` — confira a flag exata na doc
     oficial). Usa a sua assinatura, sai mais barato pro uso pesado.
   - **Não tem (ou prefere pré-pago)?** → use uma **chave de API da OpenAI**:
     1. Abra **`platform.openai.com`** → Settings → **Billing** → adicione um cartão e **US$ 5–10
        de crédito** (dá pra meses de uso normal).
     2. **API keys → Create new secret key** (nome: `openclaw`). A chave começa com `sk-...`.
     3. Cole a chave no painel da Eva (campo de API key / setup).
   - ⚠️ **PEGADINHA Nº 1 (todo mundo cai):** **`platform.openai.com` ≠ `chatgpt.com`**. A *chave de
     API* sai do **platform**; o *chatgpt.com* é só a assinatura. Cadastrar cartão no chatgpt.com
     **não** gera chave de API.
   - ⚠️ **A chave aparece UMA vez só** — copie na hora. Se fechar sem copiar, gere outra. Nunca cole
     a chave em chat público nem suba pro Git.
   - **Teste:** mande "oi, quem é você?" e confirme que a Eva respondeu. Aí o cérebro está ligado. ✅
   - 💡 **Não fica preso a um cérebro:** se mais pra frente a Eva der trabalho em tarefas com
     ferramentas usando ChatGPT (cair pro reserva, "sem ferramenta"), dá pra trocar pro **Gemini**
     (e vice-versa). Guarde essa carta na manga (ver FAQ).
6. **Entregar este kit ao agente — pelo LINK do GitHub (não por arquivo).** ⚠️ O chat do painel
   gerenciado **não aceita anexos**, e o Telegram só entra depois. Como o kit é **público**, a Eva
   lê ele direto do link. Instrua a pessoa a colar:
   > *"Leia o meu kit em https://github.com/carlosmarins/eva-starter-kit — comece pelo
   > `0-LEIA-PRIMEIRO.md`, traga o kit pro seu workspace (git clone ou baixando os arquivos) e seja
   > meu tutor a partir daí."*
   - A Eva então **se instala** (clona o repo no workspace → tem skills/wizards) e assume como tutora.
     Só depois disso o atalho `/criar-eva` existe; antes, ela conduz lendo os arquivos do kit.

## Stop condition
A pessoa consegue **conversar com o agente** no painel do serviço. Aí o próprio agente assume.

## Próximo passo
→ **wizard-02-identidade** (dar nome e alma à Eva).

## Cuidados (lições reais)
- **Backup:** o gerenciado pode NÃO ter backup próprio robusto. Garanta no **wizard-05** que o
  workspace dela vá pra um Git (não confie só nos snapshots da plataforma).
- **Atualizações:** o gerenciado serve versões **estáveis testadas** — **não rode `openclaw update`
  manualmente** (fura o filtro de estáveis e pode quebrar). Deixe a plataforma atualizar. Se houver
  incidente, suporte do provedor.
- **Primeiros socorros:** se algo ficar estranho, o comando salvador é **`openclaw doctor`** (e
  **`openclaw doctor --fix`** pra consertar — ele faz backup antes). Pode pedir pra própria Eva rodar.
- **Terminal sem medo:** aquela tela preta é um cockpit restrito (só aceita `openclaw ...`) — a
  pessoa **não quebra o servidor** por ali. Tranquilize-a.
- Se algo travar no provedor, **peça pra ela acionar o suporte** — não tente contornar o painel.
