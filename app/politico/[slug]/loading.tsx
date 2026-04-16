import { StatementCardSkeleton } from '@/components/ui/Skeleton'

export default function PoliticianLoading() {
  return (
    <main className="max-w-5xl mx-auto px-4 py-8 flex flex-col gap-6" role="status" aria-label="Carregando perfil">
      {/* Header skeleton */}
      <div className="flex items-center gap-4">
        <div className="w-20 h-20 rounded-full bg-gray-200 animate-pulse" />
        <div className="flex-1 space-y-2">
          <div className="h-6 w-48 bg-gray-200 rounded animate-pulse" />
          <div className="h-4 w-32 bg-gray-100 rounded animate-pulse" />
        </div>
      </div>
      {/* Stats skeleton */}
      <div className="h-16 bg-gray-100 rounded-xl animate-pulse" />
      {/* Grid skeleton */}
      <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">
        {Array.from({ length: 6 }).map((_, i) => (
          <StatementCardSkeleton key={i} />
        ))}
      </div>
    </main>
  )
}
