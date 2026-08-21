-- =========================================================
-- ESCOLA DIGITAL - MIGRACAO 002
-- Cria o perfil automaticamente quando um usuario se registra,
-- via trigger no auth.users (roda com privilegio de sistema,
-- entao nao esbarra nas regras de RLS mesmo antes da
-- confirmacao de e-mail).
-- =========================================================

create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.profiles (id, email, full_name, role)
  values (
    new.id,
    new.email,
    coalesce(new.raw_user_meta_data->>'full_name', ''),
    'responsavel'
  )
  on conflict (id) do nothing;
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- Como o trigger agora cria o profile, o app nao precisa mais
-- (e nao deve) tentar inserir manualmente - isso evita duplicidade
-- e erros de RLS.
