import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

/**
 * GET /api/estatisticas/calendario.svg — GitHub-style yearly
 * contribution-graph SVG of daily statement volume. Aggregates per
 * day across all non-removed statements for the trailing 53-week
 * window ending today (UTC). Shade scales logarithmically against
 * the max daily count.
 *   ?ano=YYYY (optional; default = last 53 weeks ending today)
 *   ?cor=#RRGGBB (hex; default #d97706)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estat-calendar-svg'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return new Response('rate limited', { status: 429 })
  }

  const corRaw = request.nextUrl.searchParams.get('cor') ?? '#d97706'
  const cor = /^#[0-9a-fA-F]{6}$/.test(corRaw) ? corRaw : '#d97706'
  const anoParam = Number(request.nextUrl.searchParams.get('ano'))

  // Build anchor window. Default = last 53 weeks ending this UTC Sunday.
  const now = new Date()
  let endMs: number
  let startMs: number
  let titleYear: number
  if (anoParam >= 2000 && anoParam <= now.getUTCFullYear()) {
    startMs = Date.UTC(anoParam, 0, 1)
    endMs = Date.UTC(anoParam, 11, 31)
    titleYear = anoParam
  } else {
    const todayUtc = Date.UTC(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate())
    endMs = todayUtc
    startMs = endMs - 371 * 86400_000 // 53 weeks ≈ 371 days
    titleYear = now.getUTCFullYear()
  }
  const startStr = new Date(startMs).toISOString().slice(0, 10)
  const endStr = new Date(endMs).toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date')
    .neq('verification_status', 'removed')
    .gte('statement_date', startStr)
    .lte('statement_date', endStr)
    .limit(60000)

  if (error) {
    return new Response(`<!-- error: ${error.message} -->`, {
      status: 500,
      headers: { 'Content-Type': 'image/svg+xml' },
    })
  }

  type Row = { statement_date: string }
  const tally = new Map<string, number>()
  for (const r of ((data ?? []) as Row[])) {
    const k = r.statement_date?.slice(0, 10)
    if (!k) continue
    tally.set(k, (tally.get(k) ?? 0) + 1)
  }

  // Align grid to Sunday-start columns.
  const startDow = new Date(startMs).getUTCDay() // 0=Sun..6=Sat
  const gridStartMs = startMs - startDow * 86400_000
  const totalDays = Math.round((endMs - gridStartMs) / 86400_000) + 1
  const weeks = Math.ceil(totalDays / 7)

  const cell = 11
  const gap = 2
  const padL = 24
  const padT = 18
  const width = padL + weeks * (cell + gap) + 8
  const height = padT + 7 * (cell + gap) + 20

  const maxCount = [...tally.values()].reduce((m, v) => Math.max(m, v), 0)
  const scale = (n: number): string => {
    if (n <= 0) return '#e5e7eb'
    const t = Math.log1p(n) / Math.log1p(Math.max(maxCount, 1))
    const alpha = Math.max(0.15, Math.min(1, t))
    return `${cor}${Math.round(alpha * 255).toString(16).padStart(2, '0').toUpperCase()}`
  }

  const cells: string[] = []
  for (let i = 0; i < totalDays; i++) {
    const dayMs = gridStartMs + i * 86400_000
    if (dayMs < startMs || dayMs > endMs) continue
    const d = new Date(dayMs)
    const key = d.toISOString().slice(0, 10)
    const col = Math.floor(i / 7)
    const row = i % 7
    const x = padL + col * (cell + gap)
    const y = padT + row * (cell + gap)
    const n = tally.get(key) ?? 0
    cells.push(
      `<rect x="${x}" y="${y}" width="${cell}" height="${cell}" rx="2" fill="${scale(n)}"><title>${key}: ${n}</title></rect>`,
    )
  }

  const dowLabels = ['Seg', 'Qua', 'Sex']
    .map((lbl, i) => {
      const row = i * 2 + 1
      const y = padT + row * (cell + gap) + cell - 2
      return `<text x="0" y="${y}" font-size="9" font-family="system-ui,sans-serif" fill="#6b7280">${lbl}</text>`
    })
    .join('')

  const svg =
    `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ${width} ${height}" width="${width}" height="${height}" role="img" aria-label="Calendário de declarações ${titleYear}">` +
    `<text x="${padL}" y="12" font-size="11" font-family="system-ui,sans-serif" fill="#111827" font-weight="600">${titleYear} — ${tally.size} dias com declarações (máx/dia: ${maxCount})</text>` +
    dowLabels +
    cells.join('') +
    `</svg>`

  const etag = `W/"cal-${titleYear}-${data?.length ?? 0}-${maxCount}"`
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
