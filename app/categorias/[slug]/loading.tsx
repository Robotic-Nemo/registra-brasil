import { Skeleton, StatementCardSkeleton } from '@/components/ui/Skeleton'

export default function CategoryLoading() {
  return (
    <main className="max-w-5xl mx-auto px-4 py-8" role="status" aria-label="Carregando categoria">
      {/* Breadcrumbs skeleton */}
      <div className="flex items-center gap-2 mb-6">
        <Skeleton className="h-4 w-20" />
        <Skeleton className="h-4 w-4" />
        <Skeleton className="h-4 w-28" />
      </div>
      {/* Header skeleton */}
      <div className="mb-8">
        <div className="flex items-center gap-3 mb-2">
          <Skeleton className="w-4 h-4 rounded-full" />
          <Skeleton className="h-7 w-44" />
        </div>
        <Skeleton className="h-4 w-72 mb-1" />
        <Skeleton className="h-3.5 w-40 mt-1" />
      </div>
      {/* Grid skeleton */}
      <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">
        {Array.from({ length: 6 }).map((_, i) => (
          <StatementCardSkeleton key={i} />
        ))}
      </div>
    </main>
  )
}
