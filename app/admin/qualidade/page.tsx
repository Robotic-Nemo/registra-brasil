import Link from 'next/link'
import { ArrowLeft, ShieldCheck } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkDataQuality } from '@/lib/utils/data-quality'
import { DataQualityCard } from '@/components/admin/DataQualityCard'
import { DataQualityIssueRow } from '@/components/admin/DataQualityIssue'

export const dynamic = 'force-dynamic'

export default async function QualidadePage() {
  const supabase = getSupabaseServiceClient()

  // Fetch statements with category count
  const { data: rawStatements } = await supabase
    .from('statements')
    .select('id, summary, full_quote, context, primary_source_url, slug, statement_date, verification_status, created_at, politicians(common_name), statement_categories(category_id)')
    .neq('verification_status', 'removed')
    .order('created_at', { ascending: false })
    .limit(500)

  const statements = (rawStatements ?? []).map((row: unknown) => {
    const r = row as {
      id: string
      summary: string
      full_quote: string | null
      context: string | null
      primary_source_url: string
      slug: string | null
      statement_date: string
      verification_status: string
      created_at: string
      politicians: { common_name: string }
      statement_categories: { category_id: string }[]
    }
    return {
      id: r.id,
      summary: r.summary,
      full_quote: r.full_quote,
      context: r.context,
      primary_source_url: r.primary_source_url,
      slug: r.slug,
      statement_date: r.statement_date,
      verification_status: r.verification_status,
      created_at: r.created_at,
      politician_name: r.politicians?.common_name ?? 'Desconhecido',
      category_count: r.statement_categories?.length ?? 0,
    }
  })

  const { issues, score } = checkDataQuality(statements)

  const highIssues = issues.filter((i) => i.severity === 'high')
  const mediumIssues = issues.filter((i) => i.severity === 'medium')
  const lowIssues = issues.filter((i) => i.severity === 'low')

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin" className="p-1.5 rounded-lg hover:bg-gray-100 transition-colors">
          <ArrowLeft className="w-5 h-5 text-gray-500" />
        </Link>
        <div>
          <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
            <ShieldCheck className="w-5 h-5 text-green-600" />
            Qualidade dos Dados
          </h1>
          <p className="text-sm text-gray-500">
            Analise de {statements.length} declaracoes
          </p>
        </div>
      </div>

      {/* Score card */}
      <section className="mb-6">
        <DataQualityCard score={score} />
      </section>

      {/* High severity */}
      {highIssues.length > 0 && (
        <section className="mb-4">
          <h2 className="text-sm font-semibold text-red-700 mb-2">
            Problemas criticos ({highIssues.length})
          </h2>
          <div className="bg-white border border-red-200 rounded-xl divide-y divide-gray-50 overflow-hidden">
            {highIssues.slice(0, 20).map((issue, i) => (
              <DataQualityIssueRow key={`${issue.statementId}-${issue.type}-${i}`} issue={issue} />
            ))}
            {highIssues.length > 20 && (
              <div className="px-4 py-2 text-xs text-gray-500 text-center">
                + {highIssues.length - 20} problemas adicionais
              </div>
            )}
          </div>
        </section>
      )}

      {/* Medium severity */}
      {mediumIssues.length > 0 && (
        <section className="mb-4">
          <h2 className="text-sm font-semibold text-yellow-700 mb-2">
            Atencao ({mediumIssues.length})
          </h2>
          <div className="bg-white border border-yellow-200 rounded-xl divide-y divide-gray-50 overflow-hidden">
            {mediumIssues.slice(0, 20).map((issue, i) => (
              <DataQualityIssueRow key={`${issue.statementId}-${issue.type}-${i}`} issue={issue} />
            ))}
            {mediumIssues.length > 20 && (
              <div className="px-4 py-2 text-xs text-gray-500 text-center">
                + {mediumIssues.length - 20} problemas adicionais
              </div>
            )}
          </div>
        </section>
      )}

      {/* Low severity */}
      {lowIssues.length > 0 && (
        <section className="mb-4">
          <h2 className="text-sm font-semibold text-blue-700 mb-2">
            Sugestoes ({lowIssues.length})
          </h2>
          <div className="bg-white border border-blue-200 rounded-xl divide-y divide-gray-50 overflow-hidden">
            {lowIssues.slice(0, 20).map((issue, i) => (
              <DataQualityIssueRow key={`${issue.statementId}-${issue.type}-${i}`} issue={issue} />
            ))}
            {lowIssues.length > 20 && (
              <div className="px-4 py-2 text-xs text-gray-500 text-center">
                + {lowIssues.length - 20} sugestoes adicionais
              </div>
            )}
          </div>
        </section>
      )}
    </main>
  )
}
