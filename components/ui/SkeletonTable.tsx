interface Props {
  rows?: number
  columns?: number
  className?: string
}

/**
 * Table skeleton loading placeholder.
 */
export function SkeletonTable({ rows = 5, columns = 4, className = '' }: Props) {
  return (
    <div className={`w-full ${className}`} aria-busy="true" role="status" aria-label="Carregando tabela">
      {/* Header row */}
      <div className="flex gap-4 pb-3 border-b border-gray-200 mb-3">
        {Array.from({ length: columns }, (_, i) => (
          <div
            key={`h-${i}`}
            className="h-3 bg-gray-300 rounded animate-pulse flex-1"
            aria-hidden="true"
          />
        ))}
      </div>

      {/* Body rows */}
      {Array.from({ length: rows }, (_, rowIdx) => (
        <div key={rowIdx} className="flex gap-4 py-2.5">
          {Array.from({ length: columns }, (_, colIdx) => (
            <div
              key={`${rowIdx}-${colIdx}`}
              className="h-3 bg-gray-200 rounded animate-pulse flex-1"
              style={{ animationDelay: `${(rowIdx * columns + colIdx) * 50}ms` }}
              aria-hidden="true"
            />
          ))}
        </div>
      ))}
    </div>
  )
}
