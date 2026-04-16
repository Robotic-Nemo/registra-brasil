export default function StatsLoading() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-8" role="status" aria-label="Carregando estatisticas">
      <div className="h-4 w-32 bg-gray-100 rounded animate-pulse mb-4" />
      <div className="h-8 w-48 bg-gray-200 rounded animate-pulse mb-6" />
      <div className="h-32 bg-gray-100 rounded-xl animate-pulse mb-8" />
      <div className="h-40 bg-gray-100 rounded-xl animate-pulse" />
    </main>
  )
}
