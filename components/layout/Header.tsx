'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { Suspense, useEffect, useRef, useState } from 'react'
import { SearchBar } from '@/components/search/SearchBar'
import { Archive, Menu, X } from 'lucide-react'

const NAV_LINKS = [
  { href: '/buscar', label: 'Buscar' },
  { href: '/politicos', label: 'Politicos' },
  { href: '/categorias', label: 'Categorias' },
  { href: '/comparar', label: 'Comparar' },
  { href: '/estatisticas', label: 'Estatisticas' },
  { href: '/sobre', label: 'Sobre' },
]

export function Header() {
  const pathname = usePathname()
  const [menuOpen, setMenuOpen] = useState(false)
  const hamburgerRef = useRef<HTMLButtonElement>(null)
  const firstLinkRef = useRef<HTMLAnchorElement>(null)

  // Find current active page label for mobile indicator
  const activePage = NAV_LINKS.find(
    (link) => pathname === link.href || pathname.startsWith(link.href + '/')
  )

  // ESC key closes the menu
  useEffect(() => {
    const handleEsc = (e: KeyboardEvent) => {
      if (e.key === 'Escape' && menuOpen) setMenuOpen(false)
    }
    document.addEventListener('keydown', handleEsc)
    return () => document.removeEventListener('keydown', handleEsc)
  }, [menuOpen])

  // Focus management: focus first link when menu opens; return focus to hamburger when it closes
  const hasOpenedRef = useRef(false)
  useEffect(() => {
    if (menuOpen) {
      hasOpenedRef.current = true
      firstLinkRef.current?.focus()
    } else if (hasOpenedRef.current) {
      hamburgerRef.current?.focus()
    }
  }, [menuOpen])

  return (
    <header role="banner" className="sticky top-0 z-40 bg-white/95 backdrop-blur border-b border-gray-200">
      <div className="max-w-7xl mx-auto px-4 h-14 flex items-center gap-4">
        <Link href="/" className="flex items-center gap-2 flex-shrink-0" data-testid="logo-link">
          <Archive className="w-5 h-5 text-blue-700" />
          <span className="font-bold text-gray-900 hidden sm:block">Registra Brasil</span>
        </Link>
        {/* Mobile active page indicator */}
        {activePage && (
          <span className="md:hidden text-xs font-medium text-blue-700 bg-blue-50 px-2 py-0.5 rounded-full">
            {activePage.label}
          </span>
        )}

        <div className="flex-1 max-w-lg">
          <Suspense fallback={<div className="h-10 bg-gray-100 rounded-lg animate-pulse" />}>
            <SearchBar placeholder="Buscar declarações de políticos..." />
          </Suspense>
        </div>

        {/* Desktop nav */}
        <nav className="hidden md:flex items-center gap-4 text-sm" data-testid="desktop-nav">
          {NAV_LINKS.map((link) => {
            const isActive = pathname === link.href || pathname.startsWith(link.href + '/')
            return (
              <Link
                key={link.href}
                href={link.href}
                aria-current={isActive ? 'page' : undefined}
                className={`transition-colors ${isActive ? 'text-blue-700 font-medium' : 'text-gray-600 hover:text-gray-900'}`}
              >
                {link.label}
              </Link>
            )
          })}
        </nav>

        {/* Mobile menu button */}
        <button
          ref={hamburgerRef}
          className="md:hidden text-gray-600 hover:text-gray-900 p-1"
          onClick={() => setMenuOpen(!menuOpen)}
          aria-label={menuOpen ? 'Fechar menu' : 'Abrir menu'}
          aria-expanded={menuOpen}
          aria-controls="mobile-nav"
          data-testid="mobile-menu-toggle"
        >
          {menuOpen ? <X className="w-5 h-5" /> : <Menu className="w-5 h-5" />}
        </button>
      </div>

      {/* Mobile nav */}
      {menuOpen && (
        <nav
          id="mobile-nav"
          aria-label="Menu de navegação"
          data-testid="mobile-nav"
          className="md:hidden border-t border-gray-100 bg-white px-4 py-3 flex flex-col gap-2"
        >
          {NAV_LINKS.map((link, i) => {
            const isActive = pathname === link.href || pathname.startsWith(link.href + '/')
            return (
              <Link
                key={link.href}
                href={link.href}
                ref={i === 0 ? firstLinkRef : undefined}
                onClick={() => setMenuOpen(false)}
                aria-current={isActive ? 'page' : undefined}
                className={`py-2 text-sm ${isActive ? 'text-blue-700 font-medium' : 'text-gray-600'}`}
              >
                {link.label}
              </Link>
            )
          })}
        </nav>
      )}
    </header>
  )
}
