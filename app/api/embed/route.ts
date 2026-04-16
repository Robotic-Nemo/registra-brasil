import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getStatementBySlug, getStatementById } from '@/lib/supabase/queries/statements'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'edge'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * oEmbed-compatible endpoint for statement embeds.
 * GET /api/embed?url=https://registrabrasil.com.br/declaracao/slug
 */
export async function GET(request: NextRequest) {
  const { allowed } = checkRateLimit(getRateLimitKey(request, 'embed'), { limit: 60, windowMs: 60_000 })
  if (!allowed) {
    return NextResponse.json({ error: 'Rate limit exceeded' }, { status: 429 })
  }

  const url = request.nextUrl.searchParams.get('url')
  if (!url) {
    return NextResponse.json({ error: 'Missing url parameter' }, { status: 400 })
  }

  // Extract statement ID from URL
  const match = url.match(/\/declaracao\/([^/?#]+)/)
  if (!match) {
    return NextResponse.json({ error: 'Invalid URL format' }, { status: 400 })
  }

  const id = match[1]
  const supabase = getSupabaseServiceClient()
  const statement = await getStatementBySlug(supabase, id) ?? await getStatementById(supabase, id)

  if (!statement) {
    return NextResponse.json({ error: 'Statement not found' }, { status: 404 })
  }

  const permalink = `${SITE_URL}/declaracao/${statement.slug ?? statement.id}`

  const oEmbed = {
    version: '1.0',
    type: 'rich',
    provider_name: 'Registra Brasil',
    provider_url: SITE_URL,
    title: `${statement.politicians.common_name}: "${statement.summary.slice(0, 80)}..."`,
    author_name: statement.politicians.common_name,
    author_url: `${SITE_URL}/politico/${statement.politicians.slug}`,
    html: `<blockquote cite="${permalink}"><p>&ldquo;${statement.summary}&rdquo;</p><footer>&mdash; ${statement.politicians.common_name}, via <a href="${permalink}">Registra Brasil</a></footer></blockquote>`,
    width: 600,
    height: null,
    url: permalink,
  }

  return NextResponse.json(oEmbed, {
    headers: {
      'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=600',
      'Content-Type': 'application/json+oembed',
    },
  })
}
