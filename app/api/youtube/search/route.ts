import { NextRequest, NextResponse } from 'next/server'
import { searchYouTube } from '@/lib/youtube/client'
import { makeCacheKey, getCachedResults, setCachedResults } from '@/lib/youtube/cache'
import { hasQuotaAvailable, logQuotaUsage, getQuotaRemaining } from '@/lib/youtube/quota'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

export async function GET(req: NextRequest) {
  const q = req.nextUrl.searchParams.get('q')

  if (!q) {
    return NextResponse.json({ error: 'q is required' }, { status: 400 })
  }

  const cacheKey = makeCacheKey(q)

  const cached = await getCachedResults(cacheKey)
  if (cached) {
    return NextResponse.json({
      results: cached,
      fromCache: true,
      quotaRemaining: await getQuotaRemaining(),
    })
  }

  const available = await hasQuotaAvailable(100)
  if (!available) {
    return NextResponse.json(
      { results: [], quotaExhausted: true, quotaRemaining: 0 },
      { status: 429 }
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
    })
  } catch (err) {
    console.error('YouTube search error:', err)
    return NextResponse.json({ error: 'YouTube API error' }, { status: 502 })
  }
}
