import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { renderAtomFeed, atomHeaders, type AtomStatement } from '@/lib/feeds/atom'

export const runtime = 'edge'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * Per-category Atom 1.0 feed.
 */
export async function GET(
  _req: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const { slug } = await params
  if (!SLUG_RE.test(slug)) return new Response('bad slug', { status: 400 })

  const supabase = getSupabaseServiceClient()
  const { data: category } = await (supabase.from('categories') as any)
    .select('id, slug, label_pt, description')
    .eq('slug', slug)
    .maybeSingle()
  if (!category) return new Response('not found', { status: 404 })

  const { data: joinRows } = await (supabase.from('statement_categories') as any)
    .select('statements!inner(id, slug, summary, full_quote, context, statement_date, updated_at, primary_source_url, verification_status, venue, event_name, politicians(common_name, party, state))')
    .eq('category_id', category.id)
    .order('statements(statement_date)', { ascending: false })
    .limit(80)

  const statements = ((joinRows ?? []) as Array<{ statements: AtomStatement & { verification_status: string } }>)
    .map((r) => r.statements)
    .filter((s) => s && s.verification_status !== 'removed')
    .slice(0, 50)

  const selfUrl = `${SITE_URL}/categorias/${category.slug}/feed.atom`
  const htmlUrl = `${SITE_URL}/categorias/${category.slug}`

  const atom = renderAtomFeed(statements, {
    id: htmlUrl,
    title: `${category.label_pt} — Registra Brasil`,
    subtitle: category.description ?? `Declarações categorizadas como "${category.label_pt}".`,
    selfUrl,
    htmlUrl,
  })
  return new Response(atom, { headers: atomHeaders() })
}
