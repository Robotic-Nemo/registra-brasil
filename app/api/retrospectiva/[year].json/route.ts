import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

interface Params { params: Promise<{ year: string }> }

/**
 * GET /api/retrospectiva/[year].json — aggregate year summary: counts,
 * monthly histogram, top 10 politicians, top 6 categories, notable
 * (severity >= 4 verified), disputed highlights, revision tally.
 * Mirrors the /retrospectiva/[year] HTML page server-side aggregation
 * but returns the raw numbers in a single JSON payload.
 */
export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'retro-json'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { year: yearStr } = await params
  const year = parseInt(yearStr, 10)
  if (!Number.isFinite(year) || year < 1980 || year > 2100) {
    return NextResponse.json({ error: 'invalid_year' }, { status: 400 })
  }

  const startIso = `${year}-01-01`
  const endIso = `${year}-12-31`
  const yearStartTs = `${year}-01-01T00:00:00Z`
  const yearEndTs = `${year + 1}-01-01T00:00:00Z`

  const supabase = getSupabaseServiceClient()

  const [stRes, revRes] = await Promise.all([
    (supabase.from('statements') as any)
      .select('id, slug, summary, statement_date, verification_status, severity_score, politician_id, politicians(slug, common_name, party, state), statement_categories(is_primary, categories(slug, label_pt, color_hex))')
      .neq('verification_status', 'removed')
      .gte('statement_date', startIso)
      .lte('statement_date', endIso)
      .order('statement_date', { ascending: false })
      .limit(5000),
    (supabase.from('statement_revisions') as any)
      .select('id, statement_id, created_at', { count: 'exact', head: true })
      .gte('created_at', yearStartTs)
      .lt('created_at', yearEndTs),
  ])

  type StmtRow = {
    id: string; slug: string | null; summary: string; statement_date: string
    verification_status: string; severity_score: number | null; politician_id: string
    politicians: { slug: string; common_name: string; party: string | null; state: string | null } | null
    statement_categories: Array<{ is_primary: boolean; categories: { slug: string; label_pt: string; color_hex: string } | null }>
  }
  const statements = (stRes.data ?? []) as StmtRow[]
  if (statements.length === 0) {
    return NextResponse.json({ error: 'empty_year', year }, { status: 404 })
  }

  const byStatus: Record<string, number> = {}
  const byMonth = new Array<number>(12).fill(0)
  const byPol = new Map<string, { slug: string; name: string; party: string | null; state: string | null; count: number; severity: number }>()
  const byCat = new Map<string, { slug: string; label: string; color: string; count: number }>()

  for (const s of statements) {
    byStatus[s.verification_status] = (byStatus[s.verification_status] ?? 0) + 1
    const m = parseInt(s.statement_date.slice(5, 7), 10) - 1
    if (m >= 0 && m < 12) byMonth[m]++
    if (s.politicians) {
      const key = s.politician_id
      const ex = byPol.get(key) ?? { slug: s.politicians.slug, name: s.politicians.common_name, party: s.politicians.party, state: s.politicians.state, count: 0, severity: 0 }
      ex.count++
      ex.severity += s.severity_score ?? 3
      byPol.set(key, ex)
    }
    for (const sc of s.statement_categories) {
      if (sc.is_primary && sc.categories) {
        const c = sc.categories
        const ex = byCat.get(c.slug) ?? { slug: c.slug, label: c.label_pt, color: c.color_hex, count: 0 }
        ex.count++
        byCat.set(c.slug, ex)
      }
    }
  }

  const topPoliticians = [...byPol.values()]
    .sort((a, b) => b.count - a.count || b.severity - a.severity)
    .slice(0, 10)
  const topCategories = [...byCat.values()].sort((a, b) => b.count - a.count).slice(0, 6)

  const notable = statements
    .filter((s) => s.verification_status === 'verified' && (s.severity_score ?? 0) >= 4)
    .sort((a, b) => (b.severity_score ?? 0) - (a.severity_score ?? 0))
    .slice(0, 10)
    .map((s) => ({
      id: s.id,
      slug: s.slug,
      summary: s.summary,
      statement_date: s.statement_date,
      severity_score: s.severity_score,
      permalink: `${SITE_URL}/declaracao/${s.slug ?? s.id}`,
      politician: s.politicians,
    }))

  const disputed = statements
    .filter((s) => s.verification_status === 'disputed')
    .slice(0, 10)
    .map((s) => ({
      id: s.id,
      slug: s.slug,
      summary: s.summary,
      statement_date: s.statement_date,
      permalink: `${SITE_URL}/declaracao/${s.slug ?? s.id}`,
      politician: s.politicians,
    }))

  return NextResponse.json({
    year,
    total_statements: statements.length,
    by_status: byStatus,
    by_month: byMonth,
    politicians_count: byPol.size,
    categories_count: byCat.size,
    revisions_count: revRes.count ?? 0,
    top_politicians: topPoliticians,
    top_categories: topCategories,
    notable,
    disputed,
    permalink: `${SITE_URL}/retrospectiva/${year}`,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
    },
  })
}
