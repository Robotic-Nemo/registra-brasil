export default function YearTimelineLoading() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-8" role="status" aria-label="Carregando linha do tempo">
      <div className="h-4 w-32 bg-gray-100 rounded animate-pulse mb-4" />
      <div className="h-8 w-56 bg-gray-200 rounded animate-pulse mb-4" />
      <div className="flex gap-2 mb-6">
        {Array.from({ length: 5 }).map((_, i) => (
          <div key={i} className="h-8 w-16 bg-gray-100 rounded-lg animate-pulse" />
        ))}
      </div>
      <div className="space-y-6">
        {Array.from({ length: 3 }).map((_, i) => (
          <div key={i}>
            <div className="h-6 w-32 bg-gray-200 rounded animate-pulse mb-3" />
            <div className="space-y-2 pl-6">
              {Array.from({ length: 3 }).map((_, j) => (
                <div key={j} className="h-16 bg-gray-100 rounded-lg animate-pulse" />
              ))}
            </div>
          </div>
        ))}
      </div>
    </main>
  )
}
