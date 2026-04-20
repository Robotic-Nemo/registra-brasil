import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { extractDomain, displaySourceName, classifySource, CATEGORY_LABEL } from '@/lib/sources/domain'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/fontes/top.json — top N source domains ranked by citation
 * count across all non-removed statements. Returns classification
 * buckets (imprensa/oficial/video/social/outro) as well so dashboards
 * can show source-diversity breakdowns.
 *   ?limite=1..200 (default 50)
 *   ?meses=1..120 (default 12) — window in months anchored UTC
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'fontes-top'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const limit = Math.max(1, Math.min(200, Number(request.nextUrl.searchParams.get('limite')) || 50))
  const meses = Math.max(1, Math.min(120, Number(request.nextUrl.searchParams.get('meses')) || 12))

  const now = new Date()
  const startStr = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (meses - 1), 1))
    .toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('primary_source_url, primary_source_type')
    .neq('verification_status', 'removed')
    .gte('statement_date', startStr)
    .limit(50000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { primary_source_url: string | null; primary_source_type: string | null }
  const rows = (data ?? []) as Row[]

  const domainCounts = new Map<string, number>()
  const typeCounts = new Map<string, number>()
  const classCounts = new Map<string, number>()
  let withUrl = 0
  for (const r of rows) {
    const d = extractDomain(r.primary_source_url)
    if (d) {
      domainCounts.set(d, (domainCounts.get(d) ?? 0) + 1)
      const klass = classifySource(d)
      classCounts.set(klass, (classCounts.get(klass) ?? 0) + 1)
      withUrl++
    }
    const t = r.primary_source_type ?? 'unknown'
    typeCounts.set(t, (typeCounts.get(t) ?? 0) + 1)
  }

  const top = [...domainCounts.entries()]
    .sort((a, b) => b[1] - a[1])
    .slice(0, limit)
    .map(([domain, count]) => {
      const klass = classifySource(domain)
      return {
        domain,
        display_name: displaySourceName(domain),
        classification: klass,
        classification_label: CATEGORY_LABEL[klass],
        count,
        share: +(count / Math.max(1, withUrl)).toFixed(4),
        url: `${SITE_URL}/fontes/${encodeURIComponent(domain)}`,
      }
    })

  const classification = [...classCounts.entries()]
    .map(([k, v]) => ({
      classification: k,
      label: CATEGORY_LABEL[k as keyof typeof CATEGORY_LABEL] ?? k,
      count: v,
      share: +(v / Math.max(1, withUrl)).toFixed(4),
    }))
    .sort((a, b) => b.count - a.count)

  const source_types = [...typeCounts.entries()]
    .map(([type, count]) => ({ type, count }))
    .sort((a, b) => b.count - a.count)

  const etag = `W/"fontes-top-${meses}-${limit}-${withUrl}-${domainCounts.size}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    window_meses: meses,
    total_statements: rows.length,
    with_url: withUrl,
    unique_domains: domainCounts.size,
    classification,
    source_types,
    top,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
