import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 180

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/recent.json — newest non-removed statements as JSON,
 * ordered by created_at desc (not statement_date — so late-arriving
 * historical additions still bubble to the top).
 *
 * ?limite=N (1..100, default 30), ?page=N (1-indexed) for pagination.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'recent-json'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const lim = Math.max(1, Math.min(100, Number(request.nextUrl.searchParams.get('limite')) || 30))
  const page = Math.max(1, Math.min(20, Number(request.nextUrl.searchParams.get('page')) || 1))
  const offset = (page - 1) * lim

  const supabase = getSupabaseServiceClient()
  // Overfetch by 1 so `has_more` is correct when the last page ends
  // exactly on `lim` rows (a range that returns exactly `lim` rows
  // would otherwise always report `has_more: true`).
  const { data, error } = await (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, created_at, verification_status, severity_score, politicians!inner(slug, common_name, party, state)')
    .neq('verification_status', 'removed')
    .order('created_at', { ascending: false })
    .range(offset, offset + lim)

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 })
  }

  type Row = {
    id: string; slug: string | null; summary: string; statement_date: string
    created_at: string; verification_status: string; severity_score: number | null
    politicians: { slug: string; common_name: string; party: string | null; state: string | null }
  }
  const raw = (data ?? []) as Row[]
  const hasMore = raw.length > lim
  const rows = hasMore ? raw.slice(0, lim) : raw

  return NextResponse.json({
    page,
    limit: lim,
    count: rows.length,
    has_more: hasMore,
    results: rows.map((r) => ({
      id: r.id,
      slug: r.slug,
      summary: r.summary,
      statement_date: r.statement_date,
      registered_at: r.created_at,
      verification_status: r.verification_status,
      severity_score: r.severity_score,
      permalink: `${SITE_URL}/declaracao/${r.slug ?? r.id}`,
      politician: {
        slug: r.politicians.slug,
        common_name: r.politicians.common_name,
        party: r.politicians.party,
        state: r.politicians.state,
      },
    })),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=60, s-maxage=180, stale-while-revalidate=600',
    },
  })
}
