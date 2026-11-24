# Academia de Marketing Digital, Community Manager e Inteligencia Artificial

Programa formativo y base web profesional apoyada en [GitHub](https://docs.github.com/) y [Vercel](https://vercel.com/docs), diseñado para **aprender desde cero hasta nivel avanzado, ofrecer servicios a clientes y enseñar a otros**.

## Mapa del programa

| Nivel | Módulos | Enfoque principal | Proyecto integrador |
| :--- | :--- | :--- | :--- |
| **Básico** | Módulos 1 al 3 | Fundamentos de Marketing Digital, Community Management y Prompt Engineering | Landing en Vercel + calendario de 30 días + librería de prompts |
| **Intermedio** | Módulos 4 al 7 | SEO técnico, Paid Media, GA4/GTM/Data Studio y automatización con n8n/Make | Campaña de captación de leads con tracking y automatización |
| **Avanzado** | Módulos 8 al 10 | Growth Marketing, CRO, apps de IA con Vercel AI SDK y GitHub Actions | Plataforma educativa/agencia con herramienta de IA en producción |

## Stack recomendado

- **Repositorio y automatización:** [GitHub](https://docs.github.com/) y [GitHub Actions](https://docs.github.com/actions)
- **Despliegue web:** [Vercel](https://vercel.com/docs/git/vercel-for-github)
- **Portal de curso / web:** [Astro Starlight](https://starlight.astro.build/getting-started/) o [Next.js](https://nextjs.org/docs)
- **Analítica y SEO:** [Google Tag Manager](https://marketingplatform.google.com/about/tag-manager/), [Google Analytics 4](https://marketingplatform.google.com/about/analytics/), [Google Search Console](https://search.google.com/search-console/about) y [Data Studio](https://docs.cloud.google.com/data-studio/welcome)
- **IA y automatización:** [Vercel AI SDK](https://vercel.com/docs/ai-sdk), [Google AI Studio (Gemini API)](https://aistudio.google.com/docs/get-started), [OpenAI API](https://developers.openai.com/api/docs), [n8n](https://docs.n8n.io/) y [Make](https://help.make.com/get-started)

## Estructura del repositorio

```text
academia-marketing-ia/
├── docs/
│   ├── 01-basico/
│   │   ├── modulo-01-fundamentos.md
│   │   ├── modulo-02-community-management.md
│   │   └── modulo-03-introduccion-ia.md
│   ├── 02-intermedio/
│   │   └── README.md
│   └── 03-avanzado/
│       └── README.md
├── plantillas/
│   ├── libreria-prompts-inicial.md
│   └── calendario-editorial-ejemplo.csv
└── README.md
```

## Despliegue rápido en Vercel

1. Sube estos archivos a tu repositorio `https://github.com/Tradester101/academia-marketing-ia`.
2. Inicializa [Astro Starlight](https://starlight.astro.build/getting-started/) o [Next.js](https://nextjs.org/docs) cuando quieras convertir la carpeta `docs/` en tu sitio público.
3. Importa el repositorio desde tu panel de [Vercel](https://vercel.com/docs/git/vercel-for-github) para activar despliegues automáticos en cada `push`.
