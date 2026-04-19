import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { buildJsonFeed, JSON_FEED_HEADERS } from '@/lib/feeds/json-feed'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

interface Params { params: Promise<{ slug: string }> }

/**
 * GET /colecao/[slug]/feed.json — per-collection JSON Feed 1.1 ordered
 * by collection_statements.position (curator-chosen order).
 */
export async function GET(_req: NextRequest, { params }: Params) {
  const { slug } = await params
  const supabase = getSupabaseServiceClient()

  const { data: col } = await (supabase.from('collections') as any)
    .select('id, slug, title, subtitle, description')
    .eq('slug', slug).eq('is_published', true).maybeSingle()
  if (!col) return NextResponse.json({ error: 'not_found' }, { status: 404 })
  const collection = col as { id: string; slug: string; title: string; subtitle: string | null; description: string | null }

  const { data: rows } = await (supabase.from('collection_statements') as any)
    .select('position, statements(id, slug, summary, full_quote, context, statement_date, created_at, primary_source_url, primary_source_type, venue, event_name, verification_status, severity_score, politicians(common_name, party, state), statement_categories(categories(label_pt)))')
    .eq('collection_id', collection.id)
    .order('position', { ascending: true })
    .limit(50)

  type Stmt = {
    id: string; slug: string | null; summary: string; full_quote: string | null; context: string | null
    statement_date: string; created_at: string | null; primary_source_url: string | null
    primary_source_type: string | null; venue: string | null; event_name: string | null
    verification_status: string; severity_score: number | null
    politicians: { common_name: string; party: string | null; state: string | null } | null
    statement_categories: Array<{ categories: { label_pt: string } | null }>
  }
  const items = ((rows ?? []) as Array<{ statements: Stmt | null }>)
    .map((r) => r.statements)
    .filter((s): s is Stmt => !!s)
    .map((s) => ({
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
    title: `${collection.title} — Registra Brasil`,
    description: collection.description ?? collection.subtitle ?? `Coleção editorial: ${collection.title}.`,
    home_page_url: `${SITE_URL}/colecao/${collection.slug}`,
    feed_url: `${SITE_URL}/colecao/${collection.slug}/feed.json`,
    items,
  })
  return new Response(JSON.stringify(feed), { headers: JSON_FEED_HEADERS })
}
