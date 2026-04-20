import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildScopeSeverityMatrix } from '@/lib/stats/scope-severity-matrix'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/mapa/categorias.json — dense per-category stats sibling to
 * `mapa/partidos.json`. Primary tag only. Ships status split + severity
 * levels + avg + top-N so frontends paint treemaps/packs single round-trip.
 *   ?meses=3..60 (default 24)
 *   ?limite=5..100 (default 40)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'mapa-cat'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const meses = Math.max(3, Math.min(60, Number(request.nextUrl.searchParams.get('meses')) || 24))
  const limit = Math.max(5, Math.min(100, Number(request.nextUrl.searchParams.get('limite')) || 40))
  const now = new Date()
  const startMs = Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (meses - 1), 1)
  const startStr = new Date(startMs).toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statement_categories') as any)
    .select('category_id, is_primary, statements!inner(severity_score, statement_date, verification_status)')
    .eq('is_primary', true)
    .neq('statements.verification_status', 'removed')
    .gte('statements.statement_date', startStr)
    .limit(60000)
  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Pivot = {
    category_id: string | null
    statements: { severity_score: number | null; verification_status: string } | null
  }
  const rows = (data ?? []) as Pivot[]

  const { rows: matrix } = buildScopeSeverityMatrix(
    rows,
    (r) => r.category_id ?? null,
    (r) => r.statements?.severity_score ?? null,
    limit,
  )

  const statusById = new Map<string, { verified: number; disputed: number; unverified: number }>()
  for (const r of rows) {
    const k = r.category_id
    if (!k) continue
    let s = statusById.get(k)
    if (!s) { s = { verified: 0, disputed: 0, unverified: 0 }; statusById.set(k, s) }
    const vs = r.statements?.verification_status
    if (vs === 'verified') s.verified++
    else if (vs === 'disputed') s.disputed++
    else if (vs === 'unverified') s.unverified++
  }

  const topIds = matrix.map((m) => m.key)
  const { data: cats } = topIds.length
    ? await (supabase.from('categories') as any)
        .select('id, slug, label_pt, color_hex')
        .in('id', topIds)
    : { data: [] }
  type Cat = { id: string; slug: string; label_pt: string | null; color_hex: string | null }
  const byId = new Map<string, Cat>(((cats ?? []) as Cat[]).map((c) => [c.id, c]))

  const features = matrix.map((m) => {
    const c = byId.get(m.key)
    const s = statusById.get(m.key) ?? { verified: 0, disputed: 0, unverified: 0 }
    return {
      category_id: m.key,
      slug: c?.slug ?? null,
      label: c?.label_pt ?? null,
      color: c?.color_hex ?? null,
      total: m.total,
      verified: s.verified,
      disputed: s.disputed,
      unverified: s.unverified,
      levels: m.levels,
      avg_severity: m.avg_severity,
      url: c ? `${SITE_URL}/categorias/${c.slug}` : null,
    }
  })

  const maxTotal = features.reduce((m, f) => Math.max(m, f.total), 0)
  const grandTotal = features.reduce((s, f) => s + f.total, 0)
  const etag = `W/"mapa-cat-${meses}-${limit}-${grandTotal}-${maxTotal}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    meses, count: features.length,
    total: grandTotal, max_total: maxTotal,
    features,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
