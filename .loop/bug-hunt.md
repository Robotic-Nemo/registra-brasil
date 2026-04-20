# Bug-hunt heuristics

Patterns that have produced real bugs in this codebase. Grep for
these before freehand bug hunting.

## 1. Local-time date math on UTC columns

`statement_date` is stored as `YYYY-MM-DD` UTC. Building bucket
keys with local `new Date(y, m, d)` drifts across midnight BRT.

```
Grep: new Date\([^)]*getMonth\(\)|getDate\(\)|getFullYear\(\)
       (without "UTC")
```

Fix: `Date.UTC(...)`, `.getUTCMonth()`, `.slice(0, 7)` / `.slice(0, 10)`.

## 2. Unsanitized user input in `.or(...)`

Any `q` / `search` param interpolated straight into a PostgREST
or-expression breaks on comma / paren / colon / backslash and
opens filter injection on `%` / `_`.

```
Grep: \.or\(`[^`]*\$\{
```

Fix: `q.replace(/[,()\\]/g, ' ').replace(/[%_]/g, ' ').trim()`.

## 3. Reused Supabase filter builder across awaits

supabase-js mutates. Two parallel awaits off the same builder
share state and produce identical queries.

```
Grep: const query = supabase\.from.*\n.*Promise\.all
```

Fix: factor `const build = () => supabase.from(…)`.

## 4. `has_more` off-by-one

`has_more: rows.length === limit` lies on the final page when
the final page lands exactly on `limit`.

```
Grep: rows?\.length === (limit|lim)
```

Fix: overfetch by 1 (`.range(offset, offset + limit)` or
`.limit(limit + 1)`), slice, set `hasMore = raw.length > limit`.

## 5. Null severity diluting averages

`severity_sum / count` — when `severity_score` is nullable,
count includes nulls, average drifts toward zero.

```
Grep: severity_sum / (count|b\.count)
```

Fix: track a separate `severity_n` denominator; return `null` when 0.

## 6. Unbounded SELECT on statements / statement_categories

Any `.select('…').eq('…', …)` without `.limit(N)` is a time bomb
on growth. Current bounds in `conventions.md`.

```
Grep: supabase\.from\('(statements|statement_categories)'\)
      (without .limit on the same chain)
```

Fix: `.limit(20000)` per-scope, `.limit(30000)` for category fanout.

## 7. Raw slug before validation

Validate the **raw** path param (pre-decode) with the scope's
regex gate, *then* decode. Validating only the decoded string
leaves malformed paths like `///` or control chars reaching DB.

```
Grep: const { slug } = await params\n\s*const party = decodeURIComponent
       (without a /^…$/.test(slug) between them)
```

## 8. Large IN() from joined rows

Any `.in('id', ids)` where `ids` comes from another query and
isn't sliced will blow the PostgREST URL length for wide tables.

```
Grep: \.in\('id', \w+Ids\)
```

Fix: chunk at 500 (`CHUNK = 500; for … slice(i, i+CHUNK)`).

## 9. Input-level equality checks that skip resolution

`if (a === b)` on input strings passes when one is a slug and
the other a UUID pointing to the same entity. See the Run 130
fix in `/api/comparar.json`.

```
Grep: if \((a|left|from) === (b|right|to)\)
```

Fix: resolve both to canonical IDs first, then recheck equality.

## 10. ETag on missing column

Some pivot tables (e.g. `statement_categories`) lack
`updated_at`. ETag based on `max(updated_at)` silently errors
or always returns the same key. Fall back to count-only ETag
for join tables.
