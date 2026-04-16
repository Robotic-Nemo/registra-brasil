'use client'

import { useState, useCallback, useRef, useEffect } from 'react'

interface CarouselProps {
  children: React.ReactNode[]
  autoPlay?: boolean
  interval?: number
  showDots?: boolean
  showArrows?: boolean
  className?: string
}

export function Carousel({
  children,
  autoPlay = false,
  interval = 5000,
  showDots = true,
  showArrows = true,
  className = '',
}: CarouselProps) {
  const [current, setCurrent] = useState(0)
  const total = children.length
  const timerRef = useRef<ReturnType<typeof setInterval>>(undefined)

  const next = useCallback(() => {
    setCurrent(prev => (prev + 1) % total)
  }, [total])

  const prev = useCallback(() => {
    setCurrent(prev => (prev - 1 + total) % total)
  }, [total])

  const goTo = useCallback((index: number) => {
    setCurrent(index)
  }, [])

  // Auto-play
  useEffect(() => {
    if (!autoPlay || total <= 1) return
    timerRef.current = setInterval(next, interval)
    return () => { if (timerRef.current) clearInterval(timerRef.current) }
  }, [autoPlay, interval, next, total])

  // Pause on hover
  const handleMouseEnter = () => {
    if (timerRef.current) clearInterval(timerRef.current)
  }

  const handleMouseLeave = () => {
    if (autoPlay && total > 1) {
      timerRef.current = setInterval(next, interval)
    }
  }

  if (total === 0) return null

  return (
    <div
      className={`relative overflow-hidden ${className}`}
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
      role="region"
      aria-roledescription="carrossel"
      aria-label={`Slide ${current + 1} de ${total}`}
    >
      <div
        className="flex transition-transform duration-300 ease-in-out"
        style={{ transform: `translateX(-${current * 100}%)` }}
      >
        {children.map((child, i) => (
          <div
            key={i}
            className="w-full flex-shrink-0"
            role="group"
            aria-roledescription="slide"
            aria-label={`Slide ${i + 1}`}
          >
            {child}
          </div>
        ))}
      </div>

      {showArrows && total > 1 && (
        <>
          <button
            onClick={prev}
            className="absolute left-2 top-1/2 -translate-y-1/2 w-8 h-8 rounded-full bg-white/80 shadow flex items-center justify-center text-zinc-600 hover:bg-white transition-colors"
            aria-label="Slide anterior"
          >
            ‹
          </button>
          <button
            onClick={next}
            className="absolute right-2 top-1/2 -translate-y-1/2 w-8 h-8 rounded-full bg-white/80 shadow flex items-center justify-center text-zinc-600 hover:bg-white transition-colors"
            aria-label="Próximo slide"
          >
            ›
          </button>
        </>
      )}

      {showDots && total > 1 && (
        <div className="flex items-center justify-center gap-1.5 mt-3">
          {children.map((_, i) => (
            <button
              key={i}
              onClick={() => goTo(i)}
              aria-label={`Ir para slide ${i + 1}`}
              aria-current={i === current ? 'true' : undefined}
              className={`w-2 h-2 rounded-full transition-colors ${
                i === current ? 'bg-blue-600' : 'bg-zinc-300 hover:bg-zinc-400'
              }`}
            />
          ))}
        </div>
      )}
    </div>
  )
}
