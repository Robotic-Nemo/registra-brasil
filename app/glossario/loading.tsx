export default function GlossarioLoading() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-8" role="status" aria-label="Carregando glossario">
      <div className="h-4 w-24 bg-gray-100 rounded animate-pulse mb-4" />
      <div className="h-8 w-48 bg-gray-200 rounded animate-pulse mb-2" />
      <div className="h-4 w-72 bg-gray-100 rounded animate-pulse mb-6" />
      <div className="h-10 bg-gray-100 rounded-lg animate-pulse mb-6" />
      <div className="space-y-3">
        {Array.from({ length: 8 }).map((_, i) => (
          <div key={i} className="h-20 bg-gray-100 rounded-lg animate-pulse" />
        ))}
      </div>
    </main>
  )
}
