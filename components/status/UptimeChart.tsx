/**
 * Uptime visualization showing 30-day uptime history.
 * Static representation since real monitoring data would come from an API.
 */

// Generate 30 days of sample uptime data
const days = Array.from({ length: 30 }, (_, i) => ({
  date: new Date(Date.now() - (29 - i) * 86400000),
  uptime: i === 12 ? 99.2 : i === 22 ? 99.8 : 100,
}))

function getColor(uptime: number): string {
  if (uptime >= 99.9) return 'bg-green-500'
  if (uptime >= 99.0) return 'bg-yellow-500'
  return 'bg-red-500'
}

export function UptimeChart() {
  const avgUptime = (days.reduce((sum, d) => sum + d.uptime, 0) / days.length).toFixed(2)

  return (
    <div>
      <div className="flex items-center justify-between mb-2">
        <span className="text-sm text-gray-500 dark:text-gray-400">30 dias</span>
        <span className="text-sm font-medium text-green-600 dark:text-green-400">{avgUptime}% disponibilidade</span>
      </div>
      <div className="flex gap-0.5" role="img" aria-label={`Disponibilidade nos ultimos 30 dias: ${avgUptime}%`}>
        {days.map((day, i) => (
          <div
            key={i}
            className={`flex-1 h-8 rounded-sm ${getColor(day.uptime)} transition-colors`}
            title={`${day.date.toLocaleDateString('pt-BR')}: ${day.uptime}%`}
          />
        ))}
      </div>
      <div className="flex justify-between mt-1">
        <span className="text-xs text-gray-400">30 dias atras</span>
        <span className="text-xs text-gray-400">Hoje</span>
      </div>
    </div>
  )
}
