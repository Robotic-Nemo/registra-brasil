import { NextRequest, NextResponse } from 'next/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { listEvents, kindLabel } from '@/lib/agenda/queries'

export const runtime = 'nodejs'
export const revalidate = 600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/agenda.json — political events as JSON.
 *
 * Query params:
 *   ?escopo=upcoming (default) | past | all
 *   ?limite=N (1..200, default 50)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'agenda-json'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const scopeRaw = request.nextUrl.searchParams.get('escopo') ?? 'upcoming'
  const scope: 'upcoming' | 'past' | 'all' =
    scopeRaw === 'past' || scopeRaw === 'all' ? scopeRaw : 'upcoming'
  const lim = Math.max(1, Math.min(200, Number(request.nextUrl.searchParams.get('limite')) || 50))

  const events = await listEvents(scope, lim)
  return NextResponse.json({
    scope,
    count: events.length,
    events: events.map((e) => ({
      id: e.id,
      title: e.title,
      summary: e.summary,
      body: e.body,
      event_date: e.event_date,
      event_end_date: e.event_end_date,
      location: e.location,
      source_url: e.source_url,
      kind: e.kind,
      kind_label: kindLabel(e.kind),
      politician: e.politician ? {
        slug: e.politician.slug,
        common_name: e.politician.common_name,
        url: `${SITE_URL}/politico/${e.politician.slug}`,
      } : null,
      url: `${SITE_URL}/agenda#${e.id}`,
    })),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=300, s-maxage=600, stale-while-revalidate=1800',
    },
  })
}
