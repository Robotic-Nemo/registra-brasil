import { Skeleton } from '@/components/ui/Skeleton'

export default function StateDetailLoading() {
  return (
    <main className="max-w-5xl mx-auto px-4 py-8" role="status" aria-label="Carregando estado">
      <Skeleton className="h-4 w-32 mb-4" />
      <Skeleton className="h-7 w-48 mb-2" />
      <Skeleton className="h-4 w-56 mb-8" />
      <Skeleton className="h-5 w-20 mb-3" />
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
        {Array.from({ length: 9 }).map((_, i) => (
          <div key={i} className="flex items-center gap-3 p-3 border border-gray-200 rounded-lg bg-white">
            <Skeleton className="w-10 h-10 rounded-full" />
            <div className="flex-1">
              <Skeleton className="h-4 w-32 mb-1" />
              <Skeleton className="h-3 w-20" />
            </div>
          </div>
        ))}
      </div>
    </main>
  )
}
