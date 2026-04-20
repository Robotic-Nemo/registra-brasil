import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/politico/:slug/por-semana.json — weekly (ISO, UTC) bucket
 * counts for one politician across the last N weeks. Complements
 * `/monthly.json`: finer resolution for activity-map UIs.
 *
 *   ?semanas=4..104 (default 26)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'pol-por-semana'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const semanas = Math.max(4, Math.min(104, Number(request.nextUrl.searchParams.get('semanas')) || 26))

  const supabase = getSupabaseServiceClient()
  const { data: pol } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name')
    .eq('slug', slug)
    .maybeSingle()
  if (!pol) {
    return NextResponse.json({ error: 'não encontrado' }, { status: 404 })
  }

  // Anchor start at UTC Monday `semanas-1` weeks ago.
  const now = new Date()
  const todayUtc = Date.UTC(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate())
  const dow = new Date(todayUtc).getUTCDay() // 0=Sun..6=Sat
  const mondayOffset = (dow + 6) % 7 // Mon=0, Sun=6
  const thisMonday = todayUtc - mondayOffset * 86400_000
  const startMs = thisMonday - (semanas - 1) * 7 * 86400_000
  const startStr = new Date(startMs).toISOString().slice(0, 10)

  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, verification_status, severity_score')
    .eq('politician_id', pol.id)
    .neq('verification_status', 'removed')
    .gte('statement_date', startStr)
    .limit(10000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; verification_status: string; severity_score: number | null }
  const rows = (data ?? []) as Row[]

  function weekKey(dateStr: string): string {
    const [y, m, d] = dateStr.split('-').map(Number)
    const ms = Date.UTC(y, (m ?? 1) - 1, d ?? 1)
    const dow = new Date(ms).getUTCDay()
    const offset = (dow + 6) % 7
    const monday = ms - offset * 86400_000
    return new Date(monday).toISOString().slice(0, 10)
  }

  const buckets = new Map<string, { total: number; verified: number; disputed: number; sevSum: number; sevN: number }>()
  for (const r of rows) {
    const k = weekKey(r.statement_date.slice(0, 10))
    let b = buckets.get(k)
    if (!b) { b = { total: 0, verified: 0, disputed: 0, sevSum: 0, sevN: 0 }; buckets.set(k, b) }
    b.total++
    if (r.verification_status === 'verified') b.verified++
    else if (r.verification_status === 'disputed') b.disputed++
    if (r.severity_score != null) { b.sevSum += r.severity_score; b.sevN++ }
  }

  const series: Array<{ week_start: string; total: number; verified: number; disputed: number; avg_severity: number | null }> = []
  for (let i = 0; i < semanas; i++) {
    const ms = startMs + i * 7 * 86400_000
    const key = new Date(ms).toISOString().slice(0, 10)
    const b = buckets.get(key)
    series.push({
      week_start: key,
      total: b?.total ?? 0,
      verified: b?.verified ?? 0,
      disputed: b?.disputed ?? 0,
      avg_severity: b && b.sevN > 0 ? +(b.sevSum / b.sevN).toFixed(2) : null,
    })
  }

  const total = series.reduce((s, x) => s + x.total, 0)
  const etag = `W/"pol-por-semana-${pol.id}-${semanas}-${total}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    politician: { slug: pol.slug, common_name: pol.common_name, url: `${SITE_URL}/politico/${pol.slug}` },
    semanas,
    total,
    series,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
