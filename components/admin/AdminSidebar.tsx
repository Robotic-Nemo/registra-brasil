'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import {
  LayoutDashboard,
  FileText,
  PlusCircle,
  Users,
  BarChart3,
  Settings,
} from 'lucide-react'

const NAV_ITEMS = [
  { href: '/admin', label: 'Painel', icon: LayoutDashboard },
  { href: '/admin/statements', label: 'Declaracoes', icon: FileText },
  { href: '/admin/adicionar', label: 'Adicionar', icon: PlusCircle },
  { href: '/admin/review', label: 'Revisao', icon: Users },
  { href: '/estatisticas', label: 'Estatisticas', icon: BarChart3 },
] as const

/**
 * Sidebar navigation for the admin section.
 * Highlights the active route and provides quick access to admin pages.
 */
export function AdminSidebar() {
  const pathname = usePathname()

  return (
    <aside className="w-56 shrink-0 border-r border-gray-200 bg-gray-50 min-h-screen py-6 px-3">
      <p className="text-xs font-semibold text-gray-400 uppercase tracking-wider px-3 mb-4">
        Admin
      </p>
      <nav className="space-y-1">
        {NAV_ITEMS.map((item) => {
          const isActive = pathname === item.href || (item.href !== '/admin' && pathname.startsWith(item.href))
          const Icon = item.icon
          return (
            <Link
              key={item.href}
              href={item.href}
              className={`flex items-center gap-3 px-3 py-2 text-sm rounded-lg transition-colors ${
                isActive
                  ? 'bg-blue-50 text-blue-700 font-medium'
                  : 'text-gray-600 hover:text-gray-900 hover:bg-gray-100'
              }`}
            >
              <Icon className="w-4 h-4 shrink-0" />
              {item.label}
            </Link>
          )
        })}
      </nav>
    </aside>
  )
}
