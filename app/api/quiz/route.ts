import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

/**
 * GET /api/quiz — returns a quiz round: one random verified statement
 * and four politician options (the real author plus three random
 * distractors), shuffled.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'quiz'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED' } },
      { status: 429 },
    )
  }

  const supabase = getSupabaseServiceClient()

  // Grab a pool of recent verified statements with non-trivial length so the
  // quiz doesn't show stubby one-liners.
  const { data: pool } = await (supabase.from('statements') as any)
    .select('id, slug, summary, full_quote, statement_date, politicians!inner(id, slug, common_name, party, state, photo_url)')
    .eq('verification_status', 'verified')
    .not('full_quote', 'is', null)
    .order('created_at', { ascending: false })
    .limit(500)
  const rows = ((pool ?? []) as Array<{
    id: string; slug: string | null; summary: string; full_quote: string | null; statement_date: string
    politicians: { id: string; slug: string; common_name: string; party: string | null; state: string | null; photo_url: string | null }
  }>).filter((r) => (r.full_quote ?? r.summary).length >= 40)

  if (rows.length === 0) {
    return NextResponse.json({ error: 'Pool vazio' }, { status: 503 })
  }
  const pick = rows[Math.floor(Math.random() * rows.length)]

  // Distractors: three other politicians from the same pool, never the author.
  const candidates = rows
    .map((r) => r.politicians)
    .filter((p) => p.id !== pick.politicians.id)

  const distractors: typeof pick.politicians[] = []
  const seen = new Set<string>()
  for (let tries = 0; tries < 200 && distractors.length < 3 && candidates.length > 0; tries++) {
    const cand = candidates[Math.floor(Math.random() * candidates.length)]
    if (seen.has(cand.id)) continue
    seen.add(cand.id)
    distractors.push(cand)
  }

  const options = [pick.politicians, ...distractors]
    .map((p) => ({ p, order: Math.random() }))
    .sort((a, b) => a.order - b.order)
    .map(({ p }) => ({
      id: p.id,
      slug: p.slug,
      common_name: p.common_name,
      party: p.party,
      state: p.state,
      photo_url: p.photo_url,
    }))

  return NextResponse.json({
    statement: {
      id: pick.id,
      slug: pick.slug,
      statement_date: pick.statement_date,
      quote: pick.full_quote ?? pick.summary,
    },
    answer_id: pick.politicians.id,
    answer_slug: pick.politicians.slug,
    answer_name: pick.politicians.common_name,
    options,
  }, {
    headers: { 'Cache-Control': 'no-store' },
  })
}
