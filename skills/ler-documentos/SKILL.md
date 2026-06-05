---
name: ler-documentos
description: Use quando a pessoa quiser que a Eva leia documentos bagunçados (PDF, Word, planilha, imagem de documento) e extraia o texto/tabelas de forma limpa — e SÓ se ela estiver no caminho VM própria e topar um add-on pesado. É um extrator local (Docling), opcional/avançado, não faz parte do kit básico.
user-invocable: true
metadata:
  openclaw: {"emoji":"📄"}
---

# 📄 ler-documentos — extrair texto/tabelas de documentos (add-on OPCIONAL, só VM)

> ⚠️ **Isto é avançado e opcional.** Pesa **~6 GB** e usa CPU — só vale na **VM própria** (não no
> gerenciado leve). Se a pessoa está no gerenciado ou não precisa, **pule** — o kit básico não depende disso.
> Vantagem: roda **100% local** (o documento não sai da máquina — bom pra privacidade).

## O que faz
Converte PDF/DOCX/planilha/imagem em **markdown limpo com tabelas preservadas**, usando **Docling** num
ambiente isolado, **fora do runtime** da Eva (não deixa ela lenta).

## Instalar (uma vez, na VM)
1. Crie um ambiente isolado e instale Docling (CPU): venv em `/opt/docling`, `pip install docling`.
2. Crie um wrapper `tools/ler-documento.sh` que a Eva chama (recebe o caminho do arquivo, devolve markdown).
3. **OCR desligado por padrão** (documentos "nascidos digitais"); use `--ocr` só para escaneados.
   - 🔎 **Para ler escaneado/foto** (add-on leve): instale o **Tesseract** (`apt install tesseract-ocr
     tesseract-ocr-por` p/ português) e ligue o `--ocr`. É **muito mais leve** que motores OCR de IA
     (não precisa GPU). Prefira sempre a ferramenta leve.
4. Rode com `nice` (baixa prioridade) pra não competir com a Eva.

## Resiliência (importante)
- O ambiente de ~6 GB **NÃO** vai pro git/backup (excluído no `.gitignore`). Em vez disso, guarde uma
  **receita de reinstalação** no workspace: `REINSTALL.md` + `requirements.txt`. Se a VM morrer, reinstala em minutos.

## Segurança (cerca de risco)
- **Ler/extrair = 🟢** (local, reversível, não sai da máquina) → a Eva faz sozinha.
- **Agir com o que extraiu** (enviar, cadastrar, decidir algo externo) = **🔴** → passa por `acoes-sensiveis`.

## Quando NÃO usar
Gerenciado (cota pequena), ou quando um resumo simples já resolve. Não instale "por via das dúvidas".
