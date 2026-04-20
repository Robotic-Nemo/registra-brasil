import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildWeeklyStatusSeries } from '@/lib/stats/weekly-buckets'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9%A-Z.-]{1,100}$/

/**
 * GET /api/partidos/:slug/por-semana.json — weekly (ISO, UTC-Monday)
 * statement bucket counts for one party. Split by verification
 * status, gap-filled.
 *   ?semanas=4..104 (default 26)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'partido-por-semana'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const party = decodeURIComponent(slug).toUpperCase()
  const semanas = Math.max(4, Math.min(104, Number(request.nextUrl.searchParams.get('semanas')) || 26))

  const supabase = getSupabaseServiceClient()
  // Quick window estimate: weeks × 7 days back, formatted as date.
  const today = new Date()
  const startMs = Date.UTC(today.getUTCFullYear(), today.getUTCMonth(), today.getUTCDate()) - semanas * 7 * 86400_000
  const startStr = new Date(startMs).toISOString().slice(0, 10)

  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, verification_status, politicians!inner(party)')
    .eq('politicians.party', party)
    .neq('verification_status', 'removed')
    .gte('statement_date', startStr)
    .limit(30000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; verification_status: string }
  const rows = (data ?? []) as Row[]
  const { series, total } = buildWeeklyStatusSeries(semanas, rows)

  const etag = `W/"partido-por-semana-${party}-${semanas}-${total}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    party,
    url: `${SITE_URL}/partidos/${encodeURIComponent(party)}`,
    semanas,
    total,
    series,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
