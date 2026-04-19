import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { csvEscape } from '@/lib/export/statement-formats'

export const runtime = 'nodejs'
export const revalidate = 3600

/**
 * GET /api/dump/contradictions — full dump of published
 * contradiction_pairs. ?format=csv for CSV.
 */
export async function GET(request: NextRequest) {
  const format = (request.nextUrl.searchParams.get('format') ?? 'json').toLowerCase()
  const supabase = getSupabaseServiceClient()

  const { data, error } = await (supabase.from('contradiction_pairs') as any)
    .select('id, politician_id, statement_low_id, statement_high_id, headline, editor_note, severity, is_published, created_at, updated_at')
    .eq('is_published', true)
    .order('created_at', { ascending: false })
    .limit(20000)
  if (error) {
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500, headers: { 'Content-Type': 'application/json' },
    })
  }
  type Row = {
    id: string; politician_id: string; statement_low_id: string; statement_high_id: string
    headline: string; editor_note: string; severity: number
    is_published: boolean; created_at: string; updated_at: string
  }
  const rows = (data ?? []) as Row[]
  const today = new Date().toISOString().slice(0, 10)

  if (format === 'csv') {
    const header = 'id,politician_id,statement_low_id,statement_high_id,headline,editor_note,severity,created_at,updated_at'
    const body = rows.map((r) => [
      r.id, r.politician_id, r.statement_low_id, r.statement_high_id,
      csvEscape(r.headline), csvEscape(r.editor_note),
      r.severity, r.created_at, r.updated_at,
    ].join(',')).join('\n')
    return new Response(`${header}\n${body}\n`, {
      headers: {
        'Content-Type': 'text/csv; charset=utf-8',
        'Content-Disposition': `attachment; filename="registra-brasil-contradictions-${today}.csv"`,
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
      'Content-Disposition': `inline; filename="registra-brasil-contradictions-${today}.json"`,
      'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=86400, max-age=86400',
      'X-Robots-Tag': 'noindex',
    },
  })
}

