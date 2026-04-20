import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { countBySeverity } from '@/lib/severity/scoped-counts'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9%A-Z.-]{1,100}$/

/**
 * GET /api/partidos/:slug/severidade.json — severity distribution
 * (5 levels) for statements whose author belongs to this party.
 * Head-count only, five parallel `count=exact,head=true` queries.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'partido-sev'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const party = decodeURIComponent(slug).toUpperCase()

  const supabase = getSupabaseServiceClient()
  const { buckets, total } = await countBySeverity(async (level) => {
    const { count } = await (supabase.from('statements') as any)
      .select('id, politicians!inner(party)', { count: 'exact', head: true })
      .eq('severity_score', level)
      .eq('politicians.party', party)
      .neq('verification_status', 'removed')
    return { count: count as number | null }
  })

  const etag = `W/"sev-partido-${party}-${total}-${buckets.map(b => b.count).join('.')}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    party,
    url: `${SITE_URL}/partidos/${encodeURIComponent(party)}`,
    total,
    buckets,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
