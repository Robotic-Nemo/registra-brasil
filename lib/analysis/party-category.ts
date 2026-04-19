import { getSupabaseServiceClient } from '@/lib/supabase/server'

export interface MatrixCell {
  party: string
  party_total: number
  category_id: string
  category_slug: string
  category_label: string
  category_color: string | null
  category_total: number
  count: number
}

export interface Matrix {
  parties: Array<{ party: string; total: number }>
  categories: Array<{ id: string; slug: string; label: string; color: string | null; total: number }>
  cells: Map<string, number> // key: `${party}::${category_id}`
  max: number
}

export async function getPartyCategoryMatrix(
  partyLimit = 15,
  categoryLimit = 12,
): Promise<Matrix> {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.rpc as any)('party_category_matrix', {
    party_limit: partyLimit,
    category_limit: categoryLimit,
  })
  if (error) throw error

  const rows = (data ?? []) as MatrixCell[]
  const partyMap = new Map<string, number>()
  const catMap = new Map<string, { id: string; slug: string; label: string; color: string | null; total: number }>()
  const cells = new Map<string, number>()
  let max = 0

  for (const r of rows) {
    if (!partyMap.has(r.party)) partyMap.set(r.party, Number(r.party_total))
    if (!catMap.has(r.category_id)) {
      catMap.set(r.category_id, {
        id: r.category_id,
        slug: r.category_slug,
        label: r.category_label,
        color: r.category_color,
        total: Number(r.category_total),
      })
    }
    const count = Number(r.count)
    cells.set(`${r.party}::${r.category_id}`, count)
    if (count > max) max = count
  }

  const parties = [...partyMap.entries()]
    .sort((a, b) => b[1] - a[1])
    .map(([party, total]) => ({ party, total }))
  const categories = [...catMap.values()].sort((a, b) => b.total - a.total)

  return { parties, categories, cells, max }
}
