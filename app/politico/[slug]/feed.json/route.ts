import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { buildJsonFeed, JSON_FEED_HEADERS } from '@/lib/feeds/json-feed'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

interface Params { params: Promise<{ slug: string }> }

/**
 * GET /politico/[slug]/feed.json — JSON Feed 1.1 mirror of the
 * per-politician RSS, for subscribers preferring JSON over XML.
 */
export async function GET(_req: NextRequest, { params }: Params) {
  const { slug } = await params
  const supabase = getSupabaseServiceClient()

  const { data: pol } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name, party, state')
    .eq('slug', slug).maybeSingle()
  if (!pol) return NextResponse.json({ error: 'not_found' }, { status: 404 })
  const politician = pol as { id: string; slug: string; common_name: string; party: string | null; state: string | null }

  const { data: rows } = await (supabase.from('statements') as any)
    .select('id, slug, summary, full_quote, context, statement_date, created_at, primary_source_url, primary_source_type, venue, event_name, verification_status, severity_score, statement_categories(categories(label_pt))')
    .eq('politician_id', politician.id)
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending: false })
    .limit(50)

  type Row = {
    id: string; slug: string | null; summary: string; full_quote: string | null; context: string | null
    statement_date: string; created_at: string | null; primary_source_url: string | null
    primary_source_type: string | null; venue: string | null; event_name: string | null
    verification_status: string; severity_score: number | null
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
    politician_name: politician.common_name,
    party: politician.party,
    state: politician.state,
    category_labels: s.statement_categories
      .map((sc) => sc.categories?.label_pt)
      .filter((x): x is string => !!x),
  }))

  const feed = buildJsonFeed({
    title: `Registra Brasil — ${politician.common_name}`,
    description: `Declarações registradas de ${politician.common_name}${politician.party ? ` (${politician.party}${politician.state ? '-' + politician.state : ''})` : ''}.`,
    home_page_url: `${SITE_URL}/politico/${politician.slug}`,
    feed_url: `${SITE_URL}/politico/${politician.slug}/feed.json`,
    items,
  })

  return new Response(JSON.stringify(feed), { headers: JSON_FEED_HEADERS })
}
