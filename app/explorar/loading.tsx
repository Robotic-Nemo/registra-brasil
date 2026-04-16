export default function ExplorarLoading() {
  return (
    <main className="max-w-5xl mx-auto px-4 py-8" role="status" aria-label="Carregando explorador">
      <div className="h-4 w-24 bg-gray-100 rounded animate-pulse mb-4" />
      <div className="h-8 w-56 bg-gray-200 rounded animate-pulse mb-2" />
      <div className="h-4 w-72 bg-gray-100 rounded animate-pulse mb-6" />
      <div className="flex flex-col lg:flex-row gap-6">
        <div className="lg:w-64 shrink-0">
          <div className="h-80 bg-gray-100 rounded-xl animate-pulse" />
        </div>
        <div className="flex-1 space-y-4">
          <div className="h-10 bg-gray-100 rounded-lg animate-pulse" />
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
            {Array.from({ length: 6 }).map((_, i) => (
              <div key={i} className="h-36 bg-gray-100 rounded-xl animate-pulse" />
            ))}
          </div>
        </div>
      </div>
    </main>
  )
}
