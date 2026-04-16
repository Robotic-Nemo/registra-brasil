import { Skeleton } from '@/components/ui/Skeleton'

interface SkeletonPageProps {
  variant?: 'article' | 'list' | 'profile'
}

export function SkeletonPage({ variant = 'article' }: SkeletonPageProps) {
  if (variant === 'profile') {
    return (
      <div className="container mx-auto max-w-3xl px-4 py-8 animate-pulse" aria-busy="true" aria-label="Carregando perfil">
        <div className="flex items-center gap-4 mb-8">
          <Skeleton className="h-16 w-16 rounded-full" />
          <div className="space-y-2 flex-1">
            <Skeleton className="h-6 w-48" />
            <Skeleton className="h-4 w-32" />
          </div>
        </div>
        <div className="space-y-4">
          {Array.from({ length: 4 }).map((_, i) => (
            <Skeleton key={i} className="h-20 w-full rounded-lg" />
          ))}
        </div>
      </div>
    )
  }

  if (variant === 'list') {
    return (
      <div className="container mx-auto max-w-4xl px-4 py-8 animate-pulse" aria-busy="true" aria-label="Carregando lista">
        <Skeleton className="h-8 w-64 mb-6" />
        <div className="space-y-3">
          {Array.from({ length: 8 }).map((_, i) => (
            <Skeleton key={i} className="h-16 w-full rounded-lg" />
          ))}
        </div>
      </div>
    )
  }

  // article variant (default)
  return (
    <div className="container mx-auto max-w-3xl px-4 py-8 animate-pulse" aria-busy="true" aria-label="Carregando artigo">
      <Skeleton className="h-8 w-3/4 mb-4" />
      <div className="flex gap-3 mb-6">
        <Skeleton className="h-5 w-24" />
        <Skeleton className="h-5 w-32" />
      </div>
      <div className="space-y-3">
        <Skeleton className="h-4 w-full" />
        <Skeleton className="h-4 w-full" />
        <Skeleton className="h-4 w-5/6" />
        <Skeleton className="h-4 w-full" />
        <Skeleton className="h-4 w-4/5" />
      </div>
      <Skeleton className="h-48 w-full rounded-lg mt-6" />
      <div className="space-y-3 mt-6">
        <Skeleton className="h-4 w-full" />
        <Skeleton className="h-4 w-full" />
        <Skeleton className="h-4 w-3/4" />
      </div>
    </div>
  )
}
