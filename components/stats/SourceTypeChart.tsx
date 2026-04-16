import { SOURCE_TYPE_LABELS } from '@/lib/constants/source-types'
import type { SourceType } from '@/types/database'

interface SourceData {
  type: string
  count: number
}

interface Props {
  data: SourceData[]
  className?: string
}

export function SourceTypeChart({ data, className = '' }: Props) {
  if (data.length === 0) return null

  const total = data.reduce((sum, d) => sum + d.count, 0)
  const maxCount = data[0]?.count ?? 1

  return (
    <div className={className}>
      <div className="flex flex-col gap-2">
        {data.map((d) => {
          const pct = (d.count / maxCount) * 100
          const label = SOURCE_TYPE_LABELS[d.type as SourceType] ?? d.type
          const share = Math.round((d.count / total) * 100)
          return (
            <div key={d.type} className="flex items-center gap-3">
              <span className="text-xs text-gray-600 w-32 text-right flex-shrink-0 truncate" title={label}>
                {label}
              </span>
              <div className="flex-1 bg-gray-100 rounded-full h-3.5 overflow-hidden">
                <div
                  className="h-full bg-blue-500 rounded-full transition-all"
                  style={{ width: `${Math.max(pct, 2)}%` }}
                />
              </div>
              <span className="text-xs text-gray-400 tabular-nums w-10 text-right">{share}%</span>
            </div>
          )
        })}
      </div>
    </div>
  )
}
