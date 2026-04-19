import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/categorias/:slug/stats.json — aggregate stats for one
 * category: totals, severity histogram, verification breakdown,
 * top-10 politicians, monthly activity (last 24 months).
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'categ-stats'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED' } },
      { status: 429 },
    )
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const supabase = getSupabaseServiceClient()
  const { data: cat } = await (supabase.from('categories') as any)
    .select('id, slug, label_pt, color_hex, description')
    .eq('slug', slug)
    .maybeSingle()
  if (!cat) {
    return NextResponse.json({ error: 'Categoria não encontrada' }, { status: 404 })
  }

  // All statements in this category (capped at 10k for aggregation).
  const { data: rows } = await (supabase.from('statement_categories') as any)
    .select('statements!inner(id, statement_date, verification_status, severity_score, politician_id, politicians!inner(slug, common_name, party, state))')
    .eq('category_id', cat.id)
    .limit(10000)

  type Row = {
    statements: {
      id: string; statement_date: string; verification_status: string; severity_score: number | null
      politician_id: string
      politicians: { slug: string; common_name: string; party: string | null; state: string | null }
    } | null
  }
  const stmts = ((rows ?? []) as Row[])
    .map((r) => r.statements)
    .filter((s): s is NonNullable<Row['statements']> => s !== null && s.verification_status !== 'removed')

  const total = stmts.length
  const verified = stmts.filter((s) => s.verification_status === 'verified').length
  const severity: Record<number, number> = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0 }
  for (const s of stmts) {
    const sv = (s.severity_score ?? 1) as 1 | 2 | 3 | 4 | 5
    if (sv >= 1 && sv <= 5) severity[sv]++
  }

  const polMap = new Map<string, { slug: string; common_name: string; party: string | null; state: string | null; count: number }>()
  for (const s of stmts) {
    const e = polMap.get(s.politician_id)
    if (e) e.count++
    else polMap.set(s.politician_id, { ...s.politicians, count: 1 })
  }
  const topPoliticians = [...polMap.values()].sort((a, b) => b.count - a.count).slice(0, 10)

  // Monthly (24m window).
  const now = new Date()
  const months: string[] = []
  for (let i = 23; i >= 0; i--) {
    const d = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - i, 1))
    months.push(`${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`)
  }
  const monthMap = new Map<string, number>(months.map((m) => [m, 0]))
  for (const s of stmts) {
    const key = s.statement_date.slice(0, 7)
    if (monthMap.has(key)) monthMap.set(key, (monthMap.get(key) ?? 0) + 1)
  }
  const monthly = months.map((m) => ({ month: m, count: monthMap.get(m) ?? 0 }))

  return NextResponse.json({
    category: {
      slug: cat.slug,
      label: cat.label_pt,
      color: cat.color_hex,
      description: cat.description,
      url: `${SITE_URL}/categorias/${cat.slug}`,
    },
    stats: {
      total,
      verified_count: verified,
      verified_ratio: total === 0 ? 0 : +(verified / total).toFixed(3),
      severity_histogram: severity,
      top_politicians: topPoliticians,
      monthly_24m: monthly,
    },
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
    },
  })
}
