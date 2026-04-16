import type { SupabaseClient } from '@supabase/supabase-js'

export async function getMonthlyStatementCounts(
  supabase: SupabaseClient,
  months = 12
): Promise<{ month: string; count: number }[]> {
  // Calculate the start date
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

  // Group by month
  const counts = new Map<string, number>()
  for (const row of data as { statement_date: string }[]) {
    const month = row.statement_date.slice(0, 7) // YYYY-MM
    counts.set(month, (counts.get(month) ?? 0) + 1)
  }

  // Fill in missing months
  const result: { month: string; count: number }[] = []
  const current = new Date(startDate)
  const now = new Date()
  while (current <= now) {
    const key = `${current.getFullYear()}-${String(current.getMonth() + 1).padStart(2, '0')}`
    result.push({ month: key, count: counts.get(key) ?? 0 })
    current.setMonth(current.getMonth() + 1)
  }

  return result
}

export async function getTopPoliticiansByStatements(
  supabase: SupabaseClient,
  limit = 10
): Promise<{ politician_id: string; count: number }[]> {
  const { data, error } = await supabase
    .from('statements')
    .select('politician_id')
    .eq('verification_status', 'verified')

  if (error || !data) return []

  const counts = new Map<string, number>()
  for (const row of data as { politician_id: string }[]) {
    counts.set(row.politician_id, (counts.get(row.politician_id) ?? 0) + 1)
  }

  return Array.from(counts.entries())
    .map(([politician_id, count]) => ({ politician_id, count }))
    .sort((a, b) => b.count - a.count)
    .slice(0, limit)
}

export async function getStatementsByParty(
  supabase: SupabaseClient
): Promise<{ party: string; count: number }[]> {
  const { data, error } = await supabase
    .from('statements')
    .select('politicians!inner(party)')
    .eq('verification_status', 'verified')

  if (error || !data) return []

  const counts = new Map<string, number>()
  for (const row of data as unknown as { politicians: { party: string } }[]) {
    const party = row.politicians.party
    counts.set(party, (counts.get(party) ?? 0) + 1)
  }

  return Array.from(counts.entries())
    .map(([party, count]) => ({ party, count }))
    .sort((a, b) => b.count - a.count)
}

export async function getStatementsBySourceType(
  supabase: SupabaseClient
): Promise<{ type: string; count: number }[]> {
  const { data, error } = await supabase
    .from('statements')
    .select('primary_source_type')
    .eq('verification_status', 'verified')

  if (error || !data) return []

  const counts = new Map<string, number>()
  for (const row of data as { primary_source_type: string }[]) {
    counts.set(row.primary_source_type, (counts.get(row.primary_source_type) ?? 0) + 1)
  }

  return Array.from(counts.entries())
    .map(([type, count]) => ({ type, count }))
    .sort((a, b) => b.count - a.count)
}
