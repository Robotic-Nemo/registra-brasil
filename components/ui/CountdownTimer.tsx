'use client'

import { useState, useEffect } from 'react'

interface CountdownTimerProps {
  targetDate: Date | string
  onComplete?: () => void
  className?: string
}

interface TimeLeft {
  days: number
  hours: number
  minutes: number
  seconds: number
}

function getTimeLeft(target: Date): TimeLeft {
  const diff = target.getTime() - Date.now()
  if (diff <= 0) return { days: 0, hours: 0, minutes: 0, seconds: 0 }

  return {
    days: Math.floor(diff / (1000 * 60 * 60 * 24)),
    hours: Math.floor((diff / (1000 * 60 * 60)) % 24),
    minutes: Math.floor((diff / (1000 * 60)) % 60),
    seconds: Math.floor((diff / 1000) % 60),
  }
}

export function CountdownTimer({ targetDate, onComplete, className = '' }: CountdownTimerProps) {
  const target = typeof targetDate === 'string' ? new Date(targetDate) : targetDate
  const [timeLeft, setTimeLeft] = useState<TimeLeft>(getTimeLeft(target))
  const [completed, setCompleted] = useState(false)

  useEffect(() => {
    const interval = setInterval(() => {
      const tl = getTimeLeft(target)
      setTimeLeft(tl)

      if (tl.days === 0 && tl.hours === 0 && tl.minutes === 0 && tl.seconds === 0) {
        setCompleted(true)
        onComplete?.()
        clearInterval(interval)
      }
    }, 1000)

    return () => clearInterval(interval)
  }, [target, onComplete])

  if (completed) {
    return <span className={`text-sm font-medium text-green-600 ${className}`}>Encerrado</span>
  }

  const units = [
    { value: timeLeft.days, label: 'dias' },
    { value: timeLeft.hours, label: 'h' },
    { value: timeLeft.minutes, label: 'min' },
    { value: timeLeft.seconds, label: 's' },
  ]

  return (
    <div className={`flex items-center gap-2 ${className}`} aria-label={`Faltam ${timeLeft.days} dias, ${timeLeft.hours} horas, ${timeLeft.minutes} minutos`}>
      {units.map(({ value, label }) => (
        <div key={label} className="text-center">
          <span className="text-lg font-bold tabular-nums text-zinc-900">{String(value).padStart(2, '0')}</span>
          <span className="text-[10px] text-zinc-500 block">{label}</span>
        </div>
      ))}
    </div>
  )
}
