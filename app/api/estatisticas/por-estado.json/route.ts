import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { monthlyStartStr } from '@/lib/stats/monthly-buckets'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/estatisticas/por-estado.json — month × UF matrix for the
 * top N states by total activity in the window. Mirror of
 * `/por-partido.json`.
 *   ?meses=3..24 (default 12)
 *   ?limite=1..27 (default 10)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estat-por-estado'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const meses = Math.max(3, Math.min(24, Number(request.nextUrl.searchParams.get('meses')) || 12))
  const limit = Math.max(1, Math.min(27, Number(request.nextUrl.searchParams.get('limite')) || 10))

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, politicians!inner(state)')
    .neq('verification_status', 'removed')
    .gte('statement_date', monthlyStartStr(meses))
    .limit(50000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; politicians: { state: string | null } | null }
  const rows = (data ?? []) as Row[]

  const byUf = new Map<string, Map<string, number>>()
  const ufTotal = new Map<string, number>()
  for (const r of rows) {
    const uf = r.politicians?.state
    if (!uf) continue
    const m = r.statement_date?.slice(0, 7)
    if (!m) continue
    let mm = byUf.get(uf)
    if (!mm) { mm = new Map(); byUf.set(uf, mm) }
    mm.set(m, (mm.get(m) ?? 0) + 1)
    ufTotal.set(uf, (ufTotal.get(uf) ?? 0) + 1)
  }

  const topUfs = [...ufTotal.entries()]
    .sort((a, b) => b[1] - a[1])
    .slice(0, limit)
    .map(([uf]) => uf)

  const now = new Date()
  const startY = now.getUTCFullYear()
  const startM = now.getUTCMonth() - (meses - 1)
  const monthKeys: string[] = []
  for (let i = 0; i < meses; i++) {
    const d = new Date(Date.UTC(startY, startM + i, 1))
    monthKeys.push(`${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`)
  }

  const estados = topUfs.map((uf) => {
    const mm = byUf.get(uf) ?? new Map<string, number>()
    const series = monthKeys.map((month) => ({ month, count: mm.get(month) ?? 0 }))
    return { uf, url: `${SITE_URL}/estados/${uf}`, total: ufTotal.get(uf) ?? 0, series }
  })

  const etag = `W/"estat-por-estado-${meses}-${limit}-${rows.length}-${byUf.size}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    meses, limite: limit, months: monthKeys,
    unique_ufs: byUf.size,
    estados,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
