import type { SupabaseClient } from '@supabase/supabase-js'
import type { Category } from '@/types/database'

export async function getAllCategories(supabase: SupabaseClient): Promise<Category[]> {
  const { data, error } = await supabase
    .from('categories')
    .select('id, slug, label_pt, label_en, description, color_hex, icon, severity, parent_id, sort_order, created_at')
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
    .select('id, slug, label_pt, label_en, description, color_hex, icon, severity, parent_id, sort_order, created_at')
    .eq('slug', slug)
    .single()

  if (error) return null
  return data as Category
}

export interface CategoryWithCount extends Category {
  statementCount: number
}

/** Fetch a category by slug along with its verified statement count */
export async function getCategoryWithCount(
  supabase: SupabaseClient,
  slug: string
): Promise<CategoryWithCount | null> {
  const category = await getCategoryBySlug(supabase, slug)
  if (!category) return null

  const { count, error } = await supabase
    .from('statement_categories')
    .select('statements!inner(verification_status)', { count: 'exact', head: true })
    .eq('category_id', category.id)
    .eq('statements.verification_status', 'verified')

  if (error) {
    return { ...category, statementCount: 0 }
  }

  return { ...category, statementCount: count ?? 0 }
}
