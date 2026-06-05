# 🛟 COMO RESTAURAR A SUA EVA

> Este arquivo viaja **dentro do seu cofre** (seu repositório GitHub privado de backup). Se um dia
> o servidor da sua Eva morrer/sumir/quebrar, é aqui que você recomeça **sem perder a memória dela**.
> Guarde a calma: o cérebro da sua Eva está salvo aqui no seu GitHub.

## O que está salvo neste cofre
A "alma" e a memória da sua Eva: `MEMORY.md`, `memory/` (notas e contexto), `IDENTITY.md`,
`SOUL.md`, `USER.md`, `AGENTS.md` e suas skills. **Não** ficam aqui segredos (tokens/senhas) —
esses você refaz (são todos recriáveis).

## Passo a passo pra recuperar (peça pra qualquer Eva nova fazer isto)
1. **Tenha uma Eva nova no ar** — pelo jeito fácil (serviço gerenciado) ou VM própria
   (use o Eva Starter Kit / `/criar-eva`).
2. **Restaure a memória** — diga pra ela:
   > "Clona o meu cofre de backup e restaura minha memória:
   > `git clone https://github.com/SEU_USUARIO/minha-eva-backup.git` e copia o conteúdo pra dentro
   > do meu workspace (`~/.openclaw/workspace`), por cima dos arquivos em branco."
3. **Reconecte os segredos** (todos recriáveis, a Eva te guia):
   - Modelo de IA (chave do Google/Gemini ou login ChatGPT)
   - Canais (token do bot Telegram, etc.)
   - Ferramentas (as credenciais de Omie/Jira/Drive… — refaça no painel de cada uma)
4. **Religue o backup** — rode a skill `backup-eva` de novo apontando pro **mesmo cofre**.
5. ✅ Pronto: sua Eva voltou, com a memória de antes.

## Regra de ouro
- O backup do provedor **não conta** (pode expirar/falhar — foi assim que muita gente perdeu tudo).
- O que garante é **este cofre no SEU GitHub**, atualizado a cada 2h pela própria Eva.
- Se a sua Eva parar de fazer backup, ela deve **te avisar** (verificação de saúde). Se você não vê
  um commit novo aqui há mais de ~1 dia, **investigue** — o cofre é sua rede de segurança.

— Gerado pelo Eva Starter Kit · github.com/carlosmarins/eva-starter-kit
