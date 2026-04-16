import Link from 'next/link'
import { FileSearch } from 'lucide-react'
import type { StatementWithRelations } from '@/types/database'
import { StatementCard } from './StatementCard'

interface StatementGridProps {
  statements: StatementWithRelations[]
  emptyMessage?: string
}

export function StatementGrid({ statements, emptyMessage }: StatementGridProps) {
  if (!statements.length) {
    return (
      <div className="text-center py-16 text-gray-500">
        <FileSearch className="w-10 h-10 mx-auto mb-3 text-gray-300" />
        <p className="text-lg font-medium">Nenhuma declaração encontrada</p>
        <p className="text-sm mt-1">{emptyMessage ?? 'Tente ajustar os filtros ou a busca'}</p>
        <Link href="/buscar" className="inline-block mt-4 text-sm text-blue-600 hover:underline">
          Ir para a busca
        </Link>
      </div>
    )
  }

  return (
    <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4" role="feed" aria-label="Declaracoes">
      {statements.map((s) => (
        <StatementCard key={s.id} statement={s} />
      ))}
    </div>
  )
}
