import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 7200

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/indices/co-ocorrencia.json — category co-occurrence
 * graph. Scans `statement_categories` for verified statements,
 * groups tags per statement, and emits the top co-occurring
 * category pairs (sorted by count).
 *
 * Params:
 *   - limit: max pairs (1..500, default 100)
 *   - min_count: minimum co-occurrence count to include (default 2)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'co-ocorrencia'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const sp = request.nextUrl.searchParams
  const limit = Math.min(Math.max(parseInt(sp.get('limit') ?? '100', 10) || 100, 1), 500)
  const minCount = Math.max(parseInt(sp.get('min_count') ?? '2', 10) || 2, 1)

  const supabase = getSupabaseServiceClient()
  // Pull up to 50k (statement_id, category_id) rows from verified
  // statements. Pairs explode O(k²) per statement, so cap scan here.
  const { data } = await (supabase.from('statement_categories') as any)
    .select('statement_id, category_id, statements!inner(verification_status), categories!inner(slug, label_pt)')
    .eq('statements.verification_status', 'verified')
    .limit(50000)

  type Row = {
    statement_id: string
    category_id: string
    categories: { slug: string; label_pt: string } | null
  }
  const rows = (data ?? []) as Row[]

  // Group category slugs per statement; de-dupe inside a statement.
  const byStatement = new Map<string, Map<string, string>>() // stmt -> slug -> label
  for (const r of rows) {
    if (!r.categories?.slug) continue
    let m = byStatement.get(r.statement_id)
    if (!m) { m = new Map(); byStatement.set(r.statement_id, m) }
    m.set(r.categories.slug, r.categories.label_pt)
  }

  // Pair count + label cache. Ordered key (a,b) with a<b to dedupe.
  const pairCount = new Map<string, number>()
  const labels = new Map<string, string>()
  for (const cats of byStatement.values()) {
    const arr = [...cats.entries()].sort((x, y) => x[0].localeCompare(y[0]))
    for (const [slug, label] of arr) labels.set(slug, label)
    for (let i = 0; i < arr.length; i++) {
      for (let j = i + 1; j < arr.length; j++) {
        const key = `${arr[i][0]}\x00${arr[j][0]}`
        pairCount.set(key, (pairCount.get(key) ?? 0) + 1)
      }
    }
  }

  const pairs = [...pairCount.entries()]
    .filter(([, c]) => c >= minCount)
    .sort((a, b) => b[1] - a[1])
    .slice(0, limit)
    .map(([key, count]) => {
      const [a, b] = key.split('\x00')
      return {
        a: { slug: a, label: labels.get(a) ?? a, url: `${SITE_URL}/categorias/${a}` },
        b: { slug: b, label: labels.get(b) ?? b, url: `${SITE_URL}/categorias/${b}` },
        count,
      }
    })

  const etag = `W/"cooc-${byStatement.size}-${pairs.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    source_rows: rows.length,
    statements_scanned: byStatement.size,
    pair_count: pairs.length,
    min_count: minCount,
    pairs,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=7200, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
