interface StatEntry {
  slug: string
  label_pt: string
  color_hex: string
  count: number
}

interface PoliticianStatsProps {
  stats: StatEntry[]
}

export function PoliticianStats({ stats }: PoliticianStatsProps) {
  if (!stats.length) return null

  const max = stats[0].count

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      <h2 className="font-semibold text-gray-900 mb-4 text-sm">Declarações por categoria</h2>
      <div className="flex flex-col gap-3">
        {stats.map((s) => (
          <div key={s.slug} className="flex items-center gap-3">
            <span
              className="w-2.5 h-2.5 rounded-full flex-shrink-0"
              style={{ backgroundColor: s.color_hex }}
            />
            <span className="text-sm text-gray-700 w-40 truncate">{s.label_pt}</span>
            <div className="flex-1 bg-gray-100 rounded-full h-2">
              <div
                className="h-2 rounded-full transition-all"
                style={{
                  width: `${(s.count / max) * 100}%`,
                  backgroundColor: s.color_hex,
                }}
              />
            </div>
            <span className="text-sm font-medium text-gray-700 w-6 text-right">{s.count}</span>
          </div>
        ))}
      </div>
    </div>
  )
}
