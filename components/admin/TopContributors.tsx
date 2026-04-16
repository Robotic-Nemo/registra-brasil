import { Award } from 'lucide-react'
import type { TopContributor } from '@/lib/supabase/queries/dashboard'

interface TopContributorsProps {
  contributors: TopContributor[]
}

export function TopContributors({ contributors }: TopContributorsProps) {
  if (contributors.length === 0) {
    return null
  }

  const maxCount = contributors[0]?.review_count ?? 1

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      <div className="flex items-center gap-2 mb-4">
        <Award className="w-4 h-4 text-amber-500" />
        <h3 className="text-sm font-semibold text-gray-700">Editores mais ativos</h3>
      </div>
      <ul className="space-y-3">
        {contributors.map((c, i) => {
          const widthPct = Math.max((c.review_count / maxCount) * 100, 8)
          return (
            <li key={c.reviewed_by} className="flex items-center gap-3">
              <span className="text-xs font-bold text-gray-400 w-5 text-right tabular-nums">
                {i + 1}.
              </span>
              <div className="flex-1 min-w-0">
                <div className="flex items-center justify-between mb-1">
                  <p className="text-sm font-medium text-gray-900 truncate">{c.reviewed_by}</p>
                  <span className="text-xs text-gray-500 tabular-nums ml-2">
                    {c.review_count} revisoes
                  </span>
                </div>
                <div className="h-1.5 bg-gray-100 rounded-full overflow-hidden">
                  <div
                    className="h-full bg-amber-400 rounded-full transition-all"
                    style={{ width: `${widthPct}%` }}
                  />
                </div>
              </div>
            </li>
          )
        })}
      </ul>
    </div>
  )
}
