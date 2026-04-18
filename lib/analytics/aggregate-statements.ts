/**
 * Shared aggregation helpers for scope-bound analytics pages
 * (/categorias/[slug]/analise, /partidos/[slug]/analise,
 * /estados/[uf]/analise). Pulls a statement set once and
 * returns the common rollups.
 */

import type { SupabaseClient } from '@supabase/supabase-js'

export interface StatementForAnalytics {
  id: string
  slug: string | null
  summary: string
  statement_date: string
  verification_status: string
  severity_score: number | null
  politician_id: string
  politicians: {
    id: string
    slug: string
    common_name: string
    party: string
    state: string | null
    photo_url: string | null
  } | null
}

export interface AggregatedAnalytics {
  total: number
  byStatus: Record<string, number>
  bySeverity: Record<string, number>
  months: Array<{ month: string; count: number }>
  maxMonthly: number
  politicianCount: number
  topPoliticians: Array<{
    pol: NonNullable<StatementForAnalytics['politicians']>
    count: number
    severityAvg: number
  }>
  topCategories: Array<{ slug: string; label_pt: string; color_hex: string; count: number }>
  recent: StatementForAnalytics[]
}

function monthKey(d: string): string {
  return d.slice(0, 7)
}

export function aggregate(statements: StatementForAnalytics[], monthsBack = 24): Omit<AggregatedAnalytics, 'topCategories'> {
  const byStatus: Record<string, number> = {}
  const bySeverity: Record<string, number> = {}
  const byMonth = new Map<string, number>()
  const byPolitician = new Map<string, { pol: NonNullable<StatementForAnalytics['politicians']>; count: number; severitySum: number }>()

  for (const s of statements) {
    byStatus[s.verification_status] = (byStatus[s.verification_status] ?? 0) + 1
    if (s.severity_score) bySeverity[s.severity_score] = (bySeverity[s.severity_score] ?? 0) + 1
    byMonth.set(monthKey(s.statement_date), (byMonth.get(monthKey(s.statement_date)) ?? 0) + 1)
    if (s.politicians) {
      const existing = byPolitician.get(s.politician_id) ?? { pol: s.politicians, count: 0, severitySum: 0 }
      existing.count++
      existing.severitySum += s.severity_score ?? 3
      byPolitician.set(s.politician_id, existing)
    }
  }

  const now = new Date()
  const months: Array<{ month: string; count: number }> = []
  for (let i = monthsBack - 1; i >= 0; i--) {
    const d = new Date(now.getUTCFullYear(), now.getUTCMonth() - i, 1)
    const k = `${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`
    months.push({ month: k, count: byMonth.get(k) ?? 0 })
  }

  const topPoliticians = [...byPolitician.values()]
    .map((x) => ({ pol: x.pol, count: x.count, severityAvg: x.severitySum / Math.max(1, x.count) }))
    .sort((a, b) => b.count - a.count || b.severityAvg - a.severityAvg)
    .slice(0, 10)

  const recent = [...statements]
    .sort((a, b) => (a.statement_date < b.statement_date ? 1 : -1))
    .slice(0, 6)

  return {
    total: statements.length,
    byStatus,
    bySeverity,
    months,
    maxMonthly: Math.max(1, ...months.map((m) => m.count)),
    politicianCount: byPolitician.size,
    topPoliticians,
    recent,
  }
}

/**
 * Second query: primary category tally for a given statement-id set.
 */
export async function topCategoriesFor(
  supabase: SupabaseClient,
  statementIds: string[],
  limit = 8,
): Promise<AggregatedAnalytics['topCategories']> {
  if (statementIds.length === 0) return []
  const { data } = await (supabase.from('statement_categories') as any)
    .select('categories(slug, label_pt, color_hex)')
    .in('statement_id', statementIds.slice(0, 2000))
    .eq('is_primary', true)

  const tally = new Map<string, { slug: string; label_pt: string; color_hex: string; count: number }>()
  for (const row of (data ?? []) as Array<{ categories: { slug: string; label_pt: string; color_hex: string } | null }>) {
    const c = row.categories
    if (!c) continue
    const existing = tally.get(c.slug) ?? { ...c, count: 0 }
    existing.count++
    tally.set(c.slug, existing)
  }
  return [...tally.values()].sort((a, b) => b.count - a.count).slice(0, limit)
}
