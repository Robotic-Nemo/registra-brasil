import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { buildJsonFeed, JSON_FEED_HEADERS } from '@/lib/feeds/json-feed'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

interface Params { params: Promise<{ uf: string }> }

/**
 * GET /estados/[uf]/feed.json — per-state JSON Feed 1.1.
 */
export async function GET(_req: NextRequest, { params }: Params) {
  const { uf } = await params
  const ufUpper = uf.toUpperCase()
  if (!/^[A-Z]{2}$/.test(ufUpper)) {
    return NextResponse.json({ error: 'bad_uf' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()
  const { data: polIds } = await (supabase.from('politicians') as any)
    .select('id').eq('state', ufUpper).eq('is_active', true)
  const ids = ((polIds ?? []) as { id: string }[]).map((p) => p.id)
  if (ids.length === 0) {
    return NextResponse.json({ error: 'not_found' }, { status: 404 })
  }

  const { data: rows } = await (supabase.from('statements') as any)
    .select('id, slug, summary, full_quote, context, statement_date, created_at, primary_source_url, primary_source_type, venue, event_name, verification_status, severity_score, politicians(common_name, party, state), statement_categories(categories(label_pt))')
    .in('politician_id', ids)
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending: false })
    .limit(50)

  type Row = {
    id: string; slug: string | null; summary: string; full_quote: string | null; context: string | null
    statement_date: string; created_at: string | null; primary_source_url: string | null
    primary_source_type: string | null; venue: string | null; event_name: string | null
    verification_status: string; severity_score: number | null
    politicians: { common_name: string; party: string | null; state: string | null } | null
    statement_categories: Array<{ categories: { label_pt: string } | null }>
  }
  const items = ((rows ?? []) as Row[]).map((s) => ({
    id: s.id,
    slug: s.slug,
    summary: s.summary,
    full_quote: s.full_quote,
    context: s.context,
    statement_date: s.statement_date,
    created_at: s.created_at,
    primary_source_url: s.primary_source_url,
    primary_source_type: s.primary_source_type,
    venue: s.venue,
    event_name: s.event_name,
    verification_status: s.verification_status,
    severity_score: s.severity_score,
    politician_name: s.politicians?.common_name ?? null,
    party: s.politicians?.party ?? null,
    state: s.politicians?.state ?? null,
    category_labels: s.statement_categories.map((sc) => sc.categories?.label_pt).filter((x): x is string => !!x),
  }))

  const feed = buildJsonFeed({
    title: `Registra Brasil — ${ufUpper}`,
    description: `Declarações de políticos de ${ufUpper}.`,
    home_page_url: `${SITE_URL}/estados/${ufUpper.toLowerCase()}`,
    feed_url: `${SITE_URL}/estados/${ufUpper.toLowerCase()}/feed.json`,
    items,
  })
  return new Response(JSON.stringify(feed), { headers: JSON_FEED_HEADERS })
}
