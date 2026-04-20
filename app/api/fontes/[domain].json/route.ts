import { NextRequest, NextResponse } from 'next/server'
import { getSourceDomainDetail } from '@/lib/sources/queries'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { displaySourceName, classifySource, CATEGORY_LABEL } from '@/lib/sources/domain'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const DOMAIN_RE = /^[a-z0-9%.-]{3,253}$/i

/**
 * GET /api/fontes/[domain].json — statements citing a source
 * domain. Wraps the `get_source_domain_detail(domain, limit)` RPC.
 * Query: `?limite=1..100` (default 25).
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ domain: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'fontes-json'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { domain: raw } = await params
  if (!DOMAIN_RE.test(raw)) {
    return NextResponse.json({ error: 'domínio inválido' }, { status: 400 })
  }
  const domain = decodeURIComponent(raw).toLowerCase().replace(/^www\./, '')
  const limit = Math.max(1, Math.min(100, Number(request.nextUrl.searchParams.get('limite')) || 25))

  let rows
  try {
    rows = await getSourceDomainDetail(domain, limit)
  } catch (err) {
    return NextResponse.json({ error: err instanceof Error ? err.message : 'internal' }, { status: 500 })
  }

  const category = classifySource(domain)

  return NextResponse.json({
    domain,
    display_name: displaySourceName(domain),
    category,
    category_label: CATEGORY_LABEL[category] ?? null,
    total: rows.length,
    url: `${SITE_URL}/fontes/${encodeURIComponent(domain)}`,
    statements: rows.map((r) => ({
      id: r.statement_id,
      slug: r.slug,
      summary: r.summary,
      statement_date: r.statement_date,
      primary_source_url: r.primary_source_url,
      permalink: `${SITE_URL}/declaracao/${r.slug ?? r.statement_id}`,
      politician: {
        slug: r.politician_slug,
        common_name: r.politician_name,
        url: `${SITE_URL}/politico/${r.politician_slug}`,
      },
    })),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
    },
  })
}
