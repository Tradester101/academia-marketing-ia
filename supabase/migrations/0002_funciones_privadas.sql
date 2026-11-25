-- 0002: cierra dos funciones SECURITY DEFINER que la API pública dejaba llamar
-- sin iniciar sesión (avisos 0028 y 0029 del linter de Supabase).
--
-- 1. public.handle_new_user() solo la usa el trigger on_auth_user_created de
--    auth.users. Nadie debe llamarla por /rest/v1/rpc, así que se le quita
--    EXECUTE a PUBLIC, anon y authenticated. El trigger sigue funcionando.
--
-- 2. public.is_admin() la usan las políticas RLS, incluidas las de lectura
--    pública de cursos y lecciones (rol anon). Quitarle EXECUTE a anon rompería
--    esas lecturas, así que se mueve a un esquema "private" que PostgREST no
--    expone: las políticas la siguen usando y deja de existir como /rpc/is_admin.

begin;

-- 1. Trigger de alta de usuarios: fuera de la API
revoke execute on function public.handle_new_user() from public, anon, authenticated;

-- 2. is_admin en un esquema no expuesto
create schema if not exists private;
revoke all on schema private from public;
grant usage on schema private to anon, authenticated, service_role;

create or replace function private.is_admin()
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (
    select 1 from public.profiles
    where id = (select auth.uid()) and role = 'admin'
  );
$$;

revoke execute on function private.is_admin() from public;
grant execute on function private.is_admin() to anon, authenticated, service_role;

-- Las políticas pasan a usar private.is_admin()
alter policy "Users can read own profile" on public.profiles
  using (id = (select auth.uid()) or private.is_admin());

alter policy "Admins manage profiles" on public.profiles
  using (private.is_admin()) with check (private.is_admin());

alter policy "Published courses are visible" on public.courses
  using (published = true or private.is_admin());

alter policy "Admins manage courses" on public.courses
  using (private.is_admin()) with check (private.is_admin());

alter policy "Published lessons are visible" on public.lessons
  using ((published = true and exists (
    select 1 from public.courses c
    where c.id = lessons.course_id and c.published = true
  )) or private.is_admin());

alter policy "Admins manage lessons" on public.lessons
  using (private.is_admin()) with check (private.is_admin());

alter policy "Users read own enrollments" on public.enrollments
  using (user_id = (select auth.uid()) or private.is_admin());

alter policy "Admins manage enrollments" on public.enrollments
  using (private.is_admin()) with check (private.is_admin());

alter policy "Admins read all progress" on public.lesson_progress
  using (private.is_admin());

-- Ya no la usa ninguna política; sin "cascade" para que falle si algo más dependiera de ella
drop function public.is_admin();

commit;
