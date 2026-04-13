'use client'

import { useRouter, useSearchParams, usePathname } from 'next/navigation'
import { ChevronLeft, ChevronRight } from 'lucide-react'

interface PaginationProps {
  page: number
  hasMore: boolean
  total: number
}

export function Pagination({ page, hasMore, total }: PaginationProps) {
  const router = useRouter()
  const pathname = usePathname()
  const searchParams = useSearchParams()

  function navigate(newPage: number) {
    const params = new URLSearchParams(searchParams.toString())
    params.set('page', String(newPage))
    router.push(`${pathname}?${params.toString()}`)
  }

  return (
    <div className="flex items-center justify-between text-sm text-gray-600 mt-6">
      <span>{total} resultado{total !== 1 ? 's' : ''}</span>
      <div className="flex items-center gap-2">
        <button
          onClick={() => navigate(page - 1)}
          disabled={page <= 1}
          className="flex items-center gap-1 px-3 py-1.5 rounded border border-gray-200 hover:bg-gray-50 disabled:opacity-40 disabled:cursor-not-allowed"
        >
          <ChevronLeft className="w-4 h-4" />
          Anterior
        </button>
        <span className="px-3 py-1.5 bg-gray-100 rounded font-medium">{page}</span>
        <button
          onClick={() => navigate(page + 1)}
          disabled={!hasMore}
          className="flex items-center gap-1 px-3 py-1.5 rounded border border-gray-200 hover:bg-gray-50 disabled:opacity-40 disabled:cursor-not-allowed"
        >
          Próxima
          <ChevronRight className="w-4 h-4" />
        </button>
      </div>
    </div>
  )
}
