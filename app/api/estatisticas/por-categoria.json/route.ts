import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { monthlyStartStr } from '@/lib/stats/monthly-buckets'
import { buildGroupMatrix } from '@/lib/stats/group-matrix'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/estatisticas/por-categoria.json — month × category matrix
 * for the top N categories by primary-tag volume. Uses the
 * `statement_categories` pivot joined to `statements`.
 *   ?meses=3..24 (default 12)
 *   ?limite=1..30 (default 10)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estat-por-categoria'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const meses = Math.max(3, Math.min(24, Number(request.nextUrl.searchParams.get('meses')) || 12))
  const limit = Math.max(1, Math.min(30, Number(request.nextUrl.searchParams.get('limite')) || 10))

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statement_categories') as any)
    .select('is_primary, categories!inner(slug, label_pt, color_hex), statements!inner(statement_date, verification_status)')
    .eq('is_primary', true)
    .neq('statements.verification_status', 'removed')
    .gte('statements.statement_date', monthlyStartStr(meses))
    .limit(60000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = {
    categories: { slug: string; label_pt: string; color_hex: string | null } | null
    statements: { statement_date: string } | null
  }
  const rows = (data ?? []) as Row[]

  // Resolve category meta while iterating.
  const meta = new Map<string, { slug: string; label: string; color: string | null }>()
  for (const r of rows) {
    const c = r.categories
    if (c && !meta.has(c.slug)) {
      meta.set(c.slug, { slug: c.slug, label: c.label_pt, color: c.color_hex })
    }
  }

  const { months, uniqueKeys, matrix } = buildGroupMatrix(rows, meses, {
    keyFn: (r) => r.categories?.slug ?? null,
    dateFn: (r) => r.statements?.statement_date ?? null,
    limit,
  })

  const categorias = matrix.map((m) => {
    const md = meta.get(m.key)
    return {
      slug: m.key,
      label: md?.label ?? m.key,
      color: md?.color ?? null,
      url: `${SITE_URL}/categorias/${m.key}`,
      total: m.total,
      series: m.series,
    }
  })

  const etag = `W/"estat-por-categoria-${meses}-${limit}-${rows.length}-${uniqueKeys}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    meses, limite: limit, months,
    unique_categories: uniqueKeys,
    categorias,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
