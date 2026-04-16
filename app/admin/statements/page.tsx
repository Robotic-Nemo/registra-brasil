import Link from 'next/link'
import { FileText, Filter, ChevronLeft, ChevronRight } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getAdminStatements, getAdminPoliticianOptions } from '@/lib/supabase/queries/admin'
import type { VerificationStatus } from '@/types/database'

export const dynamic = 'force-dynamic'

interface PageProps {
  searchParams: Promise<{
    status?: string
    politician?: string
    search?: string
    page?: string
  }>
}

const STATUS_LABELS: Record<VerificationStatus, { label: string; color: string }> = {
  verified: { label: 'Verificada', color: 'bg-green-100 text-green-800' },
  unverified: { label: 'Pendente', color: 'bg-yellow-100 text-yellow-800' },
  disputed: { label: 'Disputada', color: 'bg-orange-100 text-orange-800' },
  removed: { label: 'Removida', color: 'bg-red-100 text-red-800' },
}

export default async function AdminStatementsPage({ searchParams }: PageProps) {
  const params = await searchParams
  const supabase = getSupabaseServiceClient()
  const page = Math.max(1, parseInt(params.page ?? '1', 10) || 1)

  const [{ data: statements, count }, politicians] = await Promise.all([
    getAdminStatements(supabase, {
      status: (params.status as VerificationStatus) || undefined,
      politicianId: params.politician || undefined,
      search: params.search || undefined,
      page,
      perPage: 25,
    }),
    getAdminPoliticianOptions(supabase),
  ])

  const totalPages = Math.ceil(count / 25)

  function buildUrl(overrides: Record<string, string | undefined>): string {
    const p = new URLSearchParams()
    const merged = { status: params.status, politician: params.politician, search: params.search, page: params.page, ...overrides }
    for (const [k, v] of Object.entries(merged)) {
      if (v) p.set(k, v)
    }
    return `/admin/statements?${p.toString()}`
  }

  return (
    <main className="max-w-5xl mx-auto px-4 py-10">
      <div className="flex items-center justify-between mb-6">
        <div className="flex items-center gap-2">
          <FileText className="w-5 h-5 text-gray-400" />
          <h1 className="text-xl font-bold text-gray-900">Declaracoes</h1>
          <span className="text-sm text-gray-500">({count})</span>
        </div>
        <Link
          href="/admin"
          className="text-sm text-gray-500 hover:text-gray-800 transition-colors"
        >
          Voltar ao painel
        </Link>
      </div>

      {/* Filters */}
      <form className="flex flex-wrap items-end gap-3 mb-6 p-4 bg-gray-50 rounded-lg border border-gray-200">
        <div className="flex items-center gap-1.5 text-sm text-gray-500">
          <Filter className="w-4 h-4" />
          Filtros
        </div>

        <div>
          <label htmlFor="filter-status" className="sr-only">Status</label>
          <select
            id="filter-status"
            name="status"
            defaultValue={params.status ?? ''}
            className="text-sm rounded-lg border border-gray-300 px-3 py-1.5"
          >
            <option value="">Todos os status</option>
            {Object.entries(STATUS_LABELS).map(([value, { label }]) => (
              <option key={value} value={value}>{label}</option>
            ))}
          </select>
        </div>

        <div>
          <label htmlFor="filter-politician" className="sr-only">Politico</label>
          <select
            id="filter-politician"
            name="politician"
            defaultValue={params.politician ?? ''}
            className="text-sm rounded-lg border border-gray-300 px-3 py-1.5"
          >
            <option value="">Todos os politicos</option>
            {politicians.map((p) => (
              <option key={p.id} value={p.id}>{p.common_name} ({p.party})</option>
            ))}
          </select>
        </div>

        <div>
          <label htmlFor="filter-search" className="sr-only">Buscar</label>
          <input
            id="filter-search"
            type="text"
            name="search"
            defaultValue={params.search ?? ''}
            placeholder="Buscar resumo..."
            className="text-sm rounded-lg border border-gray-300 px-3 py-1.5"
          />
        </div>

        <button
          type="submit"
          className="px-4 py-1.5 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 transition-colors"
        >
          Filtrar
        </button>
      </form>

      {/* Statements list */}
      {statements.length === 0 ? (
        <p className="text-center text-gray-500 py-12">Nenhuma declaracao encontrada.</p>
      ) : (
        <div className="border border-gray-200 rounded-lg divide-y divide-gray-100 bg-white">
          {(statements as unknown as Array<{
            id: string
            summary: string
            slug: string | null
            statement_date: string
            verification_status: VerificationStatus
            is_featured: boolean
            created_at: string
            politicians: { id: string; common_name: string; party: string; slug: string }
          }>).map((s) => {
            const status = STATUS_LABELS[s.verification_status]
            return (
              <div key={s.id} className="flex items-start gap-3 px-4 py-3 hover:bg-gray-50 transition-colors">
                <div className="flex-1 min-w-0">
                  <Link
                    href={`/admin/editar/${s.id}`}
                    className="text-sm font-medium text-gray-900 hover:text-blue-700 transition-colors line-clamp-1"
                  >
                    {s.summary}
                  </Link>
                  <p className="text-xs text-gray-500 mt-0.5">
                    {s.politicians.common_name} ({s.politicians.party}) &middot; {s.statement_date}
                  </p>
                </div>
                <span className={`shrink-0 text-xs px-2 py-0.5 rounded-full font-medium ${status.color}`}>
                  {status.label}
                </span>
              </div>
            )
          })}
        </div>
      )}

      {/* Pagination */}
      {totalPages > 1 && (
        <div className="flex items-center justify-center gap-2 mt-6">
          {page > 1 && (
            <Link
              href={buildUrl({ page: String(page - 1) })}
              className="inline-flex items-center gap-1 text-sm text-gray-600 hover:text-gray-900 px-3 py-1.5 rounded-lg hover:bg-gray-100 transition-colors"
            >
              <ChevronLeft className="w-4 h-4" />
              Anterior
            </Link>
          )}
          <span className="text-sm text-gray-500 tabular-nums">
            Pagina {page} de {totalPages}
          </span>
          {page < totalPages && (
            <Link
              href={buildUrl({ page: String(page + 1) })}
              className="inline-flex items-center gap-1 text-sm text-gray-600 hover:text-gray-900 px-3 py-1.5 rounded-lg hover:bg-gray-100 transition-colors"
            >
              Proxima
              <ChevronRight className="w-4 h-4" />
            </Link>
          )}
        </div>
      )}
    </main>
  )
}
