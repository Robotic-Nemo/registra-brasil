import { NextRequest, NextResponse } from 'next/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { listPublishedContradictions } from '@/lib/contradictions/queries'

export const runtime = 'nodejs'
export const revalidate = 900

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/contradicoes.json — published contradiction pairs as JSON.
 * Machine-readable mirror of /contradicoes. Default limit 50, up to
 * 200 via ?limite=N.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'contradicoes-json'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const lim = Math.max(1, Math.min(200, Number(request.nextUrl.searchParams.get('limite')) || 50))
  const pairs = await listPublishedContradictions(lim)

  return NextResponse.json({
    count: pairs.length,
    pairs: pairs.map((p) => ({
      id: p.id,
      headline: p.headline,
      editor_note: p.editor_note,
      severity: p.severity,
      created_at: p.created_at,
      url: `${SITE_URL}/contradicoes/${p.id}`,
      politician: {
        slug: p.politician.slug,
        common_name: p.politician.common_name,
        party: p.politician.party,
        state: p.politician.state,
      },
      statement_a: {
        slug: p.statement_low.slug,
        summary: p.statement_low.summary,
        statement_date: p.statement_low.statement_date,
        primary_source_url: p.statement_low.primary_source_url,
        permalink: `${SITE_URL}/declaracao/${p.statement_low.slug ?? p.statement_low.id}`,
      },
      statement_b: {
        slug: p.statement_high.slug,
        summary: p.statement_high.summary,
        statement_date: p.statement_high.statement_date,
        primary_source_url: p.statement_high.primary_source_url,
        permalink: `${SITE_URL}/declaracao/${p.statement_high.slug ?? p.statement_high.id}`,
      },
    })),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=600, s-maxage=900, stale-while-revalidate=3600',
    },
  })
}
