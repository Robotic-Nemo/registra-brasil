export default function StatementLoading() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-8" role="status" aria-label="Carregando declaração...">
      {/* Breadcrumbs skeleton */}
      <div className="flex items-center gap-2 mb-6 animate-pulse">
        <div className="h-3 w-12 bg-gray-200 rounded" />
        <span className="text-gray-300">/</span>
        <div className="h-3 w-20 bg-gray-200 rounded" />
        <span className="text-gray-300">/</span>
        <div className="h-3 w-32 bg-gray-200 rounded" />
      </div>
      <div className="bg-white border border-gray-200 rounded-xl p-6 space-y-5">
        {/* Politician */}
        <div className="flex items-center gap-3">
          <div className="w-12 h-12 rounded-full bg-gray-200 animate-pulse" />
          <div className="space-y-2">
            <div className="h-4 w-32 bg-gray-200 rounded animate-pulse" />
            <div className="h-3 w-48 bg-gray-100 rounded animate-pulse" />
          </div>
        </div>
        {/* Date */}
        <div className="h-3 w-24 bg-gray-100 rounded animate-pulse" />
        {/* Reading time */}
        <div className="flex items-center gap-2">
          <div className="h-3 w-3 bg-gray-100 rounded animate-pulse" />
          <div className="h-3 w-28 bg-gray-100 rounded animate-pulse" />
        </div>
        {/* Summary */}
        <div className="space-y-2">
          <div className="h-4 w-full bg-gray-100 rounded animate-pulse" />
          <div className="h-4 w-3/4 bg-gray-100 rounded animate-pulse" />
        </div>
        {/* Quote */}
        <div className="border-l-4 border-gray-200 pl-4 py-3 space-y-2">
          <div className="h-3 w-full bg-gray-100 rounded animate-pulse" />
          <div className="h-3 w-5/6 bg-gray-100 rounded animate-pulse" />
        </div>
        {/* Source */}
        <div className="border-t border-gray-100 pt-4">
          <div className="h-3 w-16 bg-gray-100 rounded animate-pulse mb-2" />
          <div className="h-4 w-64 bg-gray-100 rounded animate-pulse" />
        </div>
      </div>
    </main>
  )
}
