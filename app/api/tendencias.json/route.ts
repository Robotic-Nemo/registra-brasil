import { NextRequest, NextResponse } from 'next/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { getArchiveMonthlyTotals, getCategoryTrends } from '@/lib/trends/queries'

export const runtime = 'nodejs'
export const revalidate = 3600

/**
 * GET /api/tendencias.json — monthly totals + per-category timeseries
 * for the configurable window (12..60 months, default 24).
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'trends-json'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const janelaRaw = Number(request.nextUrl.searchParams.get('janela')) || 24
  const janela = Math.max(12, Math.min(60, janelaRaw))

  try {
    const [totals, categories] = await Promise.all([
      getArchiveMonthlyTotals(janela),
      getCategoryTrends(janela),
    ])
    return NextResponse.json({
      window_months: janela,
      totals,
      categories: categories.map((c) => ({
        id: c.id,
        slug: c.slug,
        label: c.label,
        color: c.color,
        total: c.total,
        recent: c.recent,
        prior: c.prior,
        delta_pct: c.prior === 0 ? null : Math.round(((c.recent - c.prior) / c.prior) * 100),
        points: c.points,
      })),
      generated_at: new Date().toISOString(),
    }, {
      headers: {
        'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      },
    })
  } catch (err) {
    return NextResponse.json(
      { error: err instanceof Error ? err.message : 'internal' },
      { status: 500 },
    )
  }
}
