import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { csvEscape } from '@/lib/export/statement-formats'

export const runtime = 'nodejs'
export const revalidate = 3600

/**
 * GET /api/dump/statement-categories — full dump of the
 * statement_categories join table (statement_id × category_id, plus
 * is_primary flag). JSON default; ?format=csv for CSV. Capped at 50k
 * rows. Useful for reconstructing category histograms offline.
 */
export async function GET(request: NextRequest) {
  const format = (request.nextUrl.searchParams.get('format') ?? 'json').toLowerCase()
  const supabase = getSupabaseServiceClient()

  const { data, error } = await (supabase.from('statement_categories') as any)
    .select('statement_id, category_id, is_primary')
    .limit(50000)

  if (error) {
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500, headers: { 'Content-Type': 'application/json' },
    })
  }
  type Row = { statement_id: string; category_id: string; is_primary: boolean | null }
  const rows = (data ?? []) as Row[]
  const today = new Date().toISOString().slice(0, 10)

  // ETag based on count only — this table has no timestamp col.
  const etag = `W/"sc-${rows.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  if (format === 'csv') {
    const header = 'statement_id,category_id,is_primary'
    const body = rows.map((r) => [
      r.statement_id, r.category_id,
      csvEscape(r.is_primary ? 'true' : 'false'),
    ].join(',')).join('\n')
    return new Response(`${header}\n${body}\n`, {
      headers: {
        'Content-Type': 'text/csv; charset=utf-8',
        'Content-Disposition': `attachment; filename="registra-brasil-statement-categories-${today}.csv"`,
        'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=86400, max-age=86400',
        'X-Robots-Tag': 'noindex',
        ETag: etag,
      },
    })
  }

  const body = JSON.stringify({
    license: 'CC BY 4.0 — attribute "Registra Brasil"',
    source_url: 'https://registrabrasil.com.br',
    generated_at: new Date().toISOString(),
    total: rows.length,
    data: rows,
  })
  return new Response(body, {
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'Content-Disposition': `inline; filename="registra-brasil-statement-categories-${today}.json"`,
      'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=86400, max-age=86400',
      'X-Robots-Tag': 'noindex',
      ETag: etag,
    },
  })
}
