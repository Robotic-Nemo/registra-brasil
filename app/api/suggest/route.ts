import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { MAX_QUERY_LENGTH } from '@/lib/constants/brazil'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { createLogger } from '@/lib/utils/logger'

const log = createLogger('api/suggest')

export const runtime = 'edge'
// Note: checkRateLimit uses an in-memory Map that won't persist across edge workers.
// This is acceptable — the ISR cache already prevents excessive DB calls.

const SECURITY_HEADERS = {
  'X-Content-Type-Options': 'nosniff',
  'Referrer-Policy': 'strict-origin-when-cross-origin',
} as const

export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'suggest'), { limit: 60, windowMs: 60_000 })
  if (!rl.allowed) {
    return NextResponse.json([], {
      status: 429,
      headers: {
        'Retry-After': String(Math.ceil((rl.resetAt - Date.now()) / 1000)),
        ...SECURITY_HEADERS,
      },
    })
  }

  const q = request.nextUrl.searchParams.get('q')?.trim()
  if (!q || q.length < 2 || q.length > MAX_QUERY_LENGTH) {
    return NextResponse.json([], { headers: SECURITY_HEADERS })
  }

  const supabase = getSupabaseServiceClient()
  const escaped = q.replace(/%/g, '\\%').replace(/_/g, '\\_')

  // Search politicians and recent statement summaries in parallel.
  // Fail-soft: if either query errors, skip that half rather than 500.
  const [politiciansResult, statementsResult] = await Promise.all([
    supabase
      .from('politicians')
      .select('slug, common_name, party')
      .ilike('common_name', `%${escaped}%`)
      .eq('is_active', true)
      .limit(5),
    supabase
      .from('statements')
      .select('id, slug, summary')
      .eq('verification_status', 'verified')
      .textSearch('search_vector', q, { type: 'websearch', config: 'portuguese' })
      .order('statement_date', { ascending: false })
      .limit(5),
  ])

  if (politiciansResult.error) {
    log.warn('politicians query failed', { err: politiciansResult.error.message })
  }
  if (statementsResult.error) {
    log.warn('statements query failed', { err: statementsResult.error.message })
  }

  const politicians = politiciansResult.data
  const statements = statementsResult.data

  const suggestions = [
    ...(politicians ?? []).map((p: { slug: string; common_name: string; party: string }) => ({
      type: 'politician' as const,
      label: `${p.common_name} (${p.party})`,
      href: `/politico/${p.slug}`,
    })),
    ...(statements ?? [])
      .filter((s: { id: string; slug: string | null; summary: string | null }) => !!s.summary)
      .map((s: { id: string; slug: string | null; summary: string | null }) => {
        const summary = s.summary ?? ''
        return {
          type: 'statement' as const,
          label: summary.length > 80 ? summary.slice(0, 77) + '...' : summary,
          href: `/declaracao/${s.slug ?? s.id}`,
        }
      }),
  ]

  return NextResponse.json(suggestions, {
    headers: {
      'Cache-Control': 'public, s-maxage=60, stale-while-revalidate=300',
      Vary: 'Accept-Encoding',
      ...SECURITY_HEADERS,
    },
  })
}
