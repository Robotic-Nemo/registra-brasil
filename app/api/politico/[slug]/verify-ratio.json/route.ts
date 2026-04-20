import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/politico/:slug/verify-ratio.json — verified/disputed/
 * unverified counts + ratios for a politician, plus a per-month
 * trend over the last `?meses` months (UTC). Single row-scan then
 * grouped in memory.
 *   ?meses=3..24 (default 12)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'pol-verify-ratio'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const meses = Math.max(3, Math.min(24, Number(request.nextUrl.searchParams.get('meses')) || 12))

  const supabase = getSupabaseServiceClient()
  const { data: p } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name')
    .eq('slug', slug)
    .maybeSingle()
  if (!p) {
    return NextResponse.json({ error: 'não encontrado' }, { status: 404 })
  }

  // Start-of-month `meses-1` months ago (UTC).
  const now = new Date()
  const startY = now.getUTCFullYear()
  const startM = now.getUTCMonth() - (meses - 1)
  const firstOfMonthUtc = Date.UTC(startY, startM, 1)
  const startStr = new Date(firstOfMonthUtc).toISOString().slice(0, 10)

  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, verification_status')
    .eq('politician_id', p.id)
    .neq('verification_status', 'removed')
    .gte('statement_date', startStr)
    .limit(10000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; verification_status: string }
  const rows = (data ?? []) as Row[]

  // Gap-fill month buckets.
  const months: Array<{ month: string; verified: number; disputed: number; unverified: number; total: number; ratio_verified: number | null }> = []
  for (let i = 0; i < meses; i++) {
    const d = new Date(Date.UTC(startY, startM + i, 1))
    months.push({
      month: d.toISOString().slice(0, 7),
      verified: 0, disputed: 0, unverified: 0, total: 0, ratio_verified: null,
    })
  }
  const idx = new Map(months.map((m, i) => [m.month, i]))

  let verified = 0, disputed = 0, unverified = 0
  for (const r of rows) {
    const key = r.statement_date.slice(0, 7)
    const i = idx.get(key)
    if (i === undefined) continue
    const b = months[i]!
    b.total++
    if (r.verification_status === 'verified') { b.verified++; verified++ }
    else if (r.verification_status === 'disputed') { b.disputed++; disputed++ }
    else { b.unverified++; unverified++ }
  }
  for (const m of months) {
    m.ratio_verified = m.total > 0 ? +(m.verified / m.total).toFixed(3) : null
  }
  const total = verified + disputed + unverified

  const summary = {
    total,
    verified, disputed, unverified,
    ratio_verified: total > 0 ? +(verified / total).toFixed(3) : null,
    ratio_disputed: total > 0 ? +(disputed / total).toFixed(3) : null,
  }

  const etag = `W/"pol-verify-ratio-${p.id.slice(0, 8)}-${meses}-${verified}-${disputed}-${unverified}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    politician: { slug: p.slug, common_name: p.common_name, url: `${SITE_URL}/politico/${p.slug}` },
    meses,
    summary,
    trend: months,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
