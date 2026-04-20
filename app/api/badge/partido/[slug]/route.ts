import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { renderBadge, badgeHeaders, isHexColor } from '@/lib/badges/shields'

export const runtime = 'edge'
export const revalidate = 3600

/**
 * GET /api/badge/partido/:slug — shields.io-style SVG badge for
 * a party. Shows verified statement count by default, or
 * `?metric=politicos` to show active politician count.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'badge-partido'), {
    limit: 120, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const { slug } = await params
  const party = decodeURIComponent(slug)
  if (!party || party.length > 30) return new Response('bad party', { status: 400 })

  const sp = request.nextUrl.searchParams
  const colorRaw = sp.get('color') ?? '#d97706'
  const color = isHexColor(colorRaw) ? colorRaw : '#d97706'
  const label = (sp.get('label') ?? party).slice(0, 40)
  const metric = sp.get('metric') === 'politicos' ? 'politicos' : 'declaracoes'

  const supabase = getSupabaseServiceClient()

  if (metric === 'politicos') {
    const { count } = await (supabase.from('politicians') as any)
      .select('id', { count: 'exact', head: true })
      .eq('party', party)
      .eq('is_active', true)
    return new Response(renderBadge(label, `${count ?? 0} políticos`, color), badgeHeaders())
  }

  // Default: verified statements via inner join on party.
  const { count } = await (supabase.from('statements') as any)
    .select('id, politicians!inner(party, is_active)', { count: 'exact', head: true })
    .eq('verification_status', 'verified')
    .eq('politicians.party', party)
    .eq('politicians.is_active', true)
  return new Response(renderBadge(label, `${count ?? 0} declarações`, color), badgeHeaders())
}
