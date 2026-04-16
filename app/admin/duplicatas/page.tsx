import Link from 'next/link'
import { ArrowLeft, Copy } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { detectDuplicates } from '@/lib/utils/duplicate-detection'
import { DuplicateList } from '@/components/admin/DuplicateList'

export const dynamic = 'force-dynamic'

export default async function DuplicatasPage() {
  const supabase = getSupabaseServiceClient()

  // Fetch recent statements (limit to recent 500 for performance)
  const { data: rawStatements } = await supabase
    .from('statements')
    .select('id, summary, full_quote, politician_id, statement_date, politicians(common_name)')
    .neq('verification_status', 'removed')
    .order('created_at', { ascending: false })
    .limit(500)

  const statements = (rawStatements ?? []).map((row: unknown) => {
    const r = row as {
      id: string
      summary: string
      full_quote: string | null
      politician_id: string
      statement_date: string
      politicians: { common_name: string }
    }
    return {
      id: r.id,
      summary: r.summary,
      full_quote: r.full_quote,
      politician_id: r.politician_id,
      politician_name: r.politicians?.common_name ?? 'Desconhecido',
      statement_date: r.statement_date,
    }
  })

  const duplicates = detectDuplicates(statements, 0.5)

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin" className="p-1.5 rounded-lg hover:bg-gray-100 transition-colors">
          <ArrowLeft className="w-5 h-5 text-gray-500" />
        </Link>
        <div>
          <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
            <Copy className="w-5 h-5 text-orange-500" />
            Deteccao de Duplicatas
          </h1>
          <p className="text-sm text-gray-500">
            Analisando {statements.length} declaracoes recentes
          </p>
        </div>
      </div>

      <DuplicateList duplicates={duplicates} />
    </main>
  )
}
