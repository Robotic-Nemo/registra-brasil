import { NextRequest, NextResponse } from 'next/server'
import { searchStatements } from '@/lib/supabase/queries/statements'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { parseSearchParams } from '@/lib/utils/validate-search-params'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/search.json — JSON response for the same querystring
 * accepted by /buscar and /api/saved-search/feed.xml. Up to 100
 * results per call; pageable via ?page=.
 *
 * Complements /api/search (v1) and /api/v2/search by exposing a
 * thinner payload suited for dashboards / data-journalism notebooks.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'search-json'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const raw: Record<string, string | string[]> = {}
  for (const key of new Set(Array.from(request.nextUrl.searchParams.keys()))) {
    const all = request.nextUrl.searchParams.getAll(key)
    raw[key] = all.length > 1 ? all : (all[0] ?? '')
  }
  const params = parseSearchParams(raw)
  const forQuery = {
    ...params,
    page: params.page ?? 1,
    limit: Math.min(100, params.limit ?? 50),
    status: params.status ?? 'verified',
    fonte: 'curado' as const,
  }

  const supabase = getSupabaseServiceClient()
  const result = await searchStatements(supabase, forQuery).catch(() => ({
    results: [], total: 0, page: 1, hasMore: false,
  }))

  return NextResponse.json({
    query: params,
    total: result.total,
    page: result.page,
    has_more: result.hasMore,
    results: result.results.map((s) => ({
      id: s.id,
      slug: s.slug,
      summary: s.summary,
      statement_date: s.statement_date,
      severity_score: s.severity_score,
      verification_status: s.verification_status,
      permalink: `${SITE_URL}/declaracao/${s.slug ?? s.id}`,
      politician: {
        slug: s.politicians?.slug,
        common_name: s.politicians?.common_name,
        party: s.politicians?.party,
        state: s.politicians?.state,
      },
      categories: (s.statement_categories ?? []).map((sc) => ({
        slug: sc.categories?.slug,
        label: sc.categories?.label_pt,
      })),
      primary_source_url: s.primary_source_url,
    })),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=60, s-maxage=180, stale-while-revalidate=600',
    },
  })
}
