import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { monthlyStartStr } from '@/lib/stats/monthly-buckets'
import { buildGroupMatrix } from '@/lib/stats/group-matrix'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/estatisticas/por-estado.json — month × UF matrix for the
 * top N states by total activity in the window.
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

  const { months, uniqueKeys, matrix } = buildGroupMatrix(rows, meses, {
    keyFn: (r) => r.politicians?.state ?? null,
    dateFn: (r) => r.statement_date,
    limit,
  })

  const estados = matrix.map((m) => ({
    uf: m.key,
    url: `${SITE_URL}/estados/${m.key}`,
    total: m.total,
    series: m.series,
  }))

  const etag = `W/"estat-por-estado-${meses}-${limit}-${rows.length}-${uniqueKeys}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    meses, limite: limit, months,
    unique_ufs: uniqueKeys,
    estados,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
