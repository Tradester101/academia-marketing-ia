---
title: "Módulo 9: Desarrollo de Apps y Agentes de IA en Vercel"
description: Arquitectura con Next.js, Vercel AI SDK, Vercel AI Gateway, sistemas RAG y 3 micro-aplicaciones prácticas para agencia y academia.
sidebar:
  order: 2
---

**Nivel:** Avanzado · **Duración sugerida:** 16 horas prácticas  
**Objetivo:** Crear tus propias herramientas interactivas con IA desplegadas en Vercel para usarlas con clientes, vender acceso o enriquecer tu academia.

## 1. Arquitectura moderna con Next.js + Vercel AI SDK
Cuando necesitas interactividad avanzada (streaming de respuestas, formularios dinámicos o área privada), combina [Next.js](https://nextjs.org/docs) con el [Vercel AI SDK](https://vercel.com/docs/ai-sdk):
- **Streaming en tiempo real:** muestra la respuesta palabra por palabra para mejorar la experiencia de usuario.
- **Salidas estructuradas (Structured Output):** devuelve objetos JSON validados (por ejemplo, un calendario editorial listo para renderizar en tabla o exportar a CSV).
- **Tool Calling (uso de herramientas):** permite que el modelo consulte APIs externas, verifique enlaces o calcule presupuestos.
- **[Vercel AI Gateway](https://vercel.com/docs/ai-gateway):** centraliza el enrutamiento entre modelos, añade respaldos automáticos (fallbacks) y controla consumo y costos.

## 2. Asistentes con conocimiento propio (RAG)
El patrón **RAG (Retrieval-Augmented Generation)** evita respuestas genéricas:
1. Divide tus manuales de marca, preguntas frecuentes o lecciones en Markdown en fragmentos limpios.
2. Genera embeddings y guárdalos en una base vectorial o índice de búsqueda.
3. Ante cada consulta del usuario, recupera los fragmentos más relevantes e inyéctalos como contexto verificado en el prompt del sistema, pidiendo citar la lección o documento fuente.

## 3. Tres micro-aplicaciones de alto valor para desplegar en Vercel

| Herramienta | Usuario objetivo | Entradas | Salida estructurada |
| :--- | :--- | :--- | :--- |
| **Generador de Calendarios y Copys** | Clientes y alumnos | Nicho, tono de voz, objetivo y red | Tabla de 15 días + copys + exportable a CSV |
| **Auditor Express de Landing Pages** | Prospectos (Lead Magnet interactivo) | URL o texto de la landing + oferta | Puntaje de claridad, 5 mejoras prioritarias y propuesta de Hero |
| **Tutor IA de la Academia** | Alumnos del programa | Duda sobre cualquier módulo | Explicación paso a paso basada únicamente en tus lecciones Markdown |

## 4. Práctica del módulo
Inicializa un proyecto en [Next.js](https://nextjs.org/docs) conectado al [Vercel AI SDK](https://ai-sdk.dev/docs/introduction), configura tus variables de entorno de forma segura en Vercel y despliega un prototipo funcional de una de las 3 micro-aplicaciones anteriores.
