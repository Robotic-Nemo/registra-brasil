'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { Home, Search, Users, BarChart3, Menu } from 'lucide-react'

const NAV_ITEMS = [
  { href: '/', label: 'Inicio', icon: Home },
  { href: '/buscar', label: 'Buscar', icon: Search },
  { href: '/politicos', label: 'Politicos', icon: Users },
  { href: '/estatisticas', label: 'Stats', icon: BarChart3 },
  { href: '/categorias', label: 'Mais', icon: Menu },
] as const

/**
 * Fixed bottom navigation bar for mobile devices.
 * Shows key links with icons. Hidden on md+ screens.
 */
export function MobileBottomNav() {
  const pathname = usePathname()

  return (
    <nav
      className="fixed bottom-0 left-0 right-0 z-50 bg-white border-t border-gray-200 md:hidden safe-area-bottom"
      role="navigation"
      aria-label="Navegacao principal mobile"
    >
      <div className="flex items-center justify-around h-14">
        {NAV_ITEMS.map(({ href, label, icon: Icon }) => {
          const isActive = href === '/'
            ? pathname === '/'
            : pathname === href || pathname.startsWith(href + '/')
          return (
            <Link
              key={href}
              href={href}
              aria-current={isActive ? 'page' : undefined}
              className={`flex flex-col items-center justify-center gap-0.5 flex-1 h-full transition-colors ${
                isActive ? 'text-blue-700' : 'text-gray-500 hover:text-gray-700'
              }`}
            >
              <Icon className="w-5 h-5" aria-hidden="true" />
              <span className="text-[10px] font-medium leading-none">{label}</span>
            </Link>
          )
        })}
      </div>
    </nav>
  )
}
