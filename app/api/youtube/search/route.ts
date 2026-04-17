import { NextRequest, NextResponse } from 'next/server'
import { searchYouTube } from '@/lib/youtube/client'
import { makeCacheKey, getCachedResults, setCachedResults } from '@/lib/youtube/cache'
import { hasQuotaAvailable, logQuotaUsage, getQuotaRemaining } from '@/lib/youtube/quota'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { createLogger } from '@/lib/utils/logger'

const MAX_Q_LENGTH = 200
const YOUTUBE_SEARCH_QUOTA_COST = 100

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

const log = createLogger('api/youtube/search')

export async function GET(req: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(req, 'youtube-search'), { limit: 20, windowMs: 60_000 })
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

  const cacheKey = makeCacheKey(q)

  const cached = await getCachedResults(cacheKey)
  if (cached) {
    return NextResponse.json({
      results: cached,
      fromCache: true,
      quotaRemaining: await getQuotaRemaining(),
    }, {
      headers: {
        'Cache-Control': 'public, s-maxage=600, stale-while-revalidate=300',
        'X-Content-Type-Options': 'nosniff',
      },
    })
  }

  const available = await hasQuotaAvailable(YOUTUBE_SEARCH_QUOTA_COST)
  if (!available) {
    return NextResponse.json(
      { results: [], quotaExhausted: true, quotaRemaining: 0 },
      { status: 429, headers: { 'Retry-After': '3600' } }
    )
  }

  try {
    const { results, quotaCost } = await searchYouTube(q)
    await Promise.all([
      setCachedResults(cacheKey, q, results, quotaCost),
      logQuotaUsage('search.list', quotaCost, q),
    ])

    return NextResponse.json({
      results,
      fromCache: false,
      quotaRemaining: await getQuotaRemaining(),
    }, {
      headers: {
        'Cache-Control': 'public, s-maxage=600, stale-while-revalidate=300',
        'X-Content-Type-Options': 'nosniff',
      },
    })
  } catch (err) {
    log.error('YouTube search failed', { err: err instanceof Error ? err.message : String(err) })
    return NextResponse.json(
      { error: { code: 'YOUTUBE_UPSTREAM_ERROR', message: 'YouTube API error' } },
      { status: 502, headers: { 'X-Content-Type-Options': 'nosniff' } }
    )
  }
}
