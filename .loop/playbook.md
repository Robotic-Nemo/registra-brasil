# Per-run playbook

## 1. Orient (60 s)

```
tail -30 .loop-progress.md       # last run → next run number
```

Read the last run block: what scope did I just close? The matrix in
`endpoints.md` shows the gap-find.

## 2. Plan (mental)

Every run needs:
- **≥3 substantial features** — new endpoints, new data surfaces,
  or significant widening of an existing one.
- **≥1 bug fix** — see `bug-hunt.md`. If nothing jumps out, grep
  for the patterns there.
- **≥1 cost opt** — usually satisfied automatically by shipping
  ETags + Cache-Control on every new endpoint.

Prefer matrix-completing work (scope × facet) over novel one-offs
until the matrix is full.

## 3. Build

- Follow `conventions.md`. Copy an existing neighbor (`sed` / read)
  as the template, don't freehand.
- **Shared utils to reach for:** `checkRateLimit`, `getRateLimitKey`,
  `decodeCursor/buildCursorPagination/parseLimit`, `extractDomain`,
  `isValidDate`, `renderSparklineSvg/renderHistogramSvg`,
  `SPARKLINE_HEADERS/HISTOGRAM_HEADERS`, `csvEscape`.
- **Regex gates** must match the route's param shape. Catalog in
  `conventions.md` §SLUG_RE.

## 4. Update explorer

Every new endpoint → one line in
`app/desenvolvedores/api/page.tsx`. Each `params` entry needs a
`desc` — the type rejects `{ name }` without it.

## 5. Log

Append a block to `.loop-progress.md` (repo root) matching the
existing rhythm: Feature / Bug fix / Cost opt bullets, one sentence
each, past tense.

## 6. Verify + commit

```
./node_modules/.bin/tsc --noEmit
git add -A
git commit -m "Run N/500: <short title>"           # HEREDOC body
```

**Deploy-batch runs (N % 10 == 0):** add `git push` after the
commit lands.

## 7. Never

- Skip the explorer entry.
- Commit without typecheck.
- Use local-time date math on UTC columns. Always `Date.UTC` /
  `getUTCMonth` / `getUTCDate` / `.slice(0, 7)` on ISO strings.
- Reuse a Supabase filter builder across two parallel awaits.
  supabase-js mutates; factor a `build()` function instead.
- Interpolate user input raw into a PostgREST `.or(...)` filter.
  Commas, parens, backslashes, `%`, `_` are all grammar / LIKE
  metachars and must be stripped.
