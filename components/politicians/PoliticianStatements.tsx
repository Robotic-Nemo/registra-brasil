'use client'

import { useState } from 'react'
import { ViewToggle } from '@/components/ui/ViewToggle'
import { StatementGrid } from '@/components/statements/StatementGrid'
import { StatementTimeline } from '@/components/statements/StatementTimeline'
import type { StatementWithRelations } from '@/types/database'

interface Props {
  statements: StatementWithRelations[]
}

export function PoliticianStatements({ statements }: Props) {
  const [view, setView] = useState<'grid' | 'timeline'>('grid')

  return (
    <div>
      <div className="flex items-center justify-between mb-4">
        <h2 className="font-semibold text-gray-900">Declarações registradas</h2>
        <ViewToggle view={view} onChange={setView} />
      </div>
      {view === 'grid' ? (
        <StatementGrid statements={statements} />
      ) : (
        <StatementTimeline statements={statements} />
      )}
    </div>
  )
}
