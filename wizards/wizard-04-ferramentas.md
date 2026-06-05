---
name: wizard-04-ferramentas
description: O CORAÇÃO do kit. Pergunta à pessoa QUAIS ferramentas ela quer que a Eva acesse (Omie, Jira, Zendesk, BigQuery, Google Drive/Gmail/Agenda, GitLab/GitHub, etc.), e para cada uma ensina onde pegar a credencial, conecta e TESTA na hora. Use após os canais.
user-invocable: true
---

# Wizard 04 — Quais ferramentas a Eva vai usar ⭐

Objetivo: conectar, **uma de cada vez**, as ferramentas que a pessoa usa no dia a dia. Para cada
uma: explicar → ensinar a pegar a credencial → gravar com segurança → instalar o script → **testar**.

## Passo 1 — Mostrar o cardápio (menu)
Pergunte de forma simples, oferecendo o catálogo (veja `tools/README.md` para detalhes de cada):

> "Quais dessas a sua Eva deveria saber mexer? Pode escolher quantas quiser (ou nenhuma agora):
> 📊 **Omie** (ERP/financeiro) · 🎫 **Jira** (chamados/projetos) · 💬 **Zendesk** (atendimento) ·
> 🗄️ **BigQuery** (dados/relatórios) · 📁 **Google Drive/Gmail/Agenda** · 🦊 **GitLab/GitHub** (código) ·
> 📝 **Notion** · 🎙️ **Fireflies/tl;dv** (reuniões). Ou me diz outra que você usa."

Anote a lista escolhida. Faça **uma por vez**.

## Passo 2 — Para CADA ferramenta escolhida (loop)
Siga este molde (os detalhes de onde clicar estão em `tools/<ferramenta>.md`):

1. **Explique** em 1 frase o que ela vai poder fazer ("vou conseguir consultar seus convênios no Omie").
   - **Comece pelo MENOS poder possível (privilégio mínimo):** ofereça **somente-leitura** por padrão
     ("vou só *consultar*, não mexer"). Só peça permissão de escrita/edição se a pessoa disser que
     precisa. Ex.: token de leitura no GitLab/Jira; scope `readonly` no Google; `execute_sql_readonly`
     no BigQuery. É mais seguro e quase sempre é o que a pessoa quer.
2. **Ensine a pegar a credencial**, clique a clique. Ex. (Omie):
   > "Entra no Omie → Configurações → Integrações/API → gere/copie o **App Key** e o **App Secret**.
   > Me cola os dois aqui."
   Cada ferramenta tem seu jeito (veja a ficha em `tools/`).
3. **Grave com segurança:** salve em `~/.openclaw/credentials/<ferramenta>/<conta>.env`
   (chmod 600). **Nunca** no Git, nunca repita no chat.
4. **Instale o script** correspondente de `tools/` no workspace (`tools/<ferramenta>.py`).
5. **TESTE na hora** e comemore com um número real:
   "✅ Conectado! Achei **247 convênios** no seu Omie 🎉".
   Se falhar, diga exatamente o que faltou e tente de novo (não siga quebrado).

## Catálogo (resumo — fichas completas em `tools/`)
| Ferramenta | O que precisa | Como a Eva usa |
|---|---|---|
| Omie | App Key + App Secret | `tools/omie.py` (API) |
| Jira | site + email + API token | `tools/jira.py` |
| Zendesk | subdomínio + email + API token | `tools/zendesk.py` |
| BigQuery | acesso do projeto (chave SA ou ADC) | `tools/bigquery.py` |
| Google Drive/Gmail/Agenda | login Google (OAuth, 1 clique) | `tools/google.py` |
| GitLab/GitHub | token de acesso | `tools/gitlab.py` / `tools/github.py` |

## Regras
- **Privilégio mínimo por padrão:** somente-leitura primeiro; escrita só com pedido explícito.
- **Uma ferramenta por vez.** Não peça 3 credenciais juntas.
- Pediu credencial e a pessoa não achou? **Guie pelo caminho exato** (ou link/print). Não desista.
- Toda credencial → arquivo seguro. Confirme o teste antes de passar pra próxima.
- A pessoa pode parar quando quiser; pode adicionar mais ferramentas depois (é só chamar este wizard).

## Stop condition
Todas as ferramentas escolhidas conectadas e testadas (ou a pessoa decidiu parar).

## Próximo passo
→ **wizard-05-memoria-backup**.
