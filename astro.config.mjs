// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

export default defineConfig({
  site: 'https://academia-marketing-ia.vercel.app',
  integrations: [
    starlight({
      title: 'Academia Marketing + IA',
      logo: { src: './public/favicon.svg', alt: '' },
      description:
        'Programa completo de Marketing Digital, Community Manager e Inteligencia Artificial con GitHub y Vercel.',
      defaultLocale: 'root',
      locales: {
        root: {
          label: 'Español',
          lang: 'es',
        },
      },
      head: [
        { tag: 'meta', attrs: { property: 'og:image', content: 'https://academia-marketing-ia.vercel.app/og.png' } },
        { tag: 'meta', attrs: { property: 'og:image:width', content: '1200' } },
        { tag: 'meta', attrs: { property: 'og:image:height', content: '630' } },
        { tag: 'meta', attrs: { name: 'twitter:card', content: 'summary_large_image' } },
        { tag: 'meta', attrs: { name: 'theme-color', content: '#070914' } },
      ],
      customCss: ['./src/styles/custom.css'],
      components: {
        Footer: './src/components/LessonFooter.astro',
        SocialIcons: './src/components/AccountLink.astro',
        Hero: './src/components/Hero.astro',
      },
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
