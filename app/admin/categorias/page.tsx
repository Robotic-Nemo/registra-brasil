import { getSupabaseServiceClient } from '@/lib/supabase/server'
import type { Category } from '@/types/database'
import { CategoriasClient } from './CategoriasClient'

export const dynamic = 'force-dynamic'

export default async function AdminCategoriasPage() {
  const supabase = getSupabaseServiceClient()
  const { data } = await supabase
    .from('categories')
    .select('*')
    .order('sort_order')

  return <CategoriasClient initialCategories={(data ?? []) as Category[]} />
}
