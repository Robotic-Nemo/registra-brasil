export default function EditLoading() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <div className="h-8 w-64 bg-gray-200 rounded animate-pulse mb-6" />
      <div className="space-y-6">
        {Array.from({ length: 6 }).map((_, i) => (
          <div key={i}>
            <div className="h-4 w-24 bg-gray-100 rounded animate-pulse mb-2" />
            <div className="h-10 bg-gray-100 rounded-lg animate-pulse" />
          </div>
        ))}
      </div>
    </main>
  )
}
