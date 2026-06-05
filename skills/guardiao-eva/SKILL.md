---
name: guardiao-eva
description: Modo Guardião — a Eva cuida sozinha da própria saúde, segurança, privacidade, ESPAÇO EM DISCO e backup, e manda um relatório semanal em linguagem simples ao dono. Inclui faxina automática (pra não entupir a cota do servidor), checagem de segredos, verificação de backup e simulado de recuperação. Use semanalmente (cron) ou sob comando ("modo guardião", "está tudo seguro?", "/guardiao").
user-invocable: true
metadata:
  openclaw: {"emoji":"🛡️"}
---

# 🛡️ guardiao-eva — a Eva se cuida sozinha

Rotina **semanal** (e sob comando) que protege a Eva em 4 frentes e manda **um relatório curto**
ao dono no canal principal. Não conclui em silêncio — sempre reporta o resultado.

## 1. 🧹 ESPAÇO EM DISCO (faxina — pra não matar a cota do usuário)
> Em plano gerenciado a cota é pequena (ex.: 10GB) e o que mais cresce é **sessão, mídia e (se usar
> ChatGPT/Codex) o trace do Codex**. A memória (texto) é leve. **Tudo isso a Eva limpa sozinha** —
> o dono nunca precisa rodar comando.

**Política de retenção (defaults sensatos — limpa sozinha):**
- **Sessões:** manter ~**30 dias** / cap de entradas → `openclaw sessions cleanup --enforce`.
- **Sessões de cron** (backup 2h etc.): retenção curta — `cron.sessionRetention` em **48h** (config).
- **Mídia:** remover de `~/.openclaw/media/` o que tem **>30 dias** e não é referência ativa.
- **Logs:** truncar/remover antigos.
- **Trace do Codex** (só se usar ChatGPT/Codex): se `~/.openclaw/agents/*/agent/codex-home/logs_2.sqlite`
  passar de ~**500MB**, sinalizar/compactar (acima de ~800MB ele causa instabilidade — bug conhecido).
- **Cofre de backup:** `git -C ~/.openclaw/workspace gc` (mantém o `.git` pequeno).

🚫 **NUNCA podar** (regra dura): `MEMORY.md`, `memory/` curada, identidade (IDENTITY/SOUL/USER),
`memory/aprendizado/` (cofre de aprendizado/**auditoria**), nem o cofre de backup. Faxina só toca
**sessões, mídia, logs e trace** — coisas recriáveis.

- Mede o uso: `du -sh ~/.openclaw/agents/*/sessions ~/.openclaw/media ~/.openclaw 2>/dev/null` e o % da cota.
- **Alerta a ~75% da cota**, em linguagem de gente: "⚠️ Disco em X% — fiz uma faxina e liberei Y.
  Se continuar subindo, dá pra considerar um plano maior, ou eu guardo menos mídia. Quer que eu cuide?"

## 2. 🔒 SEGREDOS (não vazar credencial no cofre)
- Antes de confiar no backup, varra o que está versionado por padrões de token:
  `git -C ~/.openclaw/workspace grep -nIE 'glpat-|github_pat_|xoxb-|xapp-|sk-[A-Za-z0-9]|AIza[0-9A-Za-z_-]{20}|BEGIN .*PRIVATE KEY' || echo "limpo"`
- Se achar algo: **alerta urgente** ao dono ("🚨 achei o que parece um token no backup — vou removê-lo do versionamento e você deve **rotacionar** esse segredo"). Remove do índice, reforça o `.gitignore`.

## 3. 🛟 BACKUP recuperável
- Confere o backup recente (último commit do cofre < ~1 dia).
- 1x por mês, dispara a skill **`restore-drill`** (prova que restaura de verdade).

## 4. 🩺 AUTO-SAÚDE — lê os próprios sinais e AGE (sem daemon)
- Leia os sinais vitais com shell simples (sem instalar nada): disco (`df -h /`), RAM (`free -h`),
  carga (`uptime`), + `openclaw doctor`. Resuma num **veredito**: `OK` · `ATENÇÃO_DISCO` · `RAM/CARGA_ALTA` · `CRÍTICO`.
- **Aja conforme o veredito** (autoconsciência, não só relatório):
  - `ATENÇÃO_DISCO` → roda a faxina da seção 1 (e alerta a ~75%).
  - `RAM/CARGA_ALTA` → **adia tarefa pesada** pra mais tarde e avisa; não martele.
  - `CRÍTICO` → avisa o dono na hora, em linguagem simples.
  - Apagar dados pra liberar = 🔴 → **propõe**, não faz sozinha.
- Segurança: `openclaw security audit`; canais com **allowlist do dono**; ferramentas **somente-leitura** onde der.
- (Se houver teto de gasto) avisa se o uso de IA está perto do limite do mês.
> 🛠️ *(Avançado, só VM):* quem quiser gráficos/histórico pode instalar um monitor local (ex.: Netdata)
> **só em localhost, ML off, disco limitado** — mas **não é necessário**: este check de shell já dá a autoconsciência.

## 📋 O relatório (mande um resumo assim, em linguagem de gente)
> "🛡️ **Relatório Guardião da semana**
> • Disco: 2.1GB de 10GB (21%) — fiz faxina, liberei 300MB ✅
> • Segredos: nenhum vazado no backup ✅
> • Backup: último há 1h · simulado de recuperação OK 🛟
> • Segurança: canais travados no seu acesso ✅ · 1 aviso: {…}
> Tá tudo sob controle. 👍"
Se algo estiver vermelho, explique simples e proponha a correção.

## Agendar (recomendado)
`openclaw cron add --cron "0 9 * * 1" --name "guardiao-semanal" --tools exec --message "Rode o Modo Guardião (skill guardiao-eva) e me mande o relatório."`

## Regras
- Faxina é **conservadora**: nunca apague memória curada (MEMORY/memory/identidade) nem o cofre. Só sessões órfãs, mídia velha e logs.
- Sempre **reportar** — bom ou ruim. O silêncio é o inimigo (a falha da Hostinger foi silenciosa).
