import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SITE_NAME = 'Registra Brasil'
const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

function clamp(raw: string | null, fallback: number, min: number, max: number): number {
  const n = Number(raw)
  if (!Number.isFinite(n) || n <= 0) return fallback
  return Math.min(Math.max(Math.floor(n), min), max)
}

/**
 * GET /api/declaracao/:idOrSlug/oembed — per-statement oEmbed payload
 * resolved directly by id/slug (no `?url=` indirection). Mirrors the
 * rich-iframe response from `/api/oembed` but skips URL parsing,
 * making it friendlier to publishers who already know the slug.
 *
 * Params: `maxwidth` (200..800), `maxheight` (150..600), `format=json`.
 */
interface Params { params: Promise<{ id: string }> }

export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'stmt-oembed'), {
    limit: 120, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { id: raw } = await params
  const isUuid = UUID_RE.test(raw)
  const isSlug = SLUG_RE.test(raw)
  if (!isUuid && !isSlug) {
    return NextResponse.json({ error: 'invalid id or slug' }, { status: 400 })
  }

  const sp = request.nextUrl.searchParams
  if ((sp.get('format') ?? 'json') !== 'json') {
    return NextResponse.json({ error: 'only json format supported' }, { status: 501 })
  }
  const maxWidth = clamp(sp.get('maxwidth'), 600, 200, 800)
  const maxHeight = clamp(sp.get('maxheight'), 400, 150, 600)

  const supabase = getSupabaseServiceClient()
  const selector = (supabase.from('statements') as any)
    .select('id, slug, summary, updated_at, politicians!inner(slug, common_name)')
    .neq('verification_status', 'removed')

  const { data } = isUuid
    ? await selector.eq('id', raw).maybeSingle()
    : await selector.eq('slug', raw).maybeSingle()

  if (!data) {
    return NextResponse.json({ error: 'not_found' }, { status: 404 })
  }

  type Row = {
    id: string; slug: string | null; summary: string; updated_at: string
    politicians: { slug: string; common_name: string } | null
  }
  const row = data as Row
  const canonical = row.slug ?? row.id
  const embedUrl = `${SITE_URL}/embed/declaracao/${encodeURIComponent(canonical)}`
  const html = `<iframe src="${embedUrl}" width="${maxWidth}" height="${maxHeight}" frameborder="0" allowfullscreen style="border:1px solid #e5e7eb;border-radius:8px"></iframe>`

  const etag = `W/"stmt-oembed-${row.id}-${row.updated_at}-${maxWidth}x${maxHeight}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  const payload = {
    version: '1.0',
    type: 'rich',
    title: row.summary,
    author_name: row.politicians?.common_name,
    author_url: row.politicians ? `${SITE_URL}/politico/${row.politicians.slug}` : undefined,
    provider_name: SITE_NAME,
    provider_url: SITE_URL,
    html,
    width: maxWidth,
    height: maxHeight,
    cache_age: 3600,
  }

  return NextResponse.json(payload, {
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'Cache-Control': 'public, max-age=900, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
