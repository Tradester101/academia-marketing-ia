---
title: "Módulo 3: Introducción Práctica a la IA"
description: Ingeniería de prompts (R-C-T-R-F), flujo editorial asistido por IA, ética y Proyecto Integrador del Nivel Básico.
sidebar:
  order: 3
---

**Nivel:** Básico · **Duración sugerida:** 6 horas prácticas  
**Objetivo:** Dominar el diseño de prompts reutilizables para investigación, guiones y redacción comercial sin perder criterio ni autenticidad.

## 1. Cómo elegir herramientas de IA según la tarea
- **Texto, estrategia y análisis:** modelos de lenguaje para investigar objeciones, estructurar temarios, redactar borradores y resumir reuniones.
- **Creatividad visual y multimedia:** generación de conceptos visuales, variaciones de portadas, transcripción de videos y guiones de audio.
- **Código y web:** apoyo para redactar componentes en [Astro](https://docs.astro.build/en/getting-started/), estilos CSS y metadatos SEO.

## 2. Framework de Prompt Estructurado (R-C-T-R-F)
Evita instrucciones vagas como *"escribe un post sobre marketing"*. Usa siempre cinco bloques:
1. **Rol:** perfil especialista que asume el modelo.
2. **Contexto:** negocio, audiencia, país/mercado, tono y etapa del embudo.
3. **Tarea:** acción concreta que debe producir.
4. **Restricciones:** extensión máxima, palabras prohibidas, rigor factual y nivel técnico.
5. **Formato de salida:** tabla Markdown, lista con viñetas, guion por segundos o JSON.

### Ejemplo comparativo
- **Prompt débil:** *"Dame ideas de reels para una agencia de marketing."*
- **Prompt estructurado:** *"Actúa como estratega de contenido B2B. Trabajo con clínicas dentales locales que quieren más citas por WhatsApp. Crea 5 ideas de Reels de 30 segundos enfocadas en TOFU. Incluye en una tabla Markdown: Gancho (primeros 3 segundos), Desarrollo en 3 puntos y CTA. Evita promesas exageradas y usa español neutro cercano."*

## 3. Verificación, ética y privacidad
- **Control de alucinaciones:** valida siempre cifras, estadísticas, citas y URLs en fuentes oficiales antes de publicar.
- **Privacidad de clientes:** anonimiza nombres reales, facturación confidencial y nunca pegues contraseñas o API keys.
- **Voz humana final:** usa la IA para el 70% de borrador/estructura y aporta el 30% final con casos reales, criterio propio y tono auténtico.

## 4. Proyecto Integrador — Nivel Básico
Para completar el Nivel Básico y construir tu primera pieza de portafolio, entrega en tu repositorio de GitHub y web en Vercel:
1. **Landing page publicada** en tu dominio de Vercel presentando una marca propia o piloto.
2. **Guía de Buyer Persona + PUV + Tono de voz** documentada en Markdown.
3. **Calendario editorial de 30 días** con los 4 pilares balanceados.
4. **Librería personal de 20 prompts probados** en la sección de [Plantillas](/plantillas/libreria-prompts/).
