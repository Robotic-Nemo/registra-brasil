'use client'

import { useRouter, usePathname, useSearchParams } from 'next/navigation'
import { Chip } from '@/components/ui/Chip'
import { X } from 'lucide-react'
import type { Category } from '@/types/database'

const STATUS_LABELS: Record<string, string> = {
  verified: 'Verificados',
  unverified: 'Nao verificados',
  disputed: 'Disputados',
  removed: 'Removidos',
}

interface ActiveFiltersProps {
  categories?: Category[]
}

export function ActiveFilters({ categories = [] }: ActiveFiltersProps) {
  const router = useRouter()
  const pathname = usePathname()
  const searchParams = useSearchParams()

  const selectedCats = searchParams.getAll('categoria')
  const party = searchParams.get('partido')
  const state = searchParams.get('estado')
  const status = searchParams.get('status')
  const dateFrom = searchParams.get('de')
  const dateTo = searchParams.get('ate')

  const hasFilters = selectedCats.length > 0 || party || state || status || dateFrom || dateTo

  if (!hasFilters) return null

  function removeParam(key: string, value?: string) {
    const params = new URLSearchParams(searchParams.toString())
    if (value && key === 'categoria') {
      const current = params.getAll('categoria').filter((v) => v !== value)
      params.delete('categoria')
      current.forEach((v) => params.append('categoria', v))
    } else {
      params.delete(key)
    }
    params.delete('page')
    router.push(`${pathname}?${params.toString()}`)
  }

  function clearAll() {
    const params = new URLSearchParams()
    const q = searchParams.get('q')
    if (q) params.set('q', q)
    router.push(`${pathname}?${params.toString()}`)
  }

  const catMap = new Map(categories.map((c) => [c.slug, c]))

  return (
    <div className="flex flex-wrap items-center gap-1.5" aria-label="Filtros ativos">
      {selectedCats.map((slug) => {
        const cat = catMap.get(slug)
        return (
          <Chip key={slug} color={cat?.color_hex} onRemove={() => removeParam('categoria', slug)}>
            {cat?.label_pt ?? slug}
          </Chip>
        )
      })}

      {party && (
        <Chip onRemove={() => removeParam('partido')}>
          {party}
        </Chip>
      )}

      {state && (
        <Chip onRemove={() => removeParam('estado')}>
          {state}
        </Chip>
      )}

      {status && (
        <Chip onRemove={() => removeParam('status')}>
          {STATUS_LABELS[status] ?? status}
        </Chip>
      )}

      {(dateFrom || dateTo) && (
        <Chip onRemove={() => {
          const params = new URLSearchParams(searchParams.toString())
          params.delete('de')
          params.delete('ate')
          params.delete('page')
          router.push(`${pathname}?${params.toString()}`)
        }}>
          {dateFrom ?? '...'} — {dateTo ?? '...'}
        </Chip>
      )}

      <button
        type="button"
        onClick={clearAll}
        className="flex items-center gap-1 text-xs text-red-600 hover:text-red-800 font-medium ml-1"
      >
        <X className="w-3 h-3" />
        Limpar tudo
      </button>
    </div>
  )
}
