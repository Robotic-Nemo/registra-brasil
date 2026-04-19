import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { computeScorecard } from '@/lib/politicians/scorecard'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/politico/:slug/stats.json — machine-readable version of
 * the /politico/:slug/scorecard page. Same fields (total, verified
 * count, severity histogram, monthly timeline, top domains, peer
 * ranks, contradictions, fact-checks) via a single JSON payload.
 *
 * Reuses lib/politicians/scorecard.ts so the two stay in sync.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'stats-json'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Too many requests' } },
      { status: 429, headers: { 'Retry-After': String(Math.ceil((rl.resetAt - Date.now()) / 1000)) } },
    )
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()
  const { data: p } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name, party, state, role')
    .eq('slug', slug)
    .maybeSingle()
  if (!p) {
    return NextResponse.json({ error: 'Político não encontrado' }, { status: 404 })
  }

  try {
    const s = await computeScorecard(p.id, p.party, p.state)
    return NextResponse.json({
      politician: {
        slug: p.slug,
        common_name: p.common_name,
        party: p.party,
        state: p.state,
        role: p.role,
        url: `${SITE_URL}/politico/${p.slug}`,
        scorecard_url: `${SITE_URL}/politico/${p.slug}/scorecard`,
      },
      stats: s,
      generated_at: new Date().toISOString(),
    }, {
      headers: {
        'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
      },
    })
  } catch (err) {
    return NextResponse.json(
      { error: err instanceof Error ? err.message : 'internal' },
      { status: 500 },
    )
  }
}
