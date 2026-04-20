import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { renderCalendarHeatmapSvg, resolveCalendarWindow } from '@/lib/viz/calendar-heatmap'

export const runtime = 'nodejs'
export const revalidate = 3600

const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'pol-cal-svg'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const { slug } = await params
  if (!SLUG_RE.test(slug)) return new Response('slug inválido', { status: 400 })

  const corRaw = request.nextUrl.searchParams.get('cor') ?? '#0369a1'
  const color = /^#[0-9a-fA-F]{6}$/.test(corRaw) ? corRaw : '#0369a1'
  const anoParam = Number(request.nextUrl.searchParams.get('ano')) || null
  const { startMs, endMs, titleYear } = resolveCalendarWindow(anoParam)
  const startStr = new Date(startMs).toISOString().slice(0, 10)
  const endStr = new Date(endMs).toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()
  const { data: pol } = await (supabase.from('politicians') as any)
    .select('id, common_name')
    .eq('slug', slug)
    .maybeSingle()
  if (!pol) return new Response('<!-- not found -->', { status: 404, headers: { 'Content-Type': 'image/svg+xml' } })

  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date')
    .eq('politician_id', pol.id)
    .neq('verification_status', 'removed')
    .gte('statement_date', startStr)
    .lte('statement_date', endStr)
    .limit(20000)

  if (error) return new Response(`<!-- error: ${error.message} -->`, { status: 500, headers: { 'Content-Type': 'image/svg+xml' } })

  const counts = new Map<string, number>()
  for (const r of ((data ?? []) as Array<{ statement_date: string }>)) {
    const k = r.statement_date?.slice(0, 10)
    if (!k) continue
    counts.set(k, (counts.get(k) ?? 0) + 1)
  }

  const { svg, maxCount, daysWithData } = renderCalendarHeatmapSvg({
    counts, startMs, endMs, titleYear,
    titlePrefix: `${pol.common_name} — `,
    color,
  })

  const etag = `W/"pol-cal-${pol.id.slice(0, 8)}-${titleYear}-${daysWithData}-${maxCount}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return new Response(svg, {
    headers: {
      'Content-Type': 'image/svg+xml; charset=utf-8',
      'Cache-Control': 'public, max-age=3600, s-maxage=10800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
