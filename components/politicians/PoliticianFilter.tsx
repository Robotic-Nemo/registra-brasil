'use client'

import { useState, useMemo } from 'react'
import { Search } from 'lucide-react'
import { PoliticianCard } from './PoliticianCard'

interface Politician {
  id: string
  slug: string
  common_name: string
  full_name: string
  party: string
  state: string | null
  photo_url: string | null
}

interface Props {
  politicians: Politician[]
  countMap: Record<string, number>
}

export function PoliticianFilter({ politicians, countMap }: Props) {
  const [filter, setFilter] = useState('')

  const filtered = useMemo(() => {
    if (!filter) return politicians
    const lower = filter.toLowerCase()
    return politicians.filter(
      (p) =>
        p.common_name.toLowerCase().includes(lower) ||
        p.party.toLowerCase().includes(lower) ||
        (p.state && p.state.toLowerCase().includes(lower))
    )
  }, [politicians, filter])

  return (
    <>
      <div className="relative max-w-sm mb-6">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" aria-hidden="true" />
        <input
          type="search"
          placeholder="Filtrar por nome, partido ou estado..."
          value={filter}
          onChange={(e) => setFilter(e.target.value)}
          className="w-full pl-9 pr-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
          aria-label="Filtrar políticos"
        />
      </div>

      {filtered.length === 0 ? (
        <p className="text-gray-400 text-sm py-8 text-center">Nenhum político encontrado para &quot;{filter}&quot;</p>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
          {filtered.map((p) => (
            <PoliticianCard
              key={p.slug}
              politician={p}
              statementCount={countMap[p.id] ?? 0}
            />
          ))}
        </div>
      )}
    </>
  )
}
