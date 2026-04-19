import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { listContradictionsForPolitician } from '@/lib/contradictions/queries'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/politico/:slug/contradictions.json — all published
 * contradiction pairs for one politician, both sides inlined so a
 * single fetch yields the full picture. ETag + 304 for pollers.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'pol-contradictions'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()
  const { data: p } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name, party, state')
    .eq('slug', slug)
    .maybeSingle()
  if (!p) {
    return NextResponse.json({ error: 'Político não encontrado' }, { status: 404 })
  }

  const pairs = await listContradictionsForPolitician(p.id, 100)
  const latest = pairs.length ? pairs[0].updated_at : '0'
  const etag = `W/"pc-${p.id.slice(0, 8)}-${pairs.length}-${latest.replace(/[^0-9]/g, '').slice(0, 14)}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    politician: {
      slug: p.slug,
      common_name: p.common_name,
      party: p.party,
      state: p.state,
      url: `${SITE_URL}/politico/${p.slug}`,
    },
    total: pairs.length,
    contradictions: pairs.map((c) => ({
      id: c.id,
      headline: c.headline,
      editor_note: c.editor_note,
      severity: c.severity,
      created_at: c.created_at,
      updated_at: c.updated_at,
      statement_low: {
        id: c.statement_low.id,
        slug: c.statement_low.slug,
        summary: c.statement_low.summary,
        statement_date: c.statement_low.statement_date,
        url: c.statement_low.slug
          ? `${SITE_URL}/declaracao/${c.statement_low.slug}`
          : `${SITE_URL}/declaracao/${c.statement_low.id}`,
      },
      statement_high: {
        id: c.statement_high.id,
        slug: c.statement_high.slug,
        summary: c.statement_high.summary,
        statement_date: c.statement_high.statement_date,
        url: c.statement_high.slug
          ? `${SITE_URL}/declaracao/${c.statement_high.slug}`
          : `${SITE_URL}/declaracao/${c.statement_high.id}`,
      },
    })),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
      ETag: etag,
    },
  })
}
