'use client'

import { useState, useMemo } from 'react'
import Image from 'next/image'
import Link from 'next/link'
import { getPartyColor } from '@/lib/constants/party-colors'
import { Users, ArrowRight, Search } from 'lucide-react'

interface Politician {
  id: string
  slug: string
  common_name: string
  party: string
  state: string | null
  photo_url: string | null
}

interface CategoryInfo {
  count: number
  label: string
  color: string
}

interface Props {
  politicians: Politician[]
  countMap: Record<string, number>
  categoryMap: Record<string, Record<string, CategoryInfo>>
  /** Pre-selected politician IDs (e.g. from URL searchParams). Up to 2 entries. */
  initialIds?: [string?, string?]
}

export function CompareSelector({ politicians, countMap, categoryMap, initialIds }: Props) {
  const [selected, setSelected] = useState<[string | null, string | null]>([
    initialIds?.[0] ?? null,
    initialIds?.[1] ?? null,
  ])
  const [filter, setFilter] = useState('')

  const filtered = useMemo(() => {
    if (!filter) return politicians
    const lower = filter.toLowerCase()
    return politicians.filter(
      (p) => p.common_name.toLowerCase().includes(lower) || p.party.toLowerCase().includes(lower)
    )
  }, [politicians, filter])

  const polA = politicians.find((p) => p.id === selected[0])
  const polB = politicians.find((p) => p.id === selected[1])

  function toggleSelect(id: string) {
    if (selected[0] === id) {
      setSelected([selected[1], null])
    } else if (selected[1] === id) {
      setSelected([selected[0], null])
    } else if (!selected[0]) {
      setSelected([id, selected[1]])
    } else if (!selected[1]) {
      setSelected([selected[0], id])
    } else {
      // Both slots full — replace second
      setSelected([selected[0], id])
    }
  }

  if (politicians.length === 0) {
    return (
      <div className="text-center py-16">
        <Users className="w-12 h-12 text-gray-300 mx-auto mb-4" />
        <p className="text-lg font-medium text-gray-700 mb-2">
          Nenhum politico com declaracoes verificadas
        </p>
        <p className="text-sm text-gray-500 mb-6">
          Adicione declaracoes verificadas para poder comparar politicos.
        </p>
        <Link
          href="/politicos"
          className="inline-flex items-center gap-1.5 text-sm text-blue-600 hover:underline"
        >
          Ver todos os politicos
          <ArrowRight className="w-3.5 h-3.5" />
        </Link>
      </div>
    )
  }

  return (
    <div>
      {/* Empty state — no selection yet */}
      {!polA && !polB && (
        <div className="mb-8 bg-blue-50 border border-blue-200 rounded-xl p-6 text-center">
          <Users className="w-10 h-10 text-blue-400 mx-auto mb-3" />
          <p className="text-sm font-medium text-blue-900 mb-1">
            Selecione dois politicos abaixo para comparar
          </p>
          <p className="text-xs text-blue-700">
            Clique nos cards para selecionar. Use o campo de busca para filtrar por nome ou partido.
          </p>
        </div>
      )}

      {/* Selected comparison */}
      {polA && polB && (
        <div className="mb-8 bg-white border border-gray-200 rounded-xl p-6">
          <div className="flex items-center justify-between gap-4 flex-wrap">
            <CompareCard pol={polA} count={countMap[polA.id] ?? 0} />
            <span className="text-gray-400 text-lg font-bold">VS</span>
            <CompareCard pol={polB} count={countMap[polB.id] ?? 0} />
          </div>
          {/* Category breakdown comparison */}
          <CategoryBreakdown
            polA={polA}
            polB={polB}
            catsA={categoryMap[polA.id] ?? {}}
            catsB={categoryMap[polB.id] ?? {}}
          />

          <div className="mt-6 text-center">
            <Link
              href={`/buscar?politico=${polA.slug}`}
              className="inline-flex items-center gap-1 text-sm text-blue-600 hover:underline mr-4"
            >
              Ver declarações de {polA.common_name}
              <ArrowRight className="w-3.5 h-3.5" />
            </Link>
            <Link
              href={`/buscar?politico=${polB.slug}`}
              className="inline-flex items-center gap-1 text-sm text-blue-600 hover:underline"
            >
              Ver declarações de {polB.common_name}
              <ArrowRight className="w-3.5 h-3.5" />
            </Link>
          </div>
        </div>
      )}

      {/* Selector */}
      <div className="relative max-w-sm mb-4">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" aria-hidden="true" />
        <input
          type="search"
          placeholder="Filtrar políticos..."
          value={filter}
          onChange={(e) => setFilter(e.target.value)}
          autoComplete="off"
          aria-label="Filtrar politicos"
          data-testid="compare-filter"
          className="w-full pl-9 pr-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>

      <p className="text-xs text-gray-400 mb-3">
        {selected[0] && !selected[1]
          ? 'Selecione o segundo político para comparar'
          : selected[0] && selected[1]
          ? 'Clique para trocar a seleção'
          : 'Selecione dois políticos'}
      </p>

      {filtered.length === 0 && filter && (
        <div className="text-center py-8 text-gray-500">
          <Search className="w-8 h-8 mx-auto mb-2 text-gray-300" />
          <p className="text-sm">Nenhum politico encontrado para &quot;{filter}&quot;</p>
          <button
            onClick={() => setFilter('')}
            className="mt-2 text-xs text-blue-600 hover:underline"
          >
            Limpar filtro
          </button>
        </div>
      )}

      <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-2">
        {filtered.map((p) => {
          const isSelected = selected.includes(p.id)
          return (
            <button
              key={p.id}
              onClick={() => toggleSelect(p.id)}
              className={`flex items-center gap-2 p-2.5 rounded-lg border text-left text-sm transition-all ${
                isSelected
                  ? 'border-blue-400 bg-blue-50 ring-1 ring-blue-400'
                  : 'border-gray-200 hover:border-gray-300 hover:bg-gray-50'
              }`}
            >
              {p.photo_url ? (
                <Image src={p.photo_url} alt={p.common_name} width={28} height={28}
                  decoding="async" loading="lazy" referrerPolicy="no-referrer"
                  className="w-7 h-7 rounded-full object-cover flex-shrink-0" />
              ) : (
                <div className="w-7 h-7 rounded-full bg-gray-200 flex-shrink-0 flex items-center justify-center text-xs font-bold text-gray-500">
                  {p.common_name[0]}
                </div>
              )}
              <div className="min-w-0">
                <p className="font-medium text-gray-900 text-xs truncate" title={p.common_name} translate="no">{p.common_name}</p>
                <p className="text-xs text-gray-400"><span translate="no">{p.party}</span> · {countMap[p.id] ?? 0}</p>
              </div>
            </button>
          )
        })}
      </div>
    </div>
  )
}

function CategoryBreakdown({
  polA,
  polB,
  catsA,
  catsB,
}: {
  polA: Politician
  polB: Politician
  catsA: Record<string, CategoryInfo>
  catsB: Record<string, CategoryInfo>
}) {
  // Merge all category slugs
  const allSlugs = new Set([...Object.keys(catsA), ...Object.keys(catsB)])
  const rows = Array.from(allSlugs)
    .map((slug) => ({
      slug,
      label: catsA[slug]?.label ?? catsB[slug]?.label ?? slug,
      color: catsA[slug]?.color ?? catsB[slug]?.color ?? '#888',
      countA: catsA[slug]?.count ?? 0,
      countB: catsB[slug]?.count ?? 0,
    }))
    .sort((a, b) => (b.countA + b.countB) - (a.countA + a.countB))

  if (rows.length === 0) return null

  const maxCount = Math.max(...rows.map((r) => Math.max(r.countA, r.countB)), 1)

  return (
    <div className="mt-6 border-t border-gray-100 pt-4">
      <h3 className="text-sm font-semibold text-gray-700 mb-3">Categorias</h3>
      <div className="flex flex-col gap-2">
        {rows.map((row) => (
          <div key={row.slug} className="flex items-center gap-2">
            <span
              className="w-2 h-2 rounded-full flex-shrink-0"
              style={{ backgroundColor: row.color }}
            />
            <span className="text-xs text-gray-600 w-28 truncate" title={row.label}>{row.label}</span>
            <div className="flex-1 flex items-center gap-1">
              <div className="flex-1 flex justify-end">
                <div
                  className="h-4 rounded-l bg-blue-400"
                  style={{ width: `${(row.countA / maxCount) * 100}%`, minWidth: row.countA > 0 ? 4 : 0 }}
                />
              </div>
              <span className="text-xs text-gray-500 w-6 text-right tabular-nums">{row.countA}</span>
              <span className="text-xs text-gray-300">|</span>
              <span className="text-xs text-gray-500 w-6 tabular-nums">{row.countB}</span>
              <div className="flex-1">
                <div
                  className="h-4 rounded-r bg-amber-400"
                  style={{ width: `${(row.countB / maxCount) * 100}%`, minWidth: row.countB > 0 ? 4 : 0 }}
                />
              </div>
            </div>
          </div>
        ))}
      </div>
      <div className="flex justify-between mt-2 text-xs text-gray-400">
        <span translate="no">{polA.common_name}</span>
        <span translate="no">{polB.common_name}</span>
      </div>
    </div>
  )
}

function CompareCard({ pol, count }: { pol: Politician; count: number }) {
  return (
    <div className="flex items-center gap-3">
      {pol.photo_url ? (
        <Image src={pol.photo_url} alt={pol.common_name} width={48} height={48}
          className="w-12 h-12 rounded-full object-cover border-2 border-gray-200" referrerPolicy="no-referrer" />
      ) : (
        <div className="w-12 h-12 rounded-full bg-gray-200 flex items-center justify-center text-lg font-bold text-gray-500">
          {pol.common_name[0]}
        </div>
      )}
      <div>
        <p className="font-semibold text-gray-900" translate="no">{pol.common_name}</p>
        <div className="flex items-center gap-2 text-xs">
          <span className="px-1.5 py-0.5 rounded text-white font-mono" style={{ backgroundColor: getPartyColor(pol.party) }}>
            {pol.party}
          </span>
          <span className="text-gray-500">{count} declarações</span>
        </div>
      </div>
    </div>
  )
}
