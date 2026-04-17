// Pure render — server component, ships no JS.
import { textColorForBg } from '@/lib/utils/color'

interface CategoryData {
  slug: string
  label_pt: string
  color_hex: string
  count: number
}

interface Props {
  data: CategoryData[]
  className?: string
}

export function CategoryChart({ data, className = '' }: Props) {
  if (data.length === 0) return null

  const total = data.reduce((sum, d) => sum + d.count, 0)

  return (
    <div className={className}>
      {/* Stacked bar */}
      <div className="flex rounded-full overflow-hidden h-4 mb-4" role="img" aria-label="Distribuição por categoria">
        {data.map((d) => {
          const pct = (d.count / total) * 100
          if (pct < 1) return null
          return (
            <div
              key={d.slug}
              className="transition-all hover:opacity-80"
              style={{ width: `${pct}%`, backgroundColor: d.color_hex }}
              title={`${d.label_pt}: ${d.count} (${Math.round(pct)}%)`}
            />
          )
        })}
      </div>

      {/* Legend */}
      <div className="flex flex-wrap gap-3">
        {data.map((d) => {
          const pct = Math.round((d.count / total) * 100)
          return (
            <div key={d.slug} className="flex items-center gap-1.5 text-xs">
              <span
                className="w-2.5 h-2.5 rounded-full flex-shrink-0"
                style={{ backgroundColor: d.color_hex }}
              />
              <span className="text-gray-700">{d.label_pt}</span>
              <span className="text-gray-400 tabular-nums">{pct}%</span>
            </div>
          )
        })}
      </div>
    </div>
  )
}
