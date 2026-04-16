import { NextRequest, NextResponse } from 'next/server'
import { unifiedSearch } from '@/lib/search/unified'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import type { SearchParams } from '@/types/search'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

export async function GET(req: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(req, 'search'), { limit: 30, windowMs: 60_000 })
  if (!rl.allowed) {
    return NextResponse.json({ error: 'Too many requests' }, {
      status: 429,
      headers: { 'Retry-After': String(Math.ceil((rl.resetAt - Date.now()) / 1000)) },
    })
  }
  const sp = req.nextUrl.searchParams

  const params: SearchParams = {
    q: sp.get('q') ?? undefined,
    categoria: sp.getAll('categoria').filter(Boolean),
    partido: sp.get('partido') ?? undefined,
    estado: sp.get('estado') ?? undefined,
    politico: sp.get('politico') ?? undefined,
    de: sp.get('de') ?? undefined,
    ate: sp.get('ate') ?? undefined,
    status: sp.get('status') && ['verified','unverified','disputed','removed'].includes(sp.get('status')!)
      ? (sp.get('status') as SearchParams['status'])
      : undefined,
    fonte: sp.get('fonte') && ['curado','ao-vivo','todos'].includes(sp.get('fonte')!)
      ? (sp.get('fonte') as SearchParams['fonte'])
      : 'todos',
    page: Math.max(1, parseInt(sp.get('page') ?? '1', 10) || 1),
    limit: Math.min(Math.max(1, parseInt(sp.get('limit') ?? '20', 10) || 20), 50),
  }

  try {
    const result = await unifiedSearch(params)
    return NextResponse.json(result, {
      headers: {
        'Cache-Control': 'public, s-maxage=60, stale-while-revalidate=300',
        'Vary': 'Accept-Encoding',
        'X-Response-Time': `${Date.now()}`,
      },
    })
  } catch (err) {
    console.error('Search error:', err)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
