// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

export default defineConfig({
  integrations: [
    starlight({
      title: 'Academia Marketing + IA',
      description:
        'Programa completo de Marketing Digital, Community Manager e Inteligencia Artificial con GitHub y Vercel.',
      defaultLocale: 'root',
      locales: {
        root: {
          label: 'Español',
          lang: 'es',
        },
      },
      customCss: ['./src/styles/custom.css'],
      social: [
        {
          icon: 'github',
          label: 'GitHub',
          href: 'https://github.com/Tradester101/academia-marketing-ia',
        },
      ],
      sidebar: [
        {
          label: 'Nivel Básico',
          autogenerate: { directory: 'basico' },
        },
        {
          label: 'Nivel Intermedio',
          autogenerate: { directory: 'intermedio' },
        },
        {
          label: 'Nivel Avanzado',
          autogenerate: { directory: 'avanzado' },
        },
        {
          label: 'Plantillas y Recursos',
          autogenerate: { directory: 'plantillas' },
        },
        {
          label: 'Servicios y Mentoría',
          items: [{ label: 'Paquetes y Capacitación', slug: 'servicios' }],
        },
      ],
    }),
  ],
});
