import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { csvEscape } from '@/lib/export/statement-formats'

export const runtime = 'nodejs'
export const revalidate = 3600

/**
 * GET /api/dump/collections — full dump of published editorial
 * collections (metadata only, no member list; use
 * /api/colecao/:slug/export for that). ?format=csv for CSV.
 */
export async function GET(request: NextRequest) {
  const format = (request.nextUrl.searchParams.get('format') ?? 'json').toLowerCase()
  const supabase = getSupabaseServiceClient()

  const { data, error } = await (supabase.from('collections') as any)
    .select('id, slug, title, subtitle, description, cover_image_url, is_published, published_at, created_at, updated_at')
    .eq('is_published', true)
    .order('published_at', { ascending: false, nullsFirst: false })
    .limit(5000)

  if (error) {
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500, headers: { 'Content-Type': 'application/json' },
    })
  }
  type Row = {
    id: string; slug: string; title: string; subtitle: string | null
    description: string | null; cover_image_url: string | null
    is_published: boolean; published_at: string | null
    created_at: string; updated_at: string
  }
  const rows = (data ?? []) as Row[]
  const today = new Date().toISOString().slice(0, 10)

  const latest = rows.length ? rows[0].updated_at : '0'
  const etag = `W/"col-${rows.length}-${latest.replace(/[^0-9]/g, '').slice(0, 14)}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  if (format === 'csv') {
    const header = 'id,slug,title,subtitle,description,cover_image_url,published_at,created_at,updated_at'
    const body = rows.map((r) => [
      r.id, csvEscape(r.slug), csvEscape(r.title),
      csvEscape(r.subtitle ?? ''), csvEscape(r.description ?? ''),
      csvEscape(r.cover_image_url ?? ''),
      r.published_at ?? '', r.created_at, r.updated_at,
    ].join(',')).join('\n')
    return new Response(`${header}\n${body}\n`, {
      headers: {
        'Content-Type': 'text/csv; charset=utf-8',
        'Content-Disposition': `attachment; filename="registra-brasil-collections-${today}.csv"`,
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
      'Content-Disposition': `inline; filename="registra-brasil-collections-${today}.json"`,
      'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=86400, max-age=86400',
      'X-Robots-Tag': 'noindex',
      ETag: etag,
    },
  })
}
