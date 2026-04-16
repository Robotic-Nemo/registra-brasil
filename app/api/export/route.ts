import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const dynamic = 'force-dynamic'

/**
 * GET /api/export?format=csv|json&politician=slug&category=slug&status=verified
 * Export statements data in CSV or JSON format
 */
export async function GET(request: NextRequest) {
  const { allowed } = checkRateLimit(getRateLimitKey(request, 'export'), { limit: 10, windowMs: 60_000 })
  if (!allowed) {
    return NextResponse.json({ error: 'Rate limit exceeded' }, { status: 429 })
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

    const csv = [headers.join(','), ...rows].join('\n')

    return new Response(csv, {
      headers: {
        'Content-Type': 'text/csv; charset=utf-8',
        'Content-Disposition': `attachment; filename="registra-brasil-export-${new Date().toISOString().slice(0, 10)}.csv"`,
        'Cache-Control': 'private, no-store',
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
    },
  })
}

function csvEscape(value: string): string {
  if (value.includes(',') || value.includes('"') || value.includes('\n')) {
    return `"${value.replace(/"/g, '""')}"`
  }
  return value
}
