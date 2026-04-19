import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getRecentStatements } from '@/lib/supabase/queries/statements'
import { buildJsonFeed, JSON_FEED_HEADERS } from '@/lib/feeds/json-feed'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /feed.json — JSON Feed 1.1 of the 30 most recent verified
 * statements. Modern alternative to /feed.xml for clients that prefer
 * JSON (NetNewsWire, Feedbin, etc.).
 */
export async function GET() {
  const supabase = getSupabaseServiceClient()
  const statements = await getRecentStatements(supabase, 30)

  const feed = buildJsonFeed({
    title: 'Registra Brasil',
    description: 'Arquivo público de declarações de políticos brasileiros.',
    home_page_url: SITE_URL,
    feed_url: `${SITE_URL}/feed.json`,
    icon: `${SITE_URL}/icon.png`,
    items: statements.map((s) => ({
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
      politician_name: s.politicians.common_name,
      party: s.politicians.party,
      state: s.politicians.state,
      category_labels: s.statement_categories.map((sc) => sc.categories.label_pt),
    })),
  })

  return new Response(JSON.stringify(feed), { headers: JSON_FEED_HEADERS })
}
