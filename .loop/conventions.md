# Conventions

## Runtime / revalidate

```ts
export const runtime = 'nodejs'          // default; 'edge' only if all deps are edge-safe
export const revalidate = 3600           // or 1800 / 900 / 600 depending on freshness
```

## Rate limit

```ts
const rl = checkRateLimit(getRateLimitKey(request, '<prefix>'), {
  limit: 60, windowMs: 60_000,
})
if (!rl.allowed) {
  return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
}
```

Prefix is a short kebab unique to the endpoint. Limits by endpoint
class: 120 for SVGs, 60 for most JSON, 30 for aggregate / export,
20 for heavy ranking, 100 for v2 APIs.

## Regex gates (SLUG_RE catalog)

- **Politico slug**: `/^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/`
- **Category slug**: same as politico
- **Statement id/slug (declaracao)**: `/^[a-z0-9-]{1,120}$/i`
- **Party slug (URL-encoded acronym)**: `/^[a-z0-9%A-Z.-]{1,100}$/`
  — validate before `decodeURIComponent`
- **UF**: `/^[A-Za-z]{2}$/`
- **Domain**: `/^[a-z0-9%.-]{3,253}$/i`
- **Hex color**: `/^#[0-9a-fA-F]{3,8}$/`

## Supabase type bypass

Project's generated types leak "never" on complex selects.
Canonical bypass:

```ts
const { data } = await (supabase.from('x') as any)
  .select('…')
  ...
```

Same for RPCs: `(supabase.rpc as any)('fn_name', { arg: v })`.

## ETag + 304

Weak, content-keyed. Prefix tags the endpoint class.

```ts
const etag = `W/"pt-cats-${party}-${rows.length}-${primary.size}"`
if (request.headers.get('if-none-match') === etag) {
  return new Response(null, { status: 304, headers: { ETag: etag } })
}
// …
return NextResponse.json(body, {
  headers: {
    'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
    ETag: etag,
  },
})
```

For SVG histograms/sparklines use `histogramEtag(prefix, buckets)`
/ `sparklineEtag(prefix, buckets)` from `lib/export/*-svg.ts`.

## Cache-Control tiers

Pick the row that matches freshness:

| Freshness            | Cache-Control                                                          |
|----------------------|------------------------------------------------------------------------|
| real-time random     | `no-store`                                                             |
| recent feed          | `public, max-age=60, s-maxage=180, stale-while-revalidate=600`         |
| list / search        | `public, max-age=120, s-maxage=600, stale-while-revalidate=1800`       |
| scope stats / aggreg | `public, max-age=900, s-maxage=1800, stale-while-revalidate=3600`      |
| directory / totals   | `public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400`    |
| chart / sparkline    | `public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400`    |
| openapi / changelog  | `public, max-age=3600, s-maxage=10800, stale-while-revalidate=86400`   |

## Cursor pagination

```ts
import { decodeCursor, parseLimit, buildCursorPagination } from '@/lib/utils/cursor-pagination'

const limit = parseLimit(sp.get('limit'), 20, 100)
let query = supabase.from('statements').select('…')
  .order('statement_date', { ascending })
  .order('id', { ascending })
  .limit(limit + 1)
if (cursor) {
  const d = decodeCursor(cursor)
  if (d) {
    query = query.or(ascending
      ? `statement_date.gt.${d.v},and(statement_date.eq.${d.v},id.gt.${d.id})`
      : `statement_date.lt.${d.v},and(statement_date.eq.${d.v},id.lt.${d.id})`)
  }
}
// …
const hasMore = rows.length > limit
const pageRows = hasMore ? rows.slice(0, limit) : rows
const pagination = buildCursorPagination(pageRows, 'statement_date', limit, hasMore)
```

## Parallel queries: the `build()` trap

supabase-js filter methods **mutate the builder**. For parallel
awaits, factor a factory:

```ts
const build = () => (supabase.from('statements') as any)
  .select('…').eq('politician_id', pid).neq('verification_status', 'removed')
const [before, after] = await Promise.all([
  build().lte('statement_date', d).order(..., { ascending: false }).limit(n),
  build().gte('statement_date', d).order(..., { ascending: true  }).limit(n),
])
```

## User input in `.or(...)`

PostgREST or-filters parse `,`, `(`, `)`, `:` as grammar.
Always sanitize:

```ts
const safe = q.replace(/[,()\\]/g, ' ').replace(/[%_]/g, ' ').trim()
if (safe) query = query.or(`summary.ilike.%${safe}%,full_quote.ilike.%${safe}%`)
```

## UTC dates, always

Statement dates are `YYYY-MM-DD` in UTC. Never build bucket keys
with local-time math:

```ts
// Good
const d = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - i, 1))
const ym = `${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`

// Bad (BRT drift at month boundaries)
const d = new Date(y, m, 1)
```

## Chunked IN()

Large ID sets blow PostgREST URL length. Chunk at 500:

```ts
const CHUNK = 500
for (let i = 0; i < ids.length; i += CHUNK) {
  const { data } = await supabase.from('t').select('…')
    .in('id', ids.slice(i, i + CHUNK))
    .limit(CHUNK)
  // …
}
```

## CSV dumps

Use `csvEscape()` — guards against formula-injection (leading
`=+-@\t\r`).

## `extractDomain`

From `@/lib/sources/domain`. Normalizes host, strips `www.`.

## Bounded aggregation

Every aggregate query hits `.limit(N)`. Current conventions:

- per-scope aggregation: 20_000
- statement_categories scan: 30_000 (category fanout is wide)
- global catalogs: 50_000

Never run an unbounded `SELECT` on `statements` or
`statement_categories`.
