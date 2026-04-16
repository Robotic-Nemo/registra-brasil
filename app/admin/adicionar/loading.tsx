import { Skeleton } from '@/components/ui/Skeleton'

export default function AdicionarLoading() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <Skeleton className="h-8 w-56 mb-1" />
      <Skeleton className="h-4 w-80 mb-8" />

      <div className="space-y-6">
        {Array.from({ length: 5 }).map((_, i) => (
          <div key={i}>
            <Skeleton className="h-4 w-24 mb-2" />
            <Skeleton className="h-10 w-full rounded-lg" />
          </div>
        ))}
        <Skeleton className="h-10 w-32 rounded-lg" />
      </div>
    </main>
  )
}
