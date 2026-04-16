'use server'

import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import type { Category } from '@/types/database'

export type CategoryInput = Omit<Category, 'id' | 'created_at'>

export async function createCategory(input: CategoryInput) {
  const supabase = getSupabaseServiceClient()

  const { data, error } = await supabase
    .from('categories')
    .insert(input as any)
    .select()
    .single()

  if (error) {
    return { success: false as const, error: error.message }
  }

  revalidatePath('/admin/categorias')
  revalidatePath('/categorias')
  return { success: true as const, data: data as Category }
}

export async function updateCategory(id: string, input: Partial<CategoryInput>) {
  const supabase = getSupabaseServiceClient()

  const { data, error } = await (supabase
    .from('categories') as any)
    .update(input)
    .eq('id', id)
    .select()
    .single()

  if (error) {
    return { success: false as const, error: error.message }
  }

  const category = data as Category
  revalidatePath('/admin/categorias')
  revalidatePath(`/categorias/${category.slug}`)
  revalidatePath('/categorias')
  return { success: true as const, data: category }
}

export async function deleteCategory(id: string) {
  const supabase = getSupabaseServiceClient()

  const { error } = await supabase
    .from('categories')
    .delete()
    .eq('id', id)

  if (error) {
    return { success: false as const, error: error.message }
  }

  revalidatePath('/admin/categorias')
  revalidatePath('/categorias')
  return { success: true as const }
}

export async function reorderCategories(orderedIds: string[]) {
  const supabase = getSupabaseServiceClient()

  const updates = orderedIds.map((id, index) =>
    (supabase
      .from('categories') as any)
      .update({ sort_order: index })
      .eq('id', id)
  )

  const results = await Promise.all(updates)
  const errors = results.filter((r) => r.error)

  if (errors.length > 0) {
    return { success: false as const, error: errors[0].error!.message }
  }

  revalidatePath('/admin/categorias')
  revalidatePath('/categorias')
  return { success: true as const }
}
