import type { SupabaseClient } from '@supabase/supabase-js'

export interface WeeklyCount {
  week: string
  count: number
}

export interface DashboardMetrics {
  totalStatements: number
  totalVerified: number
  totalUnverified: number
  totalDisputed: number
  totalPoliticians: number
  totalCategories: number
  statementsThisWeek: number
  statementsLastWeek: number
  verificationsThisWeek: number
  verificationsLastWeek: number
}

export interface PendingReviewItem {
  id: string
  summary: string
  politician_name: string
  statement_date: string
  created_at: string
}

export interface RecentEditItem {
  id: string
  summary: string
  politician_name: string
  reviewed_at: string
  verification_status: string
}

export interface TopContributor {
  reviewed_by: string
  review_count: number
}

export async function getWeeklyCounts(
  supabase: SupabaseClient,
  weeks = 12
): Promise<WeeklyCount[]> {
  // Previously this ran `weeks` head-count queries **sequentially**,
  // one `await` per week — at 12 weeks that's 12 round-trips and the
  // dashboard blocked on their sum. We now issue all week head-counts
  // in parallel via Promise.all (~1 RTT total) and preserve order
  // by index, not arrival time.
  const now = new Date()
  const bounds: Array<{ week: string; start: string; end: string }> = []
  for (let i = weeks - 1; i >= 0; i--) {
    const weekStart = new Date(now)
    weekStart.setUTCDate(now.getUTCDate() - (i + 1) * 7)
    const weekEnd = new Date(now)
    weekEnd.setUTCDate(now.getUTCDate() - i * 7)
    bounds.push({
      week: weekStart.toISOString().slice(0, 10),
      start: weekStart.toISOString(),
      end: weekEnd.toISOString(),
    })
  }

  const results = await Promise.all(bounds.map(async (b) => {
    const { count } = await supabase
      .from('statements')
      .select('id', { count: 'exact', head: true })
      .gte('created_at', b.start)
      .lt('created_at', b.end)
    return { week: b.week, count: count ?? 0 }
  }))

  return results
}

export async function getDashboardMetrics(
  supabase: SupabaseClient
): Promise<DashboardMetrics> {
  const now = new Date()
  const thisWeekStart = new Date(now)
  thisWeekStart.setDate(now.getDate() - 7)
  const lastWeekStart = new Date(now)
  lastWeekStart.setDate(now.getDate() - 14)

  const [
    { count: totalStatements },
    { count: totalVerified },
    { count: totalUnverified },
    { count: totalDisputed },
    { count: totalPoliticians },
    { count: totalCategories },
    { count: statementsThisWeek },
    { count: statementsLastWeek },
    { count: verificationsThisWeek },
    { count: verificationsLastWeek },
  ] = await Promise.all([
    supabase.from('statements').select('id', { count: 'exact', head: true }),
    supabase.from('statements').select('id', { count: 'exact', head: true }).eq('verification_status', 'verified'),
    supabase.from('statements').select('id', { count: 'exact', head: true }).eq('verification_status', 'unverified'),
    supabase.from('statements').select('id', { count: 'exact', head: true }).eq('verification_status', 'disputed'),
    supabase.from('politicians').select('id', { count: 'exact', head: true }).eq('is_active', true),
    supabase.from('categories').select('id', { count: 'exact', head: true }),
    supabase.from('statements').select('id', { count: 'exact', head: true }).gte('created_at', thisWeekStart.toISOString()),
    supabase.from('statements').select('id', { count: 'exact', head: true }).gte('created_at', lastWeekStart.toISOString()).lt('created_at', thisWeekStart.toISOString()),
    supabase.from('statements').select('id', { count: 'exact', head: true }).eq('verification_status', 'verified').gte('reviewed_at', thisWeekStart.toISOString()),
    supabase.from('statements').select('id', { count: 'exact', head: true }).eq('verification_status', 'verified').gte('reviewed_at', lastWeekStart.toISOString()).lt('reviewed_at', thisWeekStart.toISOString()),
  ])

  return {
    totalStatements: totalStatements ?? 0,
    totalVerified: totalVerified ?? 0,
    totalUnverified: totalUnverified ?? 0,
    totalDisputed: totalDisputed ?? 0,
    totalPoliticians: totalPoliticians ?? 0,
    totalCategories: totalCategories ?? 0,
    statementsThisWeek: statementsThisWeek ?? 0,
    statementsLastWeek: statementsLastWeek ?? 0,
    verificationsThisWeek: verificationsThisWeek ?? 0,
    verificationsLastWeek: verificationsLastWeek ?? 0,
  }
}

export async function getPendingReviewItems(
  supabase: SupabaseClient,
  limit = 10
): Promise<PendingReviewItem[]> {
  const { data, error } = await supabase
    .from('statements')
    .select('id, summary, statement_date, created_at, politicians(common_name)')
    .eq('verification_status', 'unverified')
    .order('created_at', { ascending: false })
    .limit(limit)

  if (error) return []

  return (data ?? []).map((row: unknown) => {
    const r = row as { id: string; summary: string; statement_date: string; created_at: string; politicians: { common_name: string } }
    return {
      id: r.id,
      summary: r.summary,
      politician_name: r.politicians?.common_name ?? 'Desconhecido',
      statement_date: r.statement_date,
      created_at: r.created_at,
    }
  })
}

export async function getRecentEditItems(
  supabase: SupabaseClient,
  limit = 10
): Promise<RecentEditItem[]> {
  const { data, error } = await supabase
    .from('statements')
    .select('id, summary, reviewed_at, verification_status, politicians(common_name)')
    .not('reviewed_at', 'is', null)
    .order('reviewed_at', { ascending: false })
    .limit(limit)

  if (error) return []

  return (data ?? []).map((row: unknown) => {
    const r = row as { id: string; summary: string; reviewed_at: string; verification_status: string; politicians: { common_name: string } }
    return {
      id: r.id,
      summary: r.summary,
      politician_name: r.politicians?.common_name ?? 'Desconhecido',
      reviewed_at: r.reviewed_at,
      verification_status: r.verification_status,
    }
  })
}

export async function getTopContributors(
  supabase: SupabaseClient,
  limit = 5
): Promise<TopContributor[]> {
  const { data, error } = await supabase
    .from('statements')
    .select('reviewed_by')
    .not('reviewed_by', 'is', null)

  if (error || !data) return []

  const counts = new Map<string, number>()
  for (const row of data as { reviewed_by: string | null }[]) {
    if (row.reviewed_by) {
      counts.set(row.reviewed_by, (counts.get(row.reviewed_by) ?? 0) + 1)
    }
  }

  return Array.from(counts.entries())
    .sort((a, b) => b[1] - a[1])
    .slice(0, limit)
    .map(([reviewed_by, review_count]) => ({ reviewed_by, review_count }))
}

export async function getStatementDateDistribution(
  supabase: SupabaseClient
): Promise<{ date: string; count: number }[]> {
  const { data, error } = await supabase
    .from('statements')
    .select('statement_date')
    .neq('verification_status', 'removed')

  if (error || !data) return []

  const counts = new Map<string, number>()
  for (const row of data as { statement_date: string }[]) {
    const date = row.statement_date?.slice(0, 10)
    if (date) {
      counts.set(date, (counts.get(date) ?? 0) + 1)
    }
  }

  return Array.from(counts.entries())
    .sort((a, b) => a[0].localeCompare(b[0]))
    .map(([date, count]) => ({ date, count }))
}
