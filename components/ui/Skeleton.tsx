interface SkeletonProps {
  className?: string
  /** Tailwind width class shorthand, e.g. "w-32" */
  width?: string
  /** Tailwind height class shorthand, e.g. "h-4" */
  height?: string
}

export function Skeleton({ className = '', width, height }: SkeletonProps) {
  return <div className={`animate-pulse bg-gray-200 rounded ${width ?? ''} ${height ?? ''} ${className}`.trim()} aria-hidden="true" />
}

export function StatementCardSkeleton() {
  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5 flex flex-col gap-3" aria-busy="true" role="status" aria-label="Carregando">
      <div className="flex items-center gap-2">
        <Skeleton className="w-8 h-8 rounded-full" />
        <div className="flex-1">
          <Skeleton className="h-4 w-32 mb-1" />
          <Skeleton className="h-3 w-20" />
        </div>
      </div>
      <Skeleton className="h-4 w-full" />
      <Skeleton className="h-4 w-3/4" />
      <div className="flex gap-1.5">
        <Skeleton className="h-6 w-20 rounded-full" />
        <Skeleton className="h-6 w-24 rounded-full" />
      </div>
      <Skeleton className="h-5 w-40 mt-1" />
    </div>
  )
}
