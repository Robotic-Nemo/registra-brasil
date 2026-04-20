import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { isValidDate } from '@/lib/utils/api-filters'
import { csvEscape } from '@/lib/export/statement-formats'

export const runtime = 'nodejs'
export const revalidate = 900

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/declaracoes.csv — CSV variant of the top-level
 * declarations feed (sibling to /api/declaracoes.json). Bounded
 * to 5000 rows per request; use ?from/?to windows for full dumps.
 *   ?limit=1..5000 (default 1000)
 *   ?status=verified|disputed|all (default verified)
 *   ?from=YYYY-MM-DD, ?to=YYYY-MM-DD
 *   ?min_severity=1..5
 *   ?order=asc|desc (default desc)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'decl-csv'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return new Response('rate limited', { status: 429 })
  }

  const sp = request.nextUrl.searchParams
  const limitRaw = Number(sp.get('limit')) || 1000
  const limit = Math.max(1, Math.min(5000, Math.floor(limitRaw)))
  const ascending = sp.get('order') === 'asc'
  const status = sp.get('status') ?? 'verified'
  const from = sp.get('from')
  const to = sp.get('to')
  const minSeverityRaw = Number(sp.get('min_severity'))
  const minSeverity = Number.isFinite(minSeverityRaw) && minSeverityRaw >= 1 && minSeverityRaw <= 5
    ? Math.floor(minSeverityRaw) : null

  if (from && !isValidDate(from)) return new Response('from inválido', { status: 400 })
  if (to && !isValidDate(to)) return new Response('to inválido', { status: 400 })

  const supabase = getSupabaseServiceClient()
  let query = (supabase.from('statements') as any)
    .select('id, slug, summary, full_quote, statement_date, severity_score, verification_status, primary_source_url, primary_source_type, venue, event_name, politicians!inner(slug, common_name, party, state)')
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending })
    .order('id', { ascending })
    .limit(limit)

  if (status !== 'all') query = query.eq('verification_status', status)
  if (from) query = query.gte('statement_date', from)
  if (to) query = query.lte('statement_date', to)
  if (minSeverity !== null) query = query.gte('severity_score', minSeverity)

  const { data, error } = await query
  if (error) return new Response(`error: ${error.message}`, { status: 500 })
  const rows = (data ?? []) as Array<Record<string, any>>

  const header = [
    'id', 'slug', 'statement_date', 'politician_slug', 'politician_name',
    'party', 'state', 'summary', 'full_quote', 'severity_score',
    'verification_status', 'source_type', 'source_url', 'venue',
    'event_name', 'permalink',
  ]
  const lines = [header.join(',')]
  for (const r of rows) {
    const p = r.politicians
    lines.push([
      csvEscape(r.id),
      csvEscape(r.slug ?? ''),
      csvEscape(r.statement_date),
      csvEscape(p?.slug ?? ''),
      csvEscape(p?.common_name ?? ''),
      csvEscape(p?.party ?? ''),
      csvEscape(p?.state ?? ''),
      csvEscape(r.summary),
      csvEscape(r.full_quote ?? ''),
      csvEscape(r.severity_score ?? ''),
      csvEscape(r.verification_status),
      csvEscape(r.primary_source_type),
      csvEscape(r.primary_source_url),
      csvEscape(r.venue ?? ''),
      csvEscape(r.event_name ?? ''),
      csvEscape(`${SITE_URL}/declaracao/${r.slug ?? r.id}`),
    ].join(','))
  }

  const body = lines.join('\n') + '\n'
  const filename = `declaracoes-${from ?? 'all'}-${to ?? 'now'}.csv`
  return new Response(body, {
    headers: {
      'Content-Type': 'text/csv; charset=utf-8',
      'Content-Disposition': `attachment; filename="${filename}"`,
      'Cache-Control': 'public, max-age=600, s-maxage=900, stale-while-revalidate=3600',
    },
  })
}
