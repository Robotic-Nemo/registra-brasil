import { NextRequest, NextResponse } from 'next/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { getPartyCategoryMatrix } from '@/lib/analysis/party-category'

export const runtime = 'nodejs'
export const revalidate = 3600

/**
 * GET /api/analise/partidos-x-categorias.json — party × category heatmap
 * as a dense JSON matrix. ?partidos=N (5..30, default 15),
 * ?categorias=M (5..20, default 12), ?normalizar=1 to emit per-party
 * percentages instead of raw counts.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'analise-pc-json'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const partyLimit = Math.max(5, Math.min(30,
    Number(request.nextUrl.searchParams.get('partidos')) || 15))
  const catLimit = Math.max(5, Math.min(20,
    Number(request.nextUrl.searchParams.get('categorias')) || 12))
  const normalize = request.nextUrl.searchParams.get('normalizar') === '1'

  try {
    const m = await getPartyCategoryMatrix(partyLimit, catLimit)

    const rows = m.parties.map((p) => ({
      party: p.party,
      total: p.total,
      cells: m.categories.map((c) => {
        const count = m.cells.get(`${p.party}::${c.id}`) ?? 0
        const pct = normalize && p.total > 0
          ? Math.round((count / p.total) * 1000) / 10
          : null
        return { category_id: c.id, category_slug: c.slug, count, pct }
      }),
    }))

    return NextResponse.json({
      parties: m.parties,
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
