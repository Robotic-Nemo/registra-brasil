import type { SupabaseClient } from '@supabase/supabase-js'

export interface PoliticianCompareData {
  id: string
  slug: string
  name: string
  party: string
  state: string | null
  photo_url: string | null
  totalStatements: number
  categories: { slug: string; label: string; color: string; count: number }[]
  monthlyData: { month: string; count: number }[]
  recentStatements: {
    id: string
    summary: string
    statement_date: string
    verification_status: string
  }[]
}

export async function getPoliticianCompareData(
  supabase: SupabaseClient,
  politicianId: string,
  months = 12
): Promise<PoliticianCompareData | null> {
  const startDate = new Date()
  startDate.setMonth(startDate.getMonth() - months)
  const startStr = startDate.toISOString().slice(0, 10)

  const [{ data: politician }, { data: statements }, { data: catData }] = await Promise.all([
    supabase
      .from('politicians')
      .select('id, slug, common_name, party, state, photo_url')
      .eq('id', politicianId)
      .single(),
    supabase
      .from('statements')
      .select('id, summary, statement_date, verification_status')
      .eq('politician_id', politicianId)
      .eq('verification_status', 'verified')
      .order('statement_date', { ascending: false })
      .limit(100),
    supabase
      .from('statement_categories')
      .select('categories(slug, label_pt, color_hex), statements!inner(politician_id, verification_status)')
      .eq('statements.politician_id', politicianId)
      .eq('statements.verification_status', 'verified'),
  ])

  if (!politician) return null
  const pol = politician as unknown as { id: string; slug: string; common_name: string; party: string; state: string | null; photo_url: string | null }

  // Category counts
  const catCounts = new Map<string, { label: string; color: string; count: number }>()
  for (const row of (catData ?? []) as unknown as { categories: { slug: string; label_pt: string; color_hex: string } }[]) {
    const c = row.categories
    const existing = catCounts.get(c.slug) ?? { label: c.label_pt, color: c.color_hex, count: 0 }
    existing.count++
    catCounts.set(c.slug, existing)
  }

  // Monthly counts
  const stmts = (statements ?? []) as { id: string; summary: string; statement_date: string; verification_status: string }[]
  const monthlyCounts = new Map<string, number>()
  for (const s of stmts) {
    if (!s.statement_date) continue
    if (s.statement_date >= startStr) {
      const month = s.statement_date.slice(0, 7)
      monthlyCounts.set(month, (monthlyCounts.get(month) ?? 0) + 1)
    }
  }

  // Fill months in UTC — matches the YYYY-MM-DD UTC statement_date
  // so the final bucket doesn't drift on BRT machines.
  const monthlyData: { month: string; count: number }[] = []
  const current = new Date(startDate)
  const now = new Date()
  while (current <= now) {
    const key = `${current.getUTCFullYear()}-${String(current.getUTCMonth() + 1).padStart(2, '0')}`
    monthlyData.push({ month: key, count: monthlyCounts.get(key) ?? 0 })
    current.setUTCMonth(current.getUTCMonth() + 1)
  }

  return {
    id: pol.id,
    slug: pol.slug,
    name: pol.common_name,
    party: pol.party,
    state: pol.state,
    photo_url: pol.photo_url,
    totalStatements: stmts.length,
    categories: Array.from(catCounts.entries())
      .map(([slug, d]) => ({ slug, ...d }))
      .sort((a, b) => b.count - a.count),
    monthlyData,
    recentStatements: stmts.slice(0, 10),
  }
}

export interface ComparisonSummary {
  totalDiff: number
  categoryOverlap: string[]
  uniqueCategoriesA: string[]
  uniqueCategoriesB: string[]
}

export function computeComparisonSummary(
  a: PoliticianCompareData,
  b: PoliticianCompareData
): ComparisonSummary {
  const catsA = new Set(a.categories.map((c) => c.slug))
  const catsB = new Set(b.categories.map((c) => c.slug))
  const overlap = [...catsA].filter((c) => catsB.has(c))
  const uniqueA = [...catsA].filter((c) => !catsB.has(c))
  const uniqueB = [...catsB].filter((c) => !catsA.has(c))

  return {
    totalDiff: a.totalStatements - b.totalStatements,
    categoryOverlap: overlap,
    uniqueCategoriesA: uniqueA,
    uniqueCategoriesB: uniqueB,
  }
}
