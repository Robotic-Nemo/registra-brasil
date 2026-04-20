import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { monthlyStartStr } from '@/lib/stats/monthly-buckets'
import { buildGroupMatrix } from '@/lib/stats/group-matrix'
import { extractDomain, displaySourceName, classifySource, CATEGORY_LABEL } from '@/lib/sources/domain'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/estatisticas/por-fonte.json — month × source-domain matrix
 * for the top N domains by volume in the window. Uses `extractDomain`
 * to normalize `primary_source_url`.
 *   ?meses=3..24 (default 12)
 *   ?limite=1..50 (default 15)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estat-por-fonte'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const meses = Math.max(3, Math.min(24, Number(request.nextUrl.searchParams.get('meses')) || 12))
  const limit = Math.max(1, Math.min(50, Number(request.nextUrl.searchParams.get('limite')) || 15))

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, primary_source_url')
    .neq('verification_status', 'removed')
    .gte('statement_date', monthlyStartStr(meses))
    .limit(50000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; primary_source_url: string | null }
  const rows = (data ?? []) as Row[]

  const { months, uniqueKeys, matrix } = buildGroupMatrix(rows, meses, {
    keyFn: (r) => extractDomain(r.primary_source_url),
    dateFn: (r) => r.statement_date,
    limit,
  })

  const fontes = matrix.map((m) => {
    const klass = classifySource(m.key)
    return {
      domain: m.key,
      display_name: displaySourceName(m.key),
      classification: klass,
      classification_label: CATEGORY_LABEL[klass],
      url: `${SITE_URL}/fontes/${encodeURIComponent(m.key)}`,
      total: m.total,
      series: m.series,
    }
  })

  const etag = `W/"estat-por-fonte-${meses}-${limit}-${rows.length}-${uniqueKeys}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    meses, limite: limit, months,
    unique_domains: uniqueKeys,
    fontes,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
