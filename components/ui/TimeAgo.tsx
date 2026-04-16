'use client'

import { useMemo, useState, useEffect } from 'react'

const UNITS: [Intl.RelativeTimeFormatUnit, number][] = [
  ['year', 365 * 24 * 60 * 60 * 1000],
  ['month', 30 * 24 * 60 * 60 * 1000],
  ['week', 7 * 24 * 60 * 60 * 1000],
  ['day', 24 * 60 * 60 * 1000],
  ['hour', 60 * 60 * 1000],
  ['minute', 60 * 1000],
]

function timeAgo(date: Date): string {
  const diff = date.getTime() - Date.now()
  const rtf = new Intl.RelativeTimeFormat('pt-BR', { numeric: 'auto' })

  for (const [unit, ms] of UNITS) {
    const value = Math.round(diff / ms)
    if (Math.abs(value) >= 1) return rtf.format(value, unit)
  }
  return 'agora'
}

interface Props {
  date: string
  className?: string
  /** Auto-refresh interval in ms. Set to 0 to disable. Defaults to 60000 (1 min). */
  refreshInterval?: number
}

export function TimeAgo({ date, className, refreshInterval = 60_000 }: Props) {
  const parsed = useMemo(() => new Date(date), [date])
  const [, setTick] = useState(0)

  useEffect(() => {
    if (refreshInterval <= 0) return
    const id = setInterval(() => setTick((t) => t + 1), refreshInterval)
    return () => clearInterval(id)
  }, [refreshInterval])

  const label = timeAgo(parsed)
  const iso = parsed.toISOString()

  return (
    <time dateTime={iso} title={parsed.toLocaleDateString('pt-BR')} className={className}>
      {label}
    </time>
  )
}
