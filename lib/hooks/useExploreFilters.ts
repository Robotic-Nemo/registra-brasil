'use client'

import { useSearchParams, useRouter, usePathname } from 'next/navigation'
import { useCallback, useMemo } from 'react'

export interface ExploreFilters {
  partido?: string
  estado?: string
  categoria?: string
  de?: string
  ate?: string
  status?: string
  q?: string
  ordem?: string
  visualizacao?: 'grid' | 'lista' | 'timeline'
  pagina?: number
}

export function useExploreFilters() {
  const searchParams = useSearchParams()
  const router = useRouter()
  const pathname = usePathname()

  const filters: ExploreFilters = useMemo(() => ({
    partido: searchParams.get('partido') ?? undefined,
    estado: searchParams.get('estado') ?? undefined,
    categoria: searchParams.get('categoria') ?? undefined,
    de: searchParams.get('de') ?? undefined,
    ate: searchParams.get('ate') ?? undefined,
    status: searchParams.get('status') ?? undefined,
    q: searchParams.get('q') ?? undefined,
    ordem: searchParams.get('ordem') ?? undefined,
    visualizacao: (searchParams.get('visualizacao') as ExploreFilters['visualizacao']) ?? undefined,
    pagina: searchParams.get('pagina') ? Number(searchParams.get('pagina')) : undefined,
  }), [searchParams])

  const activeCount = useMemo(() => {
    let count = 0
    if (filters.partido) count++
    if (filters.estado) count++
    if (filters.categoria) count++
    if (filters.de) count++
    if (filters.ate) count++
    if (filters.status) count++
    if (filters.q) count++
    return count
  }, [filters])

  const setFilter = useCallback((key: keyof ExploreFilters, value: string | number | undefined) => {
    const params = new URLSearchParams(searchParams.toString())
    if (value === undefined || value === '') {
      params.delete(key)
    } else {
      params.set(key, String(value))
    }
    // Reset page on filter change
    if (key !== 'pagina') {
      params.delete('pagina')
    }
    router.push(`${pathname}?${params.toString()}`, { scroll: false })
  }, [searchParams, router, pathname])

  const setFilters = useCallback((updates: Partial<ExploreFilters>) => {
    const params = new URLSearchParams(searchParams.toString())
    for (const [key, value] of Object.entries(updates)) {
      if (value === undefined || value === '') {
        params.delete(key)
      } else {
        params.set(key, String(value))
      }
    }
    params.delete('pagina')
    router.push(`${pathname}?${params.toString()}`, { scroll: false })
  }, [searchParams, router, pathname])

  const removeFilter = useCallback((key: keyof ExploreFilters) => {
    setFilter(key, undefined)
  }, [setFilter])

  const clearAll = useCallback(() => {
    router.push(pathname, { scroll: false })
  }, [router, pathname])

  return {
    filters,
    activeCount,
    setFilter,
    setFilters,
    removeFilter,
    clearAll,
  }
}
