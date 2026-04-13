import type { SupabaseClient } from '@supabase/supabase-js'
import type { Politician } from '@/types/database'

export async function getPoliticianBySlug(
  supabase: SupabaseClient,
  slug: string
): Promise<Politician | null> {
  const { data, error } = await supabase
    .from('politicians')
    .select('*')
    .eq('slug', slug)
    .single()

  if (error) return null
  return data as Politician
}

export async function getAllPoliticianSlugs(supabase: SupabaseClient): Promise<string[]> {
  const { data } = await supabase.from('politicians').select('slug')
  return (data ?? []).map((p: { slug: string }) => p.slug)
}

export async function getPoliticianCategoryStats(
  supabase: SupabaseClient,
  politicianId: string
): Promise<{ slug: string; label_pt: string; color_hex: string; count: number }[]> {
  const { data: statements } = await supabase
    .from('statements')
    .select('id')
    .eq('politician_id', politicianId)
    .eq('verification_status', 'verified')

  if (!statements?.length) return []

  const ids = statements.map((s: { id: string }) => s.id)

  const { data } = await supabase
    .from('statement_categories')
    .select('categories (slug, label_pt, color_hex)')
    .in('statement_id', ids)

  if (!data) return []

  const counts: Record<string, { slug: string; label_pt: string; color_hex: string; count: number }> = {}
  for (const row of data as unknown as { categories: { slug: string; label_pt: string; color_hex: string } }[]) {
    const c = row.categories
    if (!counts[c.slug]) counts[c.slug] = { ...c, count: 0 }
    counts[c.slug].count++
  }

  return Object.values(counts).sort((a, b) => b.count - a.count)
}

export async function searchPoliticians(
  supabase: SupabaseClient,
  query: string,
  limit = 10
): Promise<Pick<Politician, 'id' | 'slug' | 'common_name' | 'party' | 'state'>[]> {
  const { data } = await supabase
    .from('politicians')
    .select('id, slug, common_name, party, state')
    .ilike('common_name', `%${query}%`)
    .limit(limit)

  return (data ?? []) as Pick<Politician, 'id' | 'slug' | 'common_name' | 'party' | 'state'>[]
}
