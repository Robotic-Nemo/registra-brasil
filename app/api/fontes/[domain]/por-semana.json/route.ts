import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildWeeklyStatusSeries } from '@/lib/stats/weekly-buckets'
import { displaySourceName } from '@/lib/sources/domain'
import { sourceUrlOrFilter, DOMAIN_RE_STRICT } from '@/lib/sources/domain-filter'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const DOMAIN_RE = /^[a-z0-9%.-]{3,253}$/i

/**
 * GET /api/fontes/:domain/por-semana.json — weekly (ISO, UTC) bucket
 * counts for statements citing this domain, status-split & gap-filled.
 *   ?semanas=4..104 (default 26)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ domain: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'fontes-por-semana'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { domain: raw } = await params
  if (!DOMAIN_RE.test(raw)) {
    return NextResponse.json({ error: 'domínio inválido' }, { status: 400 })
  }
  const domain = decodeURIComponent(raw).toLowerCase().replace(/^www\./, '')
  if (!DOMAIN_RE_STRICT.test(domain)) {
    return NextResponse.json({ error: 'domínio inválido' }, { status: 400 })
  }
  const semanas = Math.max(4, Math.min(104, Number(request.nextUrl.searchParams.get('semanas')) || 26))

  const now = new Date()
  const todayUtc = Date.UTC(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate())
  const dow = new Date(todayUtc).getUTCDay()
  const thisMonday = todayUtc - ((dow + 6) % 7) * 86400_000
  const startMs = thisMonday - (semanas - 1) * 7 * 86400_000
  const startStr = new Date(startMs).toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, verification_status')
    .neq('verification_status', 'removed')
    .gte('statement_date', startStr)
    .or(sourceUrlOrFilter(domain))
    .limit(10000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; verification_status: string }
  const { series, total } = buildWeeklyStatusSeries(semanas, (data ?? []) as Row[])

  const etag = `W/"fontes-por-semana-${domain}-${semanas}-${total}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    domain,
    display_name: displaySourceName(domain),
    url: `${SITE_URL}/fontes/${encodeURIComponent(domain)}`,
    semanas, total, series,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
