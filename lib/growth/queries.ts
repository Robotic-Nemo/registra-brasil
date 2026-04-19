import { getSupabaseServiceClient } from '@/lib/supabase/server'

export interface GrowthRow {
  month: string
  new_statements: number
  cumulative_statements: number
  new_politicians: number
  cumulative_politicians: number
  new_categories: number
  cumulative_categories: number
}

export async function getArchiveGrowth(monthsBack = 36): Promise<GrowthRow[]> {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.rpc as any)('archive_growth_monthly', {
    months_back: monthsBack,
  })
  if (error) throw error
  return ((data ?? []) as any[]).map((r) => ({
    month: r.month,
    new_statements: Number(r.new_statements),
    cumulative_statements: Number(r.cumulative_statements),
    new_politicians: Number(r.new_politicians),
    cumulative_politicians: Number(r.cumulative_politicians),
    new_categories: Number(r.new_categories),
    cumulative_categories: Number(r.cumulative_categories),
  }))
}
