interface Props {
  lines?: number
  className?: string
}

/**
 * Text skeleton with variable widths for loading placeholders.
 */
export function SkeletonText({ lines = 3, className = '' }: Props) {
  const widths = ['w-full', 'w-5/6', 'w-4/6', 'w-3/4', 'w-2/3']

  return (
    <div className={`flex flex-col gap-2 ${className}`} aria-busy="true" role="status" aria-label="Carregando texto">
      {Array.from({ length: lines }, (_, i) => (
        <div
          key={i}
          className={`h-3.5 bg-gray-200 rounded animate-pulse ${widths[i % widths.length]}`}
          aria-hidden="true"
        />
      ))}
    </div>
  )
}
