import { NextRequest, NextResponse } from 'next/server'
import { unifiedSearch } from '@/lib/search/unified'
import type { SearchParams } from '@/types/search'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

export async function GET(req: NextRequest) {
  const sp = req.nextUrl.searchParams

  const params: SearchParams = {
    q: sp.get('q') ?? undefined,
    categoria: sp.getAll('categoria').filter(Boolean),
    partido: sp.get('partido') ?? undefined,
    estado: sp.get('estado') ?? undefined,
    politico: sp.get('politico') ?? undefined,
    de: sp.get('de') ?? undefined,
    ate: sp.get('ate') ?? undefined,
    status: (sp.get('status') as SearchParams['status']) ?? undefined,
    fonte: (sp.get('fonte') as SearchParams['fonte']) ?? 'todos',
    page: sp.get('page') ? Number(sp.get('page')) : 1,
    limit: sp.get('limit') ? Math.min(Number(sp.get('limit')), 50) : 20,
  }

  try {
    const result = await unifiedSearch(params)
    return NextResponse.json(result)
  } catch (err) {
    console.error('Search error:', err)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
