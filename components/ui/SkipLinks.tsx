'use client'

const links = [
  { href: '#main-content', label: 'Pular para o conteúdo principal' },
  { href: '#search-input', label: 'Pular para a busca' },
] as const

/**
 * Skip navigation links for keyboard/screen-reader users.
 * Visually hidden until focused.
 */
export function SkipLinks() {
  return (
    <nav aria-label="Atalhos de navegação" className="relative z-[60]">
      {links.map(({ href, label }) => (
        <a
          key={href}
          href={href}
          className="sr-only focus:not-sr-only focus:fixed focus:top-2 focus:left-2 focus:z-[60] focus:bg-blue-700 focus:text-white focus:px-4 focus:py-2 focus:rounded-lg focus:text-sm focus:font-medium focus:shadow-lg focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-offset-2"
        >
          {label}
        </a>
      ))}
    </nav>
  )
}
