interface SearchStatsProps {
  totalResults: number
  durationMs?: number
  query?: string
}

/**
 * Displays search result count and optional duration.
 * Format: "X resultados em Yms"
 */
export function SearchStats({ totalResults, durationMs, query }: SearchStatsProps) {
  return (
    <p className="text-sm text-gray-500" role="status" aria-live="polite">
      <span className="tabular-nums font-medium text-gray-700">{totalResults}</span>{' '}
      {totalResults === 1 ? 'resultado' : 'resultados'}
      {query && (
        <>
          {' '}para <strong>&quot;{query}&quot;</strong>
        </>
      )}
      {durationMs != null && (
        <span className="text-gray-400">
          {' '}em <span className="tabular-nums">{durationMs}</span>ms
        </span>
      )}
    </p>
  )
}
