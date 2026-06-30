-- Script para criação da tabela no Supabase (colar no SQL Editor do painel do Supabase)

-- 1. Criar a tabela de posts do planner (Para novos projetos)
create table if not exists public.planner_posts (
  id text not null,
  user_id text not null,
  date text,
  time text,
  platform text,
  type text,
  phase text,
  status text,
  title text,
  hook text,
  copy text,
  visual text,
  cta text,
  sponsor text,
  priority text,
  owner text,
  notes text,
  ref_text text,
  ref_image text,
  ref_link text,
  feed_pos numeric,
  feed_pos_feed numeric,
  feed_pos_reels numeric,
  items jsonb default '[]'::jsonb,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null,
  constraint planner_posts_pkey primary key (id, user_id)
);

-- 2. Ativar Row Level Security (RLS)
alter table public.planner_posts enable row level security;

-- 3. Criar política de acesso público total (para uso da chave Anon pública)
create policy "Acesso público total para planner_posts"
on public.planner_posts
for all
using (true)
with check (true);

-- 4. Criar índice para otimização de busca por usuário
create index if not exists planner_posts_user_id_idx on public.planner_posts(user_id);

-- =========================================================================
-- SCRIPT DE ATUALIZAÇÃO (Rode apenas se você já criou a tabela anteriormente)
-- =========================================================================
-- alter table public.planner_posts 
-- add column if not exists ref_text text,
-- add column if not exists ref_image text,
-- add column if not exists ref_link text;

