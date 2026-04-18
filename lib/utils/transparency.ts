/**
 * Site-wide editorial-accountability metrics. Single source of truth for
 * both the public /transparencia page and the /api/transparencia.json
 * open-data endpoint — so the numbers match exactly.
 */

import type { SupabaseClient } from '@supabase/supabase-js'

export interface MonthBucket {
  month: string // YYYY-MM
  revisions: number
  new_statements: number
  retractions_opened: number
  retractions_replied: number
  submissions_received: number
}

export interface TransparencyReport {
  generated_at: string
  totals: {
    statements: number
    verified: number
    disputed: number
    removed: number
    politicians: number
    categories: number
    fact_checks: number
  }
  revisions: {
    total: number
    last_30_days: number
    by_actor: { actor: string; count: number }[]
  }
  retractions: {
    total: number
    by_status: Record<string, number>
    last_30_days: number
  }
  submissions: {
    total: number
    by_status: Record<string, number>
    acceptance_rate: number
    last_30_days: number
  }
  reactions: Record<string, number>
  imports: {
    total_batches: number
    rows_created: number
    batches_reverted: number
  }
  monthly: MonthBucket[] // last 12 months, oldest first
}

function monthKeysLast12(): string[] {
  const out: string[] = []
  const now = new Date()
  for (let i = 11; i >= 0; i--) {
    const d = new Date(now.getUTCFullYear(), now.getUTCMonth() - i, 1)
    out.push(`${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`)
  }
  return out
}

function monthKey(d: Date): string {
  return `${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`
}

export async function buildTransparencyReport(supabase: SupabaseClient): Promise<TransparencyReport> {
  const since12mo = new Date()
  since12mo.setUTCMonth(since12mo.getUTCMonth() - 12)
  const sinceIso = since12mo.toISOString()

  const since30 = new Date(Date.now() - 30 * 86400_000).toISOString()

  // Totals
  const [
    statementsCounts,
    politiciansCount,
    categoriesCount,
    factChecksCount,
    revisionsRows,
    retractionRows,
    submissionRows,
    reactionRows,
    importsRows,
    statementsMonthly,
  ] = await Promise.all([
    (supabase.from('statements') as any).select('verification_status', { count: 'exact', head: false }),
    (supabase.from('politicians') as any).select('id', { count: 'exact', head: true }).eq('is_active', true),
    (supabase.from('categories') as any).select('id', { count: 'exact', head: true }),
    (supabase.from('statement_fact_checks') as any).select('id', { count: 'exact', head: true }),
    (supabase.from('statement_revisions') as any).select('actor, created_at'),
    (supabase.from('retraction_requests') as any).select('status, created_at, public_reply_published_at'),
    (supabase.from('statement_submissions') as any).select('status, created_at'),
    (supabase.from('statement_reactions') as any).select('reaction'),
    (supabase.from('import_batches') as any).select('status, row_count_created'),
    (supabase.from('statements') as any).select('created_at').gt('created_at', sinceIso),
  ])

  const statements = (statementsCounts.data ?? []) as Array<{ verification_status: string }>
  const totals = {
    statements: statements.length,
    verified: statements.filter((s) => s.verification_status === 'verified').length,
    disputed: statements.filter((s) => s.verification_status === 'disputed').length,
    removed: statements.filter((s) => s.verification_status === 'removed').length,
    politicians: (politiciansCount as any).count ?? 0,
    categories: (categoriesCount as any).count ?? 0,
    fact_checks: (factChecksCount as any).count ?? 0,
  }

  const revisions = (revisionsRows.data ?? []) as Array<{ actor: string | null; created_at: string }>
  const actorCounts = new Map<string, number>()
  for (const r of revisions) {
    const a = r.actor ?? 'admin'
    actorCounts.set(a, (actorCounts.get(a) ?? 0) + 1)
  }
  const revisionsStats = {
    total: revisions.length,
    last_30_days: revisions.filter((r) => r.created_at >= since30).length,
    by_actor: [...actorCounts.entries()].map(([actor, count]) => ({ actor, count }))
      .sort((a, b) => b.count - a.count),
  }

  const retractions = (retractionRows.data ?? []) as Array<{ status: string; created_at: string; public_reply_published_at: string | null }>
  const retractionsByStatus: Record<string, number> = {}
  for (const r of retractions) retractionsByStatus[r.status] = (retractionsByStatus[r.status] ?? 0) + 1
  const retractionsStats = {
    total: retractions.length,
    by_status: retractionsByStatus,
    last_30_days: retractions.filter((r) => r.created_at >= since30).length,
  }

  const submissions = (submissionRows.data ?? []) as Array<{ status: string; created_at: string }>
  const submByStatus: Record<string, number> = {}
  for (const s of submissions) submByStatus[s.status] = (submByStatus[s.status] ?? 0) + 1
  const decided = (submByStatus.approved ?? 0) + (submByStatus.rejected ?? 0)
  const submissionsStats = {
    total: submissions.length,
    by_status: submByStatus,
    acceptance_rate: decided > 0 ? (submByStatus.approved ?? 0) / decided : 0,
    last_30_days: submissions.filter((s) => s.created_at >= since30).length,
  }

  const reactions: Record<string, number> = {}
  for (const r of ((reactionRows.data ?? []) as Array<{ reaction: string }>)) {
    reactions[r.reaction] = (reactions[r.reaction] ?? 0) + 1
  }

  const imports = (importsRows.data ?? []) as Array<{ status: string; row_count_created: number }>
  const importsStats = {
    total_batches: imports.length,
    rows_created: imports.reduce((a, b) => a + (b.row_count_created ?? 0), 0),
    batches_reverted: imports.filter((i) => i.status === 'reverted').length,
  }

  // Build monthly buckets (12 last months).
  const months = monthKeysLast12()
  const monthly = new Map<string, MonthBucket>()
  for (const m of months) {
    monthly.set(m, {
      month: m, revisions: 0, new_statements: 0,
      retractions_opened: 0, retractions_replied: 0,
      submissions_received: 0,
    })
  }

  function bump(field: keyof Omit<MonthBucket, 'month'>, iso: string | null | undefined) {
    if (!iso) return
    const k = monthKey(new Date(iso))
    const bucket = monthly.get(k)
    if (bucket) bucket[field]++
  }

  for (const r of revisions) bump('revisions', r.created_at)
  for (const s of submissions) bump('submissions_received', s.created_at)
  for (const r of retractions) {
    bump('retractions_opened', r.created_at)
    if (r.public_reply_published_at) bump('retractions_replied', r.public_reply_published_at)
  }
  for (const s of (statementsMonthly.data ?? []) as Array<{ created_at: string }>) {
    bump('new_statements', s.created_at)
  }

  return {
    generated_at: new Date().toISOString(),
    totals,
    revisions: revisionsStats,
    retractions: retractionsStats,
    submissions: submissionsStats,
    reactions,
    imports: importsStats,
    monthly: [...monthly.values()],
  }
}
