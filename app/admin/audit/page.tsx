import type { Metadata } from 'next'
import { getAuditLog } from '@/lib/supabase/queries/audit'
import { AuditLog } from '@/components/admin/AuditLog'
import { Pagination } from '@/components/ui/Pagination'

export const metadata: Metadata = {
  title: 'Log de Auditoria — Admin',
  robots: { index: false },
}

interface Props {
  searchParams: Promise<{ page?: string }>
}

export default async function AuditPage({ searchParams }: Props) {
  const params = await searchParams
  const page = Math.max(1, Number(params.page) || 1)
  const perPage = 25

  const { data: entries, count } = await getAuditLog({ page, per_page: perPage })
  const totalPages = Math.ceil(count / perPage)

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-xl font-bold text-gray-900">Log de Auditoria</h1>
        <p className="text-sm text-gray-500 mt-1">
          Histórico de todas as ações realizadas no sistema.
        </p>
      </div>

      <AuditLog entries={entries} />

      {totalPages > 1 && (
        <Pagination page={page} hasMore={page < totalPages} total={count} totalPages={totalPages} />
      )}
    </div>
  )
}
