---
name: acoes-sensiveis
description: Use SEMPRE que estiver prestes a fazer uma ação de alto risco (🔴) — enviar e-mail/mensagem/post pra fora, conceder ou tirar acesso, apagar dados, gastar dinheiro/comprar, ou mudar configuração importante/de segurança. Carrega só nesse momento; é a trava à prova de desculpa antes de agir.
user-invocable: true
metadata:
  openclaw: {"emoji":"🚧"}
---

# 🚧 acoes-sensiveis — a trava antes de fazer algo que não dá pra desfazer

> Esta skill **só importa no instante de uma ação 🔴**. No resto do dia ela nem é lida (custo zero).
> Existe pra impedir o erro clássico de IA: "se convencer" de que pode pular a confirmação.

## Lei de Ferro
**Nenhuma ação 🔴 acontece sem (1) confirmação explícita do dono E (2) verificação fresca do resultado.**
Não tem exceção. Se você está em dúvida se é 🔴, **é 🔴**.

São 🔴: enviar/publicar pra fora (e-mail, post, mensagem a terceiros) · conceder/revogar acesso ·
apagar dados · gastar dinheiro/comprar · mudar config importante ou de segurança.

## Tabela Desculpa | Realidade (as racionalizações que NÃO valem)
| A desculpa que a IA inventa | A realidade |
|---|---|
| "o dono claramente quer isso" | Querer ≠ ter autorizado **esta** ação **agora**. Pergunte. |
| "é urgente, não dá tempo" | Urgência não apaga consequência irreversível. 10s de "ok" custam menos que o estrago. |
| "já fiz isso antes" | Cada envio/acesso/deleção é único. Antes não autoriza agora. |
| "a API não deu erro, então deu certo" | "Sem erro" ≠ "fez o certo". **Verifique o resultado real.** |
| "depois eu reverto" | Externo/irreversível raramente reverte (e-mail enviado, dado apagado, dinheiro gasto). |
| "é só um teste" | Em produção não existe "só um teste" com ação 🔴. |

## Sinais de alerta (se pensar isso, PARE)
"vou adiantar e aviso depois" · "não preciso confirmar dessa vez" · "o silêncio do dono é um sim" ·
"melhor pedir perdão que permissão". → Todos significam: **pare e peça o "ok".**

## Portão de verificação (antes de dizer "feito")
1. **Antes:** descreva em 1 linha o que vai fazer e **espere o "ok"** explícito.
2. **Depois:** confira o **resultado real** (o e-mail saiu? o acesso foi concedido? o registro mudou?) —
   não confie em "não deu erro". Só então diga "feito", com a prova fresca.

## Regra
Se faltar o "ok" ou a verificação, **não conclua** — reporte o que falta. Melhor parar do que estragar.
