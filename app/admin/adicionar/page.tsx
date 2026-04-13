import type { Metadata } from 'next'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getAllCategories } from '@/lib/supabase/queries/categories'
import { AddStatementForm } from './AddStatementForm'

export const metadata: Metadata = { title: 'Adicionar declaração — Admin' }

export default async function AdicionarPage() {
  const supabase = await getSupabaseServerClient()
  const categories = await getAllCategories(supabase)

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <h1 className="text-2xl font-bold text-gray-900 mb-1">Adicionar declaração</h1>
      <p className="text-sm text-gray-500 mb-8">
        A <strong>fonte primária é obrigatória</strong>. Preferencialmente um vídeo com marcação de tempo.
      </p>
      <AddStatementForm categories={categories} />
    </main>
  )
}
