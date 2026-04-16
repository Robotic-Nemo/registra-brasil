'use client'

import { useCallback, useRef, useEffect } from 'react'

/**
 * Hook that announces messages to screen readers via a dynamically
 * managed ARIA live region. Does not require the LiveRegionProvider.
 *
 * Creates its own live region element in the DOM and cleans up on unmount.
 */
export function useAnnounce() {
  const regionRef = useRef<HTMLDivElement | null>(null)

  const getRegion = useCallback(() => {
    if (regionRef.current) return regionRef.current
    if (typeof document === 'undefined') return null

    const el = document.createElement('div')
    el.setAttribute('role', 'status')
    el.setAttribute('aria-live', 'polite')
    el.setAttribute('aria-atomic', 'true')
    el.className = 'sr-only'
    el.style.cssText =
      'position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);white-space:nowrap;border:0'
    document.body.appendChild(el)
    regionRef.current = el
    return el
  }, [])

  // Clean up DOM element on unmount
  useEffect(() => {
    return () => {
      if (regionRef.current) {
        regionRef.current.remove()
        regionRef.current = null
      }
    }
  }, [])

  const announce = useCallback(
    (message: string) => {
      const region = getRegion()
      if (!region) return
      // Clear then set to trigger screen reader re-announcement
      region.textContent = ''
      requestAnimationFrame(() => {
        region.textContent = message
      })
    },
    [getRegion]
  )

  return announce
}
