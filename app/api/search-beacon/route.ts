import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'

function normalize(q: string): string {
  return q
    .trim()
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '') // strip diacritics for dedup
    .replace(/\s+/g, ' ')
    .slice(0, 200)
}

/**
 * POST /api/search-beacon — record one non-empty search query.
 * Rate-limited to 20/min per IP to prevent spam; no other PII captured.
 * Fire-and-forget from `/buscar` when the user submits.
 */
export async function POST(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'search-beacon'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) return NextResponse.json({ ok: false }, { status: 429 })

  let body: { q?: string; results?: number }
  try { body = await request.json() } catch {
    return NextResponse.json({ ok: false }, { status: 400 })
  }

  const qn = body.q ? normalize(body.q) : ''
  if (qn.length < 2) return NextResponse.json({ ok: true, skipped: true })

  const supabase = getSupabaseServiceClient()
  const { error } = await (supabase as any).rpc('bump_search_query', {
    qn,
    result_count: typeof body.results === 'number' ? body.results : null,
  })
  if (error) {
    console.warn('[search-beacon] upsert failed:', error)
    return NextResponse.json({ ok: false }, { status: 500 })
  }

  return NextResponse.json({ ok: true })
}
