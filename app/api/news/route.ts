import { NextRequest, NextResponse } from 'next/server'
import { searchNews } from '@/lib/search/news'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { createLogger } from '@/lib/utils/logger'

const MAX_Q_LENGTH = 200

export const runtime = 'nodejs'
export const revalidate = 120

const log = createLogger('api/news')

export async function GET(req: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(req, 'news'), { limit: 30, windowMs: 60_000 })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Rate limit exceeded' } },
      {
        status: 429,
        headers: { 'Retry-After': String(Math.ceil((rl.resetAt - Date.now()) / 1000)) },
      }
    )
  }

  const q = req.nextUrl.searchParams.get('q')?.trim()
  if (!q) {
    return NextResponse.json(
      { error: { code: 'INVALID_INPUT', message: 'q is required' } },
      { status: 400 }
    )
  }
  if (q.length > MAX_Q_LENGTH) {
    return NextResponse.json(
      { error: { code: 'INVALID_INPUT', message: `q must be under ${MAX_Q_LENGTH} characters` } },
      { status: 400 }
    )
  }

  try {
    const results = await searchNews(q)
    return NextResponse.json(
      { results },
      {
        headers: {
          'Cache-Control': 'public, s-maxage=120, stale-while-revalidate=600',
          Vary: 'Accept-Encoding',
          'X-Content-Type-Options': 'nosniff',
        },
      }
    )
  } catch (err) {
    log.error('News search failed', { err: err instanceof Error ? err.message : String(err) })
    return NextResponse.json(
      { error: { code: 'NEWS_UPSTREAM_ERROR', message: 'News search failed' } },
      { status: 502, headers: { 'X-Content-Type-Options': 'nosniff' } }
    )
  }
}
