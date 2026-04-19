import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 900

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

const FORMULA_PREFIX = /^[=+\-@\t\r]/
function csvEscape(v: unknown): string {
  if (v === null || v === undefined) return ''
  let s = String(v)
  if (FORMULA_PREFIX.test(s)) s = "'" + s
  if (/[",\n\r]/.test(s)) s = `"${s.replace(/"/g, '""')}"`
  return s
}

function bibtexKey(politicianSlug: string, date: string, id: string): string {
  const year = date.slice(0, 4)
  const slug = politicianSlug.replace(/[^a-z0-9]+/g, '').slice(0, 24)
  return `rb-${slug}-${year}-${id.slice(0, 6)}`
}

function bibtexEscape(s: string): string {
  return s
    .replace(/\\/g, '\\textbackslash ')
    .replace(/&/g, '\\&')
    .replace(/%/g, '\\%')
    .replace(/#/g, '\\#')
    .replace(/_/g, '\\_')
    .replace(/\{/g, '\\{')
    .replace(/\}/g, '\\}')
    .replace(/\$/g, '\\$')
    .replace(/~/g, '\\textasciitilde ')
    .replace(/\^/g, '\\^')
}

interface ExportRow {
  id: string
  slug: string | null
  summary: string
  full_quote: string | null
  statement_date: string
  primary_source_url: string
  venue: string | null
  event_name: string | null
  verification_status: string
  politician_slug: string
  politician_name: string
  position: number
  editor_note: string | null
}

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'colecao-export'), {
    limit: 20,
    windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Too many requests' } },
      { status: 429, headers: { 'Retry-After': String(Math.ceil((rl.resetAt - Date.now()) / 1000)) } },
    )
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const format = (request.nextUrl.searchParams.get('format') ?? 'csv').toLowerCase()
  if (!['csv', 'json', 'bibtex', 'bib'].includes(format)) {
    return NextResponse.json({ error: 'format deve ser csv, json ou bibtex' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()
  const { data: col } = await (supabase.from('collections') as any)
    .select('id, title, subtitle, description, slug, is_published, published_at')
    .eq('slug', slug)
    .eq('is_published', true)
    .maybeSingle()
  if (!col) {
    return NextResponse.json({ error: 'Coleção não encontrada' }, { status: 404 })
  }

  const { data: join } = await (supabase.from('collection_statements') as any)
    .select('position, editor_note, statements(id, slug, summary, full_quote, statement_date, primary_source_url, venue, event_name, verification_status, politicians(slug, common_name))')
    .eq('collection_id', col.id)
    .order('position', { ascending: true })

  type Raw = {
    position: number
    editor_note: string | null
    statements: {
      id: string
      slug: string | null
      summary: string
      full_quote: string | null
      statement_date: string
      primary_source_url: string
      venue: string | null
      event_name: string | null
      verification_status: string
      politicians: { slug: string; common_name: string } | null
    } | null
  }

  const rows: ExportRow[] = ((join ?? []) as Raw[])
    .filter((r) => r.statements && r.statements.politicians)
    .map((r) => ({
      id: r.statements!.id,
      slug: r.statements!.slug,
      summary: r.statements!.summary,
      full_quote: r.statements!.full_quote,
      statement_date: r.statements!.statement_date,
      primary_source_url: r.statements!.primary_source_url,
      venue: r.statements!.venue,
      event_name: r.statements!.event_name,
      verification_status: r.statements!.verification_status,
      politician_slug: r.statements!.politicians!.slug,
      politician_name: r.statements!.politicians!.common_name,
      position: r.position,
      editor_note: r.editor_note,
    }))

  if (format === 'json') {
    return NextResponse.json({
      collection: {
        slug: col.slug,
        title: col.title,
        subtitle: col.subtitle ?? null,
        description: col.description ?? null,
        published_at: col.published_at ?? null,
        url: `${SITE_URL}/colecao/${col.slug}`,
      },
      statements: rows.map((r) => ({
        ...r,
        permalink: `${SITE_URL}/declaracao/${r.slug ?? r.id}`,
      })),
    }, {
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Content-Disposition': `attachment; filename="colecao-${col.slug}.json"`,
        'Cache-Control': 'public, max-age=600, s-maxage=900, stale-while-revalidate=3600',
      },
    })
  }

  if (format === 'csv') {
    const header = [
      'position', 'politician', 'politician_slug', 'date', 'summary', 'full_quote',
      'venue', 'event', 'verification', 'primary_source_url',
      'permalink', 'editor_note',
    ].join(',')
    const body = rows
      .map((r) => [
        r.position,
        r.politician_name,
        r.politician_slug,
        r.statement_date,
        r.summary,
        r.full_quote ?? '',
        r.venue ?? '',
        r.event_name ?? '',
        r.verification_status,
        r.primary_source_url,
        `${SITE_URL}/declaracao/${r.slug ?? r.id}`,
        r.editor_note ?? '',
      ].map(csvEscape).join(','))
      .join('\n')
    return new NextResponse(`${header}\n${body}\n`, {
      headers: {
        'Content-Type': 'text/csv; charset=utf-8',
        'Content-Disposition': `attachment; filename="colecao-${col.slug}.csv"`,
        'Cache-Control': 'public, max-age=600, s-maxage=900, stale-while-revalidate=3600',
      },
    })
  }

  // BibTeX: one @misc entry per statement, suitable for academic citation.
  const entries = rows.map((r) => {
    const key = bibtexKey(r.politician_slug, r.statement_date, r.id)
    const author = bibtexEscape(r.politician_name)
    const title = bibtexEscape(r.summary)
    const url = `${SITE_URL}/declaracao/${r.slug ?? r.id}`
    const year = r.statement_date.slice(0, 4)
    const month = r.statement_date.slice(5, 7)
    const day = r.statement_date.slice(8, 10)
    return `@misc{${key},
  author = {${author}},
  title = {${title}},
  howpublished = {\\url{${url}}},
  year = {${year}},
  month = {${month}},
  note = {Registra Brasil, collection: ${bibtexEscape(col.title)}; accessed ${new Date().toISOString().slice(0, 10)}; statement dated ${year}-${month}-${day}; primary source: \\url{${r.primary_source_url}}}
}`
  }).join('\n\n')

  return new NextResponse(
    `% Exported from Registra Brasil — colecao "${col.title}"\n% ${rows.length} entries · ${SITE_URL}/colecao/${col.slug}\n\n${entries}\n`,
    {
      headers: {
        'Content-Type': 'application/x-bibtex; charset=utf-8',
        'Content-Disposition': `attachment; filename="colecao-${col.slug}.bib"`,
        'Cache-Control': 'public, max-age=600, s-maxage=900, stale-while-revalidate=3600',
      },
    },
  )
}
