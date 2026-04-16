'use client'

import { useState, type ReactNode } from 'react'
import { ChevronDown } from 'lucide-react'

interface AccordionItem {
  id: string
  title: string
  content: ReactNode
}

interface Props {
  items: AccordionItem[]
  allowMultiple?: boolean
  className?: string
}

export function Accordion({ items, allowMultiple = false, className = '' }: Props) {
  const [open, setOpen] = useState<Set<string>>(new Set())

  function toggle(id: string) {
    setOpen((prev) => {
      const next = new Set(allowMultiple ? prev : [])
      if (prev.has(id)) {
        next.delete(id)
      } else {
        next.add(id)
      }
      return next
    })
  }

  return (
    <div className={`divide-y divide-gray-200 border-y border-gray-200 ${className}`}>
      {items.map((item) => {
        const isOpen = open.has(item.id)
        return (
          <div key={item.id}>
            <button
              onClick={() => toggle(item.id)}
              aria-expanded={isOpen}
              aria-controls={`accordion-${item.id}`}
              className="flex w-full items-center justify-between py-3 px-1 text-left text-sm font-medium text-gray-900 hover:text-blue-700 transition-colors"
            >
              {item.title}
              <ChevronDown
                className={`w-4 h-4 text-gray-400 transition-transform duration-200 ${isOpen ? 'rotate-180' : ''}`}
              />
            </button>
            {isOpen && (
              <div id={`accordion-${item.id}`} className="pb-3 px-1 text-sm text-gray-600">
                {item.content}
              </div>
            )}
          </div>
        )
      })}
    </div>
  )
}
