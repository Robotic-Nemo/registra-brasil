import Link from 'next/link'
import { ArrowLeft, Layers } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { BatchImport } from '@/components/admin/BatchImport'
import { BatchOperationsClient } from './BatchOperationsClient'

export const dynamic = 'force-dynamic'

export default async function LotePage() {
  const supabase = getSupabaseServiceClient()

  // Fetch categories for assignment
  const { data: categories } = await supabase
    .from('categories')
    .select('id, label_pt, color_hex')
    .order('sort_order', { ascending: true })

  // Fetch recent unverified statements for batch operations
  const { data: statements } = await supabase
    .from('statements')
    .select('id, summary, verification_status, statement_date, politicians(common_name)')
    .neq('verification_status', 'removed')
    .order('created_at', { ascending: false })
    .limit(100)

  const statementsForClient = (statements ?? []).map((row: unknown) => {
    const r = row as {
      id: string
      summary: string
      verification_status: string
      statement_date: string
      politicians: { common_name: string }
    }
    return {
      id: r.id,
      summary: r.summary,
      verification_status: r.verification_status,
      statement_date: r.statement_date,
      politician_name: r.politicians?.common_name ?? 'Desconhecido',
    }
  })

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin" className="p-1.5 rounded-lg hover:bg-gray-100 transition-colors">
          <ArrowLeft className="w-5 h-5 text-gray-500" />
        </Link>
        <div>
          <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
            <Layers className="w-5 h-5 text-purple-600" />
            Operacoes em Lote
          </h1>
          <p className="text-sm text-gray-500">Importacao, alteracao de status e atribuicao de categorias</p>
        </div>
      </div>

      {/* Import */}
      <section className="mb-6">
        <BatchImport />
      </section>

      {/* Batch operations on existing statements */}
      <section>
        <BatchOperationsClient
          statements={statementsForClient}
          categories={(categories ?? []) as { id: string; label_pt: string; color_hex: string }[]}
        />
      </section>
    </main>
  )
}
