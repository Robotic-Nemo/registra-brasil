import type { SourceType } from '@/types/database'
import { ExternalLink, PlayCircle, FileText, Tv, Newspaper } from 'lucide-react'
import { buildWatchUrl, formatTimestamp } from '@/lib/utils/youtube-url'

interface SourceLinkProps {
  url: string
  type: SourceType
  videoId?: string | null
  timestampSec?: number | null
  isOfficial?: boolean
  label?: string
}

const ICONS: Partial<Record<SourceType, React.ComponentType<{ className?: string }>>> = {
  youtube_video: PlayCircle,
  youtube_live_archive: PlayCircle,
  camara_tv: Tv,
  senado_tv: Tv,
  transcript_pdf: FileText,
  news_article: Newspaper,
}

const LABELS: Partial<Record<SourceType, string>> = {
  youtube_video: 'YouTube',
  youtube_live_archive: 'YouTube (ao vivo)',
  camara_tv: 'TV Câmara',
  senado_tv: 'TV Senado',
  diario_oficial: 'Diário Oficial',
  transcript_pdf: 'Transcrição',
  news_article: 'Notícia',
  social_media_post: 'Redes sociais',
  other: 'Fonte',
}

export function SourceLink({ url, type, videoId, timestampSec, isOfficial, label }: SourceLinkProps) {
  const Icon = ICONS[type] ?? ExternalLink
  const displayLabel = label ?? LABELS[type] ?? 'Fonte'
  const href = videoId ? buildWatchUrl(videoId, timestampSec) : url

  return (
    <a
      href={href}
      target="_blank"
      rel="noopener noreferrer"
      className="inline-flex items-center gap-1.5 text-sm text-blue-700 hover:text-blue-900 hover:underline font-medium"
    >
      <Icon className="w-4 h-4 flex-shrink-0" />
      <span>
        {displayLabel}
        {timestampSec != null && (
          <span className="ml-1 text-blue-500 font-mono text-xs">
            {formatTimestamp(timestampSec)}
          </span>
        )}
      </span>
      {isOfficial && (
        <span className="text-xs bg-green-100 text-green-700 border border-green-200 px-1.5 py-0.5 rounded font-medium">
          Oficial
        </span>
      )}
      <ExternalLink className="w-3 h-3 text-gray-400" />
    </a>
  )
}
