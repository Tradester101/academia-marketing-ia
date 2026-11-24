# Academia Marketing + IA

Plataforma formativa de Marketing Digital, Community Management e Inteligencia Artificial. El sitio público conserva Astro + Starlight y los diez módulos originales. La rama `feature/full-academy-platform` incorpora la primera base del portal LMS.

## Componentes

- **Sitio público:** Astro 5 + Starlight; conserva el contenido académico existente.
- **Portal del alumno:** acceso/registro, dashboard y tutor IA en Astro.
- **Identidad y datos:** Supabase Auth + PostgreSQL con Row Level Security.
- **Tutor IA:** Supabase Edge Function que llama a Gemini desde el servidor; la clave no se expone al navegador.
- **CI:** GitHub Actions instala dependencias y ejecuta `npm run build` en pushes y pull requests.

## Configuración en local y Vercel

1. Configura estas variables en Vercel y en el entorno local:
   - `PUBLIC_SUPABASE_URL`
   - `PUBLIC_SUPABASE_ANON_KEY` (o la publishable key compatible).
2. No uses claves `service_role` ni claves privadas con prefijo `PUBLIC_`.
3. Aplica `supabase/migrations/0001_lms.sql` en el SQL Editor de Supabase.
4. Crea una cuenta desde `/login`.
5. Promueve manualmente la cuenta propietaria a administradora desde el SQL Editor, sustituyendo el correo:
   ```sql
   update public.profiles set role = 'admin' where email = 'OWNER_EMAIL';
   ```
6. Despliega la función y configura la clave privada de Gemini:
   ```sh
   supabase functions deploy ai-tutor
   supabase secrets set GEMINI_API_KEY=TU_CLAVE
   ```
   Supabase Functions proporciona `SUPABASE_URL` y `SUPABASE_ANON_KEY` en su entorno.
7. Configura las URLs permitidas y la URL de redirección de autenticación en Supabase.

## Rutas

- `/`: programa público.
- `/login`: registro e inicio de sesión.
- `/dashboard`: panel del alumno.
- `/admin`: vista administrativa protegida por rol.
- `/tutor`: interfaz del tutor IA.

## Modelo de datos

La migración crea `profiles`, `courses`, `lessons`, `enrollments` y `lesson_progress`. Las políticas RLS restringen perfiles, matrículas y progreso al usuario autenticado, y reservan las operaciones administrativas a perfiles con rol `admin`. El catálogo y las lecciones solo son visibles públicamente cuando están publicados.

## Alcance actual y siguientes pasos

Esta rama incorpora la base de autenticación, el panel inicial, el esquema de datos, control de acceso y endpoint de tutor. Para activar los servicios externos es necesario aplicar la migración y configurar Supabase/Gemini. También falta completar los formularios CRUD para administrar cursos y lecciones desde la interfaz y guardar el progreso por lección desde cada módulo. No se incluyen credenciales ni se afirma que los servicios externos estén configurados.

## Despliegue

Vercel debe construir el sitio con `npm install` y `npm run build`, generando `dist`. Los pushes a `main` activan el despliegue de producción según la configuración existente de Vercel.
