import { getSupabaseServiceClient } from '@/lib/supabase/server'

export interface TrendPoint {
  month: string // ISO date (YYYY-MM-DD, first of month)
  count: number
}

export interface CategoryTrend {
  id: string
  slug: string
  label: string
  color: string
  points: TrendPoint[]
  total: number
  recent: number
  prior: number
}

export async function getArchiveMonthlyTotals(monthsBack = 24): Promise<TrendPoint[]> {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.rpc as any)('get_archive_monthly_totals', {
    months_back: monthsBack,
  })
  if (error) throw error
  return (data ?? []).map((r: { month: string; statement_count: number | string }) => ({
    month: r.month,
    count: Number(r.statement_count),
  }))
}

/**
 * Pull per-category monthly trends, grouped and summarised client-side.
 * `recent` = sum over the most-recent third of the window;
 * `prior`  = sum over the oldest third. The remaining middle is left
 * out of the comparison so we get a clean "trend" signal.
 */
export async function getCategoryTrends(monthsBack = 24): Promise<CategoryTrend[]> {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.rpc as any)('get_category_monthly_trends', {
    months_back: monthsBack,
  })
  if (error) throw error

  type Row = {
    category_id: string
    category_slug: string
    category_label: string
    category_color: string
    month: string
    statement_count: number | string
  }

  const byCat = new Map<string, CategoryTrend>()
  for (const r of (data ?? []) as Row[]) {
    const existing = byCat.get(r.category_id)
    const point: TrendPoint = { month: r.month, count: Number(r.statement_count) }
    if (existing) {
      existing.points.push(point)
    } else {
      byCat.set(r.category_id, {
        id: r.category_id,
        slug: r.category_slug,
        label: r.category_label,
        color: r.category_color,
        points: [point],
        total: 0,
        recent: 0,
        prior: 0,
      })
    }
  }

  const out: CategoryTrend[] = []
  for (const c of byCat.values()) {
    c.points.sort((a, b) => a.month.localeCompare(b.month))
    c.total = c.points.reduce((a, p) => a + p.count, 0)
    const third = Math.max(1, Math.floor(c.points.length / 3))
    c.recent = c.points.slice(-third).reduce((a, p) => a + p.count, 0)
    c.prior = c.points.slice(0, third).reduce((a, p) => a + p.count, 0)
    out.push(c)
  }

  out.sort((a, b) => b.total - a.total)
  return out
}
