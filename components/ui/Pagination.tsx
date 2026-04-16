'use client'

import { useRouter, useSearchParams, usePathname } from 'next/navigation'
import { ChevronLeft, ChevronRight, ChevronsLeft, ChevronsRight } from 'lucide-react'

interface PaginationProps {
  page: number
  hasMore: boolean
  total: number
  totalPages?: number
  /** Query param name for the page number. Defaults to `page`. */
  paramName?: string
}

export function Pagination({ page, hasMore, total, totalPages, paramName = 'page' }: PaginationProps) {
  const router = useRouter()
  const pathname = usePathname()
  const searchParams = useSearchParams()

  function navigate(newPage: number) {
    // Clamp so rapid clicks or stale disabled state can't jump past the bounds.
    const clamped = Math.max(1, totalPages ? Math.min(newPage, totalPages) : newPage)
    const params = new URLSearchParams(searchParams.toString())
    if (clamped <= 1) {
      params.delete(paramName)
    } else {
      params.set(paramName, String(clamped))
    }
    const qs = params.toString()
    router.push(qs ? `${pathname}?${qs}` : pathname)
  }

  const btnClass = 'flex items-center gap-1 px-2.5 py-1.5 rounded border border-gray-200 hover:bg-gray-50 disabled:opacity-40 disabled:cursor-not-allowed transition-colors'

  return (
    <nav aria-label="Paginação" className="flex items-center justify-between text-sm text-gray-600 mt-6">
      <span>{total} resultado{total !== 1 ? 's' : ''}</span>
      <div className="flex items-center gap-1.5">
        {totalPages && totalPages > 2 && (
          <button
            onClick={() => navigate(1)}
            disabled={page <= 1}
            aria-label="Primeira página"
            data-testid="pagination-first"
            className={btnClass}
          >
            <ChevronsLeft className="w-4 h-4" />
          </button>
        )}
        <button
          onClick={() => navigate(page - 1)}
          disabled={page <= 1}
          aria-label="Página anterior"
          data-testid="pagination-prev"
          className={btnClass}
        >
          <ChevronLeft className="w-4 h-4" />
          <span className="hidden sm:inline">Anterior</span>
        </button>
        <span className="px-3 py-1.5 bg-gray-100 rounded font-medium tabular-nums" aria-current="page" aria-label={`Pagina ${page}${totalPages ? ` de ${totalPages}` : ''}`}>
          {page}{totalPages ? ` / ${totalPages}` : ''}
        </span>
        <button
          onClick={() => navigate(page + 1)}
          disabled={!hasMore}
          aria-label="Próxima página"
          data-testid="pagination-next"
          className={btnClass}
        >
          <span className="hidden sm:inline">Próxima</span>
          <ChevronRight className="w-4 h-4" />
        </button>
        {totalPages && totalPages > 2 && (
          <button
            onClick={() => navigate(totalPages)}
            disabled={page >= totalPages}
            aria-label="Última página"
            data-testid="pagination-last"
            className={btnClass}
          >
            <ChevronsRight className="w-4 h-4" />
          </button>
        )}
      </div>
    </nav>
  )
}
