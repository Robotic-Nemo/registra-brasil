import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { csvEscape } from '@/lib/export/statement-formats'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/colecoes.csv — CSV directory of published editorial
 * collections. Sibling to /api/colecoes.json but for spreadsheet-
 * friendly consumption.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'colecoes-csv'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('collections') as any)
    .select('slug, title, subtitle, published_at, collection_statements(count)')
    .eq('is_published', true)
    .order('published_at', { ascending: false, nullsFirst: false })
    .limit(500)

  if (error) return new Response('error', { status: 500 })

  type Row = {
    slug: string; title: string; subtitle: string | null; published_at: string | null
    collection_statements: Array<{ count: number }> | { count: number } | null
  }
  const rows = (data ?? []) as Row[]

  const lines = ['slug,title,subtitle,published_at,statement_count,url']
  for (const r of rows) {
    const cs = r.collection_statements
    const n = Array.isArray(cs) ? (cs[0]?.count ?? 0) : (cs?.count ?? 0)
    lines.push([
      csvEscape(r.slug),
      csvEscape(r.title),
      csvEscape(r.subtitle ?? ''),
      csvEscape(r.published_at ?? ''),
      csvEscape(n),
      csvEscape(`${SITE_URL}/colecao/${r.slug}`),
    ].join(','))
  }

  const body = lines.join('\n') + '\n'
  const etag = `W/"col-csv-${rows.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return new Response(body, {
    headers: {
      'Content-Type': 'text/csv; charset=utf-8',
      'Content-Disposition': 'attachment; filename="colecoes.csv"',
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
