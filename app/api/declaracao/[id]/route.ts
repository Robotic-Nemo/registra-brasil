import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 900

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/declaracao/[id] — canonical JSON for one declaration.
 * Lookup by UUID or slug. Emits ETag keyed to updated_at so the
 * many feed aggregators/mirrors re-polling details pay 304s.
 */
interface Params { params: Promise<{ id: string }> }

export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'stmt-one'), {
    limit: 120, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { id: raw } = await params
  const isUuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(raw)

  const supabase = getSupabaseServiceClient()
  const selector = (supabase.from('statements') as any).select(`
    id, slug, summary, full_quote, statement_date, venue, event_name,
    primary_source_url, primary_source_type, youtube_video_id,
    verification_status, severity_score, is_featured,
    created_at, updated_at,
    politicians!inner ( slug, common_name, party, state, role, photo_url ),
    statement_categories ( is_primary, categories ( slug, label_pt, color_hex ) )
  `).neq('verification_status', 'removed')

  const { data } = isUuid
    ? await selector.eq('id', raw).maybeSingle()
    : await selector.eq('slug', raw).maybeSingle()

  if (!data) {
    return NextResponse.json({ error: 'not_found', id: raw }, { status: 404 })
  }

  type Row = {
    id: string; slug: string | null; summary: string; full_quote: string
    statement_date: string; venue: string | null; event_name: string | null
    primary_source_url: string | null; primary_source_type: string | null
    youtube_video_id: string | null
    verification_status: string; severity_score: number | null; is_featured: boolean
    created_at: string; updated_at: string
    politicians: {
      slug: string; common_name: string; party: string | null; state: string | null
      role: string | null; photo_url: string | null
    }
    statement_categories: Array<{
      is_primary: boolean
      categories: { slug: string; label_pt: string; color_hex: string } | null
    }>
  }
  const s = data as Row

  const etag = `W/"st-${s.id.slice(0, 8)}-${s.updated_at.replace(/[^0-9]/g, '').slice(0, 14)}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  const permalink = `${SITE_URL}/declaracao/${s.slug ?? s.id}`
  const cats = s.statement_categories
    .filter((sc) => sc.categories)
    .map((sc) => ({
      slug: sc.categories!.slug,
      label: sc.categories!.label_pt,
      color: sc.categories!.color_hex,
      is_primary: sc.is_primary,
    }))

  return NextResponse.json({
    id: s.id,
    slug: s.slug,
    url: permalink,
    summary: s.summary,
    full_quote: s.full_quote,
    statement_date: s.statement_date,
    venue: s.venue,
    event_name: s.event_name,
    primary_source_url: s.primary_source_url,
    primary_source_type: s.primary_source_type,
    youtube_video_id: s.youtube_video_id,
    verification_status: s.verification_status,
    severity_score: s.severity_score,
    is_featured: s.is_featured,
    created_at: s.created_at,
    updated_at: s.updated_at,
    politician: {
      slug: s.politicians.slug,
      common_name: s.politicians.common_name,
      party: s.politicians.party,
      state: s.politicians.state,
      role: s.politicians.role,
      photo_url: s.politicians.photo_url,
      url: `${SITE_URL}/politico/${s.politicians.slug}`,
    },
    categories: cats,
    related: {
      api_related: `${SITE_URL}/api/declaracao/${s.slug ?? s.id}/related.json`,
      api_revisions: `${SITE_URL}/api/declaracao/${s.slug ?? s.id}/revisions.json`,
      api_fact_checks: `${SITE_URL}/api/declaracao/${s.slug ?? s.id}/fact-checks.json`,
      api_context: `${SITE_URL}/api/declaracao/${s.slug ?? s.id}/context.json`,
      cite_txt: `${SITE_URL}/api/declaracao/${s.slug ?? s.id}/cite.txt`,
      cite_md: `${SITE_URL}/api/declaracao/${s.slug ?? s.id}/cite.md`,
    },
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=300, s-maxage=900, stale-while-revalidate=3600',
      ETag: etag,
    },
  })
}
