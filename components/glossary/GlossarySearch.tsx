'use client'

import { useState } from 'react'
import type { GlossaryTerm } from '@/lib/constants/glossary'
import { GlossaryEntry } from './GlossaryEntry'

interface Props {
  terms: GlossaryTerm[]
}

export function GlossarySearch({ terms }: Props) {
  const [query, setQuery] = useState('')
  const [activeCategory, setActiveCategory] = useState<string | null>(null)

  const filtered = terms.filter((t) => {
    const matchesQuery = !query ||
      t.term.toLowerCase().includes(query.toLowerCase()) ||
      t.definition.toLowerCase().includes(query.toLowerCase())
    const matchesCat = !activeCategory || t.category === activeCategory
    return matchesQuery && matchesCat
  })

  const categories = [...new Set(terms.map((t) => t.category))].sort()

  const categoryLabels: Record<string, string> = {
    processo: 'Processos',
    instituicao: 'Instituicoes',
    cargo: 'Cargos',
    conceito: 'Conceitos',
    legislacao: 'Legislacao',
  }

  return (
    <div>
      <div className="flex flex-col sm:flex-row gap-3 mb-6">
        <input
          type="search"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Buscar termos..."
          className="flex-1 rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:ring-1 focus:ring-blue-500 outline-none"
          aria-label="Buscar no glossario"
        />
        <div className="flex flex-wrap gap-1.5">
          <button
            onClick={() => setActiveCategory(null)}
            className={`px-3 py-1.5 rounded-full text-xs font-medium transition-colors ${
              !activeCategory ? 'bg-blue-600 text-white' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
            }`}
          >
            Todos
          </button>
          {categories.map((cat) => (
            <button
              key={cat}
              onClick={() => setActiveCategory(activeCategory === cat ? null : cat)}
              className={`px-3 py-1.5 rounded-full text-xs font-medium transition-colors ${
                activeCategory === cat ? 'bg-blue-600 text-white' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
              }`}
            >
              {categoryLabels[cat] ?? cat}
            </button>
          ))}
        </div>
      </div>

      <div className="space-y-3">
        {filtered.length === 0 ? (
          <p className="text-center text-gray-500 py-8">Nenhum termo encontrado.</p>
        ) : (
          filtered.map((term) => (
            <GlossaryEntry key={term.slug} term={term} />
          ))
        )}
      </div>

      <p className="text-xs text-gray-400 mt-4 text-center">
        {filtered.length} de {terms.length} termos
      </p>
    </div>
  )
}
