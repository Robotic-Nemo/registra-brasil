import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { monthlyStartStr } from '@/lib/stats/monthly-buckets'

export const runtime = 'nodejs'
export const revalidate = 3600

/**
 * GET /api/estatisticas/severidade-por-mes.json — month × severity
 * matrix for the last N months (UTC). Each bucket emits counts per
 * severity level 1..5 + total. Gap-filled.
 *   ?meses=3..36 (default 12)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estat-sev-por-mes'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const meses = Math.max(3, Math.min(36, Number(request.nextUrl.searchParams.get('meses')) || 12))

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, severity_score')
    .neq('verification_status', 'removed')
    .gte('statement_date', monthlyStartStr(meses))
    .limit(50000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; severity_score: number | null }
  const rows = (data ?? []) as Row[]

  const tally = new Map<string, { 1: number; 2: number; 3: number; 4: number; 5: number; total: number }>()
  for (const r of rows) {
    const k = r.statement_date?.slice(0, 7)
    if (!k) continue
    let b = tally.get(k)
    if (!b) { b = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, total: 0 }; tally.set(k, b) }
    b.total++
    const sv = r.severity_score
    if (sv === 1 || sv === 2 || sv === 3 || sv === 4 || sv === 5) b[sv]++
  }

  const now = new Date()
  const startY = now.getUTCFullYear()
  const startM = now.getUTCMonth() - (meses - 1)
  const series: Array<{ month: string; total: number; levels: Record<1|2|3|4|5, number> }> = []
  for (let i = 0; i < meses; i++) {
    const d = new Date(Date.UTC(startY, startM + i, 1))
    const key = `${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`
    const b = tally.get(key) ?? { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, total: 0 }
    series.push({ month: key, total: b.total, levels: { 1: b[1], 2: b[2], 3: b[3], 4: b[4], 5: b[5] } })
  }

  const total = series.reduce((s, x) => s + x.total, 0)
  const etag = `W/"estat-sev-mes-${meses}-${total}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    meses, total, series,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
