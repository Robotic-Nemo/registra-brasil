interface SkeletonCardProps {
  lines?: number
  showAvatar?: boolean
  className?: string
}

export function SkeletonCard({ lines = 3, showAvatar = false, className = '' }: SkeletonCardProps) {
  return (
    <div
      className={`bg-white border border-gray-200 rounded-xl p-4 animate-pulse ${className}`}
      role="status"
      aria-label="Carregando..."
    >
      {showAvatar && (
        <div className="flex items-center gap-3 mb-3">
          <div className="w-10 h-10 bg-gray-200 rounded-full" />
          <div className="flex-1">
            <div className="h-3.5 bg-gray-200 rounded w-1/3 mb-1.5" />
            <div className="h-3 bg-gray-100 rounded w-1/4" />
          </div>
        </div>
      )}
      <div className="flex flex-col gap-2">
        {Array.from({ length: lines }, (_, i) => (
          <div
            key={i}
            className="h-3 bg-gray-200 rounded"
            style={{ width: i === lines - 1 ? '60%' : '100%' }}
          />
        ))}
      </div>
      <div className="flex gap-2 mt-3">
        <div className="h-5 w-16 bg-gray-100 rounded-full" />
        <div className="h-5 w-12 bg-gray-100 rounded-full" />
      </div>
    </div>
  )
}
