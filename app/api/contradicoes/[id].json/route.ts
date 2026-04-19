import { NextRequest, NextResponse } from 'next/server'
import { getContradictionById } from '@/lib/contradictions/queries'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/contradicoes/[id].json — single contradiction pair detail,
 * both statements inlined with permalinks. ETag + 304 for pollers.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'contra-one'), {
    limit: 120, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { id } = await params
  if (!/^[0-9a-f-]{8,36}$/i.test(id)) {
    return NextResponse.json({ error: 'id inválido' }, { status: 400 })
  }

  const c = await getContradictionById(id)
  if (!c) {
    return NextResponse.json({ error: 'not_found', id }, { status: 404 })
  }

  const etag = `W/"c1-${c.id.slice(0, 8)}-${c.updated_at.replace(/[^0-9]/g, '').slice(0, 14)}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  const stmtUrl = (s: typeof c.statement_low) =>
    `${SITE_URL}/declaracao/${s.slug ?? s.id}`

  return NextResponse.json({
    id: c.id,
    headline: c.headline,
    editor_note: c.editor_note,
    severity: c.severity,
    created_at: c.created_at,
    updated_at: c.updated_at,
    url: `${SITE_URL}/contradicoes/${c.id}`,
    politician: {
      slug: c.politician.slug,
      common_name: c.politician.common_name,
      party: c.politician.party,
      state: c.politician.state,
      photo_url: c.politician.photo_url,
      url: `${SITE_URL}/politico/${c.politician.slug}`,
    },
    statement_low: {
      id: c.statement_low.id,
      slug: c.statement_low.slug,
      summary: c.statement_low.summary,
      statement_date: c.statement_low.statement_date,
      primary_source_url: c.statement_low.primary_source_url,
      url: stmtUrl(c.statement_low),
    },
    statement_high: {
      id: c.statement_high.id,
      slug: c.statement_high.slug,
      summary: c.statement_high.summary,
      statement_date: c.statement_high.statement_date,
      primary_source_url: c.statement_high.primary_source_url,
      url: stmtUrl(c.statement_high),
    },
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
      ETag: etag,
    },
  })
}
