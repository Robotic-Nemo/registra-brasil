import type { SupabaseClient } from '@supabase/supabase-js'

// ── Time-series data ────────────────────────────────────────────────────────

export interface TimeSeriesPoint {
  period: string // YYYY-MM
  count: number
}

export async function getStatementTimeSeries(
  supabase: SupabaseClient,
  months = 24
): Promise<TimeSeriesPoint[]> {
  const startDate = new Date()
  startDate.setMonth(startDate.getMonth() - months)
  const startStr = startDate.toISOString().slice(0, 10)

  const { data, error } = await supabase
    .from('statements')
    .select('statement_date')
    .eq('verification_status', 'verified')
    .gte('statement_date', startStr)
    .order('statement_date', { ascending: true })

  if (error || !data) return []

  const counts = new Map<string, number>()
  for (const row of data as { statement_date: string }[]) {
    const month = row.statement_date.slice(0, 7)
    counts.set(month, (counts.get(month) ?? 0) + 1)
  }

  const result: TimeSeriesPoint[] = []
  const current = new Date(startDate)
  const now = new Date()
  while (current <= now) {
    const key = `${current.getFullYear()}-${String(current.getMonth() + 1).padStart(2, '0')}`
    result.push({ period: key, count: counts.get(key) ?? 0 })
    current.setMonth(current.getMonth() + 1)
  }
  return result
}

// ── Party distribution ──────────────────────────────────────────────────────

export interface PartyDistribution {
  party: string
  count: number
  percentage: number
}

export async function getPartyDistribution(
  supabase: SupabaseClient
): Promise<PartyDistribution[]> {
  const { data, error } = await supabase
    .from('statements')
    .select('politicians!inner(party)')
    .eq('verification_status', 'verified')

  if (error || !data) return []

  const counts = new Map<string, number>()
  let total = 0
  for (const row of data as unknown as { politicians: { party: string } }[]) {
    const party = row.politicians.party
    counts.set(party, (counts.get(party) ?? 0) + 1)
    total++
  }

  return Array.from(counts.entries())
    .map(([party, count]) => ({
      party,
      count,
      percentage: total > 0 ? (count / total) * 100 : 0,
    }))
    .sort((a, b) => b.count - a.count)
}

// ── State distribution ──────────────────────────────────────────────────────

export interface StateDistribution {
  state: string
  count: number
  percentage: number
}

export async function getStateDistribution(
  supabase: SupabaseClient
): Promise<StateDistribution[]> {
  const { data, error } = await supabase
    .from('statements')
    .select('politicians!inner(state)')
    .eq('verification_status', 'verified')

  if (error || !data) return []

  const counts = new Map<string, number>()
  let total = 0
  for (const row of data as unknown as { politicians: { state: string | null } }[]) {
    const state = row.politicians.state ?? 'Sem estado'
    counts.set(state, (counts.get(state) ?? 0) + 1)
    total++
  }

  return Array.from(counts.entries())
    .map(([state, count]) => ({
      state,
      count,
      percentage: total > 0 ? (count / total) * 100 : 0,
    }))
    .sort((a, b) => b.count - a.count)
}

// ── Category distribution ───────────────────────────────────────────────────

export interface CategoryDistribution {
  slug: string
  label: string
  color: string
  count: number
  percentage: number
}

export async function getCategoryDistribution(
  supabase: SupabaseClient
): Promise<CategoryDistribution[]> {
  const { data, error } = await supabase
    .from('statement_categories')
    .select('categories(slug, label_pt, color_hex), statements!inner(verification_status)')
    .eq('statements.verification_status', 'verified')

  if (error || !data) return []

  const counts = new Map<string, { label: string; color: string; count: number }>()
  let total = 0
  for (const row of data as unknown as { categories: { slug: string; label_pt: string; color_hex: string } }[]) {
    const cat = row.categories
    const existing = counts.get(cat.slug) ?? { label: cat.label_pt, color: cat.color_hex, count: 0 }
    existing.count++
    counts.set(cat.slug, existing)
    total++
  }

  return Array.from(counts.entries())
    .map(([slug, { label, color, count }]) => ({
      slug,
      label,
      color,
      count,
      percentage: total > 0 ? (count / total) * 100 : 0,
    }))
    .sort((a, b) => b.count - a.count)
}

// ── Party time series ───────────────────────────────────────────────────────

export interface PartyTimeSeries {
  party: string
  data: TimeSeriesPoint[]
}

export async function getPartyTimeSeries(
  supabase: SupabaseClient,
  parties: string[],
  months = 12
): Promise<PartyTimeSeries[]> {
  const startDate = new Date()
  startDate.setMonth(startDate.getMonth() - months)
  const startStr = startDate.toISOString().slice(0, 10)

  const { data, error } = await supabase
    .from('statements')
    .select('statement_date, politicians!inner(party)')
    .eq('verification_status', 'verified')
    .gte('statement_date', startStr)

  if (error || !data) return []

  const partyMonthCounts = new Map<string, Map<string, number>>()
  for (const row of data as unknown as { statement_date: string; politicians: { party: string } }[]) {
    const party = row.politicians.party
    if (!parties.includes(party)) continue
    const month = row.statement_date.slice(0, 7)
    if (!partyMonthCounts.has(party)) partyMonthCounts.set(party, new Map())
    const monthMap = partyMonthCounts.get(party)!
    monthMap.set(month, (monthMap.get(month) ?? 0) + 1)
  }

  // Build full month range
  const monthKeys: string[] = []
  const current = new Date(startDate)
  const now = new Date()
  while (current <= now) {
    monthKeys.push(`${current.getFullYear()}-${String(current.getMonth() + 1).padStart(2, '0')}`)
    current.setMonth(current.getMonth() + 1)
  }

  return parties.map((party) => {
    const monthMap = partyMonthCounts.get(party) ?? new Map()
    return {
      party,
      data: monthKeys.map((period) => ({ period, count: monthMap.get(period) ?? 0 })),
    }
  })
}

// ── Top politicians ─────────────────────────────────────────────────────────

export interface TopPoliticianStat {
  id: string
  slug: string
  name: string
  party: string
  state: string | null
  photo_url: string | null
  count: number
}

export async function getTopPoliticians(
  supabase: SupabaseClient,
  limit = 20
): Promise<TopPoliticianStat[]> {
  const { data, error } = await supabase
    .from('statements')
    .select('politicians!inner(id, slug, common_name, party, state, photo_url)')
    .eq('verification_status', 'verified')

  if (error || !data) return []

  const counts = new Map<string, TopPoliticianStat>()
  for (const row of data as unknown as { politicians: { id: string; slug: string; common_name: string; party: string; state: string | null; photo_url: string | null } }[]) {
    const p = row.politicians
    const existing = counts.get(p.id)
    if (existing) {
      existing.count++
    } else {
      counts.set(p.id, { id: p.id, slug: p.slug, name: p.common_name, party: p.party, state: p.state, photo_url: p.photo_url, count: 1 })
    }
  }

  return Array.from(counts.values())
    .sort((a, b) => b.count - a.count)
    .slice(0, limit)
}

// ── Summary stats ───────────────────────────────────────────────────────────

export interface SummaryStats {
  totalStatements: number
  totalPoliticians: number
  totalCategories: number
  totalParties: number
  totalStates: number
  newestDate: string | null
  oldestDate: string | null
}

export async function getSummaryStats(
  supabase: SupabaseClient
): Promise<SummaryStats> {
  const [
    { count: totalStatements },
    { data: politicians },
    { data: categories },
    { data: newest },
    { data: oldest },
  ] = await Promise.all([
    supabase.from('statements').select('*', { count: 'exact', head: true }).eq('verification_status', 'verified'),
    supabase.from('politicians').select('party, state').eq('is_active', true),
    supabase.from('categories').select('id'),
    supabase.from('statements').select('statement_date').eq('verification_status', 'verified').order('statement_date', { ascending: false }).limit(1),
    supabase.from('statements').select('statement_date').eq('verification_status', 'verified').order('statement_date', { ascending: true }).limit(1),
  ])

  const parties = new Set<string>()
  const states = new Set<string>()
  for (const p of (politicians ?? []) as { party: string; state: string | null }[]) {
    parties.add(p.party)
    if (p.state) states.add(p.state)
  }

  return {
    totalStatements: totalStatements ?? 0,
    totalPoliticians: (politicians ?? []).length,
    totalCategories: (categories ?? []).length,
    totalParties: parties.size,
    totalStates: states.size,
    newestDate: (newest as { statement_date: string }[] | null)?.[0]?.statement_date ?? null,
    oldestDate: (oldest as { statement_date: string }[] | null)?.[0]?.statement_date ?? null,
  }
}
