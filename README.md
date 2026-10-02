# fitness friends

A shared workout calendar. Click a day to mark it as a workout day, and set the next
workout on the sticky note. Everyone with the link sees the same data.

It's one static page (`index.html`) hosted on GitHub Pages, with data in Supabase.

## Setup

1. Create a free project at [supabase.com](https://supabase.com).
2. In the project's SQL Editor, paste and run [`schema.sql`](schema.sql).
3. In Project Settings → API, copy the Project URL and the anon public key into
   `SUPABASE_URL` and `SUPABASE_ANON_KEY` at the top of the script in `index.html`.
   Never use the `service_role` key here.

Until those are filled in, the page runs in demo mode and saves to your browser only.

## Run locally

```bash
python3 -m http.server 8000
```

Then open http://localhost:8000.

## Deploy

Push to GitHub, then in the repo's Settings → Pages, deploy from the `main` branch root.

## Adding months

Add an entry to `MONTHS` in `index.html`, with its year, month (1–12) and colors.
The database needs no changes.
