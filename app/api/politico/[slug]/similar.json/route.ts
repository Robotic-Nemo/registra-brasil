import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getSimilarPoliticians } from '@/lib/politicians/similar'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

interface Params { params: Promise<{ slug: string }> }

/**
 * GET /api/politico/[slug]/similar.json — similar-politicians list
 * produced by the `similar_politicians(pid, result_limit)` RPC, which
 * ranks by shared-primary-category overlap.
 * ?limite=N (1..20, default 6).
 */
export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'similar-json'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  const limit = Math.max(1, Math.min(20,
    Number(request.nextUrl.searchParams.get('limite')) || 6))

  const supabase = getSupabaseServiceClient()
  const { data: pol } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name')
    .eq('slug', slug).maybeSingle()
  if (!pol) {
    return NextResponse.json({ error: 'not_found', slug }, { status: 404 })
  }
  const politician = pol as { id: string; slug: string; common_name: string }

  const similar = await getSimilarPoliticians(politician.id, limit)

  return NextResponse.json({
    politician: {
      slug: politician.slug,
      common_name: politician.common_name,
      permalink: `${SITE_URL}/politico/${politician.slug}`,
    },
    similar: similar.map((s) => ({
      slug: s.slug,
      common_name: s.common_name,
      party: s.party,
      state: s.state,
      photo_url: s.photo_url,
      similarity: s.similarity,
      shared_categories: s.shared_categories,
      permalink: `${SITE_URL}/politico/${s.slug}`,
    })),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
    },
  })
}
