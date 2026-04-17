import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { searchStatements } from '@/lib/supabase/queries/statements'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { createLogger } from '@/lib/utils/logger'

const log = createLogger('api/politicians/statements')
const SLUG_PATTERN = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> }
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'politicians-statements'), {
    limit: 60,
    windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Too many requests' } },
      {
        status: 429,
        headers: { 'Retry-After': String(Math.ceil((rl.resetAt - Date.now()) / 1000)) },
      }
    )
  }

  const { slug } = await params
  if (!SLUG_PATTERN.test(slug)) {
    return NextResponse.json(
      { error: { code: 'INVALID_SLUG', message: 'Slug inválido' } },
      { status: 400 }
    )
  }

  const sp = request.nextUrl.searchParams
  const page = Math.max(1, parseInt(sp.get('page') ?? '1', 10) || 1)
  const limit = Math.min(Math.max(1, parseInt(sp.get('limit') ?? '20', 10) || 20), 50)

  try {
    const result = await searchStatements(await getSupabaseServerClient(), {
      politico: slug,
      page,
      limit,
      status: 'verified',
    })

    return NextResponse.json({
      results: result.results.map((s) => ({
        id: s.id,
        slug: s.slug,
        summary: s.summary,
        statement_date: s.statement_date,
        categories: s.statement_categories.map((sc) => sc.categories.label_pt),
        primary_source_url: s.primary_source_url,
      })),
      total: result.total,
      page: result.page,
      hasMore: result.hasMore,
    }, {
      headers: {
        'Cache-Control': 'public, s-maxage=300, stale-while-revalidate=60',
        Vary: 'Accept-Encoding',
        'X-Content-Type-Options': 'nosniff',
      },
    })
  } catch (err) {
    log.error('query failed', { err: err instanceof Error ? err.message : String(err), slug })
    return NextResponse.json(
      { error: { code: 'INTERNAL_ERROR', message: 'Internal server error' } },
      { status: 500 }
    )
  }
}
