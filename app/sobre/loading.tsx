export default function SobreLoading() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-8" role="status" aria-label="Carregando...">
      <div className="animate-pulse">
        <div className="h-7 w-32 bg-gray-200 rounded mb-6" />
        <div className="flex flex-col gap-4">
          {Array.from({ length: 8 }, (_, i) => (
            <div key={i} className="flex flex-col gap-2">
              {i % 3 === 0 && <div className="h-5 w-40 bg-gray-200 rounded mt-2" />}
              <div className="h-3 bg-gray-100 rounded w-full" />
              <div className="h-3 bg-gray-100 rounded w-full" />
              <div className="h-3 bg-gray-100 rounded w-3/4" />
            </div>
          ))}
        </div>
      </div>
    </main>
  )
}
