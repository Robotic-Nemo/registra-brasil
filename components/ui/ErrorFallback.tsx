'use client'

import { AlertTriangle, RefreshCw } from 'lucide-react'

interface ErrorFallbackProps {
  /** Error object or message */
  error?: Error | string
  /** Callback to retry the failed action */
  onRetry?: () => void
  /** Title displayed above the error message */
  title?: string
  /** Whether to show the full error message (useful in dev) */
  showDetails?: boolean
}

/**
 * Reusable error fallback component with retry button.
 * Can be used standalone or with React Error Boundaries.
 */
export function ErrorFallback({
  error,
  onRetry,
  title = 'Algo deu errado',
  showDetails = process.env.NODE_ENV === 'development',
}: ErrorFallbackProps) {
  const message = error instanceof Error ? error.message : error

  return (
    <div
      role="alert"
      className="flex flex-col items-center justify-center text-center py-12 px-4"
    >
      <div className="w-12 h-12 rounded-full bg-red-50 flex items-center justify-center mb-4">
        <AlertTriangle className="w-6 h-6 text-red-500" />
      </div>

      <h2 className="text-lg font-semibold text-gray-900 mb-1">{title}</h2>

      <p className="text-sm text-gray-500 max-w-md mb-4">
        Ocorreu um erro inesperado. Tente novamente ou volte mais tarde.
      </p>

      {showDetails && message && (
        <pre className="text-xs text-red-600 bg-red-50 border border-red-200 rounded-lg px-4 py-2 max-w-md overflow-auto mb-4">
          {message}
        </pre>
      )}

      {onRetry && (
        <button
          type="button"
          onClick={onRetry}
          className="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 transition-colors"
        >
          <RefreshCw className="w-4 h-4" />
          Tentar novamente
        </button>
      )}
    </div>
  )
}
