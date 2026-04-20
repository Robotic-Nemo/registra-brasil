import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SITE_NAME = 'Registra Brasil'
const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
const SLUG_RE = /^[a-z0-9-]{1,120}$/i

/**
 * GET /api/declaracao/:idOrSlug/jsonld — schema.org JSON-LD for one
 * declaration. Emits a ClaimReview (when we have a verification
 * status) or a Claim node wrapped in a CreativeWork, so aggregators
 * can ingest structured data directly instead of scraping HTML.
 */
interface Params { params: Promise<{ id: string }> }

// Ratings that map to schema.org reviewRating values. We pick a
// conservative scale: verified=5, disputed=2, unverified=3, removed
// is filtered out upstream.
const STATUS_RATING: Record<string, { value: number; best: number; worst: number; alt: string }> = {
  verified: { value: 5, best: 5, worst: 1, alt: 'Confirmada pela equipe editorial' },
  disputed: { value: 2, best: 5, worst: 1, alt: 'Contestada por verificadores' },
  unverified: { value: 3, best: 5, worst: 1, alt: 'Registrada, aguardando checagem' },
}

export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'decl-jsonld'), {
    limit: 120, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { id: raw } = await params
  if (!UUID_RE.test(raw) && !SLUG_RE.test(raw)) {
    return NextResponse.json({ error: 'id inválido' }, { status: 400 })
  }
  const isUuid = UUID_RE.test(raw)

  const supabase = getSupabaseServiceClient()
  const selector = (supabase.from('statements') as any).select(`
    id, slug, summary, full_quote, statement_date, venue, event_name,
    primary_source_url, primary_source_type, youtube_video_id,
    verification_status, created_at, updated_at,
    politicians!inner ( slug, common_name, party, state, role, photo_url )
  `).neq('verification_status', 'removed')

  const { data } = isUuid
    ? await selector.eq('id', raw).maybeSingle()
    : await selector.eq('slug', raw).maybeSingle()

  if (!data) {
    return NextResponse.json({ error: 'not_found', id: raw }, { status: 404 })
  }

  const r = data as {
    id: string; slug: string | null; summary: string; full_quote: string | null
    statement_date: string; venue: string | null; event_name: string | null
    primary_source_url: string | null; primary_source_type: string | null
    youtube_video_id: string | null
    verification_status: string
    created_at: string; updated_at: string | null
    politicians: {
      slug: string; common_name: string; party: string | null; state: string | null
      role: string | null; photo_url: string | null
    }
  }

  const permalink = `${SITE_URL}/declaracao/${r.slug ?? r.id}`
  const politicianUrl = `${SITE_URL}/politico/${r.politicians.slug}`
  const rating = STATUS_RATING[r.verification_status] ?? STATUS_RATING.unverified
  const publisher = {
    '@type': 'Organization',
    name: SITE_NAME,
    url: SITE_URL,
    logo: `${SITE_URL}/favicon.svg`,
  }

  const claim = {
    '@type': 'Claim',
    datePublished: r.statement_date,
    author: {
      '@type': 'Person',
      name: r.politicians.common_name,
      url: politicianUrl,
      ...(r.politicians.role ? { jobTitle: r.politicians.role } : {}),
      ...(r.politicians.party ? { affiliation: { '@type': 'Organization', name: r.politicians.party } } : {}),
      ...(r.politicians.photo_url ? { image: r.politicians.photo_url } : {}),
    },
    ...(r.event_name ? { name: r.event_name } : {}),
    ...(r.venue ? { locationCreated: { '@type': 'Place', name: r.venue } } : {}),
    appearance: [
      r.primary_source_url
        ? { '@type': 'OpinionNewsArticle', url: r.primary_source_url }
        : null,
    ].filter(Boolean),
  }

  const jsonld = {
    '@context': 'https://schema.org',
    '@type': 'ClaimReview',
    url: permalink,
    datePublished: r.created_at,
    dateModified: r.updated_at ?? r.created_at,
    inLanguage: 'pt-BR',
    author: publisher,
    publisher,
    claimReviewed: r.summary,
    text: r.full_quote ?? r.summary,
    itemReviewed: claim,
    reviewRating: {
      '@type': 'Rating',
      ratingValue: rating.value,
      bestRating: rating.best,
      worstRating: rating.worst,
      alternateName: rating.alt,
    },
  }

  const etag = `W/"jsonld-${r.id}-${(r.updated_at ?? r.created_at).replace(/\D/g, '')}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json(jsonld, {
    headers: {
      'Content-Type': 'application/ld+json; charset=utf-8',
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
