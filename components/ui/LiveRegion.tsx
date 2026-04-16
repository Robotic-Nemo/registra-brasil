'use client'

import { useEffect, useState, createContext, useContext, useCallback, type ReactNode } from 'react'

interface LiveRegionContextValue {
  announce: (message: string, priority?: 'polite' | 'assertive') => void
}

const LiveRegionContext = createContext<LiveRegionContextValue>({
  announce: () => {},
})

export function useLiveRegion() {
  return useContext(LiveRegionContext)
}

interface Props {
  children: ReactNode
}

/**
 * Provider component that renders ARIA live regions and exposes
 * an `announce` function via context.
 */
export function LiveRegionProvider({ children }: Props) {
  const [politeMessage, setPoliteMessage] = useState('')
  const [assertiveMessage, setAssertiveMessage] = useState('')

  const announce = useCallback((message: string, priority: 'polite' | 'assertive' = 'polite') => {
    if (priority === 'assertive') {
      setAssertiveMessage('')
      // Force re-render so screen readers pick up the change
      requestAnimationFrame(() => setAssertiveMessage(message))
    } else {
      setPoliteMessage('')
      requestAnimationFrame(() => setPoliteMessage(message))
    }
  }, [])

  // Clear messages after a delay so they don't accumulate
  useEffect(() => {
    if (!politeMessage) return
    const timer = setTimeout(() => setPoliteMessage(''), 5000)
    return () => clearTimeout(timer)
  }, [politeMessage])

  useEffect(() => {
    if (!assertiveMessage) return
    const timer = setTimeout(() => setAssertiveMessage(''), 5000)
    return () => clearTimeout(timer)
  }, [assertiveMessage])

  return (
    <LiveRegionContext.Provider value={{ announce }}>
      {children}
      <div
        role="status"
        aria-live="polite"
        aria-atomic="true"
        className="sr-only"
      >
        {politeMessage}
      </div>
      <div
        role="alert"
        aria-live="assertive"
        aria-atomic="true"
        className="sr-only"
      >
        {assertiveMessage}
      </div>
    </LiveRegionContext.Provider>
  )
}
