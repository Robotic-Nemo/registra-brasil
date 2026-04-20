import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/politico/:slug/sparkline.json — 12-bucket monthly
 * statement count for a politician, ending with the current month.
 * Small enough to embed in cards/OG images; cached 1h at the edge.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'spark'), {
    limit: 120, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const months = Math.max(3, Math.min(24, Number(request.nextUrl.searchParams.get('meses')) || 12))

  const supabase = getSupabaseServiceClient()
  const { data: p } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name')
    .eq('slug', slug)
    .maybeSingle()
  if (!p) {
    return NextResponse.json({ error: 'Político não encontrado' }, { status: 404 })
  }

  // Window start = first day of (current month - months+1).
  const now = new Date()
  const start = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (months - 1), 1))
  const startIso = start.toISOString().slice(0, 10)

  const { data: rows } = await (supabase.from('statements') as any)
    .select('statement_date, severity_score')
    .eq('politician_id', p.id)
    .neq('verification_status', 'removed')
    .gte('statement_date', startIso)
    .limit(5000)

  type R = { statement_date: string; severity_score: number | null }
  const stmts = (rows ?? []) as R[]

  // Build buckets. Track severity sum + count separately so statements
  // with a null severity_score don't dilute the monthly average.
  const buckets: { ym: string; count: number; severity_sum: number; severity_n: number }[] = []
  for (let i = 0; i < months; i++) {
    const d = new Date(Date.UTC(start.getUTCFullYear(), start.getUTCMonth() + i, 1))
    buckets.push({
      ym: `${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`,
      count: 0,
      severity_sum: 0,
      severity_n: 0,
    })
  }
  const byYm = new Map(buckets.map((b) => [b.ym, b]))
  for (const r of stmts) {
    const ym = r.statement_date?.slice(0, 7)
    if (!ym) continue
    const b = byYm.get(ym)
    if (!b) continue
    b.count++
    if (r.severity_score != null) {
      b.severity_sum += r.severity_score
      b.severity_n++
    }
  }

  const peak = buckets.reduce((m, b) => Math.max(m, b.count), 0)

  return NextResponse.json({
    politician: { slug: p.slug, common_name: p.common_name },
    months,
    peak,
    total: stmts.length,
    buckets: buckets.map((b) => ({
      month: b.ym,
      count: b.count,
      avg_severity: b.severity_n > 0 ? +(b.severity_sum / b.severity_n).toFixed(2) : null,
    })),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
    },
  })
}
