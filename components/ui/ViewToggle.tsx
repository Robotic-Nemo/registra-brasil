'use client'

import { LayoutGrid, List } from 'lucide-react'

interface Props {
  view: 'grid' | 'timeline'
  onChange: (view: 'grid' | 'timeline') => void
}

export function ViewToggle({ view, onChange }: Props) {
  const base = 'p-1.5 rounded transition-colors'
  const active = 'bg-blue-100 text-blue-700'
  const inactive = 'text-gray-400 hover:text-gray-600'

  return (
    <div className="flex items-center gap-1 border border-gray-200 rounded-lg p-0.5" role="radiogroup" aria-label="Modo de visualização">
      <button
        className={`${base} ${view === 'grid' ? active : inactive}`}
        onClick={() => onChange('grid')}
        role="radio"
        aria-checked={view === 'grid'}
        aria-label="Grade"
      >
        <LayoutGrid className="w-4 h-4" />
      </button>
      <button
        className={`${base} ${view === 'timeline' ? active : inactive}`}
        onClick={() => onChange('timeline')}
        role="radio"
        aria-checked={view === 'timeline'}
        aria-label="Linha do tempo"
      >
        <List className="w-4 h-4" />
      </button>
    </div>
  )
}
