import { Skeleton } from '@/components/ui/Skeleton'

export default function PartidosLoading() {
  return (
    <main className="max-w-5xl mx-auto px-4 py-8" role="status" aria-label="Carregando partidos">
      <Skeleton className="h-7 w-36 mb-2" />
      <Skeleton className="h-4 w-72 mb-2" />
      <Skeleton className="h-4 w-56 mb-8" />
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
        {Array.from({ length: 12 }).map((_, i) => (
          <div key={i} className="flex items-center justify-between p-4 border border-gray-200 rounded-lg bg-white">
            <div>
              <Skeleton className="h-5 w-16 mb-1" />
              <Skeleton className="h-3 w-24" />
            </div>
            <Skeleton className="h-6 w-24 rounded" />
          </div>
        ))}
      </div>
    </main>
  )
}
