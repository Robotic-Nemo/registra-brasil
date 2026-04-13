import { NextRequest, NextResponse } from 'next/server'
import { searchNews } from '@/lib/search/news'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

export async function GET(req: NextRequest) {
  const q = req.nextUrl.searchParams.get('q')
  if (!q) return NextResponse.json({ error: 'q is required' }, { status: 400 })

  try {
    const results = await searchNews(q)
    return NextResponse.json({ results })
  } catch (err) {
    console.error('News search error:', err)
    return NextResponse.json({ error: 'News search failed' }, { status: 502 })
  }
}
