'use client'

import { useState } from 'react'
import { Calendar, ChevronDown } from 'lucide-react'

interface DatePreset {
  label: string
  days: number
}

const PRESETS: DatePreset[] = [
  { label: '7 dias', days: 7 },
  { label: '30 dias', days: 30 },
  { label: '3 meses', days: 90 },
  { label: '6 meses', days: 180 },
  { label: '1 ano', days: 365 },
]

interface DateRangePickerProps {
  from: string | null
  to: string | null
  onChange: (from: string | null, to: string | null) => void
}

function daysAgoISO(days: number): string {
  return new Date(Date.now() - days * 86_400_000).toISOString().slice(0, 10)
}

export function DateRangePicker({ from, to, onChange }: DateRangePickerProps) {
  const [expanded, setExpanded] = useState(false)

  const activePreset = PRESETS.find((p) => from === daysAgoISO(p.days) && !to)

  return (
    <div className="flex flex-col gap-2">
      <button
        type="button"
        onClick={() => setExpanded(!expanded)}
        className="flex items-center justify-between gap-2 text-sm border border-gray-300 rounded-lg px-3 py-2 hover:bg-gray-50 text-left"
        aria-expanded={expanded}
      >
        <span className="flex items-center gap-2 text-gray-700">
          <Calendar className="w-4 h-4 text-gray-400" />
          {activePreset
            ? activePreset.label
            : from || to
              ? `${from ?? '...'} — ${to ?? '...'}`
              : 'Período'}
        </span>
        <ChevronDown className={`w-4 h-4 text-gray-400 transition-transform ${expanded ? 'rotate-180' : ''}`} />
      </button>

      {expanded && (
        <div className="flex flex-col gap-2 p-3 border border-gray-200 rounded-lg bg-gray-50">
          <div className="flex flex-wrap gap-1.5">
            {PRESETS.map((preset) => {
              const isActive = activePreset === preset
              return (
                <button
                  key={preset.days}
                  type="button"
                  onClick={() => {
                    if (isActive) {
                      onChange(null, null)
                    } else {
                      onChange(daysAgoISO(preset.days), null)
                    }
                  }}
                  className={`text-xs px-2.5 py-1 rounded-full border transition-colors ${
                    isActive
                      ? 'bg-blue-100 border-blue-300 text-blue-700'
                      : 'border-gray-200 bg-white text-gray-600 hover:bg-gray-100'
                  }`}
                >
                  {preset.label}
                </button>
              )
            })}
          </div>

          <div className="flex items-center gap-2">
            <input
              type="date"
              value={from ?? ''}
              onChange={(e) => onChange(e.target.value || null, to)}
              className="flex-1 text-sm border border-gray-300 rounded-lg px-2.5 py-1.5 focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
              aria-label="Data inicial"
            />
            <span className="text-xs text-gray-400">a</span>
            <input
              type="date"
              value={to ?? ''}
              onChange={(e) => onChange(from, e.target.value || null)}
              className="flex-1 text-sm border border-gray-300 rounded-lg px-2.5 py-1.5 focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
              aria-label="Data final"
            />
          </div>

          {(from || to) && (
            <button
              type="button"
              onClick={() => onChange(null, null)}
              className="text-xs text-red-600 hover:text-red-800 self-start"
            >
              Limpar datas
            </button>
          )}
        </div>
      )}
    </div>
  )
}
