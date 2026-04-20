import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/estatisticas/resumo.json — headline numbers for a home /
 * status dashboard: lifetime total + rolling 24h/7d/30d counts +
 * lifetime status split. Five parallel `head:true` head-counts, no
 * row payload — safe to poll frequently from a TV dashboard.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estat-resumo'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const supabase = getSupabaseServiceClient()
  const now = Date.now()
  const d24 = new Date(now - 86400_000).toISOString()
  const d7 = new Date(now - 7 * 86400_000).toISOString()
  const d30 = new Date(now - 30 * 86400_000).toISOString()

  const base = () => (supabase.from('statements') as any)
    .select('id', { count: 'exact', head: true })
    .neq('verification_status', 'removed')

  const [total, last24h, last7d, last30d, verified, disputed] = await Promise.all([
    base(),
    base().gte('created_at', d24),
    base().gte('created_at', d7),
    base().gte('created_at', d30),
    base().eq('verification_status', 'verified'),
    base().eq('verification_status', 'disputed'),
  ])

  const t = Number(total.count ?? 0)
  const v = Number(verified.count ?? 0)
  const d = Number(disputed.count ?? 0)

  const body = {
    total: t,
    last_24h: Number(last24h.count ?? 0),
    last_7d: Number(last7d.count ?? 0),
    last_30d: Number(last30d.count ?? 0),
    verified: v,
    disputed: d,
    unverified: Math.max(0, t - v - d),
    ratio_verified: t > 0 ? +(v / t).toFixed(3) : null,
    ratio_disputed: t > 0 ? +(d / t).toFixed(3) : null,
    site: SITE_URL,
    generated_at: new Date().toISOString(),
  }

  const etag = `W/"estat-resumo-${t}-${body.last_24h}-${body.last_7d}-${body.last_30d}-${v}-${d}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json(body, {
    headers: {
      'Cache-Control': 'public, max-age=300, s-maxage=600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
