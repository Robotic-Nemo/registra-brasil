import type { PoliticianCompareData } from '@/lib/supabase/queries/compare'
import type { CategoryComparison } from '@/lib/utils/compare'

interface Props {
  a: PoliticianCompareData
  b: PoliticianCompareData
  categories: CategoryComparison[]
  maxCategories?: number
}

/**
 * Radar-style comparison using horizontal bars (CSS-only, no chart library).
 */
export function CompareChart({ a, b, categories, maxCategories = 8 }: Props) {
  const displayed = categories.slice(0, maxCategories)
  const maxValue = Math.max(
    ...displayed.flatMap((c) => [c.countA, c.countB]),
    1
  )

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      <div className="flex items-center justify-between mb-4">
        <h3 className="text-sm font-semibold text-gray-700">Comparacao por categoria</h3>
        <div className="flex items-center gap-4">
          <div className="flex items-center gap-1.5">
            <div className="w-3 h-3 rounded-full bg-blue-500" />
            <span className="text-xs text-gray-600">{a.name}</span>
          </div>
          <div className="flex items-center gap-1.5">
            <div className="w-3 h-3 rounded-full bg-red-500" />
            <span className="text-xs text-gray-600">{b.name}</span>
          </div>
        </div>
      </div>

      <div className="space-y-3">
        {displayed.map((cat) => (
          <div key={cat.slug}>
            <div className="text-xs text-gray-600 mb-1">{cat.label}</div>
            <div className="space-y-1">
              <div className="flex items-center gap-2">
                <div className="flex-1 bg-gray-100 rounded-full h-4 overflow-hidden">
                  <div
                    className="h-full bg-blue-500 rounded-full transition-all"
                    style={{ width: `${(cat.countA / maxValue) * 100}%` }}
                  />
                </div>
                <span className="text-xs text-gray-500 tabular-nums w-8 text-right">{cat.countA}</span>
              </div>
              <div className="flex items-center gap-2">
                <div className="flex-1 bg-gray-100 rounded-full h-4 overflow-hidden">
                  <div
                    className="h-full bg-red-500 rounded-full transition-all"
                    style={{ width: `${(cat.countB / maxValue) * 100}%` }}
                  />
                </div>
                <span className="text-xs text-gray-500 tabular-nums w-8 text-right">{cat.countB}</span>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
