import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 7200

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/categorias/por-mes.json — per-category monthly timeseries
 * for the top N categories. For each month (UTC) emits a sparse map
 * of `category_slug -> count`, gap-filled across the window. Primary
 * tags only (`is_primary = true`) to keep signal clean and row-scan
 * bounded.
 *
 *   ?meses=1..24 (default 12)
 *   ?top=1..30  (default 10, max categories returned per month)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'cat-por-mes'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const sp = request.nextUrl.searchParams
  const meses = Math.max(1, Math.min(24, Number(sp.get('meses')) || 12))
  const top = Math.max(1, Math.min(30, Number(sp.get('top')) || 10))

  const now = new Date()
  const start = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (meses - 1), 1))
  const startStr = start.toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statement_categories') as any)
    .select('statements!inner(statement_date, verification_status), categories!inner(slug, label_pt)')
    .eq('is_primary', true)
    .eq('statements.verification_status', 'verified')
    .gte('statements.statement_date', startStr)
    .limit(50000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = {
    statements: { statement_date: string; verification_status: string } | null
    categories: { slug: string; label_pt: string } | null
  }
  const rows = (data ?? []) as Row[]

  const catTotal = new Map<string, number>()
  const catLabel = new Map<string, string>()
  const byMonth = new Map<string, Map<string, number>>() // month -> slug -> count
  for (const r of rows) {
    const slug = r.categories?.slug
    const d = r.statements?.statement_date
    if (!slug || !d) continue
    catLabel.set(slug, r.categories!.label_pt)
    catTotal.set(slug, (catTotal.get(slug) ?? 0) + 1)
    const key = d.slice(0, 7)
    let m = byMonth.get(key)
    if (!m) { m = new Map(); byMonth.set(key, m) }
    m.set(slug, (m.get(slug) ?? 0) + 1)
  }

  const topSlugs = [...catTotal.entries()]
    .sort((a, b) => b[1] - a[1])
    .slice(0, top)
    .map(([slug]) => slug)

  const months: string[] = []
  const cur = new Date(start)
  while (cur.getUTCFullYear() * 12 + cur.getUTCMonth() <= now.getUTCFullYear() * 12 + now.getUTCMonth()) {
    months.push(`${cur.getUTCFullYear()}-${String(cur.getUTCMonth() + 1).padStart(2, '0')}`)
    cur.setUTCMonth(cur.getUTCMonth() + 1)
  }

  const series = months.map((month) => {
    const bucket = byMonth.get(month)
    const counts: Record<string, number> = {}
    for (const slug of topSlugs) counts[slug] = bucket?.get(slug) ?? 0
    return { month, counts }
  })

  const categories = topSlugs.map((slug) => ({
    slug,
    label: catLabel.get(slug) ?? slug,
    total: catTotal.get(slug) ?? 0,
    url: `${SITE_URL}/categorias/${slug}`,
  }))

  const etag = `W/"cat-por-mes-${meses}-${top}-${rows.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    meses,
    top,
    scanned: rows.length,
    categories,
    series,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=7200, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
