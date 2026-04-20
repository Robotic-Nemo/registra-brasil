import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { displaySourceName, classifySource, CATEGORY_LABEL } from '@/lib/sources/domain'
import { sourceUrlOrFilter, DOMAIN_RE_STRICT } from '@/lib/sources/domain-filter'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const DOMAIN_RE = /^[a-z0-9%.-]{3,253}$/i

/**
 * GET /api/fontes/:domain/stats.json — aggregated stats for a source
 * domain cited as `primary_source_url`: totals, status split,
 * severity mean, first/last citation date. One row-fetch then
 * grouped in memory (domain filter is host-like so we can't split
 * it into N head-counts cheaply).
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ domain: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'fontes-stats'), {
    limit: 60, windowMs: 60_000,
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

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, verification_status, severity_score')
    .neq('verification_status', 'removed')
    .or(sourceUrlOrFilter(domain))
    .limit(10000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; verification_status: string; severity_score: number | null }
  const rows = (data ?? []) as Row[]

  let verified = 0, disputed = 0, unverified = 0, sevSum = 0, sevN = 0
  let minDate: string | null = null, maxDate: string | null = null
  for (const r of rows) {
    if (r.verification_status === 'verified') verified++
    else if (r.verification_status === 'disputed') disputed++
    else unverified++
    if (r.severity_score != null) { sevSum += r.severity_score; sevN++ }
    const d = r.statement_date?.slice(0, 10)
    if (d) {
      if (!minDate || d < minDate) minDate = d
      if (!maxDate || d > maxDate) maxDate = d
    }
  }

  const total = rows.length
  const classification = classifySource(domain)

  const etag = `W/"fontes-stats-${domain}-${total}-${verified}-${disputed}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    domain,
    display_name: displaySourceName(domain),
    classification,
    classification_label: CATEGORY_LABEL[classification],
    url: `${SITE_URL}/fontes/${encodeURIComponent(domain)}`,
    total,
    verified,
    disputed,
    unverified,
    avg_severity: sevN > 0 ? +(sevSum / sevN).toFixed(2) : null,
    first_cited: minDate,
    last_cited: maxDate,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
