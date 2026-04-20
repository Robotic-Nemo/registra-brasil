import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { renderAtomFeed, atomHeaders, type AtomStatement } from '@/lib/feeds/atom'

export const runtime = 'edge'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * Per-party Atom 1.0 feed. Uses a single `politicians!inner` join
 * filter instead of the two-step "fetch all IDs, then IN()" pattern
 * of the RSS sibling — faster, and no URL-length blowup for large
 * parties.
 */
export async function GET(
  _req: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const { slug } = await params
  const party = decodeURIComponent(slug)
  if (!party || party.length > 30) return new Response('bad party', { status: 400 })

  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('statements') as any)
    .select('id, slug, summary, full_quote, context, statement_date, updated_at, primary_source_url, verification_status, venue, event_name, politicians!inner(common_name, party, state, is_active)')
    .eq('politicians.party', party)
    .eq('politicians.is_active', true)
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending: false })
    .limit(50)

  const statements = (data ?? []) as AtomStatement[]
  const selfUrl = `${SITE_URL}/partidos/${encodeURIComponent(party)}/feed.atom`
  const htmlUrl = `${SITE_URL}/partidos/${encodeURIComponent(party)}`

  const atom = renderAtomFeed(statements, {
    id: htmlUrl,
    title: `${party} — Registra Brasil`,
    subtitle: `Declarações de políticos filiados ao ${party}.`,
    selfUrl,
    htmlUrl,
  })
  return new Response(atom, { headers: atomHeaders() })
}
