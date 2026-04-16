'use client'

import { useReadingProgress } from '@/lib/hooks/useReadingProgress'

interface ReadingProgressBarProps {
  className?: string
}

export function ReadingProgressBar({ className = '' }: ReadingProgressBarProps) {
  const progress = useReadingProgress()

  if (progress <= 0) return null

  return (
    <div
      className={`fixed top-0 left-0 right-0 z-50 h-1 bg-gray-200/50 dark:bg-gray-800/50 ${className}`}
      role="progressbar"
      aria-valuenow={progress}
      aria-valuemin={0}
      aria-valuemax={100}
      aria-label="Progresso de leitura"
    >
      <div
        className="h-full bg-blue-600 dark:bg-blue-500 transition-[width] duration-150 ease-out"
        style={{ width: `${progress}%` }}
      />
    </div>
  )
}
