import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

/**
 * GET /api/search/facets.json — facet counts for the /buscar UI
 * and any third-party search client. Returns buckets for:
 *   • verification_status (verified/unverified/disputed)
 *   • severity_score (1..5)
 *   • primary_source_type
 *   • party (top 20 by count)
 *   • state (UF)
 *   • categories (top 40)
 *
 * Computed from a recent-2-year window to keep the payload current
 * and bounded (older claims skew toward defunct parties etc).
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'facets'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const supabase = getSupabaseServiceClient()
  const cutoff = new Date()
  cutoff.setUTCFullYear(cutoff.getUTCFullYear() - 2)
  const cutoffIso = cutoff.toISOString().slice(0, 10)

  const [stmtRes, catRes] = await Promise.all([
    (supabase.from('statements') as any)
      .select('verification_status, severity_score, primary_source_type, politicians!inner(party, state)')
      .neq('verification_status', 'removed')
      .gte('statement_date', cutoffIso)
      .limit(30000),
    (supabase.from('statement_categories') as any)
      .select('is_primary, statements!inner(statement_date, verification_status), categories!inner(slug, label_pt, color_hex)')
      .gte('statements.statement_date', cutoffIso)
      .eq('is_primary', true)
      .limit(40000),
  ])

  type StmtRow = {
    verification_status: string
    severity_score: number | null
    primary_source_type: string | null
    politicians: { party: string | null; state: string | null } | null
  }
  const rows = ((stmtRes.data ?? []) as StmtRow[]).filter((r) => r.politicians)

  const statusCounts = new Map<string, number>()
  const severityCounts = new Map<number, number>()
  const sourceTypeCounts = new Map<string, number>()
  const partyCounts = new Map<string, number>()
  const stateCounts = new Map<string, number>()

  for (const r of rows) {
    statusCounts.set(r.verification_status, (statusCounts.get(r.verification_status) ?? 0) + 1)
    const sv = r.severity_score ?? 0
    severityCounts.set(sv, (severityCounts.get(sv) ?? 0) + 1)
    if (r.primary_source_type) {
      sourceTypeCounts.set(r.primary_source_type, (sourceTypeCounts.get(r.primary_source_type) ?? 0) + 1)
    }
    if (r.politicians?.party) {
      partyCounts.set(r.politicians.party, (partyCounts.get(r.politicians.party) ?? 0) + 1)
    }
    if (r.politicians?.state) {
      stateCounts.set(r.politicians.state, (stateCounts.get(r.politicians.state) ?? 0) + 1)
    }
  }

  type CatRow = {
    categories: { slug: string; label_pt: string; color_hex: string }
  }
  const catCounts = new Map<string, { slug: string; label: string; color: string; count: number }>()
  for (const r of ((catRes.data ?? []) as CatRow[])) {
    const c = r.categories
    if (!c) continue
    const e = catCounts.get(c.slug)
    if (e) e.count++
    else catCounts.set(c.slug, { slug: c.slug, label: c.label_pt, color: c.color_hex, count: 1 })
  }

  const tupleSort = <T extends { count: number }>(m: Iterable<T>, n?: number) => {
    const arr = [...m].sort((a, b) => b.count - a.count)
    return n ? arr.slice(0, n) : arr
  }

  const etag = `W/"fac-${rows.length}-${catCounts.size}-${cutoffIso}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    window_start: cutoffIso,
    total_statements: rows.length,
    verification_status: [...statusCounts.entries()].map(([k, v]) => ({ key: k, count: v })),
    severity_score: [...severityCounts.entries()].sort((a, b) => a[0] - b[0]).map(([k, v]) => ({ key: k, count: v })),
    primary_source_type: tupleSort([...sourceTypeCounts.entries()].map(([k, v]) => ({ key: k, count: v }))),
    party: tupleSort([...partyCounts.entries()].map(([k, v]) => ({ key: k, count: v })), 20),
    state: tupleSort([...stateCounts.entries()].map(([k, v]) => ({ key: k, count: v }))),
    categories: tupleSort([...catCounts.values()], 40),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
