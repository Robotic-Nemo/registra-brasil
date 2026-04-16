'use client'

import type { Category } from '@/types/database'

interface CategoryCount {
  category: Pick<Category, 'label_pt' | 'color_hex' | 'slug'>
  count: number
}

interface Props {
  data: CategoryCount[]
  className?: string
}

export function PoliticianCategoryBreakdown({ data, className = '' }: Props) {
  if (data.length === 0) return null

  const total = data.reduce((sum, d) => sum + d.count, 0)
  const sorted = [...data].sort((a, b) => b.count - a.count)
  const maxCount = sorted[0]?.count ?? 1

  return (
    <div className={className}>
      <h3 className="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-3">
        Categorias
      </h3>

      {/* Bar breakdown */}
      <div className="flex rounded-full h-3 overflow-hidden mb-4" role="img" aria-label="Distribuicao por categoria">
        {sorted.map((d) => {
          const pct = (d.count / total) * 100
          return (
            <div
              key={d.category.slug}
              className="transition-all"
              style={{
                width: `${Math.max(pct, 2)}%`,
                backgroundColor: d.category.color_hex,
              }}
              title={`${d.category.label_pt}: ${d.count} (${pct.toFixed(0)}%)`}
            />
          )
        })}
      </div>

      {/* Legend with horizontal bars */}
      <div className="flex flex-col gap-2">
        {sorted.map((d) => {
          const pct = (d.count / total) * 100
          const barPct = (d.count / maxCount) * 100
          return (
            <div key={d.category.slug} className="flex items-center gap-2 text-sm">
              <span
                className="w-2.5 h-2.5 rounded-full flex-shrink-0"
                style={{ backgroundColor: d.category.color_hex }}
              />
              <span className="text-gray-700 min-w-[100px] truncate">{d.category.label_pt}</span>
              <div className="flex-1 h-1.5 bg-gray-100 rounded-full overflow-hidden">
                <div
                  className="h-full rounded-full transition-all"
                  style={{
                    width: `${barPct}%`,
                    backgroundColor: d.category.color_hex,
                  }}
                />
              </div>
              <span className="text-xs text-gray-400 tabular-nums w-12 text-right">
                {d.count} ({pct.toFixed(0)}%)
              </span>
            </div>
          )
        })}
      </div>
    </div>
  )
}
