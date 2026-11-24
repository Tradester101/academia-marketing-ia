---
title: "Módulo 10: DevOps para Marketing, GitHub Actions y Proyecto Final"
description: Automatización con GitHub Actions, agentes Human-in-the-Loop en n8n, seguridad de credenciales y Proyecto Capstone.
sidebar:
  order: 3
---

**Nivel:** Avanzado · **Duración sugerida:** 12 horas prácticas  
**Objetivo:** Operar tu academia y servicios con procesos automatizados, auditables y seguros en producción.

## 1. Automatización continua con GitHub Actions
Usa [GitHub Actions](https://docs.github.com/actions) para validar calidad automáticamente en cada cambio o de forma programada:
- Verificar que el sitio en Astro o Next.js compile sin errores antes de fusionar un Pull Request.
- Ejecutar revisiones periódicas de enlaces rotos o metadatos faltantes.

Ejemplo listo para guardar en `.github/workflows/ci.yml`:

```yaml
name: Validar Build del Sitio

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Descargar repositorio
        uses: actions/checkout@v4
      - name: Configurar Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 20
      - name: Instalar dependencias
        run: npm ci
      - name: Compilar sitio
        run: npm run build
```

## 2. Agentes con supervisión humana (Human-in-the-Loop)
Al construir agentes en [n8n](https://docs.n8n.io/) para marketing y ventas, aplica tres controles obligatorios:
1. **Aprobación previa:** la IA redacta borradores de respuestas, correos o reportes, y un humano aprueba con un clic antes de enviar a clientes.
2. **Registro de auditoría:** guarda fecha, prompt, modelo usado y salida en un log o hoja de control.
3. **Límites de costo y reintentos:** configura topes mensuales en tus cuentas de API y alertas ante errores consecutivos.

## 3. Checklist de seguridad y privacidad
- Nunca subas archivos `.env` ni llaves API a GitHub (verifica `.gitignore`).
- Almacena credenciales en **GitHub Secrets** (para workflows) y **Vercel Environment Variables** (separando entornos Preview y Production).
- Incluye política de privacidad y aviso claro sobre uso de cookies/analítica en tu sitio web.

## 4. Proyecto Final (Capstone) — Nivel Avanzado
Para graduarte o lanzar oficialmente tu agencia/academia, presenta en producción:
1. **Plataforma web completa en Vercel** (portal educativo + página de servicios + analítica activa).
2. **Una herramienta interactiva con IA** desplegada con Next.js + Vercel AI SDK.
3. **Automatización end-to-end** de captación y seguimiento de leads en n8n o Make.
4. **Workflow de validación en GitHub Actions** y documentación clara del retorno esperado (ROI) en el `README.md`.
