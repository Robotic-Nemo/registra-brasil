import type { SecondarySource } from '@/types/database'

interface Props {
  primarySourceUrl: string
  primarySourceType: string
  secondarySources: SecondarySource[] | null
  createdAt: string
}

const SOURCE_TYPE_LABELS: Record<string, string> = {
  youtube_video: 'Video do YouTube',
  youtube_live_archive: 'Arquivo de live',
  camara_tv: 'TV Camara',
  senado_tv: 'TV Senado',
  diario_oficial: 'Diario Oficial',
  transcript_pdf: 'Transcricao PDF',
  news_article: 'Artigo de noticia',
  social_media_post: 'Rede social',
  other: 'Outra fonte',
}

export function SourceTimeline({ primarySourceUrl, primarySourceType, secondarySources, createdAt }: Props) {
  const sources = [
    {
      type: primarySourceType,
      url: primarySourceUrl,
      title: 'Fonte primaria',
      date: createdAt,
      isPrimary: true,
    },
    ...((secondarySources ?? []).map((s, i) => ({
      type: s.type,
      url: s.url,
      title: s.title || `Fonte secundaria ${i + 1}`,
      date: s.date ?? createdAt,
      isPrimary: false,
    }))),
  ]

  return (
    <div className="relative">
      <div className="absolute left-3 top-0 bottom-0 w-0.5 bg-gray-200" />

      <div className="space-y-4">
        {sources.map((source, i) => (
          <div key={i} className="relative pl-8">
            <div
              className={`absolute left-1.5 top-3 w-3 h-3 rounded-full border-2 border-white ${
                source.isPrimary ? 'bg-blue-500' : 'bg-gray-400'
              }`}
            />
            <div className="bg-white border border-gray-200 rounded-lg p-3">
              <div className="flex items-center justify-between gap-2 mb-1">
                <span className={`text-xs font-medium ${source.isPrimary ? 'text-blue-700' : 'text-gray-500'}`}>
                  {source.isPrimary ? 'Fonte primaria' : 'Fonte secundaria'}
                </span>
                <span className="text-[10px] text-gray-400 tabular-nums">
                  {source.date?.slice(0, 10)}
                </span>
              </div>
              <a
                href={source.url}
                target="_blank"
                rel="noopener noreferrer"
                className="text-sm text-blue-600 hover:underline break-all"
              >
                {source.title}
              </a>
              <div className="text-[10px] text-gray-400 mt-1">
                {SOURCE_TYPE_LABELS[source.type] ?? source.type}
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
