'use client'

import { useState } from 'react'
import { ChevronLeft, ChevronRight } from 'lucide-react'

interface ContentCalendarProps {
  dateCounts: { date: string; count: number }[]
}

export function ContentCalendar({ dateCounts }: ContentCalendarProps) {
  const [viewDate, setViewDate] = useState(() => new Date())

  const year = viewDate.getFullYear()
  const month = viewDate.getMonth()

  const firstDay = new Date(year, month, 1)
  const lastDay = new Date(year, month + 1, 0)
  const startDayOfWeek = firstDay.getDay()
  const daysInMonth = lastDay.getDate()

  const countMap = new Map<string, number>()
  for (const entry of dateCounts) {
    countMap.set(entry.date, entry.count)
  }

  const maxCount = Math.max(...dateCounts.map((d) => d.count), 1)

  function prevMonth() {
    setViewDate(new Date(year, month - 1, 1))
  }

  function nextMonth() {
    setViewDate(new Date(year, month + 1, 1))
  }

  const weekdays = ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab']
  const monthLabel = firstDay.toLocaleDateString('pt-BR', { month: 'long', year: 'numeric' })

  const cells: (number | null)[] = []
  for (let i = 0; i < startDayOfWeek; i++) cells.push(null)
  for (let d = 1; d <= daysInMonth; d++) cells.push(d)

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      <div className="flex items-center justify-between mb-4">
        <h3 className="text-sm font-semibold text-gray-700">Calendario de declaracoes</h3>
        <div className="flex items-center gap-2">
          <button onClick={prevMonth} className="p-1 rounded hover:bg-gray-100 transition-colors" aria-label="Mes anterior">
            <ChevronLeft className="w-4 h-4 text-gray-500" />
          </button>
          <span className="text-sm font-medium text-gray-700 capitalize min-w-[140px] text-center">
            {monthLabel}
          </span>
          <button onClick={nextMonth} className="p-1 rounded hover:bg-gray-100 transition-colors" aria-label="Proximo mes">
            <ChevronRight className="w-4 h-4 text-gray-500" />
          </button>
        </div>
      </div>

      <div className="grid grid-cols-7 gap-1">
        {weekdays.map((wd) => (
          <div key={wd} className="text-center text-[10px] font-medium text-gray-400 pb-1">
            {wd}
          </div>
        ))}
        {cells.map((day, i) => {
          if (day === null) return <div key={`empty-${i}`} />
          const dateStr = `${year}-${String(month + 1).padStart(2, '0')}-${String(day).padStart(2, '0')}`
          const count = countMap.get(dateStr) ?? 0
          const intensity = count > 0 ? Math.max(0.15, count / maxCount) : 0

          return (
            <div
              key={dateStr}
              className="aspect-square flex flex-col items-center justify-center rounded text-xs relative"
              title={count > 0 ? `${dateStr}: ${count} declaracao(es)` : dateStr}
            >
              {count > 0 && (
                <div
                  className="absolute inset-0 rounded bg-blue-500"
                  style={{ opacity: intensity }}
                />
              )}
              <span className={`relative z-10 ${count > 0 ? 'font-semibold text-blue-900' : 'text-gray-500'}`}>
                {day}
              </span>
              {count > 0 && (
                <span className="relative z-10 text-[8px] text-blue-700 font-medium">{count}</span>
              )}
            </div>
          )
        })}
      </div>
    </div>
  )
}
