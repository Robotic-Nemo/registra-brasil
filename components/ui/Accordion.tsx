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
            <h3 className="m-0">
              <button
                type="button"
                id={`accordion-trigger-${item.id}`}
                onClick={() => toggle(item.id)}
                aria-expanded={isOpen}
                aria-controls={`accordion-${item.id}`}
                className="flex w-full items-center justify-between py-3 px-1 text-left text-sm font-medium text-gray-900 hover:text-blue-700 transition-colors focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-1 focus-visible:ring-blue-500 rounded"
              >
                <span>{item.title}</span>
                <ChevronDown
                  aria-hidden="true"
                  className={`w-4 h-4 text-gray-400 transition-transform duration-200 ${isOpen ? 'rotate-180' : ''}`}
                />
              </button>
            </h3>
            <div
              id={`accordion-${item.id}`}
              role="region"
              aria-labelledby={`accordion-trigger-${item.id}`}
              hidden={!isOpen}
              className="pb-3 px-1 text-sm text-gray-600"
            >
              {item.content}
            </div>
          </div>
        )
      })}
    </div>
  )
}
