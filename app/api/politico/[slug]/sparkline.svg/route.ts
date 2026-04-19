import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'nodejs'
export const revalidate = 3600

const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/politico/:slug/sparkline.svg — tiny inline-sized SVG
 * sparkline (default 12 months, 160×32) of a politician's monthly
 * statement counts. Works in any <img src="…">. No JS, no fonts,
 * cache-friendly. Query params:
 *   ?meses=3..24    number of buckets (default 12)
 *   ?w=60..480      width px (default 160)
 *   ?h=16..80       height px (default 32)
 *   ?cor=#hex       stroke color (default #d97706 amber-600)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return new Response('invalid slug', { status: 400 })
  }
  const q = request.nextUrl.searchParams
  const months = Math.max(3, Math.min(24, Number(q.get('meses')) || 12))
  const W = Math.max(60, Math.min(480, Number(q.get('w')) || 160))
  const H = Math.max(16, Math.min(80, Number(q.get('h')) || 32))
  const rawColor = q.get('cor') ?? '#d97706'
  const color = /^#[0-9a-fA-F]{3,8}$/.test(rawColor) ? rawColor : '#d97706'

  const supabase = getSupabaseServiceClient()
  const { data: p } = await (supabase.from('politicians') as any)
    .select('id, common_name')
    .eq('slug', slug)
    .maybeSingle()

  const empty = () => {
    const svg = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ${W} ${H}" width="${W}" height="${H}" role="img" aria-label="sem dados"><rect width="${W}" height="${H}" fill="transparent"/></svg>`
    return new Response(svg, {
      headers: {
        'Content-Type': 'image/svg+xml; charset=utf-8',
        'Cache-Control': 'public, max-age=900, s-maxage=3600, stale-while-revalidate=86400',
      },
    })
  }
  if (!p) return empty()

  const now = new Date()
  const start = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (months - 1), 1))
  const startIso = start.toISOString().slice(0, 10)

  const { data: rows } = await (supabase.from('statements') as any)
    .select('statement_date')
    .eq('politician_id', p.id)
    .neq('verification_status', 'removed')
    .gte('statement_date', startIso)
    .limit(5000)

  const buckets = Array.from({ length: months }, (_, i) => {
    const d = new Date(Date.UTC(start.getUTCFullYear(), start.getUTCMonth() + i, 1))
    return { ym: `${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`, count: 0 }
  })
  const byYm = new Map(buckets.map((b) => [b.ym, b]))
  for (const r of (rows ?? []) as Array<{ statement_date: string }>) {
    const b = byYm.get(r.statement_date.slice(0, 7))
    if (b) b.count++
  }

  const peak = Math.max(1, ...buckets.map((b) => b.count))
  const pad = 1.5
  const innerW = W - pad * 2
  const innerH = H - pad * 2
  const step = months === 1 ? 0 : innerW / (months - 1)

  const points = buckets.map((b, i) => {
    const x = pad + i * step
    const y = pad + innerH - (b.count / peak) * innerH
    return `${x.toFixed(2)},${y.toFixed(2)}`
  })
  const path = `M ${points.join(' L ')}`
  const area = `M ${pad},${(pad + innerH).toFixed(2)} L ${points.join(' L ')} L ${(pad + innerW).toFixed(2)},${(pad + innerH).toFixed(2)} Z`

  const label = `Sparkline de declarações: ${p.common_name}, últimos ${months} meses, pico ${peak}`
  const svg = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ${W} ${H}" width="${W}" height="${H}" role="img" aria-label="${label.replace(/"/g, '&quot;')}"><path d="${area}" fill="${color}" fill-opacity="0.15" stroke="none"/><path d="${path}" fill="none" stroke="${color}" stroke-width="1.5" stroke-linejoin="round" stroke-linecap="round"/></svg>`

  // ETag over content.
  const etag = `W/"spkv-${months}-${W}-${H}-${peak}-${buckets.map((b) => b.count).join('.')}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return new Response(svg, {
    headers: {
      'Content-Type': 'image/svg+xml; charset=utf-8',
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      'X-Robots-Tag': 'noindex',
      ETag: etag,
    },
  })
}
