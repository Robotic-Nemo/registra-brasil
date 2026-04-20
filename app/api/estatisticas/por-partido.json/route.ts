import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { monthlyStartStr } from '@/lib/stats/monthly-buckets'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/estatisticas/por-partido.json — month × party matrix for
 * the top N parties by total activity in the window. Each party
 * entry emits a gap-filled monthly series. Lets a dashboard draw a
 * small-multiples chart from a single request.
 *   ?meses=3..24 (default 12)
 *   ?limite=1..30 (default 10) — N top parties
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estat-por-partido'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const meses = Math.max(3, Math.min(24, Number(request.nextUrl.searchParams.get('meses')) || 12))
  const limit = Math.max(1, Math.min(30, Number(request.nextUrl.searchParams.get('limite')) || 10))

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, politicians!inner(party)')
    .neq('verification_status', 'removed')
    .gte('statement_date', monthlyStartStr(meses))
    .limit(50000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; politicians: { party: string | null } | null }
  const rows = (data ?? []) as Row[]

  // Group: { party -> { month -> count } }
  const byParty = new Map<string, Map<string, number>>()
  const partyTotal = new Map<string, number>()
  for (const r of rows) {
    const p = r.politicians?.party
    if (!p) continue
    const m = r.statement_date?.slice(0, 7)
    if (!m) continue
    let mm = byParty.get(p)
    if (!mm) { mm = new Map(); byParty.set(p, mm) }
    mm.set(m, (mm.get(m) ?? 0) + 1)
    partyTotal.set(p, (partyTotal.get(p) ?? 0) + 1)
  }

  const topParties = [...partyTotal.entries()]
    .sort((a, b) => b[1] - a[1])
    .slice(0, limit)
    .map(([p]) => p)

  const now = new Date()
  const startY = now.getUTCFullYear()
  const startM = now.getUTCMonth() - (meses - 1)
  const monthKeys: string[] = []
  for (let i = 0; i < meses; i++) {
    const d = new Date(Date.UTC(startY, startM + i, 1))
    monthKeys.push(`${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`)
  }

  const partidos = topParties.map((party) => {
    const mm = byParty.get(party) ?? new Map<string, number>()
    const series = monthKeys.map((month) => ({ month, count: mm.get(month) ?? 0 }))
    return {
      party,
      url: `${SITE_URL}/partidos/${encodeURIComponent(party)}`,
      total: partyTotal.get(party) ?? 0,
      series,
    }
  })

  const etag = `W/"estat-por-partido-${meses}-${limit}-${rows.length}-${byParty.size}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    meses, limite: limit, months: monthKeys,
    unique_parties: byParty.size,
    partidos,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
