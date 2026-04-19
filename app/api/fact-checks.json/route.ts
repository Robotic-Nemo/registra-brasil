import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { RATING_LABELS } from '@/lib/fact-checks/outlets'

export const runtime = 'nodejs'
export const revalidate = 900

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/fact-checks.json — external fact-check cross-references
 * from `statement_fact_checks`. Supports ?rating=<id>&limite=N.
 * Returns a rating_counts aggregate for UI filtering.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'fc-json'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const rating = request.nextUrl.searchParams.get('rating') ?? undefined
  const lim = Math.max(1, Math.min(200, Number(request.nextUrl.searchParams.get('limite')) || 50))

  const supabase = getSupabaseServiceClient()

  let q = (supabase.from('statement_fact_checks') as any)
    .select(`
      id, outlet, outlet_label, url, title, rating, rating_label, published_at,
      statements!inner ( id, slug, summary, politicians ( slug, common_name ) )
    `)
    .order('created_at', { ascending: false })
    .limit(lim)
  if (rating) q = q.eq('rating', rating)

  const [listRes, countRes] = await Promise.all([
    q,
    (supabase.from('statement_fact_checks') as any)
      .select('rating')
      .limit(20000),
  ])

  type Row = {
    id: string; outlet: string; outlet_label: string; url: string
    title: string | null; rating: string | null; rating_label: string | null
    published_at: string | null
    statements: {
      id: string; slug: string | null; summary: string
      politicians: { slug: string; common_name: string } | null
    } | null
  }
  const rows = ((listRes.data ?? []) as Row[]).filter((r) => r.statements)

  const counts = new Map<string, number>()
  for (const r of ((countRes.data ?? []) as Array<{ rating: string | null }>)) {
    const key = r.rating ?? 'unrated'
    counts.set(key, (counts.get(key) ?? 0) + 1)
  }

  return NextResponse.json({
    count: rows.length,
    filter_rating: rating ?? null,
    rating_counts: [...counts.entries()].map(([r, c]) => ({
      rating: r,
      label: RATING_LABELS[r] ?? r,
      total: c,
    })),
    results: rows.map((r) => {
      const s = r.statements!
      return {
        id: r.id,
        outlet: r.outlet,
        outlet_label: r.outlet_label,
        title: r.title,
        url: r.url,
        rating: r.rating,
        rating_label: r.rating_label ?? (r.rating ? RATING_LABELS[r.rating] : null),
        published_at: r.published_at,
        statement: {
          id: s.id,
          slug: s.slug,
          summary: s.summary,
          politician_slug: s.politicians?.slug,
          politician_name: s.politicians?.common_name,
          permalink: `${SITE_URL}/declaracao/${s.slug ?? s.id}`,
        },
      }
    }),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=600, s-maxage=900, stale-while-revalidate=3600',
    },
  })
}
