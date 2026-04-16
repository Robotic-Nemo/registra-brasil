export default function AdminSettingsLoading() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-12" role="status" aria-label="Carregando configuracoes">
      <div className="flex items-center gap-3 mb-8">
        <div className="w-5 h-5 bg-gray-200 rounded animate-pulse" />
        <div>
          <div className="h-7 w-48 bg-gray-200 rounded animate-pulse mb-1" />
          <div className="h-4 w-64 bg-gray-100 rounded animate-pulse" />
        </div>
      </div>

      <div className="space-y-8">
        {Array.from({ length: 3 }).map((_, i) => (
          <div key={i} className="bg-white border border-gray-200 rounded-xl p-6">
            <div className="h-5 w-32 bg-gray-200 rounded animate-pulse mb-2" />
            <div className="h-4 w-48 bg-gray-100 rounded animate-pulse mb-5" />
            <div className="space-y-4">
              {Array.from({ length: 2 }).map((_, j) => (
                <div key={j}>
                  <div className="h-4 w-24 bg-gray-100 rounded animate-pulse mb-1" />
                  <div className="h-10 w-full bg-gray-50 border border-gray-200 rounded-lg animate-pulse" />
                </div>
              ))}
            </div>
          </div>
        ))}
      </div>
    </main>
  )
}
