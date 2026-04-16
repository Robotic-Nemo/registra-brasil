import { Skeleton } from '@/components/ui/Skeleton'

export default function NuvemDePalavrasLoading() {
  return (
    <main className="max-w-5xl mx-auto px-4 py-8" role="status" aria-label="Carregando nuvem de palavras">
      <Skeleton className="h-7 w-56 mb-2" />
      <Skeleton className="h-4 w-80 mb-8" />
      <div className="w-full aspect-video border border-gray-200 rounded-xl bg-white flex items-center justify-center">
        <Skeleton className="w-3/4 h-3/4 rounded-lg" />
      </div>
    </main>
  )
}
