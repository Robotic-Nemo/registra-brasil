import type { SupabaseClient } from '@supabase/supabase-js'

export interface PoliticianFullStats {
  totalStatements: number
  verifiedCount: number
  disputedCount: number
  mostCommonCategory: { slug: string; label_pt: string; color_hex: string } | null
  dateRange: { earliest: string; latest: string } | null
}

/**
 * Get comprehensive stats for a politician:
 * total statements, verified count, most common category, date range.
 */
export async function getPoliticianFullStats(
  supabase: SupabaseClient,
  politicianId: string
): Promise<PoliticianFullStats> {
  const [
    { count: totalStatements },
    { count: verifiedCount },
    { count: disputedCount },
    { data: dateData },
    { data: categoryData },
  ] = await Promise.all([
    supabase
      .from('statements')
      .select('id', { count: 'exact', head: true })
      .eq('politician_id', politicianId),
    supabase
      .from('statements')
      .select('id', { count: 'exact', head: true })
      .eq('politician_id', politicianId)
      .eq('verification_status', 'verified'),
    supabase
      .from('statements')
      .select('id', { count: 'exact', head: true })
      .eq('politician_id', politicianId)
      .eq('verification_status', 'disputed'),
    supabase
      .from('statements')
      .select('statement_date')
      .eq('politician_id', politicianId)
      .order('statement_date', { ascending: true })
      .limit(1),
    supabase
      .from('statement_categories')
      .select('categories(slug, label_pt, color_hex), statements!inner(politician_id)')
      .eq('statements.politician_id', politicianId)
      .eq('is_primary', true),
  ])

  // Calculate date range
  let dateRange: PoliticianFullStats['dateRange'] = null
  if (dateData && dateData.length > 0) {
    const earliest = (dateData[0] as unknown as { statement_date: string }).statement_date
    const { data: latestData } = await supabase
      .from('statements')
      .select('statement_date')
      .eq('politician_id', politicianId)
      .order('statement_date', { ascending: false })
      .limit(1)
    const latest = latestData?.[0]
      ? (latestData[0] as unknown as { statement_date: string }).statement_date
      : earliest
    dateRange = { earliest, latest }
  }

  // Find most common category
  let mostCommonCategory: PoliticianFullStats['mostCommonCategory'] = null
  if (categoryData && categoryData.length > 0) {
    const counts: Record<string, { slug: string; label_pt: string; color_hex: string; count: number }> = {}
    for (const row of categoryData as unknown as { categories: { slug: string; label_pt: string; color_hex: string } }[]) {
      const c = row.categories
      if (!c) continue
      if (!counts[c.slug]) counts[c.slug] = { ...c, count: 0 }
      counts[c.slug].count++
    }
    const sorted = Object.values(counts).sort((a, b) => b.count - a.count)
    if (sorted.length > 0) {
      const { count: _count, ...cat } = sorted[0]
      mostCommonCategory = cat
    }
  }

  return {
    totalStatements: totalStatements ?? 0,
    verifiedCount: verifiedCount ?? 0,
    disputedCount: disputedCount ?? 0,
    mostCommonCategory,
    dateRange,
  }
}
