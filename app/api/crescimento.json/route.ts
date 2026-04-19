import { NextRequest, NextResponse } from 'next/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { getArchiveGrowth } from '@/lib/growth/queries'

export const runtime = 'nodejs'
export const revalidate = 3600

/**
 * GET /api/crescimento.json — monthly cumulative growth of the
 * archive (declarations / politicians / categories). ?meses=N
 * window (12..120, default 36).
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'growth-json'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const mesesRaw = Number(request.nextUrl.searchParams.get('meses')) || 36
  const meses = Math.max(12, Math.min(120, mesesRaw))

  try {
    const rows = await getArchiveGrowth(meses)
    return NextResponse.json({
      months_back: meses,
      count: rows.length,
      series: rows,
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
