'use client'

import { useRef, type ReactNode } from 'react'
import { useFocusTrap } from '@/lib/hooks/useFocusTrap'

interface FocusLockProps {
  children: ReactNode
  active?: boolean
  className?: string
}

/**
 * Focus lock wrapper that traps focus within its children.
 * Useful for modals, dialogs, and drawers.
 */
export function FocusLock({ children, active = true, className = '' }: FocusLockProps) {
  const ref = useRef<HTMLDivElement>(null)
  useFocusTrap(ref, active)

  return (
    <div ref={ref} className={className}>
      {children}
    </div>
  )
}
