import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

/**
 * Strip characters that break the PostgREST or-grammar (`,`, `(`, `)`,
 * `:`, `\`) plus LIKE metachars (`%`, `_`) so a user-supplied query
 * can't either inject filter clauses or turn into a wildcard scan.
 */
function sanitizePostgrestFilter(value: string): string {
  return value.replace(/[,()\\:]/g, ' ').replace(/[%_]/g, ' ').trim()
}

export const runtime = 'edge'
export const dynamic = 'force-dynamic'

/**
 * GET /api/v1/search — Unified search across statements and politicians
 * Params: q (required), type (statements|politicians|all), limit
 */
export async function GET(request: NextRequest) {
  const rateLimitKey = getRateLimitKey(request, 'api-v1-search')
  const { allowed, remaining, resetAt } = checkRateLimit(rateLimitKey, { limit: 30, windowMs: 60_000 })
  if (!allowed) {
    return NextResponse.json({ error: 'Rate limit exceeded' }, {
      status: 429,
      headers: { 'Retry-After': String(Math.ceil((resetAt - Date.now()) / 1000)) },
    })
  }

  const { searchParams } = request.nextUrl
  const q = searchParams.get('q')?.trim()
  const type = searchParams.get('type') ?? 'all'
  const limit = Math.min(50, Math.max(1, Number(searchParams.get('limit') ?? 10)))

  if (!q || q.length < 2) {
    return NextResponse.json({ error: 'Query parameter "q" is required (min 2 characters)' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()
  const results: { statements?: unknown[]; politicians?: unknown[] } = {}

  const safeQ = sanitizePostgrestFilter(q)
  if (!safeQ) {
    return NextResponse.json({ query: q, type, data: { statements: [], politicians: [] } })
  }

  if (type === 'all' || type === 'statements') {
    const { data: statements } = await supabase
      .from('statements')
      .select(`
        id, slug, summary, statement_date, verification_status,
        politicians (slug, common_name, party)
      `)
      .eq('verification_status', 'verified')
      .or(`summary.ilike.%${safeQ}%,full_quote.ilike.%${safeQ}%`)
      .order('statement_date', { ascending: false })
      .limit(limit)

    results.statements = statements ?? []
  }

  if (type === 'all' || type === 'politicians') {
    const { data: politicians } = await supabase
      .from('politicians')
      .select('slug, common_name, full_name, party, state, role, photo_url')
      .eq('is_active', true)
      .or(`common_name.ilike.%${safeQ}%,full_name.ilike.%${safeQ}%`)
      .order('common_name')
      .limit(limit)

    results.politicians = politicians ?? []
  }

  return NextResponse.json({
    query: q,
    type,
    data: results,
  }, {
    headers: {
      'Cache-Control': 'private, no-store',
      'X-RateLimit-Remaining': String(remaining),
      'X-API-Version': 'v1',
    },
  })
}
