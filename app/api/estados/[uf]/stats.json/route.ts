import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const UF_RE = /^[A-Za-z]{2}$/

/**
 * GET /api/estados/:uf/stats.json — per-UF stats: politician count,
 * total / verified statements, severity histogram, top politicians,
 * party breakdown.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ uf: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'uf-stats'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { uf: raw } = await params
  if (!UF_RE.test(raw)) {
    return NextResponse.json({ error: 'UF inválida' }, { status: 400 })
  }
  const uf = raw.toUpperCase()

  const supabase = getSupabaseServiceClient()
  const [polRes, stmtRes] = await Promise.all([
    (supabase.from('politicians') as any)
      .select('id, slug, common_name, party, photo_url, is_active')
      .eq('state', uf)
      .limit(500),
    (supabase.from('statements') as any)
      .select('id, statement_date, verification_status, severity_score, politician_id, politicians!inner(state)')
      .eq('politicians.state', uf)
      .neq('verification_status', 'removed')
      .limit(15000),
  ])

  type Pol = { id: string; slug: string; common_name: string; party: string | null; photo_url: string | null; is_active: boolean }
  type Stmt = { id: string; statement_date: string; verification_status: string; severity_score: number | null; politician_id: string }

  const politicians = (polRes.data ?? []) as Pol[]
  const statements = (stmtRes.data ?? []) as Stmt[]

  if (politicians.length === 0) {
    return NextResponse.json({ error: 'UF sem políticos registrados' }, { status: 404 })
  }

  const totalStmts = statements.length
  const verified = statements.filter((s) => s.verification_status === 'verified').length

  const severity: Record<number, number> = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0 }
  for (const s of statements) {
    const sv = (s.severity_score ?? 1) as 1 | 2 | 3 | 4 | 5
    if (sv >= 1 && sv <= 5) severity[sv]++
  }

  const polMap = new Map<string, { p: Pol; count: number }>()
  for (const p of politicians) polMap.set(p.id, { p, count: 0 })
  for (const s of statements) {
    const e = polMap.get(s.politician_id)
    if (e) e.count++
  }
  const topPoliticians = [...polMap.values()]
    .sort((a, b) => b.count - a.count)
    .slice(0, 10)
    .map((e) => ({
      slug: e.p.slug,
      common_name: e.p.common_name,
      party: e.p.party,
      count: e.count,
    }))

  const partyMap = new Map<string, number>()
  for (const p of politicians) {
    if (!p.party) continue
    partyMap.set(p.party, (partyMap.get(p.party) ?? 0) + 1)
  }
  const partyBreakdown = [...partyMap.entries()]
    .sort((a, b) => b[1] - a[1])
    .map(([party, count]) => ({ party, politician_count: count }))

  return NextResponse.json({
    uf,
    url: `${SITE_URL}/estados/${uf.toLowerCase()}`,
    stats: {
      politician_count: politicians.length,
      active_politician_count: politicians.filter((p) => p.is_active).length,
      total_statements: totalStmts,
      verified_count: verified,
      verified_ratio: totalStmts === 0 ? 0 : +(verified / totalStmts).toFixed(3),
      severity_histogram: severity,
      top_politicians: topPoliticians,
      party_breakdown: partyBreakdown,
    },
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
    },
  })
}
