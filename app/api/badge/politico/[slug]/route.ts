import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'edge'
export const revalidate = 3600

const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

function esc(s: string): string {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
}

// Rough pixel-width estimate for the Verdana 11px badge style.
// shields.io uses actual font metrics; we approximate to keep the
// endpoint edge-runtime-friendly (no canvas / no metrics table).
function textWidth(s: string): number {
  let w = 0
  for (const ch of s) {
    if (/[A-Z]/.test(ch)) w += 8
    else if (/[a-z0-9]/.test(ch)) w += 7
    else if (ch === ' ') w += 4
    else w += 6
  }
  return w
}

/**
 * GET /api/badge/politico/:slug — shields.io-style SVG badge for
 * a politician, suitable for READMEs and dashboards. Shows
 * "Registra Brasil | 42 declarações" with a colored right panel.
 *   ?color=#hex (default #d97706)
 *   ?label=custom left label
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'badge-politico'), {
    limit: 120, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const { slug } = await params
  if (!SLUG_RE.test(slug)) return new Response('slug inválido', { status: 400 })

  const sp = request.nextUrl.searchParams
  const colorRaw = sp.get('color') ?? '#d97706'
  const color = /^#[0-9a-f]{3,8}$/i.test(colorRaw) ? colorRaw : '#d97706'
  const labelRaw = sp.get('label') ?? 'Registra Brasil'
  const label = labelRaw.slice(0, 40)

  const supabase = getSupabaseServiceClient()
  const { data: p } = await (supabase.from('politicians') as any)
    .select('id, common_name')
    .eq('slug', slug)
    .maybeSingle()
  if (!p) return new Response(emptyBadge(label, 'não encontrado', '#6b7280'), svgHeaders())

  const { count } = await (supabase.from('statements') as any)
    .select('id', { count: 'exact', head: true })
    .eq('politician_id', p.id)
    .eq('verification_status', 'verified')

  const value = `${count ?? 0} declarações`
  return new Response(renderBadge(label, value, color), svgHeaders())
}

function emptyBadge(label: string, value: string, color: string): string {
  return renderBadge(label, value, color)
}

function renderBadge(label: string, value: string, color: string): string {
  const pad = 6
  const lw = textWidth(label) + pad * 2
  const vw = textWidth(value) + pad * 2
  const total = lw + vw
  const h = 20

  return `<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="${total}" height="${h}" role="img" aria-label="${esc(label)}: ${esc(value)}">
  <title>${esc(label)}: ${esc(value)}</title>
  <linearGradient id="s" x2="0" y2="100%">
    <stop offset="0" stop-opacity=".1" stop-color="#bbb"/>
    <stop offset="1" stop-opacity=".1"/>
  </linearGradient>
  <clipPath id="r"><rect width="${total}" height="${h}" rx="3" fill="#fff"/></clipPath>
  <g clip-path="url(#r)">
    <rect width="${lw}" height="${h}" fill="#555"/>
    <rect x="${lw}" width="${vw}" height="${h}" fill="${color}"/>
    <rect width="${total}" height="${h}" fill="url(#s)"/>
  </g>
  <g fill="#fff" text-anchor="middle" font-family="Verdana,Geneva,DejaVu Sans,sans-serif" font-size="11">
    <text x="${lw / 2}" y="14" fill="#010101" fill-opacity=".3">${esc(label)}</text>
    <text x="${lw / 2}" y="13">${esc(label)}</text>
    <text x="${lw + vw / 2}" y="14" fill="#010101" fill-opacity=".3">${esc(value)}</text>
    <text x="${lw + vw / 2}" y="13">${esc(value)}</text>
  </g>
</svg>`
}

function svgHeaders(): ResponseInit {
  return {
    headers: {
      'Content-Type': 'image/svg+xml; charset=utf-8',
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
    },
  }
}
