import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { csvEscape } from '@/lib/export/statement-formats'

export const runtime = 'nodejs'
export const revalidate = 3600

/**
 * GET /api/dump/revisions — full dump of statement_revisions. JSON by
 * default; ?format=csv emits the same rows as CSV. Capped at 20k rows
 * to keep the response under Vercel's 4.5 MB edge body limit; if the
 * archive ever passes that, we'll paginate.
 */
export async function GET(request: NextRequest) {
  const format = (request.nextUrl.searchParams.get('format') ?? 'json').toLowerCase()
  const supabase = getSupabaseServiceClient()

  const { data, error } = await (supabase.from('statement_revisions') as any)
    .select('id, statement_id, revision_number, changed_fields, reason, actor, created_at')
    .order('created_at', { ascending: false })
    .limit(20000)

  if (error) {
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    })
  }
  type Row = {
    id: string; statement_id: string; revision_number: number
    changed_fields: Record<string, unknown>; reason: string | null
    actor: string | null; created_at: string
  }
  const rows = (data ?? []) as Row[]
  const today = new Date().toISOString().slice(0, 10)

  if (format === 'csv') {
    const header = 'id,statement_id,revision_number,changed_fields,reason,actor,created_at'
    const body = rows.map((r) => [
      r.id,
      r.statement_id,
      r.revision_number,
      csvEscape(Object.keys(r.changed_fields ?? {}).join('|')),
      csvEscape(r.reason ?? ''),
      csvEscape(r.actor ?? ''),
      r.created_at,
    ].join(',')).join('\n')
    return new Response(`${header}\n${body}\n`, {
      headers: {
        'Content-Type': 'text/csv; charset=utf-8',
        'Content-Disposition': `attachment; filename="registra-brasil-revisions-${today}.csv"`,
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
      'Content-Disposition': `inline; filename="registra-brasil-revisions-${today}.json"`,
      'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=86400, max-age=86400',
      'X-Robots-Tag': 'noindex',
    },
  })
}

