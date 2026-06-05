# Changelog — Eva Starter Kit

## v0.4.0 (2026-06-04) — Nascimento 🐣
- **Cartão "primeiros pedidos"** (`PRIMEIROS-PEDIDOS.md` + `.es.md`): os 5 primeiros pedidos pra
  fazer assim que a Eva nasce — ativa a pessoa e mostra valor na hora. **Regra de ouro:** o
  **primeiríssimo pedido é DAR UM NOME** ao assistente (o momento mágico do nascimento). `criar-eva`
  e `wizard-02` reforçam o nome como primeiro ato.
- **Conectores nativos (MCP) primeiro:** confirmado que o OpenClaw 2026.6.1 tem subsistema MCP
  completo (`openclaw mcp add`/`login` OAuth de 1 clique/`tools`). `wizard-04` e `tools/README`
  agora **preferem conector nativo MCP** (Google/Slack/GitHub/Jira/Atlassian/BigQuery); scripts
  `.py` viram **fallback** só pra ferramentas nicho sem MCP (Omie/Zendesk). Mais fácil e mais seguro.

## v0.3.0 (2026-06-04) — Modo Guardião 🛡️
- **Nova skill `guardiao-eva`** (semanal): relatório de saúde + **faxina de disco** automática
  (`openclaw sessions cleanup --enforce`, poda mídia/logs, `git gc` do cofre) — resolve o estouro de
  cota (ex.: 10GB) que afeta planos gerenciados + caça-segredos no cofre + auditoria de segurança + gasto.
- **Nova skill `restore-drill`** (mensal): simulado read-only que **prova** que o backup restaura
  (clona o cofre num /tmp, valida arquivos vitais, reporta recuperabilidade) — sem tocar na produção.
- **`backup-eva`**: `.gitignore` enxuto (exclui `.sqlite`/`sessions`/`media`/`logs`/binários) +
  alerta de tamanho do cofre — o cofre leva **só texto**, pra não inchar o `.git` nem o disco.
- **Segurança/privacidade**: `SOUL.template` ganhou regras duras (anti-injeção de prompt, privacidade,
  privilégio mínimo, confirmação de ações sensíveis). `wizard-04` agora pede **somente-leitura por padrão**.
- FAQ (PT+ES) com seções de **espaço em disco** e **como saber se o backup funciona**.

## v0.2.0 (2026-06-04) — bilíngue 🇧🇷🇲🇽
- Versão completa em **espanhol do México** (README.es / LEEME-PRIMERO / FAQ.es / COMO-RESTAURAR.es).
- Skills conduzem no idioma da pessoa (detecção PT-BR / ES-MX).
- Atualização técnica: modelo `codex/gpt-5.5` nativo, remoção de `contextWindow` inflado (gotcha de
  quedas), nota sobre embeddings locais (EmbeddingGemma) p/ contornar 429, higiene de sessões.

## v0.1 (2026-06-04) — esqueleto inicial
- Estrutura completa: 0-LEIA-PRIMEIRO + 6 wizards + install + templates + catálogo de ferramentas + FAQ.
- Dois caminhos: **Gerenciado (Hostinger)** e **VM própria (GCP)**.
- Wizard de ferramentas (Omie/Jira/Zendesk/BigQuery/Google/GitLab…) — pergunta, ensina, conecta, testa.
- `install-eva.sh` (VM do zero: Node 24 + OpenClaw + systemd) e `provision-gcp.sh` (infra + snapshot diário).
- Templates de identidade + heartbeat com higiene de contexto.
- Baseado na engenharia real da "Eva" de referência (migração Hostinger→GCP, backup, DR, manutenção).

### Próximos (v0.2+)
- Scripts `tools/*.py` prontos pra cada ferramenta (parametrizados).
- Exemplo de Eva completa em `exemplos/`.
- Pipeline de manutenção automática (snapshot→patches→update, health-gated+rollback) opcional.
- Curso/onboarding em HTML (como o kit OpenClaw v2.5.7).
