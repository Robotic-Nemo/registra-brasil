import { Suspense } from 'react'
import Link from 'next/link'
import type { CuratedSearchResult } from '@/types/search'
import { StatementGrid } from '@/components/statements/StatementGrid'
import { Pagination } from '@/components/ui/Pagination'
import { ShieldCheck, SearchX, ArrowRight } from 'lucide-react'

interface CuratedResultsProps {
  result: CuratedSearchResult
  durationMs?: number
}

export function CuratedResults({ result, durationMs }: CuratedResultsProps) {
  const totalPages = Math.ceil(result.total / 20)

  return (
    <section aria-live="polite" aria-atomic="true">
      <div className="flex items-center gap-2 mb-4">
        <ShieldCheck className="w-5 h-5 text-green-600" />
        <h2 className="font-semibold text-gray-900">
          Resultados verificados
        </h2>
        <span className="text-sm text-gray-500">({result.total})</span>
        {durationMs !== undefined && (
          <span className="text-xs text-gray-400 ml-auto">{(durationMs / 1000).toFixed(2)}s</span>
        )}
      </div>

      {result.results.length === 0 ? (
        <div className="border border-dashed border-gray-300 rounded-xl py-12 px-6 text-center">
          <SearchX className="w-10 h-10 text-gray-300 mx-auto mb-3" />
          <p className="text-gray-600 font-medium mb-1">Nenhuma declaração encontrada</p>
          <p className="text-sm text-gray-400 mb-4 max-w-sm mx-auto">
            Tente usar termos diferentes, remover filtros, ou buscar pelo nome do político.
          </p>
          <Link href="/buscar"
            className="inline-flex items-center gap-1 text-sm text-blue-600 hover:underline">
            Ver todas as declarações
            <ArrowRight className="w-3.5 h-3.5" />
          </Link>
        </div>
      ) : (
        <>
          <StatementGrid statements={result.results} />

          {(result.page > 1 || result.hasMore) && (
            <Suspense fallback={null}>
              <Pagination
                page={result.page}
                hasMore={result.hasMore}
                total={result.total}
                totalPages={totalPages}
              />
            </Suspense>
          )}
        </>
      )}
    </section>
  )
}
