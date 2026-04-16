import { Skeleton } from '@/components/ui/Skeleton'

export default function CategoriesLoading() {
  return (
    <main className="max-w-5xl mx-auto px-4 py-8" role="status" aria-label="Carregando categorias">
      <Skeleton className="h-7 w-40 mb-2" />
      <Skeleton className="h-4 w-64 mb-8" />
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        {Array.from({ length: 12 }).map((_, i) => (
          <div key={i} className="p-4 border border-gray-200 rounded-xl bg-white">
            <div className="flex items-start gap-3">
              <Skeleton className="w-3 h-3 rounded-full mt-1" />
              <div className="flex-1">
                <Skeleton className="h-4 w-28 mb-2" />
                <Skeleton className="h-3 w-full" />
              </div>
            </div>
          </div>
        ))}
      </div>
    </main>
  )
}
