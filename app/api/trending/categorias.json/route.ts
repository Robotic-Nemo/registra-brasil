import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildTrending, resolveTrendingWindow } from '@/lib/stats/trending-window'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/trending/categorias.json — momentum ranking por categoria
 * primária. Uses `statement_categories!inner(statements)` pivot with
 * `is_primary=true` + joined statement_date/severity_score.
 *   ?janela=7..60 (default 30)
 *   ?limite=5..50 (default 20)
 *   ?min_recent=1..20 (default 3)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'trend-cat'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const janela = Math.max(7, Math.min(60, Number(request.nextUrl.searchParams.get('janela')) || 30))
  const limit = Math.max(5, Math.min(50, Number(request.nextUrl.searchParams.get('limite')) || 20))
  const minRecent = Math.max(1, Math.min(20, Number(request.nextUrl.searchParams.get('min_recent')) || 3))
  const { startStr, midStr } = resolveTrendingWindow(janela)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statement_categories') as any)
    .select('category_id, is_primary, statements!inner(statement_date, severity_score, verification_status)')
    .eq('is_primary', true)
    .neq('statements.verification_status', 'removed')
    .gte('statements.statement_date', startStr)
    .limit(60000)
  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Pivot = {
    category_id: string | null
    statements: { statement_date: string | null; severity_score: number | null } | null
  }
  const pivots = (data ?? []) as Pivot[]
  // Flatten to TrendingRow shape (statement_date + severity_score at top level)
  const flat = pivots.map((p) => ({
    category_id: p.category_id,
    statement_date: p.statements?.statement_date ?? null,
    severity_score: p.statements?.severity_score ?? null,
  }))

  const ranked = buildTrending(flat, (r) => r.category_id, midStr, limit, minRecent)
  const ids = ranked.map((r) => r.key)

  const { data: cats } = ids.length
    ? await (supabase.from('categories') as any)
        .select('id, slug, label_pt, color_hex')
        .in('id', ids)
    : { data: [] }
  type Cat = { id: string; slug: string; label_pt: string | null; color_hex: string | null }
  const byId = new Map<string, Cat>(((cats ?? []) as Cat[]).map((c) => [c.id, c]))

  const results = ranked
    .map((r) => {
      const c = byId.get(r.key)
      if (!c) return null
      return {
        category_id: r.key,
        slug: c.slug,
        label: c.label_pt,
        color: c.color_hex,
        recent: r.recent,
        prior: r.prior,
        delta: r.delta,
        delta_pct: r.delta_pct,
        avg_severity_recent: r.avg_severity_recent,
        url: `${SITE_URL}/categorias/${c.slug}`,
      }
    })
    .filter(Boolean)

  const etag = `W/"trend-cat-${janela}-${limit}-${minRecent}-${pivots.length}-${results.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    janela, min_recent: minRecent, count: results.length, results,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
