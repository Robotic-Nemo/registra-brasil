import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { renderCalendarHeatmapSvg, resolveCalendarWindow } from '@/lib/viz/calendar-heatmap'

export const runtime = 'nodejs'
export const revalidate = 3600

const UF_RE = /^[A-Z]{2}$/

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ uf: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estado-cal-svg'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const { uf: rawUf } = await params
  const uf = rawUf.toUpperCase()
  if (!UF_RE.test(uf)) return new Response('UF inválida', { status: 400 })

  const corRaw = request.nextUrl.searchParams.get('cor') ?? '#059669'
  const color = /^#[0-9a-fA-F]{6}$/.test(corRaw) ? corRaw : '#059669'
  const anoParam = Number(request.nextUrl.searchParams.get('ano')) || null
  const { startMs, endMs, titleYear } = resolveCalendarWindow(anoParam)
  const startStr = new Date(startMs).toISOString().slice(0, 10)
  const endStr = new Date(endMs).toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, politicians!inner(state)')
    .eq('politicians.state', uf)
    .neq('verification_status', 'removed')
    .gte('statement_date', startStr)
    .lte('statement_date', endStr)
    .limit(30000)

  if (error) return new Response(`<!-- error: ${error.message} -->`, { status: 500, headers: { 'Content-Type': 'image/svg+xml' } })

  const counts = new Map<string, number>()
  for (const r of ((data ?? []) as Array<{ statement_date: string }>)) {
    const k = r.statement_date?.slice(0, 10)
    if (!k) continue
    counts.set(k, (counts.get(k) ?? 0) + 1)
  }

  const { svg, maxCount, daysWithData } = renderCalendarHeatmapSvg({
    counts, startMs, endMs, titleYear,
    titlePrefix: `${uf} — `,
    color,
  })

  const etag = `W/"estado-cal-${uf}-${titleYear}-${daysWithData}-${maxCount}"`
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
