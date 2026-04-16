'use client'

import { useState, type ReactNode } from 'react'
import { ChevronRight } from 'lucide-react'

interface CollapsibleProps {
  title: ReactNode
  children: ReactNode
  defaultOpen?: boolean
  className?: string
}

export function Collapsible({ title, children, defaultOpen = false, className = '' }: CollapsibleProps) {
  const [open, setOpen] = useState(defaultOpen)

  return (
    <div className={className}>
      <button
        type="button"
        onClick={() => setOpen((v) => !v)}
        aria-expanded={open}
        className="flex items-center gap-2 w-full text-left py-2 text-sm font-medium text-gray-900 hover:text-blue-700 transition-colors"
      >
        <ChevronRight
          className={`w-4 h-4 text-gray-400 transition-transform duration-200 ${open ? 'rotate-90' : ''}`}
          aria-hidden="true"
        />
        {title}
      </button>
      {open && (
        <div className="pl-6 pb-2">{children}</div>
      )}
    </div>
  )
}
