# Preguntas frecuentes — Eva Starter Kit (Español)

### No sé nada de tecnología. ¿De verdad puedo?
Sí. La idea es justo esa: tú **platicas**, el agente hace. Si se atora, te pregunta. Ve por el
camino **Administrado** y sigue lo que te diga.

### ¿Cuánto cuesta?
- **Administrado (Hostinger):** una mensualidad del plan. Más predecible.
- **VM propia (GCP):** la VM (unas decenas de USD/mes según el tamaño) + uso de IA por token
  (centavos a dólares según el uso). Hay créditos gratis al inicio.
- El modelo de IA (ChatGPT Pro / Gemini) puede tener costo aparte según la opción.

### Camino Administrado — ¿cómo lo contrato?
1. Entra a la página de **OpenClaw administrado (Hostinger)**.
2. Elige el plan básico, ve al checkout y **paga con tarjeta**.
3. Entra al panel/terminal del agente.
4. Sube/pega este kit y dile: *"Lee el `LEEME-PRIMERO.md` y sé mi tutor."*
El resto el agente lo conduce (wizards 02→05).

### ¿Cuál es la diferencia real entre los dos caminos?
Administrado = casa rentada amueblada (fácil, la mantiene un tercero). VM propia = casa tuya
(control y respaldo totales, da un poco más de trabajo). Mira `README.es.md`.

### ¿Voy a perder mis datos si algo sale mal?
No, **si haces el respaldo** (wizard-05). El kit configura respaldo automático del workspace a tu
GitHub + (en VM) snapshot diario del disco. **Hazlo** — es la parte más importante.

### ¿Puedo agregar una herramienta después?
Sí. Llama al `wizard-04` cuando quieras — la Eva conecta la nueva sin tocar lo demás.

### Tengo miedo de usar la "terminal" (esa pantalla negra). ¿Puedo romper algo?
Tranqui. En el servicio administrado, esa pantallita **no es un Linux de verdad** — es un "cockpit"
restringido que **solo acepta comandos `openclaw ...`**. Piénsalo como el control remoto de la tele:
pocos botones, y lo que no es botón simplemente no funciona. **No puedes romper el servidor** desde
ahí. Y en realidad, la mayor parte del tiempo quien escribe los comandos es la **propia Eva** — tú
solo platicas con ella.

### Algo se rompió / dio un error raro. ¿Hay "primeros auxilios"?
Sí: **`openclaw doctor`** (diagnostica problemas comunes de config/canal/servicio) y, si encuentra
algo, **`openclaw doctor --fix`** (lo arregla solo — y hace un respaldo antes de tocar). Es el primer
comando que conviene probar cuando la Eva "se pone rara". Hasta puedes pedírselo a la propia Eva:
*"corre el `openclaw doctor` y dime si encontró algo."*

### La Eva se "cae al modelo de respaldo" o dice que no tiene herramientas. ¿Por qué?
Si usas **ChatGPT/Codex** como cerebro y, en tareas que **usan herramientas** (correr algo, tocar un
archivo, automatizaciones/cron), la Eva se cae al modelo de respaldo o dice que "no tiene
herramienta": puede ser un **bug conocido del runtime Codex** (a veces "traba" los turnos que usan
herramientas). Qué hacer, de lo más simple a lo más técnico:
1. Pídele que **actualice OpenClaw** (`openclaw doctor` / la versión nueva quizá ya lo corrige).
2. Pídele que **revise los *issues conocidos* de OpenClaw** para tu síntoma (ella lee la doc/GitHub)
   — muchas veces es un bug conocido **con solución lista**, no config tuya.
3. **Alternativa que siempre funciona:** cambia el cerebro a **Gemini** (estable para herramientas).
   Y vale al revés — si un modelo te da lata, cámbialo por el otro; no te quedas atrapado.

### Evita disparar muchas tareas seguidas en ChatGPT (rate-limit). 🚦
Si mandas **varios comandos/pruebas seguidas** en pocos minutos usando ChatGPT, puede darte un
**bloqueo temporal** (anti-robot) y la Eva caer al modelo de respaldo hasta "enfriarse".
Espacia las pruebas; si pasa, espera unos minutos.

### La Eva (en ChatGPT/Codex) se cae al respaldo con error `403` / `auth` — ¿aun con el login válido?
Si en los logs aparece `reason=auth` / un **403** de `chatgpt.com` ("Enable JavaScript and cookies") y se
cae a Gemini, aun con el login **todavía válido (no expirado)**: el token OAuth probablemente está
**"atorado"/marcado**. El arreglo es **re-loguear con `--force`** (genera un token limpio) — en la terminal:
```
openclaw models auth login --provider openai --device-code --force
```
Abre un **link + código** → inicias sesión con la cuenta ChatGPT → autorizas. Luego: `openclaw gateway restart`.
*(Es distinto de "token expirado" — aquí el `--force` es el truco.)*
> ⚠️ Si el 403 **vuelve aun con token nuevo**, es OpenAI bloqueando el **uso automatizado** de la suscripción.
> Ahí lo estable es **cambiar a Gemini** como modelo principal (o usar una **API key de pago** de OpenAI).
> 💡 Por eso: si usas la Eva para **automatización/uso intenso**, el ChatGPT por suscripción puede ser inestable — **Gemini** suele ser más tranquilo.

### La Eva dio error de "archivo no encontrado" (equivocó el nombre de un archivo)?
Pasa — a veces la IA "adivina" el nombre de un archivo. A la Eva se le indicó **no inventar rutas**:
si una lectura falla, **lista la carpeta** (o usa `openclaw memory search`), encuentra el nombre
correcto y **lo rehace en el mismo turno** — sin trabarse. En un workspace chico (lo normal) casi no molesta.
> 🛠️ *(Avanzado, solo VM propia — no se puede en el administrado):* quien tenga un workspace
> **enorme** y choque seguido con esto puede instalar un "candado" de shell que, al fallar, ya muestra
> los nombres parecidos. Es técnico (systemd/`BASH_ENV`) y **no** es parte del kit básico.

### La Eva se puso lenta / se detuvo a la mitad (error "agent failed"). ¿Qué hago?
1. **Sesión llena:** manda `/compact` (o `/new`) en el chat. Mantén ≤ 3–4 temas (topics) en Telegram
   (mira `templates/HEARTBEAT.template.md`).
2. **Si usas el modelo ChatGPT/Codex** (común en el camino administrado) y se **cae a la mitad**
   (`codex app-server client closed`): es un **detalle conocido** —
   - Usa el **runtime Codex nativo** (`/model codex/gpt-5.5` en el chat) — más estable.
   - ⚠️ **NO** configures un `contextWindow` enorme (tipo 1,000,000) en Codex: tiene un límite
     interno menor y, si te pasas, **revienta y tira el turno a la mitad**. Déjalo en lo default.
   - Tip: **Gemini** aguanta ventanas grandes; Codex no. Para pláticas muy largas sin caídas,
     Gemini como principal es más estable (pero usa llave/cuota).
3. Si una plática se quedó "pegada" en un modelo de respaldo, dale `/new` o `/model <modelo>`.

### No logro conectar Telegram / WhatsApp. ¿Qué hago?
Es el paso que más se atora — tranqui, es fácil cuando sabes el truco:
- **Telegram:** primero creas un "robot" en **@BotFather** (manda `/newbot`, eliges nombre y un
  usuario que **termina en `bot`**) — te da un **token**. Luego solo **pegas ese token**: en el
  administrado, en **OpenClaw → Integrações → Telegram → Conectar**; en la VM, la propia Eva lo
  configura. Al final, busca **tu bot** en Telegram y mándale "hola".
- **WhatsApp:** no hay token — **escaneas un QR** (igual que WhatsApp Web): Integraciones →
  WhatsApp → Conectar → en el celular, WhatsApp → Dispositivos vinculados → Vincular un dispositivo.
- Empieza por **Telegram** (más estable). El paso a paso completo está en `wizard-03-canais`.

### La Eva responde en privado/WhatsApp pero NO en los grupos de Telegram (log `not-allowed`)?
Es el tropiezo nº1 de grupos — y casi nunca es bug. En grupo, Telegram + OpenClaw tienen **dos
candados independientes**, y la mayoría solo ajusta uno:
1. **Privacy mode del bot** (en @BotFather): `/setprivacy` → **Disable** → y **saca el bot del grupo y
   agrégalo de nuevo** (solo aplica al re-entrar). Sin esto el bot queda "ciego" en el grupo.
2. **Autorización de QUIÉN ENVÍA** (en OpenClaw): en grupo, OpenClaw revisa el **ID numérico de quien
   mandó** el mensaje, no solo el grupo. Si tu ID no está en **`groupAllowFrom`** (o `allowFrom`), da
   **`not-allowed`** — *aun con el grupo permitido / `allowAll`*. **Esto es lo que falta en la mayoría de los casos.**
3. **Mencionar:** por defecto (`requireMention: true`) la Eva solo responde cuando la **@mencionan** en
   el grupo. Para que responda a todo, pon `requireMention: false` en ese grupo.

**Cómo pedirle a la propia Eva que lo arregle** (pégalo en su chat): *"En grupo, OpenClaw autoriza por
QUIÉN ENVÍA. Toma el ID numérico del remitente que aparece en el log `not-allowed`, agrégalo en
`groupAllowFrom` y `allowFrom`, pon `groupPolicy: open` y `requireMention: false` en el grupo, recarga,
y **solo di 'listo' después de verme responder en el grupo**."* (Tu ID numérico también sale mandando `/start` al **@userinfobot**.)
> 📖 **Guía paso a paso dedicada:** [`docs/GRUPO-TELEGRAM.es.md`](docs/GRUPO-TELEGRAM.es.md) — con la forma fácil (la Eva lo hace), la manual y el truco de debug.

### Mi disco/cuota se llenó rápido (casi llego al límite). ¿Por qué?
Normal — lo que crece **no** es la memoria (texto ligero), sino **sesiones, media y logs** del día a
día. Quien creó este kit casi llegó a 10GB en 3 días por eso. Soluciones:
- Instala la skill **`guardiao-eva`** (limpieza semanal automática: `openclaw sessions cleanup --enforce`,
  poda media/logs viejos, compacta la bóveda) — además te avisa si pasas de ~70%.
- La **bóveda de respaldo lleva solo texto** (el `.gitignore` de la skill `backup-eva` excluye
  `.sqlite`/`sessions`/`media`/binarios). Si versionas binarios, el `.git` se infla **para siempre**.
- Si la bóveda pasa de ~50MB, algo grande entró mal — investiga.

### ¿La Eva va a llenar el disco/cuota sola con el tiempo? ¿Tengo que limpiar?
**No tienes que hacer nada** — se auto-limpia. Lo que crece (sesiones de plática, media, logs y, si
usas ChatGPT, el trace del Codex) se poda automáticamente con **retención sensata** (sesiones ~30 días,
media >30 días, sesiones de cron 48h). Lo hace la skill **`guardiao-eva`** (semanal) + un chequeo
diario en el heartbeat. Te **avisa en lenguaje simple** cuando el disco pasa de ~75% ("hice limpieza,
liberé X") y **nunca borra** el cerebro/memoria/identidad ni la bóveda de respaldo — solo cosas
recreables. 💡 En plan básico (cuota chica), **Gemini** ocupa menos disco que ChatGPT/Codex.

### ¿Cómo sé si mi respaldo REALMENTE funciona?
Instala la skill **`restore-drill`** (simulacro mensual): clona la bóveda en un espacio temporal,
revisa los archivos vitales y te dice si la Eva es **100% recuperable** — sin tocar producción.
*Un respaldo que nunca se probó no es un respaldo.*

### ¿Es seguro? ¿Mis tokens quedan expuestos?
No. Las credenciales quedan en archivos protegidos (`~/.openclaw/.env` / `credentials/`, chmod 600),
**nunca** en Git ni repetidas en el chat.

### Se atoró en un paso y el agente no sabe seguir.
Se le enseñó a **preguntar** en vez de inventar. Contesta lo que te pregunte. Si es en el proveedor
(Administrado), llama al **soporte** del proveedor.
