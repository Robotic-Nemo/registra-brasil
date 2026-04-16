export default function FaqLoading() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-12" role="status" aria-label="Carregando FAQ">
      <div className="h-8 w-64 bg-gray-200 rounded animate-pulse mb-2" />
      <div className="h-4 w-48 bg-gray-100 rounded animate-pulse mb-10" />

      <div className="space-y-4">
        {Array.from({ length: 6 }).map((_, i) => (
          <div key={i} className="bg-white border border-gray-200 rounded-xl p-6">
            <div className="h-5 w-3/4 bg-gray-200 rounded animate-pulse" />
          </div>
        ))}
      </div>
    </main>
  )
}
