import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildSeverityDailyMatrix, dailyStartStr } from '@/lib/stats/severity-daily-matrix'
import { displaySourceName } from '@/lib/sources/domain'
import { sourceUrlOrFilter, DOMAIN_RE_STRICT } from '@/lib/sources/domain-filter'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const DOMAIN_RE = /^[a-z0-9%.-]{3,253}$/i

/**
 * GET /api/fontes/:domain/severidade-por-dia.json — day × severity
 * level matrix for statements citing this source domain.
 *   ?dias=7..180 (default 60)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ domain: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'fontes-sev-dia'), {
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
  const dias = Math.max(7, Math.min(180, Number(request.nextUrl.searchParams.get('dias')) || 60))

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, severity_score')
    .neq('verification_status', 'removed')
    .gte('statement_date', dailyStartStr(dias))
    .or(sourceUrlOrFilter(domain))
    .limit(20000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; severity_score: number | null }
  const { series, total } = buildSeverityDailyMatrix(dias, (data ?? []) as Row[])

  const etag = `W/"fontes-sev-dia-${domain}-${dias}-${total}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    domain,
    display_name: displaySourceName(domain),
    url: `${SITE_URL}/fontes/${encodeURIComponent(domain)}`,
    dias, total, series,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
