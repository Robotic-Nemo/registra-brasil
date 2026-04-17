// Pure render — server component, ships no JS.
import { getPartyColor } from '@/lib/constants/party-colors'

interface PartyData {
  party: string
  count: number
}

interface Props {
  data: PartyData[]
  maxItems?: number
  className?: string
}

export function PartyChart({ data, maxItems = 10, className = '' }: Props) {
  if (data.length === 0) return null

  const sorted = [...data].sort((a, b) => b.count - a.count).slice(0, maxItems)
  const maxCount = sorted[0]?.count ?? 1

  return (
    <div className={className}>
      <div className="flex flex-col gap-2">
        {sorted.map((d) => {
          const pct = (d.count / maxCount) * 100
          const color = getPartyColor(d.party)
          return (
            <div key={d.party} className="flex items-center gap-2">
              <span className="text-xs text-gray-700 font-mono w-12 text-right flex-shrink-0">
                {d.party}
              </span>
              <div className="flex-1 bg-gray-100 rounded-full h-4 overflow-hidden">
                <div
                  className="h-full rounded-full transition-all"
                  style={{ width: `${Math.max(pct, 2)}%`, backgroundColor: color }}
                />
              </div>
              <span className="text-xs text-gray-500 tabular-nums w-8 text-right">{d.count}</span>
            </div>
          )
        })}
      </div>
    </div>
  )
}
