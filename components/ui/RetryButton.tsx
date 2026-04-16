'use client'

import { useState, useEffect, useCallback } from 'react'
import { RotateCcw } from 'lucide-react'

interface Props {
  onRetry: () => void
  /** Countdown in seconds before the button becomes clickable. 0 = immediate. */
  cooldown?: number
  label?: string
  className?: string
}

/**
 * Button with optional countdown timer for retry actions.
 */
export function RetryButton({
  onRetry,
  cooldown = 0,
  label = 'Tentar novamente',
  className = '',
}: Props) {
  const [remaining, setRemaining] = useState(cooldown)

  useEffect(() => {
    setRemaining(cooldown)
  }, [cooldown])

  useEffect(() => {
    if (remaining <= 0) return
    const timer = setInterval(() => {
      setRemaining((prev) => Math.max(0, prev - 1))
    }, 1000)
    return () => clearInterval(timer)
  }, [remaining])

  const handleClick = useCallback(() => {
    if (remaining > 0) return
    onRetry()
    setRemaining(cooldown)
  }, [remaining, onRetry, cooldown])

  const disabled = remaining > 0

  return (
    <button
      onClick={handleClick}
      disabled={disabled}
      aria-disabled={disabled}
      className={`inline-flex items-center gap-1.5 px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
        disabled
          ? 'bg-gray-100 text-gray-400 cursor-not-allowed'
          : 'bg-blue-600 text-white hover:bg-blue-700'
      } ${className}`}
    >
      <RotateCcw className={`w-4 h-4 ${disabled ? '' : 'group-hover:rotate-180 transition-transform'}`} />
      {disabled ? `Aguarde ${remaining}s` : label}
    </button>
  )
}
