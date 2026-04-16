interface StatEntry {
  slug: string
  label_pt: string
  color_hex: string
  count: number
}

interface PoliticianStatsProps {
  stats: StatEntry[]
  totalVerified?: number
}

export function PoliticianStats({ stats, totalVerified }: PoliticianStatsProps) {
  if (!stats.length) return null

  const max = stats[0].count
  const total = stats.reduce((sum, s) => sum + s.count, 0)
  const verifiedCount = totalVerified ?? total

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      <div className="flex items-center justify-between mb-4">
        <h2 className="font-semibold text-gray-900 text-sm">Declarações por categoria</h2>
        <div className="flex items-center gap-2">
          <span className="text-xs text-gray-400 tabular-nums">{total} categoria{total !== 1 ? 's' : ''}</span>
          <span className="text-xs bg-green-50 text-green-700 border border-green-200 px-1.5 py-0.5 rounded tabular-nums font-medium">
            {verifiedCount} verificada{verifiedCount !== 1 ? 's' : ''}
          </span>
        </div>
      </div>
      <div className="flex flex-col gap-3" role="list" aria-label="Categorias de declarações">
        {stats.map((s) => {
          const pct = max > 0 ? Math.round((s.count / max) * 100) : 0
          return (
            <div key={s.slug} className="flex items-center gap-3" role="listitem">
              <span
                className="w-2.5 h-2.5 rounded-full flex-shrink-0"
                style={{ backgroundColor: s.color_hex || '#6b7280' }}
                aria-hidden="true"
              />
              <span className="text-sm text-gray-700 w-40 truncate">{s.label_pt}</span>
              <div className="flex-1 bg-gray-100 rounded-full h-2" role="progressbar" aria-valuenow={pct} aria-valuemin={0} aria-valuemax={100} aria-label={`${s.label_pt}: ${s.count}`}>
                <div
                  className="h-2 rounded-full transition-all duration-500"
                  style={{
                    width: `${pct}%`,
                    backgroundColor: s.color_hex || '#6b7280',
                  }}
                />
              </div>
              <span className="text-sm font-medium text-gray-700 w-6 text-right tabular-nums">{s.count}</span>
            </div>
          )
        })}
      </div>
    </div>
  )
}
