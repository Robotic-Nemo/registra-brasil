import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { csvEscape } from '@/lib/export/statement-formats'
import { ageDaysFromStatementDate, decayScore } from '@/lib/utils/age-decay'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/ranking.csv — CSV sibling to /api/ranking.json. Same
 * weighted score (severity × exp(-ageDays/365)) over the last
 * 5000 verified+disputed statements.
 *   ?limite=1..200 (default 100)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'ranking-csv'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const lim = Math.max(1, Math.min(200, Number(request.nextUrl.searchParams.get('limite')) || 100))

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, severity_score, politician_id, politicians!inner(slug, common_name, party, state)')
    .in('verification_status', ['verified', 'disputed'])
    .order('statement_date', { ascending: false })
    .limit(5000)
  if (error) return new Response(`error: ${error.message}`, { status: 500 })

  type Row = {
    statement_date: string; severity_score: number | null; politician_id: string
    politicians: { slug: string; common_name: string; party: string | null; state: string | null }
  }

  interface Agg { pol: Row['politicians']; count: number; score: number }
  const agg = new Map<string, Agg>()
  const now = Date.now()
  for (const r of ((data ?? []) as Row[])) {
    const severity = r.severity_score ?? 1
    const ageDays = ageDaysFromStatementDate(now, r.statement_date)
    const contribution = decayScore(severity, ageDays)
    const e = agg.get(r.politician_id)
    if (e) { e.count++; e.score += contribution }
    else { agg.set(r.politician_id, { pol: r.politicians, count: 1, score: contribution }) }
  }

  const ranked = [...agg.values()]
    .sort((a, b) => b.score - a.score)
    .slice(0, lim)

  const header = ['rank', 'slug', 'common_name', 'party', 'state', 'statement_count', 'weighted_score', 'url']
  const lines = [header.join(',')]
  ranked.forEach((e, i) => {
    lines.push([
      csvEscape(i + 1),
      csvEscape(e.pol.slug),
      csvEscape(e.pol.common_name),
      csvEscape(e.pol.party ?? ''),
      csvEscape(e.pol.state ?? ''),
      csvEscape(e.count),
      csvEscape(e.score.toFixed(2)),
      csvEscape(`${SITE_URL}/politico/${e.pol.slug}`),
    ].join(','))
  })

  return new Response(lines.join('\n') + '\n', {
    headers: {
      'Content-Type': 'text/csv; charset=utf-8',
      'Content-Disposition': 'attachment; filename="ranking.csv"',
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
    },
  })
}
