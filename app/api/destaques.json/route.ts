import { NextRequest, NextResponse } from 'next/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { computeMonthlyRecap, currentMonth, isValidMonth, monthLabel } from '@/lib/monthly-recap/compute'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/destaques.json — monthly top-20 recap JSON.
 * Accept `?mes=YYYY-MM` for any archived month, default is current.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'destaques-json'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const monthRaw = request.nextUrl.searchParams.get('mes') ?? currentMonth()
  if (!isValidMonth(monthRaw)) {
    return NextResponse.json({ error: 'mes deve ser YYYY-MM' }, { status: 400 })
  }

  const recap = await computeMonthlyRecap(monthRaw)
  if (!recap) {
    return NextResponse.json({ error: 'Recap indisponível' }, { status: 500 })
  }

  return NextResponse.json({
    month: recap.month,
    label: monthLabel(recap.month),
    start_date: recap.startDate,
    end_date: recap.endDate,
    total_statements: recap.totalStatements,
    top_by_severity: recap.topByseverity.map((s) => ({
      id: s.id,
      slug: s.slug,
      summary: s.summary,
      statement_date: s.statement_date,
      severity_score: s.severity_score,
      politician_slug: s.politician_slug,
      politician_name: s.politician_name,
      categories: s.categories.map((c) => ({ slug: c.slug, label: c.label_pt, color: c.color_hex })),
      permalink: `${SITE_URL}/declaracao/${s.slug ?? s.id}`,
    })),
    top_politicians: recap.topPoliticians.map((p) => ({
      slug: p.slug,
      common_name: p.common_name,
      party: p.party,
      state: p.state,
      count: p.count,
    })),
    top_categories: recap.topCategories.map((c) => ({
      slug: c.slug,
      label: c.label_pt,
      color: c.color_hex,
      count: c.count,
    })),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
    },
  })
}
