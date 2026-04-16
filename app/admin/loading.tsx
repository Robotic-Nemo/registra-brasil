export default function AdminLoading() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-12" role="status" aria-label="Carregando painel">
      <div className="h-8 w-48 bg-gray-200 rounded animate-pulse mb-2" />
      <div className="h-4 w-32 bg-gray-100 rounded animate-pulse mb-8" />

      <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 mb-8">
        {Array.from({ length: 4 }).map((_, i) => (
          <div key={i} className="bg-white border border-gray-200 rounded-lg p-4">
            <div className="h-8 w-12 bg-gray-100 rounded animate-pulse mx-auto mb-2" />
            <div className="h-3 w-16 bg-gray-100 rounded animate-pulse mx-auto" />
          </div>
        ))}
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-3 gap-4 mb-10">
        {Array.from({ length: 3 }).map((_, i) => (
          <div key={i} className="h-28 bg-white border border-gray-200 rounded-xl animate-pulse" />
        ))}
      </div>
    </main>
  )
}
