export default function MapaLoading() {
  return (
    <main className="max-w-5xl mx-auto px-4 py-12" role="status" aria-label="Carregando mapa">
      <div className="h-8 w-56 bg-gray-200 rounded animate-pulse mb-2" />
      <div className="h-4 w-72 bg-gray-100 rounded animate-pulse mb-8" />

      <div className="flex gap-3 mb-8">
        {Array.from({ length: 5 }).map((_, i) => (
          <div key={i} className="h-6 w-20 bg-gray-100 rounded animate-pulse" />
        ))}
      </div>

      <div className="space-y-8">
        {Array.from({ length: 3 }).map((_, i) => (
          <div key={i}>
            <div className="h-6 w-32 bg-gray-200 rounded animate-pulse mb-3" />
            <div className="grid grid-cols-3 sm:grid-cols-4 md:grid-cols-6 lg:grid-cols-7 gap-2">
              {Array.from({ length: 7 }).map((_, j) => (
                <div key={j} className="h-16 bg-gray-100 rounded-lg animate-pulse" />
              ))}
            </div>
          </div>
        ))}
      </div>
    </main>
  )
}
