-- Workout tracker schema. Paste into the Supabase SQL Editor and run once.

-- Milestone 1: one row per day. A day with no row counts as not worked out.
create table workout_days (
  day        date primary key,
  worked_out boolean not null default true,
  updated_at timestamptz not null default now()
);

-- Anyone with the page can read and toggle days; nobody can delete rows.
alter table workout_days enable row level security;
create policy "read"   on workout_days for select using (true);
create policy "insert" on workout_days for insert with check (true);
create policy "update" on workout_days for update using (true);

-- Milestone 2: the shared next workout, a single row.
create table next_workout (
  id         int primary key default 1 check (id = 1),  -- only ever one row
  starts_at  timestamptz,
  note       text default 'see you tomorrow' check (char_length(note) <= 60),
  updated_at timestamptz not null default now()
);
insert into next_workout (id) values (1);

alter table next_workout enable row level security;
create policy "read"   on next_workout for select using (true);
create policy "update" on next_workout for update using (true);

-- Push changes to every open page.
alter publication supabase_realtime add table workout_days;
alter publication supabase_realtime add table next_workout;
