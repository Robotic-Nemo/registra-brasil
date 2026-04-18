'use client'

import { useState } from 'react'
import { Calendar } from 'lucide-react'

interface DateRangeSelectorProps {
  startDate: string
  endDate: string
  onChangeStart: (date: string) => void
  onChangeEnd: (date: string) => void
}

const PRESETS = [
  { label: '7 dias', days: 7 },
  { label: '30 dias', days: 30 },
  { label: '90 dias', days: 90 },
  { label: '1 ano', days: 365 },
  { label: 'Tudo', days: 0 },
]

export function DateRangeSelector({
  startDate,
  endDate,
  onChangeStart,
  onChangeEnd,
}: DateRangeSelectorProps) {
  const [activePreset, setActivePreset] = useState<number | null>(null)

  function applyPreset(days: number) {
    setActivePreset(days)
    if (days === 0) {
      onChangeStart('')
      onChangeEnd('')
      return
    }
    const end = new Date()
    const start = new Date()
    start.setDate(end.getDate() - days)
    onChangeStart(start.toISOString().slice(0, 10))
    onChangeEnd(end.toISOString().slice(0, 10))
  }

  return (
    <div className="flex flex-wrap items-center gap-3">
      {/* Preset buttons */}
      <div className="flex gap-1">
        {PRESETS.map((preset) => (
          <button
            key={preset.days}
            onClick={() => applyPreset(preset.days)}
            className={`px-2.5 py-1 text-xs font-medium rounded-lg transition-colors ${
              activePreset === preset.days
                ? 'bg-blue-600 text-white'
                : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
            }`}
          >
            {preset.label}
          </button>
        ))}
      </div>

      {/* Manual date inputs */}
      <div className="flex items-center gap-2">
        <Calendar className="w-4 h-4 text-gray-400" />
        <input
          type="date"
          value={startDate}
          onChange={(e) => { onChangeStart(e.target.value); setActivePreset(null) }}
          className="px-2 py-1 text-xs border border-gray-200 rounded-lg focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
        />
        <span className="text-xs text-gray-400">ate</span>
        <input
          type="date"
          value={endDate}
          onChange={(e) => { onChangeEnd(e.target.value); setActivePreset(null) }}
          className="px-2 py-1 text-xs border border-gray-200 rounded-lg focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
        />
      </div>
    </div>
  )
}
