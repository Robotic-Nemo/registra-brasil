import type { SupabaseClient } from '@supabase/supabase-js'
import type { Category } from '@/types/database'

export async function getAllCategories(supabase: SupabaseClient): Promise<Category[]> {
  const { data, error } = await supabase
    .from('categories')
    .select('*')
    .order('sort_order')

  if (error) throw error
  return (data ?? []) as Category[]
}

export async function getCategoryBySlug(
  supabase: SupabaseClient,
  slug: string
): Promise<Category | null> {
  const { data, error } = await supabase
    .from('categories')
    .select('*')
    .eq('slug', slug)
    .single()

  if (error) return null
  return data as Category
}
