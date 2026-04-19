import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { csvEscape } from '@/lib/export/statement-formats'

export const runtime = 'nodejs'
export const revalidate = 3600

/**
 * GET /api/dump/fact-checks — full dump of statement_fact_checks (all
 * outlet-side indexed fact-checks, not editorial verifications).
 * ?format=csv for CSV.
 */
export async function GET(request: NextRequest) {
  const format = (request.nextUrl.searchParams.get('format') ?? 'json').toLowerCase()
  const supabase = getSupabaseServiceClient()

  const { data, error } = await (supabase.from('statement_fact_checks') as any)
    .select('id, statement_id, outlet, outlet_label, url, title, rating, rating_label, published_at, created_at')
    .order('published_at', { ascending: false, nullsFirst: false })
    .limit(20000)
  if (error) {
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500, headers: { 'Content-Type': 'application/json' },
    })
  }
  type Row = {
    id: string; statement_id: string; outlet: string; outlet_label: string | null
    url: string; title: string | null; rating: string | null; rating_label: string | null
    published_at: string | null; created_at: string
  }
  const rows = (data ?? []) as Row[]
  const today = new Date().toISOString().slice(0, 10)

  if (format === 'csv') {
    const header = 'id,statement_id,outlet,outlet_label,url,title,rating,rating_label,published_at,created_at'
    const body = rows.map((r) => [
      r.id, r.statement_id,
      csvEscape(r.outlet), csvEscape(r.outlet_label ?? ''),
      csvEscape(r.url), csvEscape(r.title ?? ''),
      csvEscape(r.rating ?? ''), csvEscape(r.rating_label ?? ''),
      r.published_at ?? '', r.created_at,
    ].join(',')).join('\n')
    return new Response(`${header}\n${body}\n`, {
      headers: {
        'Content-Type': 'text/csv; charset=utf-8',
        'Content-Disposition': `attachment; filename="registra-brasil-fact-checks-${today}.csv"`,
        'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=86400, max-age=86400',
        'X-Robots-Tag': 'noindex',
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
      'Content-Disposition': `inline; filename="registra-brasil-fact-checks-${today}.json"`,
      'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=86400, max-age=86400',
      'X-Robots-Tag': 'noindex',
    },
  })
}

