-- Схема для трекера КБЖУ. Выполнить целиком в Supabase → SQL Editor.

create table if not exists public.days (
  user_id    uuid not null default auth.uid() references auth.users(id) on delete cascade,
  day        date not null,
  entries    jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (user_id, day)
);

create table if not exists public.goals (
  user_id uuid primary key default auth.uid() references auth.users(id) on delete cascade,
  kcal    numeric not null,
  p       numeric not null,
  f       numeric not null,
  c       numeric not null
);

alter table public.days  enable row level security;
alter table public.goals enable row level security;

drop policy if exists "days_select" on public.days;
drop policy if exists "days_insert" on public.days;
drop policy if exists "days_update" on public.days;
drop policy if exists "days_delete" on public.days;
create policy "days_select" on public.days for select using (user_id = auth.uid());
create policy "days_insert" on public.days for insert with check (user_id = auth.uid());
create policy "days_update" on public.days for update using (user_id = auth.uid()) with check (user_id = auth.uid());
create policy "days_delete" on public.days for delete using (user_id = auth.uid());

drop policy if exists "goals_select" on public.goals;
drop policy if exists "goals_insert" on public.goals;
drop policy if exists "goals_update" on public.goals;
drop policy if exists "goals_delete" on public.goals;
create policy "goals_select" on public.goals for select using (user_id = auth.uid());
create policy "goals_insert" on public.goals for insert with check (user_id = auth.uid());
create policy "goals_update" on public.goals for update using (user_id = auth.uid()) with check (user_id = auth.uid());
create policy "goals_delete" on public.goals for delete using (user_id = auth.uid());

grant select, insert, update, delete on public.days, public.goals to authenticated;
