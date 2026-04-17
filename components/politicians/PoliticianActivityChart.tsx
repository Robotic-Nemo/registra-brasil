// Pure render — no client interactivity needed. Ships zero JS.
interface Props {
  data: { month: string; count: number }[]
  className?: string
}

const MONTH_LABELS: Record<string, string> = {
  '01': 'Jan', '02': 'Fev', '03': 'Mar', '04': 'Abr',
  '05': 'Mai', '06': 'Jun', '07': 'Jul', '08': 'Ago',
  '09': 'Set', '10': 'Out', '11': 'Nov', '12': 'Dez',
}

export function PoliticianActivityChart({ data, className = '' }: Props) {
  if (data.length === 0) return null

  const max = Math.max(...data.map((d) => d.count), 1)

  return (
    <div className={className}>
      <h3 className="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-3">
        Atividade recente
      </h3>
      <div className="flex items-end gap-1 h-20" role="img" aria-label={`Atividade por mês: ${data.map(d => `${d.month}: ${d.count}`).join(', ')}`}>
        {data.map((d) => {
          const pct = (d.count / max) * 100
          const monthKey = d.month.slice(5, 7)
          const label = MONTH_LABELS[monthKey] ?? monthKey
          return (
            <div key={d.month} className="flex-1 flex flex-col items-center gap-1">
              <div
                className="w-full bg-blue-500 rounded-t hover:bg-blue-600 transition-colors"
                style={{ height: `${Math.max(pct, 4)}%` }}
                title={`${label}: ${d.count} declaração${d.count !== 1 ? 'ões' : ''}`}
              />
              <span className="text-[10px] text-gray-400">{label}</span>
            </div>
          )
        })}
      </div>
    </div>
  )
}
