import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getRecentStatements } from '@/lib/supabase/queries/statements'
import { StatementGrid } from '@/components/statements/StatementGrid'
import type { Metadata } from 'next'

export const revalidate = 1800 // 30 minutes

export const metadata: Metadata = {
  title: 'Declarações Recentes — Registra Brasil',
  description: 'As declarações mais recentes adicionadas ao acervo do Registra Brasil.',
  alternates: { canonical: '/declaracoes-recentes' },
}

export default async function RecentStatementsPage() {
  const supabase = await getSupabaseServerClient()
  const statements = await getRecentStatements(supabase, 30)

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Declarações recentes</h1>
      <p className="text-gray-500 text-sm mb-8">
        As {statements.length} declarações mais recentes adicionadas ao acervo.
      </p>
      <StatementGrid statements={statements} />
    </main>
  )
}
