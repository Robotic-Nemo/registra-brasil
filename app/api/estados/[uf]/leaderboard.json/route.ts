import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const UF_RE = /^[A-Za-z]{2}$/

/**
 * GET /api/estados/:uf/leaderboard.json — top politicians in the UF
 * scored by severity × exp(-ageDays/365). Sibling of
 * /api/partidos/:slug/leaderboard.json.
 *
 *   ?limite=1..50 (default 20)
 */
interface Params { params: Promise<{ uf: string }> }

export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estado-lb'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { uf: raw } = await params
  if (!UF_RE.test(raw)) {
    return NextResponse.json({ error: 'uf inválida' }, { status: 400 })
  }
  const uf = raw.toUpperCase()
  const lim = Math.max(1, Math.min(50, Number(request.nextUrl.searchParams.get('limite')) || 20))

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('id, statement_date, severity_score, politicians!inner(slug, common_name, party, state, is_active, photo_url)')
    .eq('verification_status', 'verified')
    .eq('politicians.state', uf)
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
    slug: string; common_name: string; party: string | null; photo_url: string | null
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
    const e = byPolitico.get(p.slug) ?? {
      slug: p.slug, common_name: p.common_name, party: p.party, photo_url: p.photo_url,
      count: 0, score: 0, severity_sum: 0, severity_n: 0,
    }
    e.count++
    e.score += severity * decay
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
      party: e.party,
      photo_url: e.photo_url,
      statement_count: e.count,
      avg_severity: e.severity_n > 0 ? Number((e.severity_sum / e.severity_n).toFixed(2)) : null,
      score: Number(e.score.toFixed(3)),
      url: `${SITE_URL}/politico/${e.slug}`,
    }))
    .sort((a, b) => b.score - a.score)
    .slice(0, lim)

  const etag = `W/"estado-lb-${uf}-${rows.length}-${results.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    state: uf,
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
