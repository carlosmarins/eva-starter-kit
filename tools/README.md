# Catálogo de ferramentas — fichas pro wizard-04

Cada ficha diz: o que é, **onde a pessoa pega a credencial** (clique a clique), onde guardar, e
como a Eva usa. O `wizard-04` lê estas fichas e conduz a pessoa. **Sempre testar ao final.**

> Padrão de segurança: credenciais vão em `~/.openclaw/credentials/<ferramenta>/<conta>.env`
> (chmod 600), **fora do Git**, e nunca repetidas no chat.

---

## 📊 Omie (ERP / financeiro)
- **Pega assim:** Omie → Configurações → Geral → Integrações/API → gere/copie **App Key** e **App Secret**.
- **Guardar:** `credentials/omie/<conta>.env` → `OMIE_APP_KEY=…` / `OMIE_APP_SECRET=…`
- **Script:** `tools/omie.py` (API REST do Omie). **Teste:** listar nº de clientes/convênios.

## 🎫 Jira (chamados / projetos)
- **Pega assim:** id.atlassian.com → Security → **Create API token**. Anote também seu **e-mail** e o **site** (ex.: `suaempresa.atlassian.net`).
- **Guardar:** `credentials/jira/<conta>.env` → `JIRA_SITE=` / `JIRA_EMAIL=` / `JIRA_API_TOKEN=`
- **Script:** `tools/jira.py`. **Teste:** listar 3 projetos.

## 💬 Zendesk (atendimento)
- **Pega assim:** Zendesk Admin → Apps & integrations → APIs → **Token Access** → criar token. Anote subdomínio + e-mail.
- **Guardar:** `credentials/zendesk/<conta>.env` → `ZENDESK_SUBDOMAIN=` / `ZENDESK_EMAIL=` / `ZENDESK_API_TOKEN=`
- **Script:** `tools/zendesk.py`. **Teste:** contar tickets abertos.

## 🗄️ BigQuery (dados / relatórios)
- **VM própria:** use a service account da VM (ADC) ou uma chave SA (`credentials/gcp/key.json`).
- **Gerenciado:** crie uma chave de service account no GCP e suba pro `credentials/gcp/`.
- **Script:** `tools/bigquery.py`. **Teste:** listar datasets do projeto.

## 📁 Google Drive / Gmail / Agenda
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

---

> **Adicionando ferramenta nova depois:** é só chamar o `wizard-04` de novo. A Eva conecta sem mexer no resto.
