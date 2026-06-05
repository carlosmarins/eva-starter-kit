# Changelog — Eva Starter Kit

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
