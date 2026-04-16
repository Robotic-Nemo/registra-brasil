import type { SecondarySource } from '@/types/database'
import { SOURCE_TYPE_LABELS } from '@/lib/constants/source-types'

interface StatementSourcesProps {
  primaryUrl: string
  primaryType: string
  secondarySources: SecondarySource[]
}

export function StatementSources({ primaryUrl, primaryType, secondarySources }: StatementSourcesProps) {
  const getDomain = (url: string) => {
    try { return new URL(url).hostname.replace('www.', '') } catch { return url }
  }

  return (
    <div className="space-y-3">
      <h3 className="text-sm font-semibold text-zinc-700">Fontes</h3>

      {/* Primary source */}
      <div className="flex items-start gap-2">
        <span className="px-1.5 py-0.5 bg-blue-100 text-blue-700 text-[10px] font-semibold rounded uppercase flex-shrink-0">
          Principal
        </span>
        <div className="min-w-0">
          <a
            href={primaryUrl}
            target="_blank"
            rel="noopener noreferrer nofollow"
            className="text-sm text-blue-600 hover:underline truncate block"
            title={primaryUrl}
          >
            {getDomain(primaryUrl)}
          </a>
          <span className="text-xs text-zinc-400">
            {SOURCE_TYPE_LABELS[primaryType as keyof typeof SOURCE_TYPE_LABELS] ?? primaryType}
          </span>
        </div>
      </div>

      {/* Secondary sources */}
      {secondarySources.length > 0 && (
        <div className="space-y-2">
          {secondarySources.map((source, i) => (
            <div key={i} className="flex items-start gap-2">
              <span className="px-1.5 py-0.5 bg-zinc-100 text-zinc-500 text-[10px] font-semibold rounded uppercase flex-shrink-0">
                {i + 2}ª
              </span>
              <div className="min-w-0">
                <a
                  href={source.url}
                  target="_blank"
                  rel="noopener noreferrer nofollow"
                  className="text-sm text-blue-600 hover:underline block"
                  title={source.title || source.url}
                >
                  {source.title || getDomain(source.url)}
                </a>
                <div className="flex items-center gap-2 text-xs text-zinc-400">
                  <span>
                    {SOURCE_TYPE_LABELS[source.type as keyof typeof SOURCE_TYPE_LABELS] ?? source.type}
                  </span>
                  {source.outlet && <span>· {source.outlet}</span>}
                  {source.date && <span>· {source.date}</span>}
                </div>
              </div>
            </div>
          ))}
        </div>
      )}

      {secondarySources.length === 0 && (
        <p className="text-xs text-zinc-400 italic">Nenhuma fonte secundária registrada.</p>
      )}
    </div>
  )
}
