import { Skeleton } from '@/components/ui/Skeleton'

export default function EstadosLoading() {
  return (
    <main className="max-w-5xl mx-auto px-4 py-8" role="status" aria-label="Carregando estados">
      <Skeleton className="h-7 w-40 mb-2" />
      <Skeleton className="h-4 w-64 mb-8" />
      <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-4">
        {Array.from({ length: 27 }).map((_, i) => (
          <div key={i} className="p-4 border border-gray-200 rounded-xl bg-white">
            <Skeleton className="h-5 w-10 mb-2" />
            <Skeleton className="h-4 w-28" />
          </div>
        ))}
      </div>
    </main>
  )
}
