# Cómo desplegar tu web en Vercel en 5 minutos

1. **Sube estos archivos a tu repositorio de GitHub** (`https://github.com/Tradester101/academia-marketing-ia`):
   - Desde la web de GitHub: **Add file → Upload files** (arrastra el contenido descomprimido respetando las carpetas `src/`, `package.json`, `astro.config.mjs`, `tsconfig.json` y `vercel.json`) y haz clic en **Commit changes**.
   - O desde tu terminal local:
     ```bash
     git add .
     git commit -m "feat: portal web del curso con Astro Starlight para Vercel"
     git push origin main
     ```
2. **Conecta el repositorio en Vercel:**
   - Entra a [Vercel](https://vercel.com/docs/git/vercel-for-github), inicia sesión con tu cuenta de GitHub y haz clic en **Add New → Project**.
   - Selecciona `Tradester101/academia-marketing-ia` y pulsa **Import**.
   - Verifica que **Framework Preset** aparezca como **Astro** (Build Command: `npm run build`, Output Directory: `dist`) y haz clic en **Deploy**.
3. **Verificación y siguientes pasos:**
   - En ~1 minuto tendrás tu URL pública `*.vercel.app` activa y con despliegues automáticos en cada `push`.
   - Después podrás agregar tu dominio propio en **Settings → Domains** en Vercel y conectar [Google Tag Manager](https://marketingplatform.google.com/about/tag-manager/) y [Google Search Console](https://search.google.com/search-console/about).
