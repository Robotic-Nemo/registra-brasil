import type { StatementWithRelations } from '@/types/database'
import { StatementCard } from './StatementCard'

interface StatementGridProps {
  statements: StatementWithRelations[]
}

export function StatementGrid({ statements }: StatementGridProps) {
  if (!statements.length) {
    return (
      <div className="text-center py-16 text-gray-500">
        <p className="text-lg font-medium">Nenhuma declaração encontrada</p>
        <p className="text-sm mt-1">Tente ajustar os filtros ou a busca</p>
      </div>
    )
  }

  return (
    <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">
      {statements.map((s) => (
        <StatementCard key={s.id} statement={s} />
      ))}
    </div>
  )
}
