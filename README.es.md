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

### Paso 5 — Darle este kit y pedirle que te enseñe
En el chat de tu nuevo agente, **pega exactamente este mensaje**:

> *"Recibí un kit de instalación. Lee el archivo `LEEME-PRIMERO.md` y sé mi tutor a partir de ahí.
> Puedes correr la skill /criar-eva."*

¡Listo! De ahí en adelante **la propia Eva te guía** — su nombre, el Telegram, tus herramientas y
(¡importante!) el **respaldo**. Solo responde lo que te pregunte. 🎉

> 📥 *¿Cómo bajar los archivos del kit?* Mira "📦 Cómo descargar este kit" más abajo.

---

## 🔵 CAMINO PODEROSO — paso a paso (servidor en Google)

> Más pasos, pero la Eva queda 100% tuya. **La Eva también te guía aquí** — no estás solo.

### Paso 1 — Crear cuenta en Google Cloud
Entra a **console.cloud.google.com**, inicia sesión con tu cuenta de Google, crea un **proyecto
nuevo** y **activa la facturación** (tarjeta — el uso inicial suele caer en los créditos gratis).

### Paso 2 — Abrir el "Cloud Shell"
Arriba del sitio, haz clic en el ícono **`>_`** (Cloud Shell). Es una terminal que ya viene lista.

### Paso 3 — Correr los 2 comandos
Pega los comandos de abajo (el kit te los da listos):
```bash
bash provision-gcp.sh TU_PROYECTO     # crea el servidor
# después, dentro del servidor:
sudo bash install-eva.sh              # instala la Eva
```

### Paso 4 — Hablar con la Eva y pedirle que te enseñe
Cuando responda a un "hola", mándale: *"Lee el `LEEME-PRIMERO.md` y corre /criar-eva."*
De ahí en adelante es igual al camino fácil: ella te guía en el resto. 🎉

---

## 📦 Cómo descargar este kit (desde GitHub)
1. Arriba de esta página, haz clic en el botón verde **`< > Code`**.
2. Haz clic en **Download ZIP**. (O toma el [Release más reciente](../../releases) — es lo recomendado.)
3. Descomprime el archivo. Listo — ese contenido es el que le entregas a tu agente.

> Si le sabes a Git: `git clone https://github.com/carlosmarins/eva-starter-kit.git`

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

## 🗺️ Qué hay dentro del kit (para curiosos)
- `LEEME-PRIMERO.md` — instrucciones para que el agente sea tu tutor (en español)
- `PRIMEROS-PEDIDOS.es.md` — 🐣 las 5 primeras peticiones cuando la Eva nazca (¡la 1ª es **ponerle nombre!**)
- `skills/criar-eva/` — el comando `/criar-eva` que conduce todo
- `skills/backup-eva/` — el respaldo a prueba de fallas (bóveda ligera, solo texto)
- `skills/restore-drill/` — 🧪 simulacro mensual que prueba que el respaldo SÍ restaura
- `skills/guardiao-eva/` — 🛡️ reporte semanal: limpieza de disco + secretos + seguridad + respaldo
- `wizards/` — los pasos guiados (casa → identidad → canales → herramientas → respaldo)
- `install/` — scripts para montar tu propio servidor
- `templates/`, `tools/`, `FAQ.es.md`, `COMO-RESTAURAR.es.md`

---

<sub>Hecho con ❤️ para poner la IA personal al alcance de cualquiera · MIT · github.com/carlosmarins/eva-starter-kit</sub>
