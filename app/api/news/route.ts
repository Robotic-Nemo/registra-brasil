import { NextRequest, NextResponse } from 'next/server'
import { searchNews } from '@/lib/search/news'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 120

export async function GET(req: NextRequest) {
  const { allowed } = checkRateLimit(getRateLimitKey(req, 'news'), { limit: 30, windowMs: 60_000 })
  if (!allowed) {
    return NextResponse.json({ error: 'Rate limit exceeded' }, { status: 429 })
  }

  const q = req.nextUrl.searchParams.get('q')
  if (!q) return NextResponse.json({ error: 'q is required' }, { status: 400 })
  if (q.length > 200) return NextResponse.json({ error: 'q must be under 200 characters' }, { status: 400 })

  try {
    const results = await searchNews(q)
    return NextResponse.json({ results }, {
      headers: {
        'Cache-Control': 'public, s-maxage=120, stale-while-revalidate=60',
      },
    })
  } catch (err) {
    console.error('News search error:', err)
    return NextResponse.json({ error: 'News search failed' }, { status: 502 })
  }
}
