interface HeatMapData {
  date: string // YYYY-MM-DD
  count: number
}

interface HeatMapProps {
  data: HeatMapData[]
  weeks?: number
  className?: string
}

const LEVELS = [
  'bg-zinc-100',
  'bg-blue-100',
  'bg-blue-300',
  'bg-blue-500',
  'bg-blue-700',
]

const DAYS = ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb']

function getLevel(count: number, maxCount: number): number {
  if (count === 0) return 0
  const ratio = count / maxCount
  if (ratio <= 0.25) return 1
  if (ratio <= 0.5) return 2
  if (ratio <= 0.75) return 3
  return 4
}

export function HeatMap({ data, weeks = 26, className = '' }: HeatMapProps) {
  const dataMap = new Map(data.map(d => [d.date, d.count]))
  const maxCount = Math.max(...data.map(d => d.count), 1)

  // Generate dates for the grid (weeks * 7 days, ending today)
  const today = new Date()
  const totalDays = weeks * 7
  const startDate = new Date(today)
  startDate.setDate(startDate.getDate() - totalDays + 1)
  // Align to Sunday
  startDate.setDate(startDate.getDate() - startDate.getDay())

  const grid: { date: string; count: number; dayOfWeek: number }[][] = []
  let currentWeek: { date: string; count: number; dayOfWeek: number }[] = []

  const cursor = new Date(startDate)
  while (cursor <= today) {
    const dateStr = cursor.toISOString().slice(0, 10)
    currentWeek.push({
      date: dateStr,
      count: dataMap.get(dateStr) ?? 0,
      dayOfWeek: cursor.getDay(),
    })

    if (cursor.getDay() === 6 || cursor.getTime() === today.getTime()) {
      grid.push(currentWeek)
      currentWeek = []
    }

    cursor.setDate(cursor.getDate() + 1)
  }

  if (currentWeek.length > 0) grid.push(currentWeek)

  const totalCount = data.reduce((sum, d) => sum + d.count, 0)

  return (
    <div className={className}>
      <div className="flex gap-1">
        <div className="flex flex-col gap-1 text-[10px] text-zinc-400 mr-1">
          {DAYS.filter((_, i) => i % 2 === 1).map(day => (
            <div key={day} className="h-3 flex items-center">{day}</div>
          ))}
        </div>
        <div className="flex gap-[3px]">
          {grid.map((week, wi) => (
            <div key={wi} className="flex flex-col gap-[3px]">
              {week.map(day => (
                <div
                  key={day.date}
                  className={`w-3 h-3 rounded-sm ${LEVELS[getLevel(day.count, maxCount)]}`}
                  title={`${day.date}: ${day.count} declarações`}
                />
              ))}
            </div>
          ))}
        </div>
      </div>
      <div className="flex items-center justify-between mt-2 text-[10px] text-zinc-400">
        <span>{totalCount} declarações no período</span>
        <div className="flex items-center gap-1">
          <span>Menos</span>
          {LEVELS.map((bg, i) => (
            <div key={i} className={`w-3 h-3 rounded-sm ${bg}`} />
          ))}
          <span>Mais</span>
        </div>
      </div>
    </div>
  )
}
