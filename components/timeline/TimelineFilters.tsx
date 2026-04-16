'use client'

import { useRouter, useSearchParams, usePathname } from 'next/navigation'
import { BRAZILIAN_STATES } from '@/lib/constants/states'

interface Props {
  parties: string[]
  categories: { slug: string; label: string }[]
}

export function TimelineFilters({ parties, categories }: Props) {
  const router = useRouter()
  const searchParams = useSearchParams()
  const pathname = usePathname()

  function updateParam(key: string, value: string) {
    const params = new URLSearchParams(searchParams.toString())
    if (value) {
      params.set(key, value)
    } else {
      params.delete(key)
    }
    router.push(`${pathname}?${params.toString()}`, { scroll: false })
  }

  return (
    <div className="flex flex-wrap gap-2">
      <select
        value={searchParams.get('partido') ?? ''}
        onChange={(e) => updateParam('partido', e.target.value)}
        className="rounded-lg border border-gray-300 px-2 py-1 text-sm bg-white"
        aria-label="Filtrar por partido"
      >
        <option value="">Todos os partidos</option>
        {parties.map((p) => (
          <option key={p} value={p}>{p}</option>
        ))}
      </select>

      <select
        value={searchParams.get('estado') ?? ''}
        onChange={(e) => updateParam('estado', e.target.value)}
        className="rounded-lg border border-gray-300 px-2 py-1 text-sm bg-white"
        aria-label="Filtrar por estado"
      >
        <option value="">Todos os estados</option>
        {BRAZILIAN_STATES.map((s) => (
          <option key={s.uf} value={s.uf}>{s.name}</option>
        ))}
      </select>

      <select
        value={searchParams.get('categoria') ?? ''}
        onChange={(e) => updateParam('categoria', e.target.value)}
        className="rounded-lg border border-gray-300 px-2 py-1 text-sm bg-white"
        aria-label="Filtrar por categoria"
      >
        <option value="">Todas as categorias</option>
        {categories.map((c) => (
          <option key={c.slug} value={c.slug}>{c.label}</option>
        ))}
      </select>
    </div>
  )
}
