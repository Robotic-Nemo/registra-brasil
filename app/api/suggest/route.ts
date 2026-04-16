import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { MAX_QUERY_LENGTH } from '@/lib/constants/brazil'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'edge'
// Note: checkRateLimit uses an in-memory Map that won't persist across edge workers.
// This is acceptable — the ISR cache already prevents excessive DB calls.

export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'suggest'), { limit: 60, windowMs: 60_000 })
  if (!rl.allowed) {
    return NextResponse.json([], { status: 429 })
  }

  const q = request.nextUrl.searchParams.get('q')?.trim()
  if (!q || q.length < 2 || q.length > MAX_QUERY_LENGTH) {
    return NextResponse.json([])
  }

  const supabase = getSupabaseServiceClient()
  const escaped = q.replace(/%/g, '\\%').replace(/_/g, '\\_')

  // Search politicians and recent statement summaries in parallel
  const [{ data: politicians }, { data: statements }] = await Promise.all([
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

  const suggestions = [
    ...(politicians ?? []).map((p: { slug: string; common_name: string; party: string }) => ({
      type: 'politician' as const,
      label: `${p.common_name} (${p.party})`,
      href: `/politico/${p.slug}`,
    })),
    ...(statements ?? []).map((s: { id: string; slug: string | null; summary: string }) => ({
      type: 'statement' as const,
      label: s.summary.length > 80 ? s.summary.slice(0, 77) + '...' : s.summary,
      href: `/declaracao/${s.slug ?? s.id}`,
    })),
  ]

  return NextResponse.json(suggestions, {
    headers: {
      'Cache-Control': 'public, s-maxage=60, stale-while-revalidate=30',
    },
  })
}
