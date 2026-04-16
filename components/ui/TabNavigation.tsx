'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'

interface TabItem {
  href: string
  label: string
  /** Match this tab as active when pathname starts with href */
  matchPrefix?: boolean
}

interface Props {
  tabs: TabItem[]
  className?: string
}

/**
 * Tab-style navigation for sub-sections. Uses links (not JS tabs)
 * so each tab has its own URL and supports SSR.
 */
export function TabNavigation({ tabs, className = '' }: Props) {
  const pathname = usePathname()

  return (
    <nav className={`border-b border-gray-200 ${className}`} role="tablist" aria-label="Seções">
      <div className="flex gap-0 overflow-x-auto -mb-px">
        {tabs.map((tab) => {
          const isActive = tab.matchPrefix
            ? pathname.startsWith(tab.href)
            : pathname === tab.href
          return (
            <Link
              key={tab.href}
              href={tab.href}
              role="tab"
              aria-selected={isActive}
              className={`px-4 py-2.5 text-sm font-medium whitespace-nowrap border-b-2 transition-colors ${
                isActive
                  ? 'border-blue-600 text-blue-700'
                  : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
              }`}
            >
              {tab.label}
            </Link>
          )
        })}
      </div>
    </nav>
  )
}
