# Catálogo de ferramentas — fichas pro wizard-04

Cada ficha diz: o que é, **onde a pessoa pega a credencial** (clique a clique), onde guardar, e
como a Eva usa. O `wizard-04` lê estas fichas e conduz a pessoa. **Sempre testar ao final.**

> ⭐ **Jeito moderno e preferido = conector nativo MCP do OpenClaw.** Antes de qualquer script, tente
> **`openclaw mcp add`** (valida na hora) e, pra serviços com login social, **`openclaw mcp login
> <servidor>`** (**OAuth de 1 clique** — perfeito pra leigo). Google, Slack, GitHub, Jira/Atlassian e
> BigQuery costumam ter servidor MCP pronto. Use `openclaw mcp tools` pra limitar permissões
> (privilégio mínimo). Os **scripts `.py` abaixo são fallback** — só pra ferramenta sem MCP (ex.: Omie/Zendesk).

> Padrão de segurança: credenciais/segredos vão em `~/.openclaw/credentials/<ferramenta>/<conta>.env`
> (chmod 600) ou no store do MCP, **fora do Git**, e nunca repetidas no chat.

---

## 📊 Omie (ERP / financeiro)
- **Pega assim:** Omie → Configurações → Geral → Integrações/API → gere/copie **App Key** e **App Secret**.
- **Guardar:** `credentials/omie/<conta>.env` → `OMIE_APP_KEY=…` / `OMIE_APP_SECRET=…`
- **Script:** `tools/omie.py` (API REST do Omie). **Teste:** listar nº de clientes/convênios.

## 🎫 Jira / Atlassian (chamados / projetos) — ✅ tente MCP primeiro (`mcp login`)
- **Pega assim:** id.atlassian.com → Security → **Create API token**. Anote também seu **e-mail** e o **site** (ex.: `suaempresa.atlassian.net`).
- **Guardar:** `credentials/jira/<conta>.env` → `JIRA_SITE=` / `JIRA_EMAIL=` / `JIRA_API_TOKEN=`
- **Script:** `tools/jira.py`. **Teste:** listar 3 projetos.

## 💬 Zendesk (atendimento)
- **Pega assim:** Zendesk Admin → Apps & integrations → APIs → **Token Access** → criar token. Anote subdomínio + e-mail.
- **Guardar:** `credentials/zendesk/<conta>.env` → `ZENDESK_SUBDOMAIN=` / `ZENDESK_EMAIL=` / `ZENDESK_API_TOKEN=`
- **Script:** `tools/zendesk.py`. **Teste:** contar tickets abertos.

## 🗄️ BigQuery (dados / relatórios) — ✅ tente MCP primeiro (`mcp add`)
- **VM própria:** use a service account da VM (ADC) ou uma chave SA (`credentials/gcp/key.json`).
- **Gerenciado:** crie uma chave de service account no GCP e suba pro `credentials/gcp/`.
- **Script:** `tools/bigquery.py`. **Teste:** listar datasets do projeto.

## 📁 Google Drive / Gmail / Agenda — ✅ tente MCP primeiro (`mcp login`, OAuth 1 clique)
- **Pega assim:** fluxo OAuth — a Eva gera um link, a pessoa **clica e autoriza** com a conta Google (1 clique). Tokens ficam em `credentials/google/`.
- **Script:** `tools/google.py`. **Teste:** listar 5 arquivos recentes do Drive (só nomes).
- Dica: comece com escopo **somente leitura**.

## 🦊 GitLab / 🐙 GitHub (código)
- **GitLab:** User Settings → Access Tokens → criar PAT (escopos `api`/`read_repository`).
- **GitHub:** Settings → Developer settings → Personal access tokens.
- **Guardar:** `credentials/gitlab/<conta>.env` (`GITLAB_URL=`/`GITLAB_TOKEN=`).
- **Script:** `tools/gitlab.py`. **Teste:** listar repositórios.

## 📝 Notion · 🎙️ Fireflies / tl;dv (reuniões)
- Cada um: pegar **API key/token** no painel do serviço → `credentials/<serv>/…env` → script correspondente.
- ⚠️ **Pegadinha do Notion (todo mundo esquece):** ter o token **não basta**. Em cada página que a
  Eva deve ler, abra o menu **•••→ Connections / "Add connection"** e **escolha a sua integração**.
  Sem isso, a Eva fica "cega" pra aquela página, mesmo com o token certo.

---

> **Adicionando ferramenta nova depois:** é só chamar o `wizard-04` de novo. A Eva conecta sem mexer no resto.
