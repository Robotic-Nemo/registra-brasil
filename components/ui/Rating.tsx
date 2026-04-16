'use client'

import { useState } from 'react'

interface RatingProps {
  value: number
  max?: number
  onChange?: (value: number) => void
  readOnly?: boolean
  size?: 'sm' | 'md' | 'lg'
  className?: string
}

const SIZES = {
  sm: 'text-base',
  md: 'text-xl',
  lg: 'text-2xl',
}

export function Rating({
  value,
  max = 5,
  onChange,
  readOnly = false,
  size = 'md',
  className = '',
}: RatingProps) {
  const [hover, setHover] = useState(0)

  return (
    <div
      className={`inline-flex items-center gap-0.5 ${className}`}
      role={readOnly ? 'img' : 'radiogroup'}
      aria-label={readOnly ? `Avaliação: ${value} de ${max}` : 'Selecionar avaliação'}
    >
      {Array.from({ length: max }, (_, i) => {
        const starValue = i + 1
        const isFilled = starValue <= (hover || value)

        return (
          <button
            key={i}
            type="button"
            disabled={readOnly}
            className={`${SIZES[size]} transition-colors ${
              readOnly ? 'cursor-default' : 'cursor-pointer hover:scale-110'
            } ${isFilled ? 'text-amber-400' : 'text-zinc-300'}`}
            onClick={() => onChange?.(starValue)}
            onMouseEnter={() => !readOnly && setHover(starValue)}
            onMouseLeave={() => setHover(0)}
            aria-label={`${starValue} estrela${starValue > 1 ? 's' : ''}`}
          >
            ★
          </button>
        )
      })}
    </div>
  )
}
