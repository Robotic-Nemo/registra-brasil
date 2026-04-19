import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/partidos/:slug/stats.json — aggregate stats for one party:
 * politician count, total statements, severity histogram, top-10
 * politicians, state breakdown.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'party-stats'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  const party = decodeURIComponent(slug)
  if (party.length < 1 || party.length > 50) {
    return NextResponse.json({ error: 'partido inválido' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()

  const [polRes, stmtRes] = await Promise.all([
    (supabase.from('politicians') as any)
      .select('id, slug, common_name, state, photo_url, is_active')
      .eq('party', party)
      .limit(500),
    (supabase.from('statements') as any)
      .select('id, statement_date, verification_status, severity_score, politician_id, politicians!inner(party)')
      .eq('politicians.party', party)
      .neq('verification_status', 'removed')
      .limit(15000),
  ])

  type Pol = { id: string; slug: string; common_name: string; state: string | null; photo_url: string | null; is_active: boolean }
  type Stmt = { id: string; statement_date: string; verification_status: string; severity_score: number | null; politician_id: string }

  const politicians = (polRes.data ?? []) as Pol[]
  const statements = (stmtRes.data ?? []) as Stmt[]

  if (politicians.length === 0) {
    return NextResponse.json({ error: 'Partido não encontrado' }, { status: 404 })
  }

  const totalStmts = statements.length
  const verified = statements.filter((s) => s.verification_status === 'verified').length
  const severity: Record<number, number> = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0 }
  for (const s of statements) {
    const sv = (s.severity_score ?? 1) as 1 | 2 | 3 | 4 | 5
    if (sv >= 1 && sv <= 5) severity[sv]++
  }

  // Per-politician counts
  const polMap = new Map<string, { politician: Pol; count: number }>()
  for (const p of politicians) polMap.set(p.id, { politician: p, count: 0 })
  for (const s of statements) {
    const e = polMap.get(s.politician_id)
    if (e) e.count++
  }
  const topPoliticians = [...polMap.values()]
    .sort((a, b) => b.count - a.count)
    .slice(0, 10)
    .map((e) => ({
      slug: e.politician.slug,
      common_name: e.politician.common_name,
      state: e.politician.state,
      count: e.count,
    }))

  // State breakdown
  const stateMap = new Map<string, number>()
  for (const p of politicians) {
    if (!p.state) continue
    stateMap.set(p.state, (stateMap.get(p.state) ?? 0) + 1)
  }
  const stateBreakdown = [...stateMap.entries()]
    .sort((a, b) => b[1] - a[1])
    .map(([state, count]) => ({ state, politician_count: count }))

  return NextResponse.json({
    party,
    url: `${SITE_URL}/partidos/${encodeURIComponent(party)}`,
    stats: {
      politician_count: politicians.length,
      active_politician_count: politicians.filter((p) => p.is_active).length,
      total_statements: totalStmts,
      verified_count: verified,
      verified_ratio: totalStmts === 0 ? 0 : +(verified / totalStmts).toFixed(3),
      severity_histogram: severity,
      top_politicians: topPoliticians,
      state_breakdown: stateBreakdown,
    },
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
    },
  })
}
