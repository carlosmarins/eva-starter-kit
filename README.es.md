# 🌱 Eva Starter Kit — crea tu propia asistente de IA personal

> 🇧🇷 **Português:** [README.md](README.md) · 🇲🇽 **Español (estás aquí)**

> **En una frase:** este kit te ayuda a tener tu **propia asistente de inteligencia artificial**
> (le diremos **Eva**) — que platica contigo por Telegram/WhatsApp, se acuerda de tus cosas y
> usa tus herramientas. **No necesitas saber nada de tecnología.** Solo sigue los pasos.

> 🧒 **Hecho para cualquier persona.** Si sabes usar WhatsApp y hacer una compra por internet,
> tú puedes. La propia Eva se vuelve tu **maestra** y hace el trabajo difícil por ti.

---

## ✅ Lo que necesitas (nada más)
- 📶 Internet
- 💳 Una tarjeta de crédito
- ⏱️ ~15 a 30 minutos
- ☕ Calma — todo va a salir bien

---

## 🛣️ Hay 2 caminos. ¿Cuál es el tuyo?

Imagina una **casa** para que viva tu Eva:

| | 🟢 **Camino FÁCIL** (casa rentada) | 🔵 **Camino PODEROSO** (casa propia) |
|---|---|---|
| Para quién | Quiere lo **más simple** posible | Quiere **control total** y es más curioso |
| Cómo | Contratas un servicio listo (Hostinger) | Creas un servidor en Google (guiado) |
| Tiempo | ~5 min | ~20 min |
| **Recomendado para empezar** | ⭐ **SÍ** | — |

> 👉 **Si tienes duda, ve por el camino FÁCIL (🟢).** Puedes cambiarte después.

---

## 🟢 CAMINO FÁCIL — paso a paso (Hostinger)

Cuando entras a Hostinger, llegas al **hPanel** (tu panel de control):

![Pantalla inicial del hPanel de Hostinger](docs/img/00-hostinger-hpanel.png)

### Paso 1 — Encontrar OpenClaw en el menú
En el menú de la **izquierda**, en **"Agentes de IA"**, haz clic en **OpenClaw**.

![Menú lateral: Agentes de IA -> OpenClaw](docs/img/01-hostinger-menu.png)

### Paso 2 — Empezar
Haz clic en el botón morado **"Comece agora" / "Comenzar ahora"** (o en **"Agregar OpenClaw"**).

![Página de OpenClaw con el botón Comenzar](docs/img/02-hostinger-openclaw.png)

### Paso 3 — Elegir el plan y pagar 💳
Elige la duración (el de **1 mes** ya sirve para probar; los planes más largos salen más baratos
por mes), deja marcados los **créditos de IA**, elige la forma de pago y confirma.

![Pantalla de selección de plan y pago](docs/img/03-hostinger-plano.png)

> 🔒 Solo **tú** capturas la tarjeta. Tienes **30 días de reembolso garantizado**.
> *(Nota: las pantallas pueden aparecer en portugués o español según tu cuenta — el flujo es igual.)*

### Paso 4 — Entrar a tu Eva
Una vez hecho el pago, tu Eva aparece aquí. Haz clic en **"OpenClaw"** (abre su panel) o en
**"Abrir línea de comandos (CLI)"** para **platicar con el agente**.

![Panel de OpenClaw con tu agente](docs/img/04-hostinger-agente.png)

### Paso 5 — Pedirle a la Eva que lea el kit y te enseñe
En el chat de tu nuevo agente, **pega exactamente este mensaje**:

> *"Lee mi kit de instalación aquí: https://github.com/carlosmarins/eva-starter-kit — empieza por el
> archivo `LEEME-PRIMERO.md`, trae el kit a tu workspace y sé mi tutor a partir de ahí."*

> 💡 **¿Por qué un link y no un archivo?** El chat del panel **no acepta adjuntos**, y el Telegram lo
> vamos a conectar más adelante. Como el kit es público en GitHub, la Eva simplemente **lo lee del
> link** y se instala sola. (El comando `/criar-eva` aparece solo después de que ella jala el kit.)

¡Listo! De ahí en adelante **la propia Eva te guía** — su nombre, el Telegram, tus herramientas y
(¡importante!) el **respaldo**. Solo responde lo que te pregunte. 🎉

> 🧠 **¿La Eva no respondió nada?** Seguramente falta "encender su cerebro" (el modelo de IA). En el
> plan de Hostinger, los **créditos de IA** que marcaste normalmente ya lo resuelven. Si aun así
> queda muda, solo pídele conectar un modelo (la Eva sabe — está en el `wizard-01a`).

> 📱 **El paso de Telegram/WhatsApp** es el que más dudas genera: la Eva te ayuda a crear un
> "robot" en Telegram (@BotFather) y a conectarlo en **OpenClaw → Integraciones → Conectar**. Es
> sencillo, te guía clic a clic.
>
> ![Pantalla de Integraciones (conectar Telegram/WhatsApp)](docs/img/05-hostinger-integracoes.png)

> 📥 *¿Cómo bajar los archivos del kit?* Mira "📦 Cómo descargar este kit" más abajo.

---

## 🔵 CAMINO PODEROSO — paso a paso (servidor en Google)

> Más pasos, pero la Eva queda 100% tuya. **La Eva también te guía aquí** — no estás solo.

### Paso 1 — Crear cuenta en Google Cloud
Entra a **console.cloud.google.com**, inicia sesión con tu cuenta de Google, crea un **proyecto
nuevo** y **activa la facturación** (tarjeta — el uso inicial suele caer en los créditos gratis).

### Paso 2 — Abrir el "Cloud Shell"
Arriba del sitio, haz clic en el ícono **`>_`** (Cloud Shell). Es una terminal que ya viene lista.

### Paso 3 — Correr los comandos
Primero **trae el kit** al Cloud Shell (no viene con tus archivos), luego crea el servidor:
```bash
git clone https://github.com/carlosmarins/eva-starter-kit
cd eva-starter-kit/install
bash provision-gcp.sh TU_PROYECTO     # crea el servidor (cambia TU_PROYECTO por el ID de tu proyecto)
```
Al terminar, te muestra **la línea para entrar a la VM e instalar la Eva** (el instalador se baja
de GitHub al momento). Solo copia y pega lo que te muestre — básicamente:
```bash
gcloud compute ssh eva --zone=us-central1-a --project=TU_PROYECTO
# dentro de la VM, pega la línea única que te dio el paso anterior:
curl -fsSL https://raw.githubusercontent.com/carlosmarins/eva-starter-kit/main/install/install-eva.sh | sudo bash
```

### Paso 4 — Hablar con la Eva y pedirle que te enseñe
Cuando responda a un "hola", mándale: *"Lee el kit en https://github.com/carlosmarins/eva-starter-kit
(empieza por `LEEME-PRIMERO.md`), tráelo a tu workspace y sé mi tutor."*
De ahí en adelante es igual al camino fácil: ella te guía en el resto. 🎉

---

## 📦 Cómo obtener este kit (desde GitHub) — 3 formas, de la más fácil a la técnica

> 🧒 **Antes que nada:** "GitHub" es solo el sitio donde vive este kit (esta página que estás leyendo).
> **No necesitas crear cuenta** ni saber programar para obtenerlo.

### ⭐ Forma 1 — NO descargues nada (la más fácil, camino administrado)
En el camino **Fácil (Hostinger)**, tu Eva **lee el kit sola por internet**. Solo **pegas el link**
en su chat (el mensaje del Paso 5 de más arriba). Listo — **ni siquiera descargas archivos.** Es lo recomendado para principiantes.
> El link es: `https://github.com/carlosmarins/eva-starter-kit`

### 📥 Forma 2 — Descargar el ZIP (si quieres los archivos en tu computadora)
1. **Arriba de esta página**, haz clic en el botón verde **`< > Code`**.
2. En el menucito que abre, haz clic en **Download ZIP**.
3. Ve a la carpeta de **Descargas** de tu computadora y **descomprímelo** (doble clic / "Extraer todo").
4. Listo — esa carpeta es el kit. (Puedes arrastrar los archivos a tu agente, si acepta subirlos.)
> 💡 Tip: el **[Release más reciente](../../releases)** (ej.: v1.0.0) es la versión estable recomendada.

### 🧑‍💻 Forma 3 — `git clone` (para quien usa Git / camino VM propia)
En la terminal (o en el Cloud Shell de Google, en el camino VM):
```bash
git clone https://github.com/carlosmarins/eva-starter-kit
```
Es justo lo que usa el camino **VM propia** para traer los scripts de instalación.

---

## 🛟 LO MÁS IMPORTANTE: nunca pierdas tu Eva
La Eva guarda todo en su "memoria". Para **nunca perderla** (aunque el servidor desaparezca):
- La propia Eva **guarda su cerebro en TU GitHub** (una bóveda privada), automático, cada 2 horas.
- Ella **te avisa** si el respaldo se detiene.
- Si algún día lo necesitas, solo recuperas (hay una guía `COMO-RESTAURAR.es.md` dentro de tu bóveda).

> ⚠️ **No confíes solo en el respaldo del servicio** — puede fallar. La bóveda en **tu GitHub** es
> lo que garantiza. La Eva lo configura por ti en `/criar-eva` (paso de respaldo). **No te lo saltes.**

---

## 🆘 ¿Se atoró? ¿Dio error?
- A la Eva se le enseñó a **preguntar** cuando no sabe — así que responde lo que te pregunte.
- ¿Error en el servicio de paga? Llama al **soporte** del proveedor.
- Más dudas: mira el **[FAQ.es.md](FAQ.es.md)**.

---

## 🗺️ Mapa del kit — qué es esencial y qué es "cuando quieras"

> 🧒 **Para ti (sin tecnicismos):** solo necesitas la **jornada**. Lo demás la Eva lo hace sola o lo pides después — **no tienes que entender skill por skill.**

**1️⃣ La jornada (una vez, guiada — es lo único que TÚ haces):**
- `LEEME-PRIMERO.md` (el agente es tu tutor) · `skills/criar-eva/` (`/criar-eva` conduce todo) ·
  `wizards/` (casa → en línea → nombre → canales → herramientas → respaldo) · `PRIMEROS-PEDIDOS.es.md` (las 5 primeras peticiones 🐣).

**2️⃣ Protección automática (la Eva la enciende sola al final — tú no haces nada):**
- 🛟 `backup-eva` (bóveda en tu GitHub cada 2h) · 🛡️ `guardiao-eva` (salud + limpieza de disco + secretos) ·
  🧪 `restore-drill` (prueba mensual de que el respaldo vuelve) · 🚧 `acoes-sensiveis` (confirma antes de algo serio) ·
  🦺 `tarefas-autonomas` (cinturón anti-loop/gasto cuando trabaja sola).

**3️⃣ Poderes extra (solo cuando los pidas):**
- 🎓 `aprender-com-cerca` (aprende con el uso, con seguridad) · 🔎 `pesquisar` (con fuentes) ·
  🌐 `ler-web` (lee un link) · 📄 `ler-documentos` (*solo VM* — lee PDF/Word/imagen).

**Tras bambalinas:** `templates/`, `tools/`, `install/` (scripts de la VM), `FAQ.es.md`, `COMO-RESTAURAR.es.md`.

---

<sub>Hecho con ❤️ para poner la IA personal al alcance de cualquiera · MIT · github.com/carlosmarins/eva-starter-kit</sub>
