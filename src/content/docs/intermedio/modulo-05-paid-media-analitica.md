---
title: "Módulo 5: Paid Media y Analítica Profesional"
description: Estructura de campañas en Meta Ads y Google Ads, medición con GTM y GA4, UTMs, KPIs y tableros en Data Studio.
sidebar:
  order: 2
---

**Nivel:** Intermedio · **Duración sugerida:** 9 horas prácticas  
**Objetivo:** Diseñar campañas publicitarias con atribución verificable y reportar resultados ejecutivos en tiempo real.

## 1. Arquitectura de campañas (Meta Ads y Google Ads)
- **Meta Ads (demanda latente):** estructura en 3 niveles — Campaña (objetivo: Leads o Ventas), Conjuntos de anuncios (audiencias amplias, intereses o retargeting) y Anuncios (3 a 5 creatividades probando distintos ganchos).
- **Google Ads (demanda activa):** campañas de Búsqueda agrupadas por intención exacta con concordancia de frase/exacta, palabras clave negativas y extensiones de enlaces de sitio.

## 2. Medición profesional: GTM + GA4
No instales etiquetas dispersas a mano en el código. Centraliza todo:
1. Crea un contenedor en [Google Tag Manager](https://marketingplatform.google.com/about/tag-manager/) e insértalo en tu sitio web.
2. Configura la etiqueta de [Google Analytics 4 dentro de GTM](https://support.google.com/tagmanager/answer/9442095?hl=en) siguiendo la guía de [configuración inicial de GA4](https://support.google.com/analytics/answer/9304153?hl=en).
3. Define eventos clave de conversión: `generate_lead` (envío de formulario), `click_whatsapp`, `download_lead_magnet` y `begin_checkout`.

## 3. Estándar de enlaces UTM
Usa una nomenclatura consistente en minúsculas y sin espacios para atribuir cada visita:

```text
https://academia-marketing-ia.vercel.app/servicios/?utm_source=instagram&utm_medium=paid_social&utm_campaign=lanzamiento_q1&utm_content=reel_gancho_01
```

| Parámetro | Significado | Ejemplos válidos |
| :--- | :--- | :--- |
| `utm_source` | Plataforma de origen | `instagram`, `google`, `linkedin`, `newsletter` |
| `utm_medium` | Tipo de tráfico | `paid_social`, `cpc`, `organic_social`, `email` |
| `utm_campaign` | Nombre de la campaña | `lanzamiento_curso`, `captacion_servicios` |
| `utm_content` | Creativo o enlace exacto | `carrusel_01`, `boton_hero`, `video_testimonio` |

## 4. Diccionario operativo de KPIs

| Métrica | Fórmula | Qué te indica |
| :--- | :--- | :--- |
| **CTR** | Clics / Impresiones × 100 | Atractivo del anuncio y relevancia del gancho |
| **CPC** | Inversión / Clics | Eficiencia para generar tráfico |
| **CPL / CPA** | Inversión / Leads (o Ventas) | Costo real de adquirir un prospecto o cliente |
| **Tasa de conversión** | Conversiones / Visitas × 100 | Rendimiento de tu landing page y oferta |
| **ROAS** | Ingresos atribuidos / Inversión | Retorno bruto por cada dólar invertido en pauta |

## 5. Reportes ejecutivos en Data Studio
Conecta tu propiedad de GA4 y tus fuentes publicitarias en [Data Studio](https://docs.cloud.google.com/data-studio/welcome) (antes Looker Studio) para entregar a cada cliente un enlace en vivo con 4 bloques: Resumen ejecutivo, Embudo de conversión, Rendimiento por campaña/creativo y Próximas acciones de optimización.

## 6. Práctica del módulo
Crea tu contenedor en GTM, configura GA4, arma una tabla de 6 enlaces UTM para tus canales principales y diseña una plantilla de tablero en Data Studio.
