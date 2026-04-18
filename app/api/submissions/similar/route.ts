import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { findSimilarStatements } from '@/lib/utils/similar-statements'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'

/**
 * POST /api/submissions/similar — Live preview: "this looks like X".
 *
 * Called from /sugerir as the user types to surface existing statements
 * that resemble the one they're about to submit. Cuts duplicate intake
 * before it reaches the review queue.
 */
export async function POST(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'submissions-similar'), {
    limit: 30,
    windowMs: 60_000,
  })
  if (!rl.allowed) return NextResponse.json({ matches: [] }, { status: 429 })

  let body: { summary?: string; politician_slug?: string }
  try {
    body = await request.json()
  } catch {
    return NextResponse.json({ matches: [] }, { status: 400 })
  }

  const summary = typeof body.summary === 'string' ? body.summary.trim() : ''
  if (summary.length < 15) return NextResponse.json({ matches: [] })

  const supabase = getSupabaseServiceClient()

  let politicianId: string | undefined
  if (typeof body.politician_slug === 'string' && body.politician_slug.length > 0) {
    const { data } = await (supabase.from('politicians') as any)
      .select('id')
      .eq('slug', body.politician_slug)
      .maybeSingle()
    politicianId = data?.id
  }

  const matches = await findSimilarStatements(supabase, summary, {
    minSimilarity: 0.4,
    limit: 5,
    politicianId,
  })

  return NextResponse.json({
    matches: matches.map((m) => ({
      id: m.id,
      slug: m.slug,
      summary: m.summary,
      date: m.statement_date,
      similarity: m.similarity,
    })),
  })
}
