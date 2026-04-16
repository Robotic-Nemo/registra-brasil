export default function TimelineLoading() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-8" role="status" aria-label="Carregando linha do tempo">
      <div className="h-9 w-48 bg-zinc-200 rounded animate-pulse mb-2" />
      <div className="h-5 w-96 bg-zinc-100 rounded animate-pulse mb-8" />

      <div className="space-y-8">
        {[1, 2].map((month) => (
          <div key={month}>
            <div className="h-6 w-40 bg-zinc-200 rounded animate-pulse mb-4" />
            <div className="pl-6 border-l-2 border-zinc-200 space-y-4">
              {[1, 2, 3].map((item) => (
                <div key={item} className="bg-white border border-zinc-200 rounded-lg p-4">
                  <div className="h-3 w-24 bg-zinc-100 rounded animate-pulse mb-2" />
                  <div className="h-4 w-full bg-zinc-100 rounded animate-pulse mb-1" />
                  <div className="h-4 w-2/3 bg-zinc-100 rounded animate-pulse mb-2" />
                  <div className="h-3 w-32 bg-zinc-100 rounded animate-pulse" />
                </div>
              ))}
            </div>
          </div>
        ))}
      </div>
    </main>
  )
}
