import { NextRequest, NextResponse } from 'next/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { statementsOnDayOfYear, parseDateParam, todayDateLabel } from '@/lib/on-this-day/queries'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/hoje-na-historia.json — today's MM-DD matches from every
 * year. Accept ?data=MM-DD to look up any day of the year; default
 * is today.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'onthisday-json'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const raw = request.nextUrl.searchParams.get('data')
  let month: number
  let day: number
  if (raw) {
    const parsed = parseDateParam(raw)
    if (!parsed) {
      return NextResponse.json({ error: 'data deve ser MM-DD' }, { status: 400 })
    }
    month = parsed.month
    day = parsed.day
  } else {
    const now = new Date()
    month = now.getUTCMonth() + 1
    day = now.getUTCDate()
  }

  const rows = await statementsOnDayOfYear(month, day, 200)
  return NextResponse.json({
    date: `${String(month).padStart(2, '0')}-${String(day).padStart(2, '0')}`,
    label: todayDateLabel(month, day),
    count: rows.length,
    results: rows.map((r) => ({
      id: r.id,
      slug: r.slug,
      summary: r.summary,
      statement_date: r.statement_date,
      severity_score: r.severity_score,
      verification_status: r.verification_status,
      permalink: `${SITE_URL}/declaracao/${r.slug ?? r.id}`,
      politician: {
        slug: r.politician_slug,
        common_name: r.politician_name,
        party: r.politician_party,
        state: r.politician_state,
      },
    })),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=7200',
    },
  })
}
