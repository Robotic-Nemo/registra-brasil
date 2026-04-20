import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/categorias/:slug/por-mes.json — monthly statement
 * timeseries for one category, bucketed by `statement_date` (UTC).
 * Primary tags only (is_primary=true) to keep signal clean. Split
 * by verification status, gap-filled.
 *   ?meses=3..36 (default 24)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'cat-por-mes-one'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const meses = Math.max(3, Math.min(36, Number(request.nextUrl.searchParams.get('meses')) || 24))

  const now = new Date()
  const start = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (meses - 1), 1))
  const startStr = start.toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()
  const { data: cat } = await (supabase.from('categories') as any)
    .select('id, slug, label_pt, color_hex')
    .eq('slug', slug)
    .maybeSingle()
  if (!cat) {
    return NextResponse.json({ error: 'categoria não encontrada' }, { status: 404 })
  }

  const { data, error } = await (supabase.from('statement_categories') as any)
    .select('is_primary, statements!inner(statement_date, verification_status)')
    .eq('category_id', cat.id)
    .eq('is_primary', true)
    .neq('statements.verification_status', 'removed')
    .gte('statements.statement_date', startStr)
    .limit(30000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statements: { statement_date: string; verification_status: string } | null }
  const rows = (data ?? []) as Row[]

  const buckets = new Map<string, { verified: number; disputed: number; unverified: number; total: number }>()
  for (const r of rows) {
    if (!r.statements) continue
    const k = r.statements.statement_date.slice(0, 7)
    let b = buckets.get(k)
    if (!b) { b = { verified: 0, disputed: 0, unverified: 0, total: 0 }; buckets.set(k, b) }
    b.total++
    if (r.statements.verification_status === 'verified') b.verified++
    else if (r.statements.verification_status === 'disputed') b.disputed++
    else if (r.statements.verification_status === 'unverified') b.unverified++
  }

  const series: Array<{ month: string; total: number; verified: number; disputed: number; unverified: number }> = []
  const cur = new Date(start)
  while (cur.getUTCFullYear() * 12 + cur.getUTCMonth() <= now.getUTCFullYear() * 12 + now.getUTCMonth()) {
    const key = `${cur.getUTCFullYear()}-${String(cur.getUTCMonth() + 1).padStart(2, '0')}`
    const b = buckets.get(key) ?? { verified: 0, disputed: 0, unverified: 0, total: 0 }
    series.push({ month: key, ...b })
    cur.setUTCMonth(cur.getUTCMonth() + 1)
  }

  const total = series.reduce((s, x) => s + x.total, 0)
  const etag = `W/"cat-por-mes-one-${cat.id}-${meses}-${total}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    category: {
      slug: cat.slug, label: cat.label_pt, color: cat.color_hex,
      url: `${SITE_URL}/categorias/${cat.slug}`,
    },
    meses,
    total,
    series,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
