import { Suspense } from 'react'
import type { CuratedSearchResult } from '@/types/search'
import { StatementGrid } from '@/components/statements/StatementGrid'
import { Pagination } from '@/components/ui/Pagination'
import { ShieldCheck } from 'lucide-react'

interface CuratedResultsProps {
  result: CuratedSearchResult
}

export function CuratedResults({ result }: CuratedResultsProps) {
  return (
    <section>
      <div className="flex items-center gap-2 mb-4">
        <ShieldCheck className="w-5 h-5 text-green-600" />
        <h2 className="font-semibold text-gray-900">
          Resultados verificados
        </h2>
        <span className="text-sm text-gray-500">({result.total})</span>
      </div>

      <StatementGrid statements={result.results} />

      {(result.page > 1 || result.hasMore) && (
        <Suspense fallback={null}>
          <Pagination page={result.page} hasMore={result.hasMore} total={result.total} />
        </Suspense>
      )}
    </section>
  )
}
