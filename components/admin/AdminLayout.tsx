'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import {
  LayoutDashboard, FileText, Users, Settings, Plus, CheckCircle, BarChart3,
} from 'lucide-react'

const SIDEBAR_ITEMS = [
  { href: '/admin', label: 'Painel', icon: LayoutDashboard, exact: true },
  { href: '/admin/review', label: 'Revisao', icon: CheckCircle },
  { href: '/admin/adicionar', label: 'Adicionar', icon: Plus },
  { href: '/admin/statements', label: 'Declaracoes', icon: FileText },
  { href: '/admin/politicos', label: 'Politicos', icon: Users },
  { href: '/admin/audit', label: 'Auditoria', icon: BarChart3 },
  { href: '/admin/settings', label: 'Configuracoes', icon: Settings },
]

interface AdminLayoutProps {
  children: React.ReactNode
  title?: string
}

export function AdminLayout({ children, title }: AdminLayoutProps) {
  const pathname = usePathname()

  return (
    <div className="min-h-screen flex bg-gray-50">
      {/* Sidebar */}
      <aside className="hidden md:flex w-56 flex-col border-r border-gray-200 bg-white">
        <div className="px-4 py-5 border-b border-gray-100">
          <Link href="/admin" className="text-lg font-bold text-gray-900">
            Registra Brasil
          </Link>
          <p className="text-xs text-gray-400 mt-0.5">Painel de edicao</p>
        </div>

        <nav className="flex-1 px-2 py-4 space-y-1">
          {SIDEBAR_ITEMS.map((item) => {
            const Icon = item.icon
            const isActive = item.exact
              ? pathname === item.href
              : pathname.startsWith(item.href)

            return (
              <Link
                key={item.href}
                href={item.href}
                className={`flex items-center gap-2.5 px-3 py-2 rounded-lg text-sm font-medium transition-colors ${
                  isActive
                    ? 'bg-blue-50 text-blue-700'
                    : 'text-gray-600 hover:bg-gray-100 hover:text-gray-900'
                }`}
              >
                <Icon className="w-4 h-4 flex-shrink-0" />
                {item.label}
              </Link>
            )
          })}
        </nav>
      </aside>

      {/* Main content */}
      <div className="flex-1 flex flex-col min-w-0">
        {title && (
          <header className="border-b border-gray-200 bg-white px-6 py-4">
            <h1 className="text-xl font-bold text-gray-900">{title}</h1>
          </header>
        )}
        <main className="flex-1 p-6">{children}</main>
      </div>
    </div>
  )
}
