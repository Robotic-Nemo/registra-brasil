import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { ageDaysFromStatementDate, decayScore } from '@/lib/utils/age-decay'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/top-categorias.json — category leaderboard by weighted
 * severity score (same `severity × exp(-ageDays/365)` formula as the
 * partido/UF/ranking leaderboards). Primary tags only so the signal
 * is not diluted by secondary labels. Completes the leaderboard
 * family: {ranking, top-partidos, top-estados, top-categorias}.
 *   ?limite=1..60 (default 30)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'top-categorias'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const limit = Math.max(1, Math.min(60, Number(request.nextUrl.searchParams.get('limite')) || 30))

  const supabase = getSupabaseServiceClient()

  // Pull primary-tag pivot rows with enough statement data to score.
  // Head-count on pivot would lose age/severity weights, so we fetch
  // the rows once and aggregate in-process.
  const { data, error } = await (supabase.from('statement_categories') as any)
    .select('category_id, is_primary, statements!inner(statement_date, severity_score, verification_status)')
    .eq('is_primary', true)
    .in('statements.verification_status', ['verified', 'disputed'])
    .order('statement_id', { ascending: false })
    .limit(20000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Pivot = {
    category_id: string
    statements: { statement_date: string; severity_score: number | null } | null
  }

  const agg = new Map<string, { count: number; score: number; severitySum: number; severityN: number }>()
  const nowMs = Date.now()
  for (const r of ((data ?? []) as Pivot[])) {
    const s = r.statements
    if (!s || !r.category_id) continue
    const sev = s.severity_score ?? 1
    const ageDays = ageDaysFromStatementDate(nowMs, s.statement_date)
    const score = decayScore(sev, ageDays)
    const e = agg.get(r.category_id) ?? { count: 0, score: 0, severitySum: 0, severityN: 0 }
    e.count++
    e.score += score
    if (s.severity_score != null) { e.severitySum += sev; e.severityN++ }
    agg.set(r.category_id, e)
  }

  // Resolve category metadata in one shot.
  const topIds = [...agg.entries()]
    .sort((a, b) => b[1].score - a[1].score)
    .slice(0, limit)
    .map(([id]) => id)

  if (topIds.length === 0) {
    return NextResponse.json({ method: 'severity × exp(-age_days / 365)', count: 0, ranking: [], generated_at: new Date().toISOString() })
  }

  const { data: cats } = await (supabase.from('categories') as any)
    .select('id, slug, label_pt, color_hex')
    .in('id', topIds)

  type Cat = { id: string; slug: string; label_pt: string | null; color_hex: string | null }
  const byId = new Map<string, Cat>(((cats ?? []) as Cat[]).map((c) => [c.id, c]))

  const ranked = topIds
    .map((id, i) => {
      const e = agg.get(id)!
      const c = byId.get(id)
      if (!c) return null
      return {
        rank: i + 1,
        slug: c.slug,
        label: c.label_pt,
        color: c.color_hex,
        statement_count: e.count,
        weighted_score: +e.score.toFixed(2),
        avg_severity: e.severityN > 0 ? +(e.severitySum / e.severityN).toFixed(2) : null,
        url: `${SITE_URL}/categorias/${c.slug}`,
      }
    })
    .filter((x): x is NonNullable<typeof x> => x != null)

  const etag = `W/"top-cat-${ranked.length}-${ranked[0]?.weighted_score ?? 0}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    method: 'severity × exp(-age_days / 365) (primary tags)',
    count: ranked.length,
    ranking: ranked,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
