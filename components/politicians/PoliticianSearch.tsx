'use client'

import { useState, useMemo } from 'react'
import { Search, X } from 'lucide-react'
import type { Politician } from '@/types/database'
import { PoliticianCard } from './PoliticianCard'
import { BRAZILIAN_STATES } from '@/lib/constants/states'

type PoliticianSlim = Pick<Politician, 'id' | 'slug' | 'common_name' | 'full_name' | 'party' | 'state' | 'photo_url'>

interface PoliticianSearchProps {
  politicians: PoliticianSlim[]
  countMap: Record<string, number>
}

export function PoliticianSearch({ politicians, countMap }: PoliticianSearchProps) {
  const [query, setQuery] = useState('')
  const [selectedParty, setSelectedParty] = useState('')
  const [selectedState, setSelectedState] = useState('')

  const parties = useMemo(() => {
    const set = new Set(politicians.map((p) => p.party).filter(Boolean))
    return Array.from(set).sort()
  }, [politicians])

  const states = useMemo(() => {
    const set = new Set(politicians.map((p) => p.state).filter((s): s is string => !!s))
    return BRAZILIAN_STATES.filter((s) => set.has(s.uf))
  }, [politicians])

  const filtered = useMemo(() => {
    const q = query.toLowerCase().trim()
    return politicians.filter((p) => {
      if (q && !p.common_name.toLowerCase().includes(q) && !p.full_name.toLowerCase().includes(q)) {
        return false
      }
      if (selectedParty && p.party !== selectedParty) return false
      if (selectedState && p.state !== selectedState) return false
      return true
    })
  }, [politicians, query, selectedParty, selectedState])

  const hasFilters = query || selectedParty || selectedState

  function clearFilters() {
    setQuery('')
    setSelectedParty('')
    setSelectedState('')
  }

  return (
    <div>
      {/* Filters */}
      <div className="flex flex-col sm:flex-row gap-3 mb-6">
        <div className="relative flex-1">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
          <input
            type="text"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="Buscar politico..."
            className="w-full pl-10 pr-4 py-2 border border-gray-200 rounded-lg text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500 focus:border-transparent"
            aria-label="Buscar politico"
          />
        </div>

        <select
          value={selectedParty}
          onChange={(e) => setSelectedParty(e.target.value)}
          className="px-3 py-2 border border-gray-200 rounded-lg text-sm bg-white focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
          aria-label="Filtrar por partido"
        >
          <option value="">Todos os partidos</option>
          {parties.map((party) => (
            <option key={party} value={party}>
              {party}
            </option>
          ))}
        </select>

        <select
          value={selectedState}
          onChange={(e) => setSelectedState(e.target.value)}
          className="px-3 py-2 border border-gray-200 rounded-lg text-sm bg-white focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
          aria-label="Filtrar por estado"
        >
          <option value="">Todos os estados</option>
          {states.map((s) => (
            <option key={s.uf} value={s.uf}>
              {s.name} ({s.uf})
            </option>
          ))}
        </select>

        {hasFilters && (
          <button
            onClick={clearFilters}
            className="inline-flex items-center gap-1 px-3 py-2 text-sm text-gray-600 hover:text-gray-900 border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors"
            aria-label="Limpar filtros"
          >
            <X className="w-4 h-4" />
            Limpar
          </button>
        )}
      </div>

      {/* Results count */}
      <p className="text-sm text-gray-500 mb-4">
        {filtered.length === politicians.length
          ? `${filtered.length} politicos`
          : `${filtered.length} de ${politicians.length} politicos`}
      </p>

      {/* Results */}
      {filtered.length === 0 ? (
        <div className="text-center py-12 text-gray-500">
          <p className="text-lg font-medium">Nenhum politico encontrado</p>
          <p className="text-sm mt-1">Tente alterar os filtros de busca.</p>
        </div>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
          {filtered.map((p) => (
            <PoliticianCard key={p.slug} politician={p} statementCount={countMap[p.id] ?? 0} />
          ))}
        </div>
      )}
    </div>
  )
}
