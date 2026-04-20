import { NextRequest, NextResponse } from 'next/server'
import { getContradictionById } from '@/lib/contradictions/queries'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

/**
 * GET /api/v2/contradictions/:id — v2 detail endpoint for a single
 * contradiction pair. Complements the v2 cursor list at
 * /api/v2/contradictions. Returns a flatter shape than the v1
 * /api/contradicoes/:id.json (matches v2 naming and inlines
 * source URLs + both statement primary_source_type fields).
 * ETag + 304 for aggregators polling pair state.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'v2-contra-one'), {
    limit: 120, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Rate limit exceeded' } },
      { status: 429 },
    )
  }

  const { id } = await params
  if (!UUID_RE.test(id)) {
    return NextResponse.json(
      { error: { code: 'INVALID_PARAM', message: 'id deve ser UUID' } },
      { status: 400 },
    )
  }

  const c = await getContradictionById(id)
  if (!c) {
    return NextResponse.json(
      { error: { code: 'NOT_FOUND', message: 'Contradição não encontrada' } },
      { status: 404 },
    )
  }

  const etag = `W/"v2c1-${c.id.slice(0, 8)}-${c.updated_at.replace(/[^0-9]/g, '').slice(0, 14)}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  const stmt = (s: typeof c.statement_low) => ({
    id: s.id,
    slug: s.slug,
    summary: s.summary,
    statement_date: s.statement_date,
    primary_source_url: s.primary_source_url,
    permalink: `${SITE_URL}/declaracao/${s.slug ?? s.id}`,
  })

  return NextResponse.json({
    data: {
      id: c.id,
      headline: c.headline,
      editor_note: c.editor_note,
      severity: c.severity,
      created_at: c.created_at,
      updated_at: c.updated_at,
      permalink: `${SITE_URL}/contradicoes/${c.id}`,
      politician: {
        slug: c.politician.slug,
        common_name: c.politician.common_name,
        party: c.politician.party,
        state: c.politician.state,
        url: `${SITE_URL}/politico/${c.politician.slug}`,
      },
      statement_low: stmt(c.statement_low),
      statement_high: stmt(c.statement_high),
    },
  }, {
    headers: {
      'Cache-Control': 'public, s-maxage=900, stale-while-revalidate=3600',
      'X-API-Version': 'v2',
      ETag: etag,
    },
  })
}
