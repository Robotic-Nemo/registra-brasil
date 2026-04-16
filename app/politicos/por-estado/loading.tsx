export default function Loading() {
  return (
    <main className="max-w-5xl mx-auto px-4 py-8 animate-pulse">
      <div className="h-8 w-64 bg-gray-200 rounded mb-2" />
      <div className="h-4 w-80 bg-gray-100 rounded mb-8" />

      <div className="flex flex-wrap gap-1.5 mb-8">
        {Array.from({ length: 27 }).map((_, i) => (
          <div key={i} className="h-6 w-12 bg-gray-100 rounded" />
        ))}
      </div>

      {Array.from({ length: 3 }).map((_, i) => (
        <div key={i} className="mb-10">
          <div className="h-6 w-48 bg-gray-200 rounded mb-3" />
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            {Array.from({ length: 4 }).map((_, j) => (
              <div key={j} className="h-16 bg-gray-100 rounded-lg" />
            ))}
          </div>
        </div>
      ))}
    </main>
  )
}
