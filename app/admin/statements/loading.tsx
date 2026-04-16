export default function AdminStatementsLoading() {
  return (
    <main className="max-w-5xl mx-auto px-4 py-10">
      <div className="flex items-center justify-between mb-6">
        <div className="h-7 w-48 bg-gray-200 rounded animate-pulse" />
        <div className="h-5 w-28 bg-gray-200 rounded animate-pulse" />
      </div>

      {/* Filter skeleton */}
      <div className="flex flex-wrap gap-3 mb-6 p-4 bg-gray-50 rounded-lg border border-gray-200">
        {Array.from({ length: 4 }).map((_, i) => (
          <div key={i} className="h-8 w-36 bg-gray-200 rounded-lg animate-pulse" />
        ))}
      </div>

      {/* List skeleton */}
      <div className="border border-gray-200 rounded-lg divide-y divide-gray-100 bg-white">
        {Array.from({ length: 10 }).map((_, i) => (
          <div key={i} className="flex items-start gap-3 px-4 py-3">
            <div className="flex-1 space-y-2">
              <div className="h-4 w-3/4 bg-gray-200 rounded animate-pulse" />
              <div className="h-3 w-1/3 bg-gray-100 rounded animate-pulse" />
            </div>
            <div className="h-5 w-20 bg-gray-200 rounded-full animate-pulse" />
          </div>
        ))}
      </div>
    </main>
  )
}
