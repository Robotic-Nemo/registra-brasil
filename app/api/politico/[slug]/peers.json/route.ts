import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/politico/:slug/peers.json — peer cohorts for one
 * politician: same party, same state, and same party+state. For
 * each cohort returns top-N by verified statement count so the
 * caller can show "compare with peers" lists.
 *   ?limite=1..20 (default 8)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'peers'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const limit = Math.max(1, Math.min(20, Number(request.nextUrl.searchParams.get('limite')) || 8))

  const supabase = getSupabaseServiceClient()
  const { data: p } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name, party, state')
    .eq('slug', slug)
    .maybeSingle()
  if (!p) {
    return NextResponse.json({ error: 'Político não encontrado' }, { status: 404 })
  }

  type Politician = { id: string; slug: string; common_name: string; party: string | null; state: string | null }

  const build = () => (supabase.from('politicians') as any)
    .select('id, slug, common_name, party, state')
    .eq('is_active', true)
    .neq('id', p.id)

  const [sameParty, sameState, sameBoth] = await Promise.all([
    p.party
      ? build().eq('party', p.party).limit(60)
      : Promise.resolve({ data: [] as Politician[] }),
    p.state
      ? build().eq('state', p.state).limit(60)
      : Promise.resolve({ data: [] as Politician[] }),
    p.party && p.state
      ? build().eq('party', p.party).eq('state', p.state).limit(60)
      : Promise.resolve({ data: [] as Politician[] }),
  ])

  const pool = new Map<string, Politician>()
  for (const arr of [sameParty.data, sameState.data, sameBoth.data]) {
    for (const pol of ((arr ?? []) as Politician[])) pool.set(pol.id, pol)
  }
  const ids = [...pool.keys()]

  // Verified statement counts per peer in one go (capped aggregation).
  const counts = new Map<string, number>()
  if (ids.length > 0) {
    const { data: stmtRows } = await (supabase.from('statements') as any)
      .select('politician_id')
      .eq('verification_status', 'verified')
      .in('politician_id', ids)
      .limit(20000)
    for (const r of ((stmtRows ?? []) as Array<{ politician_id: string }>)) {
      counts.set(r.politician_id, (counts.get(r.politician_id) ?? 0) + 1)
    }
  }

  const shape = (pols: Politician[]) =>
    pols
      .map((pp) => ({
        slug: pp.slug,
        common_name: pp.common_name,
        party: pp.party,
        state: pp.state,
        verified_count: counts.get(pp.id) ?? 0,
        url: `${SITE_URL}/politico/${pp.slug}`,
      }))
      .sort((a, b) => b.verified_count - a.verified_count)
      .slice(0, limit)

  return NextResponse.json({
    politician: {
      slug: p.slug, common_name: p.common_name, party: p.party, state: p.state,
      url: `${SITE_URL}/politico/${p.slug}`,
    },
    same_party: shape(((sameParty.data ?? []) as Politician[])),
    same_state: shape(((sameState.data ?? []) as Politician[])),
    same_party_and_state: shape(((sameBoth.data ?? []) as Politician[])),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
    },
  })
}
