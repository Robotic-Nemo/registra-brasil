'use client'

import { useTextSize } from '@/lib/hooks/useTextSize'

interface TextSizeControlProps {
  className?: string
}

export function TextSizeControl({ className = '' }: TextSizeControlProps) {
  const { size, decrease, reset, increase } = useTextSize()

  return (
    <div
      className={`inline-flex items-center gap-0.5 rounded-lg border border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-800 ${className}`}
      role="group"
      aria-label="Ajustar tamanho do texto"
    >
      <button
        onClick={decrease}
        disabled={size === 'small'}
        className="px-2.5 py-1.5 text-sm font-medium text-gray-600 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700 disabled:opacity-40 disabled:cursor-not-allowed rounded-l-lg transition-colors"
        aria-label="Diminuir tamanho do texto"
      >
        A-
      </button>
      <button
        onClick={reset}
        className="px-2.5 py-1.5 text-sm font-medium text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 border-x border-gray-200 dark:border-gray-700 transition-colors"
        aria-label="Tamanho padrao do texto"
      >
        A
      </button>
      <button
        onClick={increase}
        disabled={size === 'xlarge'}
        className="px-2.5 py-1.5 text-base font-medium text-gray-600 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700 disabled:opacity-40 disabled:cursor-not-allowed rounded-r-lg transition-colors"
        aria-label="Aumentar tamanho do texto"
      >
        A+
      </button>
    </div>
  )
}
