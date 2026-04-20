import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { renderBadge, badgeHeaders, isHexColor } from '@/lib/badges/shields'

export const runtime = 'edge'
export const revalidate = 3600

const UF_RE = /^[a-z]{2}$/i

/**
 * GET /api/badge/estado/:uf — shields.io-style SVG badge for
 * a state (UF). Shows verified statement count, or
 * `?metric=politicos` for active politician count.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ uf: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'badge-estado'), {
    limit: 120, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const { uf: raw } = await params
  if (!UF_RE.test(raw)) return new Response('bad uf', { status: 400 })
  const uf = raw.toUpperCase()

  const sp = request.nextUrl.searchParams
  const colorRaw = sp.get('color') ?? '#d97706'
  const color = isHexColor(colorRaw) ? colorRaw : '#d97706'
  const label = (sp.get('label') ?? uf).slice(0, 40)
  const metric = sp.get('metric') === 'politicos' ? 'politicos' : 'declaracoes'

  const supabase = getSupabaseServiceClient()

  if (metric === 'politicos') {
    const { count } = await (supabase.from('politicians') as any)
      .select('id', { count: 'exact', head: true })
      .eq('state', uf)
      .eq('is_active', true)
    return new Response(renderBadge(label, `${count ?? 0} políticos`, color), badgeHeaders())
  }

  const { count } = await (supabase.from('statements') as any)
    .select('id, politicians!inner(state)', { count: 'exact', head: true })
    .eq('verification_status', 'verified')
    .eq('politicians.state', uf)
  return new Response(renderBadge(label, `${count ?? 0} declarações`, color), badgeHeaders())
}
