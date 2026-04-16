'use client'

import { useState, useRef, useEffect } from 'react'

interface CollapsibleGroupItem {
  id: string
  title: string
  content: React.ReactNode
}

interface CollapsibleGroupProps {
  items: CollapsibleGroupItem[]
  allowMultiple?: boolean
  defaultOpen?: string[]
  className?: string
}

/**
 * Collapsible group — accordion-style component
 */
export function CollapsibleGroup({
  items,
  allowMultiple = false,
  defaultOpen = [],
  className = '',
}: CollapsibleGroupProps) {
  const [openIds, setOpenIds] = useState<Set<string>>(new Set(defaultOpen))

  const toggle = (id: string) => {
    setOpenIds(prev => {
      const next = new Set(prev)
      if (next.has(id)) {
        next.delete(id)
      } else {
        if (!allowMultiple) next.clear()
        next.add(id)
      }
      return next
    })
  }

  return (
    <div className={`divide-y divide-zinc-200 border border-zinc-200 rounded-lg ${className}`}>
      {items.map(item => (
        <CollapsibleItem
          key={item.id}
          item={item}
          isOpen={openIds.has(item.id)}
          onToggle={() => toggle(item.id)}
        />
      ))}
    </div>
  )
}

function CollapsibleItem({
  item,
  isOpen,
  onToggle,
}: {
  item: CollapsibleGroupItem
  isOpen: boolean
  onToggle: () => void
}) {
  const contentRef = useRef<HTMLDivElement>(null)
  const [height, setHeight] = useState(0)

  useEffect(() => {
    if (contentRef.current) {
      setHeight(contentRef.current.scrollHeight)
    }
  }, [isOpen, item.content])

  return (
    <div>
      <button
        onClick={onToggle}
        className="w-full flex items-center justify-between px-4 py-3 text-left text-sm font-medium text-zinc-800 hover:bg-zinc-50 transition-colors"
        aria-expanded={isOpen}
      >
        {item.title}
        <span className={`transition-transform duration-200 ${isOpen ? 'rotate-180' : ''}`}>
          ▾
        </span>
      </button>
      <div
        className="overflow-hidden transition-[max-height] duration-200"
        style={{ maxHeight: isOpen ? `${height}px` : '0px' }}
      >
        <div ref={contentRef} className="px-4 pb-3 text-sm text-zinc-600">
          {item.content}
        </div>
      </div>
    </div>
  )
}
