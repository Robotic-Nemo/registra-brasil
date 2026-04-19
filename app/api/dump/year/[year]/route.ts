import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { csvEscape, bibtexEscape, bibtexCitekey } from '@/lib/export/statement-formats'

export const runtime = 'nodejs'
export const maxDuration = 60

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const CHUNK = 1000
const CAP = 50000

interface Row {
  id: string
  slug: string | null
  summary: string
  full_quote: string | null
  statement_date: string
  verification_status: string
  severity_score: number | null
  primary_source_url: string
  primary_source_type: string
  politician_slug: string
  politician_name: string
  politician_party: string | null
  politician_state: string | null
  categories: string[]
}

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ year: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'year-dump'), {
    limit: 4, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Too many requests' } },
      { status: 429, headers: { 'Retry-After': String(Math.ceil((rl.resetAt - Date.now()) / 1000)) } },
    )
  }

  const { year: rawYear } = await params
  const year = Number(rawYear)
  if (!/^\d{4}$/.test(rawYear) || year < 1980 || year > 2100) {
    return NextResponse.json({ error: 'ano inválido' }, { status: 400 })
  }
  const format = (request.nextUrl.searchParams.get('format') ?? 'csv').toLowerCase()
  if (!['csv', 'json', 'bibtex', 'bib'].includes(format)) {
    return NextResponse.json({ error: 'format deve ser csv, json ou bibtex' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()
  const rows: Row[] = []
  const startIso = `${year}-01-01`
  const endIso = `${year}-12-31`

  for (let offset = 0; offset < CAP; offset += CHUNK) {
    const { data } = await (supabase.from('statements') as any)
      .select(`
        id, slug, summary, full_quote, statement_date, verification_status,
        severity_score, primary_source_url, primary_source_type,
        politicians!inner(slug, common_name, party, state),
        statement_categories(categories(slug))
      `)
      .gte('statement_date', startIso)
      .lte('statement_date', endIso)
      .neq('verification_status', 'removed')
      .order('statement_date', { ascending: true })
      .range(offset, offset + CHUNK - 1)
    const page = (data ?? []) as Array<{
      id: string; slug: string | null; summary: string; full_quote: string | null
      statement_date: string; verification_status: string; severity_score: number | null
      primary_source_url: string; primary_source_type: string
      politicians: { slug: string; common_name: string; party: string | null; state: string | null }
      statement_categories: Array<{ categories: { slug: string } | null }>
    }>
    for (const s of page) {
      rows.push({
        id: s.id, slug: s.slug, summary: s.summary, full_quote: s.full_quote,
        statement_date: s.statement_date,
        verification_status: s.verification_status,
        severity_score: s.severity_score,
        primary_source_url: s.primary_source_url,
        primary_source_type: s.primary_source_type,
        politician_slug: s.politicians.slug,
        politician_name: s.politicians.common_name,
        politician_party: s.politicians.party,
        politician_state: s.politicians.state,
        categories: (s.statement_categories ?? [])
          .map((sc) => sc.categories?.slug)
          .filter((x): x is string => typeof x === 'string'),
      })
    }
    if (page.length < CHUNK) break
  }

  const filename = `ano-${year}`

  if (format === 'json') {
    return NextResponse.json({
      year,
      count: rows.length,
      url: `${SITE_URL}/retrospectiva/${year}`,
      statements: rows.map((r) => ({ ...r, permalink: `${SITE_URL}/declaracao/${r.slug ?? r.id}` })),
    }, {
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Content-Disposition': `attachment; filename="${filename}.json"`,
        'Cache-Control': 'public, max-age=3600, s-maxage=21600, stale-while-revalidate=86400',
      },
    })
  }

  if (format === 'csv') {
    const header = [
      'date', 'severity', 'verification', 'politician', 'party', 'state',
      'summary', 'full_quote', 'categories', 'primary_source_url',
      'primary_source_type', 'permalink',
    ].join(',')
    const body = rows.map((r) => [
      r.statement_date, r.severity_score ?? '', r.verification_status,
      r.politician_name, r.politician_party ?? '', r.politician_state ?? '',
      r.summary, r.full_quote ?? '',
      r.categories.join('|'),
      r.primary_source_url, r.primary_source_type,
      `${SITE_URL}/declaracao/${r.slug ?? r.id}`,
    ].map(csvEscape).join(',')).join('\n')
    return new NextResponse(`${header}\n${body}\n`, {
      headers: {
        'Content-Type': 'text/csv; charset=utf-8',
        'Content-Disposition': `attachment; filename="${filename}.csv"`,
        'Cache-Control': 'public, max-age=3600, s-maxage=21600, stale-while-revalidate=86400',
      },
    })
  }

  const entries = rows.map((r) => `@misc{${bibtexCitekey(r.politician_slug, r.statement_date, r.id)},
  author = {${bibtexEscape(r.politician_name)}},
  title = {${bibtexEscape(r.summary)}},
  howpublished = {\\url{${SITE_URL}/declaracao/${r.slug ?? r.id}}},
  year = {${r.statement_date.slice(0, 4)}},
  month = {${r.statement_date.slice(5, 7)}},
  note = {Registra Brasil; party: ${bibtexEscape(r.politician_party ?? '')}; UF: ${r.politician_state ?? ''}; accessed ${new Date().toISOString().slice(0,10)}; primary source: \\url{${r.primary_source_url}}}
}`).join('\n\n')

  return new NextResponse(
    `% Exported from Registra Brasil — ano ${year}\n% ${rows.length} entries\n\n${entries}\n`,
    {
      headers: {
        'Content-Type': 'application/x-bibtex; charset=utf-8',
        'Content-Disposition': `attachment; filename="${filename}.bib"`,
        'Cache-Control': 'public, max-age=3600, s-maxage=21600, stale-while-revalidate=86400',
      },
    },
  )
}
