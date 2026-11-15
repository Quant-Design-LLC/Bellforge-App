-- BellForge database setup (version 1.0.13)
-- Paste this whole file into Supabase > SQL Editor > New query, then click Run.
-- Safe to run again: it only creates what is missing and replaces the policies.

-- ---------- Profiles (one per account; usernames are public to signed-in users) ----------
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  username text not null unique check (username ~ '^[a-z0-9_]{3,20}$'),
  display_name text not null default '' check (char_length(display_name) <= 30),
  level smallint not null default 1 check (level between 1 and 3),
  created_at timestamptz not null default now()
);

-- ---------- Friendships (request -> accept) ----------
create table if not exists public.friendships (
  requester uuid not null references public.profiles(id) on delete cascade,
  addressee uuid not null references public.profiles(id) on delete cascade,
  status text not null default 'pending' check (status in ('pending','accepted')),
  created_at timestamptz not null default now(),
  primary key (requester, addressee),
  check (requester <> addressee)
);
create unique index if not exists friendships_pair_idx
  on public.friendships (least(requester, addressee), greatest(requester, addressee));

-- ---------- Activity feed (what friends see) ----------
create table if not exists public.activities (
  id bigint generated always as identity primary key,
  user_id uuid not null default auth.uid() references public.profiles(id) on delete cascade,
  kind text not null default 'workout' check (kind in ('workout','challenge','joined')),
  title text not null check (char_length(title) <= 120),
  minutes int check (minutes between 0 and 600),
  created_at timestamptz not null default now()
);
create index if not exists activities_user_time_idx on public.activities (user_id, created_at desc);

-- ---------- Shared challenges ----------
create table if not exists public.challenges (
  id uuid primary key default gen_random_uuid(),
  owner uuid not null default auth.uid() references public.profiles(id) on delete cascade,
  name text not null check (char_length(name) between 1 and 40),
  metric text not null check (metric ~ '^[a-z]{2,20}$'),
  rule jsonb not null default '{}'::jsonb check (octet_length(rule::text) < 2000),
  target int check (target between 1 and 100000),
  days int not null check (days between 1 and 90),
  start_date date not null default current_date,
  stake text check (char_length(stake) <= 60),
  created_at timestamptz not null default now()
);
create table if not exists public.challenge_members (
  challenge_id uuid not null references public.challenges(id) on delete cascade,
  user_id uuid not null default auth.uid() references public.profiles(id) on delete cascade,
  score int not null default 0 check (score between 0 and 1000000),
  joined_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  primary key (challenge_id, user_id)
);

-- ---------- Cloud backup of each person's training history (only they can read it) ----------
create table if not exists public.backups (
  user_id uuid primary key default auth.uid() references auth.users(id) on delete cascade,
  data jsonb not null check (octet_length(data::text) < 1000000),
  updated_at timestamptz not null default now()
);

-- ---------- Helper checks (run with owner rights so policies don't loop) ----------
create or replace function public.is_friend(a uuid, b uuid) returns boolean
language sql stable security definer set search_path = public as $$
  select exists (select 1 from friendships f where f.status = 'accepted'
    and ((f.requester = a and f.addressee = b) or (f.requester = b and f.addressee = a)));
$$;
create or replace function public.is_member(cid uuid, uid uuid) returns boolean
language sql stable security definer set search_path = public as $$
  select exists (select 1 from challenge_members m where m.challenge_id = cid and m.user_id = uid);
$$;
create or replace function public.can_join(cid uuid) returns boolean
language sql stable security definer set search_path = public as $$
  select exists (select 1 from challenges c where c.id = cid
    and (c.owner = auth.uid() or is_friend(auth.uid(), c.owner)));
$$;

-- Lets the sign-up screen check a username before the account exists. Returns only true/false.
create or replace function public.username_available(u text) returns boolean
language sql stable security definer set search_path = public as $$
  select u ~ '^[a-z0-9_]{3,20}$' and not exists (select 1 from profiles p where p.username = u);
$$;
grant execute on function public.username_available(text) to anon, authenticated;

-- Lets a signed-in person delete their own account and everything attached to it.
create or replace function public.delete_my_account() returns void
language plpgsql security definer set search_path = public, auth as $$
begin
  if auth.uid() is null then raise exception 'not signed in'; end if;
  delete from auth.users where id = auth.uid();
end;
$$;
revoke all on function public.delete_my_account() from public, anon;
grant execute on function public.delete_my_account() to authenticated;
revoke all on function public.is_friend(uuid,uuid) from anon;
revoke all on function public.is_member(uuid,uuid) from anon;
revoke all on function public.can_join(uuid) from anon;

-- ---------- Row level security ----------
alter table public.profiles enable row level security;
alter table public.friendships enable row level security;
alter table public.activities enable row level security;
alter table public.challenges enable row level security;
alter table public.challenge_members enable row level security;
alter table public.backups enable row level security;

drop policy if exists "profiles readable by signed-in users" on public.profiles;
create policy "profiles readable by signed-in users" on public.profiles for select to authenticated using (true);
drop policy if exists "create own profile" on public.profiles;
create policy "create own profile" on public.profiles for insert to authenticated with check (id = auth.uid());
drop policy if exists "edit own profile" on public.profiles;
create policy "edit own profile" on public.profiles for update to authenticated using (id = auth.uid()) with check (id = auth.uid());

drop policy if exists "see own friendships" on public.friendships;
create policy "see own friendships" on public.friendships for select to authenticated using (auth.uid() in (requester, addressee));
drop policy if exists "send friend request" on public.friendships;
create policy "send friend request" on public.friendships for insert to authenticated with check (requester = auth.uid() and status = 'pending');
drop policy if exists "accept friend request" on public.friendships;
create policy "accept friend request" on public.friendships for update to authenticated using (addressee = auth.uid()) with check (addressee = auth.uid() and status = 'accepted');
drop policy if exists "remove friendship" on public.friendships;
create policy "remove friendship" on public.friendships for delete to authenticated using (auth.uid() in (requester, addressee));

drop policy if exists "see own and friends activity" on public.activities;
create policy "see own and friends activity" on public.activities for select to authenticated using (user_id = auth.uid() or public.is_friend(auth.uid(), user_id));
drop policy if exists "post own activity" on public.activities;
create policy "post own activity" on public.activities for insert to authenticated with check (user_id = auth.uid());
drop policy if exists "delete own activity" on public.activities;
create policy "delete own activity" on public.activities for delete to authenticated using (user_id = auth.uid());

drop policy if exists "see challenges" on public.challenges;
create policy "see challenges" on public.challenges for select to authenticated
  using (owner = auth.uid() or public.is_member(id, auth.uid()) or public.is_friend(auth.uid(), owner));
drop policy if exists "create challenge" on public.challenges;
create policy "create challenge" on public.challenges for insert to authenticated with check (owner = auth.uid());
drop policy if exists "delete own challenge" on public.challenges;
create policy "delete own challenge" on public.challenges for delete to authenticated using (owner = auth.uid());

drop policy if exists "see challenge members" on public.challenge_members;
create policy "see challenge members" on public.challenge_members for select to authenticated using (public.is_member(challenge_id, auth.uid()));
drop policy if exists "join challenge" on public.challenge_members;
create policy "join challenge" on public.challenge_members for insert to authenticated with check (user_id = auth.uid() and public.can_join(challenge_id));
drop policy if exists "update own score" on public.challenge_members;
create policy "update own score" on public.challenge_members for update to authenticated using (user_id = auth.uid()) with check (user_id = auth.uid());
drop policy if exists "leave challenge" on public.challenge_members;
create policy "leave challenge" on public.challenge_members for delete to authenticated using (user_id = auth.uid());

drop policy if exists "own backup" on public.backups;
create policy "own backup" on public.backups for all to authenticated using (user_id = auth.uid()) with check (user_id = auth.uid());

-- Signed-out visitors get nothing.
revoke all on public.profiles, public.friendships, public.activities, public.challenges, public.challenge_members, public.backups from anon;
