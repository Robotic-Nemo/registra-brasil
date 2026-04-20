import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getStatementBySlug, getStatementById } from '@/lib/supabase/queries/statements'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'edge'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SITE_HOST = new URL(SITE_URL).hostname
const SLUG_PATTERN = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/
const UUID_PATTERN = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

// Minimal HTML escape for content interpolated into the oEmbed html field.
function escapeHtml(str: string): string {
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;')
}

/**
 * oEmbed-compatible endpoint for statement embeds.
 * GET /api/embed?url=https://registrabrasil.com.br/declaracao/slug
 */
export async function GET(request: NextRequest) {
  const { allowed, resetAt } = checkRateLimit(getRateLimitKey(request, 'embed'), {
    limit: 60,
    windowMs: 60_000,
  })
  if (!allowed) {
    return NextResponse.json(
      { error: 'Rate limit exceeded' },
      {
        status: 429,
        headers: { 'Retry-After': String(Math.ceil((resetAt - Date.now()) / 1000)) },
      }
    )
  }

  const url = request.nextUrl.searchParams.get('url')
  if (!url) {
    return NextResponse.json({ error: 'Missing url parameter' }, { status: 400 })
  }

  let parsed: URL
  try {
    parsed = new URL(url)
  } catch {
    return NextResponse.json({ error: 'Invalid URL' }, { status: 400 })
  }

  if (parsed.hostname !== SITE_HOST && parsed.hostname !== `www.${SITE_HOST}`) {
    return NextResponse.json({ error: 'URL not supported' }, { status: 404 })
  }

  const match = parsed.pathname.match(/^\/declaracao\/([^/?#]+)$/)
  if (!match) {
    return NextResponse.json({ error: 'Invalid URL format' }, { status: 400 })
  }

  const id = match[1]
  if (!SLUG_PATTERN.test(id) && !UUID_PATTERN.test(id)) {
    return NextResponse.json({ error: 'Invalid identifier' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()
  const statement = await getStatementBySlug(supabase, id) ?? await getStatementById(supabase, id)

  if (!statement) {
    return NextResponse.json({ error: 'Statement not found' }, { status: 404 })
  }

  const permalink = `${SITE_URL}/declaracao/${statement.slug ?? statement.id}`
  const authorUrl = `${SITE_URL}/politico/${statement.politicians.slug}`
  const safeSummary = escapeHtml(statement.summary)
  const safeAuthor = escapeHtml(statement.politicians.common_name)
  const safePermalink = escapeHtml(permalink)

  const oEmbed = {
    version: '1.0',
    type: 'rich',
    provider_name: 'Registra Brasil',
    provider_url: SITE_URL,
    title: `${statement.politicians.common_name}: "${statement.summary.slice(0, 80)}..."`,
    author_name: statement.politicians.common_name,
    author_url: authorUrl,
    html: `<blockquote cite="${safePermalink}"><p>&ldquo;${safeSummary}&rdquo;</p><footer>&mdash; ${safeAuthor}, via <a href="${safePermalink}">Registra Brasil</a></footer></blockquote>`,
    width: 600,
    height: null,
    url: permalink,
  }

  return NextResponse.json(oEmbed, {
    headers: {
      'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=86400',
      'Content-Type': 'application/json+oembed',
      'X-Content-Type-Options': 'nosniff',
    },
  })
}
