import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getPoliticianTimeline } from '@/lib/supabase/queries/timeline'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

interface Params { params: Promise<{ slug: string }> }

/**
 * GET /api/politico/[slug]/timeline.json — chronological timeline for
 * one politician (statements + verification + dispute events) as JSON.
 * ?limite=N (1..200, default 50).
 */
export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'pol-timeline-json'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  const limit = Math.max(1, Math.min(200,
    Number(request.nextUrl.searchParams.get('limite')) || 50))

  const supabase = getSupabaseServiceClient()
  const entries = await getPoliticianTimeline(supabase, slug, limit)
  if (entries.length === 0) {
    return NextResponse.json({ error: 'not_found_or_empty', slug }, { status: 404 })
  }

  return NextResponse.json({
    slug,
    count: entries.length,
    limit,
    events: entries.map((e) => ({
      id: e.id,
      type: e.type,
      date: e.date,
      summary: e.summary,
      politician_name: e.politicianName,
      politician_slug: e.politicianSlug,
      category_label: e.categoryLabel ?? null,
      category_color: e.categoryColor ?? null,
      permalink: `${SITE_URL}/declaracao/${e.id}`,
    })),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=300, s-maxage=600, stale-while-revalidate=3600',
    },
  })
}
