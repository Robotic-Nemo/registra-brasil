interface DataPoint {
  month: string // YYYY-MM
  count: number
}

interface Props {
  data: DataPoint[]
}

export function MonthlyChart({ data }: Props) {
  if (data.length === 0) return null

  const maxCount = Math.max(...data.map((d) => d.count), 1)

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      <h3 className="text-sm font-semibold text-gray-700 mb-4">Declarações por mês</h3>
      <div className="flex items-end gap-1 h-24">
        {data.map((d) => {
          const height = Math.max((d.count / maxCount) * 100, 4)
          const [year, month] = d.month.split('-')
          const label = `${month}/${year?.slice(2)}`
          return (
            <div key={d.month} className="flex-1 flex flex-col items-center gap-1" title={`${label}: ${d.count}`}>
              <div
                className="w-full bg-blue-500 rounded-t transition-all hover:bg-blue-600"
                style={{ height: `${height}%` }}
              />
              {data.length <= 12 && (
                <span className="text-[10px] text-gray-400 tabular-nums">{label}</span>
              )}
            </div>
          )
        })}
      </div>
    </div>
  )
}
