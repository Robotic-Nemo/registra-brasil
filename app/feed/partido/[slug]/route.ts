import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { buildRssFeed, rssHeaders } from '@/lib/utils/rss-builder'

export const runtime = 'edge'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /feed/partido/[slug] — RSS feed for a specific political party.
 */
export async function GET(
  _request: NextRequest,
  { params }: { params: Promise<{ slug: string }> }
) {
  const { slug } = await params
  const party = slug.toUpperCase()
  const supabase = getSupabaseServiceClient()

  // Get politicians from this party
  const { data: pols } = await supabase
    .from('politicians')
    .select('id, common_name')
    .eq('party', party)
    .eq('is_active', true)

  if (!pols || pols.length === 0) {
    return NextResponse.json({ error: 'Party not found' }, { status: 404 })
  }

  const polIds = (pols as unknown as { id: string }[]).map(p => p.id)
  const polNames = new Map((pols as unknown as { id: string; common_name: string }[]).map(p => [p.id, p.common_name]))

  const { data: statements } = await supabase
    .from('statements')
    .select('id, summary, full_quote, statement_date, slug, created_at, politician_id')
    .in('politician_id', polIds)
    .eq('verification_status', 'verified')
    .order('statement_date', { ascending: false })
    .limit(30)

  const items = ((statements ?? []) as unknown as {
    id: string; summary: string; full_quote: string | null;
    statement_date: string; slug: string | null; created_at: string;
    politician_id: string
  }[]).map(s => ({
    title: s.summary.slice(0, 120),
    description: s.full_quote ?? s.summary,
    link: `${SITE_URL}/declaracao/${s.slug ?? s.id}`,
    pubDate: s.statement_date,
    author: polNames.get(s.politician_id) ?? party,
  }))

  const xml = buildRssFeed(
    {
      title: `${party} - Registra Brasil`,
      description: `Declaracoes verificadas de politicos do ${party}`,
      link: `${SITE_URL}/partido/${slug}`,
      selfLink: `${SITE_URL}/feed/partido/${slug}`,
      lastBuildDate: items[0]?.pubDate,
      ttl: 60,
    },
    items
  )

  return new NextResponse(xml, { headers: rssHeaders() })
}
