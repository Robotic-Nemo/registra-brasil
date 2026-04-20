import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { countBySeverity } from '@/lib/severity/scoped-counts'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const UF_RE = /^[A-Za-z]{2}$/

/**
 * GET /api/estados/:uf/severidade.json — severity distribution (5
 * levels) scoped to politicians from a single UF. Five parallel head
 * counts.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ uf: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estado-sev'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { uf: ufRaw } = await params
  if (!UF_RE.test(ufRaw)) {
    return NextResponse.json({ error: 'UF inválida' }, { status: 400 })
  }
  const uf = ufRaw.toUpperCase()

  const supabase = getSupabaseServiceClient()
  const { buckets, total } = await countBySeverity(async (level) => {
    const { count } = await (supabase.from('statements') as any)
      .select('id, politicians!inner(state)', { count: 'exact', head: true })
      .eq('severity_score', level)
      .eq('politicians.state', uf)
      .neq('verification_status', 'removed')
    return { count: count as number | null }
  })

  const etag = `W/"sev-estado-${uf}-${total}-${buckets.map(b => b.count).join('.')}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    uf,
    url: `${SITE_URL}/estados/${uf}`,
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
