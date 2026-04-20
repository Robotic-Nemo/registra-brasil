import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { extractDomain } from '@/lib/sources/domain'
import { csvEscape } from '@/lib/export/statement-formats'

export const runtime = 'nodejs'
export const revalidate = 10800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/fontes.csv — CSV of source-domain usage counts across
 * non-removed statements. Columns: domain, count, share,
 * dominant_type, url. Sibling of /api/fontes.json.
 *
 *   ?limite=1..1000 (default 500)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'fontes-csv'), {
    limit: 15, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const limit = Math.max(1, Math.min(1000, Number(request.nextUrl.searchParams.get('limite')) || 500))

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('primary_source_url, primary_source_type')
    .neq('verification_status', 'removed')
    .limit(50000)

  if (error) return new Response('error', { status: 500 })

  type Row = { primary_source_url: string | null; primary_source_type: string | null }
  const counts = new Map<string, number>()
  const types = new Map<string, Map<string, number>>()
  let withUrl = 0
  for (const r of ((data ?? []) as Row[])) {
    const d = extractDomain(r.primary_source_url)
    if (!d) continue
    withUrl++
    counts.set(d, (counts.get(d) ?? 0) + 1)
    const t = r.primary_source_type ?? 'unknown'
    const tm = types.get(d) ?? new Map<string, number>()
    tm.set(t, (tm.get(t) ?? 0) + 1)
    types.set(d, tm)
  }

  const top = [...counts.entries()].sort((a, b) => b[1] - a[1]).slice(0, limit)
  const lines = ['domain,count,share,dominant_type,url']
  for (const [domain, count] of top) {
    const tm = types.get(domain)!
    const dominant = [...tm.entries()].sort((a, b) => b[1] - a[1])[0]?.[0] ?? 'unknown'
    const share = withUrl > 0 ? +(count / withUrl).toFixed(4) : 0
    lines.push([
      csvEscape(domain),
      csvEscape(count),
      csvEscape(share),
      csvEscape(dominant),
      csvEscape(`${SITE_URL}/fontes/${encodeURIComponent(domain)}`),
    ].join(','))
  }

  const body = lines.join('\n') + '\n'
  const etag = `W/"fontes-csv-${withUrl}-${top.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return new Response(body, {
    headers: {
      'Content-Type': 'text/csv; charset=utf-8',
      'Content-Disposition': 'attachment; filename="fontes.csv"',
      'Cache-Control': 'public, max-age=3600, s-maxage=10800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
