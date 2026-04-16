export default function NarrativasLoading() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-8" role="status" aria-label="Carregando narrativas">
      <div className="h-4 w-24 bg-gray-100 rounded animate-pulse mb-4" />
      <div className="h-8 w-40 bg-gray-200 rounded animate-pulse mb-2" />
      <div className="h-4 w-64 bg-gray-100 rounded animate-pulse mb-8" />
      <div className="h-48 bg-gray-100 rounded-xl animate-pulse mb-8" />
      <div className="space-y-4">
        {Array.from({ length: 4 }).map((_, i) => (
          <div key={i} className="h-32 bg-gray-100 rounded-xl animate-pulse" />
        ))}
      </div>
    </main>
  )
}
