---
title: "Módulo 4: SEO Técnico, Contenidos y Copywriting"
description: Palabras clave, SEO técnico en Astro y Vercel, Google Search Console, fórmulas de copywriting y secuencias de email.
sidebar:
  order: 1
---

**Nivel:** Intermedio · **Duración sugerida:** 8 horas prácticas  
**Objetivo:** Posicionar tus páginas en buscadores y transformar visitas orgánicas en prospectos mediante copywriting y email marketing.

## 1. Investigación de palabras clave e intención de búsqueda
Clasifica cada búsqueda por su intención real antes de redactar:
- **Informacional:** *"qué es un community manager"* → ideal para artículos y guías gratuitas.
- **Comercial / Comparativa:** *"mejor herramienta de automatización n8n vs make"* → ideal para comparativas y casos.
- **Transaccional:** *"curso de marketing digital e ia"* o *"agencia de redes sociales"* → ideal para tu landing de servicios.

## 2. SEO Técnico en sitios desplegados en Vercel
Aprovecha el rendimiento nativo de [Astro](https://docs.astro.build/en/getting-started/) y [Next.js](https://nextjs.org/docs) cuidando estos elementos:
- **Metadatos únicos por URL:** `title` (50–60 caracteres) y `description` (140–155 caracteres) en el frontmatter de cada página.
- **Jerarquía semántica:** un solo `<h1>` por página y subtítulos ordenados (`<h2>`, `<h3>`).
- **Archivos de rastreo:** genera `sitemap.xml` y `robots.txt` y verifica la propiedad de tu dominio en [Google Search Console](https://search.google.com/search-console/about).
- **Velocidad y Core Web Vitals:** comprime imágenes en WebP/AVIF y evita scripts externos innecesarios.
- **Datos estructurados (JSON-LD):** añade marcado `Course`, `Organization` o `FAQPage` en tus páginas clave.

## 3. Copywriting orientado a conversión
Aplica estructuras probadas según el tipo de pieza:
- **PAS (Problema → Agitación → Solución):** excelente para anuncios, emails y secciones iniciales de landing.
- **AIDA (Atención → Interés → Deseo → Acción):** ideal para páginas de venta y carruseles largos.
- **BAB (Antes → Después → Puente):** muy efectivo para mostrar transformación en casos de estudio.

## 4. Lead Magnets y Email Marketing
Convierte tráfico frío en una base de datos propia:
1. **Lead Magnet de alto valor:** checklist, librería de prompts o mini-clase abierta en tu web.
2. **Secuencia automatizada de bienvenida (4 correos):**
   - *Correo 1 (inmediato):* entrega del recurso + presentación breve.
   - *Correo 2 (día 2):* caso práctico o error común resuelto.
   - *Correo 3 (día 4):* historia de transformación + recurso complementario.
   - *Correo 4 (día 6):* invitación clara a agendar diagnóstico o inscribirse al programa.

## 5. Práctica del módulo
Configura el `title` y `description` de todas tus páginas en `src/content/docs/`, verifica tu dominio en [Google Search Console](https://search.google.com/search-console/about) y redacta una secuencia de 4 correos de bienvenida para tu academia o servicio.
