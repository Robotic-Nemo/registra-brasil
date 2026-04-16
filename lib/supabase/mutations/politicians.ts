'use server'

import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import type { Politician } from '@/types/database'

export type PoliticianInput = Omit<Politician, 'id' | 'created_at' | 'updated_at'>

export async function createPolitician(input: PoliticianInput) {
  const supabase = getSupabaseServiceClient()

  const { data, error } = await supabase
    .from('politicians')
    .insert(input as any)
    .select()
    .single()

  if (error) {
    return { success: false as const, error: error.message }
  }

  revalidatePath('/admin/politicos')
  revalidatePath('/politicos')
  return { success: true as const, data: data as Politician }
}

export async function updatePolitician(id: string, input: Partial<PoliticianInput>) {
  const supabase = getSupabaseServiceClient()

  const { data, error } = await (supabase
    .from('politicians') as any)
    .update({ ...input, updated_at: new Date().toISOString() })
    .eq('id', id)
    .select()
    .single()

  if (error) {
    return { success: false as const, error: error.message }
  }

  const politician = data as Politician
  revalidatePath('/admin/politicos')
  revalidatePath(`/politico/${politician.slug}`)
  revalidatePath('/politicos')
  return { success: true as const, data: politician }
}

export async function deletePolitician(id: string) {
  const supabase = getSupabaseServiceClient()

  const { error } = await supabase
    .from('politicians')
    .delete()
    .eq('id', id)

  if (error) {
    return { success: false as const, error: error.message }
  }

  revalidatePath('/admin/politicos')
  revalidatePath('/politicos')
  return { success: true as const }
}
