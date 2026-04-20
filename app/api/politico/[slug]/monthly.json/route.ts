import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/politico/:slug/monthly.json — dense monthly timeseries
 * for a politician. For each month in the window: total count,
 * verified count, disputed count, avg severity, cumulative total.
 * Richer than sparkline.json — suitable for dashboards and CSVs.
 *   ?meses=3..60 (default 24)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'pol-monthly'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const months = Math.max(3, Math.min(60, Number(request.nextUrl.searchParams.get('meses')) || 24))

  const supabase = getSupabaseServiceClient()
  const { data: pol } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name, party, state')
    .eq('slug', slug)
    .maybeSingle()
  if (!pol) {
    return NextResponse.json({ error: 'Político não encontrado' }, { status: 404 })
  }

  const now = new Date()
  const start = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (months - 1), 1))
  const startIso = start.toISOString().slice(0, 10)

  const { data: rows } = await (supabase.from('statements') as any)
    .select('statement_date, verification_status, severity_score')
    .eq('politician_id', pol.id)
    .neq('verification_status', 'removed')
    .gte('statement_date', startIso)
    .limit(20000)

  type Row = { statement_date: string; verification_status: string; severity_score: number | null }
  const stmts = (rows ?? []) as Row[]

  // Build dense monthly buckets.
  type Bucket = {
    ym: string
    total: number
    verified: number
    disputed: number
    unverified: number
    severity_sum: number
    severity_n: number
  }
  const buckets: Bucket[] = []
  for (let i = 0; i < months; i++) {
    const d = new Date(Date.UTC(start.getUTCFullYear(), start.getUTCMonth() + i, 1))
    buckets.push({
      ym: `${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`,
      total: 0, verified: 0, disputed: 0, unverified: 0,
      severity_sum: 0, severity_n: 0,
    })
  }
  const byYm = new Map(buckets.map((b) => [b.ym, b]))
  for (const r of stmts) {
    const b = byYm.get(r.statement_date.slice(0, 7))
    if (!b) continue
    b.total++
    if (r.verification_status === 'verified') b.verified++
    else if (r.verification_status === 'disputed') b.disputed++
    else b.unverified++
    if (r.severity_score != null) {
      b.severity_sum += r.severity_score
      b.severity_n++
    }
  }

  let cumulative = 0
  const series = buckets.map((b) => {
    cumulative += b.total
    return {
      month: b.ym,
      count: b.total,
      verified: b.verified,
      disputed: b.disputed,
      unverified: b.unverified,
      avg_severity: b.severity_n > 0 ? +(b.severity_sum / b.severity_n).toFixed(2) : null,
      cumulative,
    }
  })

  const peak = series.reduce((m, s) => Math.max(m, s.count), 0)
  const peakMonth = series.find((s) => s.count === peak && peak > 0)?.month ?? null

  const etag = `W/"pol-mo-${pol.id.slice(0, 8)}-${months}-${stmts.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    politician: {
      slug: pol.slug, common_name: pol.common_name,
      party: pol.party, state: pol.state,
      url: `${SITE_URL}/politico/${pol.slug}`,
    },
    window: {
      months,
      start: startIso,
      end: series[series.length - 1]?.month ?? null,
    },
    totals: {
      count: stmts.length,
      peak_month_count: peak,
      peak_month: peakMonth,
    },
    series,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
