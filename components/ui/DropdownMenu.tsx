'use client'

import { useState, useRef, useCallback, type ReactNode } from 'react'
import { useOnClickOutside } from '@/lib/hooks/useOnClickOutside'
import { MoreVertical } from 'lucide-react'

interface MenuItem {
  label: string
  onClick: () => void
  icon?: ReactNode
  danger?: boolean
}

interface Props {
  items: MenuItem[]
  trigger?: ReactNode
  align?: 'left' | 'right'
  className?: string
}

export function DropdownMenu({ items, trigger, align = 'right', className = '' }: Props) {
  const [open, setOpen] = useState(false)
  const ref = useRef<HTMLDivElement>(null)

  useOnClickOutside(ref, useCallback(() => setOpen(false), []))

  return (
    <div className={`relative ${className}`} ref={ref}>
      <button
        onClick={() => setOpen(!open)}
        aria-haspopup="true"
        aria-expanded={open}
        className="p-1 rounded hover:bg-gray-100 text-gray-500 hover:text-gray-700 transition-colors"
      >
        {trigger ?? <MoreVertical className="w-4 h-4" />}
      </button>

      {open && (
        <div
          role="menu"
          className={`absolute top-full mt-1 ${align === 'right' ? 'right-0' : 'left-0'} bg-white border border-gray-200 rounded-lg shadow-lg py-1 min-w-[160px] z-50`}
        >
          {items.map((item, i) => (
            <button
              key={i}
              role="menuitem"
              onClick={() => { item.onClick(); setOpen(false) }}
              className={`flex items-center gap-2 w-full px-3 py-2 text-sm text-left transition-colors ${
                item.danger
                  ? 'text-red-600 hover:bg-red-50'
                  : 'text-gray-700 hover:bg-gray-50'
              }`}
            >
              {item.icon}
              {item.label}
            </button>
          ))}
        </div>
      )}
    </div>
  )
}
