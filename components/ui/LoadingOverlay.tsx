import type { ReactNode } from 'react'

interface Props {
  /** Whether the overlay is visible */
  loading: boolean
  /** Text to show under the spinner */
  message?: string
  /** Content to overlay on top of (if not provided, renders full-page) */
  children?: ReactNode
  className?: string
}

/**
 * Full-page or element overlay with loading spinner.
 */
export function LoadingOverlay({
  loading,
  message = 'Carregando...',
  children,
  className = '',
}: Props) {
  if (!children) {
    // Full-page overlay
    if (!loading) return null
    return (
      <div
        className="fixed inset-0 z-[90] bg-white/80 backdrop-blur-sm flex items-center justify-center"
        role="status"
        aria-live="polite"
      >
        <div className="flex flex-col items-center gap-3">
          <div className="w-8 h-8 border-3 border-gray-300 border-t-blue-600 rounded-full animate-spin" />
          {message && <p className="text-sm text-gray-600">{message}</p>}
        </div>
      </div>
    )
  }

  return (
    <div className={`relative ${className}`}>
      {children}
      {loading && (
        <div
          className="absolute inset-0 bg-white/80 backdrop-blur-sm flex items-center justify-center rounded-lg z-10"
          role="status"
          aria-live="polite"
        >
          <div className="flex flex-col items-center gap-3">
            <div className="w-6 h-6 border-2 border-gray-300 border-t-blue-600 rounded-full animate-spin" />
            {message && <p className="text-xs text-gray-600">{message}</p>}
          </div>
        </div>
      )}
    </div>
  )
}
