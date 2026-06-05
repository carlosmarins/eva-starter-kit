# 🛟 CÓMO RESTAURAR TU EVA

> Este archivo viaja **dentro de tu bóveda** (tu repositorio privado de GitHub de respaldo). Si algún
> día el servidor de tu Eva muere/desaparece/se rompe, aquí es donde vuelves a empezar **sin perder
> su memoria**. Mantén la calma: el cerebro de tu Eva está a salvo aquí en tu GitHub.

## Qué está guardado en esta bóveda
El "alma" y la memoria de tu Eva: `MEMORY.md`, `memory/` (notas y contexto), `IDENTITY.md`,
`SOUL.md`, `USER.md`, `AGENTS.md` y tus skills. **No** se guardan aquí secretos (tokens/contraseñas)
— esos los vuelves a generar (todos son recuperables).

## Paso a paso para recuperar (pídeselo a cualquier Eva nueva)
1. **Ten una Eva nueva en línea** — por el camino fácil (servicio administrado) o VM propia
   (usa el Eva Starter Kit / `/criar-eva`).
2. **Restaura la memoria** — dile:
   > "Clona mi bóveda de respaldo y restaura mi memoria:
   > `git clone https://github.com/TU_USUARIO/mi-eva-backup.git` y copia el contenido dentro de mi
   > workspace (`~/.openclaw/workspace`), encima de los archivos en blanco."
3. **Reconecta los secretos** (todos recuperables, la Eva te guía):
   - Modelo de IA (llave de Google/Gemini o login de ChatGPT)
   - Canales (token del bot de Telegram, etc.)
   - Herramientas (las credenciales de Omie/Jira/Drive… — vuélvelas a sacar en cada panel)
4. **Reactiva el respaldo** — corre la skill `backup-eva` de nuevo apuntando a la **misma bóveda**.
5. ✅ Listo: tu Eva volvió, con la memoria de antes.

## Regla de oro
- El respaldo del proveedor **no cuenta** (puede expirar/fallar — así mucha gente perdió todo).
- Lo que garantiza es **esta bóveda en TU GitHub**, actualizada cada 2 horas por la propia Eva.
- Si tu Eva deja de respaldar, debe **avisarte** (verificación de salud). Si no ves un commit nuevo
  aquí en más de ~1 día, **investiga** — la bóveda es tu red de seguridad.

— Generado por el Eva Starter Kit · github.com/carlosmarins/eva-starter-kit
