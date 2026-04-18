'use client'

import { useRouter, usePathname, useSearchParams } from 'next/navigation'
import type { Category } from '@/types/database'
import { useState, useEffect, useCallback } from 'react'
import { SlidersHorizontal, X } from 'lucide-react'
import { BRAZILIAN_STATES, BRAZILIAN_PARTIES } from '@/lib/constants/brazil'

interface SearchFiltersProps {
  categories: Category[]
}

export function SearchFilters({ categories }: SearchFiltersProps) {
  const router = useRouter()
  const pathname = usePathname()
  const searchParams = useSearchParams()
  const [mobileOpen, setMobileOpen] = useState(false)

  function update(key: string, value: string | null) {
    const params = new URLSearchParams(searchParams.toString())
    if (value) {
      params.set(key, value)
    } else {
      params.delete(key)
    }
    params.delete('page')
    router.push(`${pathname}?${params.toString()}`)
  }

  function toggleCategory(slug: string) {
    const current = searchParams.getAll('categoria')
    const next = current.includes(slug)
      ? current.filter((c) => c !== slug)
      : [...current, slug]

    const params = new URLSearchParams(searchParams.toString())
    params.delete('categoria')
    next.forEach((c) => params.append('categoria', c))
    params.delete('page')
    router.push(`${pathname}?${params.toString()}`)
  }

  const closeMobile = useCallback(() => setMobileOpen(false), [])

  // Close mobile modal on Escape key
  useEffect(() => {
    if (!mobileOpen) return
    function handleKey(e: KeyboardEvent) {
      if (e.key === 'Escape') closeMobile()
    }
    document.addEventListener('keydown', handleKey)
    return () => document.removeEventListener('keydown', handleKey)
  }, [mobileOpen, closeMobile])

  const selectedCats = searchParams.getAll('categoria')
  const selectedParty = searchParams.get('partido')
  const selectedState = searchParams.get('estado')
  const selectedStatus = searchParams.get('status')
  const dateFrom = searchParams.get('de')
  const dateTo = searchParams.get('ate')

  const hasFilters = selectedCats.length > 0 || selectedParty || selectedState || selectedStatus || dateFrom || dateTo

  const filterContent = (
    <div className="flex flex-col gap-5">
      {hasFilters && (
        <button
          onClick={() => router.push(pathname)}
          className="flex items-center gap-1.5 text-sm text-red-600 hover:text-red-800 font-medium"
        >
          <X className="w-4 h-4" />
          Limpar filtros
        </button>
      )}

      {/* Categories */}
      <div>
        <h3 className="text-xs font-semibold text-gray-700 uppercase tracking-wider mb-2">Categoria</h3>
        <div className="flex flex-col gap-1.5">
          {categories.map((cat) => (
            <label key={cat.slug} className="flex items-center gap-2 cursor-pointer group">
              <input
                type="checkbox"
                checked={selectedCats.includes(cat.slug)}
                onChange={() => toggleCategory(cat.slug)}
                className="rounded border-gray-300"
              />
              <span
                className="w-2 h-2 rounded-full flex-shrink-0"
                style={{ backgroundColor: cat.color_hex }}
              />
              <span className="text-sm text-gray-700 group-hover:text-gray-900">{cat.label_pt}</span>
            </label>
          ))}
        </div>
      </div>

      {/* Party */}
      <div>
        <h3 className="text-xs font-semibold text-gray-700 uppercase tracking-wider mb-2" id="filter-partido-label">Partido</h3>
        <select
          value={selectedParty ?? ''}
          onChange={(e) => update('partido', e.target.value || null)}
          aria-labelledby="filter-partido-label"
          className="w-full text-sm border border-gray-300 rounded-lg px-2.5 py-2 focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
        >
          <option value="">Todos</option>
          {BRAZILIAN_PARTIES.map((p) => (
            <option key={p} value={p}>{p}</option>
          ))}
        </select>
      </div>

      {/* State */}
      <div>
        <h3 className="text-xs font-semibold text-gray-700 uppercase tracking-wider mb-2" id="filter-estado-label">Estado</h3>
        <select
          value={selectedState ?? ''}
          onChange={(e) => update('estado', e.target.value || null)}
          aria-labelledby="filter-estado-label"
          className="w-full text-sm border border-gray-300 rounded-lg px-2.5 py-2 focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
        >
          <option value="">Todos</option>
          {BRAZILIAN_STATES.map((s) => (
            <option key={s} value={s}>{s}</option>
          ))}
        </select>
      </div>

      {/* Date range */}
      <div>
        <h3 className="text-xs font-semibold text-gray-700 uppercase tracking-wider mb-2">Período</h3>
        <div className="flex flex-wrap gap-1.5 mb-2">
          {[
            { label: '7 dias', days: 7 },
            { label: '30 dias', days: 30 },
            { label: '6 meses', days: 180 },
            { label: '1 ano', days: 365 },
          ].map((preset) => {
            const from = new Date(Date.now() - preset.days * 86_400_000).toISOString().slice(0, 10)
            const isActive = dateFrom === from && !dateTo
            return (
              <button
                key={preset.days}
                onClick={() => {
                  const params = new URLSearchParams(searchParams.toString())
                  if (isActive) {
                    params.delete('de')
                  } else {
                    params.set('de', from)
                    params.delete('ate')
                  }
                  params.delete('page')
                  router.push(`${pathname}?${params.toString()}`)
                }}
                className={`text-xs px-2 py-1 rounded-full border transition-colors ${
                  isActive ? 'bg-blue-100 border-blue-300 text-blue-700' : 'border-gray-200 text-gray-600 hover:bg-gray-50'
                }`}
              >
                {preset.label}
              </button>
            )
          })}
        </div>
        <div className="flex flex-col gap-2">
          <input
            type="date"
            value={dateFrom ?? ''}
            onChange={(e) => update('de', e.target.value || null)}
            className="w-full text-sm border border-gray-300 rounded-lg px-2.5 py-2 focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
            aria-label="Data inicial"
          />
          <input
            type="date"
            value={dateTo ?? ''}
            onChange={(e) => update('ate', e.target.value || null)}
            className="w-full text-sm border border-gray-300 rounded-lg px-2.5 py-2 focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
            aria-label="Data final"
          />
        </div>
      </div>

      {/* Status */}
      <div>
        <h3 className="text-xs font-semibold text-gray-700 uppercase tracking-wider mb-2">Verificação</h3>
        <div className="flex flex-col gap-1.5">
          {[
            { value: '', label: 'Todos' },
            { value: 'verified', label: 'Verificados' },
            { value: 'unverified', label: 'Não verificados' },
            { value: 'disputed', label: 'Disputados' },
          ].map((opt) => (
            <label key={opt.value} className="flex items-center gap-2 cursor-pointer">
              <input
                type="radio"
                name="status"
                value={opt.value}
                checked={(selectedStatus ?? '') === opt.value}
                onChange={() => update('status', opt.value || null)}
                className="border-gray-300"
              />
              <span className="text-sm text-gray-700">{opt.label}</span>
            </label>
          ))}
        </div>
      </div>
    </div>
  )

  return (
    <>
      {/* Desktop sidebar */}
      <aside className="hidden lg:block w-56 flex-shrink-0 sticky top-4 self-start">
        {filterContent}
      </aside>

      {/* Mobile toggle */}
      <div className="lg:hidden">
        <button
          onClick={() => setMobileOpen(true)}
          data-testid="filter-toggle"
          className="flex items-center gap-2 text-sm border border-gray-300 rounded-lg px-3 py-2 hover:bg-gray-50"
        >
          <SlidersHorizontal className="w-4 h-4" />
          Filtros
          {hasFilters && (
            <span className="bg-blue-600 text-white text-xs rounded-full w-4 h-4 flex items-center justify-center">
              {selectedCats.length + (selectedParty ? 1 : 0) + (selectedState ? 1 : 0)}
            </span>
          )}
        </button>

        {mobileOpen && (
          <div className="fixed inset-0 z-50 flex" role="dialog" aria-modal="true" aria-label="Filtros de busca">
            <div className="absolute inset-0 bg-black/40" onClick={closeMobile} />
            <div className="relative ml-auto w-72 bg-white h-full overflow-y-auto p-5 shadow-xl">
              <div className="flex justify-between items-center mb-4">
                <h2 className="font-semibold text-gray-900">Filtros</h2>
                <button onClick={closeMobile} aria-label="Fechar filtros">
                  <X className="w-5 h-5 text-gray-500" />
                </button>
              </div>
              {filterContent}
            </div>
          </div>
        )}
      </div>
    </>
  )
}
