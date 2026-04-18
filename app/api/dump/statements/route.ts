import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'nodejs'
export const maxDuration = 30
export const revalidate = 3600

/**
 * GET /api/dump/statements?format=json|csv
 *
 * Full catalog dump — all non-removed statements, paged through Supabase
 * in chunks of 1000. Much larger than /api/export (capped at 2000);
 * designed for archival + research use. Cached 1 h edge, 24 h browser.
 */
const CHUNK = 1000

const FORMULA_PREFIX = /^[=+\-@\t\r]/
function csvEscape(v: unknown): string {
  if (v === null || v === undefined) return ''
  let s = String(v)
  if (FORMULA_PREFIX.test(s)) s = `'${s}`
  if (s.includes(',') || s.includes('"') || s.includes('\n') || s.includes('\r')) {
    return `"${s.replace(/"/g, '""')}"`
  }
  return s
}

interface DumpRow {
  id: string
  slug: string | null
  summary: string
  full_quote: string | null
  context: string | null
  statement_date: string
  verification_status: string
  primary_source_url: string
  primary_source_type: string
  venue: string | null
  event_name: string | null
  severity_score: number | null
  minors_involved: boolean | null
  created_at: string
  updated_at: string
  politicians: { slug: string; common_name: string; party: string; state: string | null } | null
  statement_categories: Array<{ is_primary: boolean; categories: { slug: string; label_pt: string } | null }>
}

async function fetchAll(): Promise<DumpRow[]> {
  const supabase = getSupabaseServiceClient()
  const all: DumpRow[] = []
  let from = 0
  while (true) {
    const { data, error } = await (supabase.from('statements') as any)
      .select(
        'id, slug, summary, full_quote, context, statement_date, verification_status, primary_source_url, primary_source_type, venue, event_name, severity_score, minors_involved, created_at, updated_at, politicians(slug, common_name, party, state), statement_categories(is_primary, categories(slug, label_pt))',
      )
      .neq('verification_status', 'removed')
      .order('statement_date', { ascending: false })
      .range(from, from + CHUNK - 1)
    if (error) throw new Error(error.message)
    const rows = (data ?? []) as DumpRow[]
    all.push(...rows)
    if (rows.length < CHUNK) break
    from += CHUNK
  }
  return all
}

export async function GET(request: NextRequest) {
  const format = (request.nextUrl.searchParams.get('format') ?? 'json').toLowerCase()
  if (format !== 'json' && format !== 'csv') {
    return new Response(JSON.stringify({ error: 'Invalid format' }), {
      status: 400,
      headers: { 'Content-Type': 'application/json' },
    })
  }

  let rows: DumpRow[]
  try {
    rows = await fetchAll()
  } catch (e) {
    console.error('[dump/statements]', e)
    return new Response(JSON.stringify({ error: 'Dump failed' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    })
  }

  const generatedAt = new Date().toISOString()
  const dateTag = generatedAt.slice(0, 10)

  // Weak ETag: hash of (count, latest updated_at) is enough to bust caches when new rows land.
  const latestUpdated = rows.reduce((max, r) => (r.updated_at > max ? r.updated_at : max), '')
  const etag = `W/"stmts-${rows.length}-${latestUpdated.replace(/[^0-9]/g, '').slice(0, 14)}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  if (format === 'csv') {
    const headers = [
      'id', 'slug', 'politico_slug', 'politico', 'partido', 'estado',
      'resumo', 'citacao_completa', 'contexto', 'data', 'status',
      'fonte_url', 'fonte_tipo', 'local', 'evento', 'severidade',
      'envolve_menores', 'categorias_primarias', 'categorias_secundarias',
      'criado_em', 'atualizado_em',
    ]

    const body = rows.map((r) => {
      const pol = r.politicians
      const primary = r.statement_categories.filter((x) => x.is_primary && x.categories).map((x) => x.categories!.label_pt).join('; ')
      const secondary = r.statement_categories.filter((x) => !x.is_primary && x.categories).map((x) => x.categories!.label_pt).join('; ')
      return [
        r.id,
        r.slug ?? '',
        pol?.slug ?? '',
        pol?.common_name ?? '',
        pol?.party ?? '',
        pol?.state ?? '',
        r.summary,
        r.full_quote ?? '',
        r.context ?? '',
        r.statement_date,
        r.verification_status,
        r.primary_source_url,
        r.primary_source_type,
        r.venue ?? '',
        r.event_name ?? '',
        r.severity_score ?? '',
        r.minors_involved ? 'sim' : 'nao',
        primary,
        secondary,
        r.created_at,
        r.updated_at,
      ].map(csvEscape).join(',')
    })

    const csv = '\uFEFF' + [headers.join(','), ...body].join('\r\n')

    return new Response(csv, {
      headers: {
        'Content-Type': 'text/csv; charset=utf-8',
        'Content-Disposition': `attachment; filename="registra-brasil-statements-${dateTag}.csv"`,
        'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=86400, max-age=86400',
        ETag: etag,
        'X-Content-Type-Options': 'nosniff',
        'X-Robots-Tag': 'noindex',
      },
    })
  }

  // JSON format with license preamble — downstream consumers should preserve.
  const body = JSON.stringify({
    license: 'CC BY 4.0 — attribute "Registra Brasil" + link to source',
    source_url: 'https://registrabrasil.com.br',
    generated_at: generatedAt,
    total: rows.length,
    data: rows.map((r) => ({
      id: r.id,
      slug: r.slug,
      summary: r.summary,
      full_quote: r.full_quote,
      context: r.context,
      statement_date: r.statement_date,
      verification_status: r.verification_status,
      primary_source_url: r.primary_source_url,
      primary_source_type: r.primary_source_type,
      venue: r.venue,
      event_name: r.event_name,
      severity_score: r.severity_score,
      minors_involved: r.minors_involved,
      politician: r.politicians,
      categories: r.statement_categories.map((sc) => ({
        slug: sc.categories?.slug ?? null,
        label: sc.categories?.label_pt ?? null,
        is_primary: sc.is_primary,
      })),
      created_at: r.created_at,
      updated_at: r.updated_at,
    })),
  })

  return new Response(body, {
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'Content-Disposition': `inline; filename="registra-brasil-statements-${dateTag}.json"`,
      'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=86400, max-age=86400',
      ETag: etag,
      'X-Content-Type-Options': 'nosniff',
      'X-Robots-Tag': 'noindex',
    },
  })
}
