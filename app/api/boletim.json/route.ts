import { NextRequest, NextResponse } from 'next/server'
import { buildWeeklyDigest } from '@/lib/newsletter/build-digest'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/boletim.json — current weekly digest contents as JSON.
 * Reuses `buildWeeklyDigest()` so the email that subscribers get and
 * the public preview stay in sync; we omit the rendered HTML and
 * expose the raw ranked item list + ISO Monday anchor instead.
 * ?top=N (3..30, default 10) overrides the digest size.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'boletim-json'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const topN = Math.max(3, Math.min(30,
    Number(request.nextUrl.searchParams.get('top')) || 10))

  try {
    const digest = await buildWeeklyDigest({ topN })
    return NextResponse.json({
      week_of: digest.weekOf,
      subject: digest.subject,
      preview: digest.preview,
      count: digest.items.length,
      items: digest.items.map((it) => ({
        id: it.id,
        slug: it.slug,
        summary: it.summary,
        statement_date: it.statement_date,
        severity_score: it.severity_score,
        score: it.score,
        politician: it.politician,
        permalink: `${SITE_URL}/declaracao/${it.slug ?? it.id}`,
      })),
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
