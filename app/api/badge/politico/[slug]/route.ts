import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { renderBadge, badgeHeaders, isHexColor } from '@/lib/badges/shields'

export const runtime = 'edge'
export const revalidate = 3600

const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/badge/politico/:slug — shields.io-style SVG badge for
 * a politician showing verified statement count.
 *   ?color=#hex (default #d97706)
 *   ?label=custom left label
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'badge-politico'), {
    limit: 120, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const { slug } = await params
  if (!SLUG_RE.test(slug)) return new Response('slug inválido', { status: 400 })

  const sp = request.nextUrl.searchParams
  const colorRaw = sp.get('color') ?? '#d97706'
  const color = isHexColor(colorRaw) ? colorRaw : '#d97706'
  const label = (sp.get('label') ?? 'Registra Brasil').slice(0, 40)

  const supabase = getSupabaseServiceClient()
  const { data: p } = await (supabase.from('politicians') as any)
    .select('id, common_name')
    .eq('slug', slug)
    .maybeSingle()
  if (!p) return new Response(renderBadge(label, 'não encontrado', '#6b7280'), badgeHeaders())

  const { count } = await (supabase.from('statements') as any)
    .select('id', { count: 'exact', head: true })
    .eq('politician_id', p.id)
    .eq('verification_status', 'verified')

  return new Response(renderBadge(label, `${count ?? 0} declarações`, color), badgeHeaders())
}
