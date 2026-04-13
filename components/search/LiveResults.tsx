import type { LiveSearchResult } from '@/types/search'
import { YouTubeResultCard } from '@/components/youtube/YouTubeResultCard'
import { AlertTriangle, PlayCircle, Newspaper, BatteryLow } from 'lucide-react'

interface LiveResultsProps {
  result: LiveSearchResult
  query: string
}

export function LiveResults({ result, query }: LiveResultsProps) {
  const hasYoutube = result.youtube.length > 0
  const hasNews = result.news.length > 0

  if (result.quotaExhausted && !hasYoutube && !hasNews) {
    return (
      <section className="border border-yellow-200 bg-yellow-50 rounded-xl p-4">
        <div className="flex items-center gap-2 text-yellow-700 text-sm">
          <BatteryLow className="w-4 h-4" />
          <span>Cota da API do YouTube esgotada hoje. Resultados ao vivo indisponíveis.</span>
        </div>
      </section>
    )
  }

  if (!hasYoutube && !hasNews) return null

  return (
    <section>
      <div className="flex items-center gap-2 mb-3">
        <h2 className="font-semibold text-gray-900">Fontes ao vivo</h2>
        <span className="text-xs bg-yellow-100 text-yellow-700 border border-yellow-200 px-2 py-0.5 rounded font-medium">
          Não verificado
        </span>
      </div>

      <div className="flex items-start gap-1.5 text-xs text-gray-500 mb-4 bg-gray-50 border border-gray-200 rounded-lg p-3">
        <AlertTriangle className="w-4 h-4 text-yellow-500 flex-shrink-0 mt-0.5" />
        <span>
          Resultados ao vivo buscados diretamente no YouTube e na imprensa. Não foram revisados
          editorialmente. Verifique a fonte antes de compartilhar.
        </span>
      </div>

      {hasYoutube && (
        <div className="mb-5">
          <div className="flex items-center gap-2 mb-3 text-sm font-medium text-gray-700">
            <PlayCircle className="w-4 h-4 text-red-600" />
            YouTube
          </div>
          <div className="flex flex-col gap-2">
            {result.youtube.map((r) => (
              <YouTubeResultCard key={r.videoId} result={r} />
            ))}
          </div>
        </div>
      )}

      {hasNews && (
        <div>
          <div className="flex items-center gap-2 mb-3 text-sm font-medium text-gray-700">
            <Newspaper className="w-4 h-4 text-blue-600" />
            Imprensa
          </div>
          <div className="flex flex-col gap-2">
            {result.news.map((item) => (
              <a
                key={item.url}
                href={item.url}
                target="_blank"
                rel="noopener noreferrer"
                className="p-3 border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors"
              >
                <p className="text-sm font-medium text-blue-700 hover:underline line-clamp-2">{item.title}</p>
                <p className="text-xs text-gray-500 mt-1">{item.outlet}</p>
                <p className="text-xs text-gray-600 mt-1 line-clamp-2">{item.snippet}</p>
              </a>
            ))}
          </div>
        </div>
      )}
    </section>
  )
}
