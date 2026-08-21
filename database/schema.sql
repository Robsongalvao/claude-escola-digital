-- =========================================================
-- ESCOLA DIGITAL - SCHEMA INICIAL (FASE 1)
-- Supabase (Postgres) - Auth + Estrutura de Cursos + Gamificacao
-- =========================================================
-- Modelo de acesso:
--   * admin, professor, responsavel  -> tem login proprio (auth.users)
--   * aluno                          -> e um "perfil filho" dentro da
--                                        conta do responsavel, SEM login
--                                        proprio (como perfis de filho
--                                        na Netflix). Protege a crianca
--                                        e simplifica a autenticacao.
-- =========================================================

-- ---------- EXTENSOES ----------
create extension if not exists "pgcrypto";

-- ---------- ENUM TYPES ----------
create type public.user_role as enum ('admin', 'professor', 'responsavel');
create type public.progress_status as enum ('nao_iniciado', 'em_andamento', 'concluido');
create type public.activity_type as enum ('escolha', 'classificacao', 'simulacao', 'calculadora', 'texto_livre');

-- =========================================================
-- 1. PROFILES (usuarios com login: admin / professor / responsavel)
-- =========================================================
create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  email text not null,
  full_name text not null,
  role public.user_role not null default 'responsavel',
  created_at timestamptz not null default now()
);

-- =========================================================
-- 2. STUDENTS (perfis de aluno, filhos do responsavel)
-- =========================================================
create table public.students (
  id uuid primary key default gen_random_uuid(),
  responsavel_id uuid not null references public.profiles(id) on delete cascade,
  name text not null,
  avatar_url text,
  birth_date date,
  xp_total integer not null default 0,
  level integer not null default 1,
  created_at timestamptz not null default now()
);

-- =========================================================
-- 3. CURSOS / MODULOS / AULAS (estrutura hierarquica reutilizavel)
-- =========================================================
create table public.courses (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  title text not null,
  description text,
  icon text,
  is_published boolean not null default false,
  order_index integer not null default 0,
  created_at timestamptz not null default now()
);

create table public.modules (
  id uuid primary key default gen_random_uuid(),
  course_id uuid not null references public.courses(id) on delete cascade,
  title text not null,
  description text,
  order_index integer not null default 0,
  created_at timestamptz not null default now()
);

create table public.lessons (
  id uuid primary key default gen_random_uuid(),
  module_id uuid not null references public.modules(id) on delete cascade,
  title text not null,
  introduction text,
  content text,
  examples text,
  xp_reward integer not null default 10,
  order_index integer not null default 0,
  created_at timestamptz not null default now()
);

-- =========================================================
-- 4. ATIVIDADES E QUIZZES
-- =========================================================
create table public.activities (
  id uuid primary key default gen_random_uuid(),
  lesson_id uuid not null references public.lessons(id) on delete cascade,
  type public.activity_type not null,
  title text not null,
  config jsonb not null default '{}'::jsonb, -- perguntas, opcoes, respostas certas, etc
  order_index integer not null default 0,
  created_at timestamptz not null default now()
);

create table public.quizzes (
  id uuid primary key default gen_random_uuid(),
  lesson_id uuid not null references public.lessons(id) on delete cascade,
  title text not null,
  created_at timestamptz not null default now()
);

create table public.quiz_questions (
  id uuid primary key default gen_random_uuid(),
  quiz_id uuid not null references public.quizzes(id) on delete cascade,
  question text not null,
  options jsonb not null, -- ["opcao 1", "opcao 2", ...]
  correct_option integer not null, -- indice da opcao correta
  order_index integer not null default 0
);

-- =========================================================
-- 5. PROGRESSO DO ALUNO
-- =========================================================
create table public.student_progress (
  id uuid primary key default gen_random_uuid(),
  student_id uuid not null references public.students(id) on delete cascade,
  lesson_id uuid not null references public.lessons(id) on delete cascade,
  status public.progress_status not null default 'nao_iniciado',
  score integer,
  time_spent_seconds integer default 0,
  completed_at timestamptz,
  updated_at timestamptz not null default now(),
  unique (student_id, lesson_id)
);

-- =========================================================
-- 6. GAMIFICACAO: CONQUISTAS
-- =========================================================
create table public.achievements (
  id uuid primary key default gen_random_uuid(),
  code text unique not null,
  title text not null,
  description text,
  icon text,
  created_at timestamptz not null default now()
);

create table public.student_achievements (
  id uuid primary key default gen_random_uuid(),
  student_id uuid not null references public.students(id) on delete cascade,
  achievement_id uuid not null references public.achievements(id) on delete cascade,
  earned_at timestamptz not null default now(),
  unique (student_id, achievement_id)
);

-- =========================================================
-- 7. DESAFIOS (ex: 7 dias, 30 dias de poupanca)
-- =========================================================
create table public.challenges (
  id uuid primary key default gen_random_uuid(),
  student_id uuid not null references public.students(id) on delete cascade,
  challenge_code text not null, -- ex: 'poupanca_7_dias'
  target_days integer not null,
  current_streak integer not null default 0,
  started_at timestamptz not null default now(),
  completed boolean not null default false
);

-- =========================================================
-- 8. PROJETO FINAL ("Meu Primeiro Negocio")
-- =========================================================
create table public.student_projects (
  id uuid primary key default gen_random_uuid(),
  student_id uuid not null references public.students(id) on delete cascade,
  course_id uuid not null references public.courses(id) on delete cascade,
  business_name text,
  logo_url text,
  product_service text,
  target_audience text,
  problem_solved text,
  cost numeric(10,2),
  sale_price numeric(10,2),
  profit_estimate numeric(10,2),
  marketing_strategy text,
  service_approach text,
  social_post_text text,
  submitted_at timestamptz
);

-- =========================================================
-- 9. CERTIFICADOS
-- =========================================================
create table public.certificates (
  id uuid primary key default gen_random_uuid(),
  student_id uuid not null references public.students(id) on delete cascade,
  course_id uuid not null references public.courses(id) on delete cascade,
  issued_at timestamptz not null default now(),
  certificate_url text
);

-- =========================================================
-- ROW LEVEL SECURITY (RLS)
-- =========================================================
alter table public.profiles enable row level security;
alter table public.students enable row level security;
alter table public.courses enable row level security;
alter table public.modules enable row level security;
alter table public.lessons enable row level security;
alter table public.activities enable row level security;
alter table public.quizzes enable row level security;
alter table public.quiz_questions enable row level security;
alter table public.student_progress enable row level security;
alter table public.achievements enable row level security;
alter table public.student_achievements enable row level security;
alter table public.challenges enable row level security;
alter table public.student_projects enable row level security;
alter table public.certificates enable row level security;

-- Helper: verifica se o usuario logado e admin ou professor
create or replace function public.is_staff()
returns boolean
language sql
security definer
stable
as $$
  select exists (
    select 1 from public.profiles
    where id = auth.uid() and role in ('admin', 'professor')
  );
$$;

-- Helper: verifica se um student_id pertence ao responsavel logado
create or replace function public.owns_student(sid uuid)
returns boolean
language sql
security definer
stable
as $$
  select exists (
    select 1 from public.students
    where id = sid and responsavel_id = auth.uid()
  );
$$;

-- ---------- PROFILES ----------
create policy "Usuario le proprio perfil" on public.profiles
  for select using (id = auth.uid() or public.is_staff());
create policy "Usuario atualiza proprio perfil" on public.profiles
  for update using (id = auth.uid());
create policy "Usuario cria proprio perfil" on public.profiles
  for insert with check (id = auth.uid());

-- ---------- STUDENTS ----------
create policy "Responsavel gerencia seus alunos" on public.students
  for all using (responsavel_id = auth.uid() or public.is_staff())
  with check (responsavel_id = auth.uid() or public.is_staff());

-- ---------- COURSES / MODULES / LESSONS / ACTIVITIES / QUIZZES ----------
-- Leitura liberada para qualquer usuario autenticado; escrita so para staff
create policy "Leitura publica de cursos" on public.courses
  for select using (auth.role() = 'authenticated');
create policy "Staff gerencia cursos" on public.courses
  for all using (public.is_staff()) with check (public.is_staff());

create policy "Leitura publica de modulos" on public.modules
  for select using (auth.role() = 'authenticated');
create policy "Staff gerencia modulos" on public.modules
  for all using (public.is_staff()) with check (public.is_staff());

create policy "Leitura publica de aulas" on public.lessons
  for select using (auth.role() = 'authenticated');
create policy "Staff gerencia aulas" on public.lessons
  for all using (public.is_staff()) with check (public.is_staff());

create policy "Leitura publica de atividades" on public.activities
  for select using (auth.role() = 'authenticated');
create policy "Staff gerencia atividades" on public.activities
  for all using (public.is_staff()) with check (public.is_staff());

create policy "Leitura publica de quizzes" on public.quizzes
  for select using (auth.role() = 'authenticated');
create policy "Staff gerencia quizzes" on public.quizzes
  for all using (public.is_staff()) with check (public.is_staff());

create policy "Leitura publica de perguntas" on public.quiz_questions
  for select using (auth.role() = 'authenticated');
create policy "Staff gerencia perguntas" on public.quiz_questions
  for all using (public.is_staff()) with check (public.is_staff());

-- ---------- STUDENT PROGRESS ----------
create policy "Responsavel ve progresso dos filhos" on public.student_progress
  for select using (public.owns_student(student_id) or public.is_staff());
create policy "Responsavel registra progresso dos filhos" on public.student_progress
  for insert with check (public.owns_student(student_id) or public.is_staff());
create policy "Responsavel atualiza progresso dos filhos" on public.student_progress
  for update using (public.owns_student(student_id) or public.is_staff());

-- ---------- ACHIEVEMENTS (catalogo publico) ----------
create policy "Leitura publica de conquistas" on public.achievements
  for select using (auth.role() = 'authenticated');
create policy "Staff gerencia conquistas" on public.achievements
  for all using (public.is_staff()) with check (public.is_staff());

create policy "Responsavel ve conquistas dos filhos" on public.student_achievements
  for select using (public.owns_student(student_id) or public.is_staff());
create policy "Sistema registra conquistas" on public.student_achievements
  for insert with check (public.owns_student(student_id) or public.is_staff());

-- ---------- CHALLENGES ----------
create policy "Responsavel gerencia desafios dos filhos" on public.challenges
  for all using (public.owns_student(student_id) or public.is_staff())
  with check (public.owns_student(student_id) or public.is_staff());

-- ---------- STUDENT PROJECTS ----------
create policy "Responsavel gerencia projetos dos filhos" on public.student_projects
  for all using (public.owns_student(student_id) or public.is_staff())
  with check (public.owns_student(student_id) or public.is_staff());

-- ---------- CERTIFICATES ----------
create policy "Responsavel ve certificados dos filhos" on public.certificates
  for select using (public.owns_student(student_id) or public.is_staff());
create policy "Staff emite certificados" on public.certificates
  for insert with check (public.is_staff());

-- =========================================================
-- SEED INICIAL: curso de Educacao Financeira e Empreendedorismo
-- =========================================================
insert into public.courses (slug, title, description, icon, is_published, order_index)
values (
  'educacao-financeira-empreendedorismo',
  'Educacao Financeira e Empreendedorismo',
  'Aprenda a entender o dinheiro, planejar objetivos e criar seu primeiro pequeno negocio.',
  '💰',
  true,
  1
);

-- =========================================================
-- FIM DA FASE 1
-- =========================================================
