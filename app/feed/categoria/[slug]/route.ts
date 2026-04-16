import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { buildRssFeed, rssHeaders } from '@/lib/utils/rss-builder'

export const runtime = 'edge'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /feed/categoria/[slug] — RSS feed for a specific category.
 */
export async function GET(
  _request: NextRequest,
  { params }: { params: Promise<{ slug: string }> }
) {
  const { slug } = await params
  const supabase = getSupabaseServiceClient()

  const { data: category } = await supabase
    .from('categories')
    .select('id, slug, label_pt, description')
    .eq('slug', slug)
    .single()

  if (!category) {
    return NextResponse.json({ error: 'Category not found' }, { status: 404 })
  }

  const cat = category as unknown as { id: string; slug: string; label_pt: string; description: string | null }

  // Get statement IDs in this category
  const { data: scRows } = await supabase
    .from('statement_categories')
    .select('statement_id')
    .eq('category_id', cat.id)
    .limit(100)

  const stmtIds = (scRows ?? []).map((r: unknown) => (r as { statement_id: string }).statement_id)

  if (stmtIds.length === 0) {
    const xml = buildRssFeed(
      {
        title: `${cat.label_pt} - Registra Brasil`,
        description: cat.description ?? `Declaracoes na categoria ${cat.label_pt}`,
        link: `${SITE_URL}/categoria/${cat.slug}`,
        selfLink: `${SITE_URL}/feed/categoria/${cat.slug}`,
        ttl: 60,
      },
      []
    )
    return new NextResponse(xml, { headers: rssHeaders() })
  }

  const { data: statements } = await supabase
    .from('statements')
    .select(`
      id, summary, full_quote, statement_date, slug, created_at,
      politicians (common_name, party)
    `)
    .in('id', stmtIds)
    .eq('verification_status', 'verified')
    .order('statement_date', { ascending: false })
    .limit(30)

  const items = ((statements ?? []) as unknown as {
    id: string; summary: string; full_quote: string | null;
    statement_date: string; slug: string | null; created_at: string;
    politicians: { common_name: string; party: string }
  }[]).map(s => ({
    title: s.summary.slice(0, 120),
    description: s.full_quote ?? s.summary,
    link: `${SITE_URL}/declaracao/${s.slug ?? s.id}`,
    pubDate: s.statement_date,
    author: s.politicians?.common_name,
    categories: [cat.label_pt],
  }))

  const xml = buildRssFeed(
    {
      title: `${cat.label_pt} - Registra Brasil`,
      description: cat.description ?? `Declaracoes na categoria ${cat.label_pt}`,
      link: `${SITE_URL}/categoria/${cat.slug}`,
      selfLink: `${SITE_URL}/feed/categoria/${cat.slug}`,
      lastBuildDate: items[0]?.pubDate,
      ttl: 60,
    },
    items
  )

  return new NextResponse(xml, { headers: rssHeaders() })
}
