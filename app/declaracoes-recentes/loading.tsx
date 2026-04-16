export default function Loading() {
  return (
    <main className="max-w-5xl mx-auto px-4 py-8" role="status" aria-label="Carregando declarações recentes...">
      <div className="h-7 w-56 bg-gray-200 rounded animate-pulse mb-2" />
      <div className="h-4 w-72 bg-gray-100 rounded animate-pulse mb-8" />
      <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">
        {Array.from({ length: 9 }, (_, i) => (
          <div key={i} className="bg-white border border-gray-200 rounded-xl p-4 animate-pulse">
            <div className="flex items-center gap-3 mb-3">
              <div className="w-10 h-10 bg-gray-200 rounded-full" />
              <div className="flex-1">
                <div className="h-3.5 bg-gray-200 rounded w-1/3 mb-1.5" />
                <div className="h-3 bg-gray-100 rounded w-1/4" />
              </div>
            </div>
            <div className="h-3 bg-gray-200 rounded w-full mb-2" />
            <div className="h-3 bg-gray-200 rounded w-full mb-2" />
            <div className="h-3 bg-gray-200 rounded w-2/3" />
          </div>
        ))}
      </div>
    </main>
  )
}
