import type { YouTubeResult } from '@/types/search'
import { ExternalLink, BadgeCheck } from 'lucide-react'
import { formatDateShort } from '@/lib/utils/date'

interface YouTubeResultCardProps {
  result: YouTubeResult
}

export function YouTubeResultCard({ result }: YouTubeResultCardProps) {
  return (
    <a
      href={result.watchUrl}
      target="_blank"
      rel="noopener noreferrer"
      className="flex gap-3 p-3 border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors group"
    >
      <img
        src={result.thumbnailUrl}
        alt={result.title}
        className="w-32 h-20 object-cover rounded flex-shrink-0"
      />
      <div className="flex flex-col gap-1 min-w-0">
        <p className="text-sm font-medium text-gray-900 line-clamp-2 group-hover:text-blue-700">
          {result.title}
        </p>
        <div className="flex items-center gap-1.5 text-xs text-gray-500">
          <span>{result.channelTitle}</span>
          {result.isOfficialChannel && (
            <span className="inline-flex items-center gap-0.5 text-green-700 bg-green-50 border border-green-200 px-1.5 py-0.5 rounded font-medium">
              <BadgeCheck className="w-3 h-3" />
              Canal oficial
            </span>
          )}
        </div>
        <p className="text-xs text-gray-400">
          {formatDateShort(result.publishedAt)}
        </p>
        <p className="text-xs text-gray-600 line-clamp-2">{result.description}</p>
      </div>
      <ExternalLink className="w-4 h-4 text-gray-400 flex-shrink-0 mt-0.5" />
    </a>
  )
}
