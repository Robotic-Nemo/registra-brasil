import type { SupabaseClient } from '@supabase/supabase-js'

export interface TrendingPolitician {
  slug: string
  common_name: string
  party: string
  photo_url: string | null
  recentCount: number
}

export interface TrendingCategory {
  slug: string
  label_pt: string
  color_hex: string
  recentCount: number
}

/**
 * Get politicians with most statements in the last N days
 */
export async function getTrendingPoliticians(
  supabase: SupabaseClient,
  days = 30,
  limit = 10
): Promise<TrendingPolitician[]> {
  const since = new Date()
  since.setDate(since.getDate() - days)
  const sinceStr = since.toISOString().slice(0, 10)

  const { data, error } = await supabase
    .from('statements')
    .select(`
      politician_id,
      politicians (slug, common_name, party, photo_url)
    `)
    .eq('verification_status', 'verified')
    .gte('statement_date', sinceStr)

  if (error || !data) return []

  // Count per politician
  const counts = new Map<string, { pol: { slug: string; common_name: string; party: string; photo_url: string | null }; count: number }>()

  for (const row of data) {
    const pol = row.politicians as unknown as { slug: string; common_name: string; party: string; photo_url: string | null } | null
    if (!pol) continue
    const existing = counts.get(pol.slug)
    if (existing) {
      existing.count++
    } else {
      counts.set(pol.slug, { pol, count: 1 })
    }
  }

  return Array.from(counts.values())
    .sort((a, b) => b.count - a.count)
    .slice(0, limit)
    .map(({ pol, count }) => ({
      slug: pol.slug,
      common_name: pol.common_name,
      party: pol.party,
      photo_url: pol.photo_url,
      recentCount: count,
    }))
}

/**
 * Get categories with most statements in the last N days
 */
export async function getTrendingCategories(
  supabase: SupabaseClient,
  days = 30,
  limit = 10
): Promise<TrendingCategory[]> {
  const since = new Date()
  since.setDate(since.getDate() - days)
  const sinceStr = since.toISOString().slice(0, 10)

  const { data, error } = await supabase
    .from('statement_categories')
    .select(`
      categories (slug, label_pt, color_hex),
      statements!inner (statement_date, verification_status)
    `)
    .eq('statements.verification_status', 'verified')
    .gte('statements.statement_date', sinceStr)

  if (error || !data) return []

  const counts = new Map<string, { cat: { slug: string; label_pt: string; color_hex: string }; count: number }>()

  for (const row of data) {
    const cat = row.categories as unknown as { slug: string; label_pt: string; color_hex: string } | null
    if (!cat) continue
    const existing = counts.get(cat.slug)
    if (existing) {
      existing.count++
    } else {
      counts.set(cat.slug, { cat, count: 1 })
    }
  }

  return Array.from(counts.values())
    .sort((a, b) => b.count - a.count)
    .slice(0, limit)
    .map(({ cat, count }) => ({
      slug: cat.slug,
      label_pt: cat.label_pt,
      color_hex: cat.color_hex,
      recentCount: count,
    }))
}
