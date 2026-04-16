import { StatementCardSkeleton } from '@/components/ui/Skeleton'

export default function BuscarLoading() {
  return (
    <main className="max-w-7xl mx-auto px-4 py-6" role="status" aria-label="Carregando resultados">
      <div className="mb-6">
        <div className="h-10 bg-gray-100 rounded-lg animate-pulse" />
      </div>
      <div className="flex gap-8">
        {/* Filters skeleton */}
        <div className="hidden lg:block w-64 flex-shrink-0">
          <div className="bg-white border border-gray-200 rounded-xl p-4 space-y-4">
            {Array.from({ length: 5 }).map((_, i) => (
              <div key={i} className="h-8 bg-gray-100 rounded animate-pulse" />
            ))}
          </div>
        </div>
        {/* Results skeleton */}
        <div className="flex-1 min-w-0">
          <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">
            {Array.from({ length: 6 }).map((_, i) => (
              <StatementCardSkeleton key={i} />
            ))}
          </div>
        </div>
      </div>
    </main>
  )
}
