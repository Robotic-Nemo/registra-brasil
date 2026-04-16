import type { PoliticianCompareData } from '@/lib/supabase/queries/compare'

export interface CategoryComparison {
  slug: string
  label: string
  color: string
  countA: number
  countB: number
}

/**
 * Build a unified category comparison from two politicians' data.
 */
export function buildCategoryComparison(
  a: PoliticianCompareData,
  b: PoliticianCompareData
): CategoryComparison[] {
  const allCats = new Map<string, CategoryComparison>()

  for (const cat of a.categories) {
    allCats.set(cat.slug, {
      slug: cat.slug,
      label: cat.label,
      color: cat.color,
      countA: cat.count,
      countB: 0,
    })
  }

  for (const cat of b.categories) {
    const existing = allCats.get(cat.slug)
    if (existing) {
      existing.countB = cat.count
    } else {
      allCats.set(cat.slug, {
        slug: cat.slug,
        label: cat.label,
        color: cat.color,
        countA: 0,
        countB: cat.count,
      })
    }
  }

  return Array.from(allCats.values()).sort(
    (a, b) => (b.countA + b.countB) - (a.countA + a.countB)
  )
}

/**
 * Build a monthly comparison from two politicians' data.
 */
export interface MonthlyComparison {
  month: string
  countA: number
  countB: number
}

export function buildMonthlyComparison(
  a: PoliticianCompareData,
  b: PoliticianCompareData
): MonthlyComparison[] {
  const months = new Map<string, MonthlyComparison>()

  for (const d of a.monthlyData) {
    months.set(d.month, { month: d.month, countA: d.count, countB: 0 })
  }

  for (const d of b.monthlyData) {
    const existing = months.get(d.month)
    if (existing) {
      existing.countB = d.count
    } else {
      months.set(d.month, { month: d.month, countA: 0, countB: d.count })
    }
  }

  return Array.from(months.values()).sort((a, b) => a.month.localeCompare(b.month))
}

/**
 * Merge and interleave recent statements from two politicians.
 */
export interface InterleavedStatement {
  id: string
  summary: string
  statement_date: string
  politician: 'A' | 'B'
  verification_status: string
}

export function interleaveStatements(
  a: PoliticianCompareData,
  b: PoliticianCompareData
): InterleavedStatement[] {
  const merged: InterleavedStatement[] = [
    ...a.recentStatements.map((s) => ({ ...s, politician: 'A' as const })),
    ...b.recentStatements.map((s) => ({ ...s, politician: 'B' as const })),
  ]
  return merged.sort((x, y) => y.statement_date.localeCompare(x.statement_date))
}
