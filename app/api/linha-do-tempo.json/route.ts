import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getGlobalTimeline } from '@/lib/supabase/queries/timeline'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/linha-do-tempo.json — the same chronological event feed
 * rendered at /linha-do-tempo, grouped by YYYY-MM month buckets for
 * easy client-side rendering. ?limite=N (1..200, default 50).
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'timeline-json'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const limit = Math.max(1, Math.min(200,
    Number(request.nextUrl.searchParams.get('limite')) || 50))

  const supabase = getSupabaseServiceClient()
  const entries = await getGlobalTimeline(supabase, limit)

  const months = new Map<string, typeof entries>()
  for (const e of entries) {
    const key = e.date.slice(0, 7)
    const arr = months.get(key) ?? []
    arr.push(e)
    months.set(key, arr)
  }

  return NextResponse.json({
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
    months: [...months.entries()].map(([month, items]) => ({
      month,
      count: items.length,
      event_ids: items.map((i) => i.id),
    })),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=7200',
    },
  })
}
