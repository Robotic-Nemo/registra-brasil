'use client'

import { useState, useCallback } from 'react'

/**
 * Manages tab/panel navigation state.
 * Returns the active tab index and navigation functions.
 */
export function useTabNavigation(tabCount: number, defaultTab = 0) {
  const [activeTab, setActiveTab] = useState(defaultTab)

  const goToTab = useCallback(
    (index: number) => {
      if (index >= 0 && index < tabCount) setActiveTab(index)
    },
    [tabCount]
  )

  const nextTab = useCallback(() => {
    setActiveTab((prev) => (prev + 1) % tabCount)
  }, [tabCount])

  const prevTab = useCallback(() => {
    setActiveTab((prev) => (prev - 1 + tabCount) % tabCount)
  }, [tabCount])

  const handleKeyDown = useCallback(
    (e: React.KeyboardEvent) => {
      switch (e.key) {
        case 'ArrowRight':
        case 'ArrowDown':
          e.preventDefault()
          nextTab()
          break
        case 'ArrowLeft':
        case 'ArrowUp':
          e.preventDefault()
          prevTab()
          break
        case 'Home':
          e.preventDefault()
          goToTab(0)
          break
        case 'End':
          e.preventDefault()
          goToTab(tabCount - 1)
          break
      }
    },
    [nextTab, prevTab, goToTab, tabCount]
  )

  return { activeTab, goToTab, nextTab, prevTab, handleKeyDown }
}
