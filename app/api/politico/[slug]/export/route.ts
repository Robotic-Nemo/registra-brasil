import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 900

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/
const CHUNK = 1000
const CAP = 25000

const FORMULA_PREFIX = /^[=+\-@\t\r]/
function csvEscape(v: unknown): string {
  if (v === null || v === undefined) return ''
  let s = String(v)
  if (FORMULA_PREFIX.test(s)) s = "'" + s
  if (/[",\n\r]/.test(s)) s = `"${s.replace(/"/g, '""')}"`
  return s
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

interface StatementRow {
  id: string
  slug: string | null
  summary: string
  full_quote: string | null
  statement_date: string
  verification_status: string
  severity_score: number | null
  venue: string | null
  event_name: string | null
  primary_source_url: string
  primary_source_type: string
  source_wayback_url: string | null
  categories: string[]
}

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'politico-export'), {
    limit: 10, windowMs: 60_000,
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
  const { data: pol } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name, full_name, party, state, role')
    .eq('slug', slug)
    .maybeSingle()
  if (!pol) {
    return NextResponse.json({ error: 'Político não encontrado' }, { status: 404 })
  }

  // Page through all non-removed statements.
  const rows: StatementRow[] = []
  for (let offset = 0; offset < CAP; offset += CHUNK) {
    const { data } = await (supabase.from('statements') as any)
      .select('id, slug, summary, full_quote, statement_date, verification_status, severity_score, venue, event_name, primary_source_url, primary_source_type, source_wayback_url, statement_categories(categories(slug))')
      .eq('politician_id', pol.id)
      .neq('verification_status', 'removed')
      .order('statement_date', { ascending: false })
      .range(offset, offset + CHUNK - 1)
    const page = (data ?? []) as Array<{
      id: string; slug: string | null; summary: string; full_quote: string | null
      statement_date: string; verification_status: string; severity_score: number | null
      venue: string | null; event_name: string | null; primary_source_url: string
      primary_source_type: string; source_wayback_url: string | null
      statement_categories: Array<{ categories: { slug: string } | null }>
    }>
    for (const r of page) {
      rows.push({
        ...r,
        categories: r.statement_categories
          .map((sc) => sc.categories?.slug)
          .filter((s): s is string => typeof s === 'string'),
      })
    }
    if (page.length < CHUNK) break
  }

  const filename = `declaracoes-${pol.slug}`

  if (format === 'json') {
    return NextResponse.json({
      politician: {
        slug: pol.slug,
        common_name: pol.common_name,
        full_name: pol.full_name,
        party: pol.party,
        state: pol.state,
        role: pol.role,
        profile_url: `${SITE_URL}/politico/${pol.slug}`,
      },
      count: rows.length,
      statements: rows.map((r) => ({
        ...r,
        permalink: `${SITE_URL}/declaracao/${r.slug ?? r.id}`,
      })),
    }, {
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Content-Disposition': `attachment; filename="${filename}.json"`,
        'Cache-Control': 'public, max-age=600, s-maxage=900, stale-while-revalidate=3600',
      },
    })
  }

  if (format === 'csv') {
    const header = [
      'date', 'severity', 'verification', 'summary', 'full_quote',
      'venue', 'event', 'categories', 'primary_source_url',
      'primary_source_type', 'source_wayback_url', 'permalink',
    ].join(',')
    const body = rows.map((r) => [
      r.statement_date, r.severity_score ?? '', r.verification_status,
      r.summary, r.full_quote ?? '', r.venue ?? '', r.event_name ?? '',
      r.categories.join('|'),
      r.primary_source_url, r.primary_source_type, r.source_wayback_url ?? '',
      `${SITE_URL}/declaracao/${r.slug ?? r.id}`,
    ].map(csvEscape).join(',')).join('\n')
    return new NextResponse(`${header}\n${body}\n`, {
      headers: {
        'Content-Type': 'text/csv; charset=utf-8',
        'Content-Disposition': `attachment; filename="${filename}.csv"`,
        'Cache-Control': 'public, max-age=600, s-maxage=900, stale-while-revalidate=3600',
      },
    })
  }

  // BibTeX
  const entries = rows.map((r) => {
    const year = r.statement_date.slice(0, 4)
    const month = r.statement_date.slice(5, 7)
    const day = r.statement_date.slice(8, 10)
    const key = `rb-${pol.slug.replace(/-/g, '').slice(0, 24)}-${year}-${r.id.slice(0, 6)}`
    return `@misc{${key},
  author = {${bibtexEscape(pol.common_name)}},
  title = {${bibtexEscape(r.summary)}},
  howpublished = {\\url{${SITE_URL}/declaracao/${r.slug ?? r.id}}},
  year = {${year}},
  month = {${month}},
  note = {Registra Brasil; political affiliation: ${bibtexEscape(pol.party ?? '')}; accessed ${new Date().toISOString().slice(0,10)}; statement dated ${year}-${month}-${day}; primary source: \\url{${r.primary_source_url}}}
}`
  }).join('\n\n')

  return new NextResponse(
    `% Exported from Registra Brasil — político "${pol.common_name}"\n% ${rows.length} entries · ${SITE_URL}/politico/${pol.slug}\n\n${entries}\n`,
    {
      headers: {
        'Content-Type': 'application/x-bibtex; charset=utf-8',
        'Content-Disposition': `attachment; filename="${filename}.bib"`,
        'Cache-Control': 'public, max-age=600, s-maxage=900, stale-while-revalidate=3600',
      },
    },
  )
}
