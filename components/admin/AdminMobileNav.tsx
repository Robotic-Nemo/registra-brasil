'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { useEffect, useState } from 'react'
import { Menu, X, Shield } from 'lucide-react'
import { ADMIN_NAV, type BadgeKey } from './nav-data'

type BadgeCounts = Partial<Record<BadgeKey, number>>

export function AdminMobileNav() {
  const pathname = usePathname()
  const [open, setOpen] = useState(false)
  const [counts, setCounts] = useState<BadgeCounts>({})

  useEffect(() => { setOpen(false) }, [pathname])

  useEffect(() => {
    if (!open) return
    const handler = (e: KeyboardEvent) => { if (e.key === 'Escape') setOpen(false) }
    document.addEventListener('keydown', handler)
    return () => document.removeEventListener('keydown', handler)
  }, [open])

  useEffect(() => {
    fetch('/api/admin/sidebar-counts', { cache: 'no-store' })
      .then((r) => r.ok ? r.json() : null)
      .then((j) => { if (j && typeof j === 'object') setCounts(j) })
      .catch(() => {})
  }, [pathname])

  const activeLabel = ADMIN_NAV
    .flatMap((s) => s.items)
    .find((i) => pathname === i.href || (i.href !== '/admin' && pathname.startsWith(i.href)))?.label

  return (
    <>
      <div className="lg:hidden sticky top-14 z-30 bg-white border-b border-gray-200 px-3 py-2 flex items-center gap-2 text-sm">
        <button
          type="button"
          onClick={() => setOpen(true)}
          className="inline-flex items-center gap-1.5 px-2 py-1 border border-gray-300 rounded text-gray-700 hover:bg-gray-50 focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
          aria-label="Abrir menu do admin"
        >
          <Menu className="w-4 h-4" aria-hidden="true" />
          Admin
        </button>
        <span className="text-xs text-gray-500 truncate">{activeLabel ?? ''}</span>
      </div>

      {open && (
        <div className="lg:hidden fixed inset-0 z-50 flex" role="dialog" aria-modal="true" aria-label="Navegação admin">
          <button
            type="button"
            className="absolute inset-0 bg-black/40"
            onClick={() => setOpen(false)}
            aria-label="Fechar menu"
          />
          <aside className="relative ml-auto w-72 bg-white h-full overflow-y-auto shadow-2xl">
            <div className="flex items-center justify-between px-3 py-2 border-b border-gray-200">
              <div className="flex items-center gap-2 text-xs font-semibold uppercase tracking-wider text-gray-500">
                <Shield className="w-3.5 h-3.5" aria-hidden="true" />
                Admin
              </div>
              <button
                type="button"
                onClick={() => setOpen(false)}
                className="p-1.5 rounded hover:bg-gray-100 focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
                aria-label="Fechar"
              >
                <X className="w-4 h-4" aria-hidden="true" />
              </button>
            </div>
            <nav className="p-3 text-sm flex flex-col gap-4">
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
                            className={`flex items-center gap-2 px-2 py-2 rounded text-sm ${
                              active ? 'bg-blue-50 text-blue-800 font-medium' : 'text-gray-700 hover:bg-gray-50'
                            }`}
                          >
                            <item.Icon className="w-4 h-4 flex-shrink-0" aria-hidden="true" />
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
        </div>
      )}
    </>
  )
}
