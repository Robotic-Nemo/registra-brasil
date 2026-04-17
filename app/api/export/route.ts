import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { createLogger } from '@/lib/utils/logger'

export const dynamic = 'force-dynamic'

const SLUG_PATTERN = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/
const log = createLogger('api/export')

/**
 * GET /api/export?format=csv|json&politician=slug&category=slug&status=verified
 * Export statements data in CSV or JSON format
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'export'), { limit: 10, windowMs: 60_000 })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Rate limit exceeded' } },
      {
        status: 429,
        headers: { 'Retry-After': String(Math.ceil((rl.resetAt - Date.now()) / 1000)) },
      }
    )
  }

  const { searchParams } = request.nextUrl
  const format = searchParams.get('format') ?? 'json'
  const politicianSlug = searchParams.get('politician')
  const categorySlug = searchParams.get('category')
  const status = searchParams.get('status')
  const limit = Math.min(Math.max(1, Number(searchParams.get('limit') ?? 500) || 500), 2000)

  if (!['json', 'csv'].includes(format)) {
    return NextResponse.json({ error: 'Formato inválido. Use json ou csv.' }, { status: 400 })
  }

  if (status && !['verified', 'unverified', 'disputed'].includes(status)) {
    return NextResponse.json({ error: 'Status inválido. Use verified, unverified ou disputed.' }, { status: 400 })
  }

  if (politicianSlug && !SLUG_PATTERN.test(politicianSlug)) {
    return NextResponse.json({ error: 'Slug de político inválido.' }, { status: 400 })
  }

  if (categorySlug && !SLUG_PATTERN.test(categorySlug)) {
    return NextResponse.json({ error: 'Slug de categoria inválido.' }, { status: 400 })
  }

  const supabase = await getSupabaseServerClient()

  let query = supabase
    .from('statements')
    .select(`
      id, summary, full_quote, context, verification_status,
      statement_date, primary_source_url, primary_source_type, venue, event_name,
      politicians!inner (slug, common_name, party, state),
      statement_categories (
        is_primary,
        categories (slug, label_pt)
      )
    `)
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending: false })
    .limit(limit)

  if (politicianSlug) {
    query = query.eq('politicians.slug', politicianSlug)
  }
  if (status) {
    query = query.eq('verification_status', status)
  }

  const { data, error } = await query

  if (error) {
    log.error('export query failed', { err: error.message })
    return NextResponse.json({ error: 'Erro ao buscar dados.' }, { status: 500 })
  }

  if (!data || data.length === 0) {
    return NextResponse.json({ error: 'Nenhum resultado encontrado.' }, { status: 404 })
  }

  // Filter by category client-side (Supabase doesn't easily filter through join)
  let filtered = data
  if (categorySlug) {
    filtered = data.filter((s: Record<string, unknown>) => {
      const cats = s.statement_categories as { categories: { slug: string } }[]
      return cats?.some(sc => sc.categories?.slug === categorySlug)
    })
  }

  if (format === 'csv') {
    const headers = [
      'id', 'resumo', 'citacao_completa', 'contexto', 'status',
      'data', 'fonte_url', 'tipo_fonte', 'local', 'evento',
      'politico', 'partido', 'estado', 'categorias'
    ]

    const rows = filtered.map((s: Record<string, unknown>) => {
      const pol = s.politicians as { common_name: string; party: string; state: string | null }
      const cats = (s.statement_categories as { categories: { label_pt: string } }[])
        ?.map(sc => sc.categories?.label_pt)
        .filter(Boolean)
        .join('; ')

      return [
        s.id,
        csvEscape(s.summary as string),
        csvEscape((s.full_quote as string) ?? ''),
        csvEscape((s.context as string) ?? ''),
        s.verification_status,
        s.statement_date,
        s.primary_source_url,
        s.primary_source_type,
        csvEscape((s.venue as string) ?? ''),
        csvEscape((s.event_name as string) ?? ''),
        csvEscape(pol?.common_name ?? ''),
        pol?.party ?? '',
        pol?.state ?? '',
        csvEscape(cats ?? ''),
      ].join(',')
    })

    // Prepend BOM so Excel (Windows) detects UTF-8 correctly. CRLF line endings.
    const csv = '\uFEFF' + [headers.join(','), ...rows].join('\r\n')

    return new Response(csv, {
      headers: {
        'Content-Type': 'text/csv; charset=utf-8',
        'Content-Disposition': `attachment; filename="registra-brasil-export-${new Date().toISOString().slice(0, 10)}.csv"`,
        'Cache-Control': 'private, no-store',
        'X-Content-Type-Options': 'nosniff',
        'X-Robots-Tag': 'noindex',
      },
    })
  }

  return NextResponse.json({
    total: filtered.length,
    exported_at: new Date().toISOString(),
    data: filtered,
  }, {
    headers: {
      'Content-Disposition': `attachment; filename="registra-brasil-export-${new Date().toISOString().slice(0, 10)}.json"`,
      'Cache-Control': 'private, no-store',
      'X-Content-Type-Options': 'nosniff',
      'X-Robots-Tag': 'noindex',
    },
  })
}

// CSV injection defense: prefix cells Excel/Sheets/Numbers would evaluate as
// formulas with a single quote so they render as plain text. Handles CR too.
const FORMULA_PREFIX = /^[=+\-@\t\r]/
function csvEscape(value: string): string {
  if (value == null) return ''
  let str = String(value)
  if (FORMULA_PREFIX.test(str)) {
    str = `'${str}`
  }
  if (str.includes(',') || str.includes('"') || str.includes('\n') || str.includes('\r')) {
    return `"${str.replace(/"/g, '""')}"`
  }
  return str
}
