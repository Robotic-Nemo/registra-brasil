import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const PARTY_RE = /^[a-z0-9%A-Z.-]{1,100}$/

/**
 * GET /api/partidos/:slug/leaderboard.json — top politicians in a
 * party scored by a severity×recency weighted sum (the same
 * family as /api/ranking.json). Useful for party landing pages
 * that want to surface "who's driving the scorecard".
 *
 *   ?limite=1..50 (default 20)
 */
interface Params { params: Promise<{ slug: string }> }

export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'partido-lb'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!PARTY_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const party = decodeURIComponent(slug)
  if (!party || party.length > 30) {
    return NextResponse.json({ error: 'party inválido' }, { status: 400 })
  }

  const lim = Math.max(1, Math.min(50, Number(request.nextUrl.searchParams.get('limite')) || 20))

  const supabase = getSupabaseServiceClient()
  // Pull statements for the party (bounded) then score in-memory.
  // Keeps the query simple + cheap: we do not need SQL-side window
  // functions, and the party filter tightens the scan enough that
  // 20k is a generous ceiling.
  const { data, error } = await (supabase.from('statements') as any)
    .select('id, statement_date, severity_score, politicians!inner(slug, common_name, party, state, is_active, photo_url)')
    .eq('verification_status', 'verified')
    .eq('politicians.party', party)
    .eq('politicians.is_active', true)
    .limit(20000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = {
    id: string; statement_date: string; severity_score: number | null
    politicians: {
      slug: string; common_name: string; party: string | null
      state: string | null; is_active: boolean; photo_url: string | null
    }
  }
  const rows = (data ?? []) as Row[]

  const now = Date.now()
  type Entry = {
    slug: string; common_name: string; state: string | null; photo_url: string | null
    count: number; score: number; severity_sum: number; severity_n: number
  }
  const byPolitico = new Map<string, Entry>()
  for (const r of rows) {
    const p = r.politicians
    if (!p?.slug) continue
    const ageDays = (now - Date.parse(r.statement_date)) / 86_400_000
    if (!Number.isFinite(ageDays) || ageDays < 0) continue
    const severity = r.severity_score ?? 0
    const decay = Math.exp(-ageDays / 365)
    const contrib = severity * decay
    const e = byPolitico.get(p.slug) ?? {
      slug: p.slug, common_name: p.common_name, state: p.state, photo_url: p.photo_url,
      count: 0, score: 0, severity_sum: 0, severity_n: 0,
    }
    e.count++
    e.score += contrib
    if (r.severity_score !== null) {
      e.severity_sum += r.severity_score
      e.severity_n++
    }
    byPolitico.set(p.slug, e)
  }

  const results = Array.from(byPolitico.values())
    .map((e) => ({
      slug: e.slug,
      common_name: e.common_name,
      state: e.state,
      photo_url: e.photo_url,
      statement_count: e.count,
      avg_severity: e.severity_n > 0 ? Number((e.severity_sum / e.severity_n).toFixed(2)) : null,
      score: Number(e.score.toFixed(3)),
      url: `${SITE_URL}/politico/${e.slug}`,
    }))
    .sort((a, b) => b.score - a.score)
    .slice(0, lim)

  const etag = `W/"partido-lb-${party}-${rows.length}-${results.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    party,
    scope_total: rows.length,
    count: results.length,
    results,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
      ETag: etag,
    },
  })
}
