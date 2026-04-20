import { NextRequest, NextResponse } from 'next/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'edge'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SITE_NAME = 'Registra Brasil'

const SLUG_PATTERN = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/
const UUID_PATTERN = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

function clampDimension(raw: string | null, fallback: number, min: number, max: number): number {
  const n = Number(raw)
  if (!Number.isFinite(n) || n <= 0) return fallback
  return Math.min(Math.max(Math.floor(n), min), max)
}

interface OEmbedResponse {
  version: string
  type: 'rich' | 'link'
  title: string
  author_name?: string
  author_url?: string
  provider_name: string
  provider_url: string
  html?: string
  width?: number
  height?: number
  thumbnail_url?: string
}

/**
 * GET /api/oembed — oEmbed endpoint for embedding Registra Brasil content.
 *
 * Supports URLs matching:
 *   - /declaracao/:slug
 *   - /politico/:slug
 *   - /contradicoes/:uuid
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'oembed'), {
    limit: 120,
    windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: 'Rate limited' },
      {
        status: 429,
        headers: { 'Retry-After': String(Math.ceil((rl.resetAt - Date.now()) / 1000)) },
      }
    )
  }

  const { searchParams } = new URL(request.url)
  const url = searchParams.get('url')
  const format = searchParams.get('format') ?? 'json'
  const maxWidth = clampDimension(searchParams.get('maxwidth'), 600, 200, 800)
  const maxHeight = clampDimension(searchParams.get('maxheight'), 400, 150, 600)

  if (format !== 'json') {
    return NextResponse.json(
      { error: 'Only JSON format is supported' },
      { status: 501 }
    )
  }

  if (!url) {
    return NextResponse.json(
      { error: 'url parameter is required' },
      { status: 400 }
    )
  }

  let parsedUrl: URL
  try {
    parsedUrl = new URL(url)
  } catch {
    return NextResponse.json({ error: 'Invalid URL' }, { status: 400 })
  }

  // Normalize both sides by stripping a leading `www.` so we accept
  // `registrabrasil.com.br`, `www.registrabrasil.com.br`, and either
  // variant of SITE_URL (the prior check broke when SITE_URL itself
  // carried a `www.` prefix — it would compute `www.www.host`).
  const stripWww = (h: string) => h.replace(/^www\./i, '')
  const siteHost = stripWww(new URL(SITE_URL).hostname.toLowerCase())
  if (stripWww(parsedUrl.hostname.toLowerCase()) !== siteHost) {
    return NextResponse.json({ error: 'URL not supported' }, { status: 404 })
  }

  const pathname = parsedUrl.pathname

  // Match /declaracao/:slug
  const statementMatch = pathname.match(/^\/declaracao\/([^/]+)$/)
  if (statementMatch) {
    const slug = statementMatch[1]
    if (!SLUG_PATTERN.test(slug)) {
      return NextResponse.json({ error: 'Invalid slug' }, { status: 400 })
    }
    const embedUrl = `${SITE_URL}/embed/declaracao/${encodeURIComponent(slug)}`

    const response: OEmbedResponse = {
      version: '1.0',
      type: 'rich',
      title: `Declaracao - ${SITE_NAME}`,
      provider_name: SITE_NAME,
      provider_url: SITE_URL,
      html: `<iframe src="${embedUrl}" width="${maxWidth}" height="${maxHeight}" frameborder="0" allowfullscreen style="border:1px solid #e5e7eb;border-radius:8px"></iframe>`,
      width: maxWidth,
      height: maxHeight,
    }

    return NextResponse.json(response, {
      headers: {
        'Content-Type': 'application/json',
        'Cache-Control': 'public, max-age=3600',
      },
    })
  }

  // Match /politico/:slug
  const politicianMatch = pathname.match(/^\/politico\/([^/]+)$/)
  if (politicianMatch) {
    const slug = politicianMatch[1]
    if (!SLUG_PATTERN.test(slug)) {
      return NextResponse.json({ error: 'Invalid slug' }, { status: 400 })
    }
    const embedUrl = `${SITE_URL}/embed/politico/${encodeURIComponent(slug)}`

    const response: OEmbedResponse = {
      version: '1.0',
      type: 'rich',
      title: `Politico - ${SITE_NAME}`,
      provider_name: SITE_NAME,
      provider_url: SITE_URL,
      html: `<iframe src="${embedUrl}" width="${maxWidth}" height="${maxHeight}" frameborder="0" allowfullscreen style="border:1px solid #e5e7eb;border-radius:8px"></iframe>`,
      width: maxWidth,
      height: maxHeight,
    }

    return NextResponse.json(response, {
      headers: {
        'Content-Type': 'application/json',
        'Cache-Control': 'public, max-age=3600',
      },
    })
  }

  // Match /contradicoes/:uuid. Contradiction cards ship via
  // /api/embed/contradicao/:id (no page-level /embed equivalent)
  // since the pair is self-contained and doesn't need SSR routing.
  const contradictionMatch = pathname.match(/^\/contradicoes\/([^/]+)$/)
  if (contradictionMatch) {
    const id = contradictionMatch[1]
    if (!UUID_PATTERN.test(id)) {
      return NextResponse.json({ error: 'Invalid id' }, { status: 400 })
    }
    const embedUrl = `${SITE_URL}/api/embed/contradicao/${id}`
    const w = clampDimension(searchParams.get('maxwidth'), 520, 300, 800)
    const h = clampDimension(searchParams.get('maxheight'), 280, 180, 600)

    const response: OEmbedResponse = {
      version: '1.0',
      type: 'rich',
      title: `Contradicao - ${SITE_NAME}`,
      provider_name: SITE_NAME,
      provider_url: SITE_URL,
      html: `<iframe src="${embedUrl}" width="${w}" height="${h}" frameborder="0" allowfullscreen style="border:1px solid #e5e7eb;border-radius:8px"></iframe>`,
      width: w,
      height: h,
    }

    return NextResponse.json(response, {
      headers: {
        'Content-Type': 'application/json',
        'Cache-Control': 'public, max-age=3600',
      },
    })
  }

  return NextResponse.json({ error: 'URL not supported for embedding' }, { status: 404 })
}
