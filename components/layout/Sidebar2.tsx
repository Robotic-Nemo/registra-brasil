'use client'

import { useState, type ReactNode } from 'react'
import { ChevronDown, ChevronRight } from 'lucide-react'

interface SidebarSection {
  id: string
  title: string
  icon?: ReactNode
  content: ReactNode
  defaultOpen?: boolean
}

interface Props {
  sections: SidebarSection[]
  className?: string
}

/**
 * Responsive sidebar with collapsible sections.
 * Displays as a column on mobile, fixed sidebar on large screens.
 */
export function Sidebar2({ sections, className = '' }: Props) {
  const [openSections, setOpenSections] = useState<Set<string>>(() => {
    const initial = new Set<string>()
    sections.forEach((s) => {
      if (s.defaultOpen !== false) initial.add(s.id)
    })
    return initial
  })

  const toggle = (id: string) => {
    setOpenSections((prev) => {
      const next = new Set(prev)
      if (next.has(id)) next.delete(id)
      else next.add(id)
      return next
    })
  }

  return (
    <aside className={`w-full lg:w-72 xl:w-80 flex-shrink-0 ${className}`}>
      <div className="flex flex-col gap-2">
        {sections.map((section) => {
          const isOpen = openSections.has(section.id)
          return (
            <div key={section.id} className="border border-gray-200 rounded-lg overflow-hidden">
              <button
                onClick={() => toggle(section.id)}
                aria-expanded={isOpen}
                className="flex items-center gap-2 w-full px-4 py-3 text-left text-sm font-medium text-gray-900 hover:bg-gray-50 transition-colors"
              >
                {section.icon && (
                  <span className="text-gray-500 flex-shrink-0" aria-hidden="true">
                    {section.icon}
                  </span>
                )}
                <span className="flex-1">{section.title}</span>
                {isOpen ? (
                  <ChevronDown className="w-4 h-4 text-gray-400" aria-hidden="true" />
                ) : (
                  <ChevronRight className="w-4 h-4 text-gray-400" aria-hidden="true" />
                )}
              </button>
              {isOpen && (
                <div className="px-4 pb-3 pt-1 border-t border-gray-100">
                  {section.content}
                </div>
              )}
            </div>
          )
        })}
      </div>
    </aside>
  )
}
