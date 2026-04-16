'use client'

import { useEffect, useRef } from 'react'

/**
 * Hook to add event listeners with cleanup
 */
export function useEventListener<K extends keyof WindowEventMap>(
  eventName: K,
  handler: (event: WindowEventMap[K]) => void,
  element?: HTMLElement | null,
  options?: boolean | AddEventListenerOptions
): void {
  const handlerRef = useRef(handler)
  handlerRef.current = handler

  useEffect(() => {
    const target = element ?? window

    const listener = (event: Event) => {
      handlerRef.current(event as WindowEventMap[K])
    }

    target.addEventListener(eventName, listener, options)
    return () => target.removeEventListener(eventName, listener, options)
  }, [eventName, element, options])
}
