# Escola Digital

Plataforma de ensino digital para crianças e adolescentes. Primeiro curso: **Educação Financeira e Empreendedorismo**.

## Stack

- React + Vite + Tailwind CSS v4
- Supabase (Postgres + Auth + RLS)
- Deploy: Vercel

## Como rodar localmente

```bash
npm install
cp .env.example .env.local   # preencha com sua URL e chave anon do Supabase
npm run dev
```

## Banco de dados

O schema completo (tabelas + RLS) está em `database/schema.sql`. Rode esse script no
SQL Editor do seu projeto Supabase antes de usar a aplicação.

## Modelo de contas

- **Responsável, professor e admin** têm login próprio (e-mail/senha via Supabase Auth).
- **Aluno** é um perfil dentro da conta do responsável (sem login próprio), parecido com
  perfis de filho em serviços de streaming — protege a criança e simplifica o acesso.

## Status do build (fases)

- [x] Fase 1 — Schema do banco de dados (Supabase)
- [x] Fase 2 — Estrutura do front-end, autenticação do responsável, cadastro de filhos
- [ ] Fase 3 — Gamificação (XP, medalhas, níveis)
- [ ] Fase 4 — Atividades interativas dos módulos
- [ ] Fase 5 — Área dos responsáveis (acompanhamento)
- [ ] Fase 6 — Painel administrativo
- [ ] Fase 7 — Projeto final + certificado
