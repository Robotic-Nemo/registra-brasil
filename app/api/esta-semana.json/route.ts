import { NextResponse } from 'next/server'
import { computeWeeklyRecap, currentWeek } from '@/lib/weekly-recap/compute'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/esta-semana.json — machine-readable version of
 * /esta-semana: top statements by severity, top politicians, top
 * categories for the current ISO week.
 */
export async function GET() {
  const { start, end } = currentWeek()
  const recap = await computeWeeklyRecap(start, end)

  return NextResponse.json({
    iso_week: recap.isoWeek,
    week_start: recap.weekStart,
    week_end: recap.weekEnd,
    total_statements: recap.totalStatements,
    top_by_severity: recap.topByseverity.map((s) => ({
      id: s.id,
      slug: s.slug,
      summary: s.summary,
      statement_date: s.statement_date,
      severity_score: s.severity_score,
      politician_slug: s.politician_slug,
      politician_name: s.politician_name,
      permalink: `${SITE_URL}/declaracao/${s.slug ?? s.id}`,
      categories: s.categories.map((c) => ({
        slug: c.slug,
        label: c.label_pt,
        color: c.color_hex,
      })),
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
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
    },
  })
}
