import { getSupabaseServiceClient } from '@/lib/supabase/server'

export interface StateMatrix {
  states: Array<{ state: string; total: number }>
  categories: Array<{ id: string; slug: string; label: string; color: string | null; total: number }>
  cells: Map<string, number>
  max: number
}

export async function getStateCategoryMatrix(
  stateLimit = 27,
  categoryLimit = 12,
): Promise<StateMatrix> {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.rpc as any)('state_category_matrix', {
    state_limit: stateLimit,
    category_limit: categoryLimit,
  })
  if (error) throw error
  type Row = {
    state: string; state_total: number | string;
    category_id: string; category_slug: string; category_label: string; category_color: string | null;
    category_total: number | string; count: number | string
  }
  const rows = (data ?? []) as Row[]
  const stateMap = new Map<string, number>()
  const catMap = new Map<string, { id: string; slug: string; label: string; color: string | null; total: number }>()
  const cells = new Map<string, number>()
  let max = 0
  for (const r of rows) {
    if (!stateMap.has(r.state)) stateMap.set(r.state, Number(r.state_total))
    if (!catMap.has(r.category_id)) {
      catMap.set(r.category_id, {
        id: r.category_id, slug: r.category_slug, label: r.category_label,
        color: r.category_color, total: Number(r.category_total),
      })
    }
    const v = Number(r.count)
    cells.set(`${r.state}::${r.category_id}`, v)
    if (v > max) max = v
  }
  const states = [...stateMap.entries()].sort((a, b) => b[1] - a[1]).map(([state, total]) => ({ state, total }))
  const categories = [...catMap.values()].sort((a, b) => b.total - a.total)
  return { states, categories, cells, max }
}
