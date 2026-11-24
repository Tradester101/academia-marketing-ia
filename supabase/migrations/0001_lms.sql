-- Academia Marketing + IA: LMS foundation for Supabase.
-- Apply in the Supabase SQL Editor or with the Supabase CLI.

create extension if not exists pgcrypto;

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  email text,
  full_name text,
  role text not null default 'student' check (role in ('student', 'admin')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.courses (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  title text not null,
  description text not null default '',
  level text not null check (level in ('basico', 'intermedio', 'avanzado')),
  published boolean not null default false,
  sort_order integer not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists public.lessons (
  id uuid primary key default gen_random_uuid(),
  course_id uuid not null references public.courses(id) on delete cascade,
  slug text not null,
  title text not null,
  content_url text,
  sort_order integer not null default 0,
  published boolean not null default false,
  created_at timestamptz not null default now(),
  unique(course_id, slug)
);

create table if not exists public.enrollments (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  course_id uuid not null references public.courses(id) on delete cascade,
  enrolled_at timestamptz not null default now(),
  unique(user_id, course_id)
);

create table if not exists public.lesson_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  lesson_id uuid not null references public.lessons(id) on delete cascade,
  completed boolean not null default false,
  completed_at timestamptz,
  updated_at timestamptz not null default now(),
  unique(user_id, lesson_id)
);

create or replace function public.is_admin()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1 from public.profiles
    where id = (select auth.uid()) and role = 'admin'
  );
$$;

create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.profiles (id, email, full_name)
  values (
    new.id,
    new.email,
    coalesce(new.raw_user_meta_data ->> 'full_name', '')
  )
  on conflict (id) do update set email = excluded.email;
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
after insert on auth.users
for each row execute procedure public.handle_new_user();

alter table public.profiles enable row level security;
alter table public.courses enable row level security;
alter table public.lessons enable row level security;
alter table public.enrollments enable row level security;
alter table public.lesson_progress enable row level security;

drop policy if exists "Users can read own profile" on public.profiles;
create policy "Users can read own profile" on public.profiles
for select to authenticated using (id = (select auth.uid()) or public.is_admin());

drop policy if exists "Admins manage profiles" on public.profiles;
create policy "Admins manage profiles" on public.profiles
for all to authenticated using (public.is_admin()) with check (public.is_admin());

drop policy if exists "Published courses are visible" on public.courses;
create policy "Published courses are visible" on public.courses
for select to anon, authenticated using (published = true or public.is_admin());

drop policy if exists "Admins manage courses" on public.courses;
create policy "Admins manage courses" on public.courses
for all to authenticated using (public.is_admin()) with check (public.is_admin());

drop policy if exists "Published lessons are visible" on public.lessons;
create policy "Published lessons are visible" on public.lessons
for select to anon, authenticated using (
  (published = true and exists (
    select 1 from public.courses c where c.id = course_id and c.published = true
  )) or public.is_admin()
);

drop policy if exists "Admins manage lessons" on public.lessons;
create policy "Admins manage lessons" on public.lessons
for all to authenticated using (public.is_admin()) with check (public.is_admin());

drop policy if exists "Users read own enrollments" on public.enrollments;
create policy "Users read own enrollments" on public.enrollments
for select to authenticated using (user_id = (select auth.uid()) or public.is_admin());

drop policy if exists "Users enroll themselves" on public.enrollments;
create policy "Users enroll themselves" on public.enrollments
for insert to authenticated with check (
  user_id = (select auth.uid()) and exists (
    select 1 from public.courses c where c.id = course_id and c.published = true
  )
);

drop policy if exists "Admins manage enrollments" on public.enrollments;
create policy "Admins manage enrollments" on public.enrollments
for all to authenticated using (public.is_admin()) with check (public.is_admin());

drop policy if exists "Users manage own progress" on public.lesson_progress;
create policy "Users manage own progress" on public.lesson_progress
for all to authenticated using (user_id = (select auth.uid()))
with check (user_id = (select auth.uid()));

drop policy if exists "Admins read all progress" on public.lesson_progress;
create policy "Admins read all progress" on public.lesson_progress
for select to authenticated using (public.is_admin());

create index if not exists lessons_course_order_idx on public.lessons(course_id, sort_order);
create index if not exists enrollments_user_idx on public.enrollments(user_id);
create index if not exists progress_user_idx on public.lesson_progress(user_id);

-- Promote the academy owner manually after creating the first account:
-- update public.profiles set role = 'admin' where email = 'OWNER_EMAIL';
