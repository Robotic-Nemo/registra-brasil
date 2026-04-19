import { NextRequest, NextResponse } from 'next/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { getStateCategoryMatrix } from '@/lib/analysis/state-category'

export const runtime = 'nodejs'
export const revalidate = 3600

/**
 * GET /api/analise/estados-x-categorias.json — UF × category heatmap as
 * a dense JSON matrix. ?estados=N (5..27, default 27), ?categorias=M
 * (5..20, default 12), ?normalizar=1 to emit per-state percentages.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'analise-sc-json'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const stateLimit = Math.max(5, Math.min(27,
    Number(request.nextUrl.searchParams.get('estados')) || 27))
  const catLimit = Math.max(5, Math.min(20,
    Number(request.nextUrl.searchParams.get('categorias')) || 12))
  const normalize = request.nextUrl.searchParams.get('normalizar') === '1'

  try {
    const m = await getStateCategoryMatrix(stateLimit, catLimit)

    const rows = m.states.map((s) => ({
      state: s.state,
      total: s.total,
      cells: m.categories.map((c) => {
        const count = m.cells.get(`${s.state}::${c.id}`) ?? 0
        const pct = normalize && s.total > 0
          ? Math.round((count / s.total) * 1000) / 10
          : null
        return { category_id: c.id, category_slug: c.slug, count, pct }
      }),
    }))

    return NextResponse.json({
      states: m.states,
      categories: m.categories,
      max: m.max,
      normalize,
      rows,
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
