import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { buildRssFeed, rssHeaders } from '@/lib/utils/rss-builder'

export const runtime = 'edge'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /feed/politico/[slug] — RSS feed for a specific politician's statements.
 */
export async function GET(
  _request: NextRequest,
  { params }: { params: Promise<{ slug: string }> }
) {
  const { slug } = await params
  const supabase = getSupabaseServiceClient()

  // Get politician
  const { data: politician } = await supabase
    .from('politicians')
    .select('id, slug, common_name, full_name, party, state')
    .eq('slug', slug)
    .single()

  if (!politician) {
    return NextResponse.json({ error: 'Politician not found' }, { status: 404 })
  }

  const pol = politician as unknown as { id: string; slug: string; common_name: string; full_name: string; party: string; state: string }

  // Get recent statements
  const { data: statements } = await supabase
    .from('statements')
    .select(`
      id, summary, full_quote, statement_date, slug, created_at,
      statement_categories (categories (label_pt))
    `)
    .eq('politician_id', pol.id)
    .eq('verification_status', 'verified')
    .order('statement_date', { ascending: false })
    .limit(30)

  const items = ((statements ?? []) as unknown as {
    id: string; summary: string; full_quote: string | null;
    statement_date: string; slug: string | null; created_at: string;
    statement_categories: { categories: { label_pt: string } }[]
  }[]).map(s => ({
    title: s.summary.slice(0, 120),
    description: s.full_quote ?? s.summary,
    link: `${SITE_URL}/declaracao/${s.slug ?? s.id}`,
    pubDate: s.statement_date,
    author: pol.common_name,
    categories: s.statement_categories?.map(sc => sc.categories?.label_pt).filter(Boolean) ?? [],
  }))

  const xml = buildRssFeed(
    {
      title: `${pol.common_name} (${pol.party}) - Registra Brasil`,
      description: `Declaracoes verificadas de ${pol.common_name}`,
      link: `${SITE_URL}/politico/${pol.slug}`,
      selfLink: `${SITE_URL}/feed/politico/${pol.slug}`,
      lastBuildDate: items[0]?.pubDate,
      ttl: 60,
    },
    items
  )

  return new NextResponse(xml, { headers: rssHeaders() })
}
