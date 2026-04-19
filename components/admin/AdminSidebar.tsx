'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { useEffect, useState } from 'react'
import { Shield } from 'lucide-react'
import { ADMIN_NAV, type BadgeKey } from './nav-data'

type BadgeCounts = Partial<Record<BadgeKey, number>>

export function AdminSidebar() {
  const pathname = usePathname()
  const [counts, setCounts] = useState<BadgeCounts>({})

  useEffect(() => {
    fetch('/api/admin/sidebar-counts', { cache: 'no-store' })
      .then((r) => r.ok ? r.json() : null)
      .then((j) => { if (j && typeof j === 'object') setCounts(j) })
      .catch(() => {})
  }, [pathname])

  return (
    <aside
      className="hidden lg:block lg:w-60 flex-shrink-0 border-r border-gray-200 bg-white min-h-[calc(100vh-3.5rem)] sticky top-14 self-start overflow-y-auto"
      aria-label="Navegação administrativa"
    >
      <nav className="p-3 text-sm flex flex-col gap-4">
        <div className="flex items-center gap-2 px-2 py-1 text-xs font-semibold uppercase tracking-wider text-gray-500">
          <Shield className="w-3.5 h-3.5" aria-hidden="true" />
          Admin
        </div>
        {ADMIN_NAV.map((section) => (
          <div key={section.title}>
            <p className="text-[10px] font-semibold uppercase tracking-wider text-gray-400 mb-1 px-2">
              {section.title}
            </p>
            <ul className="flex flex-col gap-0.5">
              {section.items.map((item) => {
                const active = pathname === item.href || (item.href !== '/admin' && pathname.startsWith(item.href))
                const badge = item.badgeKey ? counts[item.badgeKey] : undefined
                return (
                  <li key={item.href}>
                    <Link
                      href={item.href}
                      className={`flex items-center gap-2 px-2 py-1.5 rounded text-xs transition-colors ${
                        active ? 'bg-blue-50 text-blue-800 font-medium' : 'text-gray-700 hover:bg-gray-50'
                      }`}
                    >
                      <item.Icon className="w-3.5 h-3.5 flex-shrink-0" aria-hidden="true" />
                      <span className="flex-1 truncate">{item.label}</span>
                      {typeof badge === 'number' && badge > 0 && (
                        <span className="ml-auto text-[10px] tabular-nums px-1.5 py-0.5 rounded-full bg-red-500 text-white font-semibold">
                          {badge}
                        </span>
                      )}
                    </Link>
                  </li>
                )
              })}
            </ul>
          </div>
        ))}
      </nav>
    </aside>
  )
}
