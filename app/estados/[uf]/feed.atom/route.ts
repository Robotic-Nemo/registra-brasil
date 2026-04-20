import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { renderAtomFeed, atomHeaders, type AtomStatement } from '@/lib/feeds/atom'

export const runtime = 'edge'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const UF_RE = /^[a-z]{2}$/i

/**
 * Per-state (UF) Atom 1.0 feed.
 */
export async function GET(
  _req: NextRequest,
  { params }: { params: Promise<{ uf: string }> },
) {
  const { uf: raw } = await params
  if (!UF_RE.test(raw)) return new Response('bad uf', { status: 400 })
  const uf = raw.toUpperCase()

  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('statements') as any)
    .select('id, slug, summary, full_quote, context, statement_date, updated_at, primary_source_url, verification_status, venue, event_name, politicians!inner(common_name, party, state)')
    .eq('politicians.state', uf)
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending: false })
    .limit(50)

  const statements = (data ?? []) as AtomStatement[]
  const selfUrl = `${SITE_URL}/estados/${uf.toLowerCase()}/feed.atom`
  const htmlUrl = `${SITE_URL}/estados/${uf.toLowerCase()}`

  const atom = renderAtomFeed(statements, {
    id: htmlUrl,
    title: `${uf} — Registra Brasil`,
    subtitle: `Declarações de políticos de ${uf}.`,
    selfUrl,
    htmlUrl,
  })
  return new Response(atom, { headers: atomHeaders() })
}
